Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S2I9o-0004sq-Fa
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 09:11:36 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Feb 2012 00:02:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="115563781"
Received: from yocto-build3.sh.intel.com ([10.239.48.15])
	by orsmga002.jf.intel.com with ESMTP; 28 Feb 2012 00:01:02 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 16:00:46 +0800
Message-Id: <d6b2657d8b78443c598b16edfce566be9aa2fcf8.1330415940.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1330415940.git.edwin.zhai@intel.com>
References: <cover.1330415940.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1330415940.git.edwin.zhai@intel.com>
References: <cover.1330415940.git.edwin.zhai@intel.com>
Subject: [PATCH 1/5] vte: fix scroll issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 08:11:36 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

On qemu x86-64, scrollbar in vte got broken with one commit to change the way
of emiting "changed" signal. This patch revert it as work around.

[YOCTO #1906] got fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-support/vte/vte.inc                 |    3 +-
 meta/recipes-support/vte/vte/scrollbar_fix.patch |  122 ++++++++++++++++++++++
 2 files changed, 124 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/scrollbar_fix.patch

diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 7971673..5e05608 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -6,7 +6,8 @@ RDEPENDS_libvte = "vte-termcap"
 
 inherit gnome
 
-SRC_URI += "file://introspection.patch"
+SRC_URI += "file://introspection.patch\ 
+            file://scrollbar_fix.patch"
 
 EXTRA_OECONF = "--disable-gtk-doc --disable-python --disable-introspection"
 
diff --git a/meta/recipes-support/vte/vte/scrollbar_fix.patch b/meta/recipes-support/vte/vte/scrollbar_fix.patch
new file mode 100644
index 0000000..707377a
--- /dev/null
+++ b/meta/recipes-support/vte/vte/scrollbar_fix.patch
@@ -0,0 +1,122 @@
+On qemu x86-64, matchbox-terminal has broken scrollbar, because of following
+commit in vte. This patch revert it as work around.
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Inappropriate [workaround]
+
+commit 6eadb8494797e44910b86b5e101823cf527c04e1
+Author: Kristian Høgsberg <krh@bitplanet.net>
+Date:   Thu Jul 15 09:07:51 2010 -0400
+
+    Use accessors for setting adjustment
+    
+    We use g_object_freeze_notify() to emit the same amount of ::changed
+    signals.
+
+Index: vte-0.28.2/src/vte.c
+===================================================================
+--- vte-0.28.2.orig/src/vte.c	2011-08-29 05:31:45.000000000 +0800
++++ vte-0.28.2/src/vte.c	2012-02-21 11:03:22.000000000 +0800
+@@ -2018,15 +2018,13 @@
+ 		glong v;
+ 		gdouble current;
+ 
+-		g_object_freeze_notify (G_OBJECT (terminal->adjustment));
+-
+ 		v = _vte_ring_delta (screen->row_data);
+ 		current = gtk_adjustment_get_lower(terminal->adjustment);
+ 		if (current != v) {
+ 			_vte_debug_print(VTE_DEBUG_ADJ,
+ 					"Changing lower bound from %.0f to %ld\n",
+ 					 current, v);
+-			gtk_adjustment_set_lower(terminal->adjustment, v);
++			terminal->adjustment->lower = v;
+ 			changed = TRUE;
+ 		}
+ 
+@@ -2039,19 +2037,19 @@
+ 			_vte_debug_print(VTE_DEBUG_ADJ,
+ 					"Changing upper bound from %.0f to %ld\n",
+ 					 current, v);
+-			gtk_adjustment_set_upper(terminal->adjustment, v);
++			terminal->adjustment->upper = v;
+ 			changed = TRUE;
+ 		}
+ 
+-		g_object_thaw_notify (G_OBJECT (terminal->adjustment));
+-
+-		if (changed)
++		if (changed) {
+ 			_vte_debug_print(VTE_DEBUG_SIGNALS,
+ 					"Emitting adjustment_changed.\n");
++			gtk_adjustment_changed(terminal->adjustment);
++		}
+ 		terminal->pvt->adjustment_changed_pending = FALSE;
+ 	}
+ 	if (terminal->pvt->adjustment_value_changed_pending) {
+-		glong v, delta;
++		glong v;
+ 		_vte_debug_print(VTE_DEBUG_SIGNALS,
+ 				"Emitting adjustment_value_changed.\n");
+ 		terminal->pvt->adjustment_value_changed_pending = FALSE;
+@@ -2062,9 +2060,9 @@
+ 			 * via the adjustment - e.g. user interaction with the
+ 			 * scrollbar
+ 			 */
+-			delta = terminal->pvt->screen->scroll_delta;
++			terminal->adjustment->value = terminal->pvt->screen->scroll_delta;
+ 			terminal->pvt->screen->scroll_delta = v;
+-			gtk_adjustment_set_value(terminal->adjustment, delta);
++			gtk_adjustment_value_changed(terminal->adjustment);
+ 		}
+ 	}
+ }
+@@ -2141,15 +2139,13 @@
+ 
+ 	_vte_terminal_adjust_adjustments(terminal);
+ 
+-        g_object_freeze_notify(G_OBJECT(terminal->adjustment));
+-
+ 	/* The step increment should always be one. */
+ 	v = gtk_adjustment_get_step_increment(terminal->adjustment);
+ 	if (v != 1) {
+ 		_vte_debug_print(VTE_DEBUG_ADJ,
+ 				"Changing step increment from %.0lf to %ld\n",
+ 				v, terminal->row_count);
+-		gtk_adjustment_set_step_increment(terminal->adjustment, 1);
++		terminal->adjustment->step_increment = 1;
+ 		changed = TRUE;
+ 	}
+ 
+@@ -2160,8 +2156,7 @@
+ 		_vte_debug_print(VTE_DEBUG_ADJ,
+ 				"Changing page size from %.0f to %ld\n",
+ 				 v, terminal->row_count);
+-		gtk_adjustment_set_page_size(terminal->adjustment,
+-					     terminal->row_count);
++		terminal->adjustment->page_size = terminal->row_count;
+ 		changed = TRUE;
+ 	}
+ 
+@@ -2173,16 +2168,15 @@
+ 				"Changing page increment from "
+ 				"%.0f to %ld\n",
+ 				v, terminal->row_count);
+-		gtk_adjustment_set_page_increment(terminal->adjustment,
+-						  terminal->row_count);
++		terminal->adjustment->page_increment = terminal->row_count;
+ 		changed = TRUE;
+ 	}
+ 
+-	g_object_thaw_notify(G_OBJECT(terminal->adjustment));
+-
+-	if (changed)
++	if (changed) {
+ 		_vte_debug_print(VTE_DEBUG_SIGNALS,
+ 				"Emitting adjustment_changed.\n");
++		gtk_adjustment_changed(terminal->adjustment);
++	}
+ }
+ 
+ /* Scroll a fixed number of lines up or down in the current screen. */
-- 
1.7.1



