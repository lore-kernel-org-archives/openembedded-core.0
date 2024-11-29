Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCE9D729EF
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 17:38:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.119632.1732901892109309361
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Nov 2024 09:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 191AC12FC
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 09:38:41 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4A6323F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 09:38:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] gnu-efi: remove obsolete patch
Date: Fri, 29 Nov 2024 17:38:01 +0000
Message-Id: <20241129173803.3499627-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241129173803.3499627-1-ross.burton@arm.com>
References: <20241129173803.3499627-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Nov 2024 17:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208027

The original patch in 2013[1] did this:

+-libefi.a: libefi.a($(OBJS))
++libefi.a: $(OBJS)

The Makefile no longer uses this syntax and simply replacing $^ with
$(OBJS) is a no-op, so this patch isn't needed.

[1] meta-intel c2c13d4dba2d9c70862891adf0b250ce2be65f68

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...x-parallel-make-failure-for-archives.patch | 41 -------------------
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb    |  1 -
 2 files changed, 42 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-Fix-parallel-ma=
ke-failure-for-archives.patch

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Fix-parallel-make-fail=
ure-for-archives.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Fix-parall=
el-make-failure-for-archives.patch
deleted file mode 100644
index 3c11baca0c5..00000000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Fix-parallel-make-failure-for=
-archives.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 70e30774debb9ab5d53a29c183f86fc569661b7c Mon Sep 17 00:00:00 2001
-From: Saul Wold <sgw@linux.intel.com>
-Date: Sun, 9 Mar 2014 15:22:15 +0200
-Subject: [PATCH] Fix parallel make failure for archives
-
-Upstream-Status: Pending
-
-The lib and gnuefi makefiles were using the lib.a() form which compiles
-and ar's as a pair instead of compiling all and then ar'ing which can
-parallelize better. This was resulting in build failures on larger value=
s
-of -j.
-
-See http://www.chemie.fu-berlin.de/chemnet/use/info/make/make_toc.html#T=
OC105
-for details.
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-[Rebased for 3.0.6]
-Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
-[Rebased for 3.0.8]
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- lib/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/Makefile b/lib/Makefile
-index ec1f9e3..79a794d 100644
---- a/lib/Makefile
-+++ b/lib/Makefile
-@@ -75,7 +75,7 @@ libsubdirs:
- $(OBJS): libsubdirs
-=20
- libefi.a: $(OBJS)
--	$(AR) $(ARFLAGS) $@ $^
-+	$(AR) $(ARFLAGS) $@ $(OBJS)
-=20
- clean:
- 	@rm -vf libefi.a *~ $(OBJS) */*.o
---=20
-2.25.1
-
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb b/meta/recipes-bs=
p/gnu-efi/gnu-efi_3.0.18.bb
index 092e7ed863f..b08aede69f2 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.18.bb
@@ -13,7 +13,6 @@ LIC_FILES_CHKSUM =3D "file://gnuefi/crt0-efi-arm.S;begi=
nline=3D4;endline=3D16;md5=3De582
                    "
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
-           file://0001-Fix-parallel-make-failure-for-archives.patch \
            file://0002-Do-not-treat-warnings-as-errors.patch \
            "
 SRC_URI[sha256sum] =3D "7f212c96ee66547eeefb531267b641e5473d7d8529f0bd8c=
cdefd33cf7413f5c"
--=20
2.34.1


