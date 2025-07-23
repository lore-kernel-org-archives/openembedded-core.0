Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988C8C83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 12:24:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13275.1753273493784118364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 05:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67CB622E6
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 05:24:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0231E3F6A8
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 05:24:52 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lldb: don't build rpaths into binaries
Date: Wed, 23 Jul 2025 13:24:48 +0100
Message-ID: <20250723122448.2250339-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723122448.2250339-1-ross.burton@arm.com>
References: <20250723122448.2250339-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 12:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220804

LLDB defaults to adding rpaths into the binaries which are then stripped
by CMake on install.

However, this rpath removal is implemented by editing the binary instead
of relinking at install time, so the final binary will have an entry in
the dynstr section which is all nulls but is as long as the build path.

Obviously this breaks reproducibility, so disable the use of rpaths in
LLDB to remove this problem.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/lldb_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/lldb_git.bb b/meta/recipes-devto=
ols/clang/lldb_git.bb
index 4eec175ff0e..eafc3cb3128 100644
--- a/meta/recipes-devtools/clang/lldb_git.bb
+++ b/meta/recipes-devtools/clang/lldb_git.bb
@@ -24,6 +24,7 @@ EXTRA_OECMAKE =3D "-DLLDB_INCLUDE_TESTS=3DOFF \
                  -DLLVM_DIR=3D${STAGING_LIBDIR}/cmake/llvm/ \
                  -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen =
\
                  -DLLDB_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/lldb-tbl=
gen \
+                 -DLLDB_NO_INSTALL_DEFAULT_RPATH=3DON \
 "
=20
 PACKAGECONFIG ??=3D "libedit libxml2 lzma"
--=20
2.43.0


