Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8A2CDB479
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 12:08:44 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19595.1782216521975713887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 05:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=xNVFn832;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DAAF9C6B385;
	Tue, 23 Jun 2026 12:08:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 55442601C2;
	Tue, 23 Jun 2026 12:08:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45EDB106C83D2;
	Tue, 23 Jun 2026 14:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782216519; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/KFx5Ml7LoYLZjYto6yvCt15J+C+Hg2Hgz4Bv5lKBKk=;
	b=xNVFn832obmDzaqxSkNw+kFPXpuL0IiHSaSPTrwWf+oYEANO58xjxTeH7HFiWK/S5j4F6d
	zgLYpiY+nPOiJ21KKd3KsbkOvS2gEBJltwhONwOKg3cxaevoAQXSBNlUMsnpmgeGQOVCmC
	eYn2x2D5aen3vee+ZHqiZg+k5dMhzxLF0KTS0D6Uzykw+ZZSS0RSlLvj+Aub3DxAUIkncW
	HobSC2UlpUZo1xK7+K+TFUJPbdp/ILRb+0F0DsiHFfeJYEUrWmnxmig0PP2GQsCAFbUYyW
	0dSdZAN6qzNzTGEw7aySwoYevSHQEPZJAAWG204CNV0cmHUKGcmW6PMue0N3Gw==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 3/5] clang/llvm: add missing instance of Distro class in Linux.cpp
Date: Tue, 23 Jun 2026 14:08:16 +0200
Message-ID: <20260623120818.110754-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
References: <20260623120818.110754-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 12:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239362

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
 ...t-anchor-for-adding-OE-distro-vendor.patch | 35 ++++++++++++++-----
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anc=
hor-for-adding-OE-distro-vendor.patch b/meta/recipes-devtools/clang/clang=
/0016-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch
index c36d2973e6..674a3b264e 100644
--- a/meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anchor-for=
-adding-OE-distro-vendor.patch
+++ b/meta/recipes-devtools/clang/clang/0016-llvm-clang-Insert-anchor-for=
-adding-OE-distro-vendor.patch
@@ -1,7 +1,10 @@
-From b14d66e6250566fb0b7786af92e3e83bade51c90 Mon Sep 17 00:00:00 2001
+From 259d8eb2ed82c9248387a3cbb1befee358ecbb8e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 25 Jan 2021 16:14:35 +0800
 Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor n=
ames
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
=20
 This helps in making right detection for OE built gcc toolchains
=20
@@ -82,22 +85,25 @@ b59da142f2b0:$ /path/to/x86_64-linux/compiler-rt-nati=
ve/13.0.1-r0/recipe-sysroot
 programs: =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.=
1-r0/recipe-sysroot-native/usr/bin
 libraries: =3D/build/tmp-glibc/work/x84_64-linux/compiler-rt-native/13.0=
.1-r0/recipe-sysroot-native/usr/lib/clang/13.0.1:/usr/lib/x86_64-wrs-linu=
x/10.2.0://lib/x86_64-wrs-linux://usr/lib/x86_64-wrs-linux:/build/tmp-gli=
bc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/u=
sr/bin/../lib://lib://usr/lib
=20
+[JM: add missing instance of Distro class in getMultiarchTriple(), at Li=
nux.cpp]
+
 Upstream-Status: Inappropriate [oe specific]
=20
 Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
 ---
  clang/include/clang/Driver/Distro.h   | 2 ++
  clang/lib/Driver/Distro.cpp           | 1 +
  clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
- clang/lib/Driver/ToolChains/Linux.cpp | 1 +
+ clang/lib/Driver/ToolChains/Linux.cpp | 2 ++
  llvm/lib/TargetParser/Triple.cpp      | 2 +-
- 5 files changed, 6 insertions(+), 1 deletion(-)
+ 5 files changed, 7 insertions(+), 1 deletion(-)
=20
 diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clang/D=
river/Distro.h
-index 0e17b30eb7e8..b449a62dc299 100644
+index 0e17b30eb..b449a62dc 100644
 --- a/clang/include/clang/Driver/Distro.h
 +++ b/clang/include/clang/Driver/Distro.h
 @@ -45,6 +45,7 @@ public:
@@ -117,7 +123,7 @@ index 0e17b30eb7e8..b449a62dc299 100644
  };
 =20
 diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cpp
-index df10458d092d..61dc127a4574 100644
+index df10458d0..61dc127a4 100644
 --- a/clang/lib/Driver/Distro.cpp
 +++ b/clang/lib/Driver/Distro.cpp
 @@ -43,6 +43,7 @@ static Distro::DistroType DetectOsRelease(llvm::vfs::F=
ileSystem &VFS) {
@@ -129,7 +135,7 @@ index df10458d092d..61dc127a4574 100644
    return Version;
  }
 diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/Tool=
Chains/Gnu.cpp
-index c80980a7fb09..80fd8058bd98 100644
+index c80980a7f..80fd8058b 100644
 --- a/clang/lib/Driver/ToolChains/Gnu.cpp
 +++ b/clang/lib/Driver/ToolChains/Gnu.cpp
 @@ -2370,6 +2370,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefa=
ultGCCPrefixes(
@@ -141,10 +147,18 @@ index c80980a7fb09..80fd8058bd98 100644
    static const char *const X32Triples[] =3D {"x86_64-linux-gnux32",
                                             "x86_64-pc-linux-gnux32"};
 diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/To=
olChains/Linux.cpp
-index 7b608a84a66e..4a0adedce09a 100644
+index 7b608a84a..585a86a2d 100644
 --- a/clang/lib/Driver/ToolChains/Linux.cpp
 +++ b/clang/lib/Driver/ToolChains/Linux.cpp
-@@ -81,6 +81,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
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
+@@ -81,6 +82,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
        return "x86_64-linux-android";
      if (TargetEnvironment =3D=3D llvm::Triple::GNUX32)
        return "x86_64-linux-gnux32";
@@ -153,7 +167,7 @@ index 7b608a84a66e..4a0adedce09a 100644
    case llvm::Triple::aarch64:
      if (IsAndroid)
 diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Tr=
iple.cpp
-index a4f9dd42c0fe..86b74451ec0d 100644
+index a4f9dd42c..86b74451e 100644
 --- a/llvm/lib/TargetParser/Triple.cpp
 +++ b/llvm/lib/TargetParser/Triple.cpp
 @@ -702,7 +702,7 @@ static Triple::VendorType parseVendor(StringRef Vend=
orName) {
@@ -165,3 +179,6 @@ index a4f9dd42c0fe..86b74451ec0d 100644
        .Default(Triple::UnknownVendor);
  }
 =20
+--=20
+2.39.5
+
--=20
2.43.0


