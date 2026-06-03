Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB1BCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 12:33:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19075.1780490018666493034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 05:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XsyGwy49;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 57DA21A0108
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jun 2026 12:33:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28C266029E;
	Wed,  3 Jun 2026 12:33:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE61810888413;
	Wed,  3 Jun 2026 14:33:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780490015; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fKLjm3MMRfS18BXAWadm5XhngEFAfL25ErtIXQuVi9I=;
	b=XsyGwy49D7m4UGliX8QMRkV+fqkNLpa52iJHCdJ6JPVfUMm73SVsIT20MOpwb8sk5ybQ3q
	r7DRAI5aifGoP9SQWpImL4JVcubfcZfnTSc7JMbqkWnJYd6y+9+uPDHEs6XyO2SRkw4vmQ
	srAVX81WCvH/RdA/3W9bd4y0mIDqNUQT851w3oxv8TcE9WCaZe/OMYAo4DrfS2U41igXLJ
	g2SaTVBrLJuOoPY7T91Rg9sbxbuuxUp/4KiwGCI/CfXlXUxuuOgPgMg88fuYDdTWUIuAER
	A91eGZwZZdEWXYmu1DxNSGiE0zRyi6gZxyXzFRQ2nzekJaEWj3WQtF8RnMvKEA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 14:33:34 +0200
Message-Id: <DIZF18MG982K.1Y7D5ETMYWTR6@bootlin.com>
To: <sivakumar.bs@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] qemuboot.bbclass: add missing task
 dependency on kernel deploy
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602114204.1646653-1-sivakumar.bs@gmail.com>
In-Reply-To: <20260602114204.1646653-1-sivakumar.bs@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 12:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238094

On Tue Jun 2, 2026 at 1:42 PM CEST, Siva Balasubramanian via lists.openembe=
dded.org wrote:
> do_write_qemuboot_conf had no dependency on the kernel deploy task,
> so if the kernel was rebuilt without invalidating the rootfs sstate,
> the task was skipped and .qemuboot.conf was left stale while new
> image artifacts were deployed with a new timestamp suffix.
>
> Add do_write_qemuboot_conf[depends] on KERNEL_DEPLOY_DEPEND using a
> Python expression to guard against the empty case, since baremetal
> images (which inherit qemuboot via baremetal-image.bbclass) do not
> set KERNEL_DEPLOY_DEPEND.
>
> KERNEL_DEPLOY_DEPEND is defined with ?=3D in image.bbclass and is
> already used by do_build[depends] for the same reason.
>
> Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14520
> Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> ---

Hi Siva,

Thanks for the new version.

It looks like we still have a failing selftest:

2026-06-02 20:22:55,502 - oe-selftest - INFO - fitimage.KernelFitImageRecip=
eTests.test_fit_image_sign_initramfs_bundle (subunit.RemotedTestCase)
2026-06-02 20:22:55,503 - oe-selftest - INFO -  ... FAIL
...
Initialising tasks...ERROR: 4014 unbuildable tasks were found.
These are usually caused by circular dependencies and any circular dependen=
cy chains found will be printed below. Increase the debug level to see a li=
st of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR:
Dependency loop #1 found:
  Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openemb=
edded-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_imag=
e (dependent Tasks ['core-image-minimal-initramfs.bb:do_flush_pseudodb', 'c=
ore-image-minimal-initramfs.bb:do_image_qa', 'core-image-minimal-initramfs.=
bb:do_write_qemuboot_conf', 'core-image-minimal-initramfs.bb:do_rootfs', 'c=
ore-image-minimal-initramfs.bb:do_create_rootfs_spdx'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openemb=
edded-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_imag=
e_cpio (dependent Tasks ['cpio_2.15.bb:do_populate_sysroot', 'core-image-mi=
nimal-initramfs.bb:do_image'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openemb=
edded-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_imag=
e_complete (dependent Tasks ['u-boot_2026.04.bb:do_populate_sysroot', 'core=
-image-minimal-initramfs.bb:do_image_cpio', 'qemu-helper-native_1.0.bb:do_a=
ddto_recipe_sysroot', 'core-image-minimal-initramfs.bb:do_image', 'qemu-hel=
per-native_1.0.bb:do_populate_sysroot', 'qemu-native_10.2.0.bb:do_populate_=
sysroot', 'qemu-system-native_10.2.0.bb:do_populate_sysroot'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openemb=
edded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_bundle_initramf=
s (dependent Tasks ['linux-yocto_6.18.bb:do_install', 'core-image-minimal-i=
nitramfs.bb:do_image_complete'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openemb=
edded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_transform_bundl=
ed_initramfs (dependent Tasks ['linux-yocto_6.18.bb:do_bundle_initramfs'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openemb=
edded-core/meta/recipes-kernel/linux/linux-yocto_6.18.bb:do_deploy (depende=
nt Tasks ['pigz_2.8.bb:do_populate_sysroot', 'linux-yocto_6.18.bb:do_bundle=
_initramfs', 'linux-yocto_6.18.bb:do_transform_bundled_initramfs', 'linux-y=
octo_6.18.bb:do_install', 'depmodwrapper-cross_1.0.bb:do_populate_sysroot',=
 'linux-yocto_6.18.bb:do_packagedata', 'linux-yocto_6.18.bb:do_populate_sys=
root'])
  Task /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openemb=
edded-core/meta/recipes-core/images/core-image-minimal-initramfs.bb:do_writ=
e_qemuboot_conf (dependent Tasks ['core-image-minimal-initramfs.bb:do_rootf=
s', 'linux-yocto_6.18.bb:do_deploy'])
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4039
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3951
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3809

Can you have a look at the issue?
The configuration used to reproduce can be found in the "OE Selftest:
Add layers" and "OE Selftest: Write config" steps.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


