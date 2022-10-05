Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE997C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 11:18:24 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.22095.1664968697327733538
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 04:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C2koFbmN;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id a3so13191155wrt.0
        for <Openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 04:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=5OR/pRjdYlZteYw451RsOk+1cq8OGmxDTOrTkoXUTfQ=;
        b=C2koFbmNBwyiCcVgas0++2mD4X19xDOX943PN4syjzHkdE6cMljdF7ZsDms8ZK5F5c
         pGd/A9tdSGGh1/E553g+NrFPcb0K9lOf3PTf5b+El/lKuNqZHiRYAkpPikhz6W8WXc/y
         A4gW1Z7NbxVd4qzuIyP+2HuxRcB+oiT/ZcXSaqhMh9o4K1bGCjbgiB1qD2hxy7Tur0xk
         MIS5zzP3FSnz7DOP3Cxl6xN3L4AtLLbd852/b5OS4C7XpFPccWMilkbcM5G9oUzoiMHl
         3U9345LUH8XClpjpBUFjy7IhMAsqHaoX/Dtm8NiM56IfpnYOiqQlC46FZCNQI6hvx/gO
         Hsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=5OR/pRjdYlZteYw451RsOk+1cq8OGmxDTOrTkoXUTfQ=;
        b=3PGZ0ZqzCIlWIzWCiIJ0JoiaI7qOJvVTm5HyEVR1dgDSF1/x1oYDqKZwBguTOKOHIe
         xMUSF+iw9GWy8xG+CpR4x89jKtHh8fVjKiWB38O5pOaK90KbRMq8Qi1wdVmVdvKyS4AX
         +6e2nOcuZKDzwFLpiTeOLMaZlNeVxBNas3MG/QrtEg4xCJ8ePApJcJztKGspCMgpy4jm
         tvs++z3E2KCj9zgSpk+KjlflP3iZOfBjjz+g8K19ORr6tuoulOp21YAU4F4LsIlWRW0b
         TNY+gQL4YEsnel5ATYuPhcquqAZk2aHVP52ppLUMqjKswuPkoOHdjVkx00D1w1Acwyhe
         Iw4w==
X-Gm-Message-State: ACrzQf1auX8A0jVg3YHikbv3YIxMjVGVdzMv5IXnJOfWqr1q3zABLLic
	nagmcNxRVSoACXIk2X9OqAc8mO9y3Su1kw==
X-Google-Smtp-Source: 
 AMsMyM44hm+VXIemFRx6ADnuJ2itWvWDEHnqgVrwowK7bTmrVX0ZWJF+NFTb1rIILccTo6runkyX9Q==
X-Received: by 2002:a05:6000:5ca:b0:22e:5477:1296 with SMTP id
 bh10-20020a05600005ca00b0022e54771296mr4694471wrb.377.1664968695149;
        Wed, 05 Oct 2022 04:18:15 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-002-205-007-169.002.205.pools.vodafone-ip.de. [2.205.7.169])
        by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b003bfaba19a8fsm1270586wmq.35.2022.10.05.04.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 04:18:14 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [kirkstone][PATCH] overlayfs: Allow not used mount points
Date: Wed,  5 Oct 2022 13:17:53 +0200
Message-Id: <20221005111753.710384-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 11:18:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171457

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

When machine configuration defines a mount point, which is not used in
any recipe, allow to fall through and only report a note in the logs.
This can be expected behavior, when a mount point is defined for several
machines, but not used in all of them

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
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


