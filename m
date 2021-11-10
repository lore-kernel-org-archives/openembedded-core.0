Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE4DC433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 13:07:32 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.11421.1636549652284125338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H0brh4x6;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id 193so2341490qkh.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G3Hvb0dditLFmVF92qBg8phX7IdgtkRX4eZ3sxljwRA=;
        b=H0brh4x6PYbaWxSw09VOAu3Q0diWGbigGFbL27bP8DOEXKuKPvn2RiWg1ivqZdlbLb
         LZljCWe5IQslqFtzT7wRyDF6i5+oHBWPC8DDx4doT06JjerVWM5fHQSDsQXqFzBIswj2
         cN01SlVwamCDep8b9ZV0OdzZP2htVPN6cZS+YPBfN0uY5nTSJmVPTE5wD8NAutEsPA+c
         NiZLXeAsc5qRbubiW6rl7WNWcuDaC+QOmysrw5BGmlhzXOfdpCrH4WVZ3SseJMBfQ/Ou
         uOLhl1DRLFdJKjrGflCHwFY41yDH7737Y0dyyZnrRA0xYIUFYuXLwY+Ap8h9GbMKxu99
         +2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G3Hvb0dditLFmVF92qBg8phX7IdgtkRX4eZ3sxljwRA=;
        b=qjU1tajPnxTRhnQnb1h+eU17J/56GXUNAHpe4MU9BEnumQ35sOENU/MsKKsqV4oPte
         J0tJnj12IeWbsxueeJwwA48IYsjZ5RhahhhyN85kVQVW6oiw8jPQJqOJl2yAXVrjxmw0
         vpwiBlSCXUX/upLElRpGoBvlpCyDcs6wnE4AsJdJWSL5AzmW8fs+h1ZLGGWFvr+sw8t4
         L74++96Pm+wyI0hTbB25L4ktMBvAZqn9tfyxQ64glje2i7m1PSL/thXs8MABuIqe2h7p
         mHnIfe0Lzrd2BsirmC7VeT1Nd35SECxc0SIDB8SUVJP55IxJ/e5IY4ItwDPbRhUgfYAT
         GgVQ==
X-Gm-Message-State: AOAM533kHDUkbVg0pf6hJOFa0s0yg5vdJaR23u/kTer3IRYsEWdeF3hv
	owhJI1zZReSjmRWOZRzT9u0=
X-Google-Smtp-Source: 
 ABdhPJw97pe88Mbb7NHtMmlguaNb38dDuHx2oKlvYXuQYiFj7OSXxSZcgsxPQRL80n0aSRJHZu7q5A==
X-Received: by 2002:a37:9ed5:: with SMTP id
 h204mr12643306qke.35.1636549650426;
        Wed, 10 Nov 2021 05:07:30 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 v15sm13611000qkl.91.2021.11.10.05.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 05:07:29 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7][RFC] kernel: provide virtual/kernel for all kernels
Date: Wed, 10 Nov 2021 08:07:16 -0500
Message-Id: 
 <bebd3a8e2796524ff060a95aacf50c94ec3c004a.1636549444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1636549444.git.bruce.ashfield@gmail.com>
References: <cover.1636549444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 13:07:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158072

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Since we allow the kernel package name to be varied, we should
allow those packages to provide virtua/kernel, which allows them
to be used as primary kernels.

This change drops the use of regex, since any regex would enforce
naming (and limit what can be a provider) and add complexity./

There are currently no recipes that I found, that inherit kernel
that are not kernel recipes (kernel-base, etc, provide other
facilities), so making this provides simpler shouldn't cause
problems.

Multiple kernel providers can be dealt with in the same way as
any multiple provider.

[YOCTO: #13172]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

squash with provider

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7b3c6bee96..e0b752de19 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -5,7 +5,7 @@ COMPATIBLE_HOST = ".*-linux"
 KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
-PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
+PROVIDES += "virtual/kernel"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native bison-native"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
-- 
2.19.1


