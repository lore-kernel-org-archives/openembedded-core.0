Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CA7C7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 22:11:49 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.9666.1751407899835615186
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 15:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=Dm55oOZm;
 spf=pass (domain: limonsoftware.com, ip: 209.85.210.54, mailfrom: anibal@limonsoftware.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-735a8be4ea9so770915a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1751407899; x=1752012699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M/Ckhjml0OumRiz9V08QEX8aq0CGz5kTKAsYu8wWatg=;
        b=Dm55oOZmge0KvMyq2V0dYZTnokxQiEZlwl/LWs63VTNysGmtr7zUu949Eip6pwO109
         EqzqusEv93es+b5bjSZDiD9Ahy3ZYfU2zPZaX1uygiYw/oMBgrMSAo3GA8f/H9pudX/T
         eF9dAJsuDlQwpR1PwoZFvVpZV+PcC7nfhtIpL09GUOLfNMTIJMslybBBL1eRm620y4Cr
         ee/MnmYOI1kVm+Q7vcvb+Ijo9OKEBGpQtIDGSa4XUI73HYDV0QL5+bnVC42tQasmfXj0
         +RxtcER0TjXY6AJ+7wgJEC5/S7Q+pgeYnP7+i+IkD69GsnCglVsDZPWQ7/Lg9gMaCyWe
         4rvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751407899; x=1752012699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/Ckhjml0OumRiz9V08QEX8aq0CGz5kTKAsYu8wWatg=;
        b=MC+HT43nqeD4Z4YPfzAQn9ftn1bn3HhWo3e51kkkbJ9av3K2HIsgt7NPEgc5RgdnHq
         KPjOd0EUFihKUYqFvHwJEU1UMIr2rgua45Gj/lNDz6hyDWM6SsuQIOumP3yDccHS86q2
         cGuzF279Cn8GagWRcMXIzwxth5D9Ugs1nWtfa3BfqE1EIgLrO286s48ssm5WEB1Du/rT
         ZPz370qUE47aMqspopbSufud/er3K+1gkivJWZSkbYugmG69gqjijP810Mp32P+Yu4HJ
         zW/eIUpC1n9SiKs2GtlXn5VDKon7LrjctzAxDaoQs019IeYcQ7ACbHRIDEDJKtB6WxnI
         4ceQ==
X-Gm-Message-State: AOJu0Yzwuw8xpjhQIPK1OVPM94xXU7kbLim2aII8jNQaElov0RVkYHHh
	PMDcq3Lgr0A6QikyDnigiEU8afzuhxdTjd7yJ0QVE8cwNRiMMowioMnhrKPlskQik78EVtyrb0B
	JFDrA7DciBA==
X-Gm-Gg: ASbGncvRce2z0CkkwLEauhbL24oL+6xcc9xz8JDb+mStk5D1ETJh4oCcYo7tnTdPrtZ
	4lafPtKzWg1jRrMEqTCJv04gyepKzmyC03CYf3YcYT0U5/9jwVjrpn/hTdJvQeuheEsAg5sfud7
	L4CDO7bxKWBRTQdktUVr85DUqxt6LSsybE9h30aZ6g1qMnEfhACXZw3yR2qme9YQ+OcGJBum99U
	bKGf+PXyMCyIGvAdBHLlAWeWs/gLmWoTOCvpf44p7YkM0k6BuHfJhXfKAgkrL98uGjwta8fAdPO
	Jz2Q306/YevbeQTthhVbg8t5b5WWJYndm3jZBDvAcnZOJFHX/qP6lpNtS2ybnLxy66Y9F9yHIlH
	o
X-Google-Smtp-Source: AGHT+IEfYRw6hGp0P+WPio9ItuPOF0SsU67eTOHtbnbeJ2KIUfhvH+i2kvbKeGdIyesFgVo5ECFRBg==
X-Received: by 2002:a05:6830:6489:b0:72b:8c4b:8ef2 with SMTP id 46e09a7af769-73b4cd3db9dmr490417a34.24.1751407898688;
        Tue, 01 Jul 2025 15:11:38 -0700 (PDT)
Received: from ls.ts.net ([189.172.102.32])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afaec27aasm2275689a34.0.2025.07.01.15.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:11:38 -0700 (PDT)
From: Anibal Limon <anibal@limonsoftware.com>
To: openembedded-core@lists.openembedded.org
Cc: alhe@linux.microsoft.com,
	johannes.schneider@leica-geosystems.com,
	Anibal Limon <anibal@limonsoftware.com>
Subject: [PATCH] recipes-core: initrdscripts overlayroot allow boot partition
Date: Tue,  1 Jul 2025 22:11:35 +0000
Message-Id: <20250701221135.966025-1-anibal@limonsoftware.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 22:11:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219735

Test if /boot is previously mounted on the OLDROOT and move it
into NEWROOT (ro).

Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
---
 .../initrdscripts/initramfs-framework/overlayroot        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
index 0d41432878..db164d9846 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
@@ -38,10 +38,10 @@
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 
 # We get OLDROOT from the rootfs module
-OLDROOT="/rootfs"
+OLDROOT="${ROOTFS_DIR}"
 
-NEWROOT="${RWMOUNT}/root"
 RWMOUNT="/overlay"
+NEWROOT="${RWMOUNT}/root"
 ROMOUNT="${RWMOUNT}/rofs"
 UPPER_DIR="${RWMOUNT}/upper"
 WORK_DIR="${RWMOUNT}/work"
@@ -115,4 +115,9 @@ mount -n --move /proc ${NEWROOT}/proc
 mount -n --move /sys ${NEWROOT}/sys
 mount -n --move /dev ${NEWROOT}/dev
 
+# Mount/move boot if is already mounted
+if mountpoint -q ${OLDROOT}/boot; then
+    mount -n --move ${OLDROOT}/boot ${NEWROOT}/boot
+fi
+
 exec chroot ${NEWROOT}/ ${bootparam_init:-/sbin/init} || exit_gracefully "Couldn't chroot into overlay"
-- 
2.39.5


