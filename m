Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6B3CD5BD1
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 06:41:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5175.1779950477496164543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 23:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Upf4idAQ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0FDD91A0718
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 06:41:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BD13D60495;
	Thu, 28 May 2026 06:41:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E48010888BA3;
	Thu, 28 May 2026 08:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779950474; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vJ2+01YoISZT8+m29KaJbGBv102/CtCQnnG1wObcPPw=;
	b=Upf4idAQA6MHEwdnchZcD4keKjlYmQZJvqUnMe1Vvtc1Scl05/CjlrYJ/AQPW+qxntSlyR
	cjcsH4WoHW8O+HoPl2K/mNY4x7wRVlDPV1Oa9TM9YFUFIW97JJP+HhbZUMU8AUg0GzAAkR
	KeT8qeqQBE883Kf8aULJ0PiFETDuK4GCICH4QiTEIZTRVnGcMdeZ0k9AdZkWsr4/miYHDi
	e72CPIcy/oyt+lr4kmczBLKewzNgHK+mo2QDhDWeeRQtRT+k+ya37yc0B/xreGIL5WPu5U
	vpI7QE6qcLoRzaxqPb8EV5fyM1orNp1ztc1CemNfZM6hC46oaAV1GzRayvekqA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 08:41:10 +0200
Message-Id: <DIU3S5LEPNUH.20UQOI5CFBMOZ@bootlin.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Quan.Sun@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260526191937.3144814-1-Quan.Sun@windriver.com>
In-Reply-To: <20260526191937.3144814-1-Quan.Sun@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 06:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237693

On Tue May 26, 2026 at 9:19 PM CEST, Quan Sun via lists.openembedded.org wr=
ote:
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
>   any 32-bit host architecture. Add COMPATIBLE_HOST for class-target and
>   class-nativesdk to restrict builds to 64-bit architectures.
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
> ---

Hi,

Thanks for the new version.

We now get the following error on several builds:

ERROR: Nothing RPROVIDES 'nativesdk-qemu' (but /srv/pokybuild/yocto-worker/=
qemux86/build/layers/openembedded-core/meta/recipes-core/packagegroups/nati=
vesdk-packagegroup-sdk-host.bb, /srv/pokybuild/yocto-worker/qemux86/build/l=
ayers/openembedded-core/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.=
0.bb RDEPENDS on or otherwise requires it)
nativesdk-qemu was skipped: incompatible with host i686-pokysdk-linux (not =
in COMPATIBLE_HOST)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/3836
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3792
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3808

Based on your previous message, this is probably expected. But either we
have to find a way around it or to disable it.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


