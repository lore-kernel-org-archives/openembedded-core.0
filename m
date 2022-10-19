Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0E8C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 07:02:30 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.5124.1666162940548984725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Oct 2022 00:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n/Pza6Op;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id a13so23872808edj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 00:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nQyRrI9sEuozVazxSso2duNE3G+ojAy6kixLlrWBcWA=;
        b=n/Pza6OpoO5UNuxkRvVogp0doQJp/qoHkpWkPUtBfco0gt3elwyt7cIIYlOJbNrEox
         3nXsFiTfRg/h9EgvKm+kjEhxRq91c/SxlTUmx91HCXPofGV+gJwKMN92G6lc66oSISKo
         +9hdWvZGgPkToxlPMgv6IFsflPYMmVLSHPLPHtoT5tWNtC4GDHQDNCQCCejRANesO/yr
         RfsnSTE4dmu7RsO/C8sYCaRfoT2kdIWv5NOwzv4lh1evRP5xUoJzl/dUZmQpOfVPuh5i
         mAyddCGVR/Hv4BeMKbdIeEilwYLzhmkG1SW6SAb+appWnH1m5NDapelxkNYLNrtQBNQD
         d9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQyRrI9sEuozVazxSso2duNE3G+ojAy6kixLlrWBcWA=;
        b=xQe/f1zT7owEkjJpKmFJ8UmsrgGA3msFvUHmAU0a8HiyO7ptsnlNVbM1owYJgI9EUt
         lvTWrfEbB31wuhqskE9m9kX7bXgFCOdqPw39Qgj0j17NgCOtUKQJ0+pA3gSxnStvMv5E
         qOQAGjccLs/yNt+2TDBelV1G3qWhEgrYOQk5f3SIq+x5W/RJzhbyBPYo4vvgqeRZEZdY
         lgRaPII4UB0jvesojdaKAGbhNUODiHFmkZXXkcl2auSfE0NfVOdq/22fziS1HBIIJmEu
         8JebmPJGvhAwpzNLS55lxkhYWi80VoegvSX5pOdLgWpmY8iXulbKlcqQk8+GE16eog7H
         1l8A==
X-Gm-Message-State: ACrzQf2v2qrwrnf4oPF76pkkwl8Br3TkBP6QBD2qucWseRzOSrltwalM
	+PNmk7k5RTkgvnFmdFyB6SvNKjI77YPVvA==
X-Google-Smtp-Source: AMsMyM6wFsbtjzQUeAJ+FTnl9daEs8yyS1ayI/8IpgOog082vnXtM3kYfDSfdm+86WbHIjuPy5h53g==
X-Received: by 2002:aa7:d458:0:b0:45b:ddbf:39fa with SMTP id q24-20020aa7d458000000b0045bddbf39famr6098791edr.335.1666162938684;
        Wed, 19 Oct 2022 00:02:18 -0700 (PDT)
Received: from developer.localdomain (dslb-002-205-007-041.002.205.pools.vodafone-ip.de. [2.205.7.41])
        by smtp.gmail.com with ESMTPSA id n2-20020a170906378200b0078b1bb98615sm8539899ejc.51.2022.10.19.00.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 00:02:18 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <v.yurkov@precitec.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 1/2] files: overlayfs-etc: refactor preinit template
Date: Wed, 19 Oct 2022 09:01:41 +0200
Message-Id: <20221019070142.1792311-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 07:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171960

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


