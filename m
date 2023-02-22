Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC09C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 21:39:15 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web10.80.1677101953169847208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 13:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm1 header.b=vE/kTYV2;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.27, mailfrom: pavel@zhukoff.net)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 6C8D95C0158;
	Wed, 22 Feb 2023 16:39:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 22 Feb 2023 16:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1677101952; x=1677188352; bh=R5
	iZdvFeABpwjcKeIy+2ldG1H2XE6m5uSazV4GdRubI=; b=vE/kTYV2V/0DAxzzPO
	4SBgqQ7bt2yro+pEbeIWWszacBKGT575RU/CaYyS0Tyrd4AYQCtlQjkU7L33iz2t
	atLM8BtC3QJA+VgGi3GgsHcMoYrrntH93WQFVVczyE7+4Hd8RfPVj5/qouBrNLmq
	qO1sezvRSslhL/9WIvi0biDO3fvjxsxrZCMaEaiaYe1mlLNQHU5QHO2dlzYm1llR
	CqSgJVc2plReaWSw9TlpphRMP6PL7vdQzv//LES7zBeKD/eoN14I8VMJY1DM4/e1
	N43TNvqH876M8enfZEsxbh0B4k/QdX4pDash8QoAHpY5q0v3Ee3feoJC7IWCp0az
	5jdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677101952; x=1677188352; bh=R5iZdvFeABpwj
	cKeIy+2ldG1H2XE6m5uSazV4GdRubI=; b=Z1zxuU+4j0O6/iEfiw9W6/ubJzVJi
	EWj7o998o9Sq4jTj+ZtbVFpdRrMxK+Ufm2hIOLNR6hqPf8Sk7h343WatSr0tp9zJ
	buXvgWAtUosY3j097jkwgtwRL9JAa7RcYj/+utqvsBh5Q3c8ad8FVVUqgMuv1fUK
	4SyIv6DwTiwl7FUWHDrhNA5AOYDccQ7CCY4hwjUmrm8ZDSgW9C+cnFZiyOPLkD0f
	Z8wmxCSqUofxr621Dgy+JAKEkX0f24XPtbTG6c1cU7IF3q5+LvswrHXUDTXd9FVW
	Ocixc2optl2QUtsUatnKqjJ27ptxsOtrYKqe8YF1oHw9eiFI2qRknUiUQ==
X-ME-Sender: <xms:gIv2Y_8Cl6mQumBgAl5eR5YYj3KZAvmQOtjbo4WCMzt-rTj1Den9RA>
    <xme:gIv2Y7t8Bw_nTtNdwwQqH3IqakghtzgV9uhzKU2gP0pc9q116Jj-5q2Bl0YQpjT-f
    k6uZP7237OZRwZwZ-M>
X-ME-Received: <xmr:gIv2Y9B1BD6149k9k49Bz_rnyZ0nQBRYuQgiTdAGFw_EBsIX025hyXjMOwivn6xt4Su9TnrvGzKRhdEBYzmGKdyB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpehffgfhvfevufffohhrjgfkgggtsehttdertddtredtnecuhfhrohhmpefr
    rghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtf
    frrghtthgvrhhnpeetudefiedujeejffdugeefgeetffeujedvhfeiteevgfekffeghfek
    geevkedukeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdhophgvnh
    gvmhgsvgguuggvugdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:gIv2Y7d1Yqr0XUU8AzNPv5GNKSHJT3IgRPl3sjSsqoy9M7O5eITTfw>
    <xmx:gIv2Y0NNpnRNazCmmXSkX4mXI4etu3I1jx7-r0vVCT1kiNQ7Qs8erQ>
    <xmx:gIv2Y9mz4-idEUYVDieJxsUhufb3vD5sxm4KA5gnOLcxYCzPPS-bug>
    <xmx:gIv2Y-V8HCN9ek4ZrEzwB2QzdfrFGy6syQ48LtVFaK1uBhFrp98fVQ>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 16:39:11 -0500 (EST)
References: <20230220124231.17673-1-pavel@zhukoff.net>
 <Y/ZdaL36qd93d8NY@mail.local>
User-agent: mu4e 1.8.13; emacs 28.2
From: Pavel Zhukov <pavel@zhukoff.net>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel-arch.bbclass: Map arm64 to arm
Date: Wed, 22 Feb 2023 22:36:55 +0100
Organization: Linux Private Site
Reply-To: pavel@zhukoff.net
In-reply-to: <Y/ZdaL36qd93d8NY@mail.local>
Message-ID: <87a615qt1d.fsf@desktop.zhukoff.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 21:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177588


Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

> Hello,
>
> This is the cause of:
Hi Alex,
Yes, my fault, sorry about that.
Arm64 is valid U-boot/mkimage architecture. Proper fix sent as:
"[PATCH] u-boot: Map arm64 into map for u-boot dts installation"

This patch can be dropped. 

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/995/steps/14/logs/stdio
>
> 2023-02-22 11:33:00,834 - oe-selftest - INFO - fitimage.FitImageTests.test_fit_image (subunit.RemotedTestCase)
> 2023-02-22 11:33:00,835 - oe-selftest - INFO -  ... FAIL
>
> |   OBJCOPY arch/arm64/boot/Image
> | NOTE: make -j 16 -l 52 CC=aarch64-poky-linux-gcc -fuse-ld=bfd
> | -fmacro-prefix-map=/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work-shared/qemuarm64/kernel-source=/usr/src/debug/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0
> | -fdebug-prefix-map=/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work-shared/qemuarm64/kernel-source=/usr/src/debug/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0
> | -fmacro-prefix-map=/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/linux-qemuarm64-standard-build=/usr/src/debug/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0
> | -fdebug-prefix-map=/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/linux-qemuarm64-standard-build=/usr/src/debug/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0
> | -fdebug-prefix-map=/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot=
> | -fmacro-prefix-map=/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot=
> | -fdebug-prefix-map=/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-native=
> | -fdebug-prefix-map=/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work-shared/qemuarm64/kernel-source=/usr/src/kernel
> | -fdebug-prefix-map=/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work-shared/qemuarm64/kernel-build-artifacts=/usr/src/kernel
> | --sysroot=/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot
> | LD=aarch64-poky-linux-ld.bfd
> | --sysroot=/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot
> | HOSTCC=gcc
> | HOSTCFLAGS=-isystem/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-native/usr/include
> | -O2 -pipe
> | HOSTLDFLAGS=-L/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-native/usr/lib
> | -L/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-native/lib
> | -Wl,--enable-new-dtags
> | -Wl,-rpath-link,/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-native/usr/lib
> | -Wl,-rpath-link,/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-native/lib
> | -Wl,-rpath,/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-native/usr/lib
> | -Wl,-rpath,/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-native/lib
> | -Wl,-O1 -Wl,--allow-shlib-undefined
> | -Wl,--dynamic-linker=/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/sysroots-uninative/aarch64-linux/lib/ld-linux-aarch64.so.1
> | HOSTCP
> =gcc -E HOSTCXX=g++
> HOSTCXXFLAGS=-isystem/home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3486447/tmp/work/qemuarm64-poky-linux/linux-yocto/6.1.9+gitAUTOINC+d7393c5752_1caf99d568-r0/recipe-sysroot-native/usr/include
> -O2 -pipe PAHOLE=false zImage
> | make: *** No rule to make target 'zImage'.  Stop.
> | ERROR: oe_runmake failed
>
> On 20/02/2023 13:42:31+0100, Pavel Zhukov wrote:
>> The kernel calls AArch64 'arm64', but U-Boot calls it just 'arm' so
>> adding arm64 case to existing map.
>> 
>> Fixes:
>> | install: cannot stat '.../u-boot/1_2023.01-r0/build/arch/arm64/dts/u-boot.dtb': No such file or directory
>> 
>> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
>> ---
>>  meta/classes-recipe/kernel-arch.bbclass | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
>> index 777f900241..4f88c47ef1 100644
>> --- a/meta/classes-recipe/kernel-arch.bbclass
>> +++ b/meta/classes-recipe/kernel-arch.bbclass
>> @@ -55,6 +55,7 @@ def map_uboot_arch(a, d):
>>      import re
>>  
>>      if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
>> +    elif re.match('arm(|64)', a): return 'arm'
>>      elif re.match('i.86$', a): return 'x86'
>>      return a
>>  
>> -- 
>> 2.39.1
>> 
>
>> 
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#177399): https://lists.openembedded.org/g/openembedded-core/message/177399
>> Mute This Topic: https://lists.openembedded.org/mt/97084683/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>> 


