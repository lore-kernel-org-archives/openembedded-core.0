Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBFBCA5FED
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 16:54:07 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9097.1791046438012109396
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 09:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=v+Cnh7a5;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 160394E41136;
	Sat,  3 Oct 2026 16:53:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C757E604FF;
	Sat,  3 Oct 2026 16:53:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74D1B1032827F;
	Sat,  3 Oct 2026 18:53:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791046434; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fu6mqGLXjuePvaNKjAp3YAsopvm6ogudv8mGoX8KMYc=;
	b=v+Cnh7a5yyhgal0iJ07mKbLH6Cs5YIBVWzF4QKNEQ6ub6lJ7rwHfk/I8B0X+vR+6ADJEQW
	+CxYciguNoYmm284TVRsKS6JXkxcK433sYNkPtJ7kf1qRqBWDv/FcKQH78l78YAu4SeaHu
	ZqMcdNLJzA2AM6AmohCUbrjP9Siy3UjUKcP0Kub4fLYnE8zfhyBeoGwmf1r5idR/lRqQTU
	VPN5RorsVe68sXHSNsmAV4GR0Ke1MggabTN9pwAazdgBNc7BOALTGPu0GCSuY3hwp54dMs
	3vfvh61heMPaTcNmLNMaW+nu1HV1gOpX4xSrydD8a3kPoddFGbXN4bbJO/Q/nQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 18:53:52 +0200
Message-Id: <DLVCZ02OB7VU.1BT53QY17WM3K@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <andrej.kozemcak@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] runqemu: support rootfs-dbg flag in
 QB_FSINFO
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261002114848.1126256-1-andrej.kozemcak@siemens.com>
 <20261002114848.1126256-2-andrej.kozemcak@siemens.com>
In-Reply-To: <20261002114848.1126256-2-andrej.kozemcak@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 16:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247171

On Fri Oct 2, 2026 at 1:48 PM CEST, Andrej Kozemcak via lists.openembedded.=
org wrote:
> Add parsing for a new 'rootfs-dbg' flag on tar-based filesystem
> types in QB_FSINFO. When set, runqemu appends '-dbg' to the
> IMAGE_LINK_NAME used to locate the rootfs tarball for NFS
> extraction, allowing use of the debug rootfs variant.
>
> QB_FSINFO: additional filesystem metadata, as a space-separated list of
> "fstype:flag" entries, e.g., "wic:no-kernel-in-fs tar:rootfs-dbg"
> Supported flags include "wic:no-kernel-in-fs" or "wic:kernel-in-fs"
> to select whether a WIC image contains the kernel in the filesystem,
> and "tar:rootfs-dbg" to tell runqemu to use the debug rootfs image.
>
> Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
> ---

Hi Andrej,

It looks like one of the tests is failing:

2026-10-03 14:58:26,482 - oe-selftest - INFO - runtime_test.TestImage.test_=
testimage_nfs (subunit.RemotedTestCase)
2026-10-03 14:58:26,483 - oe-selftest - INFO -  ... FAIL
...
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/scripts/runqemu", line 1810, in main
    config.setup_rootfs()
    ~~~~~~~~~~~~~~~~~~~^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/scripts/runqemu", line 1306, in setup_rootfs
    shutil.copyfile(self.rootfs, newrootfs)
    ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-33360=
67/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/recipe-sysroot-nati=
ve/usr/lib/python3.14/shutil.py", line 313, in copyfile
    with open(src, 'rb') as fsrc:
         ~~~~^^^^^^^^^^^
IsADirectoryError: [Errno 21] Is a directory: '/srv/pokybuild/yocto-worker/=
oe-selftest-debian/build/build-st-3336067/tmp/deploy/images/qemux86-64/oe-s=
elftest-image-qemux86-64.rootfs-dbg-nfsroot'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4994

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


