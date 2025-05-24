Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96959C5AE59
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:37:04 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.7022.1748093819242952031
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JIzvflK6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3109f106867so916139a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093818; x=1748698618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsQ6HGQ/cnKv8FwUcbJ3VVDZiHIkopK1v02FBVfntx8=;
        b=JIzvflK6N44mXQfaByRiGnADsNoq/qVESkttMNWtUBELkPpHTKCx5D2jii9M2deqnl
         AfG0MX8OWJAUT+pQXHo4hpEB/KZNRYbFrhodhCotFslhonUMvAW9QGzUAmgQoM/dJHfy
         QOxdNjZhh0yef9ZWTHHegqP/QemjzdK8OvqIRlsHORdMevD1vWQhCdP4k2vBUTCL6bZX
         hcreIGA1xe8ntNYc17JaQ4aSjIK+7NsVYUHn2apDnetLaoFE0iREImMXAWYLcH+vHdbe
         NzP+PVpHMZf/WXdbpJ7srxU3sT/Wxvi8n9zFVswaf9U161deg2OMLT8Jkyu1PaLBatKK
         d7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093818; x=1748698618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsQ6HGQ/cnKv8FwUcbJ3VVDZiHIkopK1v02FBVfntx8=;
        b=dcanjgx/bvi2CFgPhl1ajWNYetScdy6mYD8dR+pBPGvGYLVux3v/WZ32/CQUiudc48
         dnxxby4nCZMzC31tMTeRQcUupATTDJZcRZr7qZKMubmZY7v/WCtGt76wOauRSuC4aHEk
         D2rHMRt6BkkicWdXn/GMawgczHNsi+Zt1h7i/Ismub8LNyGt8ousx2J9tNjHbpPzqWUP
         kgzRK37SqWyABaDNfBAhW4S5XbcueJc13YgdqJnprdka4E74dkT34QbHy2PKoxK0dzD2
         i9Y+y+Fag/5SjCud+NOwSRW/lTx30hlaW4yb1pug+maiboIsfVveOUJCQGtjnrizuqLf
         nC1Q==
X-Gm-Message-State: AOJu0Yy5BtC3iJnjzSRT4r3kuBy0vgyMnbsWEGXLRsjHa8bcbc5ni5B7
	y8ZBiT3LrSSwJzkeo+cSjGJ5Yljb3K3RF/+Y/FIBpBdYrfOrk1nTrSTJub07OAWgBgw73IQOJGg
	Nu7nx
X-Gm-Gg: ASbGncurX5XuDxyq7klCKEJqv1BqfeSbR0XeYepHoZlxTH1+vfRmCUaL5pJs9j74wKE
	lViL4sZL7UGlEuWd0lQpBsEm3+eMtuSxv5jQG4Ay4vDTaCBhXZV3e91bsRjryQU9y1qoc45iolT
	MfTUofE93RH40UIDX2DmGJyNuepFUrxGwBRaEwoCqSLzamMeKPHizLsEYZHjsPgV8VKv/2yhI7M
	Mvf55bio7xqciU9Bm32XT0S1PpbjZF8Coua68gJlM3jB9WwZrG1jl6qYbzgh57YIdaM5LrA2ohC
	CCWnR9Y0g+QpYnIzj/R1WA8V/HQhj/zu9FbJ/Tp890o=
X-Google-Smtp-Source: AGHT+IGz5mGLTvXup54M6tLDZUgL89Llr7HJ5k5+467nM7yPxsCbpc1/om1k0lgjH+TPdBcQs72Q1Q==
X-Received: by 2002:a17:90b:164a:b0:308:65d4:9dda with SMTP id 98e67ed59e1d1-3110f112179mr4698417a91.16.1748093818146;
        Sat, 24 May 2025 06:36:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/12] util-linux: Add fix to isolate test fstab entries using CUSTOM_FSTAB
Date: Sat, 24 May 2025 06:36:27 -0700
Message-ID: <94747fb63518bf907eb7c09fc2e146e39e235a7d.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748093626.git.steve@sakoman.com>
References: <cover.1748093626.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217236

From: Virendra Thakur <virendra.thakur@kpit.com>

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
 .../util-linux/fstab-isolation.patch          | 419 ++++++++++++++++++
 2 files changed, 420 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/fstab-isolation.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b9172230e7..c62c6d70c3 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -41,6 +41,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2024-28085-0003.patch \
            file://CVE-2024-28085-0004.patch \
            file://CVE-2024-28085-0005.patch \
+	   file://fstab-isolation.patch \
            "
 
 SRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"
diff --git a/meta/recipes-core/util-linux/util-linux/fstab-isolation.patch b/meta/recipes-core/util-linux/util-linux/fstab-isolation.patch
new file mode 100644
index 0000000000..6b272507f7
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/fstab-isolation.patch
@@ -0,0 +1,419 @@
+From 1f6d3c9fd195672987076958eefbabf395fb2df2 Mon Sep 17 00:00:00 2001
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
+index 1699ba047..93eef8564 100644
+--- a/tests/functions.sh
++++ b/tests/functions.sh
+@@ -351,6 +351,7 @@ function ts_init_env {
+ 		TS_ENABLE_UBSAN="yes"
+ 	fi
+ 
++	TS_FSTAB="/etc/fstab"
+ 	BLKID_FILE="$TS_OUTDIR/${TS_TESTNAME}.blkidtab"
+ 
+ 	declare -a TS_SUID_PROGS
+@@ -789,12 +790,12 @@ function ts_is_mounted {
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
+@@ -803,7 +804,7 @@ function ts_fstab_addline {
+ 	local FS=${3:-"auto"}
+ 	local OPT=${4:-"defaults"}
+ 
+-	echo "$SPEC   $MNT   $FS   $OPT   0   0" >> /etc/fstab
++	echo "$SPEC   $MNT   $FS   $OPT   0   0" >> "$TS_FSTAB"
+ }
+ 
+ function ts_fstab_lock {
+@@ -827,9 +828,9 @@ function ts_fstab_clean {
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
+index 947e3af7a..5ef10f889 100755
+--- a/tests/ts/mount/fstab-broken
++++ b/tests/ts/mount/fstab-broken
+@@ -33,7 +33,7 @@ mkdir -p $MNT
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
+From 82e44655f33037cbcd2da6664202735d1e37d317 Mon Sep 17 00:00:00 2001
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
+index 93eef8564..4a5580712 100644
+--- a/tests/functions.sh
++++ b/tests/functions.sh
+@@ -351,7 +351,7 @@ function ts_init_env {
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
+From 73257404c6bee007c75b826bb1bd99e8eb6e8f9a Mon Sep 17 00:00:00 2001
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
+ tests/ts/mount/fstab-uuid          | 4 ++--
+ tests/ts/mount/fstab-uuid2devname  | 4 ++--
+ tests/ts/mount/fstab-uuid2label    | 4 ++--
+ 15 files changed, 28 insertions(+), 28 deletions(-)
+
+diff --git a/tests/ts/mount/fslists b/tests/ts/mount/fslists
+index 74a87f6a7..3e2efa0db 100755
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
+diff --git a/tests/ts/mount/fstab-broken b/tests/ts/mount/fstab-broken
+index 5ef10f889..a9855f06f 100755
+--- a/tests/ts/mount/fstab-broken
++++ b/tests/ts/mount/fstab-broken
+@@ -37,7 +37,7 @@ echo "tmpd $MNT tmpfs" >> "$TS_FSTAB"
+ ts_fstab_close
+ 
+ ts_init_subtest "mount"
+-$TS_CMD_MOUNT $MNT &> /dev/null
++$TS_CMD_MOUNT -T "$TS_FSTAB" $MNT &> /dev/null
+ [ "$?" = "0" ] || ts_log "error: mount $MNT"
+ $TS_CMD_FINDMNT --kernel --mountpoint "$MNT" &> /dev/null
+ if [ "$?" != "0" ]; then
+@@ -56,7 +56,7 @@ ts_finalize_subtest
+ 
+ 
+ ts_init_subtest "mount-all"
+-$TS_CMD_MOUNT -a &> /dev/null
++$TS_CMD_MOUNT -T "$TS_FSTAB" -a &> /dev/null
+ [ "$?" = "0" ] || ts_log "error: mount -a"
+ $TS_CMD_FINDMNT --kernel --mountpoint "$MNT" &> /dev/null
+ if [ "$?" != "0" ]; then
+diff --git a/tests/ts/mount/fstab-btrfs b/tests/ts/mount/fstab-btrfs
+index 0003b5d65..1f93d409d 100755
+--- a/tests/ts/mount/fstab-btrfs
++++ b/tests/ts/mount/fstab-btrfs
+@@ -91,8 +91,8 @@ ts_fstab_addline "$DEVICE" "$TS_MOUNTPOINT_SUBVOLID" "btrfs" "subvolid=$NON_DEFA
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
+@@ -121,8 +121,8 @@ ts_fstab_addline "$DEVICE" "$TS_MOUNTPOINT_SUBVOLID" "auto" "subvolid=$NON_DEFAU
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
+index 4e4961ede..3964b81c5 100755
+--- a/tests/ts/mount/fstab-devname
++++ b/tests/ts/mount/fstab-devname
+@@ -40,12 +40,12 @@ ts_device_has "TYPE" "ext2" $DEVICE || ts_die "Cannot find ext2 on $DEVICE"
+ ts_fstab_add $DEVICE
+ 
+ # variant A)
+-$TS_CMD_MOUNT $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "A) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "A) Cannot umount $DEVICE"
+ 
+ # variant B)
+-$TS_CMD_MOUNT $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $DEVICE >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "B) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "B) Cannot umount $DEVICE"
+ 
+diff --git a/tests/ts/mount/fstab-devname2label b/tests/ts/mount/fstab-devname2label
+index 7257fbc89..1f50d0178 100755
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
+index 02b3ee161..f1fa23152 100755
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
+index a86bdf6c0..6dd1c7bfc 100755
+--- a/tests/ts/mount/fstab-label
++++ b/tests/ts/mount/fstab-label
+@@ -42,17 +42,17 @@ ts_fstab_add "LABEL=$LABEL"
+ ts_udevadm_settle "$DEVICE" "LABEL"
+ 
+ # variant A)
+-$TS_CMD_MOUNT $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "A) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "A) Cannot umount $DEVICE"
+ 
+ # variant B)
+-$TS_CMD_MOUNT -L $LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -L $LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "B) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "B) Cannot umount $DEVICE"
+ 
+ # variant C)
+-$TS_CMD_MOUNT LABEL=$LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" LABEL=$LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "C) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "C) Cannot umount $DEVICE"
+ 
+diff --git a/tests/ts/mount/fstab-label2devname b/tests/ts/mount/fstab-label2devname
+index 181352aef..359479aaa 100755
+--- a/tests/ts/mount/fstab-label2devname
++++ b/tests/ts/mount/fstab-label2devname
+@@ -42,12 +42,12 @@ ts_fstab_add "$DEVICE"
+ ts_udevadm_settle "$DEVICE" "LABEL"
+ 
+ # variant A)
+-$TS_CMD_MOUNT -L $LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -L $LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "A) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "A) Cannot umount $DEVICE"
+ 
+ # variant B)
+-$TS_CMD_MOUNT "LABEL=$LABEL" >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" "LABEL=$LABEL" >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "B) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "B) Cannot umount $DEVICE"
+ 
+diff --git a/tests/ts/mount/fstab-label2uuid b/tests/ts/mount/fstab-label2uuid
+index 027bf8059..5884faeed 100755
+--- a/tests/ts/mount/fstab-label2uuid
++++ b/tests/ts/mount/fstab-label2uuid
+@@ -44,12 +44,12 @@ ts_fstab_add "UUID=$UUID"
+ ts_udevadm_settle "$DEVICE" "LABEL" "UUID"
+ 
+ # variant A)
+-$TS_CMD_MOUNT -L $LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -L $LABEL >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "A) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "A) Cannot umount $DEVICE"
+ 
+ # variant B)
+-$TS_CMD_MOUNT "LABEL=$LABEL" >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" "LABEL=$LABEL" >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "B) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "B) Cannot umount $DEVICE"
+ 
+diff --git a/tests/ts/mount/fstab-loop b/tests/ts/mount/fstab-loop
+index 7d4fbff3c..29ceb937d 100755
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
+index e2ed0af02..4d1ec283b 100755
+--- a/tests/ts/mount/fstab-none
++++ b/tests/ts/mount/fstab-none
+@@ -16,7 +16,7 @@ ts_fstab_add "none" "$TS_MOUNTPOINT" "tmpfs" "rw,nosuid,nodev,relatime"
+ 
+ mkdir -p $TS_MOUNTPOINT
+ 
+-$TS_CMD_MOUNT $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
+ [ "$?" = "0" ] || ts_log "error: mount $TS_MOUNTPOINT"
+ 
+ $TS_CMD_FINDMNT --mountpoint "$TS_MOUNTPOINT" &> /dev/null
+diff --git a/tests/ts/mount/fstab-symlink b/tests/ts/mount/fstab-symlink
+index 9f63a5afc..e00b33d61 100755
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
+index ce4c86ea8..45694c9f3 100755
+--- a/tests/ts/mount/fstab-uuid
++++ b/tests/ts/mount/fstab-uuid
+@@ -40,12 +40,12 @@ ts_fstab_add "UUID=$UUID"
+ ts_udevadm_settle "$DEVICE" "UUID"
+ 
+ # variant A)
+-$TS_CMD_MOUNT $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" $TS_MOUNTPOINT >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "A) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "A) Cannot umount $DEVICE"
+ 
+ # variant B)
+-$TS_CMD_MOUNT -U $UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -U $UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "B) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "B) Cannot umount $DEVICE"
+ 
+diff --git a/tests/ts/mount/fstab-uuid2devname b/tests/ts/mount/fstab-uuid2devname
+index 4ce72556c..82367235f 100755
+--- a/tests/ts/mount/fstab-uuid2devname
++++ b/tests/ts/mount/fstab-uuid2devname
+@@ -40,12 +40,12 @@ ts_fstab_add "$DEVICE"
+ ts_udevadm_settle "$DEVICE" "UUID"
+ 
+ # variant A)
+-$TS_CMD_MOUNT -U $UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -U $UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "A) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "A) Cannot umount $DEVICE"
+ 
+ # variant B)
+-$TS_CMD_MOUNT "UUID=$UUID" >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" "UUID=$UUID" >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "B) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "B) Cannot umount $DEVICE"
+ 
+diff --git a/tests/ts/mount/fstab-uuid2label b/tests/ts/mount/fstab-uuid2label
+index b1f983df1..1a2ffaada 100755
+--- a/tests/ts/mount/fstab-uuid2label
++++ b/tests/ts/mount/fstab-uuid2label
+@@ -43,12 +43,12 @@ ts_fstab_add "LABEL=$LABEL"
+ ts_udevadm_settle "$DEVICE" "LABEL" "UUID"
+ 
+ # variant A)
+-$TS_CMD_MOUNT -U $UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" -U $UUID >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "A) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "A) Cannot umount $DEVICE"
+ 
+ # variant B)
+-$TS_CMD_MOUNT "UUID=$UUID" >> $TS_OUTPUT 2>> $TS_ERRLOG
++$TS_CMD_MOUNT -T "$TS_FSTAB" "UUID=$UUID" >> $TS_OUTPUT 2>> $TS_ERRLOG
+ ts_is_mounted $DEVICE || ts_die "B) Cannot find $DEVICE in /proc/mounts"
+ $TS_CMD_UMOUNT $DEVICE || ts_die "B) Cannot umount $DEVICE"
+ 
+-- 
+2.34.1
+
-- 
2.43.0


