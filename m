Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 10A2B71AFC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 04:13:36 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e69so651610pfg.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 21:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=arzlPTEm8d0PreBzIXeo8Xiaw4q0dl6V2HkjGo6M5y8=;
	b=L73xluX3Un0P5wm6YnR326MIDw4PAhbJA5ouS2Ffa2f6RI5JGMSJb5MNHLVzVeXuBk
	T6oGPvZx9aBunxRfihi0kDeUlbja4ETU5r9kNc/T1VKOv2ZYQSKyXMQGMIE+MvCSpexr
	wIhLql2Fy3g6ln2/pwXHiTOTfPInX3v418WivAW3sjepIg2k3TQGA+utBmIhx05XPAMM
	vx9XwY8i/N25T+xsww8DppI9b11wYpTsIFPfDfBIrd7x0ssXYEP+5xNlXnvQZ9lkgfsC
	AfPpqTc9fi+g+MgXYuNcul+XNX33oFsfh33Gb7Zku77Nwtegt4hZrmum0GGuHWFeEO5C
	C+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=arzlPTEm8d0PreBzIXeo8Xiaw4q0dl6V2HkjGo6M5y8=;
	b=IxsXTubpehe9lNFeoq4ruJkZkn/xB404w4+ISpBy3hzSPGZ8lEuBpe6YLcPRQ5LO5Z
	+MBBUWRgZlCgnKCFxhvMqf63LnUoIVefrOMaEdOPZ5Qv3MDlcSnPIht6grGkAcmFrisd
	p2spd59LwUjaybPiLyg+Owy8UG7Lq9aWZBSnBxcb30lq7oOaP43i/EFNEJ+YPtfTeBjc
	mlG5SblQqHfGQwRkqSRRwtyG5k054+/t8mGOVI5HUbbd9h3Vh08hg88mAPZUGhrjw/5R
	C6cfvwgnJGsYUvMwnEjpqw0u39BGvh/25aOZFcraw7wcURyvFCB45Mg5SNWuiIuL66YR
	YjPg==
X-Gm-Message-State: AHPjjUhn/gNsA2Ne8a1BqAb2UNBPz/QGCTwABQzLNHsHDIVhGiRFPyCZ
	l5sftaIIDc/htEAl
X-Google-Smtp-Source: ADKCNb4VV+7zKVtz5up+BbnjYF/lHsYR0j3AcKAUgg4RkAg4j1wV2aTPQMgZN5Wl+f8qBU7mro29Qw==
X-Received: by 10.84.174.129 with SMTP id r1mr25973506plb.390.1505448817990;
	Thu, 14 Sep 2017 21:13:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	s68sm31475740pfd.72.2017.09.14.21.13.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 21:13:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 21:13:28 -0700
Message-Id: <20170915041328.40148-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] attr: Backports to fix exported headers
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
X-List-Received-Date: Fri, 15 Sep 2017 04:13:37 -0000

Packages which depends on attr headers fail due
to uint32_t not being defined, this needed header
to include sys/types.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../attr/0001-Use-stdint-types-consistently.patch  | 69 ++++++++++++++++++++++
 meta/recipes-support/attr/attr_2.4.47.bb           |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-support/attr/attr/0001-Use-stdint-types-consistently.patch

diff --git a/meta/recipes-support/attr/attr/0001-Use-stdint-types-consistently.patch b/meta/recipes-support/attr/attr/0001-Use-stdint-types-consistently.patch
new file mode 100644
index 0000000000..dcd6507bcc
--- /dev/null
+++ b/meta/recipes-support/attr/attr/0001-Use-stdint-types-consistently.patch
@@ -0,0 +1,69 @@
+From 37a27b6fd09ecb37097b85e5db74e4f77b80fe0a Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Tue, 12 Jan 2016 22:20:33 +0100
+Subject: [PATCH] Use stdint types consistently
+
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ include/attributes.h | 6 ++++--
+ man/man3/attr_list.3 | 8 ++++----
+ 2 files changed, 8 insertions(+), 6 deletions(-)
+
+Index: attr-2.4.47/include/attributes.h
+===================================================================
+--- attr-2.4.47.orig/include/attributes.h
++++ attr-2.4.47/include/attributes.h
+@@ -22,6 +22,7 @@
+ extern "C" {
+ #endif
+ 
++#include <stdint.h>
+ /*
+  *	An almost-IRIX-compatible extended attributes API
+  *	(the IRIX attribute "list" operation is missing, added ATTR_SECURE).
+@@ -69,7 +70,7 @@ typedef struct attrlist {
+  * al_offset[i] entry points to.
+  */
+ typedef struct attrlist_ent {	/* data from attr_list() */
+-	u_int32_t	a_valuelen;	/* number bytes in value of attr */
++	uint32_t	a_valuelen;	/* number bytes in value of attr */
+ 	char		a_name[1];	/* attr name (NULL terminated) */
+ } attrlist_ent_t;
+ 
+@@ -90,7 +91,7 @@ typedef struct attrlist_ent {	/* data fr
+  * operation on a cursor is to bzero() it.
+  */
+ typedef struct attrlist_cursor {
+-	u_int32_t	opaque[4];	/* an opaque cookie */
++	uint32_t	opaque[4];	/* an opaque cookie */
+ } attrlist_cursor_t;
+ 
+ /*
+Index: attr-2.4.47/man/man3/attr_list.3
+===================================================================
+--- attr-2.4.47.orig/man/man3/attr_list.3
++++ attr-2.4.47/man/man3/attr_list.3
+@@ -72,9 +72,9 @@ The contents of an \f4attrlist_t\fP stru
+ .nf
+ .ft 4
+ .ta 9n 22n
+-__int32_t al_count; /\(** number of entries in attrlist \(**/
+-__int32_t al_more; /\(** T/F: more attrs (do syscall again) \(**/
+-__int32_t al_offset[1]; /\(** byte offsets of attrs [var-sized] \(**/
++int32_t al_count; /\(** number of entries in attrlist \(**/
++int32_t al_more; /\(** T/F: more attrs (do syscall again) \(**/
++int32_t al_offset[1]; /\(** byte offsets of attrs [var-sized] \(**/
+ .ft 1
+ .fi
+ .RE
+@@ -113,7 +113,7 @@ include the following members:
+ .nf
+ .ft 4
+ .ta 9n 22n
+-u_int32_t a_valuelen; /\(** number bytes in value of attr \(**/
++uint32_t a_valuelen; /\(** number bytes in value of attr \(**/
+ char a_name[]; /\(** attr name (NULL terminated) \(**/
+ .ft 1
+ .fi
diff --git a/meta/recipes-support/attr/attr_2.4.47.bb b/meta/recipes-support/attr/attr_2.4.47.bb
index 2dada7a1fc..fc88bef830 100644
--- a/meta/recipes-support/attr/attr_2.4.47.bb
+++ b/meta/recipes-support/attr/attr_2.4.47.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://attr-Missing-configure.ac.patch \
             file://dont-use-decl-macros.patch \
             file://Remove-the-section-2-man-pages.patch \
             file://Remove-the-attr.5-man-page-moved-to-man-pages.patch \
+            file://0001-Use-stdint-types-consistently.patch \
            "
 
 SRC_URI[md5sum] = "84f58dec00b60f2dc8fd1c9709291cc7"
-- 
2.14.1


