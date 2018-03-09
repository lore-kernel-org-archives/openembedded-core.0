Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7464A789A0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32652058"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:36 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:56:09 +0200
Message-Id: <20180309185614.31113-31-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 31/36] blktrace: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:35 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/blktrace/blktrace/ldflags.patch | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
index 29eb0f2728a..ab905cf0da3 100644
--- a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
+++ b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
@@ -10,6 +10,8 @@ aed463414e2e2bf8ca44ba54ee5973e7ed599e57
 
 Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
 
+Index: git/Makefile
+===================================================================
 --- git.orig/Makefile
 +++ git/Makefile
 @@ -1,5 +1,6 @@
@@ -19,7 +21,7 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
  ALL_CFLAGS = $(CFLAGS) -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
  PROGS	= blkparse blktrace verify_blkparse blkrawverify blkiomon
  LIBS	= -lpthread
-@@ -23,19 +24,19 @@ btreplay/btreplay:
+@@ -26,19 +27,19 @@ btreplay/btreplay:
  	$(CC) -o $*.o -c $(ALL_CFLAGS) $<
  
  blkparse: blkparse.o blkparse_fmt.o rbtree.o act_mask.o
@@ -44,6 +46,8 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
  
  $(PROGS): | depend
  
+Index: git/btreplay/Makefile
+===================================================================
 --- git.orig/btreplay/Makefile
 +++ git/btreplay/Makefile
 @@ -7,6 +7,7 @@
@@ -55,8 +59,8 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
  OCFLAGS	= -UCOUNT_IOS -UDEBUG -DNDEBUG
  XCFLAGS	= -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
 @@ -32,10 +33,10 @@ clean: docsclean
-	$(CC) $(CFLAGS) -c -o $*.o $<
-
+ 	$(CC) $(CFLAGS) -c -o $*.o $<
+ 
  btrecord: btrecord.o
 -	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^)
 +	$(CC) $(CFLAGS) -o $@ $(filter %.o,$^) $(LDFLAGS)
@@ -67,6 +71,8 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
  
  depend:
  	@$(CC) -MM $(CFLAGS) *.c 1> .depend
+Index: git/btt/Makefile
+===================================================================
 --- git.orig/btt/Makefile
 +++ git/btt/Makefile
 @@ -7,6 +7,7 @@
@@ -86,10 +92,12 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
  
  ifneq ($(wildcard .depend),)
  include .depend
+Index: git/iowatcher/Makefile
+===================================================================
 --- git.orig/iowatcher/Makefile
 +++ git/iowatcher/Makefile
 @@ -1,5 +1,6 @@
- C      = gcc
+ CC      = gcc
  CFLAGS  = -Wall -O2 -g -W -Wunused-result
 +LDFLAGS =
  ALL_CFLAGS = $(CFLAGS) -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
-- 
2.16.1


