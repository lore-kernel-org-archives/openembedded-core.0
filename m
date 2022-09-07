Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E67C6FA89
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 19:52:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.241.1662580369844669842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 12:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y5w4kqna;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 186-20020a1c02c3000000b003b26feb5c6bso1472360wmc.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 12:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=RqwzNSDW696refARX11w0FAtjJ4jpVTd5IfDtjQcH9E=;
        b=Y5w4kqnalZY3L3ThDE2O4SgkLKqfG3XAoYTeAFC0CTVNcOXyOvJhvE7qkkLcrcDKMw
         Ju18JJGA2Kq/2KLldNJ6W9K7XkZtJ4XR0m7c2xwgCcorEzgTmvHjeretVhPyU89zEwj8
         20LByrOP2fl0xDGctjgGz7G/DlbchU5wVGmuMtFLeDiE5kTV18E0hN+Cng0S3tt4/JVo
         4/P6kayGZsy2OFeb50ArnPYWXUU3z4ZFenYDGd399/o3G0RyfJ/jJlWdRzhPSvN+nhQX
         LnBI4sVFhSCqT+QyTiIS0QcW+hDDtSII5ETYnQ5XJhSUTlp45Eo/oQAkP9HaFXpUHrGN
         FcXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=RqwzNSDW696refARX11w0FAtjJ4jpVTd5IfDtjQcH9E=;
        b=ISaLcfVRxH24YgcvOmTN9WFNz0m3kQO9jss/6LlUJF2DlD/39rMNaHDNJDrWP9sZog
         TWOKH6+OaQ+WFRZG/7FhHXV5qB71+bGyBvg0Iz489Jdt5zrmz99yX0LdM4WP3gw3u7EE
         92WGZf54lyFh9PeyqKLIgcscdWWk8sjzUIuA9yUm83kWQ16Y/mkmcXNBHWWIqYjrwDlp
         mBtdTn/y/JiCy4pyEfMpWFDN2mkIYBPWZ6vASGIojCy1uU4zfZ93VyXkfnOb+Ldn3JJN
         M/X7MrDlu6sQKkZFSntYybTUFWrTHXj0lrF58n5AcwCnt0L8JDvhdf4BRYXUik3Dd94M
         cBQw==
X-Gm-Message-State: ACgBeo3fcqU4XPZFSTuo/BJUeBbJxNqaVrinNyDPuH5LtjlL50BaQ+BH
	GsTjgy4xdL5eE/pcVMxQf5IuhYNCJ6fGuQ==
X-Google-Smtp-Source: 
 AA6agR5QpvIu8bY6jlIl6cfkOE10xW+KP9DiovQZS6Vn/V1PHozp/zbcx9KlfwWqce11bavleAYaZQ==
X-Received: by 2002:a05:600c:1906:b0:3a5:fe9c:4dcf with SMTP id
 j6-20020a05600c190600b003a5fe9c4dcfmr55258wmq.118.1662580368096;
        Wed, 07 Sep 2022 12:52:48 -0700 (PDT)
Received: from developer.localdomain
 (dslb-002-205-007-019.002.205.pools.vodafone-ip.de. [2.205.7.19])
        by smtp.gmail.com with ESMTPSA id
 r9-20020adff709000000b0022862fd933asm15030361wrp.96.2022.09.07.12.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 12:52:47 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <v.yurkov@precitec.de>
Subject: [PATCH 3/5] files: overlayfs-etc: refactor preinit template
Date: Wed,  7 Sep 2022 21:51:37 +0200
Message-Id: <20220907195139.814465-3-uvv.mail@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/170428

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
---
 meta/files/overlayfs-etc-preinit.sh.in | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlayfs-etc-preinit.sh.in
index 43c9b04eb9..0e80849f12 100644
--- a/meta/files/overlayfs-etc-preinit.sh.in
+++ b/meta/files/overlayfs-etc-preinit.sh.in
@@ -15,19 +15,23 @@ mount -t sysfs sysfs /sys
 
 [ -z "$CONSOLE" ] && CONSOLE="/dev/console"
 
+BASE_OVERLAY_ETC_DIR={OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc
+UPPER_DIR=$BASE_OVERLAY_ETC_DIR/upper
+WORK_DIR=$BASE_OVERLAY_ETC_DIR/work
+
 mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
 if mount -n -t {OVERLAYFS_ETC_FSTYPE} \
     -o {OVERLAYFS_ETC_MOUNT_OPTIONS} \
     {OVERLAYFS_ETC_DEVICE} {OVERLAYFS_ETC_MOUNT_POINT}
 then
-    mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper
-    mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/work
+    mkdir -p $UPPER_DIR
+    mkdir -p $WORK_DIR
     mount -n -t overlay \
-        -o upperdir={OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper \
+        -o upperdir=$UPPER_DIR \
         -o lowerdir=/etc \
-        -o workdir={OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/work \
+        -o workdir=$WORK_DIR \
         -o index=off,xino=off,redirect_dir=off,metacopy=off \
-        {OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper /etc || \
+        $UPPER_DIR /etc || \
             echo "PREINIT: Mounting etc-overlay failed!"
 else
     echo "PREINIT: Mounting </data> failed!"
-- 
2.30.2


