Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 702147728F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 23:39:47 +0000 (UTC)
Received: by pasz6 with SMTP id z6so82432879pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DS+w1wzjKU4NrcyJtpGsA1GrnpKgf/ZUrr+PD9Iwo08=;
	b=n/p9lKeMA/RvzMiLX/wpE/UfiSf3DbQLRFYIPGtAick+DVUok0iauPU7ApPRfsgRNt
	AnmPvxyDUf/WeFTn7h7OZfD9KrjBlBTgUjhDTVRKputL8aE0K+haCnqHG+hZ6jPuR2/g
	dra2PSQUGDoR4qhR6jd9rM78hub9mBEW4+LhBFhwp8I04UbOHcTnOBvtiusLfD5I7I5G
	dbZF9GrGPflKtxuNLWJhv74x9LEMSCFilGdvOqpKIky3aOJ+PIsCXZAKZL98pKSRmWyj
	wmdiQwP2WYnRbd/bUwbvNLIHIewU1HKq5T+OkKh3PKxlbeCdNLg56WqXsok5BVy1Dafs
	Ny3Q==
X-Received: by 10.69.17.66 with SMTP id gc2mr27474434pbd.24.1447371587804;
	Thu, 12 Nov 2015 15:39:47 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	cs5sm16739866pbc.15.2015.11.12.15.39.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 15:39:46 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:39:15 -0700
Message-Id: <3481b9e7f46ae8facce3762503920d0b253ec9a5.1447371033.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
References: <fb3e5cc3095925f349046ed1da766ea2765e0949.1447371033.git.chris_larson@mentor.com>
In-Reply-To: <cover.1447371033.git.chris_larson@mentor.com>
References: <cover.1447371033.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 04/11] blkspace: fix ldflags for iowatcher
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
X-List-Received-Date: Thu, 12 Nov 2015 23:39:47 -0000

From: Christopher Larson <chris_larson@mentor.com>

This quiets a GNU_HASH warning.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../recipes-kernel/blktrace/blktrace/ldflags.patch | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
index 037d161..dea1aa2 100644
--- a/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
+++ b/meta/recipes-kernel/blktrace/blktrace/ldflags.patch
@@ -9,11 +9,6 @@ http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor as of commit id
 aed463414e2e2bf8ca44ba54ee5973e7ed599e57
 
 Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
----
- Makefile          |   11 ++++++-----
- btreplay/Makefile |    3 ++-
- btt/Makefile      |    3 ++-
- 3 files changed, 10 insertions(+), 7 deletions(-)
 
 --- git.orig/Makefile
 +++ git/Makefile
@@ -91,3 +86,21 @@ Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
  
  ifneq ($(wildcard .depend),)
  include .depend
+--- git.orig/iowatcher/Makefile
++++ git/iowatcher/Makefile
+@@ -1,5 +1,6 @@
+ C      = gcc
+ CFLAGS  = -Wall -O0 -g -W
++LDFLAGS =
+ ALL_CFLAGS = $(CFLAGS) -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
+ 
+ PROGS = iowatcher
+@@ -19,7 +20,7 @@ all: $(ALL)
+ 	$(CC) -o $*.o -c $(ALL_CFLAGS) $<
+ 
+ iowatcher: blkparse.o plot.o main.o tracers.o mpstat.o fio.o
+-	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) -lm
++	$(CC) $(ALL_CFLAGS) -o $@ $(filter %.o,$^) -lm $(LDFLAGS)
+ 
+ depend:
+ 	@$(CC) -MM $(ALL_CFLAGS) *.c 1> .depend
-- 
2.2.1


