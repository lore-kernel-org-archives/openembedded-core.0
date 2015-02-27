Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 380DF72491
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 17:20:04 +0000 (UTC)
Received: by igbhn18 with SMTP id hn18so2086221igb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 09:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tAz1ERoJjd5Jrtw+fZVwh+Cwb0uRdSLh/4Vvt/WVIMU=;
	b=dfQavgj4sf2AMaItTcrpFPB+U0JsY7lYPOYtVoi1ps58hcaAYm2hV8ATqC5QuIgNTC
	B8ClV7UPq0tzw1yf6GJHFxyuF3XN8Uw/iSBFPcxmzDdjNotHhaQxWowFZQWHneplptko
	Mdn+pccxp1nBAEAa4cpLNgmd38cG5qg2kcthTOkXNicxHsYwXGtweun2lCN8+xk/N6/f
	f//zoQLZnB9nsZn8p0jwhnyXl4CDmj1jVRhFCB9L/Hm8/sfIacfF88qDjF1Y4mCcwIW6
	BrZPz/YPF2MtSqRnA7kZ1ewRfFaLavmYC6N3ctHukTwC9GtykzVzdTwsRV4lI7gTZsFe
	eEwA==
X-Received: by 10.42.188.133 with SMTP id da5mr16646567icb.37.1425057606342;
	Fri, 27 Feb 2015 09:20:06 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id r78sm2594257ioi.22.2015.02.27.09.20.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Feb 2015 09:20:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 17:19:54 +0000
Message-Id: <1425057596-28243-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425057596-28243-1-git-send-email-raj.khem@gmail.com>
References: <1425057596-28243-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/6] mtd-utils: update to latest and fix static inlining
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
X-List-Received-Date: Fri, 27 Feb 2015 17:20:05 -0000

use static storage class instead of extern for inline functions
and remove duplicate definitions as a result

Change-Id: I72e8c5f19dff656c18f719d1e9e2ca697c9a856f
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emove-duplicate-hashtable_iterator_value-.patch | 56 ++++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
new file mode 100644
index 0000000..695f020
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
@@ -0,0 +1,56 @@
+From b856ff35c20124ceae40bbc4d32584df47618c96 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Feb 2015 09:28:26 +0000
+Subject: [PATCH] hashtable: Remove duplicate
+ hashtable_iterator_value/hashtable_iterator_key
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mkfs.ubifs/hashtable/hashtable_itr.c | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+Index: git/mkfs.ubifs/hashtable/hashtable_itr.h
+===================================================================
+--- git.orig/mkfs.ubifs/hashtable/hashtable_itr.h
++++ git/mkfs.ubifs/hashtable/hashtable_itr.h
+@@ -28,7 +28,7 @@ hashtable_iterator(struct hashtable *h);
+ /* hashtable_iterator_key
+  * - return the value of the (key,value) pair at the current position */
+ 
+-extern inline void *
++static inline void *
+ hashtable_iterator_key(struct hashtable_itr *i)
+ {
+     return i->e->k;
+@@ -37,7 +37,7 @@ hashtable_iterator_key(struct hashtable_
+ /*****************************************************************************/
+ /* value - return the value of the (key,value) pair at the current position */
+ 
+-extern inline void *
++static inline void *
+ hashtable_iterator_value(struct hashtable_itr *i)
+ {
+     return i->e->v;
+Index: git/mkfs.ubifs/hashtable/hashtable_itr.c
+===================================================================
+--- git.orig/mkfs.ubifs/hashtable/hashtable_itr.c
++++ git/mkfs.ubifs/hashtable/hashtable_itr.c
+@@ -35,18 +35,6 @@ hashtable_iterator(struct hashtable *h)
+ }
+ 
+ /*****************************************************************************/
+-/* key      - return the key of the (key,value) pair at the current position */
+-/* value    - return the value of the (key,value) pair at the current position */
+-
+-void *
+-hashtable_iterator_key(struct hashtable_itr *i)
+-{ return i->e->k; }
+-
+-void *
+-hashtable_iterator_value(struct hashtable_itr *i)
+-{ return i->e->v; }
+-
+-/*****************************************************************************/
+ /* advance - advance the iterator to the next element
+  *           returns zero if advanced to end of table */
+ 
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 267d1e9..ce63695 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
 # Use the latest version at 26 Oct, 2013
-SRCREV = "9f107132a6a073cce37434ca9cda6917dd8d866b"
+SRCREV = "92686f212c9a4e16891c6a3c57629cbf4f0f8360"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
 		file://add-exclusion-to-mkfs-jffs2-git-2.patch \
 		file://fix-armv7-neon-alignment.patch \
+		file://0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch \
 "
 
 PV = "1.5.1+git${SRCPV}"
-- 
2.1.4


