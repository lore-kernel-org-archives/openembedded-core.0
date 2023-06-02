Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737F9C7EE29
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:34:58 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.13230.1685712897632323475
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:34:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=EUbs3DSe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f6da07feb2so20186705e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685712896; x=1688304896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxkAeJnKydq7+yPLQnDuLTGIVNtBIvXIWIsAarOGi90=;
        b=EUbs3DSemokOjfT2r8sFlI8R7F2K23osteZRKyZW+ixN6+UoqUb0puLBwuHdgJsZBX
         1CdVuSrOlTk8Rit/ch8Lee50tsVEvWMMR/DfOSauilivr19xlLCDOxrXYKIc5HvPL0mq
         aaaq064yI+88jm9Ck+Lw9xcuhvspikouf3nXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685712896; x=1688304896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxkAeJnKydq7+yPLQnDuLTGIVNtBIvXIWIsAarOGi90=;
        b=af1/mAyJwagdBEu+PYyhj3mDu72EKB0FPFIuP5eEmCW3VE+n0i3BP8cpHwIxDrP7Ba
         DjGhHPiBIRuItfrdjgOx0kT9qrUdlwBM/l0cBJtkYTTlKn3QL89iTYvBUTGMj7yRayTo
         yYsL26fXU+Hm4YjKQHHUQ0UXsLlX3+OskgPazQ7wcq4NL5QEK0fAX86IAZBwsY+/v/zf
         RK5TTLZRELND2Yt74tVr89o047m/JIc41c4IpRD6AU9rYa+ZaGBF2xyKFnOV/uImMjBu
         PnAlBJijHxzGk6g2F1Nqk2DcYUbpJxJe9LB/G8mXcVF33bF05Rq+0qauPh9vJTN8+y1f
         9EDg==
X-Gm-Message-State: AC+VfDxykHgTpY/78cVpSuaxRtdkpyPikKZ8c0It9jEi4u6qcyRvqY/g
	UAKEZOie6vzvWqG9+3Dylya0EmJY5MK/9MwJmvs=
X-Google-Smtp-Source: ACHHUZ7jRP/YIpYi8sMBuC1Ia0fKuGHs0iEZMy17MnV3GGi2Aig3kQCxx0Qub9IDoA98DPn7rXcpaQ==
X-Received: by 2002:a7b:ce88:0:b0:3f6:11e9:de8e with SMTP id q8-20020a7bce88000000b003f611e9de8emr2043223wmj.4.1685712895759;
        Fri, 02 Jun 2023 06:34:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id z10-20020a056000110a00b003063a92bbf5sm1734262wrw.70.2023.06.02.06.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:34:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH 02/11] classes/create-spdx-2.2: Respect PKG for providers
Date: Fri,  2 Jun 2023 14:34:44 +0100
Message-Id: <20230602133453.229023-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
References: <20230602133453.229023-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182320

From: Joshua Watt <JPEWhacker@gmail.com>

If a package renames itself using PKG, the new name should be respected
as a name that the recipe provides.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx-2.2.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 6ec0c1465e7..f12e155f6ba 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -688,6 +688,10 @@ def collect_package_providers(d):
             rprovides = set(n for n, _ in bb.utils.explode_dep_versions2(pkg_data.get("RPROVIDES", "")).items())
             rprovides.add(pkg)
 
+            if "PKG" in pkg_data:
+                pkg = pkg_data["PKG"]
+                rprovides.add(pkg)
+
             for r in rprovides:
                 providers[r] = (pkg, dep_hashfn)
 
-- 
2.39.2


