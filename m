Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19EB873197
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 20:50:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5GKnvFj013029
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 16 Jun 2016 13:50:00 -0700
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 16 Jun 2016 13:49:56 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <jussi.kukkonen@intel.com>
Date: Thu, 16 Jun 2016 16:49:55 -0400
Message-ID: <1466110195-5473-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1466099108-25355-1-git-send-email-mark.asselstine@windriver.com>
References: <1466099108-25355-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH] vte: bring back old version to support xfce4-terminal
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
X-List-Received-Date: Thu, 16 Jun 2016 20:50:03 -0000
Content-Type: text/plain

The recent uprev to vte version 0.44.1 as part of commit
commit dc21182ada418cf3917ae8319494d219462c5bfd [vte: Upgrade to 0.44.1]
brought with it an jump in api version, leaving any packages, such as
xfce4-terminal, failing to configure/build. The commit log indicated
that it was a possibility to support the two versions (more
specifically the two api versions) side by side but that this option
was not taken.

Since we now know that this uprev does have fairly significant impact
on some other packages bring back the old version and have it live
side by side with the new. The appended version '0.0' was selected to
match the api version string used by the the upstream vte project.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

While waiting to hear back about my inquiry I did take some
time to put together this patch that allows things that
require the older vte to continue to build. Since xfce4-terminal
lives in meta-openembedded this might make more sense to carry
over there. I am sure folks will have an opinion so sending this
out as an RFC.

Mark


 .../vte/vte-0.0/cve-2012-2738.patch                | 136 +++++++++++++++++++++
 .../vte/vte-0.0/obsolete_automake_macros.patch     |  14 +++
 meta/recipes-support/vte/vte-0.0_0.28.2.bb         |  31 +++++
 3 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-support/vte/vte-0.0/cve-2012-2738.patch
 create mode 100644 meta/recipes-support/vte/vte-0.0/obsolete_automake_macros.patch
 create mode 100644 meta/recipes-support/vte/vte-0.0_0.28.2.bb

diff --git a/meta/recipes-support/vte/vte-0.0/cve-2012-2738.patch b/meta/recipes-support/vte/vte-0.0/cve-2012-2738.patch
new file mode 100644
index 0000000..9b99803
--- /dev/null
+++ b/meta/recipes-support/vte/vte-0.0/cve-2012-2738.patch
@@ -0,0 +1,136 @@
+Upstream-Status: Backport
+CVE: CVE-2012-2738
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From e524b0b3bd8fad844ffa73927c199545b892cdbd Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@gnome.org>
+Date: Sat, 19 May 2012 19:36:09 +0200
+Subject: [PATCH 1/2] emulation: Limit integer arguments to 65535
+
+To guard against malicious sequences containing excessively big numbers,
+limit all parsed numbers to 16 bit range. Doing this here in the parsing
+routine is a catch-all guard; this doesn't preclude enforcing
+more stringent limits in the handlers themselves.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=676090
+---
+ src/table.c  | 2 +-
+ src/vteseq.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/table.c b/src/table.c
+index 140e8c8..85cf631 100644
+--- a/src/table.c
++++ b/src/table.c
+@@ -550,7 +550,7 @@ _vte_table_extract_numbers(GValueArray **array,
+ 		if (G_UNLIKELY (*array == NULL)) {
+ 			*array = g_value_array_new(1);
+ 		}
+-		g_value_set_long(&value, total);
++		g_value_set_long(&value, CLAMP (total, 0, G_MAXUSHORT));
+ 		g_value_array_append(*array, &value);
+ 	} while (i++ < arginfo->length);
+ 	g_value_unset(&value);
+diff --git a/src/vteseq.c b/src/vteseq.c
+index 7ef4c8c..10991db 100644
+--- a/src/vteseq.c
++++ b/src/vteseq.c
+@@ -557,7 +557,7 @@ vte_sequence_handler_multiple(VteTerminal *terminal,
+                               GValueArray *params,
+                               VteTerminalSequenceHandler handler)
+ {
+-        vte_sequence_handler_multiple_limited(terminal, params, handler, G_MAXLONG);
++        vte_sequence_handler_multiple_limited(terminal, params, handler, G_MAXUSHORT);
+ }
+ 
+ static void
+-- 
+2.4.9 (Apple Git-60)
+
+
+From cf1ad453a8def873c49cf6d88162593402f32bb2 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@gnome.org>
+Date: Sat, 19 May 2012 20:04:12 +0200
+Subject: [PATCH 2/2] emulation: Limit repetitions
+
+Don't allow malicious sequences to cause excessive repetitions.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=676090
+---
+ src/vteseq.c | 25 ++++++++++++++++++-------
+ 1 file changed, 18 insertions(+), 7 deletions(-)
+
+diff --git a/src/vteseq.c b/src/vteseq.c
+index 10991db..209522f 100644
+--- a/src/vteseq.c
++++ b/src/vteseq.c
+@@ -1392,7 +1392,7 @@ vte_sequence_handler_dc (VteTerminal *terminal, GValueArray *params)
+ static void
+ vte_sequence_handler_DC (VteTerminal *terminal, GValueArray *params)
+ {
+-	vte_sequence_handler_multiple(terminal, params, vte_sequence_handler_dc);
++	vte_sequence_handler_multiple_r(terminal, params, vte_sequence_handler_dc);
+ }
+ 
+ /* Delete a line at the current cursor position. */
+@@ -1785,7 +1785,7 @@ vte_sequence_handler_reverse_index (VteTerminal *terminal, GValueArray *params)
+ static void
+ vte_sequence_handler_RI (VteTerminal *terminal, GValueArray *params)
+ {
+-	vte_sequence_handler_multiple(terminal, params, vte_sequence_handler_nd);
++	vte_sequence_handler_multiple_r(terminal, params, vte_sequence_handler_nd);
+ }
+ 
+ /* Save cursor (position). */
+@@ -2777,8 +2777,7 @@ vte_sequence_handler_insert_lines (VteTerminal *terminal, GValueArray *params)
+ {
+ 	GValue *value;
+ 	VteScreen *screen;
+-	long param, end, row;
+-	int i;
++	long param, end, row, i, limit;
+ 	screen = terminal->pvt->screen;
+ 	/* The default is one. */
+ 	param = 1;
+@@ -2796,7 +2795,13 @@ vte_sequence_handler_insert_lines (VteTerminal *terminal, GValueArray *params)
+ 	} else {
+ 		end = screen->insert_delta + terminal->row_count - 1;
+ 	}
+-	/* Insert the new lines at the cursor. */
++
++	/* Only allow to insert as many lines as there are between this row
++         * and the end of the scrolling region. See bug #676090.
++         */
++        limit = end - row + 1;
++        param = MIN (param, limit);
++
+ 	for (i = 0; i < param; i++) {
+ 		/* Clear a line off the end of the region and add one to the
+ 		 * top of the region. */
+@@ -2817,8 +2822,7 @@ vte_sequence_handler_delete_lines (VteTerminal *terminal, GValueArray *params)
+ {
+ 	GValue *value;
+ 	VteScreen *screen;
+-	long param, end, row;
+-	int i;
++	long param, end, row, i, limit;
+ 
+ 	screen = terminal->pvt->screen;
+ 	/* The default is one. */
+@@ -2837,6 +2841,13 @@ vte_sequence_handler_delete_lines (VteTerminal *terminal, GValueArray *params)
+ 	} else {
+ 		end = screen->insert_delta + terminal->row_count - 1;
+ 	}
++
++        /* Only allow to delete as many lines as there are between this row
++         * and the end of the scrolling region. See bug #676090.
++         */
++        limit = end - row + 1;
++        param = MIN (param, limit);
++
+ 	/* Clear them from below the current cursor. */
+ 	for (i = 0; i < param; i++) {
+ 		/* Insert a line at the end of the region and remove one from
+-- 
+2.4.9 (Apple Git-60)
+
diff --git a/meta/recipes-support/vte/vte-0.0/obsolete_automake_macros.patch b/meta/recipes-support/vte/vte-0.0/obsolete_automake_macros.patch
new file mode 100644
index 0000000..6763d37
--- /dev/null
+++ b/meta/recipes-support/vte/vte-0.0/obsolete_automake_macros.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=691545]
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd vte-0.28.2/gnome-pty-helper/configure.in vte-0.28.2/gnome-pty-helper/configure.in
+--- vte-0.28.2/gnome-pty-helper/configure.in	2010-07-15 20:08:44.000000000 +0300
++++ vte-0.28.2/gnome-pty-helper/configure.in	2013-01-11 14:50:34.971027440 +0200
+@@ -8,7 +8,6 @@
+ AC_ISC_POSIX
+ AC_PROG_CC
+ AC_STDC_HEADERS
+-AM_PROG_CC_STDC
+
+ if test -z "$enable_maintainer_mode"; then
+   enable_maintainer_mode=yes
diff --git a/meta/recipes-support/vte/vte-0.0_0.28.2.bb b/meta/recipes-support/vte/vte-0.0_0.28.2.bb
new file mode 100644
index 0000000..5962f61
--- /dev/null
+++ b/meta/recipes-support/vte/vte-0.0_0.28.2.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Virtual terminal emulator GTK+ widget library"
+BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
+LICENSE = "LGPLv2.0"
+DEPENDS = " glib-2.0 gtk+ intltool-native ncurses"
+RDEPENDS_libvte-0.0 = "vte-termcap"
+
+S = "${WORKDIR}/vte-${PV}"
+
+inherit gnome gtk-doc distro_features_check upstream-version-is-even gobject-introspection
+ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+
+EXTRA_OECONF = "--disable-python"
+
+PACKAGES =+ "libvte-0.0 vte-termcap"
+FILES_libvte = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
+FILES_vte-termcap = "${datadir}/vte/termcap-0.0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
+
+GNOMEBN = "vte"
+
+SRC_URI += "file://obsolete_automake_macros.patch \
+            file://cve-2012-2738.patch \
+           "
+
+CFLAGS += "-D_GNU_SOURCE"
+
+SRC_URI[archive.md5sum] = "497f26e457308649e6ece32b3bb142ff"
+SRC_URI[archive.sha256sum] = "86cf0b81aa023fa93ed415653d51c96767f20b2d7334c893caba71e42654b0ae"
+
+RECIPE_NO_UPDATE_REASON = "xfce4-terminal needs to be ported over to new vte first"
-- 
2.5.0


