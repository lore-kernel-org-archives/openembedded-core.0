Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332EFC4450B
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:41 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14875.1783866576097687496
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=boVbgmj7;
 spf=pass (domain: underview.tech, ip: 209.85.128.181, mailfrom: vince@underview.tech)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81e8fa1b8d6so13571057b3.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866575; x=1784471375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtORirhu8WMo5JEeSHe9Cg+10FDL9Pk5F/e13RwIwqw=;
        b=boVbgmj7NTevZSNl5LXCbyy3tFlojS2YNNqqc5K7owM8eScHruPUTCUV+u9ZqKje4T
         mGZMnQG80vcnJiNRjfsOAegpvnNyafYwhWXpG7JfxDfXUgEgBqX37e8ynIhJ/U1fM+Zx
         VzY/wKs4IKmmVrLjdMkX5h//O7a4CgQhUXRIQAFgiK0esAtrbeIfYT6SxVTxE4W0MP7o
         m5yAj/FQxzfos8pvT4HxSLgQgu8aFZ4jmnIo1WkyFpa9+TuR6EUhEXiqdOtKp0hdrBJH
         d10PGkaulJBGIDPvTDYqUuIJNJkUONaNRGUciQUad3rjSFmNPUL5C29HtcfHrYkvSX2f
         J+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866575; x=1784471375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gtORirhu8WMo5JEeSHe9Cg+10FDL9Pk5F/e13RwIwqw=;
        b=esE7VowmdOOErEpPTSm2B4FuBC//QS81/m2Te+xg7rh3KULT4kZ7FpyD4Ea0sgV6WG
         d7fSf+pxkYihEburc9caWXPQ5SymWVZ1pvRd7NxgldrxP/y7yQ0VYFmJUzFN85j5Ah8X
         hcAG4OMUrRZ/jmQfG/jKuAvSZSmE84eShVzhRlfuwtn2/kAtAUgcCf0NgF81XIRfqke2
         ae0FaELYK96MzHbVFfNgc2bpusXmS7wFQs+rfIHQ6aG3/qgtzoJRfbw8AUfeNpjbPBDC
         N26vQmM/gGSM7vVfDNgImTS88TPnIokx80EJuyL6BAp/oeoqehpdCBxysjt+FWXJq4XF
         cZGA==
X-Gm-Message-State: AOJu0Yz/gCkIZZsrBTxT2HD5p2tzLwY8G1DPNPB8PUC6kmwuTChUuOCw
	6qvKwSr9LLcGNOuwNbAtorfvEK/mKmweuNDuYfP2//jMGQiI+0nT2eEBU1EbUNLoxgOVpU1I6Wf
	GGufv+Zc=
X-Gm-Gg: AfdE7ckH/1cLsSDWRZSZFMbHxba6erM3DkhevHvbBCd5y2g++oqIfKs1fbEFwGvw++n
	JV6hEhRJgga5jV7PjTXX/QT09z1GUlb74cdmiZOTFzXY7xE5Yitok2sM6nvo+dDf+Y0GaqRHdxL
	u/tTR4wSrJ9eAuNgrIQqNXDLCmlcBZkao+FHP7MclWFlwqFoNUtHmN8uT3Ja1SGVtmjqBqn1yI8
	gMmbVbhNGS+WAlh/uFT4mCT2YBnt1kCUg7aCuHd1Pn1abVrf1VX68NBvHOn5Oqd+/rzIJldhCIG
	SqMJFLKWCa3gqcnfi5ahQ2TyUMVjZY6clllcreqLiRxZeU5T7HI49H66ovq8nhPsBXwVoPokOjd
	GbXhiz1hJsdz38/pLNfJ4GDJVBGek+ROZlm9K5mBgk7d/IS8YBfa8kpOJzLrUmYi31E82ZxcG9n
	1ivZ3HdrASuZ6U7uhdKaTdNCM0
X-Received: by 2002:a05:690c:4985:b0:80a:9f1a:d48f with SMTP id 00721157ae682-81e90180794mr42536207b3.54.1783866575178;
        Sun, 12 Jul 2026 07:29:35 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:34 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 12/24] nfs-utils: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:04 -0400
Message-ID: <20260712142916.2573370-12-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240778

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
index 6f00bee0d8..76002d2d3c 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 # util-linux for libblkid
 DEPENDS = "libcap libevent util-linux sqlite3 libtirpc libxml2 libnl"
 RDEPENDS:${PN} = "netbase ${PN}-client"
-RRECOMMENDS:${PN} = "kernel-module-nfsd"
+RRECOMMENDS:${PN} = "${KERNEL_PACKAGE_NAME}-module-nfsd"
 
 inherit useradd
 
@@ -28,7 +28,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
 
 SRC_URI[sha256sum] = "302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a9082279d13b21a2c"
 
-# Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
+# Only ${KERNEL_PACKAGE_NAME}-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
 
 INITSCRIPT_PACKAGES = "${PN} ${PN}-client"
-- 
2.43.0


