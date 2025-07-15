Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30513C83F34
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 14:46:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10303.1752590810023713536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 07:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6D8C12FC;
	Tue, 15 Jul 2025 07:46:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1DCC53F694;
	Tue, 15 Jul 2025 07:46:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter.Marko@siemens.com
Subject: [PATCH] clang: set CVE_PRODUCT
Date: Tue, 15 Jul 2025 15:46:46 +0100
Message-ID: <20250715144646.1863656-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 14:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220302

There are a number of recipes that are part of the LLVM Project, so set
CVE_PRODUCT to llvm:llvm in common.inc to ensure that all of the recipes
are covered.

Also add llvm:clang in the clang recipe, as there are a number of CVEs
with that product name.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 2 ++
 meta/recipes-devtools/clang/common.inc   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 4cbe22f4546..21f64fa9472 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -19,6 +19,8 @@ require common-source.inc
=20
 BPN =3D "clang"
=20
+CVE_PRODUCT +=3D "llvm:clang"
+
 INHIBIT_DEFAULT_DEPS:class-native =3D "1"
=20
 LDFLAGS:append:class-target:riscv32 =3D " -Wl,--no-as-needed -latomic -W=
l,--as-needed"
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
index a9d6f899c03..a49aa64f79e 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -71,3 +71,5 @@ B ?=3D "${WORKDIR}/llvm-project-source-${PV}/build.${HO=
ST_SYS}.${TARGET_SYS}"
 # The real WORKDIR location isn't a dependency for the shared workdir.
 src_patches[vardepsexclude] =3D "WORKDIR"
 should_apply[vardepsexclude] +=3D "PN"
+
+CVE_PRODUCT =3D "llvm:llvm"
--=20
2.43.0


