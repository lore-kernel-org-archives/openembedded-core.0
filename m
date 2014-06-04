Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 447326FBF9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 09:46:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s549kUEF027223
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jun 2014 02:46:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 4 Jun 2014 02:46:30 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Jun 2014 17:47:25 +0800
Message-ID: <d195d6b6ea5c6262b2def2d67513a55c3e9c80ff.1401861580.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1401861580.git.Qi.Chen@windriver.com>
References: <cover.1401861580.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: update a uclibc specific patch to avoid segment fault error
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
X-List-Received-Date: Wed, 04 Jun 2014 09:46:30 -0000
Content-Type: text/plain

The alloca() function allocates space in the stack frame of the caller,
so using alloca(new_size - old_size) would possibly crash the stack,
causing a segment fault error.

This patch fixes the above problem by avoiding using this function in
journal-file.c.

[YOCTO #6201]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../systemd/systemd-pam-fix-fallocate.patch        |   56 +++++++++++---------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
index cfca0b9..f8e19ce 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
@@ -1,10 +1,18 @@
 Upstream-Status: Denied [no desire for uclibc support]
+
+This patch is uclibc specific, thus not suitable for upstream.
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/journal/journal-file.c  |   16 +++++++++++++++-
+ src/journal/journald-kmsg.c |   16 ++++++++++++++--
+ 2 files changed, 29 insertions(+), 3 deletions(-)
 
-Index: git/src/journal/journal-file.c
-===================================================================
---- git.orig/src/journal/journal-file.c	2014-04-22 22:53:05.000000000 -0700
-+++ git/src/journal/journal-file.c	2014-04-22 22:53:51.130236707 -0700
+diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
+index f2f1f35..092f87b 100644
+--- a/src/journal/journal-file.c
++++ b/src/journal/journal-file.c
 @@ -38,6 +38,8 @@
  #include "compress.h"
  #include "fsprg.h"
@@ -14,7 +22,7 @@ Index: git/src/journal/journal-file.c
  #define DEFAULT_DATA_HASH_TABLE_SIZE (2047ULL*sizeof(HashItem))
  #define DEFAULT_FIELD_HASH_TABLE_SIZE (333ULL*sizeof(HashItem))
  
-@@ -314,7 +316,7 @@
+@@ -314,7 +316,7 @@ static int journal_file_verify_header(JournalFile *f) {
  
  static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size) {
          uint64_t old_size, new_size;
@@ -23,7 +31,7 @@ Index: git/src/journal/journal-file.c
  
          assert(f);
  
-@@ -362,9 +364,24 @@
+@@ -362,9 +364,21 @@ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size)
          /* Note that the glibc fallocate() fallback is very
             inefficient, hence we try to minimize the allocation area
             as we can. */
@@ -32,27 +40,24 @@ Index: git/src/journal/journal-file.c
          if (r != 0)
                  return -r;
 +#else
-+       /* Use good old method to write zeros into the journal file
-+          perhaps very inefficient yet working. */
-+       if(new_size > old_size) {
-+               char *buf = alloca(new_size - old_size);
-+               off_t oldpos = lseek(f->fd, 0, SEEK_CUR);
-+               bzero(buf, new_size - old_size);
-+               lseek(f->fd, old_size, SEEK_SET);
-+               r = write(f->fd, buf, new_size - old_size);
-+               lseek(f->fd, oldpos, SEEK_SET);
-+       }
-+       if (r < 0)
-+               return -errno;
++        /* Write something every 512 bytes to make sure the block is allocated */
++        uint64_t len = new_size - old_size;
++        uint64_t offset = old_size;
++        for (offset += (len-1) % 512; len > 0; offset += 512) {
++                len -= 512;
++                if (pwrite(f->fd, "", 1, offset) != 1)
++                        return -errno;
++        }
++
 +#endif /* HAVE_POSIX_FALLOCATE */
  
          if (fstat(f->fd, &f->last_stat) < 0)
                  return -errno;
-Index: git/src/journal/journald-kmsg.c
-===================================================================
---- git.orig/src/journal/journald-kmsg.c	2014-04-22 22:53:05.000000000 -0700
-+++ git/src/journal/journald-kmsg.c	2014-04-22 22:54:27.830236809 -0700
-@@ -437,6 +437,7 @@
+diff --git a/src/journal/journald-kmsg.c b/src/journal/journald-kmsg.c
+index 12992e7..dc4fa93 100644
+--- a/src/journal/journald-kmsg.c
++++ b/src/journal/journald-kmsg.c
+@@ -437,6 +437,7 @@ fail:
  int server_open_kernel_seqnum(Server *s) {
          _cleanup_close_ int fd;
          uint64_t *p;
@@ -60,7 +65,7 @@ Index: git/src/journal/journald-kmsg.c
  
          assert(s);
  
-@@ -449,8 +450,19 @@
+@@ -449,8 +450,19 @@ int server_open_kernel_seqnum(Server *s) {
                  log_error("Failed to open /run/systemd/journal/kernel-seqnum, ignoring: %m");
                  return 0;
          }
@@ -82,3 +87,6 @@ Index: git/src/journal/journald-kmsg.c
                  log_error("Failed to allocate sequential number file, ignoring: %m");
                  return 0;
          }
+-- 
+1.7.9.5
+
-- 
1.7.9.5


