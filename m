Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2054B75CC2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 11:12:43 +0000 (UTC)
Received: by wmff134 with SMTP id f134so57297452wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Nov 2015 03:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ILFw3n7jGLpX2GmYOzNAm+Kc1UQUfDmDUaIAUcztVmI=;
	b=S8S2LzoFOow9D3BmCXGiLFbTWNrqTo5fjEi+TE2d76msFpKnea8HAd/2VCdkq3v4Ir
	0PKRPRjbjBbWYhfTXgqq6+bpUJZz/ovCybuSBxEACxacDpEWk/NSX8V3ye5a21M6EWB5
	yCJ6uhRXBaE+5e+I9tqVA82Or5OuIjC1bo9I3T2Bdd11BMBBIsZECgIg1g6+yzRxhL2Z
	0wbrQ7iqL9iJugU6hsp5SjENIQrUBcyC+ZliMOjqO6EYs/wz6otxUve/gmwUhziZF+NS
	yos0XYH1zXRnrfagxcL2LSChfMe/MvERQJ/0Z9mJBLdm4q5Kk/DxRIOX+nl3crFxNm56
	+THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ILFw3n7jGLpX2GmYOzNAm+Kc1UQUfDmDUaIAUcztVmI=;
	b=nK334DgtSfbMIJi2Cddnz1aUBb7c4km1gJX+IunlGv8V5USAFYCCwQ8tw3U+97GE+N
	ej906YwGgnaXxv0856IpJk/kRW0rCrQpRyDfRcmSbbDIZZ7Up5l7cFxD2E/FUhc3H4tE
	s00CzUSf1DmMC0pbaipqam78cH1tUb35ICc1JhRnJnpIsO73jVutOqTChdpwh9q98VI+
	jM6zLU5efvN3nZ4BMKPxK2Db0MmvkmHKud/M5BGAlclG5pNM28bRw2xjTXz3ubZOuW6t
	RPCJciYiK6MkbZBD1O4GLCIH0MZpLUUQKkwtx/qEu0Ai0CcHSKrhAuFhY5DI271rXtm0
	2LpA==
X-Gm-Message-State: ALoCoQnGBRKGa9J7/NON5tiO03ddqQQCspiMo6ZSjvWYY5XFJCSlSJe4Q3DPcsS31OoaUFf+mWTK
X-Received: by 10.28.23.206 with SMTP id 197mr13764681wmx.88.1446462762765;
	Mon, 02 Nov 2015 03:12:42 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l1sm21767303wjx.13.2015.11.02.03.12.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Nov 2015 03:12:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Nov 2015 11:04:38 +0000
Message-Id: <1446462278-23882-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] vte: fix DoS from malicious escape sequence (CVE-2012-2738)
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
X-List-Received-Date: Mon, 02 Nov 2015 11:12:44 -0000

Backport a fix from upstream to fix a denial of service via a malicious escape
sequence.

[ YOCTO #8617 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../vte/vte-0.28.2/cve-2012-2738.patch             | 135 +++++++++++++++++++++
 meta/recipes-support/vte/vte_0.28.2.bb             |   3 +-
 2 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch

diff --git a/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch b/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
new file mode 100644
index 0000000..2407771
--- /dev/null
+++ b/meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
@@ -0,0 +1,135 @@
+Upstream-Status: Backport
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
diff --git a/meta/recipes-support/vte/vte_0.28.2.bb b/meta/recipes-support/vte/vte_0.28.2.bb
index b1025cb..8b4e7f7 100644
--- a/meta/recipes-support/vte/vte_0.28.2.bb
+++ b/meta/recipes-support/vte/vte_0.28.2.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 PR = "r6"
 
-SRC_URI += "file://obsolete_automake_macros.patch"
+SRC_URI += "file://obsolete_automake_macros.patch \
+            file://cve-2012-2738.patch"
 
 CFLAGS += "-D_GNU_SOURCE"
 
-- 
2.1.4


