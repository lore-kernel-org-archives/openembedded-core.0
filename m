Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 169387F260
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 13:47:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2019 06:47:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; d="scan'208";a="168755304"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007.jf.intel.com with ESMTP; 19 Aug 2019 06:47:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Aug 2019 21:47:09 +0800
Message-Id: <1566222430-20029-2-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566222430-20029-1-git-send-email-anuj.mittal@intel.com>
References: <1566222430-20029-1-git-send-email-anuj.mittal@intel.com>
Subject: [warrior][PATCH 2/3] pango: fix CVE-2019-1010238
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
X-List-Received-Date: Mon, 19 Aug 2019 13:47:16 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../pango/pango/CVE-2019-1010238.patch             | 38 ++++++++++++++++++++++
 meta/recipes-graphics/pango/pango_1.42.4.bb        |  4 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch

diff --git a/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch b/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch
new file mode 100644
index 0000000..5b0c342
--- /dev/null
+++ b/meta/recipes-graphics/pango/pango/CVE-2019-1010238.patch
@@ -0,0 +1,38 @@
+From 490f8979a260c16b1df055eab386345da18a2d54 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Wed, 10 Jul 2019 20:26:23 -0400
+Subject: [PATCH] bidi: Be safer against bad input
+
+Don't run off the end of an array that we
+allocated to certain length.
+
+Closes: https://gitlab.gnome.org/GNOME/pango/issues/342
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/pango/commit/490f8979a260c16b1df055eab386345da18a2d54]
+CVE: CVE-2019-1010238
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ pango/pango-bidi-type.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/pango/pango-bidi-type.c b/pango/pango-bidi-type.c
+index 3e46b66c..5c02dbbb 100644
+--- a/pango/pango-bidi-type.c
++++ b/pango/pango-bidi-type.c
+@@ -181,8 +181,11 @@ pango_log2vis_get_embedding_levels (const gchar    *text,
+   for (i = 0, p = text; p < text + length; p = g_utf8_next_char(p), i++)
+     {
+       gunichar ch = g_utf8_get_char (p);
+-      FriBidiCharType char_type;
+-      char_type = fribidi_get_bidi_type (ch);
++      FriBidiCharType char_type = fribidi_get_bidi_type (ch);
++
++      if (i == n_chars)
++        break;
++
+       bidi_types[i] = char_type;
+       ored_types |= char_type;
+       if (FRIBIDI_IS_STRONG (char_type))
+-- 
+2.21.0
+
diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index f3be9f4..1e1a5b8 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -16,7 +16,9 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
 
 SRC_URI += "file://run-ptest \
-            file://insensitive-diff.patch"
+            file://insensitive-diff.patch \
+            file://CVE-2019-1010238.patch \
+            "
 
 SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
 SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
-- 
2.7.4


