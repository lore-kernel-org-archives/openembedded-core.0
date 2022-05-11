Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C12C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:54:02 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.841.1652295234322456575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NBrIqeH+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.215.178,
 mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pg1-f178.google.com with SMTP id a191so2576860pge.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mrk7vxlyhMFYE4X0yofa94MyKMXeGeY+JBdKZLDsyWA=;
        b=NBrIqeH+ER3eSLYt626kelouy3Vh1T3kRMEwLEGBk0zXW8SFKEVESxvu1FLBjzMIVA
         90HYUTliHDyqN52n1Aa/lrsnqAxP1nVyHLqiAT25syURSYAK3r+baiddmESN6CMYrYAi
         aySYysmpsJiFdhQnaVLO3jR0b9f/sxyLuUpJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mrk7vxlyhMFYE4X0yofa94MyKMXeGeY+JBdKZLDsyWA=;
        b=rvzFL0ANGFONAJfb8SUTyI0Edhuq7EPlCJqSp0sJH8ijxq4GXfvwysI31j5uRjpPzN
         nN5Acz1f7WvPWb8IEz3uwXg5ThD4hAo+lyrMedgXOhLso+98G0ZAIpjnkXK15ZWECDlL
         bR3g15U9h08tVu/HUbhTrryv0bao/sSWYZ5temhH+ith9xqtz9nSc+wacJKepqmuAG38
         RXiB/QKWtxlWNSfqD81VyRve7wi1QX2K1Uo+Y4P7Yw6kjEAOOmfz16/u9giyGy8QB/s4
         cYsIpC77wVoQFg36Jun3nEqjbkSdQ3B75J/7gUVucQCjHHpSZJ6asnB3NfAFG31n0gwm
         srnw==
X-Gm-Message-State: AOAM5327HwUB/A2aWcy8oJRbrZL00tBOvUjnaxsV94Z5lOaLoq7P5dys
	rvpuYb9NW3BqcSwqrszlxNp/DAdPoKOFZg==
X-Google-Smtp-Source: 
 ABdhPJz883FtMPpLDJIpRcgpjLcgquzqVAvxi4ZW8CVFa0Idnucp4ICSddDxxFDjXwFC0VZCo2Qy3A==
X-Received: by 2002:a05:6a00:1907:b0:4f7:945:14cf with SMTP id
 y7-20020a056a00190700b004f7094514cfmr26609706pfi.47.1652295233208;
        Wed, 11 May 2022 11:53:53 -0700 (PDT)
Received: from localhost.localdomain (97-115-89-234.ptld.qwest.net.
 [97.115.89.234])
        by smtp.gmail.com with ESMTPSA id
 201-20020a6216d2000000b004fa743ba3f9sm2140572pfw.2.2022.05.11.11.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:53:52 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH 1/2] scripts/autobuilder-worker-prereq-tests: update
 to use yocto 4.0
Date: Wed, 11 May 2022 11:52:52 -0700
Message-Id: <20220511185253.14604-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:54:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165521

Use files from the current release to avoid the depreciated -show-cursor
option.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 scripts/autobuilder-worker-prereq-tests | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuilder-worker-prereq-tests b/scripts/autobuilder-worker-prereq-tests
index 82e9a77bd5..3956349b30 100755
--- a/scripts/autobuilder-worker-prereq-tests
+++ b/scripts/autobuilder-worker-prereq-tests
@@ -54,13 +54,13 @@ fi
 mkdir -p tmp/deploy/images/qemux86-64
 pushd tmp/deploy/images/qemux86-64
 if [ ! -e core-image-minimal-qemux86-64.ext4 ]; then
-    wget http://downloads.yoctoproject.org/releases/yocto/yocto-2.5.1/machines/qemu/qemux86-64/core-image-minimal-qemux86-64.ext4
+    wget http://downloads.yoctoproject.org/releases/yocto/yocto-4.0/machines/qemu/qemux86-64/core-image-minimal-qemux86-64.ext4
 fi
 if [ ! -e core-image-minimal-qemux86-64.qemuboot.conf ]; then
-    wget http://downloads.yoctoproject.org/releases/yocto/yocto-2.5.1/machines/qemu/qemux86-64/core-image-minimal-qemux86-64.qemuboot.conf
+    wget http://downloads.yoctoproject.org/releases/yocto/yocto-4.0/machines/qemu/qemux86-64/core-image-minimal-qemux86-64.qemuboot.conf
 fi
 if [ ! -e bzImage-qemux86-64.bin ]; then
-    wget http://downloads.yoctoproject.org/releases/yocto/yocto-2.5.1/machines/qemu/qemux86-64/bzImage-qemux86-64.bin
+    wget http://downloads.yoctoproject.org/releases/yocto/yocto-4.0/machines/qemu/qemux86-64/bzImage-qemux86-64.bin
 fi
 popd
 bitbake qemu-helper-native
-- 
2.36.1


