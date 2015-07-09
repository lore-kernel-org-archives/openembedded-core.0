Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8958473B10
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 10:43:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 09 Jul 2015 03:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,439,1432623600"; d="scan'208";a="758988076"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.21.252])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2015 03:43:22 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 13:43:14 +0300
Message-Id: <f6116d4b96bf8f2ec34aa23130e1d03cb0618d4b.1436438063.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <95ffeac6a06e92a7e530ae6c903626535185ac60.1436438063.git.tanu.kaskinen@linux.intel.com>
References: <95ffeac6a06e92a7e530ae6c903626535185ac60.1436438063.git.tanu.kaskinen@linux.intel.com>
In-Reply-To: <cover.1436438063.git.tanu.kaskinen@linux.intel.com>
References: <cover.1436438063.git.tanu.kaskinen@linux.intel.com>
Subject: [PATCH v2 2/3] speex: 1.2rc1 -> 1.2rc2
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
X-List-Received-Date: Thu, 09 Jul 2015 10:43:23 -0000

Dropped speex-fpu.inc, since it's simpler to put the logic directly in
the .bb file.

LIC_FILES_CHKSUM changed due to whitespace changes only.

Dropped PR.

Added a dependency on speexdsp. The speexdsp functionality used to be
included in speex, but upstream split the speexdsp package off into a
separate source tree. speexdsp could otherwise be an optional
dependency, but the upstream configure script doesn't support
disabling it explicitly, and relying on automatic detection would
make builds nondeterministic, so it's better to always enable it.

--enable-fixed-point was previously included in the configure options
unconditionally, but the option should be used only when TARGET_FPU is
set to "soft".

--with-ogg-libraries, --with-ogg-includes and --disable-oggtest aren't
supported anymore, since speex now uses pkg-config to find libogg.

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 meta/recipes-multimedia/speex/speex-fpu.inc            |  4 ----
 .../speex/{speex_1.2rc1.bb => speex_1.2rc2.bb}         | 18 +++++++-----------
 2 files changed, 7 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-multimedia/speex/speex-fpu.inc
 rename meta/recipes-multimedia/speex/{speex_1.2rc1.bb => speex_1.2rc2.bb} (51%)

diff --git a/meta/recipes-multimedia/speex/speex-fpu.inc b/meta/recipes-multimedia/speex/speex-fpu.inc
deleted file mode 100644
index 2571d32..0000000
--- a/meta/recipes-multimedia/speex/speex-fpu.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-def get_speex_fpu_setting(bb, d):
-     if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-             return "--enable-fixed-point --disable-float-api --disable-vbr"
-     return ""
diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recipes-multimedia/speex/speex_1.2rc2.bb
similarity index 51%
rename from meta/recipes-multimedia/speex/speex_1.2rc1.bb
rename to meta/recipes-multimedia/speex/speex_1.2rc2.bb
index 5ff50b7..f7d23db 100644
--- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2rc2.bb
@@ -4,20 +4,16 @@ HOMEPAGE = "http://www.speex.org"
 SECTION = "libs"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
-                    file://include/speex/speex.h;beginline=1;endline=34;md5=a68129f78d7fe66e07163f73aba143b3"
-DEPENDS = "libogg"
-
-PR = "r2"
+                    file://include/speex/speex.h;beginline=1;endline=34;md5=ef8c8ea4f7198d71cf3509c6ed05ea50"
+DEPENDS = "libogg speexdsp"
 
 SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c4438b22c08e5811ff10e2b06ee9b9ae"
-SRC_URI[sha256sum] = "342f30dc57bd4a6dad41398365baaa690429660b10d866b7d508e8f1179cb7a6"
+SRC_URI[md5sum] = "6ae7db3bab01e1d4b86bacfa8ca33e81"
+SRC_URI[sha256sum] = "caa27c7247ff15c8521c2ae0ea21987c9e9710a8f2d3448e8b79da9806bce891"
 
 inherit autotools pkgconfig lib_package
 
-EXTRA_OECONF = " --enable-fixed-point --with-ogg-libraries=${STAGING_LIBDIR} \
-                 --with-ogg-includes=${STAGING_INCDIR} --disable-oggtest"
-
-require speex-fpu.inc
-EXTRA_OECONF += "${@get_speex_fpu_setting(bb, d)}"
+EXTRA_OECONF = "\
+        ${@bb.utils.contains('TARGET_FPU', 'soft', '--enable-fixed-point --disable-float-api --disable-vbr', '', d)} \
+"
-- 
1.9.3


