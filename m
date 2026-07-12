Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CCEC4450B
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 18:43:38 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.890.1783881811582939392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 11:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=VgkdLbz5;
 spf=pass (domain: underview.tech, ip: 74.125.224.52, mailfrom: vince@underview.tech)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664d22d7337so4708894d50.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783881811; x=1784486611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q8kloaActtlBI0bLNFGHLyKNMjduJ0pKjq9IACdqr3g=;
        b=VgkdLbz5Dg0BlskmtWLvqpi2L/nCEo5LvMipcbq168BMjEcVFZlq2lRAggmG52sh1l
         W4VABA3lJ0/so0S5hnF6s2zu8IXW3omcWwT3MuVtpXnOo9RRdo30wwoPoD2y5nP6YEEi
         m84ojc5GlukfKbtUdcgzTbWcMG1cjUf/Gle0LmFpjpu4mUTG8L0qHjV9bRBmT01i49mw
         VbBW7NqECe3pmlNYD2UQOQ56W+I3HfWeqasO8UKjC8vYvCQAQC+lDibztboLUbE7XBaF
         G3uAsR8hEC1+Jzjof0XkFmrIcKk2l/XKNNErswqx6OZ3u3nf5rtaCzGHXaF2lyMkHrn8
         xPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881811; x=1784486611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q8kloaActtlBI0bLNFGHLyKNMjduJ0pKjq9IACdqr3g=;
        b=E1G4as1PANCS6bWFeu6XqAmG+cgdw8LZMIvw8WVz6WUUG9XHUg/7Mj2zZHA8mUqRkd
         +yxC5i29C4YUo/lyJW8rI2QoGhmPluiQ5LCmF7jL2wN/+/k3TxEuMyZFt8E0Yi80CaCV
         X8darBYZb6vRZe+dk3REs/99GXaWY0EsL7hAwQCXY4145mc561LHffjkKttc/kzV7qP8
         ljZXSM9QjlBjFSqFCye4HDIcWQMMyD2R0d4PMP7ROQyS/4qBxbXCMMgf+MtNXAaJSEWd
         +JPPTyjpXyKU/YGPMnqAfn/SYT7GADdQafdUui8jPY9/xnP6057rIA11F/gPDoazPqzY
         dXXw==
X-Gm-Message-State: AOJu0YyQZZhob71TiW957lvptEdY1Xz4M5HnldIOfc4t/4O6vU8sPwhw
	Ojtw7SrUK9bcdNJuEW+hsRk6IWAmuskWVCgGbg+4fgA48oDXCgbV9t1wW+AEyjsvPk2GGlFTsLz
	6tL9NqE0=
X-Gm-Gg: AfdE7cmUqJ6kKjIU3krEKo30WOPgIcm8tF2CO6yzIinkpVmTj70wL/veoldjgBItf+Q
	MGfclsg3n9nSUtYb2cBhz7JQPa7bMgcLVB1oQ0Wy7wm0mYApKLvRM6pLRrDtjM5o+uPke/VkrWP
	MXF/VQ0H4FwzG0gFRhg38Q8/dKdxU2/PbtVg+ilQNYNUCVBzZbuuap/me+0HY4cYfVR1mXytmr3
	ldwTNFPQ89RNKV4Ju89ib+vCLYnL3JQDWMeJRQVcAWr0UR07zS4VlK4PDRDHWR/P9WQ8mZmT6Cn
	h5zSbezwZ8vAeNeI6S66yc+d3Y3N88/946rfH/IKHDVQqUOKrXH2OG/7OA/9fVT1ErLFsPF1xgs
	COnYsmp14QtP2E62ApvuR6WkCwv54iQt+PS0kE58BaCfhl/QSl8Zi/WJacDA41DaAr2bbV10YMQ
	XDdJ0LBhVInshQoA==
X-Received: by 2002:a53:ac8d:0:b0:664:c9f5:37ec with SMTP id 956f58d0204a3-667c5c169f5mr6996559d50.34.1783881810589;
        Sun, 12 Jul 2026 11:43:30 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787b23b35sm11768236d50.21.2026.07.12.11.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:30 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v4 15/27] util-linux: rename kernel prefix
Date: Sun, 12 Jul 2026 14:42:55 -0400
Message-ID: <20260712184307.3259642-15-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712184307.3259642-1-vince@underview.tech>
References: <20260712184307.3259642-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 18:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240805

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-core/util-linux/util-linux_2.42.2.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.42.2.bb b/meta/recipes-core/util-linux/util-linux_2.42.2.bb
index 4943d5c7ab..e0f248e3ba 100644
--- a/meta/recipes-core/util-linux/util-linux_2.42.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.42.2.bb
@@ -207,7 +207,12 @@ RPROVIDES:${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev"
 
 RDEPENDS:${PN}-bash-completion += "${PN}-lsblk ${PN}-findmnt"
 RDEPENDS:${PN}-ptest += "bash bc btrfs-tools coreutils e2fsprogs findutils grep iproute2 kmod procps sed socat xz diffutils"
-RRECOMMENDS:${PN}-ptest += "kernel-module-scsi-debug kernel-module-sd-mod kernel-module-loop kernel-module-algif-hash"
+RRECOMMENDS:${PN}-ptest += "\
+    ${KERNEL_PACKAGE_NAME}-module-scsi-debug \
+    ${KERNEL_PACKAGE_NAME}-module-sd-mod \
+    ${KERNEL_PACKAGE_NAME}-module-loop \
+    ${KERNEL_PACKAGE_NAME}-module-algif-hash \
+    "
 RDEPENDS:${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY:${PN}-swaponoff = "1"
 
-- 
2.43.0


