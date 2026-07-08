Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DA8C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:11:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6067.1783509074114058044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=R00f8vHd;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C3131F37
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 04:11:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 655F43F85F
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 04:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783509073; bh=nc/useItsi6LkJsFbP3rjROa8OPJ4O/ofWt1NDZhpGc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R00f8vHdHY8hLnSN2zR+5lv+HkNj5ySBI7wiwZa4KUvy2B0Hu+bcYMkJO626eTxkb
	 CjrLd2ipp9xCe6tvktn2T3K9QumuScVpiVrn0YQfp8BtgwdW2j0B27tkjdtgJyjpx7
	 byDDtIAPts7fYTjmt78pVsm9RAhePSuBo5bCJ1bc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] mesa-demos: switch to fetching from git instead of tarballs
Date: Wed,  8 Jul 2026 12:11:05 +0100
Message-ID: <20260708111108.3577325-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708111108.3577325-1-ross.burton@arm.com>
References: <20260708111108.3577325-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:11:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240459

Upstream don't plan on making new releases of mesa-demos as it's mostly
demos and test applications.  As a first step to moving to git, this
changes the fetching of a tarball to the fetching of the git tag that
the tarball was generated from.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipe=
s-graphics/mesa/mesa-demos_9.0.0.bb
index 0bc8519e90..593bc0147e 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -9,10 +9,11 @@ LICENSE =3D "MIT & PD"
 LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;beginline=3D1;endline=
=3D20;md5=3D914225785450eff644a86c871d3ae00e \
                     file://src/xdemos/glxdemo.c;beginline=3D1;endline=3D=
8;md5=3Db01d5ab1aee94d35b7efaa2ef48e1a06"
=20
-SRC_URI =3D "https://archive.mesa3d.org/demos/${BPN}-${PV}.tar.xz \
+SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttp=
s;branch=3Dmain;tag=3D${BP} \
            file://0001-meson-fix-glx-detection-without-glvnd.patch \
            "
-SRC_URI[sha256sum] =3D "3046a3d26a7b051af7ebdd257a5f23bfeb160cad6ed95232=
9cdff1e9f1ed496b"
+
+SRCREV =3D "661681767bfb4e8f136aac1fd7934e6b0fa46d29"
=20
 inherit meson pkgconfig features_check
 # depends on virtual/egl, virtual/libgl ...
--=20
2.43.0


