Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8EC8B600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 12:40:32 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1bIbGi-00025B-K4 from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2016 05:40:32 -0700
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Thu, 30 Jun 2016 13:40:31 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jun 2016 17:40:22 +0500
Message-ID: <1467290422-19660-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] mesa: move crypto configs to versioned recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2016 12:40:33 -0000
Content-Type: text/plain

Fixes
WARNING: mesa-2_11.0.8+gitAUTOINC+b9b19162ee-r0 do_configure: QA Issue: mesa: configure was passed unrecognised options: --with-sha1 [unknown-configure-option]
for git based recipe as it is on an older version of mesa
which does not support crypto configs.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-graphics/mesa/mesa.inc       | 6 ------
 meta/recipes-graphics/mesa/mesa_11.2.2.bb | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1d084c0..b227abc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -64,12 +64,6 @@ PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --enable-llvm-shared-libs,
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
 
-# Mesa requires one of the following crypto implementation, pick one of them
-MESA_CRYPTO ??= "openssl"
-PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
-PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
-PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
-
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
diff --git a/meta/recipes-graphics/mesa/mesa_11.2.2.bb b/meta/recipes-graphics/mesa/mesa_11.2.2.bb
index a864b54..87c12c8 100644
--- a/meta/recipes-graphics/mesa/mesa_11.2.2.bb
+++ b/meta/recipes-graphics/mesa/mesa_11.2.2.bb
@@ -1,5 +1,11 @@
 require ${BPN}.inc
 
+# Mesa requires one of the following crypto implementation, pick one of them
+MESA_CRYPTO ??= "openssl"
+PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
+PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
+PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
+
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
            file://replace_glibc_check_with_linux.patch \
 "
-- 
1.9.1


