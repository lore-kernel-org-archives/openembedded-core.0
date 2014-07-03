Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 71DC165CEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 11:00:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s63B0Tmv029520
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Jul 2014 04:00:29 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 3 Jul 2014 04:00:29 -0700
Message-ID: <53B537CA.9050800@windriver.com>
Date: Thu, 3 Jul 2014 19:00:26 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1404379801-16174-1-git-send-email-ming.liu@windriver.com>
	<1404379801-16174-2-git-send-email-ming.liu@windriver.com>
	<1404381016.6362.78.camel@ted>
In-Reply-To: <1404381016.6362.78.camel@ted>
X-Originating-IP: [128.224.163.186]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] groff: fix bindir transaction error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jul 2014 11:00:38 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2014 05:50 PM, Richard Purdie wrote:
> On Thu, 2014-07-03 at 17:30 +0800, Ming Liu wrote:
>> bindir is transfered to Makefile as ${D}${bindir}, hence it should not
>> use DESTDIR as the prefix directory any more during the install.
> This feels wrong, we really want to have DESTDIR support in the
> Makefile. Can we stop passing ${D} as part of bindir instead?
I think that is because there are many other Makefiles where only bindir 
is used to indicate the binary directory without DESTDIR, dozen of them 
except only one in this case, to name but a few:
......
groff-1.18.1.4/contrib/eqn2graph/Makefile.sub:    $(INSTALL_SCRIPT) 
eqn2graph $(bindir)/eqn2graph
groff-1.18.1.4/src/roff/nroff/Makefile.sub:    $(INSTALL_SCRIPT) nroff 
$(bindir)/$(NAMEPREFIX)nroff
groff-1.18.1.4/src/utils/afmtodit/Makefile.sub:    $(INSTALL_SCRIPT) 
afmtodit $(bindir)/afmtodit
......

the best,
thank you
>
> Cheers,
>
> Richard
>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   .../groff-1.18.1.4/groff-1.18.1.4-fix-bindir.patch | 39 ++++++++++++++++++++++
>>   meta/recipes-extended/groff/groff_1.18.1.4.bb      |  4 ++-
>>   2 files changed, 42 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-extended/groff/groff-1.18.1.4/groff-1.18.1.4-fix-bindir.patch
>>
>> diff --git a/meta/recipes-extended/groff/groff-1.18.1.4/groff-1.18.1.4-fix-bindir.patch b/meta/recipes-extended/groff/groff-1.18.1.4/groff-1.18.1.4-fix-bindir.patch
>> new file mode 100644
>> index 0000000..559ae72
>> --- /dev/null
>> +++ b/meta/recipes-extended/groff/groff-1.18.1.4/groff-1.18.1.4-fix-bindir.patch
>> @@ -0,0 +1,39 @@
>> +Upstream-Status: Inappropriate [embedded]
>> +
>> +Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> +---
>> + Makefile.sub |   10 +++++-----
>> + 1 file changed, 5 insertions(+), 5 deletions(-)
>> +
>> +--- a/contrib/groffer/Makefile.sub
>> ++++ b/contrib/groffer/Makefile.sub
>> +@@ -38,16 +38,16 @@ groffer: groffer.sh groffer2.sh version.
>> + 	$(RM) $@;
>> + 	sed \
>> +             -e "s|@g@|$(g)|g" \
>> +-	    -e "s|@BINDIR@|$(DESTDIR)$(bindir)|g" \
>> ++	    -e "s|@BINDIR@|$(bindir)|g" \
>> + 	    -e "s|@libdir@|$(DESTDIR)$(libdir)|g" \
>> + 	    -e "s|@VERSION@|$(version)$(revision)|g" \
>> + 	    $(srcdir)/groffer.sh >$@;
>> + 	chmod +x $@
>> +
>> + install_data: groffer
>> +-	-test -d $(DESTDIR)$(bindir) || $(mkinstalldirs) $(DESTDIR)$(bindir)
>> +-	-$(RM) $(DESTDIR)$(bindir)/groffer
>> +-	$(INSTALL_SCRIPT) groffer $(DESTDIR)$(bindir)/groffer
>> ++	-test -d $(bindir) || $(mkinstalldirs) $(bindir)
>> ++	-$(RM) $(bindir)/groffer
>> ++	$(INSTALL_SCRIPT) groffer $(bindir)/groffer
>> + 	-test -d $(DESTDIR)$(libdir)/groff/groffer || \
>> +           $(mkinstalldirs) $(DESTDIR)$(libdir)/groff/groffer
>> + 	-$(RM) $(DESTDIR)$(libdir)/groff/groffer/groffer2.sh
>> +@@ -58,7 +58,7 @@ install_data: groffer
>> + 	$(DESTDIR)$(libdir)/groff/groffer/version.sh
>> +
>> + uninstall_sub:
>> +-	-$(RM) $(DESTDIR)$(bindir)/groffer
>> ++	-$(RM) $(bindir)/groffer
>> + 	-$(RM) $(DESTDIR)$(libdir)/groff/groffer/groffer2.sh
>> + 	-$(RM) $(DESTDIR)$(libdir)/groff/groffer/version.sh
>> + 	-rmdir $(DESTDIR)$(libdir)/groff/groffer
>> diff --git a/meta/recipes-extended/groff/groff_1.18.1.4.bb b/meta/recipes-extended/groff/groff_1.18.1.4.bb
>> index 6871949..38e1d36 100644
>> --- a/meta/recipes-extended/groff/groff_1.18.1.4.bb
>> +++ b/meta/recipes-extended/groff/groff_1.18.1.4.bb
>> @@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e43fc16fccd8519fba405f0a0ff6e8a3"
>>   SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
>>             file://groff-1.18.1.4-remove-mom.patch;striplevel=1 \
>>             file://man-local.patch \
>> -          file://mdoc-local.patch"
>> +          file://mdoc-local.patch \
>> +          file://groff-1.18.1.4-fix-bindir.patch \
>> +"
>>   
>>   inherit autotools texinfo
>>   
>> -- 
>> 1.8.4.1
>>
>
>
>


