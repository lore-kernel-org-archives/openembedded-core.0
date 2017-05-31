Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CC937780B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:39:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2017 04:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="1176493837"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2017 04:39:40 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id D746A580244
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 04:39:38 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:39:36 +0300
Message-Id: <1496230776-38517-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1496230776-38517-1-git-send-email-maxin.john@intel.com>
References: <1496230776-38517-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] pkgconfig: upgrade 0.29.1 -> 0.29.2
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
X-List-Received-Date: Wed, 31 May 2017 11:39:39 -0000

Remove backported patch:
1. 0001-gdate-Move-warning-pragma-outside-of-function.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...e-Move-warning-pragma-outside-of-function.patch | 39 ----------------------
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |  5 ++-
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch
deleted file mode 100644
index 14c8293..0000000
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-Move-warning-pragma-outside-of-function.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 946d36266d8a30f04fe34d3183bf4929141934d2 Mon Sep 17 00:00:00 2001
-From: coypu <coypu@sdf.org>
-Date: Wed, 2 Mar 2016 19:38:48 +0200
-Subject: [PATCH] gdate: Move warning pragma outside of function
-
-Commit 0817af40e8c74c721c30f6ef482b1f53d12044c7 breaks the build on
-older versions of GCC, which don't allow pragma inside functions.
-
-https://bugzilla.gnome.org/761550
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- glib/glib/gdate.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/glib/glib/gdate.c b/glib/glib/gdate.c
-index 1978cf7..20e6c4a 100644
---- a/glib/glib/gdate.c
-+++ b/glib/glib/gdate.c
-@@ -2439,6 +2439,9 @@ win32_strftime_helper (const GDate     *d,
-  *
-  * Returns: number of characters written to the buffer, or 0 the buffer was too small
-  */
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
-+
- gsize     
- g_date_strftime (gchar       *s, 
-                  gsize        slen, 
-@@ -2549,3 +2552,5 @@ g_date_strftime (gchar       *s,
-   return retval;
- #endif
- }
-+
-+#pragma GCC diagnostic pop
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index dc44992..e634021 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -8,13 +8,12 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "87152c05be88ca8be71a3a563f275b3686d32c28"
-PV = "0.29.1+git${SRCPV}"
+SRCREV = "edf8e6f0ea77ede073f07bff0d2ae1fc7a38103b"
+PV = "0.29.2+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/pkg-config \
            file://pkg-config-native.in \
            file://fix-glib-configure-libtool-usage.patch \
-           file://0001-gdate-Move-warning-pragma-outside-of-function.patch \
            file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch \
            "
 
-- 
2.4.0


