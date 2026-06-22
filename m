Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BCCCDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 13:21:14 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43027.1782134470740017930
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 06:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Xv5RvKQQ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 36AC7C6220C
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:21:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0FE6A601BB;
	Mon, 22 Jun 2026 13:21:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20A2E106C8ACE;
	Mon, 22 Jun 2026 15:21:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782134468; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=al5KpqM3Wzkdjv1bg//Hqlja04SGolkWZJ/sZ7N0Nno=;
	b=Xv5RvKQQ9B5+Q8ov4U89oHNU4fkMfSs8sa5Su1r96GmWn1s9wOj1AZ0OQ3fZvY2rtNj0DG
	gozqQyheXGPpMRzmGCaEuHDVK5xqUaN2kASJBrffMbIMe5XDpFFwyKqzYFuP65hhSMltl6
	VvxQ2TxHNYoywMNf+vCwnUkEfhl7Shb4aM1uRKJIPUWRVycGKtfhB1yw10DjrWSE3orsU4
	g1Sbt/c7lthEn/7xj/TCURee+KCCZlTozozpjZ8MUKn+pmf9IsOHSpXcyze48DmzNLLvVH
	6KZJvXdjLD0YAOFZe/u0qsRRxv42qxks10oJqDSsQ37oE9Xg9/f8A25O65Ir1g==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH 3/4] clang/llvm: add missing instance of Distro class in Linux.cpp
Date: Mon, 22 Jun 2026 15:20:20 +0200
Message-ID: <20260622132021.37598-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260622132021.37598-1-joaomarcos.costa@bootlin.com>
References: <20260622132021.37598-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239293

As in the own patch's message:

This instance will be used to perform the checks added by do_preconfigure
task, such as "Distro.IsOpenEmbedded()", or "Distro.IsPOKY()".

Without such instance, the compiler raises an "expected unqualified-id" e=
rror.

Something similar is performed by another patch, by the way:

0009-clang-Define-releative-gcc-installation-dir.patch:+  Distro Distro(D=
.getVFS(), TargetTriple);
0009-clang-Define-releative-gcc-installation-dir.patch:+           Distro=
.IsOpenEmbedded()},

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 ...istro-instance-to-getMultiarchTriple.patch | 35 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0001-llvm-clang-Add=
-Distro-instance-to-getMultiarchTriple.patch

diff --git a/meta/recipes-devtools/clang/clang/0001-llvm-clang-Add-Distro=
-instance-to-getMultiarchTriple.patch b/meta/recipes-devtools/clang/clang=
/0001-llvm-clang-Add-Distro-instance-to-getMultiarchTriple.patch
new file mode 100644
index 0000000000..90dd51865b
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0001-llvm-clang-Add-Distro-instan=
ce-to-getMultiarchTriple.patch
@@ -0,0 +1,35 @@
+From ef7b8a5409c9a1789c6e6679a7e67e8cebe7ab6f Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Jo=3DC3=3DA3o=3D20Marcos=3D20Costa?=3D <joaomarcos.cos=
ta@bootlin.com>
+Date: Sun, 21 Jun 2026 17:33:10 +0000
+Subject: [PATCH] llvm/clang: Add Distro instance to getMultiarchTriple()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This instance will be used to perform the checks added by do_preconfigur=
e
+task, such as "Distro.IsOpenEmbedded()", or "Distro.IsPOKY()".
+
+Without such instance, the compiler raises an "expected unqualified-id" =
error.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/To=
olChains/Linux.cpp
+index c6d6e20db..52c27f559 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -45,6 +45,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+   bool IsAndroid =3D TargetTriple.isAndroid();
+   bool IsMipsR6 =3D TargetTriple.getSubArch() =3D=3D llvm::Triple::Mips=
SubArch_r6;
+   bool IsMipsN32Abi =3D TargetTriple.getEnvironment() =3D=3D llvm::Trip=
le::GNUABIN32;
++  Distro Distro(D.getVFS(), TargetTriple);
+=20
+   // For most architectures, just use whatever we have rather than tryi=
ng to be
+   // clever.
+--=20
+2.39.5
+
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
index 441ea099a9..19b43d6613 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -60,6 +60,7 @@ SRC_URI =3D "\
     file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.p=
atch \
     file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.pat=
ch \
     file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.pat=
ch \
+    file://0001-llvm-clang-Add-Distro-instance-to-getMultiarchTriple.pat=
ch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??=3D ""
--=20
2.47.0


