Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89E6C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:43:48 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.17469.1748443419811710736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=v5vM43Ox;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234477e3765so29958795ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748443419; x=1749048219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zplq//LQ3z4ESF6fgkLYdT5RBZ6GYAqpT6qDa9bS1wE=;
        b=v5vM43Oxh/BwsBLDFM06G0RrCf1CYJ+hmhxr/1mnL8NaTRpfjAx1ni0vUTAdR97+Lt
         gIHpPmIgIqeuNJcjGfQj/wQbgrGGGVeLVCRMcM9rRpbFs5Ypb/MKPk5qjcSCb5QTDtf0
         kG6Sra3t+8ipk7PN0kzzYJB9FHlaF1KPwRtQM/at5M7E0dCqDh7Ph9lhc8sZRlIR9Gm1
         YUaDvkyEKITpPDcMWaPeujJA4UB8WiFLZk7LhHGY61NhXd/sApnLnenm8y4tc1aEg5mx
         FZcgYT3dg+fHe2u/S68DorUhN8otaPbgpcl/oMW8s2IOSw9ZxEgo1UpTlT/0B0X9JuBZ
         pMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443419; x=1749048219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zplq//LQ3z4ESF6fgkLYdT5RBZ6GYAqpT6qDa9bS1wE=;
        b=W5ulUx82/ypL8RSKRe08Epq5pcXla7HbbobQjqvO6MfEs+wJfmpUvkWX59uQvfFvSF
         qsH6f6OdZDvXeDkkXuvgkTVRml+F1V09DgQh8uSKWqWLODDcuRvH0Ha9Rs4X/kNpOE1p
         LTH7adynVMDMqa72oPGIKNp/csry81Q5aei3Sx8l8dD+ZMfx65A/sOWLBhGcfGJ2+2Yi
         yPtgF0g1xvEH4MDyKxHr1T6kjMXikzwo0fhsg5cT8wcEj7Apkv9fTkEf+ugxAZt8XCA0
         B+l1e8w91uf0QIr7L3HObHthiKKjOvymMXbQRv+Cx4hPaakfAJLJBevHCv4chBiPV9+c
         UbGA==
X-Gm-Message-State: AOJu0Yyn76q+mUMNfsSOd2eQiGIvOPGGnjOQg/sA8qx9YkBEGHSan9UO
	l5qlL0MjXzZbW9zpeHAAh9gOhrKeRsEGO1r7BaEJiyeF3nkKo2a67HQ5oc71WeuCJDmhxvC6jIH
	C4Bb+
X-Gm-Gg: ASbGncuAx0EF7qHBxXuvhwWv4O715lkfoU4PnEpIJUKKO14EnsqQYdGpmIgbrQab+pW
	8VWtJX+bdz9+CUQ492W5rwYamipVRWhF3zLrGvYwVyHises/Sh80W1WR6kuEuOLYtZQ1yIalaYc
	PTlsIvF7Qz+kDhOukHKCm/8Gtg80q/oM4oXqGq35D/6g/Kfy2hkABVLy7q6nWbVHv9R/xe1fhkB
	n3ALN4mpDzM8Gd9cqGY2He1NIaTAMp3s0KFOLPSBvPjH61NFgWtvQBYDcqdRnpSEh1bGF8fIRUH
	2e0kS7wIfMO6OCskuqgv325F2Qh07M9zoVvsK5rZs/4=
X-Google-Smtp-Source: AGHT+IEDyT9RKab5mRXTCTxPaU+9wcNiPUWuZjcKjnJaQpqQ0pTb0M+3DS7Qro9eXj8bRN0Y+by2eA==
X-Received: by 2002:a17:902:db06:b0:234:ba37:8797 with SMTP id d9443c01a7336-234d2a62b3dmr34135115ad.6.1748443418738;
        Wed, 28 May 2025 07:43:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f1e2sm12626285ad.140.2025.05.28.07.43.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:43:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/11] util-linux: Add fix to isolate test fstab entries using CUSTOM_FSTAB
Date: Wed, 28 May 2025 07:43:13 -0700
Message-ID: <e7420db0d77611140149ccfefefc8becfad4f34b.1748443238.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748443238.git.steve@sakoman.com>
References: <cover.1748443238.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217362

From: Virendra Thakur <thakur.virendra1810@gmail.com>

During ptest execution, util-linux adds mount entries in /etc/fstab
and runs `mount -a`, which mounts all available entries from
/etc/fstab. This can cause unintended mounts that are unrelated to
the test, leading to incorrect test behavior.

To avoid this, upstream util-linux introduced a mechanism using
CUSTOM_FSTAB,which isolates test-specific fstab entries. Only entries
listed in CUSTOM_FSTAB are mounted during test execution, ensuring
tests do not interfere with or depend on the system's /etc/fstab.

This commit backports below upstream changes to use CUSTOM_FSTAB.
https://github.com/util-linux/util-linux/commit/ed3d33faff17fb702a3acfca2f9f24e69f4920de
https://github.com/util-linux/util-linux/commit/b1580bd760519a2cf052f023057846e54de47484
https://github.com/util-linux/util-linux/commit/6aa8d17b6b53b86a46c5da68c02a893113130496

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/fstab-isolation.patch          | 448 ++++++++++++++++++
 2 files changed, 449 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/fstab-isolation.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 48520ef951..1ecf5c7b39 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -42,6 +42,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://fcntl-lock.c \
            file://CVE-2024-28085-0001.patch \
            file://CVE-2024-28085-0002.patch \
+	   file://fstab-isolation.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/fstab-isolation.patch b/meta/recipes-core/util-linux/util-linux/fstab-isolation.patch
new file mode 100644
index 0000000000..51d209ec60
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/fstab-isolation.patch
@@ -0,0 +1,448 @@
+From 51f1e56cc8b6843bf65ceadc5eca1545258bf020 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>
+Date: Sat, 22 Apr 2023 17:48:58 +0200
+Subject: [PATCH 1/3] tests: (functions.sh) create variable for test fstab
+ location
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
+(cherry picked from commit ed3d33faff17fb702a3acfca2f9f24e69f4920de)
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/ed3d33faff17fb702a3acfca2f9f24e69f4920de]
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ tests/functions.sh          | 13 +++++++------
+ tests/ts/mount/fstab-broken |  2 +-
+ 2 files changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/tests/functions.sh b/tests/functions.sh
+index 5a562a39a..c2e2f33ae 100644
+--- a/tests/functions.sh
++++ b/tests/functions.sh
+@@ -386,6 +386,7 @@ function ts_init_env {
+ 		TS_ENABLE_UBSAN="yes"
+ 	fi
+ 
++	TS_FSTAB="/etc/fstab"
+ 	BLKID_FILE="$TS_OUTDIR/${TS_TESTNAME}.blkidtab"
+ 
+ 	declare -a TS_SUID_PROGS
+@@ -824,12 +825,12 @@ function ts_is_mounted {
+ }
+ 
+ function ts_fstab_open {
+-	echo "# <!-- util-linux test entry" >> /etc/fstab
++	echo "# <!-- util-linux test entry" >> "$TS_FSTAB"
+ }
+ 
+ function ts_fstab_close {
+-	echo "# -->" >> /etc/fstab
+-	sync /etc/fstab 2>/dev/null
++	echo "# -->" >> "$TS_FSTAB"
++	sync "$TS_FSTAB" 2>/dev/null
+ }
+ 
+ function ts_fstab_addline {
+@@ -838,7 +839,7 @@ function ts_fstab_addline {
+ 	local FS=${3:-"auto"}
+ 	local OPT=${4:-"defaults"}
+ 
+-	echo "$SPEC   $MNT   $FS   $OPT   0   0" >> /etc/fstab
++	echo "$SPEC   $MNT   $FS   $OPT   0   0" >> "$TS_FSTAB"
+ }
+ 
+ function ts_fstab_lock {
+@@ -862,9 +863,9 @@ function ts_fstab_clean {
+   ba
+ }
+ s/# <!-- util-linux.*-->//;
+-/^$/d" /etc/fstab
++/^$/d" "$TS_FSTAB"
+ 
+-	sync /etc/fstab 2>/dev/null
++	sync "$TS_FSTAB" 2>/dev/null
+ 	ts_unlock "fstab"
+ }
+ 
+diff --git a/tests/ts/mount/fstab-broken b/tests/ts/mount/fstab-broken
+index 19edc5fe3..3b7a1ee9d 100755
+--- a/tests/ts/mount/fstab-broken
++++ b/tests/ts/mount/fstab-broken
+@@ -34,7 +34,7 @@ mkdir -p $MNT
+ 
+ ts_fstab_lock
+ ts_fstab_open
+-echo "tmpd $MNT tmpfs" >> /etc/fstab
++echo "tmpd $MNT tmpfs" >> "$TS_FSTAB"
+ ts_fstab_close
+ 
+ ts_init_subtest "mount"
+-- 
+2.34.1
+
+
+From 1e4a9141ca7d310030311e09123a81591f994f83 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>
+Date: Sat, 22 Apr 2023 17:20:45 +0200
+Subject: [PATCH 2/3] tests: (functions.sh) use per-test fstab file
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
+(cherry picked from commit 6aa8d17b6b53b86a46c5da68c02a893113130496)
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/6aa8d17b6b53b86a46c5da68c02a893113130496]
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ tests/functions.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/functions.sh b/tests/functions.sh
+index c2e2f33ae..3089e8cda 100644
+--- a/tests/functions.sh
++++ b/tests/functions.sh
+@@ -386,7 +386,7 @@ function ts_init_env {
+ 		TS_ENABLE_UBSAN="yes"
+ 	fi
+ 
+-	TS_FSTAB="/etc/fstab"
++	TS_FSTAB="$TS_OUTDIR/${TS_TESTNAME}.fstab"
+ 	BLKID_FILE="$TS_OUTDIR/${TS_TESTNAME}.blkidtab"
+ 
+ 	declare -a TS_SUID_PROGS
+-- 
+2.34.1
+
+
+From 02c483f982e23a86d58cd7c6a4eb4b6e4d5def1a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>
+Date: Sat, 22 Apr 2023 17:34:28 +0200
+Subject: [PATCH 3/3] mount: (tests) explicitly use test fstab location
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
+(cherry picked from commit b1580bd760519a2cf052f023057846e54de47484)
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/b1580bd760519a2cf052f023057846e54de47484]
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+---
+ tests/ts/mount/fslists             | 2 +-
+ tests/ts/mount/fstab-bind          | 2 +-
+ tests/ts/mount/fstab-broken        | 4 ++--
+ tests/ts/mount/fstab-btrfs         | 8 ++++----
+ tests/ts/mount/fstab-devname       | 4 ++--
+ tests/ts/mount/fstab-devname2label | 2 +-
+ tests/ts/mount/fstab-devname2uuid  | 2 +-
+ tests/ts/mount/fstab-label         | 6 +++---
+ tests/ts/mount/fstab-label2devname | 4 ++--
+ tests/ts/mount/fstab-label2uuid    | 4 ++--
+ tests/ts/mount/fstab-loop          | 4 ++--
+ tests/ts/mount/fstab-none          | 2 +-
+ tests/ts/mount/fstab-symlink       | 2 +-
+ tests/ts/mount/fstab-uuid          | 6 +++---
+ tests/ts/mount/fstab-uuid2devname  | 4 ++--
+ tests/ts/mount/fstab-uuid2label    | 4 ++--
+ 16 files changed, 30 insertions(+), 30 deletions(-)
+
+diff --git a/tests/ts/mount/fslists b/tests/ts/mount/fslists
+index 230186a1e..6ac72c3ce 100755
+--- a/tests/ts/mount/fslists
++++ b/tests/ts/mount/fslists
+@@ -61,7 +61,7 @@ ts_finalize_subtest
+ ts_init_subtest "more-types-fstab"
+ [ -d "$TS_MOUNTPOINT" ] || mkdir -p $TS_MOUNTPOINT
+ ts_fstab_add $DEVICE $TS_MOUNTPOINT "foo,bar,ext2"
+-$TS_CMD_MOUNT $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_fstab_clean
+ ts_is_mounted $DEVICE || ts_die "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $TS_MOUNTPOINT
+diff --git a/tests/ts/mount/fstab-bind b/tests/ts/mount/fstab-bind
+index 2c799df78..cae016dd2 100755
+--- a/tests/ts/mount/fstab-bind
++++ b/tests/ts/mount/fstab-bind
+@@ -20,7 +20,7 @@ ts_fstab_add $MY_SOURCE "$TS_MOUNTPOINT" "none" "bind,default,noauto"
+ mkdir -p $MY_SOURCE
+ mkdir -p $TS_MOUNTPOINT
+ 
+-$TS_CMD_MOUNT $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
+ [ "$?" = "0" ] || ts_log "error: mount $TS_MOUNTPOINT"
+ 
+ $TS_CMD_FINDMNT --mountpoint "$TS_MOUNTPOINT" &> /dev/null
+diff --git a/tests/ts/mount/fstab-broken b/tests/ts/mount/fstab-broken
+index 3b7a1ee9d..ec4c34241 100755
+--- a/tests/ts/mount/fstab-broken
++++ b/tests/ts/mount/fstab-broken
+@@ -38,7 +38,7 @@ echo "tmpd $MNT tmpfs" >> "$TS_FSTAB"
+ ts_fstab_close
+ 
+ ts_init_subtest "mount"
+-$TS_CMD_MOUNT $MNT &> /dev/null
++$TS_CMD_MOUNT -T "$TS_FSTAB" $MNT &> /dev/null
+ [ "$?" = "0" ] || ts_log "error: mount $MNT"
+ $TS_CMD_FINDMNT --kernel --mountpoint "$MNT" &> /dev/null
+ if [ "$?" != "0" ]; then
+@@ -57,7 +57,7 @@ ts_finalize_subtest
+ 
+ 
+ ts_init_subtest "mount-all"
+-$TS_CMD_MOUNT -a &> /dev/null
++$TS_CMD_MOUNT -T "$TS_FSTAB" -a &> /dev/null
+ [ "$?" = "0" ] || ts_log "error: mount -a"
+ $TS_CMD_FINDMNT --kernel --mountpoint "$MNT" &> /dev/null
+ if [ "$?" != "0" ]; then
+diff --git a/tests/ts/mount/fstab-btrfs b/tests/ts/mount/fstab-btrfs
+index a1003ab52..8e76dbba6 100755
+--- a/tests/ts/mount/fstab-btrfs
++++ b/tests/ts/mount/fstab-btrfs
+@@ -94,8 +94,8 @@ ts_fstab_addline "$DEVICE" "$TS_MOUNTPOINT_SUBVOLID" "btrfs" "subvolid=$NON_DEFA
+ ts_fstab_addline "$TS_MOUNTPOINT_SUBVOLID" "$TS_MOUNTPOINT_BIND" "auto" "bind"
+ ts_fstab_close
+ 
+-$TS_CMD_MOUNT -a >> $TS_OUTPUT 2>> $TS_ERRLOG
+-$TS_CMD_MOUNT -a >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -a >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -a >> $TS_OUTPUT 2>> $TS_ERRLOG
+ 
+ $TS_CMD_UMOUNT "$TS_MOUNTPOINT_BIND" >> $TS_OUTPUT 2>> $TS_ERRLOG
+ $TS_CMD_UMOUNT "$TS_MOUNTPOINT_DEFAULT" >> $TS_OUTPUT 2>> $TS_ERRLOG
+@@ -124,8 +124,8 @@ ts_fstab_addline "$DEVICE" "$TS_MOUNTPOINT_SUBVOLID" "auto" "subvolid=$NON_DEFAU
+ ts_fstab_addline "$TS_MOUNTPOINT_SUBVOL/bind-mnt" "$TS_MOUNTPOINT_BIND" "auto" "bind"
+ ts_fstab_close
+ 
+-$TS_CMD_MOUNT -a >> $TS_OUTPUT 2>> $TS_ERRLOG
+-$TS_CMD_MOUNT -a >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -a >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -a >> $TS_OUTPUT 2>> $TS_ERRLOG
+ 
+ $TS_CMD_UMOUNT "$TS_MOUNTPOINT_BIND" >> $TS_OUTPUT 2>> $TS_ERRLOG
+ $TS_CMD_UMOUNT "$TS_MOUNTPOINT_DEFAULT" >> $TS_OUTPUT 2>> $TS_ERRLOG
+diff --git a/tests/ts/mount/fstab-devname b/tests/ts/mount/fstab-devname
+index 5b64a32a6..6ac03b5a7 100755
+--- a/tests/ts/mount/fstab-devname
++++ b/tests/ts/mount/fstab-devname
+@@ -42,13 +42,13 @@ MOUNTPOINT=$TS_MOUNTPOINT
+ ts_fstab_add $DEVICE
+ 
+ ts_init_subtest "mountpoint"
+-$TS_CMD_MOUNT $MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+ 
+ ts_init_subtest "device-name"
+-$TS_CMD_MOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+diff --git a/tests/ts/mount/fstab-devname2label b/tests/ts/mount/fstab-devname2label
+index 1d8562109..44066e153 100755
+--- a/tests/ts/mount/fstab-devname2label
++++ b/tests/ts/mount/fstab-devname2label
+@@ -41,7 +41,7 @@ ts_device_has "LABEL" $LABEL $DEVICE \
+ ts_fstab_add "LABEL=$LABEL"
+ ts_udevadm_settle "$DEVICE" "LABEL"
+ 
+-$TS_CMD_MOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "Cannot umount $DEVICE"
+ 
+diff --git a/tests/ts/mount/fstab-devname2uuid b/tests/ts/mount/fstab-devname2uuid
+index 8105fa028..503959103 100755
+--- a/tests/ts/mount/fstab-devname2uuid
++++ b/tests/ts/mount/fstab-devname2uuid
+@@ -39,7 +39,7 @@ UUID=$(ts_uuid_by_devname "$DEVICE") || ts_die "Cannot find UUID on $DEVICE"
+ ts_fstab_add "UUID=$UUID"
+ ts_udevadm_settle "$DEVICE" "UUID"
+ 
+-$TS_CMD_MOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "Cannot umount $DEVICE"
+ 
+diff --git a/tests/ts/mount/fstab-label b/tests/ts/mount/fstab-label
+index 4b23e7fee..a3cc06d52 100755
+--- a/tests/ts/mount/fstab-label
++++ b/tests/ts/mount/fstab-label
+@@ -42,19 +42,19 @@ ts_fstab_add "LABEL=$LABEL"
+ ts_udevadm_settle "$DEVICE" "LABEL"
+ 
+ ts_init_subtest "no-option"
+-$TS_CMD_MOUNT $MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+ 
+ ts_init_subtest "L-option"
+-$TS_CMD_MOUNT -L $LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -L $LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG 
+ ts_finalize_subtest
+ 
+ ts_init_subtest "LABEL-option"
+-$TS_CMD_MOUNT LABEL=$LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" LABEL=$LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+diff --git a/tests/ts/mount/fstab-label2devname b/tests/ts/mount/fstab-label2devname
+index 75ca05e8c..fddbfa0ba 100755
+--- a/tests/ts/mount/fstab-label2devname
++++ b/tests/ts/mount/fstab-label2devname
+@@ -44,13 +44,13 @@ ts_udevadm_settle "$DEVICE" "LABEL"
+ [ -d "$TS_MOUNTPOINT" ] || mkdir -p $TS_MOUNTPOINT
+ 
+ ts_init_subtest "L-option"
+-$TS_CMD_MOUNT -L $LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -L $LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+ 
+ ts_init_subtest "LABEL-option"
+-$TS_CMD_MOUNT "LABEL=$LABEL" >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" "LABEL=$LABEL" >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+diff --git a/tests/ts/mount/fstab-label2uuid b/tests/ts/mount/fstab-label2uuid
+index 4bfcae4b9..927cde9aa 100755
+--- a/tests/ts/mount/fstab-label2uuid
++++ b/tests/ts/mount/fstab-label2uuid
+@@ -46,13 +46,13 @@ ts_udevadm_settle "$DEVICE" "LABEL" "UUID"
+ [ -d "$TS_MOUNTPOINT" ] || mkdir -p $TS_MOUNTPOINT
+ 
+ ts_init_subtest "L-option"
+-$TS_CMD_MOUNT -L $LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -L $LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+ 
+ ts_init_subtest "LABEL-option"
+-$TS_CMD_MOUNT "LABEL=$LABEL" >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" "LABEL=$LABEL" >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+diff --git a/tests/ts/mount/fstab-loop b/tests/ts/mount/fstab-loop
+index 7cc589fd2..0541e3a74 100755
+--- a/tests/ts/mount/fstab-loop
++++ b/tests/ts/mount/fstab-loop
+@@ -39,10 +39,10 @@ ts_fstab_lock
+ ts_fstab_open
+ 
+ ts_fstab_addline "$IMG" "$TS_MOUNTPOINT-1" "ext2" "loop"
+-$TS_CMD_MOUNT -a >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -a >> $TS_OUTPUT 2>> $TS_ERRLOG
+ 
+ ts_fstab_addline "$IMG" "$TS_MOUNTPOINT-2" "ext2" "loop"
+-$TS_CMD_MOUNT -a >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -a >> $TS_OUTPUT 2>> $TS_ERRLOG
+ 
+ ts_fstab_close
+ 
+diff --git a/tests/ts/mount/fstab-none b/tests/ts/mount/fstab-none
+index 6a4d05b62..95daa6cee 100755
+--- a/tests/ts/mount/fstab-none
++++ b/tests/ts/mount/fstab-none
+@@ -17,7 +17,7 @@ ts_fstab_add "none" "$TS_MOUNTPOINT" "tmpfs" "rw,nosuid,nodev,relatime"
+ 
+ mkdir -p $TS_MOUNTPOINT
+ 
+-$TS_CMD_MOUNT $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
+ [ "$?" = "0" ] || ts_log "error: mount $TS_MOUNTPOINT"
+ 
+ $TS_CMD_FINDMNT --mountpoint "$TS_MOUNTPOINT" &> /dev/null
+diff --git a/tests/ts/mount/fstab-symlink b/tests/ts/mount/fstab-symlink
+index 4d3e37b19..6d419f9fe 100755
+--- a/tests/ts/mount/fstab-symlink
++++ b/tests/ts/mount/fstab-symlink
+@@ -46,7 +46,7 @@ ln -s $DEVICE $LINKNAME
+ ts_fstab_add $LINKNAME $TS_MOUNTPOINT "auto" "defaults,user"
+ 
+ # variant A) -- UID=0
+-$TS_CMD_MOUNT $LINKNAME >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $LINKNAME >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "A) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $LINKNAME || ts_die "A) Cannot umount $LINKNAME"
+ 
+diff --git a/tests/ts/mount/fstab-uuid b/tests/ts/mount/fstab-uuid
+index 03917b782..f51bb294e 100755
+--- a/tests/ts/mount/fstab-uuid
++++ b/tests/ts/mount/fstab-uuid
+@@ -42,19 +42,19 @@ ts_fstab_add "UUID=$UUID"
+ ts_udevadm_settle "$DEVICE" "UUID"
+ 
+ ts_init_subtest "no-option"
+-$TS_CMD_MOUNT $MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+ 
+ ts_init_subtest "U-option"
+-$TS_CMD_MOUNT -U $UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -U $UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+ 
+ ts_init_subtest "UUID-option"
+-$TS_CMD_MOUNT UUID=$UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" UUID=$UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+diff --git a/tests/ts/mount/fstab-uuid2devname b/tests/ts/mount/fstab-uuid2devname
+index 9bf165e16..2b338acb1 100755
+--- a/tests/ts/mount/fstab-uuid2devname
++++ b/tests/ts/mount/fstab-uuid2devname
+@@ -42,13 +42,13 @@ ts_udevadm_settle "$DEVICE" "UUID"
+ [ -d "$TS_MOUNTPOINT" ] || mkdir -p $TS_MOUNTPOINT
+ 
+ ts_init_subtest "U-option"
+-$TS_CMD_MOUNT -U $UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -U $UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+ 
+ ts_init_subtest "UUID-option"
+-$TS_CMD_MOUNT "UUID=$UUID" >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" "UUID=$UUID" >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+diff --git a/tests/ts/mount/fstab-uuid2label b/tests/ts/mount/fstab-uuid2label
+index de10ff0b0..02eb6b985 100755
+--- a/tests/ts/mount/fstab-uuid2label
++++ b/tests/ts/mount/fstab-uuid2label
+@@ -45,13 +45,13 @@ ts_udevadm_settle "$DEVICE" "LABEL" "UUID"
+ [ -d "$TS_MOUNTPOINT" ] || mkdir -p $TS_MOUNTPOINT
+ 
+ ts_init_subtest "U-option"
+-$TS_CMD_MOUNT -U $UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -U $UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_finalize_subtest
+ 
+ ts_init_subtest "UUID-option"
+-$TS_CMD_MOUNT "UUID=$UUID" >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" "UUID=$UUID" >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_log "Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE >> $TS_OUTPUT 2>>$TS_ERRLOG
+ ts_finalize_subtest
+-- 
+2.34.1
+
-- 
2.43.0


