Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5400EC001DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 20:34:02 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.5659.1689626037455900876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 13:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=S8KLlWLo;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso6658553a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 13:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689626036; x=1692218036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDIFI+Sgj1hSBECLRlC4+C8kg+chmA9CIWOcsPgtCBM=;
        b=S8KLlWLoZJG/sziyA7zOJE4y6pLC7u7U95n2qTvPvcwX0BLl0TWTfTdTRyCh3h8hS3
         kzfDmt3JqqwKTBAzo4xspXbymcpt1YPz3jmnR3T/zq0L/yJNYay46c+DXv7VTqwu6duS
         /MUEtDSH8bEzFlUJbYA0tcFm5nSK5lQ2W1LxREBHk2qUQtKvIUgPlB44DXk34btC0ymK
         NkDPXlXnZGlxaJiw8wucYUCn8asCemnJJIEAOyYkyfC/vkwGpmt/GhHFuN7xMOEsxQ25
         A8BFsXgBCDy4LHTTL1REH5UGj5V4iGVlfOAV5ZUdyZ7VWvMqp5hCElzXHzqfivNe2a7U
         se3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689626036; x=1692218036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDIFI+Sgj1hSBECLRlC4+C8kg+chmA9CIWOcsPgtCBM=;
        b=ikYQJuRKlgvl5YQNPZj1i+97bp7dUupdPJBou2dDYSwwg3q7uypx3NyEV7Bze09hlt
         w/6lo6aPcUSB1CIVvf3PlfA02WVJBcZhEHYiBPohKNA2pCjrWPnkvpxdMvkEJWC80VfZ
         WJqMaQ0Mfrw11ueGKeulEKydnYG1Y/B91c2+QEjQzBDTOJgV9blta70w3FHdqtSSgXyv
         bfGf9AB0LJ7p2Pf5bnhmyUD3y1oBHebB2wDq5wrisXkvHJufmhwZxIzWfqnT6wzVhvxn
         ESsflBPC2qK9F8a39l73z2QTBKPvVbCQRQBTn6s7NQZU09SNQsfMQyc5PijUwY3YMweY
         2TRA==
X-Gm-Message-State: ABy/qLbFPecWpex1+XgJpknhW3gdq4bw63DKl9/DdYWMYkoHVlSwNDjS
	6rtMLBwKitU6/OKIJUxG+o5hDWCwaWo=
X-Google-Smtp-Source: APBJJlHIrrJGE34Ps490LxeFw0wMKp2m2w4mObMaYxAzsKMHrZDKxovLx9tnCnX3PoOSreUQr8LIlA==
X-Received: by 2002:a05:6402:542:b0:51e:3427:63ea with SMTP id i2-20020a056402054200b0051e342763eamr11190518edx.8.1689626035632;
        Mon, 17 Jul 2023 13:33:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j9-20020aa7c409000000b0051e362db186sm104334edq.60.2023.07.17.13.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 13:33:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] Revert "rootfs-postcommands.bbclass: add post func remove_unused_dnf_log_lock"
Date: Mon, 17 Jul 2023 22:33:49 +0200
Message-Id: <20230717203349.3728061-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 20:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184480

This was not well researched or explained, and obscures a problem elsewhere:
if dnf leaves lock files around, the problem should be fixed at the source,
and not in an after-the-fact function.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 53b241413e4..4492c9c0aa7 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -49,8 +49,6 @@ ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check; overlayfs_postprocess;", "", d)}'
 
-ROOTFS_POSTPROCESS_COMMAND += 'remove_unused_dnf_log_lock;'
-
 inherit image-artifact-names
 
 # Sort the user and group entries in /etc by ID in order to make the content
@@ -363,11 +361,6 @@ empty_var_volatile () {
 	fi
 }
 
-remove_unused_dnf_log_lock() {
-	if [ -e ${IMAGE_ROOTFS}/log_lock.pid ]; then
-		rm -rf ${IMAGE_ROOTFS}/log_lock.pid
-	fi
-}
 # Turn any symbolic /sbin/init link into a file
 remove_init_link () {
 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
-- 
2.30.2


