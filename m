Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 176A972D74
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:20:53 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so39394422pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E5lo1Y+C6HcUGxozD8tJlmJzDpdSbNdkt+eFA4MaQWQ=;
	b=m6nnMjcPu0E5oSIcCQZTMQUpKuk30c/S3ece5JmpZKiQ7ckw+CyQ3p4zD49o22iAVa
	LR4D0O7PBQxD9gvseVRUeNNtvXijQCPH2dWm+sJrcnvQg0m6IfaZs8QlNWR7ykvAMkDm
	hDkxfMgTsjcRF4n4voq5EI7hWRwi5qxeQQF3IP2Mp+xzZDbnWtITZ3sKjMya4pd2uzRx
	FC6yDX3+IIWhqC8T8KiAznNhRp7JH7oJgrZxn9m3sn009TfE1FAniyMICywaq3MKHrMy
	KUzhhJ5LZmCpUzJRNrSvoe9i5mihE/lNTM8YHc/77WTyDFdO4Qtk5QJgusR3qEFTlMKI
	4L9A==
X-Received: by 10.67.7.162 with SMTP id dd2mr6920331pad.151.1428715255065;
	Fri, 10 Apr 2015 18:20:55 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.20.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:20:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:32 -0700
Message-Id: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 01/17] mtd-utils: update to latest and fix static inlining
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
X-List-Received-Date: Sat, 11 Apr 2015 01:20:54 -0000

use static storage class instead of extern for inline functions
and remove duplicate definitions as a result

Change-Id: I72e8c5f19dff656c18f719d1e9e2ca697c9a856f
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emove-duplicate-hashtable_iterator_value-.patch | 64 ++++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
new file mode 100644
index 0000000..2d36158
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
@@ -0,0 +1,64 @@
+From b856ff35c20124ceae40bbc4d32584df47618c96 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Feb 2015 09:28:26 +0000
+Subject: [PATCH] hashtable: Remove duplicate hashtable_iterator_value/hashtable_iterator_key
+
+gcc5 is defaulting to gnu11 instead of gnu89 like previous versions
+as a result the semantics of 'extern inline' changes where in gnu89 for 'extern inline' no external
+visible function is generated,in c99 'external inline' generates externally visible function
+there is no equivalent in c99+ because redefinitions arent allowed
+but 'static inline' remains same for for c89 and c99+, thats why we change the semantics
+so we make the functions static inline, and achieve the same effect
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: pending
+
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
index 12daffe..f991ea1 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -13,6 +13,7 @@ SRCREV = "9f107132a6a073cce37434ca9cda6917dd8d866b"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            file://fix-armv7-neon-alignment.patch \
+           file://0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch \
 "
 
 S = "${WORKDIR}/git/"
-- 
2.1.4


