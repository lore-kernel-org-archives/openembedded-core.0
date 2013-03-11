Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UEwTm-0007BF-7a
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 07:45:06 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so3336719pbc.22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2013 23:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=i2BBHO8x3GFTxXnF53+vzH/Ab583JnUWssnBo7Qy/B0=;
	b=BfwqRHZPgxmfQbDKOfem+2JZeO5Mg3nT+dJzoEx+/yloyS1tFyRCJkPjpVXzKH88TT
	MyF1ngAkA0OvAydkZqwO1viDB/ltW7me0wGQZXWTOUON12eBFSQedr+hOzN/Qh6sN1W8
	VoPJDT94sq77Nd9eenbjsm1D7aS8uq4Gnl+p+ddwAYr1rVfmqjuwo8tW7YGw0pLKDTk/
	n1GGsioyuIdPq4+UypGET75pd5hkVhHGayIVuuJ5nI7OiNfyGJro1rUv6hKaT7j+fI48
	jUJOQDJbL9p0ZxunV2NPxXh3HBMfVQDqJh99u4TRUfeJbDUwyjyG7TV+3z4u1PZvDWM9
	73vg==
X-Received: by 10.68.138.135 with SMTP id qq7mr25351488pbb.42.1362983303838;
	Sun, 10 Mar 2013 23:28:23 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ab1sm18818473pbd.37.2013.03.10.23.28.22
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 10 Mar 2013 23:28:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2013 23:28:13 -0700
Message-Id: <1362983293-3396-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] gcc-4.7: Fix incorrect warning with -Wcast-qual
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 06:45:08 -0000

This patch backport the fix where -Wcast-qual
reports a bogus warning with 4.7.2, There is
no workaround in code that can be done to avoid
it hence the fix to gcc is backported.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    3 +-
 .../gcc/gcc-4.7/wcast-qual-PR55383.patch           |   43 ++++++++++++++++++++
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/wcast-qual-PR55383.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 8735e48..49f4010 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r18"
+PR = "r19"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
@@ -75,6 +75,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch \
 	   file://0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch \
 	   file://use-ml-conf-files-from-B.patch \
+	   file://wcast-qual-PR55383.patch \
 	  "
 SRC_URI[md5sum] = "cc308a0891e778cfda7a151ab8a6e762"
 SRC_URI[sha256sum] = "8a9283d7010fb9fe5ece3ca507e0af5c19412626384f8a5e9434251ae100b084"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/wcast-qual-PR55383.patch b/meta/recipes-devtools/gcc/gcc-4.7/wcast-qual-PR55383.patch
new file mode 100644
index 0000000..7c5bbe7
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/wcast-qual-PR55383.patch
@@ -0,0 +1,43 @@
+This is a backport from gcc bugzilla
+
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=55383
+
+fixes wrong warning behavior which has no workaround
+other than disabling the warning
+
+Upstream-Status: Backport
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4.7.2/gcc/c-typeck.c
+===================================================================
+--- gcc-4.7.2.orig/gcc/c-typeck.c	2012-09-13 10:04:44.000000000 -0700
++++ gcc-4.7.2/gcc/c-typeck.c	2013-03-10 23:09:17.610899536 -0700
+@@ -4557,7 +4557,7 @@
+     /* There are qualifiers present in IN_OTYPE that are not present
+        in IN_TYPE.  */
+     warning_at (loc, OPT_Wcast_qual,
+-		"cast discards %q#v qualifier from pointer target type",
++		"cast discards %qv qualifier from pointer target type",
+ 		discarded);
+ 
+   if (added || discarded)
+Index: gcc-4.7.2/gcc/testsuite/c-c++-common/Wcast-qual-1.c
+===================================================================
+--- gcc-4.7.2.orig/gcc/testsuite/c-c++-common/Wcast-qual-1.c	2011-04-07 14:47:38.000000000 -0700
++++ gcc-4.7.2/gcc/testsuite/c-c++-common/Wcast-qual-1.c	2013-03-10 23:15:45.610894589 -0700
+@@ -85,11 +85,11 @@
+ void
+ f4 (void * const **bar)
+ {
+-  const void ***p9 = (const void ***) bar; /* { dg-warning "cast" } */
++  const void ***p9 = (const void ***) bar; /* { dg-warning "cast discards .const. qualifier" } */
+   void * const **p11 = (void * const **) bar;
+-  void ** const *p13 = (void ** const *) bar; /* { dg-warning "cast" } */
++  void ** const *p13 = (void ** const *) bar; /* { dg-warning "cast discards .const. qualifier" } */
+   const void * const **p15 = (const void * const **) bar; /* { dg-warning "cast" } */
+-  const void ** const *p17 = (const void ** const *) bar; /* { dg-warning "cast" } */
++  const void ** const *p17 = (const void ** const *) bar; /* { dg-warning "cast discards .const. qualifier" } */
+   void * const * const * p19 = (void * const * const *) bar;
+   const void * const * const *p21 = (const void * const * const *) bar;
+ }
-- 
1.7.9.5



