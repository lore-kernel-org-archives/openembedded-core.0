Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1StiWl-0006Fc-Ju
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 19:04:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6OGqcnT008466
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 09:52:38 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.34.30) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 24 Jul 2012 09:52:38 -0700
Message-ID: <500ED2D5.7030101@windriver.com>
Date: Tue, 24 Jul 2012 11:52:37 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1343137799-12032-1-git-send-email-yao.zhao@windriver.com>
	<1343144355.5878.18.camel@phil-desktop>
	<500EC30C.30503@windriver.com>
	<1343144856.5878.19.camel@phil-desktop>
	<500ECFBA.6000802@windriver.com>
In-Reply-To: <500ECFBA.6000802@windriver.com>
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
X-List-Received-Date: Tue, 24 Jul 2012 17:04:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/12 11:39 AM, Yao Zhao wrote:
> On 12-07-24 11:47 AM, Phil Blundell wrote:
>> On Tue, 2012-07-24 at 11:45 -0400, Yao Zhao wrote:
>>> In the Makefile, libbz2.so.0 is installed before bzip2, but the
>>> installation is "make -j xxx install". Then this could happen.
>> Well, yes, but you could fix that by adding an appropriate dependency.
>> Right?
> I relooked at the Makefile again:
> install-binPROGRAMS: $(bin_PROGRAMS)
>           @$(NORMAL_INSTALL)
>           @list='$(bin_PROGRAMS)'; test -n "$(bindir)" || list=; \
>           if test -n "$$list"; then \
>             echo " $(MKDIR_P) '$(DESTDIR)$(bindir)'"; \
>             $(MKDIR_P) "$(DESTDIR)$(bindir)" || exit 1; \
>           fi; \
>           for p in $$list; do echo "$$p $$p"; done | \
>           sed 's/$(EXEEXT)$$//' | \
>           while read p p1; do if test -f $$p || test -f $$p1; \
>             then echo "$$p"; echo "$$p"; else :; fi; \
>           done | \
>           sed -e 'p;s,.*/,,;n;h' -e 's|.*|.|' \
>               -e
> 'p;x;s,.*/,,;s/$(EXEEXT)$$//;$(transform);s/$$/$(EXEEXT)/' | \
>           sed 'N;N;N;s,\n, ,g' | \
>           $(AWK) 'BEGIN { files["."] = ""; dirs["."] = 1 } \
>             { d=$$3; if (dirs[d] != 1) { print "d", d; dirs[d] = 1 } \
>               if ($$2 == $$4) files[d] = files[d] " " $$1; \
>               else { print "f", $$3 "/" $$4, $$1; } } \
>             END { for (d in files) print "f", d, files[d] }' | \
>           while read type dir files; do \
>               if test "$$dir" = .; then dir=; else dir=/$$dir; fi; \
>               test -z "$$files" || { \
> .....
>
> install-binPROGRAMS: install-libLTLIBRARIES
>
> install-exec-am: install-binPROGRAMS install-binSCRIPTS \
>           install-libLTLIBRARIES
>           @$(NORMAL_INSTALL)
>           $(MAKE) $(AM_MAKEFLAGS) install-exec-hook
>
> My first thought is that install-libLTLIBRARIES is a dependency of
> install-binPROGRAMS, but there are 2 install-binPROGRAMS targets, how it
> works?

In the second one, as long as there are no white space below the line, it's just 
a \n.  Then it adds the item to the dependency list..  So effectively

install-binPROGRAMS: $(bin_PROGRAMS) install-libLTLIBRARIES

(if there is a tab or other white space it should generate a warning or error 
about multiple definitions of install-binPROGRAMS, and in that case, the last 
definition wins.)

--Mark

> thanks,
> yao
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



