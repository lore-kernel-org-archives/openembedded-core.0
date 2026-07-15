Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2973C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 11:02:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3737.1784113366086706114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 04:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=sbgffNjs;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 645031477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 04:02:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5BED63F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 04:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784113365; bh=UOlih+eDvV70kGBA5xgVRs3NKCXzmCaFi99eINc/kqo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sbgffNjs7vM0hoK2m0SPkakeNvOIMwGOLB7+Eyf0Nkbndj0uKT3jDarCVzR89aCan
	 V69Uv1DAC1G/JCePcfiwBovg87x8ELJB6jyYOaFZOu7wQx16XedhtLzD0DwZ02nSrU
	 AtpFi3SklxBtNcY09BzopFu9cvkFeTnIyz3ZFhbc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] gcc: remove LSB-specific overrides
Date: Wed, 15 Jul 2026 12:02:36 +0100
Message-ID: <20260715110237.1692760-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715110237.1692760-1-ross.burton@arm.com>
References: <20260715110237.1692760-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 11:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240946

The linuxstdbase override was used by the poky-lsb distribution, which
aimed to be compatible with the Linux Standard Base specification.

LSB is long-dead and poky-lsb was removed back in 2018 with the thud
release[1].

Clarify the recipe by deleting these obsolete and unused assignments.

[1] meta-yocto 00fdefff55 ("poky-altcfg: Replace poky-lsb with poky-altcf=
g")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 -
 meta/recipes-devtools/gcc/gcc-target.inc  | 2 --
 2 files changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-dev=
tools/gcc/gcc-runtime.inc
index e305180c64f..d58cbe9c1a7 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -18,7 +18,6 @@ EXTRA_OECONF_PATHS =3D "\
 TARGET_CC_ARCH +=3D "-fno-link-libatomic"
 SDK_CC_ARCH +=3D "-fno-link-libatomic"
=20
-EXTRA_OECONF:append:linuxstdbase =3D " --enable-clocale=3Dgnu"
 EXTRA_OECONF:append =3D " --cache-file=3D${B}/config.cache"
 EXTRA_OECONF:append:libc-newlib =3D " --with-newlib --with-target-subdir=
"
 EXTRA_OECONF:append:libc-picolibc =3D " --with-newlib --with-target-subd=
ir"
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devt=
ools/gcc/gcc-target.inc
index 6b47c10413a..40e026f59e6 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -6,8 +6,6 @@ EXTRA_OECONF_PATHS =3D "\
     --with-build-sysroot=3D${STAGING_DIR_TARGET} \
 "
=20
-EXTRA_OECONF:append:linuxstdbase =3D " --enable-clocale=3Dgnu"
-
 # Configure gcc running on the target to default to an architecture whic=
h will
 # be compatible with that of gcc-runtime (which is cross compiled to be =
target
 # specific). For example, for ARM, ARMv6+ adds atomic instructions that =
may
--=20
2.43.0


