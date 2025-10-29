Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB086CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:27:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web01.3473.1761733647732232217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 03:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rbDvWhfA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 171704E413C8
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 10:27:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2065606E8;
	Wed, 29 Oct 2025 10:27:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF408117F25A1;
	Wed, 29 Oct 2025 11:27:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761733645; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wmB7LQseedAlgCEXns5tZi79KDZrlC9PpImsKBzCf1s=;
	b=rbDvWhfA3NHPNAOv9w+odEXQns8VjYhh3Yt8hG0vAN8zK/tNc8z8KLVmakaOAUqOjWBVdl
	Qg/vSr7T7RQj0fw0W/5/hw2emVyvNK2qHcEVA3V1Knx6t1EOF2rFvL296R3s93ChqBD6bI
	k9ozHBAbxnWQJIcLqVCsmMjoSVHjzOBwoOfdAeuthiczzIAzCZxlK6IbBOeLLuC++WkJdu
	iMvUyx1mG5xMuz/6Fow0RMNOsyhVCJplavL0KCiXxGSz4si82R1XR/aBK1p5Eb/9L9rReH
	r6iPDQf8lmk6M7CCzgG4CQkZ81kmMssmWvmxrtuLCaxFahrP/aio8uIbCeboXg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 11:27:21 +0100
Message-Id: <DDUQGE7BT02Y.13NB3HJGHC7RQ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Jiaying.Song.CN@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] cmake: remove GHS-related files
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251029062027.836131-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20251029062027.836131-1-jiaying.song.cn@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 10:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225441

On Wed Oct 29, 2025 at 7:20 AM CET, Jiaying (CN) via lists.openembedded.org=
 Song wrote:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Remove files starting with "GHS*". These files are related to the
> Glasgow Haskell Compiler (GHS), which is not supported, so keeping them
> is unnecessary.
>
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---

Hi Jiaying,

Thanks for your patch.

I suspect this is the cause of the following error on the autobuilder:

oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybu=
ild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image=
-sato/1.0/testimage-sdk/environment-setup-core2-32-poky-linux > /dev/null; =
cd /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-li=
nux/core-image-sato/1.0/testimage-sdk/assimptnwvo_x7/build && cmake -DASSIM=
P_WARNINGS_AS_ERRORS=3DOFF -DCMAKE_VERBOSE_MAKEFILE:BOOL=3DON -DASSIMP_BUIL=
D_ZLIB=3DON /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux8=
6-poky-linux/core-image-sato/1.0/testimage-sdk/assimptnwvo_x7/assimp-5.4.1;=
' returned non-zero exit status 1.
...
Standard Output: CMake Error at /srv/pokybuild/yocto-worker/qemux86/build/b=
uild/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testimage-sdk/sysroots=
/x86_64-pokysdk-linux/usr/share/cmake-4.1/Modules/CMakeCompilerIdDetection.=
cmake:125 (message):
  No preprocessor test for "GHS"
...
CMake Error: CMAKE_CXX_COMPILER not set, after EnableLanguage
-- Configuring incomplete, errors occurred!

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2661
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/2652
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2633

Can you have a look at this issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


