Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F57C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 11:15:04 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.22269.1664968496024244982
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 04:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bo/sPCk/;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id w18so16707345wro.7
        for <Openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 04:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=N+D2EGliKBHD343HNe1FICAToRjlNL5ea8FQp4ivM3s=;
        b=bo/sPCk/2BmPwDzOnm4sZk/qKspIa3Kc07/cexUa4InbLEnbVQPhqalntuwAwkvX1s
         UGy5LtWDsdWkZNBS/WATd+6xgSJcYs5jCPvJm+ErPu9DHr8c/vMaPkPxWAcdkqiAGMIA
         ZSBiFO3KWpCIvFX2WJhRcZE/lncr6bbbZ023ZzD6zZfUDQn6Uger0gNG/3maO9xrPJf0
         F3q+kuzQF4xVKH0ok0/EQYTWTeAzNkeVxoJTCVuPOu7OMeeUHdZdcy+ceQ17xNgPGwBM
         t34QKNbSjqjkH8UIRwYV/vDiONiy7sDF5l27oBa+59PYOxa4tFj8iJm3ERHW1uKkk/Ah
         vVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=N+D2EGliKBHD343HNe1FICAToRjlNL5ea8FQp4ivM3s=;
        b=u8/MQmXS4/z2mEr/gN3fOkNMwl9ZuxLqFoEe7pSUhI7grWtt2z7HFggd+ys75nKZof
         j+daFnY1g07Q5Coz9bSckvcAKkPUL2FptLXCeSQufNv7pLdKJOIh6SwRhnx8cRt6gQfO
         ebYKMzqCqlViMT1wSf5HgSjKrMgZ1NXJc1KeR5a342UFF8h47nxpZh5GS39tp3X327jl
         oCPAxPh2QI+tBUlznEHOR+hAJELHCh03XyfuslckRCunxGmFSw+3ZXEPZUdpHDjCxJ9I
         J1+llAIBfwyHByVPgGNcpBK2PLBHrKhg/hHSKl/tzrBvH45LzyCAmVXGdRY/PnBXzFyz
         kxMg==
X-Gm-Message-State: ACrzQf2g0RS2yN9GZHowgoXrKGPZX55Ujxv6sb6xMVB7RRdMRH6bhzW2
	y3uVYqM9Rb2kNwmFIzAK5Ef2XoB4gYtYYg==
X-Google-Smtp-Source: 
 AMsMyM49itpqfZglCl516Foye54yAFgj/gKiJs4iunCwWooV+K1Rl/EDvwYMUSqpweh37oqKTvAiqw==
X-Received: by 2002:a05:6000:258:b0:22e:6684:47fb with SMTP id
 m24-20020a056000025800b0022e668447fbmr62947wrz.429.1664968494090;
        Wed, 05 Oct 2022 04:14:54 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-007-169.002.205.pools.vodafone-ip.de. [2.205.7.169])
        by smtp.gmail.com with ESMTPSA id
 l18-20020a5d6692000000b0022ac1be009esm14933832wru.16.2022.10.05.04.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 04:14:53 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [PATCH] overlayfs: Allow not used mount points
Date: Wed,  5 Oct 2022 13:14:02 +0200
Message-Id: <20221005111402.709989-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 11:15:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171456

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

When machine configuration defines a mount point, which is not used in
any recipe, allow to fall through and only report a note in the logs.
This can be expected behavior, when a mount point is defined for several
machines, but not used in all of them

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 meta/classes-recipe/overlayfs.bbclass | 6 +++++-
 meta/lib/oe/overlayfs.py              | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/overlayfs.bbclass b/meta/classes-recipe/overlayfs.bbclass
index bdc6dd9d57..53d65d7531 100644
--- a/meta/classes-recipe/overlayfs.bbclass
+++ b/meta/classes-recipe/overlayfs.bbclass
@@ -102,7 +102,11 @@ python do_create_overlayfs_units() {
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
index 8d7a047125..8b88900f71 100644
--- a/meta/lib/oe/overlayfs.py
+++ b/meta/lib/oe/overlayfs.py
@@ -40,7 +40,11 @@ def unitFileList(d):
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


