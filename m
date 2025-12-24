Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D91E77361
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 14:17:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.120768.1766585851669061051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 06:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PxavvaIh;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so3303316f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 06:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766585850; x=1767190650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymMP62CuLvBUz6vCcg7/j0SYp/wC4i8oNW/qqg6JAAw=;
        b=PxavvaIhLbfrJRuetbcjh/4ckVGD0leoLlc0p8poyulNyWkwK1r21uc0/8RaZrCXRF
         ipLogTOcQBj1sH1rYVhERhvHxJBte9Tz7bmuh9qBFovH2/xq/UHUzyPxaDKg8sagVSrJ
         ZA3z5qDmxiMH3v+/1yyxos7LuCL7pRma7egszebG8PIFhoir/h2rNPi8pobO/0B2cav8
         TkIA+RWIR+b53O+jaELb03z1VPS5qJUeIz1Jz2AvijaCeHJZn8AOTJYnSBALaPqDtDZs
         LDS8TDuQEs7oFcaBog1qMOJWRROQDKSylfb0fOmtXeHcxB58NjyZnPgAD+ZumAruHyzr
         Psuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766585850; x=1767190650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ymMP62CuLvBUz6vCcg7/j0SYp/wC4i8oNW/qqg6JAAw=;
        b=C+GUyAVK/5XlnczdMDCOctMAdllyraIN9GGNCmmeBfgkpTF+k8kSFykLRTE89xockX
         71t1qEVarMMULpWL/6zbZ8DV9gTufL2ar5YuXwGkTcfiKwKvc5dJaqlAoV9vaWJlo+1a
         okmIB1REibkLLBWVL9HdJH+GcZR5Gr7J/AwMGDar6M7/sJALpnOo8kGO0qd7QyDboLGr
         zkd5RlfdxrOri6T67ZFm8dLPuCDSZ6GPW62M9X6Kz8VpBtACGuiwggsOfVSqLptEiduK
         2e73W1tjV2A/+fIHNCRxDRxwK+RpMcg5+MmYLBXSPWV4qfw8PPEAE9VRocNHY4Li+7bN
         nxSg==
X-Gm-Message-State: AOJu0Yw5tXyZXOfzIopPtQew9dQtxf24YicE3a1p/OnEqUnuJBVX96lG
	87D2bujAqVJaJLOBLBIw7DU35rFsXNLhtv5Z3uHJKCtmqZEXmqIdCD9TeCa+Hj+s
X-Gm-Gg: AY/fxX6pckoHEYF/O9tqGqyNdXtBO96t4Txvm4KWwQmpKHocQESCHSFzzDhD8AaYu0U
	JMp6NG05w/DXptG3rSrloLndmZev+T7xE/rXjfZUN7E6khPJ/bLoTDrRkRe59GopgIUFLmWLkXi
	XwrfVtd9Qsd9lPasJLR28hpG5RdmG6o7hUIei8u341uo9desYAn/hV4zC/DEu1hoYSw+TnPww+z
	L35lfDVYq/cBFI94zPHCflGW0kzuZx9nU/3aLVxdgKfeJ3jzXxafYZRqhtu+IaqgkgmCGQhGAbx
	dV3Y91reKNqoyInPiu9hk6zkTe5H2NbdJHeQd+DKPpfwPGh4cT+KVMF9oQL8E2R29d1H9CbQPeK
	xlMKL4gw6PNaKWiwoR+ype+Bw4g8uRj1ijoOSJuH3R5aizfkdbyCDVdfHrhTd7FFCnGicYlTSKL
	mok86jEiv3yNH5
X-Google-Smtp-Source: AGHT+IFMsB7kk4rnS6ERQbiHTbGvZ9fWvkZu/siaKyC43S2BKGzwAtkI894hvU2Sl7uZGmi4lHSz/A==
X-Received: by 2002:a05:6000:428a:b0:429:ca7f:8d6f with SMTP id ffacd0b85a97d-4324e4172d5mr22180491f8f.15.1766585849520;
        Wed, 24 Dec 2025 06:17:29 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea2253csm34940079f8f.14.2025.12.24.06.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 06:17:28 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 3/4] overlayfs: Remove helper unit
Date: Wed, 24 Dec 2025 14:16:57 +0000
Message-ID: <20251224141659.2218381-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224141659.2218381-1-uvv.mail@gmail.com>
References: <20251224141659.2218381-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 14:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228539

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Since systemd v256 workdir and upperdir are automatically created if
they don't exist, so we don't need an additional helper unit anymore.

Ref: https://github.com/systemd/systemd/commit/6c75eff6afd90596d09a33a9275be292db4e3380

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes-recipe/overlayfs.bbclass           | 10 ----------
 meta/classes-recipe/rootfs-postcommands.bbclass | 13 +------------
 meta/files/overlayfs-create-dirs.service.in     | 13 -------------
 meta/files/overlayfs-create-dirs.sh             | 11 -----------
 meta/files/overlayfs-unit.mount.in              |  3 +--
 meta/lib/oe/overlayfs.py                        |  4 ----
 6 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 meta/files/overlayfs-create-dirs.service.in
 delete mode 100644 meta/files/overlayfs-create-dirs.sh

diff --git a/meta/classes-recipe/overlayfs.bbclass b/meta/classes-recipe/overlayfs.bbclass
index a82763ec10..07cc68ad7b 100644
--- a/meta/classes-recipe/overlayfs.bbclass
+++ b/meta/classes-recipe/overlayfs.bbclass
@@ -55,27 +55,21 @@ REQUIRED_DISTRO_FEATURES += "systemd overlayfs"
 
 inherit systemd features_check
 
-OVERLAYFS_CREATE_DIRS_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-create-dirs.service.in"
 OVERLAYFS_MOUNT_UNIT_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-unit.mount.in"
 OVERLAYFS_ALL_OVERLAYS_TEMPLATE ??= "${COREBASE}/meta/files/overlayfs-all-overlays.service.in"
 
 python do_create_overlayfs_units() {
     from oe.overlayfs import mountUnitName
 
-    with open(d.getVar("OVERLAYFS_CREATE_DIRS_TEMPLATE"), "r") as f:
-        CreateDirsUnitTemplate = f.read()
     with open(d.getVar("OVERLAYFS_MOUNT_UNIT_TEMPLATE"), "r") as f:
         MountUnitTemplate = f.read()
     with open(d.getVar("OVERLAYFS_ALL_OVERLAYS_TEMPLATE"), "r") as f:
         AllOverlaysTemplate = f.read()
 
     def prepareUnits(data, lower):
-        from oe.overlayfs import helperUnitName
-
         args = {
             'DATA_MOUNT_POINT': data,
             'DATA_MOUNT_UNIT': mountUnitName(data),
-            'CREATE_DIRS_SERVICE': helperUnitName(lower),
             'LOWERDIR': lower,
         }
 
@@ -83,10 +77,6 @@ python do_create_overlayfs_units() {
         with open(os.path.join(d.getVar('WORKDIR'), mountUnitName(lower)), 'w') as f:
             f.write(MountUnitTemplate.format(**args))
 
-        bb.debug(1, "Generate helper systemd unit %s" % helperUnitName(lower))
-        with open(os.path.join(d.getVar('WORKDIR'), helperUnitName(lower)), 'w') as f:
-            f.write(CreateDirsUnitTemplate.format(**args))
-
     def prepareGlobalUnit(dependentUnits):
         from oe.overlayfs import allOverlaysUnitName
         args = {
diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index 2a36840f29..f0c7ee658d 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -47,7 +47,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd"
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile'
 
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check overlayfs_postprocess", "", d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check", "", d)}'
 
 inherit image-artifact-names
 
@@ -570,14 +570,3 @@ python overlayfs_qa_check() {
     if not allUnitExist:
         bb.fatal('Not all mount paths and units are installed in the image')
 }
-
-python overlayfs_postprocess() {
-    import shutil
-
-    # install helper script
-    helperScriptName = "overlayfs-create-dirs.sh"
-    helperScriptSource = oe.path.join(d.getVar("COREBASE"), "meta/files", helperScriptName)
-    helperScriptDest = oe.path.join(d.getVar("IMAGE_ROOTFS"), "/usr/sbin/", helperScriptName)
-    shutil.copyfile(helperScriptSource, helperScriptDest)
-    os.chmod(helperScriptDest, 0o755)
-}
diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/overlayfs-create-dirs.service.in
deleted file mode 100644
index c8431548d7..0000000000
--- a/meta/files/overlayfs-create-dirs.service.in
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=Overlayfs directories setup {LOWERDIR}
-RequiresMountsFor={DATA_MOUNT_POINT}
-DefaultDependencies=no
-
-[Service]
-Type=oneshot
-ExecStart=/usr/sbin/overlayfs-create-dirs.sh {LOWERDIR} {DATA_MOUNT_POINT}
-RemainAfterExit=true
-StandardOutput=journal
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta/files/overlayfs-create-dirs.sh b/meta/files/overlayfs-create-dirs.sh
deleted file mode 100644
index 9954c34352..0000000000
--- a/meta/files/overlayfs-create-dirs.sh
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/sh
-# This script is intended to be used sorely by overlayfs-create-dirs.service
-# Usage: overlayfs-create-dirs.sh <LOWERDIR> <DATA_MOUNT_POINT>
-
-lowerdir=$1
-datamountpoint=$2
-mkdir -p ${datamountpoint}/upper${lowerdir}
-mkdir -p ${datamountpoint}/workdir${lowerdir}
-if [ -d "$lowerdir" ]; then
-    chown $(stat -c "%U:%G" ${lowerdir}) ${datamountpoint}/upper${lowerdir}
-fi
diff --git a/meta/files/overlayfs-unit.mount.in b/meta/files/overlayfs-unit.mount.in
index 9c117f2c52..eb78d2cb4f 100644
--- a/meta/files/overlayfs-unit.mount.in
+++ b/meta/files/overlayfs-unit.mount.in
@@ -1,7 +1,6 @@
 [Unit]
 Description=Overlayfs mount unit {LOWERDIR}
-Requires={CREATE_DIRS_SERVICE}
-After={CREATE_DIRS_SERVICE}
+RequiresMountsFor={DATA_MOUNT_POINT}
 
 [Mount]
 What=overlay
diff --git a/meta/lib/oe/overlayfs.py b/meta/lib/oe/overlayfs.py
index dbfed317c0..3805746d90 100644
--- a/meta/lib/oe/overlayfs.py
+++ b/meta/lib/oe/overlayfs.py
@@ -23,9 +23,6 @@ def allOverlaysUnitName(d):
 def mountUnitName(unit):
     return escapeSystemdUnitName(unit) + '.mount'
 
-def helperUnitName(unit):
-    return escapeSystemdUnitName(unit) + '-create-upper-dir.service'
-
 def unitFileList(d):
     fileList = []
     overlayMountPoints = d.getVarFlags("OVERLAYFS_MOUNT_POINT")
@@ -47,7 +44,6 @@ def unitFileList(d):
             continue
         for path in mountPointList.split():
             fileList.append(mountUnitName(path))
-            fileList.append(helperUnitName(path))
 
     fileList.append(allOverlaysUnitName(d))
 

