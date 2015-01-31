Return-Path: <Pengyu.Ma@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5F856AC1E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Jan 2015 04:44:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0V4iNMx019658
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 20:44:23 -0800 (PST)
Received: from pek-bsp-build1.wrs.com (128.224.179.105) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 30 Jan 2015 20:44:23 -0800
From: Pengyu Ma <pengyu.ma@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <pengyu.ma@windriver.com>
Date: Sat, 31 Jan 2015 12:39:29 +0800
Message-ID: <1422679169-30177-1-git-send-email-pengyu.ma@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [meta-oe][V2][PATCH] mesa: Upgrade to 10.4.3
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
X-List-Received-Date: Sat, 31 Jan 2015 04:44:31 -0000
Content-Type: text/plain

flags for EGL and GBM Gallium had been removed in 10.4,
so remove these flags.

Signed-off-by: Pengyu Ma <pengyu.ma@windriver.com>
---
 meta/recipes-graphics/mesa/{mesa-gl_10.3.4.bb => mesa-gl_10.4.3.bb} | 0
 meta/recipes-graphics/mesa/mesa.inc                                 | 2 --
 meta/recipes-graphics/mesa/{mesa_10.3.4.bb => mesa_10.4.3.bb}       | 4 ++--
 meta/recipes-graphics/mesa/mesa_git.bb                              | 4 ++--
 4 files changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_10.3.4.bb => mesa-gl_10.4.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_10.3.4.bb => mesa_10.4.3.bb} (78%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.3.4.bb b/meta/recipes-graphics/mesa/mesa-gl_10.4.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_10.3.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_10.4.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cb1837a..2d4e65d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -59,8 +59,6 @@ GALLIUMDRIVERS_append_x86 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm
 GALLIUMDRIVERS_append_x86-64 = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
 # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
 PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
-PACKAGECONFIG[gallium-egl]  = "--enable-gallium-egl, --disable-gallium-egl"
-PACKAGECONFIG[gallium-gbm]  = "--enable-gallium-gbm, --disable-gallium-gbm"
 MESA_LLVM_RELEASE ?= "3.3"
 PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --with-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
                                ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
diff --git a/meta/recipes-graphics/mesa/mesa_10.3.4.bb b/meta/recipes-graphics/mesa/mesa_10.4.3.bb
similarity index 78%
rename from meta/recipes-graphics/mesa/mesa_10.3.4.bb
rename to meta/recipes-graphics/mesa/mesa_10.4.3.bb
index 50092c9..9669bcb 100644
--- a/meta/recipes-graphics/mesa/mesa_10.3.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.4.3.bb
@@ -2,8 +2,8 @@ require ${BPN}.inc
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "fa0558a3d02c2bb8c208c030ccdc992e"
-SRC_URI[sha256sum] = "e6373913142338d10515daf619d659433bfd2989988198930c13b0945a15e98a"
+SRC_URI[md5sum] = "be86c4ee226f8ca28b7d4c728c350b01"
+SRC_URI[sha256sum] = "ef6ecc9c2f36c9f78d1662382a69ae961f38f03af3a0c3268e53f351aa1978ad"
 
 S = "${WORKDIR}/Mesa-${PV}"
 
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index b046ae2..e554ff4 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -4,8 +4,8 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3de"
 
-SRCREV = "c7b9a2e38a3e471562b50dab8be65db8ac6819f8"
-PV = "10.3.4+git${SRCPV}"
+SRCREV = "f70e4d4afd16e66506ce3b055edb3b71b1464890"
+PV = "10.4.3+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;branch=10.4"
 
-- 
1.8.1.2


