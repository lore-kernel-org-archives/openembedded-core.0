Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D017973166
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:49:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Jul 2016 18:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,365,1464678000"; d="scan'208";a="995612652"
Received: from timo-fedora.jf.intel.com ([10.7.201.162])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2016 18:49:02 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 18:49:32 -0700
Message-Id: <ba010ae55186d533ee35ed38839d7761d7b004a3.1468546499.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
In-Reply-To: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
Subject: [krogoth][PATCH 1/8] pkgconfig: Fix build with gcc-6
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
X-List-Received-Date: Fri, 15 Jul 2016 01:49:01 -0000

Our patch in master was on top of 0.29.1 update.
commit b83a808fcbd3e7aec3b0757c7180cf83dac44e92

Apply to krogoth stable 0.29 version instead.

[YOCTO #9897] (Fedora-24)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...te-suppress-string-format-literal-warning.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-suppress-string-format-literal-warning.patch

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-suppress-string-format-literal-warning.patch b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-suppress-string-format-literal-warning.patch
new file mode 100644
index 0000000..830d3d2
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/0001-gdate-suppress-string-format-literal-warning.patch
@@ -0,0 +1,34 @@
+The upstream patch would not apply cleanly, so perform the same changes.
+
+Original patch header:
+From 00148329967adb196138372771052a3f606a6ea3 Mon Sep 17 00:00:00 2001
+From: coypu <coypu@sdf.org>
+Date: Wed, 2 Mar 2016 19:43:10 +0200
+Subject: [PATCH 2/2] gdate: Suppress string format literal warning
+
+Newer versions of GCC emit an error here, but we know it's safe.
+https://bugzilla.gnome.org/761550
+
+Upstream-Status: Backport
+
+Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+
+Index: git/glib/glib/gdate.c
+===================================================================
+--- git.orig/glib/glib/gdate.c
++++ git/glib/glib/gdate.c
+@@ -2439,6 +2439,8 @@ win32_strftime_helper (const GDate     *
+  *
+  * Returns: number of characters written to the buffer, or 0 the buffer was too small
+  */
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ gsize     
+ g_date_strftime (gchar       *s, 
+                  gsize        slen, 
+@@ -2549,3 +2551,5 @@ g_date_strftime (gchar       *s,
+   return retval;
+ #endif
+ }
++
++#pragma GCC diagnostic pop
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index d34f608..cd4dc8e 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -18,6 +18,7 @@ PV = "0.29+git${SRCPV}"
 SRC_URI = "git://anongit.freedesktop.org/pkg-config \
            file://pkg-config-native.in \
            file://fix-glib-configure-libtool-usage.patch \
+	   file://0001-gdate-suppress-string-format-literal-warning.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


