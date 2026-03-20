Return-Path: <maxin.john@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D750C1099B3F
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 20:43:08 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22678.1774039387067935394
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 13:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RiXOcYQM;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: maxin.john@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso2302998e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 13:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774039385; x=1774644185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pGsGDv/srbJ1f5c468AzqYjuyUSlalrWML/MJZiecjw=;
        b=RiXOcYQMYRGRK25VcnWdenYd5RZdVXRfzMgw5IvU21rd0yIevrtMo9U//nl3MCj1+r
         3XgLMli0jC7+1bk8I1+JIbnIJQYyo8Wmf9KiHjwZCvItES409EQM2twAwSRno2S/sCbm
         VoSooW4qrJu9TCmnFfz1nWzjor6e13nWrzzdcpXLNjORyHyVe2e8YiHKjN1G4oP6tUp4
         bUBXYu09/3zC97K3colys0YryNXoPZIEcAqNCX9Vm4liHd0HUXAXyHJsu6eSGiZI7HfO
         479gE/ypYmWsmvrYYainvhuphRS2vWM3dr+F3dzePei37K3CuDnA1wfEd6xts1Ayyj4o
         bn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774039385; x=1774644185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGsGDv/srbJ1f5c468AzqYjuyUSlalrWML/MJZiecjw=;
        b=nuJ6QxODM2I2a+YhzrfsmPwHOmNpjunrp3o7czwdQgv98vyrBMaapLwRonRmvWYAlW
         vgKonWnHrV5BPcJhhPs5Q3cf2qEJipLaL4YVPIpBXwZMUGaqsfl9STKzALFjpdIWhJHD
         5PD44MdHr6ze35ojdsGpA+Ln6H6Ig/2Hw1aAtPrI4AvRV1R61875X/XEmbI/5unsQsUP
         AqCWtItPf+GatPTdVJrtkSpngoxUQPjugy/yk4BYzqVpw4wXpBV+m39PMNQOPPvJwkVs
         tLh1y/EaHMWO8cLAGq66QAv4vdxNAX/iXPEAlkLLRyNOBKk/6rbhmOcfztcY6P/Fuf4u
         PHBg==
X-Gm-Message-State: AOJu0YxFPo/GVH5KQfnI54i4heMEhcO9unEXZe6DXCLYIJEY6+VCMHNz
	0SPCENjNPbeLRLHV99UDA5dsLWFlg1g//l6o3KtMkyg3CSu9Wk4Hercuaoh8Cg==
X-Gm-Gg: ATEYQzzHwiS/lH5qsxjApInomso836Bq3X7eKfkXk8I6NRemHMgvuzzyuynuooT238R
	CwVdG/HVniErGeaeSH+pIiZmnOUdTRQYySuHign9TLN+XFiUfgnMrxk2w/cLFrdrlA4STD1NhbY
	6pUJgSjiDkSTs0LEhiXMO3CstWKOGwi+mq9OM5sivfosrx8LnTAl+/qTNHv4kd+o4a2SEPnT9k/
	ADnqkLZ4QSanqcEj/nQILqPgWDzUl9VnD9PNuJ9lkSV+8a/o3taeWoynN8R7comhSaqngfaXbwa
	l73iJjd5waLTQg4uNqENVe0zEa6I0Rgtx+D2IKYqfyWENdehYk6ngifL/AUgVLhzSDb3hFsl5dT
	06LPvPUBz+aY4FRo66+EGRCByQ2NW01gVoLucNSN4F664Ap/NtbAmHK3CApNP87T+IOQFliT4Ne
	RSeOCODMBXDwoL5Dvqu5dYJNC8wn+5KBrS9dSy0GiwNZburM2hXmGMWi1LiN12H1nUD3FnP4ho
X-Received: by 2002:a05:6512:220e:b0:5a1:499d:8f99 with SMTP id 2adb3069b0e04-5a285b5a3b2mr1927118e87.33.1774039383921;
        Fri, 20 Mar 2026 13:43:03 -0700 (PDT)
Received: from Thor.lan (nb6bp2luucgh1ubvhqb-1.v6.elisa-laajakaista.fi. [2001:99a:a58:9b00:9119:221d:45f0:de83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cc5asm752197e87.75.2026.03.20.13.43.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 13:43:03 -0700 (PDT)
From: Maxin John <maxin.john@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mdadm: upgrade 4.4 -> 4.6
Date: Fri, 20 Mar 2026 22:43:02 +0200
Message-ID: <20260320204302.1758572-1-maxin.john@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 20:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233632

Drop backported patch:
- xmalloc.patch

Drop upstreamed patches and patches made obsolete by upstream commits:

- 0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch [1]
- 0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch [2]
- 0001-Makefile-install-mdcheck.patch [3]
- 0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch [4]

[1] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=5b8560e66ca8f72d008778b5daa1059de48fb73a
[2] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?h=main&id=52bead95d2957437c691891fcdc49bd6afccdd49
[3] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?h=main&id=934d81184880d2231b0d7b3836b12358516ea35c
[4] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?h=main&id=787cc1b60130b8031be59e49d54463c58cd8cf74

Changelog:
https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/tree/CHANGELOG.md?h=mdadm-4.6

Signed-off-by: Maxin John <maxin.john@gmail.com>
---
 ...-corosync-and-dlm-header-files-check.patch |  30 ----
 .../files/0001-Makefile-install-mdcheck.patch |  27 ---
 ...FILE_OFFSET_BITS-to-enable-largefile.patch | 155 ------------------
 ...-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch |  27 ---
 .../mdadm/files/xmalloc.patch                 |  32 ----
 .../mdadm/{mdadm_4.4.bb => mdadm_4.6.bb}      |   9 +-
 6 files changed, 2 insertions(+), 278 deletions(-)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
 delete mode 100644 meta/recipes-extended/mdadm/files/xmalloc.patch
 rename meta/recipes-extended/mdadm/{mdadm_4.4.bb => mdadm_4.6.bb} (90%)

diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch b/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
deleted file mode 100644
index 8598aea1f1ef..000000000000
--- a/meta/recipes-extended/mdadm/files/0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 232101e2fcc6359fb6db2bc232570e373e368c75 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Tue, 9 Feb 2016 11:44:01 +0200
-Subject: [PATCH] Fix the path of corosync and dlm header files check
-
-Original Makefile will check headers on host instead of sysroot.
-Fix it.
-
-Upstream-Status: Inappropriate [Yocto specific]
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index bcd092de..0a78cd22 100644
---- a/Makefile
-+++ b/Makefile
-@@ -130,8 +130,8 @@ FAILED_SLOTS_DIR = $(RUN_DIR)/failed-slots
- SYSTEMD_DIR=/lib/systemd/system
- LIB_DIR=/usr/libexec/mdadm
- 
--COROSYNC:=$(shell [ -d /usr/include/corosync ] || echo -DNO_COROSYNC)
--DLM:=$(shell [ -f /usr/include/libdlm.h ] || echo -DNO_DLM)
-+COROSYNC:=$(shell [ -f $(SYSROOT)/usr/include/corosync/cmap.h ] || echo -DNO_COROSYNC)
-+DLM:=$(shell [ -f $(SYSROOT)/usr/include/libdlm.h ] || echo -DNO_DLM)
- 
- DIRFLAGS = -DMAP_DIR=\"$(MAP_DIR)\" -DMAP_FILE=\"$(MAP_FILE)\"
- DIRFLAGS += -DMDMON_DIR=\"$(MDMON_DIR)\"
diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
deleted file mode 100644
index bb4e8d060421..000000000000
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
diff --git a/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch b/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
deleted file mode 100644
index aa874dbec366..000000000000
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
deleted file mode 100644
index e425fc446e27..000000000000
--- a/meta/recipes-extended/mdadm/files/0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8de073c637a1ea968b7304f373a20b13a4a47bbc Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 12 Mar 2024 10:54:08 +0100
-Subject: [PATCH] Create.c: include linux/falloc.h for FALLOC_FL_ZERO_RANGE
- definition
-
-glibc provides this through fcntl.h but musl does not - should
-be reported and fixed there.
-
-Upstream-Status: Inappropriate [musl-specific issue]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Create.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Create.c b/Create.c
-index fd6c9215..3210a03e 100644
---- a/Create.c
-+++ b/Create.c
-@@ -33,6 +33,7 @@
- #include	<signal.h>
- #include	<sys/signalfd.h>
- #include	<sys/wait.h>
-+#include	<linux/falloc.h>
- 
- #ifndef FALLOC_FL_ZERO_RANGE
- #define FALLOC_FL_ZERO_RANGE 16
diff --git a/meta/recipes-extended/mdadm/files/xmalloc.patch b/meta/recipes-extended/mdadm/files/xmalloc.patch
deleted file mode 100644
index 61774721d038..000000000000
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
diff --git a/meta/recipes-extended/mdadm/mdadm_4.4.bb b/meta/recipes-extended/mdadm/mdadm_4.6.bb
similarity index 90%
rename from meta/recipes-extended/mdadm/mdadm_4.4.bb
rename to meta/recipes-extended/mdadm/mdadm_4.6.bb
index 26a60e4c1a30..b1d0a27c7fc7 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.6.bb
@@ -10,17 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;branch=main;tag=mdadm-${PV} \
            file://run-ptest \
-           file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
            file://mdadm.init \
-           file://0001-Makefile-install-mdcheck.patch \
-           file://0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch \
-           file://0002-Create.c-include-linux-falloc.h-for-FALLOC_FL_ZERO_R.patch \
-           file://xmalloc.patch \
            "
 
-SRCREV = "8e56efac9afd7080bb42bae4b77cdad5f345633a"
+SRCREV = "8b414a0d4753693d67b9a5822994e5f0c91b0b0a"
 
-inherit ptest systemd
+inherit pkgconfig ptest systemd
 
 DEPENDS = "udev"
 
-- 
2.47.3


