Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 102FA7D2AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 08:23:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x348MqJA003013
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Apr 2019 01:23:12 -0700
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 4 Apr 2019 01:23:06 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1554358311-216590-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0La7viPMKAR+9PMx8m_SNTk6eyfM+M9ge5qeTyYrG-6QRQ@mail.gmail.com>
	<CAJTo0Lak05SBbDApK4L-QZpSqR_cONECVhDUUq99B_JFFhgVbQ@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5CA5C01F.1050303@windriver.com>
Date: Thu, 4 Apr 2019 16:28:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lak05SBbDApK4L-QZpSqR_cONECVhDUUq99B_JFFhgVbQ@mail.gmail.com>
X-Originating-IP: [128.224.162.194]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] asciidoc: disable xmllint check
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
X-List-Received-Date: Thu, 04 Apr 2019 08:24:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2019年04月04日 16:02, Burton, Ross wrote:
> Some further context (note to self: don't reply to mails during
> breakfast): the problem which lead to xmllint failing also leads to
> the XSL stylesheets in the sysroot not being used, so xsltproc
> downloads them.  On my machine, asciidoc should execute do_compile in
> about a second, but with the broken catalogues this was taking almost
> a minute.

Thanks Ross's reminding.

Thanks,

>
> Ross
>
> On Thu, 4 Apr 2019 at 08:30, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> I've submitted fixes for this already.
>>
>> Ross
>>
>> On Thu, 4 Apr 2019 at 07:12, <mingli.yu@windriver.com> wrote:
>>>
>>> From: Mingli Yu <Mingli.Yu@windriver.com>
>>>
>>> asciidoc-native build with below error when
>>> there is no xmllint program located on build
>>> host:
>>> | python3 a2x.py -f manpage doc/asciidoc.1.txt
>>> | a2x: ERROR: "xmllint" --nonet --noout --valid "/build/tmp/work/x86_64-linux/asciidoc-native/8.6.9+py3-gitAUTOINC+618f6e6f6b-r0/git/doc/asciidoc.1.xml" returned non-zero exit status 4
>>> |
>>> | Makefile:110: recipe for target 'doc/asciidoc.1' failed
>>>
>>> Considering it's only used to check the xml format
>>> of the doc file as doc/asciidoc.1.txt, so disable
>>> xmllint check to fix the above issue.
>>>
>>> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>>> ---
>>>   meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb   |  4 ++-
>>>   .../0001-Makefile.in-disable-xmllint-check.patch   | 38 ++++++++++++++++++++++
>>>   2 files changed, 41 insertions(+), 1 deletion(-)
>>>   create mode 100644 meta/recipes-extended/asciidoc/files/0001-Makefile.in-disable-xmllint-check.patch
>>>
>>> diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
>>> index d0d1517..7e00b34 100644
>>> --- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
>>> +++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
>>> @@ -8,7 +8,9 @@ LICENSE = "GPLv2"
>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
>>>                       file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
>>>
>>> -SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https"
>>> +SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https \
>>> +           file://0001-Makefile.in-disable-xmllint-check.patch \
>>> +"
>>>   SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
>>>   PV .= "+py3-git${SRCPV}"
>>>
>>> diff --git a/meta/recipes-extended/asciidoc/files/0001-Makefile.in-disable-xmllint-check.patch b/meta/recipes-extended/asciidoc/files/0001-Makefile.in-disable-xmllint-check.patch
>>> new file mode 100644
>>> index 0000000..4c0dd6d
>>> --- /dev/null
>>> +++ b/meta/recipes-extended/asciidoc/files/0001-Makefile.in-disable-xmllint-check.patch
>>> @@ -0,0 +1,38 @@
>>> +From 242e58f16c129f5983d6b32d493619cc4f87703e Mon Sep 17 00:00:00 2001
>>> +From: Mingli Yu <Mingli.Yu@windriver.com>
>>> +Date: Thu, 4 Apr 2019 13:38:10 +0800
>>> +Subject: [PATCH] Makefile.in: disable xmllint check
>>> +
>>> +asciidoc-native build with below error when
>>> +there is no xmllint program located on build
>>> +host:
>>> +| python3 a2x.py -f manpage doc/asciidoc.1.txt
>>> +| a2x: ERROR: "xmllint" --nonet --noout --valid "/build/tmp/work/x86_64-linux/asciidoc-native/8.6.9+py3-gitAUTOINC+618f6e6f6b-r0/git/doc/asciidoc.1.xml" returned non-zero exit status 4
>>> +|
>>> +| Makefile:110: recipe for target 'doc/asciidoc.1' failed
>>> +
>>> +So disable xmllint check to fix the above issue.
>>> +
>>> +Upstream-Status: Inappropriate [oe build specific]
>>> +
>>> +Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
>>> +---
>>> + Makefile.in | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/Makefile.in b/Makefile.in
>>> +index ffba3b5..fb95fab 100644
>>> +--- a/Makefile.in
>>> ++++ b/Makefile.in
>>> +@@ -107,7 +107,7 @@ $(DATATARGETS): % : %dir
>>> +       $(INSTALL_DATA) $($@) $(DESTDIR)/$($<)/
>>> +
>>> + $(manp): %.1 : %.1.txt
>>> +-      python3 a2x.py -f manpage $<
>>> ++      python3 a2x.py -L -f manpage $<
>>> +
>>> + docs:
>>> +       $(INSTALL) -d $(DESTDIR)/$(docdir)
>>> +--
>>> +2.7.4
>>> +
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

