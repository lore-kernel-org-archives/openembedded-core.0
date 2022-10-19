Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF4DC43217
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 07:02:30 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.5013.1666162941326783988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 00:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I/ZYDyaI;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id e18so23814552edj.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 00:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnZjZJ4sVhDmw/wUeoEMrKGeH+64IOuPurUZCWQRdbk=;
        b=I/ZYDyaIEFQoXsBk7dpwqNuQJOnZu+aupywB2sDqaWWrStLUqYe4l+kVO4deOJu0/M
         dh97tDIkH5b3I9S0keIdhzv4H/sqD5OJWe7/9onRw83XwMWKCc99nrGT0xNTpMtNNvDl
         abisUqHtab+cBYZC5GgMVsMlQnVOGFUAVqJhfzVNtRhVDAxa+5CB7cWWWxb+rwtXsS7X
         1V+DlH4is5ZEsSf7qjq0EyZJ+m7TQu3+pkKO3IXiTzQS3z6twGJbrxBJTRSk+1fB73Yx
         k9TAJPOophrRyHC6cBejW1ZnQtMUoX5eGYRg+uk7pyfzP6whCzqwO3l96nfN3qaP0Ruk
         YrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnZjZJ4sVhDmw/wUeoEMrKGeH+64IOuPurUZCWQRdbk=;
        b=0zJrweFDfLk93S/VJjxFPD8GQOStQTpLTq/ul5zNpU1DR0VO4TolFb13Xwz/5yffwj
         gN0nnkXOTRCD9Q36Me6Gc0QKS0Cbvl/6wGxoorRCzcsf2PPa6F0971JNjhV4HcWTfJg0
         s9RgHpKgv2g8Edsbs5zOEAJW6TjGNHKdDkNd+JUTG+vefDJV5J3oD5SGr6KXNqgMH50w
         WvxR/eKjoImgD2xW0WV+GyL9aT37y9/W/pU07YOOhlFRZ1SXmWmbRfK5xWBjuU0zYB1O
         oBKYYfkuQ3bpMTcCj0/DwtgkWixEBxf8mv3g5CcWx/TGRsrE66VX0NYXQ/dyJukZ6wR0
         IoSg==
X-Gm-Message-State: ACrzQf3p1gqHMPACBJejEoHVb0CB9HwIRDxsOG+7hM4rvfRcPgWfWZFP
	nv10whgGkgJQZlBMUP4Jb4aV80f8DK88uw==
X-Google-Smtp-Source: AMsMyM5PHns7+bolIInW+hH/oi9kp4w8Celwui7zgNsRyqx2Y6V2NZSLuYCm/YJUtzfGN//TmR+c2Q==
X-Received: by 2002:a05:6402:f24:b0:45c:d71c:7f62 with SMTP id i36-20020a0564020f2400b0045cd71c7f62mr6130991eda.416.1666162939493;
        Wed, 19 Oct 2022 00:02:19 -0700 (PDT)
Received: from developer.localdomain (dslb-002-205-007-041.002.205.pools.vodafone-ip.de. [2.205.7.41])
        by smtp.gmail.com with ESMTPSA id n2-20020a170906378200b0078b1bb98615sm8539899ejc.51.2022.10.19.00.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 00:02:19 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <v.yurkov@precitec.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 2/2] classes: files: Extend overlayfs-etc class
Date: Wed, 19 Oct 2022 09:01:42 +0200
Message-Id: <20221019070142.1792311-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221019070142.1792311-1-uvv.mail@gmail.com>
References: <20221019070142.1792311-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 07:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171961

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

Add the ability to expose the lower layer of /etc when mounting overlay.
This is the similar to what overlayroot script from initramfs-framework does.

By default, this option is turned off to keep an old behavior intact.

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/overlayfs-etc.bbclass     | 5 ++++-
 meta/files/overlayfs-etc-preinit.sh.in | 9 +++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes/overlayfs-etc.bbclass b/meta/classes/overlayfs-etc.bbclass
index 91afee695c..40116e4c6e 100644
--- a/meta/classes/overlayfs-etc.bbclass
+++ b/meta/classes/overlayfs-etc.bbclass
@@ -34,6 +34,7 @@ OVERLAYFS_ETC_DEVICE ??= ""
 OVERLAYFS_ETC_USE_ORIG_INIT_NAME ??= "1"
 OVERLAYFS_ETC_MOUNT_OPTIONS ??= "defaults"
 OVERLAYFS_ETC_INIT_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-etc-preinit.sh.in"
+OVERLAYFS_ETC_EXPOSE_LOWER ??= "0"
 
 python create_overlayfs_etc_preinit() {
     overlayEtcMountPoint = d.getVar("OVERLAYFS_ETC_MOUNT_POINT")
@@ -54,13 +55,15 @@ python create_overlayfs_etc_preinit() {
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


