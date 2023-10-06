Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD2BE92FEE
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 06:42:06 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.7079.1696574517594616676
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 23:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm2 header.b=rtsAfiWX;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Xyo7jnyk;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.26, mailfrom: pavel@zhukoff.net)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id CF66D5C0249;
	Fri,  6 Oct 2023 02:41:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 06 Oct 2023 02:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1696574514; x=
	1696660914; bh=hTRjjWUYzAoqj3ugy5pC1hHGLz2jI8V/HtxgoFjpuxg=; b=r
	tsAfiWX/VJBkvLO3y4aI/emNOShrosstxdHzRB/CZWrR3QAUj/EGtTYTI7jxp9jJ
	nosnD7ViG+CGbZS9RnpnIAtLZwJ1e0EOkLzXoeSbFNicz00wUS8jEK1Hqe5mjAS8
	psh822MgVY/JxnK/dNCqtGdejeJDQ4QdZz/iCnH271hDn5f7nEOqkyU5EYsgdzkp
	36u0hhVc0ZItPBXxNqYEfeyPuc0pLn4/7/6neHFNW5/vcQsAIdXzOrKkMJmYW1jR
	WN7c6m01oHsC3Sb/JeB/Pct4ad+/Klkvo2eTya4sftSp+9N3H4ZrW3Hn8SBPOjiY
	Y+gO3p0jpn7s5RWR/Pcxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1696574514; x=1696660914; bh=h
	TRjjWUYzAoqj3ugy5pC1hHGLz2jI8V/HtxgoFjpuxg=; b=Xyo7jnykzVjoNbwz1
	pXEFIWVNr35Lb38qLugFx7dTJTPtNasJSMlJHyt92FwPabA/h6HAk05qcZpLhwwp
	LhxV5ls3ij9Rzdc1TzWevABcAeKDCPDtVHMK79gSAu5IBRswcu9towU9Ez68/nPv
	yiElQ5NPyhIs9ssYSavtfFEOkPFWyl5QwegfDLZR2UOKBxRTjskri57W4HSYjIvZ
	jjK11lKugYNMP7G77vuI5RzCaCqsMn3EljOPqKZgfkcZ2ic/01m0KfDN42xAtyP/
	tRUrMkkHpEkLEUEBHy4bO5/OMuNIEysFBF8maKD6XnysUAa4DJmMYxCaKfpv1+pt
	jVxxQ==
X-ME-Sender: <xms:MqwfZYIavcc1WjIFFQuN1TymUHLESZIWEHBDV_B7pauOLyU7H6d8Sw>
    <xme:MqwfZYIxI2XV2f2sMUsEoYzPJm-D7qon8FC8S2PhoFRkS6cv9LjJoTMFlu3DEsceG
    3j8toZjvThDtNSvBeI>
X-ME-Received: <xmr:MqwfZYs4rwXaHmK9so9yi2_ii-9gE7aVdj1klBscYnpKsAR2661w9shVer1VzpesYoaE-gKo1PliDqlOqZPhBQCu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeehgdduudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfhgfhffvvefuffhrjgfkgggtsehttdertddtredtnecuhfhrohhmpefrrghv
    vghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrg
    htthgvrhhnpeekudduheehtefhhfdvfffhvdffledtveefjeekteevkeelieetgfelkeek
    ffefueenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhophgvnhgvmh
    gsvgguuggvugdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:MqwfZVZhb8diqaDHxQsHXd8Ib3Sy72PY_kfju8tqBsIbn5vg_ORe5g>
    <xmx:MqwfZfZ5a4cv18WSP037yte4lBpgPewKEo9yJbG81Mg9wSC_SyJe4w>
    <xmx:MqwfZRCOBHwhpi8DtlJP-uAPDowhdOjdq0Cg1bOTl2QVQF76ScUpKA>
    <xmx:MqwfZQC8GDmUaKo0u3lk_jJOp-Ac4MDuo4i8r0tSF4RoQ8cbWuv3oA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Oct 2023 02:41:53 -0400 (EDT)
References: <20231004161318.576312-1-pavel@zhukoff.net>
 <202310051928481b3031dd@mail.local>
User-agent: mu4e 1.10.6; emacs 29.1
From: Pavel Zhukov <pavel@zhukoff.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] dummy-sdk-package.inc: Filter packages
 which are marked for installation
Date: Fri, 06 Oct 2023 08:37:49 +0200
Reply-To: pavel@zhukoff.net
In-reply-to: <202310051928481b3031dd@mail.local>
Message-ID: <874jj4s196.fsf@desktop.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 06:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188746


Hi Alex,

Thank you for heads up. Interesting breakage... Reproduced locally.

-- 
Pavel

Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

> Hello,
>
> This series causes the following failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/8312/steps/12/logs/stdio
>
> | Can't locate Text/Tabs.pm in @INC (you may need to install the
> | Text::Tabs module) (@INC entries checked:
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-build-2946y_hb/tmp/work/x86_64-linux/automake-native/1.16.5/build/lib/
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-build-2946y_hb/tmp/work/x86_64-linux/automake-native/1.16.5/build/../automake-1.16.5/lib/
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/site_perl/5.38.0/x86_64-linux
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/site_perl/5.38.0
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/vendor_perl/5.38.0
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/5.38.0/x86_64-linux
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/5.38.0
> | /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/site_perl/5.38.0/x86_64-linux
> | /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/site_perl/5.38.0
> | /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/vendor_perl/5.38.0/x86_64-linux
> | /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/vendor_perl/5.38.0
> | /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/5.38.0/x86_64-linux
> | /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/5.38.0)
> | at ../automake-1.16.5/doc/help2man line 28.
> | BEGIN failed--compilation aborted at ../automake-1.16.5/doc/help2man line 28.
> | make: *** [Makefile:3741: doc/aclocal-1.16.1] Error 2
> | make: *** Waiting for unfinished jobs....
> | if LC_ALL=C grep '@[a-zA-Z0-9_][a-zA-Z0-9_]*@' runtest-t; then echo
> | "runtest contains unexpanded substitution (see lines above)"; exit
> | 1; fi; chmod a-w runtest-t && mv -f runtest-t runtest
> | Can't locate Text/Tabs.pm in @INC (you may need to install the
> | Text::Tabs module) (@INC entries checked:
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-build-2946y_hb/tmp/work/x86_64-linux/automake-native/1.16.5/build/lib/
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-build-2946y_hb/tmp/work/x86_64-linux/automake-native/1.16.5/build/../automake-1.16.5/lib/
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/site_perl/5.38.0/x86_64-linux
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/site_perl/5.38.0
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/vendor_perl/5.38.0
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/5.38.0/x86_64-linux
> | /home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/bin/../..//usr/lib/perl5/5.38.0
> | /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/site_perl/5.38.0/x86_64-linux
> | /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/site_perl/5.38.0
> | /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/vendor_perl/5.38.0/x86_64-linux
> | /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/vendor_perl/5.38.0
> | /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/5.38.0/x86_64-linux
> | /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/perl5/5.38.0)
> | at ../automake-1.16.5/doc/help2man line 28.
> | BEGIN failed--compilation aborted at ../automake-1.16.5/doc/help2man line 28.
> | make: *** [Makefile:3743: doc/automake-1.16.1] Error 2
> | if LC_ALL=C grep '@[a-zA-Z0-9_][a-zA-Z0-9_]*@'
> | t/ax/shell-no-trail-bslash-t; then echo "t/ax/shell-no-trail-bslash
> | contains unexpanded substitution (see lines above)"; exit 1; fi;
> | chmod a-w t/ax/shell-no-trail-bslash-t && mv -f
> | t/ax/shell-no-trail-bslash-t t/ax/shell-no-trail-bslash
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
>
> On 04/10/2023 18:13:16+0200, Pavel Zhukov wrote:
>> if packages is provided by dummysdk and in the same time marked for
>> installation with IMAGE_INSTALL it causes conflict in apt because virtual providers are
>> not taken into account if package is asked to be installed explicitly.
>> Filter such packages from provides/conflicts to workaround this problem.
>> This workaround brakes RPM usecase because of file conlicts with
>> DUMMYPROVIDES, use DUMMYPROVIDES_PACKAGES_MULTILIB instead (which
>> doesn't include file based conflicts).
>> While this is needed for the case of package_deb only adding it for all
>> package managers to not complicate the code.
>> 
>> Fixes: [Yocto #13338] [Yocto #14066]
>> 
>> Fixes:
>> The following information may help to resolve the situation:
>> 
>> The following packages have unmet dependencies:
>>  target-sdk-provides-dummy : Conflicts: bash
>> E: Unable to correct problems, you have held broken packages.
>> 
>> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
>> ---
>>  meta/recipes-core/meta/dummy-sdk-package.inc | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
>> index bd26e39ad3..6ccafbf8bc 100644
>> --- a/meta/recipes-core/meta/dummy-sdk-package.inc
>> +++ b/meta/recipes-core/meta/dummy-sdk-package.inc
>> @@ -19,13 +19,14 @@ PR[vardeps] += "DUMMYPROVIDES"
>>  PR[vardeps] += "DUMMYPROVIDES_PACKAGES"
>>  
>>  DUMMYPROVIDES_PACKAGES ??= ""
>> -DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split()])}"
>> +DUMMYPROVIDES_PACKAGES_FILTERED = "${@' '.join([pkg for pkg in d.getVar('DUMMYPROVIDES_PACKAGES').split() if d.getVar('IMAGE_INSTALL') is not None and pkg not in d.getVar('IMAGE_INSTALL').split()])}"
>> +DUMMYPROVIDES_PACKAGES_MULTILIB = "${@' '.join([multilib_pkg_extend(d, pkg) for pkg in d.getVar('DUMMYPROVIDES_PACKAGES_FILTERED').split()])}"
>>  DUMMYPROVIDES += "${DUMMYPROVIDES_PACKAGES_MULTILIB}"
>>  
>>  python populate_packages:prepend() {
>>      p = d.getVar("PN")
>>      d.appendVar("RPROVIDES:%s" % p, "${DUMMYPROVIDES}")
>> -    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES}")
>> +    d.appendVar("RCONFLICTS:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
>>      d.appendVar("RREPLACES:%s" % p, "${DUMMYPROVIDES_PACKAGES_MULTILIB}")
>>  }
>>  
>> -- 
>> 2.41.0
>> 
>
>> 
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#188690): https://lists.openembedded.org/g/openembedded-core/message/188690
>> Mute This Topic: https://lists.openembedded.org/mt/101758725/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>> 


