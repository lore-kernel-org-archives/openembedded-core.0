Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5890D1626C
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 13:45:46 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.55266.1728913541843547635
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 06:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Br7pde0p;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b11704601cso358376985a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 06:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728913541; x=1729518341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+508IiPvlH6UQ/wvuD6b6nRPxBJCDo1gisu+GIkFiHM=;
        b=Br7pde0pSt/emZcwrZBGTjpEMKy3QnyV56s2/i2NkB+mh56v6ihK3AoKSgPSDke3yT
         3aq5qFpIjlEPRFggztXv8yllsgx6Q25lR1BAZfisSwiiIee8jJ4NMmdTCKavm+3Hkt6C
         DrMbACCGp7P8W0qdZOuVCLfUjFZ4JHZHe/nNjfaLjVt6o+6H4HXCUbF/scO6y+wbLS5D
         P4d5dCwNKUjDdAQbkb1i1Q2hfmZd6TJzXf/Tc86Zlm48+gg97mqioDdFTFu3Rzdq/CL3
         L5JsSc+ArcjAyqArMWiFDJewvnFJqUD9WEmLWXeIAuYbOn7GWvavTdCLKNkqYelFJ59I
         vKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728913541; x=1729518341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+508IiPvlH6UQ/wvuD6b6nRPxBJCDo1gisu+GIkFiHM=;
        b=SHN/MfMfGktqrv9RKIgbORxPWaGmENLQG0B8jiSHoZOD01fizwMyS3Lvwc4rUsP7dd
         K4LeUvzWRVgpZnoXvrYDNzI3OxlYW5qHXvsROIV8PS+tcMLEXDx2d015ok1hOz9T4aho
         Dc91MMH0F3BJncKzSxRINKbXK30aklphOc3uiRH61WtSHZ8tFxeV0pu6h03+QFD6XnoJ
         G27DI2cJfykiZZBcsTt4tOxhBZ/xWp1BZE8Ga9xfeoWwhSBKWQBfk4+kf/bn6lAyb47U
         H79ekio94z5h5++oJ8WwDMwVcMPZCJKzQhz6/LoWbkNLBWJXE7fuiCiRRoNTB1DYBOQN
         55PQ==
X-Gm-Message-State: AOJu0YwOpnEujQusjao/2O4OOQIqdyWIorxl53/gkOfcrYaBdjc41VFC
	yNspDsgR/uWZR/CWv6ubYAi2KSPGCdAKg1+jJYy+PrI6igMfXwOk
X-Google-Smtp-Source: AGHT+IExMZrQwenhF6E+Ak241gGuYk2h+HbnofnhCE8FZoKdlr4V9uXWv83ZONDIO3B1vPpENYQJ9Q==
X-Received: by 2002:a05:620a:1922:b0:7a9:aeb3:4b22 with SMTP id af79cd13be357-7b120faa814mr1571316985a.6.1728913540822;
        Mon, 14 Oct 2024 06:45:40 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1148c71b0sm422617685a.3.2024.10.14.06.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:45:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto-dev: conditionally add coreutils to depends
Date: Mon, 14 Oct 2024 09:45:32 -0400
Message-Id: <88eada332f5d3d00baf9f2cedf63460d80356032.1728912923.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1728912923.git.bruce.ashfield@gmail.com>
References: <cover.1728912923.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 13:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205771

From: Bruce Ashfield <bruce.ashfield@gmail.com>

6.11+ uses truncate as part of the build. While truncate has been
added to HOSTTOOLS in oe-core master, it still is possible to
build a kernel recipe newer than 6.11+ on a release that doesn't
have the HOSTTOOLS tweak.

We can test for truncate and condtionally add the dependency.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 292897ce43..752d108bd8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -44,6 +44,10 @@ PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
 # we need the wrappers if validation isn't in the packageconfig
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
 
+# 6.11+ uses truncate in the build, so we need to either have it in host tools, or
+# build it ourselves
+DEPENDS += "${@bb.utils.contains('HOSTTOOLS', 'truncate', '', 'coreutils-native', d)}"
+
 COMPATIBLE_MACHINE = "^(qemuarmv5|qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64|qemuloongarch64)$"
 
 KERNEL_DEVICETREE:qemuarmv5 = "arm/versatile-pb.dtb"
-- 
2.39.2


