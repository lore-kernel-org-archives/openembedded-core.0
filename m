Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71734C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 16:03:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43624.1785945822004248887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 09:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=pSzZ86Ry;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86B0D1476
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 09:03:37 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 298213F632
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 09:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785945821; bh=q36Rod5bwf3XMpzYp3snHGqunFVnxp/dET629kT4ClM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pSzZ86RyKSuGdhl60Jd85MNSC97028CUiRUvwyXW3GzSCqjyAu0V5RsfIHa3l4lJK
	 tVLfEU3eMTUue4KQmCLTjEx2d6dlGVXVjNSUlZwDfnXFrTe0NEchVLZK1qFKplXVFq
	 3UYH5KmNVqsX+vIUPnhbgP+r/axL6oyPIC+6rlIU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] glibc: remove obsolete KSHELL assignment
Date: Wed,  5 Aug 2026 17:03:20 +0100
Message-ID: <20260805160320.41908-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805160320.41908-1-ross.burton@arm.com>
References: <20260805160320.41908-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 16:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242875

KSHELL was set so that tzselect uses /bin/sh instead of /bin/bash.

This variable doesn't exist in glibc and instead we patch the script in
0019-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch, so we can
remove this assignment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/=
glibc.inc
index 47c15c116d8..16c18bd4b6c 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -29,10 +29,6 @@ CACHED_CONFIGUREVARS:append:mipsarch =3D " libc_cv_ld_=
gnu_indirect_function=3Dno"
 GLIBC_EXTRA_OECONF ?=3D ""
 GLIBC_EXTRA_OECONF:class-nativesdk =3D ""
=20
-# We do not need bash to run tzselect script, the default is to use
-# bash but it can be configured by setting KSHELL Makefile variable
-EXTRA_OEMAKE +=3D "KSHELL=3D/bin/sh"
-
 TARGET_CC_ARCH:append:toolchain-gcc =3D " -fno-link-libatomic"
 SDK_CC_ARCH:append:toolchain-gcc =3D " -fno-link-libatomic"
=20
--=20
2.43.0


