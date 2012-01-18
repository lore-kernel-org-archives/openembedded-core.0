Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RnLtj-0004dR-1a
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 04:09:15 +0100
Received: by yenr5 with SMTP id r5so1933133yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 19:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KLaPJ5FupPI5FjP8qEI14fZIOJLd1GbzLU2whe6YXbk=;
	b=P8o6nDfxLkHKfwMCcTmYvFjIspwxeY0i+XTYKt5z4U3UMVLaJ7JeXK/V33oIl3PVdZ
	kBSu2u+krCj/StMXynsFn66vQ6vZkk6/JTLYiim8GcJ0iMQOFrPY9c8rgjTSeAc8E7B/
	XuSWRLPE1qilACUhDTnprQZE0yiXMAuQHFUfY=
Received: by 10.236.145.33 with SMTP id o21mr28001105yhj.56.1326855695973;
	Tue, 17 Jan 2012 19:01:35 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id f47sm40216636yhh.8.2012.01.17.19.01.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 19:01:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 19:01:05 -0800
Message-Id: <1326855665-11617-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] e2fsprogs_1.42.bb: Fix build fallout for uclibc
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
X-List-Received-Date: Wed, 18 Jan 2012 03:09:15 -0000

e2fsprogs 1.42 onwards uses fallocate() which uclibc
does not implement(yet). In most of places its use
is controlled and it only used when configure detects
fallocate being present but in this one case it missed
to check for fallocate being available so here we
add the check

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../e2fsprogs/e2fsprogs-1.42/fallocate.patch       |   22 ++++++++++++++++++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |    3 +-
 2 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
new file mode 100644
index 0000000..4d952a5
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
@@ -0,0 +1,22 @@
+We assume that fallocate is supported somehow
+but we need to check if we have fallocate()
+this problem shows up on uclibc systems since
+uclibc does not have fallocate() implemented
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: e2fsprogs-1.42/lib/ext2fs/unix_io.c
+===================================================================
+--- e2fsprogs-1.42.orig/lib/ext2fs/unix_io.c	2012-01-17 17:24:34.290780625 -0800
++++ e2fsprogs-1.42/lib/ext2fs/unix_io.c	2012-01-17 17:25:37.338783680 -0800
+@@ -895,7 +895,7 @@
+ 		goto unimplemented;
+ #endif
+ 	} else {
+-#ifdef FALLOC_FL_PUNCH_HOLE
++#if defined FALLOC_FL_PUNCH_HOLE && defined HAVE_FALLOCATE
+ 		/*
+ 		 * If we are not on block device, try to use punch hole
+ 		 * to reclaim free space.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
index 9ff85a2..f6759aa7 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
@@ -1,8 +1,9 @@
 require e2fsprogs.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://quotefix.patch \
+            file://fallocate.patch \
             file://acinclude.m4"
 
 SRC_URI[md5sum] = "a3c4ffd7352310ab5e9412965d575610"
-- 
1.7.5.4



