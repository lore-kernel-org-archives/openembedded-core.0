Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 39A656AC37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 15:58:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 24 Mar 2016 08:58:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,385,1455004800"; d="scan'208";a="918054222"
Received: from jlock-mobl1.gar.corp.intel.com (HELO
	jlock-mobl.gar.corp.intel.com) ([10.252.8.19])
	by orsmga001.jf.intel.com with ESMTP; 24 Mar 2016 08:58:50 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Mar 2016 15:58:44 +0000
Message-Id: <1458835124-7128-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] pseudo: backport a patch to fix xattr removal
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
X-List-Received-Date: Thu, 24 Mar 2016 15:58:53 -0000

xattr removal doesn't work in pseudo 1.7.5, backport a patch from
pseudo master to fix this.

[YOCTO #9324]

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 .../pseudo/files/handle-remove-xattr.patch         | 36 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.7.5.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/handle-remove-xattr.patch

diff --git a/meta/recipes-devtools/pseudo/files/handle-remove-xattr.patch b/meta/recipes-devtools/pseudo/files/handle-remove-xattr.patch
new file mode 100644
index 0000000..8b7f30c
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/handle-remove-xattr.patch
@@ -0,0 +1,36 @@
+From a24cf102967a4966bfabe36c3542fb65f35bf539 Mon Sep 17 00:00:00 2001
+From: Peter Seebach <peter.seebach@windriver.com>
+Date: Wed, 23 Mar 2016 11:55:25 -0500
+Subject: actually handle remove_xattr correctly
+
+The path is required but wasn't being extracted from the client's message,
+resulting in xattr removal never working. This does not fully address some
+deeper problems with the xattr implementation, but at least the common
+removal case works.
+
+Upstream-Status: Backport
+
+Index: pseudo-1.7.5/ChangeLog.txt
+===================================================================
+--- pseudo-1.7.5.orig/ChangeLog.txt
++++ pseudo-1.7.5/ChangeLog.txt
+@@ -1,3 +1,7 @@
++2016-03-22:
++       * (seebs) extract path from message for remove_xattr so it
++         actually works.
++
+ 2016-02-09:
+         * (seebs) 1.7.5 release
+ 
+Index: pseudo-1.7.5/pseudo.c
+===================================================================
+--- pseudo-1.7.5.orig/pseudo.c
++++ pseudo-1.7.5/pseudo.c
+@@ -543,6 +543,7 @@ pseudo_op(pseudo_msg_t *msg, const char
+ 		case OP_GET_XATTR:
+ 		case OP_LIST_XATTR:
+ 		case OP_REPLACE_XATTR:
++		case OP_REMOVE_XATTR:
+ 		case OP_SET_XATTR:
+ 			/* In a rename there are two paths, null separated in msg->path */
+ 			initial_len = strlen(msg->path);
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
index 7af4d65..d90e644 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
@@ -6,6 +6,7 @@ SRC_URI = " \
     file://fallback-passwd \
     file://fallback-group \
     file://moreretries.patch \
+    file://handle-remove-xattr.patch \
 "
 
 SRC_URI[md5sum] = "c10209938f03128d0c193f041ff3596d"
-- 
2.5.5


