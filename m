Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB12C433FE
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 02:37:16 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.2203.1666838233775239309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 19:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7ldR/0cN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id r61-20020a17090a43c300b00212f4e9cccdso4869143pjg.5
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 19:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wE62l6mKAWd9KcUrm28qHUS87FloebtWwlXtsVm5J+Q=;
        b=7ldR/0cNwU7GTuQsR1wYz+2DXiUmgI8jwh0kaQ7Ywj3FtsWRBShPsj2t0n6mEQ9RJE
         uYHxlWzbpzaMueXVkCoYcu1jfIE1zfyX4fOPpdg0nzb0sJs1tsgEMpiq3292TAMkrGvU
         5DPXHmktf0Qoqsg9v/qqIcekj+r8gBQ7eX2DcHjtl88SXegWz1mvpSRGdWQM9tNb6/Ve
         61wDWHWEDMtIs7PEjfPevr1clqVodjD6ZSbuaMLMhvjHn560q+0r9iPZzN+rGoZ3iy+y
         mhCjetGqpkFPicRrhEtaECbYIrnuGt9Zswr1TnxBvFjkaHM6jY0tU7qCj2aZWQf8fTXC
         Z5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wE62l6mKAWd9KcUrm28qHUS87FloebtWwlXtsVm5J+Q=;
        b=RfQkQfi6Ngyb6++/xX8Csmc9ZoJhAvUhwHR8fyYUsS4Kt6mOmr7LA7y4n0eambWxIg
         l/kkbx6PkezjCu3Cao5+bOmDHr7Z8KJZkHqsiAZWuQruDgFUu6/xOz1aRZ/aYf/g5OHQ
         tLaBiYCLWjTcUmqUYZ51c6FXJo8gp0LBdc5Hjl81xWx3EVBJ+1+fcGyevheuFKGhMDdv
         n3irsj4NlzyBWtWI4SlMX1K4BxNEjP8GNYoz6ps2dJ1uRaaYqDaBzsK6qZl2bkeb4/0V
         xOgnf+CuTxUGbybJAOjiCAqaAedLsH/OEbFjNyHKJRTdMfAwaZJkDKtRKgrb1KIkBSa4
         A63w==
X-Gm-Message-State: ACrzQf0EPXAy9b1a8xVuJop+Q9mcQPd2A6S0KNhs5hDhxU6Z+kOlxblw
	1qeXJvWmx2dwpDsgbdMEDO5erJEtW8ed5e57
X-Google-Smtp-Source: AMsMyM4q/r4/w1S3YwQol+v7XptI4YekODGE1b4v4zDdqdZA/U5hSt0CWTmodZAFb4INgPKrTjwrwA==
X-Received: by 2002:a17:90b:4ac1:b0:20a:de32:3650 with SMTP id mh1-20020a17090b4ac100b0020ade323650mr7452134pjb.142.1666838232858;
        Wed, 26 Oct 2022 19:37:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b1-20020a62cf01000000b0056246403534sm81088pfg.88.2022.10.26.19.37.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 19:37:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/8] files: overlayfs-etc: refactor preinit template
Date: Wed, 26 Oct 2022 16:36:39 -1000
Message-Id: <a1e0ddbb7bc2c63845af67d5fd38f12be44e8775.1666825041.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666825041.git.steve@sakoman.com>
References: <cover.1666825041.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 02:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172185

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad5b2bffbee6ddcf51bc146d1e76c980b498b399)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


