Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E546CC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:43:11 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.1993.1667356982409454199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7+uOC8tT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so704064pji.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kfwl+NSaZIz5m+rEfPPe28iX+t4OJg/KaIyVJuxOiis=;
        b=7+uOC8tT0ztbEp9EMXSgCHfxEUtNjl9B/cFzT03tWu6Qm5Pbhcak3OUoxv+w4gXZq2
         /X19HdH0jQVcg/a8ST2zOij8HxDuzL7OGZ1OzEqCxwDR1gb3c4xA0rADNA9wx6O53bwp
         QWkP4Bd2ROulFPn5fLcfB/WqtvZXnNhubyoQGi34qHozjgQ0wUqqe3+spKCQSv3MPn6b
         KCVkqnnRu/cm2xYcLb7F/DoRroWOyuwAtndzhwi/BDMpo3y85A2wnIKm+JXlvSaogvOD
         IfULDLgEJLgBl2/lQ7Zr2NsFZd2RSjjQ4Xl6YONHmzKag0GflWG9jellrd/1u8pD8a2W
         CjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kfwl+NSaZIz5m+rEfPPe28iX+t4OJg/KaIyVJuxOiis=;
        b=WJlsXccEmps1J3oddCxBAKwcnSveuDXnrJ4Sx7AH2U0kVddVsYnQxgFkeViK20/tee
         iW1zc5guF+4Z3HtxbDToA6EEbmf9DOT9hBB7R/V+EKD8It0f2gQrVIIGnBF9p8rgCwUs
         F302IT73Dx/iK3Qk+iXCAjCYpfoV3RbMMW5W6nRHsPmTEAjXOf6HWP+uiqvfywDJ/069
         myTXOnsaNywxKiyJlNXBSr4xU0N+LmfTFI6GN6Kz0tFR4a+6KjEH2uCa2Qf+VOWkH2ia
         ean0WWUegF0yud/G8Q32+DcmlgCTpluXZMD2UzKzwPDmrchHwL8IfPSXcBSzk4ZFU2Tj
         3EZQ==
X-Gm-Message-State: ACrzQf37P4YC7+ibJyLvN/8y6ydRBnfWOdMlfVfJ715hutLn9yDAcwqb
	10ePdjLgKkXMldSWTSFfiXgdLOk05lSVewt4
X-Google-Smtp-Source: AMsMyM6J0pigVcpidtcg7Iwr/eVTP4vdCh6Xd0ZLGpT33RCkvWxgQTghj+nZvg3OCSiQCbgtz2dDvQ==
X-Received: by 2002:a17:90b:4a4a:b0:213:43bc:91b3 with SMTP id lb10-20020a17090b4a4a00b0021343bc91b3mr40604667pjb.151.1667356981410;
        Tue, 01 Nov 2022 19:43:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.43.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:43:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/20] overlayfs: Allow not used mount points
Date: Tue,  1 Nov 2022 16:42:09 -1000
Message-Id: <c7c6b273656a3e2b8b959004b996e56d4086ce5e.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:43:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172559

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

When machine configuration defines a mount point, which is not used in
any recipe, allow to fall through and only report a note in the logs.
This can be expected behavior, when a mount point is defined for several
machines, but not used in all of them

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit a9c604b5e0d943b5b5f7c8bdd5be730c2abcf866)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


