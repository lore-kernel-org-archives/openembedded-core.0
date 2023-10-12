Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88462CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 14:52:12 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.13987.1697122327238611428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 07:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=eEa1wc/r;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7740aa4b545so68534385a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 07:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697122326; x=1697727126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TiTIeQQYYci7N07+mY65V76k326CzdNMb+yVvrJn7JE=;
        b=eEa1wc/rvh1acWMIcztnYP22Eg0VxrJ53vrJMWTANg9TSfh8Rugw+oa41AqBLjWgiw
         KO4lZ3uG8cymFPb+G8cXBu08A3R2B8EdvVUuTUQtNaEM0F6ix5nDKrsO0OHgFPpZdqA+
         8C9xU785Xcw+0RvAig2YfKjiVvZ3nX5BFLSrKoVkJ7MVdO6N0qPGDAdYpC2NQh+w8JpM
         QFWfkk0/iJURaVwOHQuDjClgh6QAaC6qExIgECQXYJ6oOijkGUKU9xRaXs/uk5w3AFG1
         LVzyOEW/dHQhZDJp9ZJx/g+S1uEgBgPMHhd2VGkKz6mYb4qEsNQT5luC+0IHkU6HaODW
         wWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697122326; x=1697727126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TiTIeQQYYci7N07+mY65V76k326CzdNMb+yVvrJn7JE=;
        b=VufKZb6q7U3SFgAQEBC42mp+PB5J5KwB16ptB8qz0I257pTT8QJpWUA2RsnYCAGo5e
         n8L3ZRQqGnITsHDbRXsJPNBYXGJb0gr3hIRrmNWevJj1zr5rZG2SJBn/j1pCDByfkfql
         J/ltct4/4KrWYhbcKjb1T248DE9B/efios2arDvrXSm0KodtiMC1DhFvuDvSjzmS9MzK
         htYFGWtIzGo24CaDCC1aqeiFWIiCydN/gA6j2ztKAdaxaxRMbDsItEokQ8BUFcbhGpQV
         U9l561rebRS9+8mxGRax0HkqAGYD7XYN0aBqlah6hACz5bkJrcOFRFmPAMZij37asttR
         x8Qw==
X-Gm-Message-State: AOJu0Yz70XjEShaB2REJsOMU+6ovzcvqJ1V88ZsHU20KCAp4GDlmYRx9
	px9vE39Ohp9s1aQ8I9ucD7erOHHL79SmbneNaQM=
X-Google-Smtp-Source: AGHT+IGY0jieJlMtSOKj6Uik0zgbZ9kPGYxrZPcgG2mP3D5bKMhdnF8JkUTmU1emyCSljSwjENcxoA==
X-Received: by 2002:a05:620a:2991:b0:775:dabd:a22e with SMTP id r17-20020a05620a299100b00775dabda22emr23185370qkp.32.1697122325752;
        Thu, 12 Oct 2023 07:52:05 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id pj40-20020a05620a1da800b007743360b3fasm6085665qkn.34.2023.10.12.07.52.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 07:52:05 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto: Update dtb path for qemuarmv5
Date: Thu, 12 Oct 2023 10:51:59 -0400
Message-Id: <20231012145159.1985751-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 14:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189003

In Linux kernel versions 6.5 and later, device tree files have been
moved under a vendor directory.  The qemuarmv5 one is now located in
"arm".  Add this to get it working again (which was already done for the
dev kernel in commit 42d5e8ef12934db65c35c1c5f0cabb5c21dbea43).

Once all kernels <v6.5 are removed, this line should probably be
relocated to the qemuarmv5 config file.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index f70d77e06abf..658fab4f36ba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -36,7 +36,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)$"
 
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
+KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
 
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index 716c922c1354..99c014d63173 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -30,4 +30,4 @@ COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
 # Functionality flags
 KERNEL_FEATURES = ""
 
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
+KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 64399e1e8dba..1972384f65ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -51,7 +51,7 @@ PV = "${LINUX_VERSION}+git"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "1"
 
-KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
+KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
 
 COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64|qemuriscv64|qemuriscv32|qemuloongarch64)$"
 
-- 
2.30.2


