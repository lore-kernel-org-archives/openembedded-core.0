Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7D124731DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 15:35:58 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p65so22781096wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 07:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VnSpL7JmrGk752pJzQxz/KeNubHpdzm2E+TtJgF+pc0=;
	b=hb3nlVerPUyJJvw1HnoKnt3OAJcGufRmoENX/v/09sxjSNRLapmBlvSURpnoQE1/V8
	+8y6hd1Bx8y9g9NQTpmB5QPdbMGCIEqVBerfAHUWenGeWaoZ1tyOQ9nTuceogKVeF9Np
	DQSZw5psQgIg9NjJBqyCNZcJKZ2IV/TwaucTveg6+twb8ScPFAWKjmTmAlg64h1S6RZh
	xEtkTTy60e1N3I3KY/mZzLbQ3pw6HWWkXC7HL9jQj3PDXNgm5vdK7B+j9pLhrTLL3U4h
	i2zo7TbjVlf1Oa0EhEbuEyiqusku5LsqXmicsWL2xmkQoP8VAr3ffKPf7gpgo5vlmExl
	woxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VnSpL7JmrGk752pJzQxz/KeNubHpdzm2E+TtJgF+pc0=;
	b=EzXRFX0FFE0rTTDhSN6RiaFZvs9Z4J/mOzRCe9YLaA+FHFJPdyqUKLjuiToleYosvF
	EHuJZnCQQFRV1SOy3nU+DHnX5bcHSh/GMPQFiD9gCTgKmyHMl6kjbNt2IMtKaqpg5sqe
	tlQTEUAkvWiOtAdTRZ1cYoLmpTZgcYRkVaewSFLoHpnLNesUiDzh2L7igsQ+vHJeiG7M
	+1t/F1LDqjRntOXVUyiwrXeA9wHttgQpRm/MNBm6osQf+JpCLbgSnYli0Ts7BCshwtGa
	NQe9GP0+XNW5+mRYw0ApMsyf64ElJ38tIuwbbuG3RLpXJ0/LVh5l96p76m4zkpeKumlE
	ymng==
X-Gm-Message-State: AD7BkJKRxj4JR/KuBuwPC+70Kmb1V9mNNDdgCUB6B+Umni9kwF9qzYruNJyhN6eVdWDWlgQU
X-Received: by 10.194.222.234 with SMTP id qp10mr10472540wjc.138.1457710558458;
	Fri, 11 Mar 2016 07:35:58 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id u14sm2815574wmu.8.2016.03.11.07.35.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Mar 2016 07:35:57 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 15:35:55 +0000
Message-Id: <1457710555-17015-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
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
X-List-Received-Date: Fri, 11 Mar 2016 15:35:58 -0000

Glib hard-codes the install path in search path for GIO modules, which causes
problems when glib-2.0-native is restored from sstate with a different build
directory.

In the future we should relocate symbols directly using the same system that the
eSDK uses, but for now use dladdr() to look up where the library was loaded from
to build the search path.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glib-2.0/glib-2.0/relocate-modules.patch       | 49 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb      |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
new file mode 100644
index 0000000..f9e3f3d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -0,0 +1,49 @@
+Instead of hard-coding GIO_MODULE_PATH when glib is built, use dladdr() to
+determine where libglib.so is and use that path to calculate GIO_MODULES_DIR.
+
+This solves relocation problems with GIOModule for native builds of glib.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/gio/giomodule.c b/gio/giomodule.c
+index 56c498c..a2e32b7 100644
+--- a/gio/giomodule.c
++++ b/gio/giomodule.c
+@@ -47,6 +47,27 @@
+ #include "gdesktopappinfo.h"
+ #endif
+ 
++#include <dlfcn.h>
++
++/*
++ * Generate a GIO module directory based on where glib is installed
++ */
++static const char *
++_get_gio_module_dir (void)
++{
++  Dl_info info;
++
++  if (dladdr (g_io_module_new, &info)) {
++    char *libdir = g_path_get_dirname (info.dli_fname);
++    char *dir = g_build_filename (libdir, "gio", "modules", NULL);
++    g_free (libdir);
++    return dir;
++  } else {
++    return GIO_MODULE_DIR;
++  }
++}
++
++
+ /**
+  * SECTION:giomodule
+  * @short_description: Loadable GIO Modules
+@@ -1057,7 +1078,7 @@ _g_io_modules_ensure_loaded (void)
+       /* Then load the compiled in path */
+       module_dir = g_getenv ("GIO_MODULE_DIR");
+       if (module_dir == NULL)
+-        module_dir = GIO_MODULE_DIR;
++        module_dir = _get_gio_module_dir ();
+ 
+       g_io_modules_scan_all_in_directory_with_scope (module_dir, scope);
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
index bf3cade..2a2efae 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.46.2.bb
@@ -18,7 +18,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://gi-exclude.patch \
           "
 
-SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
+SRC_URI_append_class-native = " file://glib-gettextize-dir.patch \
+                                file://relocate-modules.patch"
 
 SRC_URI[md5sum] = "7f815d6e46df68e070cb421ed7f1139e"
 SRC_URI[sha256sum] = "5031722e37036719c1a09163cc6cf7c326e4c4f1f1e074b433c156862bd733db"
-- 
2.7.0


