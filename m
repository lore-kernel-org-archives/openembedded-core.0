Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF62CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 05:08:27 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.10012.1757480906749564978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 22:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DNjQlA3K;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-70ba7aa131fso71868176d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 22:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757480905; x=1758085705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30iXHjM3rWcc7UViik1Zs/BJTTvM9yzgkS+AEKnB5ss=;
        b=DNjQlA3KiFELeqOFAxf7yRW5z9dKDwNko8ETzsgcTIVR+dpt6m6JCV1hRyswPRl2K5
         ablyATGkxEsCFRWSqH5saxHEK2/xpVex3gARXrfKskW9YrkC/zmlheq3kgNwxEpk5DzG
         H9F443MhnHhZi/8jZm59dL2WKVMjhM0U8yxfYVzC5JYzn2BU8hGzwNgXSFsXxzQ72aDg
         uYO/DNJJCmQJlF60TfEDXzmAgLbcYcmbLnpfIbSxgSYLxuduOzjJw3XOtfRR24DLLGh1
         c3BR1c41O9MXEcU939m1UCoIFKHBlMU6D9/6uyD2WbytQw3Az+/4ANy++9xWQEvg8pIL
         pC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757480905; x=1758085705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30iXHjM3rWcc7UViik1Zs/BJTTvM9yzgkS+AEKnB5ss=;
        b=JN3m7pHK17lK4yz/wqR2XaIokvHjqyWvk2ZqZgJVJbQwNaU5pE5kksXntdpdS/4rm0
         MDGEyuxjm/35LRikMF5A/UDyrZZtwEHopoKXk4mxK3w6XDqL3V7h+vHbqhZnEYopgh8x
         T5lzGKiwkTiI0YTpf7D+aD1/7jWysYW/Yb/ue2gKB8ZqCm2AWyA+q6QuXVo/kgwqZmRL
         j5tMBhc0A2dFXTSF63cuaf2KgCiiqrOJX/wMly0SXAclQCotAsKbxqta1D4elNEWHafu
         EX+vO3RYbsMgTpsZ2gIWaWHajUV91jD3k4qXLls3m5yAVDjXVZTZQC0KwLNdPRUC0hOq
         EvAA==
X-Gm-Message-State: AOJu0Yz/550i4PNrnzet1PrnYj58P2Po+yjVxIF0iiuxB1Y0t26Gxn2/
	IQrW2ZUD4AUAi8dQZ77iVcDRWi/pEhwVz4LLR6k3O3kMatTSkMJsl00I
X-Gm-Gg: ASbGncudS8C/bSLW2Rwp+kU0B2HMlna7edJ0A1P9gsYPQwHgJndxnQfq9OpMUSuayBr
	zIbiifGg8x+cxeECEN0aZJw6h2HsYS1vsRDUios6W2Snt21f5mkI2CcZnGT+bRmmaqz6YNnmZHf
	L+p4h02JdfL8THj4Tm5reS0wxF7b5VPTW8oVKgHoQhCYo2A2sjzBuxXSJNzaFxnkZlqroiZmV7s
	ulWnriHbqmqbiQRyha9sTHBjb28qYqHs3/wnud2DBouTK02VcR268ikMKzNZkkipTv0XBSbgxmY
	C6OpZ8fG+Hm+eNRyUznyG/bqrC7B+vsdYiNBIBzYAUdULE+aYbamAKYTfrG5/1RcaQet94Dj1s+
	0X7nSU7F6EvwEs/RPyHHjUntwz8tzIp0Vi0SkhJRbX0A4z1T8sMbUeNAbPxojZPXzJPo4eDrOAm
	8OrGQYg33fBZxUKRZStQEt+jzTnHC7MVj0X4p+W7RyaXq3Uxe4YDtKQ5OrR67OxPkGFQ==
X-Google-Smtp-Source: AGHT+IFffVlgz/9i7HbQj4PdMXM/fp8ZsHBrl2F4b3fgPx98B/syNPZfgtEuMH6awyyEj7gtTvMv8A==
X-Received: by 2002:a05:622a:24f:b0:4b3:10f0:15ba with SMTP id d75a77b69052e-4b5f84472e5mr167810691cf.39.1757480905464;
        Tue, 09 Sep 2025 22:08:25 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5ed72c49sm227866685a.51.2025.09.09.22.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 22:08:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com,
	mikko.rapeli@linaro.org
Subject: [PATCH 1/4] linux-yocto/6.16: cfg: DRM tweaks for guests
Date: Wed, 10 Sep 2025 01:08:19 -0400
Message-Id: <20250910050822.3273330-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
References: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 05:08:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223143

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This also fixes the build of vboxguest drivers against the
reference kernel.

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: cfg/drm: add CONFIG_DRM_TTM and CONFIG_DRM_VMWGFX
    Date: Tue, 9 Sep 2025 14:14:18 -0400

    drm-bochs is used as a baseline featur efor DRM that guests
    may need.

    We add these two options to get symbols into the kernel required
    to build guest support kernel modules.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index cf8f86504d..76654ff516 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "c631c6cf05de829937afe048e6ae2fea15634cc8"
-SRCREV_meta ?= "c8f3f45cdd56085242916804754ccad79d2573c9"
+SRCREV_meta ?= "29767181a0c0a97c8ba4941f6834044d9ffaed86"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index 1e5ed856b1..c2953c5619 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_meta ?= "c8f3f45cdd56085242916804754ccad79d2573c9"
+SRCREV_meta ?= "29767181a0c0a97c8ba4941f6834044d9ffaed86"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index f37c1a62c0..7bafd22ef4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
 SRCREV_machine:qemux86-64 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
 SRCREV_machine:qemumips64 ?= "2459c29bf2c3d221fd6d3222c7200b368156986e"
 SRCREV_machine ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_meta ?= "c8f3f45cdd56085242916804754ccad79d2573c9"
+SRCREV_meta ?= "29767181a0c0a97c8ba4941f6834044d9ffaed86"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


