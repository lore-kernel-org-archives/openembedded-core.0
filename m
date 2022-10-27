Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486ABFA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 02:37:16 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.2168.1666838235790276491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 19:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=00WV4Msd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id b185so92766pfb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 19:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1NisCUf8qzZ9g/p3nETMm6O3Uv9z6+nMUYLqa7lpc4=;
        b=00WV4Msdexwm1uIqcZQAw//oD3JD1ATuk3fT19ZMS3yRn4elt3q6jQusdElsBrg08/
         iEHAQ8Y/qYs9Cf02D43A20zcqIW7uBm4fHbepP45x0JM20zvcQAF+JFPRySyRWbajtdI
         IMkrGU1WOm/6pYylB275tXFbc8y9/5MJX1/Ibn+Mx/E+dfklXz/bMRuZnB22k0Q1ovaa
         RKvxtsSF9R/MiL4mvYkhr0iMSLh96d9wzw1uDnGkksqePytpyZ8OFy3j2Aay8t1h1lti
         Cv2eX28tgOx/kWNjIZ3boKELYHOH5gVZmGQygo0VKLY/XUejtrohAxTE27PfBCLAmMLj
         6v8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1NisCUf8qzZ9g/p3nETMm6O3Uv9z6+nMUYLqa7lpc4=;
        b=nyrma52TgU1p5bt5RWQZlOHuysot6W1LdpiGYQfIkEWKcVHwqGRw96Qk6ktWEpgHtg
         +v9X6p8OFaZyG21SFfFrrnr+oTf95JHLuzEeMhRaTRPyNFhOu93tbJWj/cxzYyrEB0Sv
         vJiW8q4lBtiwrq5CjrysZAthfOO6k1dbxUIRYGmqUOmNIJWzAJux8SgvKF3bhaewYFKa
         2bMypRyQvByn8mq0Qd8WiBrdx2RpEvSAtBy7RonkMoff9Tw53tgOA5WTJXkvzQzfS+5r
         fArpb5AjsXdnuk+pmeKmq/c4Y6NFk2Ckv2vjTXTlph2qadOc3V4KagETV+BHjW27QHiV
         4m8g==
X-Gm-Message-State: ACrzQf2cvJnb/ACJyqndxlzQwTjSK6esBq80RdNCl+0pWdEbQ6WZpQGD
	iMPphikwx5oR9BBZnRAJFdQamgO5NZOfLgLp
X-Google-Smtp-Source: AMsMyM6O8SUi0VT0b7JVxCAqLebt6T9oTGYhIzKAtdBP/Pn9woXzt9f2Qq9/GOyhmr3XI8Gs7SozxQ==
X-Received: by 2002:a62:b404:0:b0:56b:e147:1ae5 with SMTP id h4-20020a62b404000000b0056be1471ae5mr17496042pfn.78.1666838234785;
        Wed, 26 Oct 2022 19:37:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b1-20020a62cf01000000b0056246403534sm81088pfg.88.2022.10.26.19.37.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 19:37:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] classes: files: Extend overlayfs-etc class
Date: Wed, 26 Oct 2022 16:36:40 -1000
Message-Id: <6ad25304abefcbe538db7745e17ac213fa7d0719.1666825041.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666825041.git.steve@sakoman.com>
References: <cover.1666825041.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 02:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172186

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

Add the ability to expose the lower layer of /etc when mounting overlay.
This is the similar to what overlayroot script from initramfs-framework does.

By default, this option is turned off to keep an old behavior intact.

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 791e8a8bacce5a7f31f4d7bcbfb17df2967fd258)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


