Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1D2C83F17
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 10:45:38 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.9762.1694083536983741549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 03:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=N177XCTn;
 spf=pass (domain: mvista.com, ip: 209.85.215.173, mailfrom: pdoshi@mvista.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-573e67cc6eeso616583a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 03:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1694083536; x=1694688336; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkmxuMlXYr3mm3i5lAWJ77rRUnRUw1PooUByxwyBopc=;
        b=N177XCTnShJT83tHf+kcrxqRXv8FqXzsJ3jTYmUvj9rBkaDKSodzU8RV5u17hnhxZq
         pGuG2MMVO4sffz7uqsABsUOY3nmrymBhTFj8Lgopk4PPY++qGCPwQXdvTRz7YNGt7ynL
         pPv/1KPM9vSAX6aVjRuchOu3cOXcA5u1PaVwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694083536; x=1694688336;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkmxuMlXYr3mm3i5lAWJ77rRUnRUw1PooUByxwyBopc=;
        b=UP3/UMOWVO1JaUiMjjev3OOf7uIz/bao3LZZFVLO/2rmbDvOXEaK1BKZRuVBLZWCVI
         z8lncPPKVFhZlQPMA03BQD41HZjnRv1MGqDnw4MKbe/zQcMA8nd8amGllEOiKKp48SMb
         zy+m5YXt/ZUpanVW08p+Yu0OAd2i8InI+70S8nBkOYKzQfv1Gt//0NfwibL2bdkMyDJ1
         vyWyccwqHrTLriaBg7flJ1VYJHZI2DutH787P5Hq4/I4CpFRZTJrJlU37lzljkU3HZvB
         B4nVLYaS1taTTXevCZHoQcPkQeO6Kk/4qRHCjOCF46dSWysEfQC+HWsiro0RshT97tpm
         ZqHQ==
X-Gm-Message-State: AOJu0YxArrpD6k71zDBCbjKNf1eehnbpN5BBYBGiVJpCKFUph+H8rnYj
	AnJWxkG+PZzCeznR26e8S0qbp9MokdwHkifZGMc=
X-Google-Smtp-Source: AGHT+IEa8yf03VhimfidlFVwc7sMMI+1FM7zXPRCGN9ATSehqKzaSMnc+0T219B+LQhyDwj5r+FNTg==
X-Received: by 2002:a05:6a21:7802:b0:13d:8876:4c97 with SMTP id be2-20020a056a21780200b0013d88764c97mr14033991pzc.16.1694083536205;
        Thu, 07 Sep 2023 03:45:36 -0700 (PDT)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id x22-20020a62fb16000000b0067ab572c72fsm12046879pfm.84.2023.09.07.03.45.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Sep 2023 03:45:35 -0700 (PDT)
From: pdoshi@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [OE-core][dunfell][PATCH] rootfs-post: remove traling blanks from tasks
Date: Thu,  7 Sep 2023 16:15:29 +0530
Message-Id: <1694083529-9544-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 10:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187372

From: Priyal Doshi <pdoshi@mvista.com>

remove the traling blanks before the ;-delimiter, so one could use
"_remove" to avoid running tasks like 'rootfs_update_timestamp',
which are currently hardcoded and not bound to any
configurable feature flag

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 meta/classes/rootfs-postcommands.bbclass | 6 +++---
 meta/classes/rootfsdebugfiles.bbclass    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index d9e2aea..943534c 100644
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
index e2ba4e3..85c7ec7 100644
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
2.7.4


