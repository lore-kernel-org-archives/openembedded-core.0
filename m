Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DB7C32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 13:21:20 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web12.2972.1660915273787240920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 06:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1
 header.b=adLIMLy3;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.25,
 mailfrom: pavel@zhukoff.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id D4EAE3200904;
	Fri, 19 Aug 2022 09:21:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 19 Aug 2022 09:21:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1660915272; x=1661001672; bh=3L
	wYN6ioWs6njycqTcayu2ZCZmDTs94QPECJ18rDIEY=; b=adLIMLy3pxhZPkqj06
	Cx3a+WIrMZSA3lw42CpU9uRsqSFNU94uef/3qBwvAE5pTiY68MQ6R1ikqt3qP1Kx
	jK9HDfbR/b5eqAk0sqfdvHykqUykoYLWsFFIX9mqlrDp5K9iKMQYGVSa8ROkebtD
	uo1bedvRWKCnKz7zprjfXcfPBGg8WzLuLDZ37CnLLeeGWOJxgZRYCSUIO85FY7oq
	DnDFprBydZ104ll2RdxQK1xpePAl/REUbWQd+DP/gmjSH2bZ41ReiEfqJofAdiey
	OYdfzMIm0tCk6acd40VFvFDOFt7/Iqo80pccTljC+Vbg5VMBpSeAXSj7QZlRyIeO
	Mq2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660915272; x=1661001672; bh=3LwYN6ioWs6nj
	ycqTcayu2ZCZmDTs94QPECJ18rDIEY=; b=q4ksvx7JLAMd/E86xfsyYHaQOFRaq
	L4hmAcDqRyiFEDRXYIiqOtTnkYUr7xMOBhmsAyhdbiWtJ+nfOBZXJzijyr3I9mSs
	u3bkjLPaJM2i3iua6PmLRN1Y3FtVEWE0qJWy61Rx/bjUfql7bgGQOsqtXEcRwjvm
	VcGMSzFknqhthI+hYxY6587ixoB+DXGBE5JlcIpZs2xlu66uk+bZdbat4D+OtAgq
	gO+tbFF1kuKeoUy0/51OQD9lLFrJfa+Q/WpDw2Epg8MZIypQp50lJmJFwxW/T2nS
	EsnH9LlUS3dYu8e/pBgDKWytwxwFX7ZozJe2wINP7guKyFk+GBj1pCBow==
X-ME-Sender: <xms:R47_YgQFsrqMq6lte8_NSDhIu0mrauISED04mzRRYWfE5QV6ymKkMw>
    <xme:R47_YtzW881Iih81fm5qLArT1eCjMDhw1ygn1I95ypfpOyAeUsJRfEPgQlyepI9Mz
    54Yw46-ZB_PI0fEsB8>
X-ME-Received: 
 <xmr:R47_Yt17DJaZTumNt8VEmNii7BF74Sj46ejy9jskY2T1SW9v1AcRrnwYsrPDhe9EzkeujnE>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiuddgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfhgfhffvvefuffhrjgfkgggtsehttdertddtredtnecuhfhrohhmpefrrghv
    vghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrg
    htthgvrhhnpeefuefggeehfffhuefggfehudetffffleegheegleekieeivedujedtveev
    geefieenucffohhmrghinhephihouhhrughitghtihhonhgrrhihrdgtohhmpdhsvghlfh
    htvghsthdrtggrshgvpdhophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofh
    hfrdhnvght
X-ME-Proxy: <xmx:R47_YkC3ODUFNnq9-_Rz0YT1dFZC58lr-M7_5EGsmI1SJMfj9PCxCA>
    <xmx:R47_YphKDUkfvNBSa_RlgP_qy3vs_sq03YnIb0g-NSn9EPQMhtHL7A>
    <xmx:R47_YgrvsyBo0_wmVZAwwcGfj4hYuyhp76IYI_iuaB0ZjLPtl_EI1A>
    <xmx:SI7_YpZqt215fUMHNOs_DGhJIAPbvk0Wz3M8b3jhc1WFwovV8_DVBA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Aug 2022 09:21:11 -0400 (EDT)
References: <20220819092002.31294-1-pavel@zhukoff.net>
 <20220819092002.31294-2-pavel@zhukoff.net>
 <16d8c191-8545-828c-62d1-6e586c905d5a@windriver.com>
User-agent: mu4e 1.6.10; emacs 28.1
From: Pavel Zhukov <pavel@zhukoff.net>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Pavel Zhukov
 <pavel.zhukov@huawei.com>
Subject: Re: [OE-core] [PATCH 2/2] selftest: Add regression test for rpm
 filenames
Date: Fri, 19 Aug 2022 15:16:10 +0200
Reply-To: pavel@zhukoff.net
In-reply-to: <16d8c191-8545-828c-62d1-6e586c905d5a@windriver.com>
Message-ID: <87v8qo8j49.fsf@gentoo.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 13:21:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169630


Randy MacLeod <randy.macleod@windriver.com> writes:

> Hi Pavel,
>
> On 2022-08-19 05:20, Pavel Zhukov wrote:
>> Escaping globs and quoting in rpm spec files is tricky and requires a
>> bit of dancing. In addition to that it changes from time to time.
>> Adding (simple) regression test for different types of filename
>> patterns. Cover bracket in first iteration
>
> Nice.
>
>> [Yocto #13746]
>> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
>> ---
>>   .../recipes-test/testrpm/files/testfile.txt     |  6 ++++++
>>   .../recipes-test/testrpm/testrpm_0.0.1.bb       | 17 +++++++++++++++++
>>   meta/lib/oeqa/selftest/cases/rpmtests.py        | 16 ++++++++++++++++
>>   3 files changed, 39 insertions(+)
>>   create mode 100644 meta-selftest/recipes-test/testrpm/files/testfile.txt
>>   create mode 100644 meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
>>   create mode 100644 meta/lib/oeqa/selftest/cases/rpmtests.py
>> diff --git a/meta-selftest/recipes-test/testrpm/files/testfile.txt
>> b/meta-selftest/recipes-test/testrpm/files/testfile.txt
>> new file mode 100644
>> index 00000000000..d1e50ff79a2
>> --- /dev/null
>> +++ b/meta-selftest/recipes-test/testrpm/files/testfile.txt
>> @@ -0,0 +1,6 @@
>> +  /mnt/builds/yocto/sources/meta-selftest/recipes-test/testrpm:
>> +  total used in directory 16 available 76.4 GiB
>> +  drwxr-xr-x  2 pavel pavel 4096 Aug 19 08:59 .
>> +  drwxr-xr-x 34 pavel pavel 4096 Aug 18 17:59 ..
>> +  -rw-r--r--  1 pavel pavel  408 Aug 19 08:59 testrpm_0.0.1.bb
>> +  -rw-r--r--  1 pavel pavel  355 Aug 18 21:54 testrpm_0.0.1.bb~
>
>
> I assume that you just want a testfile.txt that doesn't have any
> special characters in the name.
> If so, maybe the body of the file should be text that explains that purpose.
> If for some reason, you want the output you have, it would be nice to
> remove the backup file: testrpm_0.0.1.bb~
> because it seems out of place.
>
The file is there to serve the purposes of SRC_URI only. I didn't want to
overload workers with downloading real tarball/git_repo so I put random
file (well. it's content of Emacs's buffer which I have opened at the
moment of writing :) ) . Fixed that in v2
>
>> diff --git a/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb b/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
>> new file mode 100644
>> index 00000000000..e42c7db3b39
>> --- /dev/null
>> +++ b/meta-selftest/recipes-test/testrpm/testrpm_0.0.1.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY = "Test recipe for testing rpm generated by oe-core"
>> +LICENSE = "CLOSED"
>
> Why did you pick a CLOSED license rather than MIT ?
> Our IP group would likely complain about this! ;-)
Fixed as well (didn't know about the COMMON_LICENSE_DIR existense :) Now I do)
>
>> +
>> +SRC_URI = "file://testfile.txt"
>> +
>> +INHIBIT_DEFAULT_DEPS = "1"
>> +
>> +do_compile(){
>> +	echo "testdata" > ${B}/"file with [quotes].txt"
>> +	echo "testdata" > ${B}/"file with (quites).txt"
>
>
> Since I'm being picky, would you rename these files to use the terms here:
>
> https://grammar.yourdictionary.com/punctuation/what/fourteen-punctuation-marks.html
> i.e.: Brackets, and Parentheses ?
Covered in v2 too
>
>
> ../Randy
>
>
>> +}
>> +
>> +do_install(){
>> +	install ${B}/* ${D}/
>> +}
>> +
>> +FILES:${PN} = "*"
>> diff --git a/meta/lib/oeqa/selftest/cases/rpmtests.py b/meta/lib/oeqa/selftest/cases/rpmtests.py
>> new file mode 100644
>> index 00000000000..dafbbc21360
>> --- /dev/null
>> +++ b/meta/lib/oeqa/selftest/cases/rpmtests.py
>> @@ -0,0 +1,16 @@
>> +#
>> +# Copyright OpenEmbedded Contributors
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +
>> +from oeqa.selftest.case import OESelftestTestCase
>> +from oeqa.utils.commands import bitbake
>> +
>> +class BitbakeTests(OESelftestTestCase):
>> +
>> +    def test_rpm_filenames(self):
>> +        test_recipe = "testrpm"
>> +        bitbake(test_recipe)
>> +
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#169617): https://lists.openembedded.org/g/openembedded-core/message/169617
>> Mute This Topic: https://lists.openembedded.org/mt/93121038/3616765
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>> 


