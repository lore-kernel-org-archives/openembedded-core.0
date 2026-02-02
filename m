Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9369ED172B9
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 02:35:14 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44268.1769999706661273084
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 18:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gChPPRtl;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a8ff2ca490so4666065ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 18:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769999706; x=1770604506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kaV6CyXfO3F9i9SxjPF5Yo6MNPoyi8aBs8hyWVPyc08=;
        b=gChPPRtlVLk1J2p3TFnMYaIwug7wuGAL/IZHA7jhY55ZfUR9/zAn7f7Kq4bI/uwgvx
         A4YKhhhocdcaPlH4DC2g5aisIj+B0G+gemgVSiA2biDB645NhI7nqrwjd6pm4JAk9lCH
         GBxXVrwqrcSMXV81skS6d3cBr4SjMQZc6/vdVbMO+qCjyx3iONsIWtBc6R2ytEjW89m9
         l23sTinVAin/7ybYtH3dD2rk725j9683wNduvNwqlL2uk+BH5qbMvsjAtfJq/CgNdveU
         P3VCbYdPPp/bRo+t9vawdcOih4wjo3+idXlidyflDdbMQ+HFPXAvOIpa0sXi2xDKAA2V
         xjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769999706; x=1770604506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaV6CyXfO3F9i9SxjPF5Yo6MNPoyi8aBs8hyWVPyc08=;
        b=U/gj3Tr3eweAbwQvDAawDWf9XarNA1KSxM34mzSfBkP4qb1u6gCsrEq9sF1mOOmkpx
         TuoVYFur00sUXpsN4n8y3m+B5k+19pZUaXcRWqHo5bkqMZpnnoXnqe0vnxhzVUf5hpo8
         /3ukFsKmZrolVXfIvcqhoRDN58MPpGAj5YnYRUSvP2aFL8qkspvtSo6MwE+jguZwRuAS
         wUFSnlgqviLXIx/OzCTf4YrQ2/GeShX8eifyZBbxIN+iNq1Ftkb+fLUy0l5+IaCkP3g5
         sjNO5y3KdHDK2imLxxZav4ODZ1QLFCr58e5QFgI86GiOV5YGJhRhi4IeAX15Kdimv5NR
         rI8g==
X-Gm-Message-State: AOJu0YylNC/8skNF/NKs5Ix1qRt+vZgH3xS+/ZEUHFs47O/6Net3mkKG
	wJQkkR6j9EMugyVTTwjdGQrr33zf/9YvE/2I7uYcOZgX+ASHTYviHSJgMGBqwQ==
X-Gm-Gg: AZuq6aK9B/J9g5jRVAN3OjFJJsadW63zcseL2QBXXhsce4Y8k3MzWKf4rJJGOEFn8E7
	sS59jdzMQ5pWYzaYeknHmtxoZegWmF8X4vIAiO2CzLWFPAMYOfypL+U2x0+uAKBlVMEaflQRk32
	YUfeCmwLngsoCNfJ12EirHMdq4/z5Oua6fXKS/OIxwJATDUw3tRtfxrRhQS4h1M4lm5t3976S96
	ZVtXiSd/GA+g446Ss+Dg6wiK1POFERWcNLSvVoDLmUZNU3VBjZzKQdcMJGvlUatIHHMT2C+9ZW0
	MwOC1dV5KTsYPnIvM7RvyEqeXzGMXEePPByYAa1kd9w5yOPwIO7CqFc71L86Yf00kpnL9Mibj7v
	ON7IpbIZFZ6LiOYEfbXac1vkBwldhGPaFL/vST0qd3tOajY5dI9OudRa/qabMl+gU9n5no5yFbT
	vZbCu+6KhqZgZ/M4EuDCRLvRg=
X-Received: by 2002:a17:903:2f0b:b0:2a8:7814:47ca with SMTP id d9443c01a7336-2a8d7d8a184mr112015215ad.0.1769999705677;
        Sun, 01 Feb 2026 18:35:05 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a8bd74e9bbsm107104095ad.95.2026.02.01.18.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 18:35:04 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH v2] mdadm: upgrade 4.4 -> 4.5
Date: Mon,  2 Feb 2026 15:34:57 +1300
Message-ID: <20260202023457.133774-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 02:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230341

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/tree/CHANGELOG.md?h=mdadm-4.5

Replaced 0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
with 0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch as
partial changes from first patch are part of the upstream version[1].

Dropped patches that are part of upstream version
- xmalloc.patch [2]
- 0001-Makefile-install-mdcheck.patch [3]

Also refreshed other patches.

[1] https://github.com/md-raid-utilities/mdadm/commit/787cc1b60130b8031be59e49d54463c58cd8cf74
[2] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/raid6check.c?h=mdadm-4.5&id=e0df6c4c984d564e9e40913727e916a6cd8f466e
[3] https://github.com/md-raid-utilities/mdadm/commit/934d81184880d2231b0d7b3836b12358516ea35c

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
changes in v2:
- dropped mdcheck install patch to address reproducibility issue
- removed dropped patches from git
---
 ...-corosync-and-dlm-header-files-check.patch |   6 +-
 .../files/0001-Makefile-install-mdcheck.patch |  27 ---
 ...tripe.c-Use-64-bit-off_t-across-both.patch |  54 ++++++
 ...FILE_OFFSET_BITS-to-enable-largefile.patch | 155 ------------------
 ...-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch |   6 +-
 .../mdadm/files/xmalloc.patch                 |  32 ----
 .../mdadm/{mdadm_4.4.bb => mdadm_4.5.bb}      |   8 +-
 7 files changed, 63 insertions(+), 225 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/xmalloc.patch
 rename meta/recipes-extended/mdadm/{mdadm_4.4.bb => mdadm_4.5.bb} (93%)

diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
index 8598aea1f1..9572c2e8c7 100644
--- a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
+++ b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
@@ -1,4 +1,4 @@
-From 232101e2fcc6359fb6db2bc232570e373e368c75 Mon Sep 17 00:00:00 2001
+From 77e9527a0ea995ed377e00813eeeb17175dbce72 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Tue, 9 Feb 2016 11:44:01 +0200
 Subject: [PATCH] Fix the path of corosync and dlm header files check
@@ -14,10 +14,10 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index bcd092de..0a78cd22 100644
+index 8031ce24..788ff5d9 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -130,8 +130,8 @@ FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
+@@ -120,8 +120,8 @@ FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
  SYSTEMD_DIR=/lib/systemd/system
  LIB_DIR=/usr/libexec/mdadm
  
diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
deleted file mode 100644
index bb4e8d0604..0000000000
--- a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 407691e11037709af888ce2cf6bd5eac6971ac61 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Tue, 25 Jan 2022 16:25:01 +0800
-Subject: [PATCH] Makefile: install mdcheck
-
-The mdcheck_xxx.service files use mdcheck, but it's not installed.
-We need to install this script.
-
-Upstream-Status: Submitted [Sent patch to maintainer]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Makefile | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Makefile b/Makefile
-index 981e16fa..b28e7855 100644
---- a/Makefile
-+++ b/Makefile
-@@ -345,6 +345,7 @@ install-systemd: systemd/mdmon@.service
- install-bin: mdadm mdmon
- 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
- 	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
-+	$(INSTALL) -D -m 755 misc/mdcheck $(DESTDIR)/usr/share/mdadm/mdcheck
- 
- uninstall:
- 	rm -f $(DESTDIR)$(MAN8DIR)/mdadm.8 $(DESTDIR)$(MAN8DIR)/mdmon.8 $(DESTDIR)$(MAN4DIR)/md.4 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5 $(DESTDIR)$(BINDIR)/mdadm
diff --git a/meta/recipes-extended/mdadm/files/0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch b/meta/recipes-extended/mdadm/files/0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch
new file mode 100644
index 0000000000..ca4cec5ab8
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch
@@ -0,0 +1,54 @@
+From 0d685f4ec8b54860a031fe3e04a2fff535288f80 Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Mon, 26 Jan 2026 22:46:51 +1300
+Subject: [PATCH] raid6check.c, restripe.c: Use 64-bit off_t across both musl
+ and glibc
+
+This commit is adaptation of original patch[1] after commit[2] addressed
+lseek issues.
+
+[1] https://lore.kernel.org/linux-raid/20221110225546.337164-1-raj.khem@gmail.com/
+[2] https://github.com/md-raid-utilities/mdadm/commit/787cc1b60130b8031be59e49d54463c58cd8cf74
+
+Upstream-Status: Submitted [https://github.com/md-raid-utilities/mdadm/pull/235]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ raid6check.c | 4 ++--
+ restripe.c   | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/raid6check.c b/raid6check.c
+index 4469dc8f..fa50d44e 100644
+--- a/raid6check.c
++++ b/raid6check.c
+@@ -288,7 +288,7 @@ int manual_repair(int chunk_size, int syndrome_disks,
+ 	}
+ 
+ 	int write_res1, write_res2;
+-	off64_t seek_res;
++	off_t seek_res;
+ 
+ 	seek_res = lseek(source[fd1], offsets[fd1] + start * chunk_size, SEEK_SET);
+ 	if (seek_res < 0) {
+@@ -381,7 +381,7 @@ int check_stripes(struct mdinfo *info, int *source, unsigned long long *offsets,
+ 			goto exitCheck;
+ 		}
+ 		for (i = 0 ; i < raid_disks ; i++) {
+-			off64_t seek_res = lseek(source[i], offsets[i] + start * chunk_size,
++			off_t seek_res = lseek(source[i], offsets[i] + start * chunk_size,
+ 						   SEEK_SET);
+ 			if (seek_res < 0) {
+ 				fprintf(stderr, "lseek to source %d failed\n", i);
+diff --git a/restripe.c b/restripe.c
+index ec8d6275..58c0f5f5 100644
+--- a/restripe.c
++++ b/restripe.c
+@@ -756,7 +756,7 @@ int restore_stripes(int *dest, unsigned long long *offsets,
+ 			if (src_buf == NULL) {
+ 				/* read from file */
+ 				if (lseek(source, read_offset, 0) !=
+-					 (off64_t)read_offset) {
++					 (off_t)read_offset) {
+ 					rv = -1;
+ 					goto abort;
+ 				}
diff --git a/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch b/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
deleted file mode 100644
index aa874dbec3..0000000000
--- a/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From 9e3b15adf86147fe581cd2159cb99708abe26158 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 10 Nov 2022 12:31:22 -0800
-Subject: [PATCH] restripe.c: Use _FILE_OFFSET_BITS to enable largefile support
-
-Instead of using the lseek64 and friends, its better to enable it via
-the feature macro _FILE_OFFSET_BITS = 64 and let the C library deal with
-the width of types
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-raid/20221110225546.337164-1-raj.khem@gmail.com/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- raid6check.c | 11 +++++++----
- restripe.c   | 13 ++++++++-----
- swap_super.c | 13 +++++++------
- 3 files changed, 22 insertions(+), 15 deletions(-)
-
-diff --git a/raid6check.c b/raid6check.c
-index 99477761..8e7f1421 100644
---- a/raid6check.c
-+++ b/raid6check.c
-@@ -22,6 +22,9 @@
-  *    Based on "restripe.c" from "mdadm" codebase
-  */
- 
-+/* Enable largefile support */
-+#define _FILE_OFFSET_BITS 64
-+
- #include "mdadm.h"
- #include <stdint.h>
- #include <sys/mman.h>
-@@ -284,9 +287,9 @@ int manual_repair(int chunk_size, int syndrome_disks,
- 	}
- 
- 	int write_res1, write_res2;
--	off64_t seek_res;
-+	off_t seek_res;
- 
--	seek_res = lseek64(source[fd1],
-+	seek_res = lseek(source[fd1],
- 			   offsets[fd1] + start * chunk_size, SEEK_SET);
- 	if (seek_res < 0) {
- 		fprintf(stderr, "lseek failed for failed_disk1\n");
-@@ -294,7 +297,7 @@ int manual_repair(int chunk_size, int syndrome_disks,
- 	}
- 	write_res1 = write(source[fd1], blocks[failed_slot1], chunk_size);
- 
--	seek_res = lseek64(source[fd2],
-+	seek_res = lseek(source[fd2],
- 			   offsets[fd2] + start * chunk_size, SEEK_SET);
- 	if (seek_res < 0) {
- 		fprintf(stderr, "lseek failed for failed_disk2\n");
-@@ -379,7 +382,7 @@ int check_stripes(struct mdinfo *info, int *source, unsigned long long *offsets,
- 			goto exitCheck;
- 		}
- 		for (i = 0 ; i < raid_disks ; i++) {
--			off64_t seek_res = lseek64(source[i], offsets[i] + start * chunk_size,
-+			off_t seek_res = lseek(source[i], offsets[i] + start * chunk_size,
- 						   SEEK_SET);
- 			if (seek_res < 0) {
- 				fprintf(stderr, "lseek to source %d failed\n", i);
-diff --git a/restripe.c b/restripe.c
-index 5e126eb7..af76c634 100644
---- a/restripe.c
-+++ b/restripe.c
-@@ -22,6 +22,9 @@
-  *    Email: <neilb@suse.de>
-  */
- 
-+/* Enable largefile support */
-+#define _FILE_OFFSET_BITS 64
-+
- #include "mdadm.h"
- #include "xmalloc.h"
- 
-@@ -583,7 +586,7 @@ int save_stripes(int *source, unsigned long long *offsets,
- 				       raid_disks, level, layout);
- 			if (dnum < 0) abort();
- 			if (source[dnum] < 0 ||
--			    lseek64(source[dnum],
-+			    lseek(source[dnum],
- 				    offsets[dnum] + offset, 0) < 0 ||
- 			    read(source[dnum], buf+disk * chunk_size,
- 				 chunk_size) != chunk_size) {
-@@ -756,8 +759,8 @@ int restore_stripes(int *dest, unsigned long long *offsets,
- 					   raid_disks, level, layout);
- 			if (src_buf == NULL) {
- 				/* read from file */
--				if (lseek64(source, read_offset, 0) !=
--					 (off64_t)read_offset) {
-+				if (lseek(source, read_offset, 0) !=
-+					 (off_t)read_offset) {
- 					rv = -1;
- 					goto abort;
- 				}
-@@ -818,7 +821,7 @@ int restore_stripes(int *dest, unsigned long long *offsets,
- 		}
- 		for (i=0; i < raid_disks ; i++)
- 			if (dest[i] >= 0) {
--				if (lseek64(dest[i],
-+				if (lseek(dest[i],
- 					 offsets[i]+offset, 0) < 0) {
- 					rv = -1;
- 					goto abort;
-@@ -868,7 +871,7 @@ int test_stripes(int *source, unsigned long long *offsets,
- 		int disk;
- 
- 		for (i = 0 ; i < raid_disks ; i++) {
--			if ((lseek64(source[i], offsets[i]+start, 0) < 0) ||
-+			if ((lseek(source[i], offsets[i]+start, 0) < 0) ||
- 			    (read(source[i], stripes[i], chunk_size) !=
- 			     chunk_size)) {
- 				free(q);
-diff --git a/swap_super.c b/swap_super.c
-index b6db5743..18c89e2b 100644
---- a/swap_super.c
-+++ b/swap_super.c
-@@ -1,3 +1,6 @@
-+/* Enable largefile support */
-+#define _FILE_OFFSET_BITS 64
-+
- #include <unistd.h>
- #include <stdlib.h>
- #include <fcntl.h>
-@@ -16,8 +19,6 @@
- 
- #define MD_NEW_SIZE_SECTORS(x)		((x & ~(MD_RESERVED_SECTORS - 1)) - MD_RESERVED_SECTORS)
- 
--extern long long lseek64(int, long long, int);
--
- int main(int argc, char *argv[])
- {
- 	int fd, i;
-@@ -38,8 +39,8 @@ int main(int argc, char *argv[])
- 		exit(1);
- 	}
- 	offset = MD_NEW_SIZE_SECTORS(size) * 512LL;
--	if (lseek64(fd, offset, 0) < 0LL) {
--		perror("lseek64");
-+	if (lseek(fd, offset, 0) < 0LL) {
-+		perror("lseek");
- 		exit(1);
- 	}
- 	if (read(fd, super, 4096) != 4096) {
-@@ -68,8 +69,8 @@ int main(int argc, char *argv[])
- 		super[32*4+10*4 +i] = t;
- 	}
- 
--	if (lseek64(fd, offset, 0) < 0LL) {
--		perror("lseek64");
-+	if (lseek(fd, offset, 0) < 0LL) {
-+		perror("lseek");
- 		exit(1);
- 	}
- 	if (write(fd, super, 4096) != 4096) {
diff --git a/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch b/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
index e425fc446e..2ef92418ed 100644
--- a/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
+++ b/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
@@ -1,4 +1,4 @@
-From 8de073c637a1ea968b7304f373a20b13a4a47bbc Mon Sep 17 00:00:00 2001
+From b7e51fbedc1fbc44af00398a4a7aef51cdf191ee Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 12 Mar 2024 10:54:08 +0100
 Subject: [PATCH] Create.c: include linux/falloc.h for FALLOC_FL_ZERO_RANGE
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+)
 
 diff --git a/Create.c b/Create.c
-index fd6c9215..3210a03e 100644
+index 4aa75b7e..5d5fc806 100644
 --- a/Create.c
 +++ b/Create.c
-@@ -33,6 +33,7 @@
+@@ -31,6 +31,7 @@
  #include	<signal.h>
  #include	<sys/signalfd.h>
  #include	<sys/wait.h>
diff --git a/meta/recipes-extended/mdadm/files/xmalloc.patch b/meta/recipes-extended/mdadm/files/xmalloc.patch
deleted file mode 100644
index 61774721d0..0000000000
--- a/meta/recipes-extended/mdadm/files/xmalloc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c5cf5a83be4e3ce04ebf3250f77aeb465eeb53a1 Mon Sep 17 00:00:00 2001
-From: Xiao Ni <xni@redhat.com>
-Date: Fri, 17 Jan 2025 15:15:40 +0800
-Subject: [PATCH] mdadm/raid6check: add xmalloc.h to raid6check.c
-
-It reports building error:
-raid6check.c:324:26: error: implicit declaration of function xmalloc
-
-Add xmalloc.h to raid6check.c file to fix this.
-
-Signed-off-by: Xiao Ni <xni@redhat.com>
-Link: https://lore.kernel.org/r/20250117071540.4094-1-xni@redhat.com
-Signed-off-by: Song Liu <song@kernel.org>
-
-Upstream-Status: Backport [https://web.git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?h=main&id=e0df6c4c984d564e9e40913727e916a6cd8f466e]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- raid6check.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/raid6check.c b/raid6check.c
-index 8e7f1421..486b10c6 100644
---- a/raid6check.c
-+++ b/raid6check.c
-@@ -26,6 +26,7 @@
- #define _FILE_OFFSET_BITS 64
- 
- #include "mdadm.h"
-+#include "xmalloc.h"
- #include <stdint.h>
- #include <sys/mman.h>
- 
diff --git a/meta/recipes-extended/mdadm/mdadm_4.4.bb b/meta/recipes-extended/mdadm/mdadm_4.5.bb
similarity index 93%
rename from meta/recipes-extended/mdadm/mdadm_4.4.bb
rename to meta/recipes-extended/mdadm/mdadm_4.5.bb
index 26a60e4c1a..b30d3d776e 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.5.bb
@@ -12,13 +12,11 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;bra
            file://run-ptest \
            file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
            file://mdadm.init \
-           file://0001-Makefile-install-mdcheck.patch \
-           file://0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch \
            file://0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch \
-           file://xmalloc.patch \
+           file://0001-raid6check.c-restripe.c-Use-64-bit-off_t-across-both.patch \
            "
 
-SRCREV = "8e56efac9afd7080bb42bae4b77cdad5f345633a"
+SRCREV = "8f0c7692d48414ff7b3fe927ce75799c65ef24b1"
 
 inherit ptest systemd
 
@@ -37,7 +35,7 @@ CFLAGS:append:mipsarchn32 = ' -D__SANE_USERSPACE_TYPES__'
 
 EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CWFLAGS="" CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${systemd_system_unitdir} \
                 BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev" LDFLAGS="${LDFLAGS}" \
-                SYSROOT="${STAGING_DIR_TARGET}" STRIP='
+                SYSROOT="${STAGING_DIR_TARGET}" MISCDIR="${datadir}/${BPN}" STRIP='
 
 DEBUG_OPTIMIZATION:append = " -Wno-error"
 

