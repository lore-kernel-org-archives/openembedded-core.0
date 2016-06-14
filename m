Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DBA7D73174
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:15:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jun 2016 01:15:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718727910"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 01:15:13 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:34 +0300
Message-Id: <e12014df714d835b217acfbfbcfc1b5d1b4408db.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
References: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
Subject: [PATCHv3 10/30] vte: Upgrade to 0.44.1
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
X-List-Received-Date: Tue, 14 Jun 2016 08:15:13 -0000

* License change LGPL 2.0 -> LGPL 2.1+
* vte-termcap is no more
* API break: current version seems to be parallel installable
  with old one, but I did not opt for that.
* Add patch to avoid stack protection by default
* Add SECURITY_NO_PIE_CFLAGS exception until linking failure with
  libc_nonshared.a is resolved (undefined reference to
  __init_array_start)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/conf/distro/include/security_flags.inc        |   2 +
 .../vte/vte-0.28.2/cve-2012-2738.patch             | 136 ---------------------
 .../vte/vte-0.28.2/obsolete_automake_macros.patch  |  14 ---
 meta/recipes-support/vte/vte.inc                   |  15 ---
 ...-Don-t-enable-stack-protection-by-default.patch |  29 +++++
 meta/recipes-support/vte/vte_0.28.2.bb             |  16 ---
 meta/recipes-support/vte/vte_0.44.1.bb             |  24 ++++
 7 files changed, 55 insertions(+), 181 deletions(-)
 delete mode 100644 meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
 delete mode 100644 meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-support/vte/vte.inc
 create mode 100644 meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch
 delete mode 100644 meta/recipes-support/vte/vte_0.28.2.bb
 create mode 100644 meta/recipes-support/vte/vte_0.44.1.bb

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index ea1d4e5..0df65e0 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -95,6 +95,8 @@ SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
 
+SECURITY_CFLAGS_pn-vte = "${SECURITY_NO_PIE_CFLAGS}"
+
 # Recipes which fail to compile when elevating -Wformat-security to an error
 SECURITY_STRINGFORMAT_pn-busybox = ""
 SECURITY_STRINGFORMAT_pn-console-tools = ""
diff --git a/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch b/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
deleted file mode 100644
index 9b99803..0000000
--- a/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-Upstream-Status: Backport
-CVE: CVE-2012-2738
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From e524b0b3bd8fad844ffa73927c199545b892cdbd Mon Sep 17 00:00:00 2001
-From: Christian Persch <chpe@gnome.org>
-Date: Sat, 19 May 2012 19:36:09 +0200
-Subject: [PATCH 1/2] emulation: Limit integer arguments to 65535
-
-To guard against malicious sequences containing excessively big numbers,
-limit all parsed numbers to 16 bit range. Doing this here in the parsing
-routine is a catch-all guard; this doesn't preclude enforcing
-more stringent limits in the handlers themselves.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=676090
----
- src/table.c  | 2 +-
- src/vteseq.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/table.c b/src/table.c
-index 140e8c8..85cf631 100644
---- a/src/table.c
-+++ b/src/table.c
-@@ -550,7 +550,7 @@ _vte_table_extract_numbers(GValueArray **array,
- 		if (G_UNLIKELY (*array == NULL)) {
- 			*array = g_value_array_new(1);
- 		}
--		g_value_set_long(&value, total);
-+		g_value_set_long(&value, CLAMP (total, 0, G_MAXUSHORT));
- 		g_value_array_append(*array, &value);
- 	} while (i++ < arginfo->length);
- 	g_value_unset(&value);
-diff --git a/src/vteseq.c b/src/vteseq.c
-index 7ef4c8c..10991db 100644
---- a/src/vteseq.c
-+++ b/src/vteseq.c
-@@ -557,7 +557,7 @@ vte_sequence_handler_multiple(VteTerminal *terminal,
-                               GValueArray *params,
-                               VteTerminalSequenceHandler handler)
- {
--        vte_sequence_handler_multiple_limited(terminal, params, handler, G_MAXLONG);
-+        vte_sequence_handler_multiple_limited(terminal, params, handler, G_MAXUSHORT);
- }
- 
- static void
--- 
-2.4.9 (Apple Git-60)
-
-
-From cf1ad453a8def873c49cf6d88162593402f32bb2 Mon Sep 17 00:00:00 2001
-From: Christian Persch <chpe@gnome.org>
-Date: Sat, 19 May 2012 20:04:12 +0200
-Subject: [PATCH 2/2] emulation: Limit repetitions
-
-Don't allow malicious sequences to cause excessive repetitions.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=676090
----
- src/vteseq.c | 25 ++++++++++++++++++-------
- 1 file changed, 18 insertions(+), 7 deletions(-)
-
-diff --git a/src/vteseq.c b/src/vteseq.c
-index 10991db..209522f 100644
---- a/src/vteseq.c
-+++ b/src/vteseq.c
-@@ -1392,7 +1392,7 @@ vte_sequence_handler_dc (VteTerminal *terminal, GValueArray *params)
- static void
- vte_sequence_handler_DC (VteTerminal *terminal, GValueArray *params)
- {
--	vte_sequence_handler_multiple(terminal, params, vte_sequence_handler_dc);
-+	vte_sequence_handler_multiple_r(terminal, params, vte_sequence_handler_dc);
- }
- 
- /* Delete a line at the current cursor position. */
-@@ -1785,7 +1785,7 @@ vte_sequence_handler_reverse_index (VteTerminal *terminal, GValueArray *params)
- static void
- vte_sequence_handler_RI (VteTerminal *terminal, GValueArray *params)
- {
--	vte_sequence_handler_multiple(terminal, params, vte_sequence_handler_nd);
-+	vte_sequence_handler_multiple_r(terminal, params, vte_sequence_handler_nd);
- }
- 
- /* Save cursor (position). */
-@@ -2777,8 +2777,7 @@ vte_sequence_handler_insert_lines (VteTerminal *terminal, GValueArray *params)
- {
- 	GValue *value;
- 	VteScreen *screen;
--	long param, end, row;
--	int i;
-+	long param, end, row, i, limit;
- 	screen = terminal->pvt->screen;
- 	/* The default is one. */
- 	param = 1;
-@@ -2796,7 +2795,13 @@ vte_sequence_handler_insert_lines (VteTerminal *terminal, GValueArray *params)
- 	} else {
- 		end = screen->insert_delta + terminal->row_count - 1;
- 	}
--	/* Insert the new lines at the cursor. */
-+
-+	/* Only allow to insert as many lines as there are between this row
-+         * and the end of the scrolling region. See bug #676090.
-+         */
-+        limit = end - row + 1;
-+        param = MIN (param, limit);
-+
- 	for (i = 0; i < param; i++) {
- 		/* Clear a line off the end of the region and add one to the
- 		 * top of the region. */
-@@ -2817,8 +2822,7 @@ vte_sequence_handler_delete_lines (VteTerminal *terminal, GValueArray *params)
- {
- 	GValue *value;
- 	VteScreen *screen;
--	long param, end, row;
--	int i;
-+	long param, end, row, i, limit;
- 
- 	screen = terminal->pvt->screen;
- 	/* The default is one. */
-@@ -2837,6 +2841,13 @@ vte_sequence_handler_delete_lines (VteTerminal *terminal, GValueArray *params)
- 	} else {
- 		end = screen->insert_delta + terminal->row_count - 1;
- 	}
-+
-+        /* Only allow to delete as many lines as there are between this row
-+         * and the end of the scrolling region. See bug #676090.
-+         */
-+        limit = end - row + 1;
-+        param = MIN (param, limit);
-+
- 	/* Clear them from below the current cursor. */
- 	for (i = 0; i < param; i++) {
- 		/* Insert a line at the end of the region and remove one from
--- 
-2.4.9 (Apple Git-60)
-
diff --git a/meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch b/meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch
deleted file mode 100644
index 6763d37..0000000
--- a/meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=691545]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd vte-0.28.2/gnome-pty-helper/configure.in vte-0.28.2/gnome-pty-helper/configure.in
---- vte-0.28.2/gnome-pty-helper/configure.in	2010-07-15 20:08:44.000000000 +0300
-+++ vte-0.28.2/gnome-pty-helper/configure.in	2013-01-11 14:50:34.971027440 +0200
-@@ -8,7 +8,6 @@
- AC_ISC_POSIX
- AC_PROG_CC
- AC_STDC_HEADERS
--AM_PROG_CC_STDC
-
- if test -z "$enable_maintainer_mode"; then
-   enable_maintainer_mode=yes
diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
deleted file mode 100644
index 8565cc2..0000000
--- a/meta/recipes-support/vte/vte.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Virtual terminal emulator GTK+ widget library"
-BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
-LICENSE = "LGPLv2.0"
-DEPENDS = " glib-2.0 gtk+ intltool-native ncurses"
-RDEPENDS_libvte = "vte-termcap"
-
-inherit gnome gtk-doc distro_features_check upstream-version-is-even gobject-introspection
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-EXTRA_OECONF = "--disable-python"
-
-PACKAGES =+ "libvte vte-termcap"
-FILES_libvte = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
-FILES_vte-termcap = "${datadir}/vte/termcap-0.0"
-
diff --git a/meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch b/meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch
new file mode 100644
index 0000000..fcfc559
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch
@@ -0,0 +1,29 @@
+From b0a579d83e355545b64742c997fe8b1d58bf4207 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 13 Jun 2016 11:05:00 +0300
+Subject: [PATCH] Don't enable stack-protection by default
+
+These are set by security_flags.inc.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 068d072..d580f84 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -138,8 +138,6 @@ m4_define([compiler_flags_common],[ dnl
+   -fno-common dnl
+   -fdiagnostics-show-option dnl
+   -fno-strict-aliasing dnl
+-  -fstack-protector dnl
+-  -fstack-protector-strong dnl
+   -fno-semantic-interposition dnl
+   -Wno-deprecated-declarations dnl
+ ])
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
deleted file mode 100644
index 74087ca..0000000
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require vte.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-PR = "r6"
-
-SRC_URI += "file://obsolete_automake_macros.patch \
-            file://cve-2012-2738.patch \
-           "
-
-CFLAGS += "-D_GNU_SOURCE"
-
-SRC_URI[archive.md5sum] = "497f26e457308649e6ece32b3bb142ff"
-SRC_URI[archive.sha256sum] = "86cf0b81aa023fa93ed415653d51c96767f20b2d7334c893caba71e42654b0ae"
-
-RECIPE_NO_UPDATE_REASON = "matchbox-terminal needs to be ported over to new vte first"
diff --git a/meta/recipes-support/vte/vte_0.44.1.bb b/meta/recipes-support/vte/vte_0.44.1.bb
new file mode 100644
index 0000000..f42a9aa
--- /dev/null
+++ b/meta/recipes-support/vte/vte_0.44.1.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Virtual terminal emulator GTK+ widget library"
+BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
+LICENSE = "LGPLv2.1+"
+DEPENDS = "glib-2.0 gtk+3 intltool-native"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+inherit gnomebase gtk-doc distro_features_check upstream-version-is-even vala gobject-introspection
+
+SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch"
+SRC_URI[archive.md5sum] = "20916d97a5902657e54307cc2757beee"
+SRC_URI[archive.sha256sum] = "712dd548339f600fd7e221d12b2670a13a4361b2cd23ba0e057e76cc19fe5d4e"
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
+
+CFLAGS += "-D_GNU_SOURCE"
+
+# Enable vala only if gobject-introspection is enabled
+EXTRA_OECONF = "--enable-vala=auto"
+
+PACKAGES =+ "libvte"
+FILES_libvte = "${libdir}/*.so.*"
-- 
2.1.4


