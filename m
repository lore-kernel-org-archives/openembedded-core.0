Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBB9CD5BC8
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 09:39:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33452.1779788349487145104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 02:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qITs31kE;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CBC511A36CA;
	Tue, 26 May 2026 09:39:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F5E260732;
	Tue, 26 May 2026 09:39:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A387410888570;
	Tue, 26 May 2026 11:39:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779788347; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4kzlOh5mLcXy++jI06f+4S3ETAPQ9aTCTkFU4yKmp5c=;
	b=qITs31kEDBOyqu/rwReAuz5AwfehSXsLq/l9eFjCo3YJ4F7QeV9f8u2d3p94G5nQmB+VQW
	3qrb0HNrqx26X51Ak9FlBQVGJACdWe0tH9dGSWw933PVp8NJdj0rAAx6V17FSfj2ik2o4p
	KJmdMLzT8CcNuxbFk99jFcryeCMJdZ0RnQTaBKUVW8pTvFV+mQvrhqd6YwLvWd+jjaKUto
	Vd7qtkL5ds5inEAqZilhnz2wR909im9ABeUE49aG0dI0E0nevXnBG1+9pGdKMH2ntUYNB8
	C2Ef7nlbxEUI42qbT2SKNQFNFvPhEBpkxto7gI+LagC/K5aQ2GPpzTaiPwXtpQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 11:39:04 +0200
Message-Id: <DISIBA2T5ZC3.3QQF4IY54NI7@bootlin.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Quan.Sun@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260525201135.183095-1-Quan.Sun@windriver.com>
In-Reply-To: <20260525201135.183095-1-Quan.Sun@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 09:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237591

On Mon May 25, 2026 at 10:10 PM CEST, Quan Sun via lists.openembedded.org w=
rote:
> From: Quan Sun <Quan.Sun@windriver.com>
>
> Upgrade QEMU to version 11.0.0.
>
> Main changes:
>
> - Add python3-qemu-qmp recipe (0.0.6) as a separate package. The QMP
>   Python library was removed from the QEMU source tree in 11.0.0 and
>   split into its own upstream project. This is needed by
>   qemu-system-native for testimage integration.
>   Add an entry for this recipe in maintainers.inc.
>
> - QEMU 11.0.0 has officially dropped all support for 32-bit host systems.
>   This includes the ability to build the system emulator (softmmu) on
>   any 32-bit host architecture. Add COMPATIBLE_HOST:class-target to
>   restrict target builds to 64-bit architectures.
>   Note: QEMU 11.0.0 still supports emulating 32-bit guest architectures
>   (such as qemu-system-i386 or qemu-system-arm) as long as they are
>   running on a 64-bit host.
>
> - qemu-targets.inc: skip linux-user targets when HOST_ARCH is not in the
>   set of architectures supported by QEMU 11.0.0's linux-user mode
>   (64-bit only: aarch64, loongarch64, mips64, ppc64, riscv64, s390x,
>   sparc64, x86_64).
>
> - Add --cpu=3D${TUNE_ARCH} to EXTRA_OECONF for class-target, and add
>   --cpu=3D${SDK_ARCH} to nativesdk configure options to fix build
>   failure. QEMU 11's configure script falls back to 'uname -m' (x86_64)
>   when it cannot detect the host CPU.
>
> - Add 0012-meson-fix-close_range-detection-on-older-glibc.patch:
>   the meson has_function('close_range') check succeeds at link time on
>   hosts with kernel >=3D 5.9 even when glibc < 2.34 does not declare the
>   function, causing implicit declaration errors. Add a prefix include
>   so the check only succeeds when the header declares close_range().
>
> - Add 0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-s=
tructs.patch:
>   on build hosts with kernel headers < 6.0, vhost-scsi.c fails to
>   compile due to missing struct vhost_vring_worker/vhost_worker_state.
>   Include QEMU's bundled standard-headers before the system header,
>   matching the pattern already used in hw/virtio/vhost-backend.c.
>
> - Drop fix-strerrorname_np.patch (fixed upstream).
>   Drop 0001-linux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
>   (fixed upstream).
>   Drop 0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
>   (fixed upstream).
>
> AI-Generated: kiro-cli
>
> Signed-off-by: Quan Sun <Quan.Sun@windriver.com>

Hi,

Thanks for your patch.

I believe it is the source of the following build error on the
autobuilder:


ERROR: nativesdk-qemu-11.0.0-r0 do_configure: Execution of '/srv/pokybuild/=
yocto-worker/qemuarm/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nati=
vesdk-qemu/11.0.0/temp/run.do_configure.2116027' failed with exit code 1
...
| ERROR: Unknown CPU family i386, see https://wiki.yoctoproject.org/wiki/Me=
son/UnknownCPU for directions.
|
| ERROR: meson setup failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/3829
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3785
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3801
https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/3782

Can you have a look at the issue?

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


