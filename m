Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C2CC433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 08:09:52 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.20625.1634458186955880093
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 01:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pPf2r2Os;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id g25so34847680wrb.2
        for <Openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 01:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fVhj/6xdiacrtg58acTryHoTJowfx9omPC13PbIKc44=;
        b=pPf2r2OsXyADiOza0ArMHe2ukVlpVXIvU8WUZuDpaDk4nuDJe3frGXuhSjdEGyrqNB
         gejPydKi+GDlKQlaD70hoF88lqGiDFHMS48HXDsICR+Z7HjsTgU22x9A5jbunXzylddC
         Jh921KtZA/a+nRs2MoKF1sizZ4YlfOEoY1SZTOqw8lKnk8M8imQd2WM/6pZ3aIGMw4xK
         AzpTE4g87HvDX8pi42U45GO9iNlM0UcSM+CiTivaZHyZNxjeONnz0a7jF8NrGpgMJFk6
         tDfpRP5adbGPGDgAM7QFiXUbj+Y3XmgAd6uqYl18M7kEOpP7hZRE/fhz218lBVzId1ds
         JiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fVhj/6xdiacrtg58acTryHoTJowfx9omPC13PbIKc44=;
        b=Lke+YKD1eZBO20GQFmzZW6npJ7257hl7pXDsBx1/mi2uqVIfX9AbnK3xw28fRVIUyw
         K4UDrtzoJsftaQ4GnIIbg6uD50QqGpUQ+ghuY8S7hDYnpzIXr9ZGxHu4V84koYab8Iee
         YJl6ee3mc4zGkFf4BdR1tVmYyxdk8W+2xbmBzePXq3BnHbCHzQLDtdQA2lMjNl3dNdKH
         TPEO5+Yig2OIbUyylVzIRbJVBjHkuZ8pZ2QaAan3SwQJRVEA3dSIILlZ1h7hm4k3bTbE
         XsokZbmiivFDVT9d2NNMEJ4qJkaR88ca6l6I9nqVGYkTW7K+2ktHsBMCWB6AOe2eE4Y+
         P3ww==
X-Gm-Message-State: AOAM530uA0BC/Kuka5Oloit06D+ldQUUmWUQ8Qd8UBEUtfDuZSr0eFiq
	UMeQ+ua/v75YHKZEnHMHOnepVxHqXgWW/8CN
X-Google-Smtp-Source: 
 ABdhPJyeb+UKHV8Do3ly0xxXYgzqAGxt4Br1kyjI60O0KYqp5g1LeGomVtXDuQ0KQRUA+4Gm+HMTTA==
X-Received: by 2002:adf:e44c:: with SMTP id
 t12mr28021990wrm.113.1634458184945;
        Sun, 17 Oct 2021 01:09:44 -0700 (PDT)
Received: from slackware.local
 (dslb-002-205-236-074.002.205.pools.vodafone-ip.de. [2.205.236.74])
        by smtp.gmail.com with ESMTPSA id
 e15sm9266657wrv.74.2021.10.17.01.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 01:09:44 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	Bruno Knittel <Bruno.Knittel@bruker.com>
Subject: [PATCH 1/5] overlayfs: all overlays unit
Date: Sun, 17 Oct 2021 10:08:55 +0200
Message-Id: <20211017080859.96939-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 08:09:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157026

Application can depend on several overlayfs mount points. Provide a
systemd unit application can depend on to make sure all overlays are
mounted before it is started to avoid any race conditions

Signed-off-by: Bruno Knittel <Bruno.Knittel@bruker.com>
Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/overlayfs.bbclass | 36 ++++++++++++++++++++++++++++++++--
 meta/lib/oe/overlayfs.py       |  5 +++++
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
index 8d9b59c9bf..9397ab44f9 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -37,6 +37,8 @@ REQUIRED_DISTRO_FEATURES += "systemd overlayfs"
 inherit systemd features_check
 
 python do_create_overlayfs_units() {
+    from oe.overlayfs import mountUnitName
+
     CreateDirsUnitTemplate = """[Unit]
 Description=Overlayfs directories setup
 Requires={DATA_MOUNT_UNIT}
@@ -65,10 +67,23 @@ Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir=
 
 [Install]
 WantedBy=multi-user.target
+"""
+    AllOverlaysTemplate = """[Unit]
+Description=Groups all overlays required by {PN} in one unit
+After={ALL_OVERLAYFS_UNITS}
+Requires={ALL_OVERLAYFS_UNITS}
+
+[Service]
+Type=oneshot
+ExecStart=/bin/true
+RemainAfterExit=true
+
+[Install]
+WantedBy=local-fs.target
 """
 
     def prepareUnits(data, lower):
-        from oe.overlayfs import mountUnitName, helperUnitName
+        from oe.overlayfs import helperUnitName
 
         args = {
             'DATA_MOUNT_POINT': data,
@@ -83,10 +98,27 @@ WantedBy=multi-user.target
         with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower)), 'w') as f:
             f.write(CreateDirsUnitTemplate.format(**args))
 
+    def prepareGlobalUnit(dependentUnits):
+        from oe.overlayfs import allOverlaysUnitName
+        args = {
+            'ALL_OVERLAYFS_UNITS': " ".join(dependentUnits),
+            'PN': d.getVar('PN')
+        }
+
+        with open(os.path.join(d.getVar('WORKDIR'), allOverlaysUnitName(d)), 'w') as f:
+            f.write(AllOverlaysTemplate.format(**args))
+
+    mountUnitList = []
     overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
     for mountPoint in overlayMountPoints:
         for lower in d.getVarFlag('OVERLAYFS_WRITABLE_PATHS', mountPoint).split():
             prepareUnits(d.getVarFlag('OVERLAYFS_MOUNT_POINT', mountPoint), lower)
+            mountUnitList.append(mountUnitName(lower))
+
+    # set up one unit, which depends on all mount units, so users can set
+    # only one dependency in their units to make sure software starts
+    # when all overlays are mounted
+    prepareGlobalUnit(mountUnitList)
 }
 
 # we need to generate file names early during parsing stage
@@ -95,7 +127,7 @@ python () {
 
     unitList = unitFileList(d)
     for unit in unitList:
-        d.appendVar('SYSTEMD_SERVICE:' + d.getVar('PN'), ' ' + unit);
+        d.appendVar('SYSTEMD_SERVICE:' + d.getVar('PN'), ' ' + unit)
         d.appendVar('FILES:' + d.getVar('PN'), ' ' + strForBash(unit))
 
     d.setVar('OVERLAYFS_UNIT_LIST', ' '.join([strForBash(s) for s in unitList]))
diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
index 21ef710509..b5d5e88e80 100644
--- a/meta/lib/oe/overlayfs.py
+++ b/meta/lib/oe/overlayfs.py
@@ -15,6 +15,9 @@ def escapeSystemdUnitName(path):
 def strForBash(s):
     return s.replace('\\', '\\\\')
 
+def allOverlaysUnitName(d):
+    return d.getVar('PN') + '-overlays.service'
+
 def mountUnitName(unit):
     return escapeSystemdUnitName(unit) + '.mount'
 
@@ -39,5 +42,7 @@ def unitFileList(d):
             fileList.append(mountUnitName(path))
             fileList.append(helperUnitName(path))
 
+    fileList.append(allOverlaysUnitName(d))
+
     return fileList
 
-- 
2.28.0


