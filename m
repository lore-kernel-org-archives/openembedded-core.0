Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A6E3C731C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 08:35:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 31 May 2016 01:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,395,1459839600"; d="scan'208";a="987921723"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.185])
	by orsmga002.jf.intel.com with ESMTP; 31 May 2016 01:35:39 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2016 11:35:05 +0300
Message-Id: <1464683705-7225-1-git-send-email-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] pango_1.40.1.bb: Fix compilation error
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
X-List-Received-Date: Tue, 31 May 2016 08:35:57 -0000

On a build host not having libglib-2.0 installed compiling pango
fails with the error message

./gen-all-unicode: error while loading shared libraries: libglib-2.0.so.0: cannot open shared object file: No such file or directory

The executable doesn't have RPATH set to the library installed in
the native sysroot.

The fix sets RPATH.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---
 meta/recipes-graphics/pango/pango_1.40.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango_1.40.1.bb b/meta/recipes-graphics/pango/pango_1.40.1.bb
index 6e1e6c9..60288a1 100644
--- a/meta/recipes-graphics/pango/pango_1.40.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.40.1.bb
@@ -36,7 +36,7 @@ LIBV = "1.8.0"
 # This binary needs to be compiled for the host architecture.  This isn't pretty!
 do_compile_prepend_class-target () {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'true', 'false', d)}; then
-		make CC="${BUILD_CC}" CFLAGS="" LDFLAGS="" AM_CPPFLAGS="$(pkg-config-native --cflags glib-2.0)" gen_all_unicode_LDADD="$(pkg-config-native --libs glib-2.0)" -C ${B}/tests gen-all-unicode
+		make CC="${BUILD_CC}" CFLAGS="" LDFLAGS="${BUILD_LDFLAGS}" AM_CPPFLAGS="$(pkg-config-native --cflags glib-2.0)" gen_all_unicode_LDADD="$(pkg-config-native --libs glib-2.0)" -C ${B}/tests gen-all-unicode
 	fi
 }
 
-- 
2.5.5


