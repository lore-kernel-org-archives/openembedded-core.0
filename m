Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.51.1626378002220834532
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C4VXIE/E;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso6736065wmh.4
        for <Openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=izj81jdoTw+au03RnFA6LCUrF+ukVU7gSKiN+qB//3E=;
        b=C4VXIE/EWsVNkWN/+8zYo+pfQyBc34vBkkT43/jWFXrzOM+KzQuwHxfbP5xhG7GH8+
         ToUodmrMZ7ogHCgzgvdY07mNkAYqhBHPz/YeRwO3Ulv3TQ63rCyRL8P8kHCie6aZChGe
         TX42WK+TI/91QPELjW1J9zYTqbHaLnwotHf3BJ8G+ciU6gsXpQQCP87w5SUo9zWgWcCP
         z/WMTewMa/G5QDbMyDzPJ/BrBmhN7RaPKek25h8TPiQhrVwJXFJ2sIhC/5bwRqr4LF1q
         K1jGI38uBSffVHk2C63w98VqglvwTJgYyQVOUXbfISDuuwXnFIvnlT/uQYzEm9LxjT04
         rz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=izj81jdoTw+au03RnFA6LCUrF+ukVU7gSKiN+qB//3E=;
        b=l+h1kPuwH6pZ1Ykk+V9v0KveHzcOUpsLEhnSGeEUkzheWMpjBcBvmfSWbfnBk2lAsT
         s+xx3zDhqlq98GwurZ1i99PM3Oopy6v+LA5yc+eNXZ89B2/ywTxB2QHhNXYHTggm9/Yh
         Cq13Yt2OUIdMrhbh87Oq51xrfTBizOcdKT1+zGNCTVgTFtEKEAuscKM64iKO0MD5MgtU
         0x8vJDiSguOESkIVbwBcjMGVcwdFv3zim5VRdFaWB1Ip0uqAcxRyb4VCOg6Ui5v7AIGw
         jmyD1pAFmAeOKzhch/7gjajdY1zdbAxCa2vDIivNvyNHtK/zysPLzofKc72Sea8YzNEB
         Ug9Q==
X-Gm-Message-State: AOAM531MhnRxQwkujlCHQzmovoFVeNRdfYqEPZ7FxXBTkF2YWD2l6cfu
	qlGbNAHnfdCuI44SWPUhCFY14CrcBBpkjw==
X-Google-Smtp-Source: ABdhPJzImhBih7bjF2SO2ND2bDB7o8rShmLfk35b0i5iekXZuWJi9OESsu0THr67qTjKsOP3hz+Hbw==
X-Received: by 2002:a05:600c:3595:: with SMTP id p21mr236705wmq.105.1626378000628;
        Thu, 15 Jul 2021 12:40:00 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local ([194.99.105.68])
        by smtp.gmail.com with ESMTPSA id p11sm7533809wrw.53.2021.07.15.12.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:40:00 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 4/8] rootfs-postcommands: add QA check for overlayfs
Date: Thu, 15 Jul 2021 21:39:29 +0200
Message-Id: <20210715193933.66120-4-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210715193933.66120-1-uvv.mail@gmail.com>
References: <20210715193933.66120-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The check is conditional and only enabled when overlayfs is set in
DISTRO_FEATURES

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/rootfs-postcommands.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index e66ed5938b..b6ddf5475c 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -39,7 +39,10 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd"
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check;", "", d)}'
+
 inherit image-artifact-names
+inherit ${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs-qa", "", d)}
 
 # Sort the user and group entries in /etc by ID in order to make the content
 # deterministic. Package installs are not deterministic, causing the ordering
@@ -373,3 +376,24 @@ rootfs_reproducible () {
 		fi
 	fi
 }
+
+python overlayfs_qa_check() {
+    # this is a dumb check for unit existence, not its validity
+    overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
+    imagepath = d.getVar("IMAGE_ROOTFS")
+    searchpaths = [oe.path.join(imagepath, d.getVar("sysconfdir"), "systemd", "system"),
+                   oe.path.join(imagepath, d.getVar("systemd_system_unitdir"))]
+
+    allUnitExist = True;
+    for mountPoint in overlayMountPoints:
+        path = d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint)
+        unit = mountUnitName(path)
+
+        if not any(os.path.isfile(oe.path.join(dirpath, unit))
+                   for dirpath in searchpaths):
+            bb.warn('Unit name %s not found in systemd unit directories' % unit)
+            allUnitExist = False;
+
+    if not allUnitExist:
+        bb.fatal('Not all mount units are installed by the BSP')
+}
-- 
2.28.0

