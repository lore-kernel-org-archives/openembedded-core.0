Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDCDD116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 09:48:09 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18081.1764582485137261674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 01:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qvzpMDlJ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2CF024E419B5;
	Mon,  1 Dec 2025 09:48:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 015F7606BB;
	Mon,  1 Dec 2025 09:48:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 197B611912519;
	Mon,  1 Dec 2025 10:48:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764582481; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FRuAiF4QbValuGPC7PHklCDC+ZL3xYe9AIWSlUAkp4s=;
	b=qvzpMDlJ583C6NwOJx5YzvAratw1GxzUaKovJGjdvKnPDHHplJg22lp1HkatQGIPxtFBXO
	j2C/WmKfFuFo9UXew32/8Fzesvwt+Y26SpVfMr+79NRL6FvoLuKgR7ljwPgaeRgmwK/kgp
	NdCcQxoL5BNViULkhaUCadY4bDAvUDV23j1apphz6mKVgrhxVu0HMLLppdCu2jhCU6pt8j
	7wdy85+dn6XAyH6FzEOOboPgdvHFOp7cnPUbwUYcnRRdtaAKstEdpKGbeKC/xk0Gmt/xjp
	qZGyl3CLWjcO4Mm5uGcPTq7wRrFVPCNgf0FWKxgXOezrOmVh0PeE2SH72KelDg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Dec 2025 10:48:00 +0100
Message-Id: <DEMSA8KMSGGU.2SN8ACG42NG35@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <yoann.congal@smile.fr>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 0/5] Kernel Rust out-of-tree module
 support
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251119195540.2671856-1-yoann.congal@smile.fr>
In-Reply-To: <20251119195540.2671856-1-yoann.congal@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 09:48:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227119

On Wed Nov 19, 2025 at 8:55 PM CET, Yoann Congal via lists.openembedded.org=
 wrote:
> As followup of Harish Sadineni's RFC series "Enable rust support for
> linux kernel" [0] (and to increase its test coverage), this series add
> support for out-of-tree kernel module written in Rust as well as
> associated test.
>
> [0]: https://lists.openembedded.org/g/openembedded-core/message/226560
>
> Yoann Congal (5):
>   kernel.bbclass: Export artifacts needed for out-of-tree Rust
>     compilation
>   module.bbclass: Prepare out-of-tree rust module compilation
>   meta-skeleton: Add rust-out-of-tree-module recipe
>   rust-out-of-tree-module: Add myself as maintainer
>   runtime_test: Add rust-out-of-tree selftest
>
>  .../rust-out-of-tree-module_git.bb             | 18 ++++++++++++++++++
>  meta/classes-recipe/kernel.bbclass             | 18 ++++++++++++++++++
>  meta/classes-recipe/module.bbclass             |  8 ++++++++
>  meta/conf/distro/include/maintainers.inc       |  1 +
>  meta/lib/oeqa/selftest/cases/runtime_test.py   |  9 ++++++++-
>  5 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/=
rust-out-of-tree-module_git.bb

Hi Yoann,

I ran a few RFC series on the autobuilder, and I suspect this one of
these two issues, during oe-selftests.

First issues:

2025-11-29 08:23:13,186 - oe-selftest - INFO - 2: 6/31 214/648 (110.21s) (0=
 failed) (distrodata.Distrodata.test_maintainers)
2025-11-29 08:23:13,186 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/distrodata.py", line 115, in test_=
maintainers
    self.fail("""
  File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
    raise self.failureException(msg)
AssertionError:
Unable to find recipes for the following entries in maintainers.inc:
rust-out-of-tree-module

I saw you added something, but for some reason the test is not happy.

Second issues:

ERROR: core-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Command '=
/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-179319/tmp/w=
ork/qemuarm64-poky-linux/core-image-minimal/1.0/recipe-sysroot-native/usr/b=
in/dnf -v --rpmverbosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/oe-selfte=
st-armhost/build/build-st-179319/tmp/work/qemuarm64-poky-linux/core-image-m=
inimal/1.0/rootfs/etc/dnf/dnf.conf --setopt=3Dreposdir=3D/srv/pokybuild/yoc=
to-worker/oe-selftest-armhost/build/build-st-179319/tmp/work/qemuarm64-poky=
-linux/core-image-minimal/1.0/rootfs/etc/yum.repos.d --installroot=3D/srv/p=
okybuild/yocto-worker/oe-selftest-armhost/build/build-st-179319/tmp/work/qe=
muarm64-poky-linux/core-image-minimal/1.0/rootfs --setopt=3Dlogdir=3D/srv/p=
okybuild/yocto-worker/oe-selftest-armhost/build/build-st-179319/tmp/work/qe=
muarm64-poky-linux/core-image-minimal/1.0/temp --repofrompath=3Doe-repo,/sr=
v/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-179319/tmp/work=
/qemuarm64-poky-linux/core-image-minimal/1.0/oe-rootfs-repo --nogpgcheck in=
stall kernel-module-rust-minimal kernel-module-rust-out-of-tree packagegrou=
p-core-boot run-postinsts ssh-pregen-hostkeys' returned 1:
...
No match for argument: kernel-module-rust-out-of-tree
Error: Unable to find a match: kernel-module-rust-out-of-tree
kernel-module-rust-out-of-tree is neither a recipe nor a generated package.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2915
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2777
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2672

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


