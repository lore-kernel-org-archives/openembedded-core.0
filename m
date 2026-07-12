Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27029C44509
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 14:29:41 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14787.1783866576983667144
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jul 2026 07:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=MaC2VkNQ;
 spf=pass (domain: underview.tech, ip: 209.85.128.177, mailfrom: vince@underview.tech)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7dbcb505578so23709217b3.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 07:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783866576; x=1784471376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52V2lB6SOTx+tXjml57+r7QEFF2uVbn0jE1cTUQdaAE=;
        b=MaC2VkNQ18WRLrCNvKdZi/9ZD6IXL5J74TyxciPaXUJp5Rte6XM5LQaN68WgBwXLKy
         gDPO82R88ErCFkXng0UFvQDQJFk0hvn4xrLVGboR/s+Im0k5cUjO9XaJPs/NULl2D0Bs
         cK4lFNjHVhyV5LPkoHV4/zbRgwBufdL/imcjhSKvxFdr/4Yvcb8Saos9XhbjMsH0qB6H
         Sb5uBrt17GMfIf/3buF78bDTPEJh4rnkuf0p6C0tZaAUw4rg38QbssYsiz6rIJ8OIC5I
         X2CCC1yh/OhpYua5fOuA9c8lVpTjr//8gSk9gtefEQgncFpn6TMVl6mKrMQcRJDb0+ou
         f++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866576; x=1784471376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52V2lB6SOTx+tXjml57+r7QEFF2uVbn0jE1cTUQdaAE=;
        b=jzCTLFxdNQ1kvMWs0rudp3fzuLO7241MxUD3dHE4Tm/2c8qc77smusUJmN2ot+kfi7
         z8/t1HrLLh90yUHSZ7fBQ37szIJYzdllYXpVbtJa3pqDYFpTa+lcS+EuWmB9Ju2iUgrb
         rqM+je6qPFjI6eTWnXgMime+NNsX6tcTn49aWYWjIRaLB/1Z1Jqh01or58CVFpqBITAk
         x/MJAn0tmW/LxkK3XIVO4gMAO3Rw+pRQKpH+IUvLvs6iKW6KPguej2CgvfmmEUidt0RI
         HLEtsYlgjKimrvgVSLI14jX61gMh4uxNP8+oXsPgYFIG++47zy+hkHoxvoDFanesFFR8
         TRRw==
X-Gm-Message-State: AOJu0YxqN87KFd8WPNmy0EwCA759w3sQFpl4Hb6cDj8MKVf94Fcw3Lmc
	hrq1TiLScCVXH4523Josc+Wh61JAcKZvqMbuBJINBQ18m82GnGtvvN17xZzgB+02p1fMmSiKyOJ
	RE6x0kgk=
X-Gm-Gg: AfdE7cm/2fLwSG2Rvvwfh8L0K8+RbUVjL+CEr0y/RARSXl1FlJXRSA6Xk5QyojF/spU
	icKa93CC//x5ivmG9FZKJn+Aa3rMV0HAPacVnx547JHclOjPG8bJ/gBnmKqX9zXMlElq33Ewyh0
	o5mhmyHMHd46ub69JfqbB0OHzq4LwQOYQowNkw708/M7u0urfg9Bj+FkpfE+QYOg6Dcsj23Zc7X
	Zo3sLHGGRBN/eZXiNPSG900+w5Wa43Xo6+1zU8GD69tKszmko4/UO7cm1SLEXiBiDUXQqzXBPfv
	PNgo7OmnNqUh47/Wn/avis0dJzAaROUBfVG6Q+yjaZg8CsMCiopckae4/DtAQpNeBUT34mLpUNw
	vT/EUktgG+h9NQNVJLLHHUaUAIixsW17rgfERvunbjMzskQ9ZfMD4XV2yUzDVn7ry1UYr6C7Dwk
	gFzkGy3T8qle2XUTFqV7HbX+3R
X-Received: by 2002:a05:690c:7404:b0:812:996f:176d with SMTP id 00721157ae682-81e90010866mr41582737b3.9.1783866576073;
        Sun, 12 Jul 2026 07:29:36 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm92857327b3.46.2026.07.12.07.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:35 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 13/24] mdadm: rename kernel prefix
Date: Sun, 12 Jul 2026 10:29:05 -0400
Message-ID: <20260712142916.2573370-13-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712142916.2573370-1-vince@underview.tech>
References: <20260712142916.2573370-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 14:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240779

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/mdadm/mdadm_4.6.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.6.bb b/meta/recipes-extended/mdadm/mdadm_4.6.bb
index b1d0a27c7f..41726bc37b 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.6.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.6.bb
@@ -85,12 +85,12 @@ RDEPENDS:${PN}-ptest += " \
 "
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
-    kernel-module-loop \
-    kernel-module-linear \
-    kernel-module-raid0 \
-    kernel-module-raid1 \
-    kernel-module-raid10 \
-    kernel-module-raid456 \
+    ${KERNEL_PACKAGE_NAME}-module-loop \
+    ${KERNEL_PACKAGE_NAME}-module-linear \
+    ${KERNEL_PACKAGE_NAME}-module-raid0 \
+    ${KERNEL_PACKAGE_NAME}-module-raid1 \
+    ${KERNEL_PACKAGE_NAME}-module-raid10 \
+    ${KERNEL_PACKAGE_NAME}-module-raid456 \
 "
 
 FILES:${PN} += "${systemd_unitdir}/*"
-- 
2.43.0


