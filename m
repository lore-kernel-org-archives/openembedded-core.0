Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id B64F973D14
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:01 +0000 (UTC)
Received: by iget9 with SMTP id t9so5086766ige.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=bBjBQjs5vyr2se72/HEtgTCXBEHQzSjWU7p6Eyi6t9A=;
	b=MhaJBusk03F69idUTRd9V+BMyL70uMcFmhFLlBWa7aSsnmE3ZS9L1RPzrCMvBbgEPA
	DIk/HVGFdIxEqmKLFicIsv+81JijV8Ej3uPKMpv+66hdKUIbEMnBa7P8WS1mU0/tDhe5
	QewSmeXXqzBKIsA1oz/0ns0eIusk8hfraAVNPShrHzVA21sVqFybNFOz1+10BvWCa5B6
	EcAV7lHhNSpgaMhC87EsBk2IcWdq9iFFfCibBf+KlBrVEoqpEEwldr1EehGMuJQsyHCt
	spbVzDxAIebRhHPSajSCfpc97RA+62qkG7XDmX15bBTOforWWk7Key1Qndr/mDKzbxXk
	sAkw==
X-Received: by 10.50.30.130 with SMTP id s2mr25222135igh.11.1428341822558;
	Mon, 06 Apr 2015 10:37:02 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:30 +0000
Message-Id: <fe627d2aeef3ed39caa98f73942c0f23ff2bf825.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 02/24] mtd-utils: update to latest and fix static inlining
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:03 -0000

use static storage class instead of extern for inline functions
and remove duplicate definitions as a result

Change-Id: I72e8c5f19dff656c18f719d1e9e2ca697c9a856f
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...emove-duplicate-hashtable_iterator_value-.patch | 56 ++++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  1 +
 2 files changed, 57 insertions(+)
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


