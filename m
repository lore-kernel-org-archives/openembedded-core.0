Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9546BC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:02:17 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.7211.1667530934500900760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ciIm4F9d;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so3575380pji.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+7pJqKi9FxDcEIQNXNV8Tu3H005mF/Qs0Zf6tYW04c=;
        b=ciIm4F9dLtWPZCHKKWq0i1zXeeN8MH86tvV3pofrBdsNNWkzIq3AjyPaiO8JCtQnl5
         wwecH8nzjb6PKXODL3kZI7m16K1BK70Yys/+YPPWR589NuHASH6pc7wUSyEzFBOqYH3S
         QwUdK4R3RVAtAA1uqM8BExmAX8ksbr/EDRzq9qydR5xf/kDGnqvRoodSuwifJLAsKkIh
         zRkapxHbaXaMGhP2pdwgHmYJ3UOC7Pb7veNO+e9CO36Cre8O7veOrts0PXuD+4wbPdli
         u8OX9o6ra7XypJ85+15lfgpEcQrmXVx8ejHoVxpk+Fm4k3lu1vbN601ExdL4d73FZ2Ac
         MUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+7pJqKi9FxDcEIQNXNV8Tu3H005mF/Qs0Zf6tYW04c=;
        b=WPJEHTeh1wjPiFdT9ukeN4h8YibrkP71I5pEvsC744rpjDjJhZImKwDt9q7Esg2BML
         Zb9XT4OHcGkoyjEQPupNLUhVDh2GubJB6Jljjhb69HrjsLM1yqxW9ARl4gR2FvFbgDwD
         aJThDPIdB6EMrQcKsMqCgLgPkUYf8VNVov6sXtljGMzH0K/t/8OON+5q1w5pBZK4xrhg
         WjL/wEwdSns4YFt+0kzBoGKkea5JqauMaHA9tmu3AzffoRnUnqE3paqUTc5qsqP8py5v
         pj+f+u+rQhbLKHTABXeHsz58gSkUQ52UAhGhdQku8sP61vYDKCH9sys6CqLhjiOlVtvO
         QjcQ==
X-Gm-Message-State: ACrzQf3IsAWW2jpM+JmXQYsJCS7G9f1P+u5m4jLCHKK9gq0qIhM1b15v
	cZgVeOO5AGFHyWusdHYX9XAlhqu5tdRgiYoG
X-Google-Smtp-Source: AMsMyM50+9fwD8wiIVVVzbcJSFLR9MNZmJWFsPSRv33PJxs5E0b5mALAGStLP9ZGo4P5e2zMUDKKNQ==
X-Received: by 2002:a17:902:e882:b0:186:a3ba:8780 with SMTP id w2-20020a170902e88200b00186a3ba8780mr33550100plg.114.1667530933538;
        Thu, 03 Nov 2022 20:02:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.02.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:02:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/31] overlayfs: Allow not used mount points
Date: Thu,  3 Nov 2022 17:01:03 -1000
Message-Id: <a535b08de6f8a7fda14054d31cbce09ef4461a95.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172689

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

When machine configuration defines a mount point, which is not used in
any recipe, allow to fall through and only report a note in the logs.
This can be expected behavior, when a mount point is defined for several
machines, but not used in all of them

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit a9c604b5e0d943b5b5f7c8bdd5be730c2abcf866)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit c7c6b273656a3e2b8b959004b996e56d4086ce5e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/overlayfs.bbclass | 6 +++++-
 meta/lib/oe/overlayfs.py       | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
index f7069edd41..c3564b6ec1 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -96,7 +96,11 @@ python do_create_overlayfs_units() {
     overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
     for mountPoint in overlayMountPoints:
         bb.debug(1, "Process variable flag %s" % mountPoint)
-        for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
+        lowerList = d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint)
+        if not lowerList:
+            bb.note("No mount points defined for %s flag, skipping" % (mountPoint))
+            continue
+        for lower in lowerList.split():
             bb.debug(1, "Prepare mount unit for %s with data mount point %s" %
                      (lower, d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)))
             prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
index b5d5e88e80..590c0de58a 100644
--- a/meta/lib/oe/overlayfs.py
+++ b/meta/lib/oe/overlayfs.py
@@ -38,7 +38,11 @@ def unitFileList(d):
             bb.fatal("Missing required mount point for OVERLAYFS_MOUNT_POINT[%s] in your MACHINE configuration" % mountPoint)
 
     for mountPoint in overlayMountPoints:
-        for path in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
+        mountPointList = d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint)
+        if not mountPointList:
+            bb.debug(1, "No mount points defined for %s flag, don't add to file list", mountPoint)
+            continue
+        for path in mountPointList.split():
             fileList.append(mountUnitName(path))
             fileList.append(helperUnitName(path))
 
-- 
2.25.1


