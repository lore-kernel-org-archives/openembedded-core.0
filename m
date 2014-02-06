Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 861D06CBB2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 22:05:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Feb 2014 14:01:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,796,1384329600"; d="scan'208";a="479290705"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.122])
	by orsmga002.jf.intel.com with ESMTP; 06 Feb 2014 14:05:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Feb 2014 22:05:41 +0000
Message-Id: <1391724341-11094-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [dylan][PATCH] libx11: backport _XEatDataWords API
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
X-List-Received-Date: Thu, 06 Feb 2014 22:05:56 -0000

If you build libx11-native then that has to be ABI-compatible with the
libX11 on the host or you'll have problems running qemu-native. Most
current distros are using libX11 1.6+. Thus, we need to backport the
_XEatDataWords API present in 1.6.

This only affects the dylan branch as dora+ has libx11 1.6+.

Fixes [YOCTO #5040].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../xorg-lib/libx11/xeatdatawords.patch            | 65 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/xeatdatawords.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/xeatdatawords.patch b/meta/recipes-graphics/xorg-lib/libx11/xeatdatawords.patch
new file mode 100644
index 0000000..63fac8b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/xeatdatawords.patch
@@ -0,0 +1,65 @@
+From 9f5d83706543696fc944c1835a403938c06f2cc5 Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Sat, 02 Mar 2013 04:54:24 +0000
+Subject: Add _XEatDataWords to discard a given number of 32-bit words of reply data
+
+Matches the units of the length field in X protocol replies, and provides
+a single implementation of overflow checking to avoid having to replicate
+those checks in every caller.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Matthieu Herrb <matthieu.herrb@laas.fr>
+
+Upstream-Status: Backport
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+---
+diff --git a/include/X11/Xlibint.h b/include/X11/Xlibint.h
+index 06395b3..d63a534 100644
+--- a/include/X11/Xlibint.h
++++ b/include/X11/Xlibint.h
+@@ -855,6 +855,10 @@ extern void _XEatData(
+     Display*		/* dpy */,
+     unsigned long	/* n */
+ );
++extern void _XEatDataWords(
++    Display*		/* dpy */,
++    unsigned long	/* n */
++);
+ extern char *_XAllocScratch(
+     Display*		/* dpy */,
+     unsigned long	/* nbytes */
+diff --git a/src/xcb_io.c b/src/xcb_io.c
+index 300ef57..727c6c7 100644
+--- a/src/xcb_io.c
++++ b/src/xcb_io.c
+@@ -19,6 +19,7 @@
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <limits.h>
+ #ifdef HAVE_SYS_SELECT_H
+ #include <sys/select.h>
+ #endif
+@@ -757,3 +758,19 @@ void _XEatData(Display *dpy, unsigned long n)
+ 	dpy->xcb->reply_consumed += n;
+ 	_XFreeReplyData(dpy, False);
+ }
++
++/*
++ * Read and discard "n" 32-bit words of data
++ * Matches the units of the length field in X protocol replies, and provides
++ * a single implementation of overflow checking to avoid having to replicate
++ * those checks in every caller.
++ */
++void _XEatDataWords(Display *dpy, unsigned long n)
++{
++	if (n < ((INT_MAX - dpy->xcb->reply_consumed) >> 2))
++		dpy->xcb->reply_consumed += (n << 2);
++	else
++		/* Overflow would happen, so just eat the rest of the reply */
++		dpy->xcb->reply_consumed = dpy->xcb->reply_length;
++	_XFreeReplyData(dpy, False);
++}
+--
+cgit v0.9.0.2-2-gbebe
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
index 7f18824..95d5c7d 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
@@ -7,6 +7,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://keysymdef_include.patch \
             file://disable_tests.patch \
+            file://xeatdatawords.patch \
            "
 
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
-- 
1.8.5.3


