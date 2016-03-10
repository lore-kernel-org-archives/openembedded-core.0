Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 630C060249
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 07:23:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2A7Nui8005943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Mar 2016 23:23:56 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 9 Mar 2016 23:23:55 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Thu, 10 Mar 2016 02:23:18 -0500
Message-ID: <04c0faec3df19a118133143898925b8f1f57624b.1457593651.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457593651.git.hongxu.jia@windriver.com>
References: <cover.1457593651.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/18] epiphany: fix buildpaths QA issue
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
X-List-Received-Date: Thu, 10 Mar 2016 07:23:56 -0000
Content-Type: text/plain

In order to fix build path issue, we reverts the following commit
in https://github.com/GNOME/epiphany.git
...
commit 54a3122d8626f78338033a704d5849738f6dd2e6
Author: Xan Lopez <xan@igalia.com>
Date:   Wed May 16 18:21:21 2012 +0900

    ephy-profile-utils: use absolute path for build dir

    That way we can run the tests from any directory in debug mode.
...
It did not consider cross-compile situation which we do not need
to run tests in host build.

BTW, the tests suits were compiled but not installed to ${D},
so we explicitly disable it.

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.18.4.bb     |  8 ++-
 .../files/use-relative-path-for-build-dir.patch    | 57 ++++++++++++++++++++++
 2 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/epiphany/files/use-relative-path-for-build-dir.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
index 12d3b07..0b8335b 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.18.4.bb
@@ -9,11 +9,15 @@ inherit gnomebase gsettings distro_features_check upstream-version-is-even
 # libwnck3 is x11 only
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
+SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch \
+            file://use-relative-path-for-build-dir.patch \
+"
 SRC_URI[archive.md5sum] = "172b78256100e8d3c629764abd0e1495"
 SRC_URI[archive.sha256sum] = "be699d484371111abae754e669187215df73e21533f461e513b79537d7a1c1c1"
 
-EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO}"
+EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO} \
+                  --disable-tests \
+"
 
 do_configure_prepend() {
     touch ${S}/gnome-doc-utils.make
diff --git a/meta/recipes-gnome/epiphany/files/use-relative-path-for-build-dir.patch b/meta/recipes-gnome/epiphany/files/use-relative-path-for-build-dir.patch
new file mode 100644
index 0000000..21c0912
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/use-relative-path-for-build-dir.patch
@@ -0,0 +1,57 @@
+From 73e46aeea35c7bda7833e635f1bb2dbd39e2b43e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 2 Mar 2016 02:00:23 -0500
+Subject: [PATCH] ephy-profile-utils: use relative path for build dir
+
+It reverts the following commit in https://github.com/GNOME/epiphany.git
+...
+commit 54a3122d8626f78338033a704d5849738f6dd2e6
+Author: Xan Lopez <xan@igalia.com>
+Date:   Wed May 16 18:21:21 2012 +0900
+
+    ephy-profile-utils: use absolute path for build dir
+
+    That way we can run the tests from any directory in debug mode.
+...
+It did not consider cross-compile situation which we do not need
+to run tests in host build.
+
+It also caused build path issue.
+
+Upstream-Status: Inappropriate [openembedded specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ lib/Makefile.am          | 2 +-
+ lib/ephy-profile-utils.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 24d684b..849a07f 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -88,7 +88,7 @@ libephymisc_la_CPPFLAGS = \
+ 	-DDATADIR="\"$(datadir)\""		    \
+ 	-DSHARE_DIR=\"$(pkgdatadir)\" 		    \
+ 	-DTOP_SRC_DATADIR=\"$(top_srcdir)/data\"    \
+-	-DABS_TOP_BUILD_DIR=\"$(abs_top_builddir)\" \
++	-DTOP_BUILD_DIR=\"$(top_builddir)\"         \
+ 	-DLOCALEDIR=\"$(localedir)\"		    \
+ 	$(AM_CPPFLAGS)
+ 
+diff --git a/lib/ephy-profile-utils.c b/lib/ephy-profile-utils.c
+index 0430582..a42ec4e 100644
+--- a/lib/ephy-profile-utils.c
++++ b/lib/ephy-profile-utils.c
+@@ -128,7 +128,7 @@ ephy_profile_utils_do_migration (const char *profile_directory, int test_to_run,
+   argv[i++] = NULL;
+ 
+   if (debug)
+-    argv[0] = ABS_TOP_BUILD_DIR"/lib/"EPHY_PROFILE_MIGRATOR;
++    argv[0] = TOP_BUILD_DIR"/lib/"EPHY_PROFILE_MIGRATOR;
+ 
+   ret = g_spawn_sync (NULL, argv, envp, G_SPAWN_SEARCH_PATH,
+                       NULL, NULL, NULL, NULL,
+-- 
+1.9.1
+
-- 
1.9.1


