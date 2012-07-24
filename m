Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1StihO-0003Ly-B6
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 19:15:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6OH3b78008653
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 10:03:37 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 24 Jul 2012 10:03:36 -0700
Message-ID: <500ED55C.2060209@windriver.com>
Date: Tue, 24 Jul 2012 13:03:24 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343137799-12032-1-git-send-email-yao.zhao@windriver.com>
	<1343144355.5878.18.camel@phil-desktop>
	<500EC30C.30503@windriver.com>
	<1343144856.5878.19.camel@phil-desktop>
	<500ECFBA.6000802@windriver.com> <500ED2D5.7030101@windriver.com>
In-Reply-To: <500ED2D5.7030101@windriver.com>
X-Originating-IP: [128.224.147.210]
Subject: Re: [PATCH] bzip2-native: fix problems when bzip2-native is installed in parallel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jul 2012 17:15:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-24 12:52 PM, Mark Hatle wrote:
> On 7/24/12 11:39 AM, Yao Zhao wrote:
>> On 12-07-24 11:47 AM, Phil Blundell wrote:
>>> On Tue, 2012-07-24 at 11:45 -0400, Yao Zhao wrote:
>>>> In the Makefile, libbz2.so.0 is installed before bzip2, but the
>>>> installation is "make -j xxx install". Then this could happen.
>>> Well, yes, but you could fix that by adding an appropriate dependency.
>>> Right?
>> I relooked at the Makefile again:
>> install-binPROGRAMS: $(bin_PROGRAMS)
>>           @$(NORMAL_INSTALL)
>>           @list='$(bin_PROGRAMS)'; test -n "$(bindir)" || list=; \
>>           if test -n "$$list"; then \
>>             echo " $(MKDIR_P) '$(DESTDIR)$(bindir)'"; \
>>             $(MKDIR_P) "$(DESTDIR)$(bindir)" || exit 1; \
>>           fi; \
>>           for p in $$list; do echo "$$p $$p"; done | \
>>           sed 's/$(EXEEXT)$$//' | \
>>           while read p p1; do if test -f $$p || test -f $$p1; \
>>             then echo "$$p"; echo "$$p"; else :; fi; \
>>           done | \
>>           sed -e 'p;s,.*/,,;n;h' -e 's|.*|.|' \
>>               -e
>> 'p;x;s,.*/,,;s/$(EXEEXT)$$//;$(transform);s/$$/$(EXEEXT)/' | \
>>           sed 'N;N;N;s,\n, ,g' | \
>>           $(AWK) 'BEGIN { files["."] = ""; dirs["."] = 1 } \
>>             { d=$$3; if (dirs[d] != 1) { print "d", d; dirs[d] = 1 } \
>>               if ($$2 == $$4) files[d] = files[d] " " $$1; \
>>               else { print "f", $$3 "/" $$4, $$1; } } \
>>             END { for (d in files) print "f", d, files[d] }' | \
>>           while read type dir files; do \
>>               if test "$$dir" = .; then dir=; else dir=/$$dir; fi; \
>>               test -z "$$files" || { \
>> .....
>>
>> install-binPROGRAMS: install-libLTLIBRARIES
>>
>> install-exec-am: install-binPROGRAMS install-binSCRIPTS \
>>           install-libLTLIBRARIES
>>           @$(NORMAL_INSTALL)
>>           $(MAKE) $(AM_MAKEFLAGS) install-exec-hook
>>
>> My first thought is that install-libLTLIBRARIES is a dependency of
>> install-binPROGRAMS, but there are 2 install-binPROGRAMS targets, how it
>> works?
>
> In the second one, as long as there are no white space below the line, 
> it's just a \n.  Then it adds the item to the dependency list..  So 
> effectively
>
> install-binPROGRAMS: $(bin_PROGRAMS) install-libLTLIBRARIES
>
> (if there is a tab or other white space it should generate a warning 
> or error about multiple definitions of install-binPROGRAMS, and in 
> that case, the last definition wins.)
>
Thanks Mark!
So I didn't understand wrongly about the dependency, 
install-libLTLIBRARIES is install-binPROGRAMS's dependency.
according to make document, -j jobs specifies the number of 
jobs(commands) to run simultaneously. My understanding is the commands 
for each target is the jobs or command the doc talks about, am I right?
In this case, will "make -j xx" even didn't care the dependency? or make 
did care but they are paralleled to executed.

thanks,
yao
> --Mark
>
>> thanks,
>> yao
>>> p.
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




