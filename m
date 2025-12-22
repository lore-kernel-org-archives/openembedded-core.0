Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27C8E6748D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 11:39:01 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78452.1766403539117388166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 03:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dKX5DS1W;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc305914so2951773f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 03:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766403537; x=1767008337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymMP62CuLvBUz6vCcg7/j0SYp/wC4i8oNW/qqg6JAAw=;
        b=dKX5DS1WrQ0+RNokYD5JOHq92B71JsM6erMunhOe4D6H6xRPArwtKCh+mNbMjIIYPy
         OZyAdbE8UOx3PzylSXB1C+hcF9a7ELYNthlYaGyVz/dDnixCBSGbjjXggp7P3LFxJCLW
         YyH9X1c37uSXZE0+ihQVlK5R6Ci4No5t1eGf4CnEFpBI3ei6GvIVQ0H6oovZAh9PsNRV
         OavcA0S62NGCzNTuIRxhEOjDlOcEdTtk/VvKsmxyyaz/V+P9XYpF5EkPGnJC0KUR/Zdf
         JHgsIXoSBngPi0Tl6iqY9qDU2qdLX02NCz8WTQayPAUQJfyY5g2t8PgMF2gjKSPEhazv
         H19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766403537; x=1767008337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ymMP62CuLvBUz6vCcg7/j0SYp/wC4i8oNW/qqg6JAAw=;
        b=K/O1EbqLpqVN7xjP8Ni1tt0TnRuXYhP2jv2+zh/S52WvefhqDgBj+WOy+KCJ7NXvoT
         i/wu194OO0Va1KSEFNvr6eE4VIFvcv3xSq9QSiIUESCfHOtEd9bqve37Phccoo6Zl80i
         lAX0vMUYkHZPg+YIE4JvOxYeCChY9ZrmZ689DoMbUf9HfafrR/VpYan9RHbWdFH8HgyJ
         7f0EnFfzQxMfz+NlXFP0r+6+6ROVMxBXBdHYzRyo5CPbo4w/iVtSSwD3mVgBP9B3i+om
         LesLohjOwb3biLvQC+1tTlyv55iOOK7oM13ai2ZB3/pCsOfUq0t3Verq+8J7aDMgxzZS
         aYcw==
X-Gm-Message-State: AOJu0YzCClCxhRad49y+cJVlAJfNdMMoT+hzK2sa0+CGkDod+/Mt86Kf
	diDxk/Jx1Uz4BpVKbKi0Efu7MsVClbwBlkGZt9EiDFkmCt9oAkusrYD4cUfVJeXNrI0=
X-Gm-Gg: AY/fxX6+4N53bLB71S3lSIJv04a5o5kST5VTXHiO5NHKi4lG6CX0kQFuczjSz1nbwzs
	jjJP4VFeyetTHOvpJSbMCBvkL37/+DKsVPiE0crzTNuy7nhh4pv6PvMYi28QuSJKd9lrz7SSENx
	zTPMZGRpocg3m/8JFgimk53RMNPSE8nZ1QbAbbcWgwNrXjTd6ToAx7V5gLDaggJeiiwxgxI6mzE
	d34CxUmr30dsbNHrdvptSNDH5n5wS99bfIdSOkjSXnMree6BkoxUcgjkvBAezNokAzjAtEY2rGN
	+AU1fHmx/oSJD58/4lQWZYymELMzCFm1ksKPvOFpAxHwQHI2aM7AcAnTMrhFq2m3oCs92+WVwjO
	yLlhetGD/knUQINxBD4OcGPRWUH2FUk/QVjYOduL6e3Deh9wLFEa13ShGl7CldJju+wvZWFPKr9
	fayqCvcXqkuy7c
X-Google-Smtp-Source: AGHT+IEjZJku39oQyA6bxdSKeJmM3/jg5XLZ7gY/Tp+2biQxUw/TTG7760PZgrodj+CxwsqOBRtapg==
X-Received: by 2002:a5d:5d0d:0:b0:431:3a5:d9b8 with SMTP id ffacd0b85a97d-4324e510810mr12072744f8f.52.1766403536808;
        Mon, 22 Dec 2025 03:38:56 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08efsm21720373f8f.29.2025.12.22.03.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 03:38:56 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH 3/4] overlayfs: Remove helper unit
Date: Mon, 22 Dec 2025 11:38:39 +0000
Message-ID: <20251222113840.2163929-3-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222113840.2163929-1-uvv.mail@gmail.com>
References: <20251222113840.2163929-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 11:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228299

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
 

