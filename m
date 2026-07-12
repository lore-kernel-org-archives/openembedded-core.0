Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59768C4450C
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:41 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14874.1783866574119756188
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=cwLhk8b2;
 spf=pass (domain: underview.tech, ip: 209.85.128.179, mailfrom: vince@underview.tech)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-81e7826cbd2so25292037b3.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866573; x=1784471373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiF+AWUVrVrA1vH1XbwKZ5X4AZAwL5QfV2D6bEA/FjI=;
        b=cwLhk8b2/VEWO3KmEskkj5wV+MSNcw/Edk1gqN5CHOCWJDTqXhGBfgZCrsvPH1rxjT
         YLbyRVHOSAilF2KQG8YbMZjKkcTw86+iNwNU9vwLKcC5Q2G755vctITNwhMIVdjxpChO
         7YHy0TMMQW4Xue7A72ORmigTYRtMBi8W62LN6Um7CQCytDcnXMN1Fp2Si8ivsHxaawnd
         +K92n6FbSGqIP7skqf4AHe+e+eKH65Yztydr1FrLpGN7jt6KeHnRuM5A2Dz9VOsDrDjE
         1TTZLfo/etD+zglYam58a689SlPvSGiYwluDQ91CbdSUuSEGYQH/hxD5hpX9HnCLhtI7
         lUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866573; x=1784471373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiF+AWUVrVrA1vH1XbwKZ5X4AZAwL5QfV2D6bEA/FjI=;
        b=C1Pa9OeuGM7Sh8g1D/L77/UkUNWxHW7twQaQQLzagwYHWY0FYu88ERKPF7opVy/DgF
         HBBFdMUZTaDnufGNKQWivuR1CiNycFTtfWlYJ/F6ajMEsRv1RUXbsXLCHGqiFHSkAKUC
         aRzVrO+fwW4ufcg6Gcob1Zr+xycn3bMCBSJ1qiJpZVH5sXjeOej94MJjnxSEpHn8g+Zb
         xSUmhb9rQAmREZhzkN3PujlxYC5XJZoeq8VomA+CdIOXCOl0bDORurK+D3MpUc/X+4h2
         A0y7rAOu5VIfBsCrR5rVlA8YFQy82vV7drqWRJ80lfx8dPaFiP4Prr0e2AaxxwSuDJ2M
         OQUQ==
X-Gm-Message-State: AOJu0YzYvJ7cdrPGEtDvINAkMWEBU4HKfgBwbhI/KUM+qDczj0FaA6rI
	94UR5+3MtVAEk1iP1taGEjIlCNK6l6jeafoqEvApWlKktD5tJkdEHMOLyqxF8WHtlZvWj9Foe6k
	pRcFiKWo=
X-Gm-Gg: AfdE7cnglPUCQheiXxqCGMkDtDyMDPP5mrns0hSZRa1m8+KBI/pDPY6bo+r9+UK2Pt2
	bRPgp7Nty1wUNvXd4jMRagJEd/Gsx+RP5WbDUH16gUP+jYWHIrfoAZZc8flaTVM7q5j7O+2w8uI
	owH1yUCH+Pc83Qa4xu0mDvgL9xkWIPo8njBBYkxMFfl0ImKxf8r+FcQwm+PaeaVo2VYFd0bn8p/
	pQx5aPAlvtErBMljTvYduaEGd4OjMo7SbpzV53GimeXot6O5i6sI/eVL/GSSSvRD3xKvQnCGD6l
	nEwzNv5XhlmpcdmRN2ST83BUGro/NeUiB2f7QfU4WnRA1vdNID0XP1DOS4S0PxiRQ3bivnPiprb
	44OyG7dD3pFv0zA8vKRDs2/cBlAnd4v0gTOhOaLYvlnFOXBqIki+JV93/yt5SfGGKSO6SgK9wVx
	8/E+Rhi8oFYctoxg==
X-Received: by 2002:a05:690c:34c9:b0:80c:4923:cf4 with SMTP id 00721157ae682-81e8ffd6575mr39611297b3.10.1783866573016;
        Sun, 12 Jul 2026 07:29:33 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:32 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 10/24] iptables: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:02 -0400
Message-ID: <20260712142916.2573370-10-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240776

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../iptables/iptables_1.8.13.bb               | 22 +++++++++----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.13.bb b/meta/recipes-extended/iptables/iptables_1.8.13.bb
index 11b287ed3b..0fa5bf40b2 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.13.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.13.bb
@@ -92,18 +92,18 @@ python populate_packages:prepend() {
 RDEPENDS:${PN} = "${PN}-module-xt-standard"
 RRECOMMENDS:${PN} = " \
     ${PN}-modules \
-    kernel-module-x-tables \
-    kernel-module-ip-tables \
-    kernel-module-iptable-filter \
-    kernel-module-iptable-nat \
-    kernel-module-nf-defrag-ipv4 \
-    kernel-module-nf-conntrack \
-    kernel-module-nf-conntrack-ipv4 \
-    kernel-module-nf-nat \
-    kernel-module-ipt-masquerade \
+    ${KERNEL_PACKAGE_NAME}-module-x-tables \
+    ${KERNEL_PACKAGE_NAME}-module-ip-tables \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-filter \
+    ${KERNEL_PACKAGE_NAME}-module-iptable-nat \
+    ${KERNEL_PACKAGE_NAME}-module-nf-defrag-ipv4 \
+    ${KERNEL_PACKAGE_NAME}-module-nf-conntrack \
+    ${KERNEL_PACKAGE_NAME}-module-nf-conntrack-ipv4 \
+    ${KERNEL_PACKAGE_NAME}-module-nf-nat \
+    ${KERNEL_PACKAGE_NAME}-module-ipt-masquerade \
     ${@bb.utils.contains('PACKAGECONFIG', 'ipv6', '\
-        kernel-module-ip6table-filter \
-        kernel-module-ip6-tables \
+        ${KERNEL_PACKAGE_NAME}-module-ip6table-filter \
+        ${KERNEL_PACKAGE_NAME}-module-ip6-tables \
     ', '', d)} \
 "
 
-- 
2.43.0


