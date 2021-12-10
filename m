Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26649C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 13:02:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.6893.1639141318807600737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NXskoxvJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id c4so14777595wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=//yyx2bjYorCsFwWUhzI7/bdTFJUsYUkWr7HK6+G9fI=;
        b=NXskoxvJUBRaaam3F5YoyNVENGO7pFelvxYTKx3uccoLHKXvpaz6VpXkOYuLgOcoYC
         AyURlxbavQTcx43VDdNLJGX2Nh3g+OUySOWgvQdBy4l/pXhoWFZcyjkI/nFQ+ygC2gGE
         /pk01b6VDSRh3Md9O9vJP/NtxsVssfgKtwBAuCJzKLXemMAuwlbgpSfn0AGoWq3P0AuO
         S3pWkBypbZvuebUu9BegzsneKtwz/ZZzZ5rOkj+1D8SWseq805O5l7OSZRQPgrlIrmkm
         xXy/m2CR5AdUKSh7o+ZLM9Ig4u5QLpQjr2+zmXxZ1tcp+QusYtH5668aqSRuqlSpsXrg
         ovFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=//yyx2bjYorCsFwWUhzI7/bdTFJUsYUkWr7HK6+G9fI=;
        b=Mkrsvdkm/iwwwah0kwcSclHlyvKtTRDcwNf5sJ01jW3KiTvwLp6nI8Sv/mfd6xnimE
         wviEFBckLZB0gIufLjQC+7q8/EhXulPDNFIyJyu2mkE9kA3PPi57RjEMaoW2+g2/v3dw
         bFXgGm3Io8pG4B0P8TfuIMO7sHR+GdIGZCXlonSyDiDz1uDovHlOPrC8xQD5XNlW/84f
         p9qzXeAoy6b1MOhj5eUBG9kog7S2pcohfGnW0E/eB43Cw4Id0UvxifbHHWygSV+zWFsm
         St+7f/kgNK6OQOAMY2qseU1iYbz8Z0rw3kvfi0rY468K1u4K1+alPo86ZBbUrP+O5cae
         ub5w==
X-Gm-Message-State: AOAM5326QBXIBISwBxx+JNY4J5b5WFzIy9quQVISKyzER7wnQ7/6y3C+
	1weznt074WDjcdDvGf7OJWlx++sFmZgKMw==
X-Google-Smtp-Source: 
 ABdhPJzyygpJlnzV/5GuIshEb+5hVrJS6XLqYdBiCxRxdvAQgsGtCPW8IAymM1/uZdB4nWmsT9/b/A==
X-Received: by 2002:a05:6000:1a45:: with SMTP id
 t5mr14655928wry.306.1639141316904;
        Fri, 10 Dec 2021 05:01:56 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 d2sm2899653wmb.31.2021.12.10.05.01.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:01:56 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] overlayfs: move templates to files directory
Date: Fri, 10 Dec 2021 14:01:45 +0100
Message-Id: 
 <ed4370b7541a2521840ec0047b0cbbdd388abd5f.1639141237.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639141237.git.uvv.mail@gmail.com>
References: <cover.1639141237.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 13:02:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159517

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/overlayfs.bbclass               | 52 ++++----------------
 meta/files/overlayfs-all-overlays.service.in | 12 +++++
 meta/files/overlayfs-create-dirs.service.in  | 14 ++++++
 meta/files/overlayfs-unit.mount.in           | 13 +++++
 4 files changed, 49 insertions(+), 42 deletions(-)
 create mode 100644 meta/files/overlayfs-all-overlays.service.in
 create mode 100644 meta/files/overlayfs-create-dirs.service.in
 create mode 100644 meta/files/overlayfs-unit.mount.in

diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overlayfs.bbclass
index f1b8086ea8..4a860f7308 100644
--- a/meta/classes/overlayfs.bbclass
+++ b/meta/classes/overlayfs.bbclass
@@ -37,51 +37,19 @@ REQUIRED_DISTRO_FEATURES += "systemd overlayfs"
 
 inherit systemd features_check
 
+OVERLAYFS_CREATE_DIRS_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-create-dirs.service.in"
+OVERLAYFS_MOUNT_UNIT_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-unit.mount.in"
+OVERLAYFS_ALL_OVERLAYS_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-all-overlays.service.in"
+
 python do_create_overlayfs_units() {
     from oe.overlayfs import mountUnitName
 
-    CreateDirsUnitTemplate = """[Unit]
-Description=Overlayfs directories setup
-Requires={DATA_MOUNT_UNIT}
-After={DATA_MOUNT_UNIT}
-DefaultDependencies=no
-
-[Service]
-Type=oneshot
-ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} && mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
-RemainAfterExit=true
-StandardOutput=journal
-
-[Install]
-WantedBy=multi-user.target
-"""
-    MountUnitTemplate = """[Unit]
-Description=Overlayfs mount unit
-Requires={CREATE_DIRS_SERVICE}
-After={CREATE_DIRS_SERVICE}
-
-[Mount]
-What=overlay
-Where={LOWERDIR}
-Type=overlay
-Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir={DATA_MOUNT_POINT}/workdir{LOWERDIR}
-
-[Install]
-WantedBy=multi-user.target
-"""
-    AllOverlaysTemplate = """[Unit]
-Description=Groups all overlays required by {PN} in one unit
-After={ALL_OVERLAYFS_UNITS}
-Requires={ALL_OVERLAYFS_UNITS}
-
-[Service]
-Type=oneshot
-ExecStart=/bin/true
-RemainAfterExit=true
-
-[Install]
-WantedBy=local-fs.target
-"""
+    with open(d.getVar("OVERLAYFS_CREATE_DIRS_TEMPLATE"), "r") as f:
+        CreateDirsUnitTemplate = f.read()
+    with open(d.getVar("OVERLAYFS_MOUNT_UNIT_TEMPLATE"), "r") as f:
+        MountUnitTemplate = f.read()
+    with open(d.getVar("OVERLAYFS_ALL_OVERLAYS_TEMPLATE"), "r") as f:
+        AllOverlaysTemplate = f.read()
 
     def prepareUnits(data, lower):
         from oe.overlayfs import helperUnitName
diff --git a/meta/files/overlayfs-all-overlays.service.in b/meta/files/overlayfs-all-overlays.service.in
new file mode 100644
index 0000000000..74ee4e90ae
--- /dev/null
+++ b/meta/files/overlayfs-all-overlays.service.in
@@ -0,0 +1,12 @@
+[Unit]
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
diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/overlayfs-create-dirs.service.in
new file mode 100644
index 0000000000..17204145f2
--- /dev/null
+++ b/meta/files/overlayfs-create-dirs.service.in
@@ -0,0 +1,14 @@
+[Unit]
+Description=Overlayfs directories setup
+Requires={DATA_MOUNT_UNIT}
+After={DATA_MOUNT_UNIT}
+DefaultDependencies=no
+
+[Service]
+Type=oneshot
+ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR} && mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
+RemainAfterExit=true
+StandardOutput=journal
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/files/overlayfs-unit.mount.in b/meta/files/overlayfs-unit.mount.in
new file mode 100644
index 0000000000..1d33b7e39c
--- /dev/null
+++ b/meta/files/overlayfs-unit.mount.in
@@ -0,0 +1,13 @@
+[Unit]
+Description=Overlayfs mount unit
+Requires={CREATE_DIRS_SERVICE}
+After={CREATE_DIRS_SERVICE}
+
+[Mount]
+What=overlay
+Where={LOWERDIR}
+Type=overlay
+Options=lowerdir={LOWERDIR},upperdir={DATA_MOUNT_POINT}/upper{LOWERDIR},workdir={DATA_MOUNT_POINT}/workdir{LOWERDIR}
+
+[Install]
+WantedBy=multi-user.target
-- 
2.28.0


