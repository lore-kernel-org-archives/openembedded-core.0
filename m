Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B47BCE9D56
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:24:11 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92283.1767713046017935992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 07:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kzi/J2hI;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88a3bba9fd4so9459166d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 07:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767713045; x=1768317845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMgnM9Xydp0mZndHtF6NL3C5xeFrB72XilSHN4P7yuk=;
        b=Kzi/J2hI0sqV8BuqdCsbF3AhwWVsDt35frHF18Z9QU8awE3ygNaMcpUaM7WfoUwFiP
         HPozj7l2GJF0NJTlDurVioXFjR0e1NI2y0giAWjIm7kcLgisVh6Rwv0oQVo8TzANS3Aa
         U4qp2IpGK9tQc+Srhr1Xx4B/sGZwv5paTYFVcTgerx/YllVFgIG4LinjaSF1/vWtP37I
         gHBTdJFtYbLTM8kT0N+XeMe5EAnf3qh0YJ6+v4tdS4ZKhhVqTv8jmmPo/kBmiQFDfShj
         SZWXyHtbkxBnC2fQ8MkYFCaaaXMr6j36i10SgzoYO3uzgYqVKzLsjd34Yj0auIadhqpQ
         Pk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713045; x=1768317845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uMgnM9Xydp0mZndHtF6NL3C5xeFrB72XilSHN4P7yuk=;
        b=WZcouuL+gq+nFaTGBxYaKdeCAV2DosaOXoTSygcluTT9UyeMVcBlrzA0YiKSkn6MXK
         MqUp5QFkpQWSSlugae4Krug9QmoJef9GLg7Ml8U8L7U8kSqKMaoEQBHJ83Qhme9pnwU3
         e/PSmYgBJ8Lc+fW/PdZvWwKaojgdLw+MVj6886m9Uv0ytM7x3D3e3TCeLDzQYpGgCGH6
         L5r6MYSJlKli+znOFGQ2uCnvCdA2jpX2pLBwg2i2bdrVpTX30d2ZgqElJiIEayBH6pvo
         jsy8EbcRB+/M4QV9azvtpjcasy0mSSN5aGnEPMnoXYOaWUMHqfO9mO4dHXLQ8zqgVP4t
         ZAsw==
X-Gm-Message-State: AOJu0YziOt8R7bK5nLy+7MuDxOJ7hswwltluwSjx9ZKgXLiVq8XR36HI
	VF8AQHM5CwDFlxRX905sUumnNCEbKMUo73mzCupXImq7tdz6zea9ErSXBPAPx1P9Bew=
X-Gm-Gg: AY/fxX5uBuLgGvjLe6by23sjS6Dp8wLrbCxhmnnNHWt6503KhNliWfXaFk8TELGBzgz
	mHS0wwtTrfmvVyfzxBjxrTk6/gUTC0qOilVcHszEd0BNHT2byDsTJl+0rbCKqP6Pidq3b3uwftV
	xkOA+1ul1sWe8E9Fgn9TtsQ0LqxjUStdpfpEBOpjINNBvtnTO0sya8XmfY6p0B9Wg9EKY0Jlqjr
	DvCZRU3ULMS417ymaI/2t1pJtfYnVMuZAzrde+4qRFBUUhdch4Mk71jhKQ3c4T4I9aZrNXTpIlW
	VgKp9saqyMuIN2cDYCouuT0e5Dmuq0amDp0EklJYG9d3rtieJ2trTubc4Hkl+bCBAuFXzCl5NTe
	5gSM60ZaOsKHYY/gJ/z4LVFZfO6mwPA/ekDo2oUEpg1Mium15zb9IkddC4LeyFF4xMBi2NykI3L
	Ok7bd5n0UephS9VbSaFoNggUI8ghyT+TCwhmOhbUmGv/TNiE/sMHJEyWV/E1cp7X6uLzdyT35ri
	W8v8D55D1YnJ3o=
X-Google-Smtp-Source: AGHT+IF60Ry7J+GtPIKqr7ljeaQWzbPTRHZHYh9TnhZj41a3U+8OAQ0nguffacuIs1gdZ364YNh7GQ==
X-Received: by 2002:a05:6214:e46:b0:882:44cc:f572 with SMTP id 6a1803df08f44-89075e41acemr43878036d6.20.1767713044923;
        Tue, 06 Jan 2026 07:24:04 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077267b9esm15587326d6.48.2026.01.06.07.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:24:04 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	haokexin@gmail.com
Subject: [meta][PATCH 07/07] linux-yocto/6.18: mtd: use refcount to prevent corruption
Date: Tue,  6 Jan 2026 10:23:52 -0500
Message-Id: <20260106152352.932717-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260106152352.932717-1-bruce.ashfield@gmail.com>
References: <20260106152352.932717-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228900

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.18:

1/1 [
    Author: Liwei Song
    Email: liwei.song@windriver.com
    Subject: Revert "mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition"
    Date: Wed, 24 Dec 2025 15:32:34 +0800

    This reverts commit 957b188b585a4f1f9f3a39198b06a6fd62d6827d.

    The issue that this patch is trying to resolve has been fixed by
    upstream commit 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
    so this local patch can be reverted, if not, it will cause an unbalanced
    refcnt issue when open/close mtd device.

    Signed-off-by: Liwei Song <liwei.song@windriver.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.18.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb  | 18 +++++++++---------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 52ecbb4731..e078abb2e7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3587d6639806e9f37471f7fd1842856f67aadb73"
+SRCREV_machine ?= "cae06a38afe2ab47233686af4b49affd31977a9e"
 SRCREV_meta ?= "83fff3acfc84814b4da0cdb2a63d608d376c3cdd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 4038fc2ebc..be8883a23c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "841ef97434365625fc8fc51fc50606de61f9f838"
+SRCREV_machine ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
 SRCREV_meta ?= "83fff3acfc84814b4da0cdb2a63d608d376c3cdd"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 89631e3332..1421587600 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "6d340e3238d68fe8e942f44f322178a9cdfa9798"
-SRCREV_machine:qemuarm64 ?= "841ef97434365625fc8fc51fc50606de61f9f838"
-SRCREV_machine:qemuloongarch64 ?= "841ef97434365625fc8fc51fc50606de61f9f838"
+SRCREV_machine:qemuarm ?= "8cc1dbeb4d9adb5358188cac4e3435edd2c45a58"
+SRCREV_machine:qemuarm64 ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
+SRCREV_machine:qemuloongarch64 ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "841ef97434365625fc8fc51fc50606de61f9f838"
-SRCREV_machine:qemuriscv64 ?= "841ef97434365625fc8fc51fc50606de61f9f838"
-SRCREV_machine:qemuriscv32 ?= "841ef97434365625fc8fc51fc50606de61f9f838"
-SRCREV_machine:qemux86 ?= "841ef97434365625fc8fc51fc50606de61f9f838"
-SRCREV_machine:qemux86-64 ?= "841ef97434365625fc8fc51fc50606de61f9f838"
+SRCREV_machine:qemuppc ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
+SRCREV_machine:qemuriscv64 ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
+SRCREV_machine:qemuriscv32 ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
+SRCREV_machine:qemux86 ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
+SRCREV_machine:qemux86-64 ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "841ef97434365625fc8fc51fc50606de61f9f838"
+SRCREV_machine ?= "f7430dca0cf7d678fdc441f1653b519588861e2e"
 SRCREV_meta ?= "83fff3acfc84814b4da0cdb2a63d608d376c3cdd"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
-- 
2.39.2


