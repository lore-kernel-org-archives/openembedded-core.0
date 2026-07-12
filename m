Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EB1C44507
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:40 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14789.1783866578787942624
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=S1pGM7LM;
 spf=pass (domain: underview.tech, ip: 209.85.128.173, mailfrom: vince@underview.tech)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81e97f3b3efso4803827b3.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866578; x=1784471378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q8kloaActtlBI0bLNFGHLyKNMjduJ0pKjq9IACdqr3g=;
        b=S1pGM7LM+e8g9PvCWiLcLtTRcDpzlU3dS67MWEQR8LQ1sogvrhPSBT4wsHy02r/HR0
         7n5Z/ZMJ+uSc2gl5UTc9KgIhOJuOntahxeutxKLSFK/rrXgOrcWYGeGOOWxD14/0NCbc
         CQT3Sd9exHmuIQyhL78LdwWcHp3vv6xAlgPVzHfr59Uga9YZgquovcAOljGTRxLrvyUP
         fS1cq5KJQghEWsm/DdJJ7PMQKpY5TpHccBRFj0ny2yKoF2U8Yo5ThUzPp1oUi34BEOgU
         V5AMj3prIabXE1XMcEhsE85K2iSZTlI2kYr4YqL19EVCsjFHHy8rq5OGT9csgDDZaUBx
         M9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866578; x=1784471378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q8kloaActtlBI0bLNFGHLyKNMjduJ0pKjq9IACdqr3g=;
        b=evmz/yFRKDNBBONdneLMuJxhlFJBhFk4LPPw6AUDlCRQBnOGtMlqIKfHYBbiWi3U3R
         Mj05inl3FxM/ui1D1QsScTIfd/g6raor0XkR2pJJcwRUiec6q6Jl8yK8jaehK86SuLcu
         HEwdWjb/UqsOl3kM9dzrRpWMRhAgX1F4kYoN6V0Q7r01nZIxHSP0c5ZFVzQWVBy92w4y
         st5CuiXlVGdYNcEwxEEujyX42P3LbTWvpX12jmxt+k/GlNccvG87c/p508MeSvfWOqi6
         nHZJTl+LrljriFms4IYs2JGO2LqxhrLVfKGxoHUPhU0xrC5UPs1/n9Qpa9tsIAHCYGW8
         QX8g==
X-Gm-Message-State: AOJu0Yzcr2j1ZsF8GMp6RJlGhcc6i1Wh8kqrfgem3N2+EZo6iQEASYmd
	KMSgVcF6GQ6vTew37JPttriulc+7MVgcTgHss6ZyJHde297C06rmRD0GfLH6n0kzZZscCAcUjmb
	q3WqtU9M=
X-Gm-Gg: AfdE7cmxgm+Zg2K8I6XQUoD15ouSvkWOVuWQ2N47rxGeDxsqygt0azJRjYAeJyAscB6
	C+t7XY0CzKwFjbdOC5JftDT6DcL5ocNMOP02I8T5G4YjH5iIPfY2WZXNPq04nppgQ930cNDvncp
	3Ud1sAEk4yruhbyLmME2TYlHvY40/iM67yD8SE8oZ3rNBY2HJJbx3nr9lwwJ+nfPcatJI6F1pjc
	P+EPloI0Kipc5PGG1K/NgFN5eq8hdHCHW3vU4Rtui/7QpmMaV6LwvgZnkZ8HI8taEPqVovclqAS
	EHimtBeMrPvNILp7kRm7uUvyFgpUrdSsr+Ct5F9ufQ8Cz+sMgUtD46oNyuxTTYiKeP8xmjN8qgn
	sUAZChn7BH1dVWNrMwD40vmbXsj3QQW3HPQmc7K5EiOVjz6mb598AgWoN0dY+VGqlTheTHvVQL/
	TqybohtduXAwM5j0FwMVH9xHRx
X-Received: by 2002:a05:690c:488a:b0:81e:68d6:22ab with SMTP id 00721157ae682-81e902c904amr45390817b3.68.1783866577874;
        Sun, 12 Jul 2026 07:29:37 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:37 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 15/24] util-linux: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:07 -0400
Message-ID: <20260712142916.2573370-15-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240781

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


