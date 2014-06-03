Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F148465F1E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 07:41:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s537fGFi012584
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Jun 2014 00:41:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 3 Jun 2014 00:41:16 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jun 2014 15:42:08 +0800
Message-ID: <cd4a352b664c2c15c0ad9ff7bc4e5870f2e0c941.1401781206.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1401781206.git.Qi.Chen@windriver.com>
References: <cover.1401781206.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: matt.cowell@nsn.com
Subject: [daisy][PATCH 1/1] systemd: do not use alloca() function in case of uclibc
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
X-List-Received-Date: Tue, 03 Jun 2014 07:41:17 -0000
Content-Type: text/plain

The alloca() function allocates space in the stack frame of the caller,
so using alloca(new_size - old_size) would possibly crash the stack,
causing a segment fault error.

This patch fixes the above problem by avoiding using this function in
journal-file.c.

[YOCTO #6201]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-journal-file.c-do-not-use-alloca.patch    |   54 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_211.bb           |    1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch b/meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch
new file mode 100644
index 0000000..a638d58
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-journal-file.c-do-not-use-alloca.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Inappropriate [oe specific]
+
+journal-file.c: do not use alloca
+
+Using alloca(new_size - old_size) would possibly cause a segment fault
+error. Note that the alloca function allocates space in the stack frame
+of the caller. So it's possible that the allocated size exceeds the stack
+size limit.
+
+There's actually no need to allocate stack here, we only need to write some
+bytes to the block to make sure the needed block space is available, just like
+eglibc does in posix_fallocate.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+---
+ src/journal/journal-file.c |   21 +++++++++------------
+ 1 file changed, 9 insertions(+), 12 deletions(-)
+
+diff --git a/src/journal/journal-file.c b/src/journal/journal-file.c
+index cef8bba..e364298 100644
+--- a/src/journal/journal-file.c
++++ b/src/journal/journal-file.c
+@@ -371,18 +371,15 @@ static int journal_file_allocate(JournalFile *f, uint64_t offset, uint64_t size)
+         if (r != 0)
+                 return -r;
+ #else
+-       /* Use good old method to write zeros into the journal file
+-          perhaps very inefficient yet working. */
+-       if(new_size > old_size) {
+-               char *buf = alloca(new_size - old_size);
+-               off_t oldpos = lseek(f->fd, 0, SEEK_CUR);
+-               bzero(buf, new_size - old_size);
+-               lseek(f->fd, old_size, SEEK_SET);
+-               r = write(f->fd, buf, new_size - old_size);
+-               lseek(f->fd, oldpos, SEEK_SET);
+-       }
+-       if (r < 0)
+-               return -errno;
++        /* Write something every 512 bytes to make sure the block is allocated */
++        uint64_t len = new_size - old_size;
++        uint64_t offset = old_size;
++        for (offset += (len-1) % 512; len > 0; offset += 512) {
++                len -= 512;
++                if (pwrite(f->fd, "", 1, offset) != 1)
++                        return -errno;
++        }
++
+ #endif /* HAVE_POSIX_FALLOCATE */
+ 
+         if (fstat(f->fd, &f->last_stat) < 0)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/systemd/systemd_211.bb b/meta/recipes-core/systemd/systemd_211.bb
index 44b1965..3eb3778 100644
--- a/meta/recipes-core/systemd/systemd_211.bb
+++ b/meta/recipes-core/systemd/systemd_211.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://uclibc-sysinfo_h.patch \
            file://uclibc-get-physmem.patch \
            file://sd-bus-don-t-use-assert_return-to-check-for-disconne.patch \
+           file://0001-journal-file.c-do-not-use-alloca.patch \
            \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
-- 
1.7.9.5


