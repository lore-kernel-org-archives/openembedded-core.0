Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD7D56D144
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 06:30:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9L6UZbj001265
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 23:30:35 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 20 Oct 2013 23:30:35 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2013 14:30:37 +0800
Message-ID: <1382337037-17520-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] mesa: fix dependency
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
X-List-Received-Date: Mon, 21 Oct 2013 06:30:34 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

libudev is asked by enable-gbm, not enable_dri, and enable-gbm always is yes;

We can find the dependency from configure.ac codes:
	if test "x$enable_gbm" = xyes; then
	    SRC_DIRS="$SRC_DIRS gbm"

	    PKG_CHECK_MODULES([LIBUDEV], [libudev], [],
	                      AC_MSG_ERROR([gbm needs udev]))

	    if test "x$enable_dri" = xyes; then
	        GBM_BACKEND_DIRS="$GBM_BACKEND_DIRS dri"
	        if test "x$enable_shared_glapi" = xno; then
	            AC_MSG_ERROR([gbm_dri requires --enable-shared-glapi])
	        fi
	    fi
	fi

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-graphics/mesa/mesa.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index afc795c..b8706d4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555
 INC_PR = "r9"
 PE = "2"
 
-DEPENDS = "expat makedepend-native flex-native bison-native"
+DEPENDS = "expat makedepend-native flex-native bison-native udev"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
 
@@ -38,7 +38,7 @@ PACKAGECONFIG[wayland] = ",,wayland"
 DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
-PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto libdrm udev"
+PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto libdrm"
 
 EXTRA_OECONF += "--enable-gbm"
 
-- 
1.7.10.4


