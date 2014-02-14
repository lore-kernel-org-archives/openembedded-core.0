Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 284496DC16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 08:15:21 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id uo5so11959140pbc.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 00:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jT527qt5xF0/eIKvQEtd5hHRzjwud+uyGUzfbf7jZfo=;
	b=wPBdJcMIDdwE+mvNrDhqz9Cv7ML3CBDRCzK6/fg7En3fbOHJAdL31P+T/mmA2KJz6Z
	gnL6sITexx7IrG1hhj6KSAgZgd/D7XRfeA9jFy42hZqPCAlO8F393yXdiF6v8hVHJ9pX
	WfgPv79iwwOQw+/9cTcrRD707Bff4OXSkLJjdhzERbOUWM+yO20u8n2BdDatg6fIP/yG
	aXDkw3+qZB6r/bHj3Zhi9zScC12DXokhazWNa46Mkt/3LSGkuyy+JSLXHVGc0IoPuzVs
	ZFC/831gvu00288QUUKw8dHcaP14Tax6+p1qJJbkqRAiMD9EZBo6Xk7O4AN2AN9+uwpq
	TDAg==
X-Received: by 10.68.190.228 with SMTP id gt4mr7579305pbc.94.1392365721511;
	Fri, 14 Feb 2014 00:15:21 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	vx10sm34821714pac.17.2014.02.14.00.15.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Feb 2014 00:15:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2014 00:15:46 -0800
Message-Id: <1392365746-8949-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] systemd: Refresh patches for uclibc
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
X-List-Received-Date: Fri, 14 Feb 2014 08:15:22 -0000

With recent patches added some of uclibc specific patches need
to be refreshed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/systemd-pam-fix-fallocate.patch        |   53 ++++++++++----------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
index 7cf9626..d1740ef 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
@@ -1,11 +1,11 @@
 Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: git/src/journal/journal-file.c
+Index: systemd-208/src/journal/journal-file.c
 ===================================================================
---- git.orig/src/journal/journal-file.c	2012-09-02 09:49:15.126089594 -0700
-+++ git/src/journal/journal-file.c	2012-09-02 09:49:17.118089670 -0700
-@@ -34,6 +34,8 @@
+--- systemd-208.orig/src/journal/journal-file.c	2014-02-14 00:05:05.000000000 -0800
++++ systemd-208/src/journal/journal-file.c	2014-02-14 00:08:41.338821677 -0800
+@@ -38,6 +38,8 @@
  #include "compress.h"
  #include "fsprg.h"
  
@@ -14,16 +14,16 @@ Index: git/src/journal/journal-file.c
  #define DEFAULT_DATA_HASH_TABLE_SIZE (2047ULL*sizeof(HashItem))
  #define DEFAULT_FIELD_HASH_TABLE_SIZE (333ULL*sizeof(HashItem))
  
-@@ -262,7 +264,7 @@
+@@ -316,7 +318,7 @@
  
  static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
-         uint64_t old_size, new_size;
+         uint64_t old_size, new_size, file_size;
 -        int r;
 +        int r = 0;
  
          assert(f);
  
-@@ -307,10 +309,25 @@
+@@ -359,9 +361,24 @@
          /* Note that the glibc fallocate() fallback is very
             inefficient, hence we try to minimize the allocation area
             as we can. */
@@ -31,29 +31,28 @@ Index: git/src/journal/journal-file.c
          r = posix_fallocate(f->fd, old_size, new_size - old_size);
          if (r != 0)
                  return -r;
- 
 +#else
-+	/* Use good old method to write zeros into the journal file
-+	   perhaps very inefficient yet working. */
-+	if(new_size > old_size) {
-+		char *buf = alloca(new_size - old_size);
-+		off_t oldpos = lseek(f->fd, 0, SEEK_CUR);
-+		bzero(buf, new_size - old_size);
-+		lseek(f->fd, old_size, SEEK_SET);
-+		r = write(f->fd, buf, new_size - old_size);
-+		lseek(f->fd, oldpos, SEEK_SET);
-+	}
-+	if (r < 0)
-+		return -errno;
++       /* Use good old method to write zeros into the journal file
++          perhaps very inefficient yet working. */
++       if(new_size > old_size) {
++               char *buf = alloca(new_size - old_size);
++               off_t oldpos = lseek(f->fd, 0, SEEK_CUR);
++               bzero(buf, new_size - old_size);
++               lseek(f->fd, old_size, SEEK_SET);
++               r = write(f->fd, buf, new_size - old_size);
++               lseek(f->fd, oldpos, SEEK_SET);
++       }
++       if (r < 0)
++               return -errno;
 +#endif /* HAVE_POSIX_FALLOCATE */
-         if (fstat(f->fd, &f->last_stat) < 0)
-                 return -errno;
  
-Index: git/src/journal/journald-kmsg.c
+         /* Increase the file size a bit further than this, so that we
+          * we can create larger memory maps to cache */
+Index: systemd-208/src/journal/journald-kmsg.c
 ===================================================================
---- git.orig/src/journal/journald-kmsg.c	2012-09-02 09:49:15.130089595 -0700
-+++ git/src/journal/journald-kmsg.c	2012-09-02 12:26:17.326447895 -0700
-@@ -404,6 +404,7 @@
+--- systemd-208.orig/src/journal/journald-kmsg.c	2014-02-14 00:05:05.000000000 -0800
++++ systemd-208/src/journal/journald-kmsg.c	2014-02-14 00:05:47.498823000 -0800
+@@ -407,6 +407,7 @@
  
  int server_open_kernel_seqnum(Server *s) {
          int fd;
@@ -61,7 +60,7 @@ Index: git/src/journal/journald-kmsg.c
          uint64_t *p;
  
          assert(s);
-@@ -417,8 +418,19 @@
+@@ -420,8 +421,19 @@
                  log_error("Failed to open /run/systemd/journal/kernel-seqnum, ignoring: %m");
                  return 0;
          }
-- 
1.7.10.4


