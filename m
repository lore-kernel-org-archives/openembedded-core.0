Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D60CA0EE4
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:53:49 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.25444.1694526826494492311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BI2EZmDn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c364fb8a4cso51270775ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694526825; x=1695131625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h57Cres/y/+fGp+REF5U4gM495ALPp56dwcAqT6Id1A=;
        b=BI2EZmDnrXXwyB31XO2sVluQ6cQ96gdMIoPkCtRADzKXVOH6VDT4K9yYFZvbUfH6zD
         3PT2K26H8qPVjio9GGVc99fPDxSK0G2b5el3IysuwgOXBPvm/0Ptk0b5OAE1Rqi0i1Ey
         VBX11U6OSjUMrsTtMp+SP39bD1c81OmRHAnLl6A6vtldqPWC25Y5TSmaurN/pHC3mALV
         9bBZACWUsQ2mqGCwUuACz0b2CHLPwdEiRW3Vfd5vtQhz+2hx5gaUTKAmhx/hicfGrJ1B
         oEhbgVCrO/9hYN/rMZin1ZjFGQb8i7cO2gNgJsJBR/aMaC3DX3XNIxkDA76tkqgqm41C
         gl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526825; x=1695131625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h57Cres/y/+fGp+REF5U4gM495ALPp56dwcAqT6Id1A=;
        b=kmwb2wM8hVxEwMO3H7sZr0NriHe9qB/0L5VXd2aLXCw5ZSqM5GW3JCuPlwO6x8Qskf
         rV+VUioO9lzb5CMHYvePh1eU0pyF/zl1dBxiledDo1nPNSX7d9P8Oh6LjbOpupfEd3tt
         /TRCYdX/lIdciusyBSzjn9A2H5lyuQfDAGwE8SQDgJDa0z30Rc5RkcQH6YjnLkxRK0te
         qx9yfbW+S/WTNFLHF6Z4PgPLtp4Warm22JrBo7BdyVQBklWtLQ2Qe9Rzx7nGokDqG+NN
         //kVjtNMExZLX3gIHMIRn7UCBZ1ImCvDCxIzArbckq7pd3ftzeUEnJXIw7jJ/cnRGLro
         3ZFQ==
X-Gm-Message-State: AOJu0YzZZOglAPHfFusDfk6j+mjhywSJY3BIYZCc2UeZCfwNlVM/crPA
	0xrUUto36P/ECG0p+Ag1Y/SkcE5fK44wqmlqLEE=
X-Google-Smtp-Source: AGHT+IGxZ94z0wMNebxvCiyJfkefaAGFtRaCD5VKROhentzbAgaRBHGerRhMLQOUd7r1CtY8AC+C/w==
X-Received: by 2002:a17:902:e5cc:b0:1c1:f6d1:3118 with SMTP id u12-20020a170902e5cc00b001c1f6d13118mr19582464plf.27.1694526825403;
        Tue, 12 Sep 2023 06:53:45 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j7-20020a170902da8700b001bdeedd8579sm7635246plx.252.2023.09.12.06.53.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:53:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/14] rootfs-post: remove traling blanks from tasks
Date: Tue, 12 Sep 2023 03:53:14 -1000
Message-Id: <18246f0bfedb5c729a0fc5b515f25a1ed0cde191.1694526588.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694526588.git.steve@sakoman.com>
References: <cover.1694526588.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187520

From: Priyal Doshi <pdoshi@mvista.com>

remove the traling blanks before the ;-delimiter, so one could use
"_remove" to avoid running tasks like 'rootfs_update_timestamp',
which are currently hardcoded and not bound to any
configurable feature flag

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/rootfs-postcommands.bbclass | 6 +++---
 meta/classes/rootfsdebugfiles.bbclass    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index d9e2aeab64..943534c57a 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -1,6 +1,6 @@
 
 # Zap the root password if debug-tweaks feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password; ",d)}'
 
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks or allow-empty-password is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
@@ -12,7 +12,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
 
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
-ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp; "
 
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
@@ -26,7 +26,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only
 APPEND_append = '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", " ro", "", d)}'
 
 # Generates test data file with data store variables expanded in json format
-ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
+ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data; "
 
 # Write manifest
 IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.manifest"
diff --git a/meta/classes/rootfsdebugfiles.bbclass b/meta/classes/rootfsdebugfiles.bbclass
index e2ba4e3647..85c7ec7434 100644
--- a/meta/classes/rootfsdebugfiles.bbclass
+++ b/meta/classes/rootfsdebugfiles.bbclass
@@ -28,7 +28,7 @@
 ROOTFS_DEBUG_FILES ?= ""
 ROOTFS_DEBUG_FILES[doc] = "Lists additional files or directories to be installed with 'cp -a' in the format 'source1 target1;source2 target2;...'"
 
-ROOTFS_POSTPROCESS_COMMAND += "rootfs_debug_files ;"
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_debug_files;"
 rootfs_debug_files () {
    #!/bin/sh -e
    echo "${ROOTFS_DEBUG_FILES}" | sed -e 's/;/\n/g' | while read source target mode; do
-- 
2.34.1


