Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E9ECA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 08:38:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.34552.1756975094014987398
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 01:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=o6N03ecz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 88CE0C6B39F
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Sep 2025 08:37:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B040F606BB;
	Thu,  4 Sep 2025 08:38:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53F7A1C22CC52;
	Thu,  4 Sep 2025 10:38:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756975091; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NzTs4chqaWz70fOAxJG2/MgcNs1WnPhKSq9n/fYCEVQ=;
	b=o6N03eczTf9B38wCVybyph0L7ko4So3q8S3sh0cJ8VvGl9ILISZ1lhekH5NNaa2/6O/fpR
	Cm07yN7n0UCiCsYTmUuSak7jCejPwg7tqlYv0LtWTL3ZEdrGtR/tIKPUblQcMAr7ayuCCU
	XoItAZ4a5gwG5HGlYHvSf7W1feQ910+P21wl6NQruFrT1YCi3Mi0zKL0YXx2irnSlY4G9x
	1P0HHxw2735z5n2r1qNI5r+8yw717tOw/mmxWLyZkMSLwJTgPuUR+6VeRtkf719Ra+7WP1
	xV5ECLm8BNj7esbqrc+QWKsfCWknzo12VNBblAPyjOGrPoH69iB/mmR4nhnnTQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 10:38:09 +0200
Message-Id: <DCJVOTBI82GN.35SPDJFPGFLHE@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/3] kexec-tools: Fix build with LLD linker
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250904051509.798465-1-raj.khem@gmail.com>
 <20250904051509.798465-2-raj.khem@gmail.com>
In-Reply-To: <20250904051509.798465-2-raj.khem@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222908

On Thu Sep 4, 2025 at 7:15 AM CEST, Khem Raj via lists.openembedded.org wro=
te:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Thanks for the new version.

It looks like the build is failing:

ERROR: kexec-tools-2.0.31-r0 do_compile: Execution of '/srv/pokybuild/yocto=
-worker/genericx86/build/build/tmp/work/core2-32-poky-linux/kexec-tools/2.0=
.31/temp/run.do_compile.3699006' failed with exit code 1
...
| i686-poky-linux-ld --sysroot=3D/srv/pokybuild/yocto-worker/genericx86/bui=
ld/build/tmp/work/core2-32-poky-linux/kexec-tools/2.0.31/recipe-sysroot   -=
melf_i386 -e _start --image-base=3D0x10000 -Ttext 0x10000 -o build/lib/kexe=
c-tools/kexec_test kexec_test/kexec_test16.o kexec_test/kexec_test.o
| i686-poky-linux-ld: section .note.gnu.property LMA [000100f4,0001011b] ov=
erlaps section .text LMA [00010000,00010e3c]
| make: *** [../sources/kexec-tools-2.0.31/kexec_test/Makefile:38: build/li=
b/kexec-tools/kexec_test] Error 1
| ERROR: oe_runmake failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/2327

Can you have a look at this please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


