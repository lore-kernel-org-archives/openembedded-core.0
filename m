Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9D9C61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 14:06:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.41298.1700575571012262632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 06:06:11 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D64C7FEC;
	Tue, 21 Nov 2023 06:06:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AAD1F3F7A6;
	Tue, 21 Nov 2023 06:06:09 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] rust-llvm: remove python3native dependency
Date: Tue, 21 Nov 2023 14:06:07 +0000
Message-Id: <20231121140607.2660791-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 14:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190982

From: Ross Burton <ross.burton@arm.com>

LLVM doesn't actually need a native Python3 as the host Python is
sufficient, but as it then looks at the host for optional Python
dependencies explicitly disable their detection so that rust-llvm
remains deterministic.  As this is a minimal LLVM for Rust, we don't
need the optviewer tool.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rust/rust-llvm_1.70.0.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.70.0.bb
index 09e4c65be38..57bbe79cdf1 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
@@ -16,7 +16,7 @@ S =3D "${RUSTSRC}/src/llvm-project/llvm"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b8=
93c9afe"
=20
-inherit cmake python3native
+inherit cmake
=20
 DEPENDS +=3D "ninja-native rust-llvm-native"
=20
@@ -47,6 +47,15 @@ EXTRA_OECMAKE =3D " \
     -DLLVM_TARGET_ARCH=3D${TARGET_ARCH} \
     -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust \
 "
+
+# Forcibly disable the detection of these packages as otherwise
+# it will look at the host Python install
+EXTRA_OECMAKE +=3D "\
+    -DPY_PYGMENTS_FOUND=3DOFF \
+    -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DOFF \
+    -DPY_YAML_FOUND=3DOFF \
+"
+
 EXTRA_OECMAKE:append:class-target =3D "\
     -DLLVM_BUILD_TOOLS=3DOFF \
     -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
--=20
2.34.1


