Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D04EC4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 08:46:00 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.129135.1671093956760953279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 00:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NQktXxYP;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so2006515pjo.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 00:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHNt5jY3vG78lhBdIvEtjgGICOxqpe5vcWWoWiTu+ec=;
        b=NQktXxYPJyz3+p8YXEHESA3ODiub0XzUkWxeijxkqwgazMj1CzzcT2Ct0lusZqgzqN
         2yjOkP8TXvpuLv18aNH9snYV6W8i6GTlQRS6U2TllmaZTh5FgLrVs/9Uc271QPWlTUZu
         vqRk/utI+WNfDAyENg5NrKcYU76oRdK3FI7un814UlKRfysNHs/6kchjRXYHUbv82Rn6
         fj2Ed7s3nYgB4LurFYd4ujp6Lqj0oVOlnrDihKMxZtQD4lMq4IZ3slTxqKAxUD6cr12T
         XoJQ93igEl8qO2uDMyRDQHUxHPngaEhnbJiZBOPOYgy9BZIaKzuWpDxrcre5MARfmW2I
         fPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHNt5jY3vG78lhBdIvEtjgGICOxqpe5vcWWoWiTu+ec=;
        b=SFIp1uBiR3SnyFB68tXIwsX+6TJ2PUaYNqqYZqsqphDdpwRcx9k5pctTvPMPuzoYjV
         C0RCVhGIpPm3TFqPsjnXkDp5wNyHajcbkJf0O9P1j8som3kPiDBsPEVWUH9f1/jBu5Zn
         gcQPEeoV3gTGyxVu+lZV0BSaPS36rFMIOnVyAaQGiqog95Xabd8WPFhLdmQ6dZTtvcOm
         mtKSF6XS4vZjwC1+EAaSVAR0xnN2una6+uDVsT/jk8XjF9Vv2b9xBz/MCmcjG8qVAb2B
         IgiZ7hGaMtbUhy8tOr2O+LRJcnFlfGg4vvauEGY9f5Ee1NjL18Fx5LriSHyzjpLZbipL
         fS8Q==
X-Gm-Message-State: ANoB5pktTmpewMPj/gSCvfvcRvgbXqtMB8QwCvK9oAOZd1M230zDcYNl
	0Cks97BEIZSFDIPdRHaNTaWfM5KgK1E=
X-Google-Smtp-Source: AA0mqf71YYiu+hf1tcJbcvPzacz3/n8Se3sDgwL98dhR+qmQhIZzbQCm8e9q0ikFph7xq2XX5VflUA==
X-Received: by 2002:a17:903:248b:b0:189:c8d9:ed30 with SMTP id p11-20020a170903248b00b00189c8d9ed30mr26900088plw.24.1671093955923;
        Thu, 15 Dec 2022 00:45:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id z14-20020a170903018e00b00188ea79fae0sm3255723plg.48.2022.12.15.00.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 00:45:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 10/11] mdadm: Use _FILE_OFFSET_BITS to use largefile support
Date: Thu, 15 Dec 2022 00:45:45 -0800
Message-Id: <20221215084546.125368-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221215084546.125368-1-raj.khem@gmail.com>
References: <20221215084546.125368-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174572

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...FILE_OFFSET_BITS-to-enable-largefile.patch | 147 ++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch b/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
new file mode 100644
index 0000000000..142ed355ef
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch
@@ -0,0 +1,147 @@
+From 6b861a267a6ef6f60f6cc21e4c8e6d7cdd2451dc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 Nov 2022 12:31:22 -0800
+Subject: [PATCH] restripe.c: Use _FILE_OFFSET_BITS to enable largefile support
+
+Instead of using the lseek64 and friends, its better to enable it via
+the feature macro _FILE_OFFSET_BITS = 64 and let the C library deal with
+the width of types
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-raid/20221110225546.337164-1-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ restripe.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+--- a/restripe.c
++++ b/restripe.c
+@@ -22,6 +22,9 @@
+  *    Email: <neilb@suse.de>
+  */
+ 
++/* Enable largefile support */
++#define _FILE_OFFSET_BITS 64
++
+ #include "mdadm.h"
+ #include <stdint.h>
+ 
+@@ -581,7 +584,7 @@ int save_stripes(int *source, unsigned l
+ 				       raid_disks, level, layout);
+ 			if (dnum < 0) abort();
+ 			if (source[dnum] < 0 ||
+-			    lseek64(source[dnum],
++			    lseek(source[dnum],
+ 				    offsets[dnum] + offset, 0) < 0 ||
+ 			    read(source[dnum], buf+disk * chunk_size,
+ 				 chunk_size) != chunk_size) {
+@@ -754,8 +757,8 @@ int restore_stripes(int *dest, unsigned
+ 					   raid_disks, level, layout);
+ 			if (src_buf == NULL) {
+ 				/* read from file */
+-				if (lseek64(source, read_offset, 0) !=
+-					 (off64_t)read_offset) {
++				if (lseek(source, read_offset, 0) !=
++					 (off_t)read_offset) {
+ 					rv = -1;
+ 					goto abort;
+ 				}
+@@ -816,7 +819,7 @@ int restore_stripes(int *dest, unsigned
+ 		}
+ 		for (i=0; i < raid_disks ; i++)
+ 			if (dest[i] >= 0) {
+-				if (lseek64(dest[i],
++				if (lseek(dest[i],
+ 					 offsets[i]+offset, 0) < 0) {
+ 					rv = -1;
+ 					goto abort;
+@@ -866,7 +869,7 @@ int test_stripes(int *source, unsigned l
+ 		int disk;
+ 
+ 		for (i = 0 ; i < raid_disks ; i++) {
+-			if ((lseek64(source[i], offsets[i]+start, 0) < 0) ||
++			if ((lseek(source[i], offsets[i]+start, 0) < 0) ||
+ 			    (read(source[i], stripes[i], chunk_size) !=
+ 			     chunk_size)) {
+ 				free(q);
+--- a/raid6check.c
++++ b/raid6check.c
+@@ -22,6 +22,9 @@
+  *    Based on "restripe.c" from "mdadm" codebase
+  */
+ 
++/* Enable largefile support */
++#define _FILE_OFFSET_BITS 64
++
+ #include "mdadm.h"
+ #include <stdint.h>
+ #include <signal.h>
+@@ -279,9 +282,9 @@ int manual_repair(int chunk_size, int sy
+ 	}
+ 
+ 	int write_res1, write_res2;
+-	off64_t seek_res;
++	off_t seek_res;
+ 
+-	seek_res = lseek64(source[fd1],
++	seek_res = lseek(source[fd1],
+ 			   offsets[fd1] + start * chunk_size, SEEK_SET);
+ 	if (seek_res < 0) {
+ 		fprintf(stderr, "lseek failed for failed_disk1\n");
+@@ -289,7 +292,7 @@ int manual_repair(int chunk_size, int sy
+ 	}
+ 	write_res1 = write(source[fd1], blocks[failed_slot1], chunk_size);
+ 
+-	seek_res = lseek64(source[fd2],
++	seek_res = lseek(source[fd2],
+ 			   offsets[fd2] + start * chunk_size, SEEK_SET);
+ 	if (seek_res < 0) {
+ 		fprintf(stderr, "lseek failed for failed_disk2\n");
+@@ -374,7 +377,7 @@ int check_stripes(struct mdinfo *info, i
+ 			goto exitCheck;
+ 		}
+ 		for (i = 0 ; i < raid_disks ; i++) {
+-			off64_t seek_res = lseek64(source[i], offsets[i] + start * chunk_size,
++			off_t seek_res = lseek(source[i], offsets[i] + start * chunk_size,
+ 						   SEEK_SET);
+ 			if (seek_res < 0) {
+ 				fprintf(stderr, "lseek to source %d failed\n", i);
+--- a/swap_super.c
++++ b/swap_super.c
+@@ -1,3 +1,6 @@
++/* Enable largefile support */
++#define _FILE_OFFSET_BITS 64
++
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <fcntl.h>
+@@ -16,8 +19,6 @@
+ 
+ #define MD_NEW_SIZE_SECTORS(x)		((x & ~(MD_RESERVED_SECTORS - 1)) - MD_RESERVED_SECTORS)
+ 
+-extern long long lseek64(int, long long, int);
+-
+ int main(int argc, char *argv[])
+ {
+ 	int fd, i;
+@@ -38,8 +39,8 @@ int main(int argc, char *argv[])
+ 		exit(1);
+ 	}
+ 	offset = MD_NEW_SIZE_SECTORS(size) * 512LL;
+-	if (lseek64(fd, offset, 0) < 0LL) {
+-		perror("lseek64");
++	if (lseek(fd, offset, 0) < 0LL) {
++		perror("lseek");
+ 		exit(1);
+ 	}
+ 	if (read(fd, super, 4096) != 4096) {
+@@ -68,8 +69,8 @@ int main(int argc, char *argv[])
+ 		super[32*4+10*4 +i] = t;
+ 	}
+ 
+-	if (lseek64(fd, offset, 0) < 0LL) {
+-		perror("lseek64");
++	if (lseek(fd, offset, 0) < 0LL) {
++		perror("lseek");
+ 		exit(1);
+ 	}
+ 	if (write(fd, super, 4096) != 4096) {
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 19035caaec..7298860241 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-mdadm-skip-test-11spare-migration.patch \
            file://0001-Fix-parsing-of-r-in-monitor-manager-mode.patch \
            file://0001-Makefile-install-mdcheck.patch \
+           file://0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.39.0


