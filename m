Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A4FC54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 19:52:54 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.234.1662580370649843326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 12:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ADpA5hTK;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id d2so5113534wrn.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 12:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=8EuW5VSpRkDP8oRyYA47uTq4o48B28DyjvxWLnfa4g4=;
        b=ADpA5hTKpIb84aY1VqsfT3DYTYSmufqEQktIz9f3bHwB3KLbpIbDBuNwzxKve0orNO
         izGt7eActCPX3TRBzH6OvhsSUKYxEKUni9N8p/TYjo5+v4jZcKHOvYqHiiiXpotIAxvM
         qHXZXHXW1lTtIa3aGo50EVgk45YLkVdkE3JtKXYQ6JbBzHqmbjoL1XUaLORrKxybQF1y
         7tNoIooF2eECsUGqYcWjHR1CWhS2aarb7kF5H09JW5jNtIItHVvnSFBXR0iZRIStYyrk
         TyPUP53p2SVedIQ4nB/+a/f2GoCsEjJLj9PEGGt94nSTNVfjc0p182i7fl+B8ag69yDh
         l9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=8EuW5VSpRkDP8oRyYA47uTq4o48B28DyjvxWLnfa4g4=;
        b=vKrUKbq9gWRtgoS+xJ6cDQjSxot60SWZpGTJz2SBaOs4vH5wJ92nndLrYPyG+mvbEe
         pdG7l+SPrgTdSO0T8jrhU7MjZ70SRi2wr3aAmyWSMqwpvD9mkOiu7TjN0UjY6Zn9B82M
         +ApegA1v+1DBsmN7QCbM+ncu8ZVWDvLB0osC9liXqGmL2KjqEH6mRQh9cCHPMKc6KCXz
         qIzvXiluXi770Xdi73rXhCSmHFntBHiahwS/wdbhLvU+IruDN9YRmLZrs04HZUcSYRK6
         EQ3al/Csc5REQIjbkOO6GX4TNjCOIUF0fYC17VRToXaCgJXHvT6GayDG1Tg0d4VQhHv9
         Zs0g==
X-Gm-Message-State: ACgBeo0Fwtc2BjnljWOcE844cl1l5Fpkl4rGR0ivOFGqJopp5OpSiuWA
	0SrdttSxJToht/3Wpk4YmeVtd42fEptKhA==
X-Google-Smtp-Source: 
 AA6agR7hcNIeexQ/NZVVKBmLiTFBFsDDMR0/aPDnkRdF94dWJNSBX1IClE5jaDVaGGk14j6XUXUGfA==
X-Received: by 2002:adf:ee86:0:b0:228:6fe1:371 with SMTP id
 b6-20020adfee86000000b002286fe10371mr3027384wro.684.1662580368897;
        Wed, 07 Sep 2022 12:52:48 -0700 (PDT)
Received: from developer.localdomain
 (dslb-002-205-007-019.002.205.pools.vodafone-ip.de. [2.205.7.19])
        by smtp.gmail.com with ESMTPSA id
 r9-20020adff709000000b0022862fd933asm15030361wrp.96.2022.09.07.12.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 12:52:48 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <v.yurkov@precitec.de>
Subject: [PATCH 4/5] classes: files: Extend overlayfs-etc class
Date: Wed,  7 Sep 2022 21:51:38 +0200
Message-Id: <20220907195139.814465-4-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907195139.814465-1-uvv.mail@gmail.com>
References: <20220907195139.814465-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 19:52:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170429

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

Add the ability to expose the lower layer of /etc when mounting overlay.
This is the similar to what overlayroot script from initramfs-framework does.

By default, this option is turned off to keep an old behavior intact.

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
---
 meta/classes-recipe/overlayfs-etc.bbclass | 5 ++++-
 meta/files/overlayfs-etc-preinit.sh.in    | 9 +++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/overlayfs-etc.bbclass b/meta/classes-recipe/overlayfs-etc.bbclass
index d0bc3ecfac..f8343106f3 100644
--- a/meta/classes-recipe/overlayfs-etc.bbclass
+++ b/meta/classes-recipe/overlayfs-etc.bbclass
@@ -40,6 +40,7 @@ OVERLAYFS_ETC_DEVICE ??= ""
 OVERLAYFS_ETC_USE_ORIG_INIT_NAME ??= "1"
 OVERLAYFS_ETC_MOUNT_OPTIONS ??= "defaults"
 OVERLAYFS_ETC_INIT_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-etc-preinit.sh.in"
+OVERLAYFS_ETC_EXPOSE_LOWER ??= "0"
 
 python create_overlayfs_etc_preinit() {
     overlayEtcMountPoint = d.getVar("OVERLAYFS_ETC_MOUNT_POINT")
@@ -60,13 +61,15 @@ python create_overlayfs_etc_preinit() {
     preinitPath = oe.path.join(d.getVar("IMAGE_ROOTFS"), d.getVar("base_sbindir"), "preinit")
     initBaseName = oe.path.join(d.getVar("base_sbindir"), "init")
     origInitNameSuffix = ".orig"
+    exposeLower = oe.types.boolean(d.getVar('OVERLAYFS_ETC_EXPOSE_LOWER'))
 
     args = {
         'OVERLAYFS_ETC_MOUNT_POINT': overlayEtcMountPoint,
         'OVERLAYFS_ETC_MOUNT_OPTIONS': d.getVar('OVERLAYFS_ETC_MOUNT_OPTIONS'),
         'OVERLAYFS_ETC_FSTYPE': overlayEtcFsType,
         'OVERLAYFS_ETC_DEVICE': overlayEtcDevice,
-        'SBIN_INIT_NAME': initBaseName + origInitNameSuffix if useOrigInit else initBaseName
+        'SBIN_INIT_NAME': initBaseName + origInitNameSuffix if useOrigInit else initBaseName,
+        'OVERLAYFS_ETC_EXPOSE_LOWER': "true" if exposeLower else "false"
     }
 
     if useOrigInit:
diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlayfs-etc-preinit.sh.in
index 0e80849f12..8db076f4ba 100644
--- a/meta/files/overlayfs-etc-preinit.sh.in
+++ b/meta/files/overlayfs-etc-preinit.sh.in
@@ -18,6 +18,7 @@ mount -t sysfs sysfs /sys
 BASE_OVERLAY_ETC_DIR={OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc
 UPPER_DIR=$BASE_OVERLAY_ETC_DIR/upper
 WORK_DIR=$BASE_OVERLAY_ETC_DIR/work
+LOWER_DIR=$BASE_OVERLAY_ETC_DIR/lower
 
 mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
 if mount -n -t {OVERLAYFS_ETC_FSTYPE} \
@@ -26,6 +27,14 @@ if mount -n -t {OVERLAYFS_ETC_FSTYPE} \
 then
     mkdir -p $UPPER_DIR
     mkdir -p $WORK_DIR
+
+    if {OVERLAYFS_ETC_EXPOSE_LOWER}; then
+        mkdir -p $LOWER_DIR
+
+        # provide read-only access to original /etc content
+        mount -o bind,ro /etc $LOWER_DIR
+    fi
+
     mount -n -t overlay \
         -o upperdir=$UPPER_DIR \
         -o lowerdir=/etc \
-- 
2.30.2


