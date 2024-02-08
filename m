Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E97CC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 06:42:54 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.12566.1707374568115564876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 22:42:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aD+9G+1R;
 spf=pass (domain: mvista.com, ip: 209.85.210.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6daf694b439so1248484b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 22:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1707374566; x=1707979366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sD3k9CJ4llWhAF6rEINWwOFwfF/1OuS3FQtN9MQgY9E=;
        b=aD+9G+1RWll28sSZJP8ShdkrTe91Qp6jiczAfVxQ14Jx0/tquLk5SL42uZznsNDBvU
         q1m9YQeHbDMdgYz0rsyB3VDNBO4FV9NRps9QMQZHp42ex8N3UCl1fbpqZ/LxpxdxTkxc
         We0oc3GRiUjoKgVnfkjyxNsD/NmqChSNmDEj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707374566; x=1707979366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sD3k9CJ4llWhAF6rEINWwOFwfF/1OuS3FQtN9MQgY9E=;
        b=Hc+3GJdHhhCigObcNEeiZxzOaVMXk7YgNQZdbp96LC89YfPEjmXhjGoMgoVsIF4Yqs
         DFo7yAeGP8+WueimeROo/1REmLLnUHPkHeHZ4vz8jHeUrt3S1Wqn/MwsVKkdxH9MxD60
         OblULJjazl7kARj9alh3DPKRVI1U785JYBw48WykMRw8OAHFFL+tvLKl1ExSqyUbsKIj
         2FRQEWX9eE7CX1kjqxoLDZON31A9wXTt3xKOlLuPtzQvIDx4mX0vvEJxsjkrpjGuqygr
         J4gLKbRhnLpFdXD/QKByo/vc2V4IaAWRzYrzqLjUd6/Yxq93MZkNzJBEUa0PETRc0g5Y
         VEQg==
X-Gm-Message-State: AOJu0YxpCF5/FciJTzE+bwAnIR1TIuuginD0vZlyNDNybeZoLINXX/vf
	AdY5uxjf1edDcj3ccDUWXUjMA+R3xHWWY5yB0R0KzGXl94E2gs6900qNRXdXKw/sGBgbykCsoXq
	P
X-Google-Smtp-Source: AGHT+IGqSS/M+9pbIAOhbdHA0GDU8zL40l/xz0kVg2ypKkRQPr1vO6kDrANOek2vrv7V5xBr5nMB5w==
X-Received: by 2002:a05:6a00:80e9:b0:6e0:4de8:4896 with SMTP id ei41-20020a056a0080e900b006e04de84896mr4754311pfb.8.1707374566639;
        Wed, 07 Feb 2024 22:42:46 -0800 (PST)
Received: from MVIN00020.mvista.com ([122.174.157.245])
        by smtp.gmail.com with ESMTPSA id c1-20020a656181000000b005dc3407850dsm2462956pgv.87.2024.02.07.22.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 22:42:46 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] ghostscript: ignore CVE-2020-36773
Date: Thu,  8 Feb 2024 12:10:30 +0530
Message-Id: <20240208064030.118190-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 06:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195101

From: Vijay Anusuri <vanusuri@mvista.com>

Artifex Ghostscript before 9.53.0 has an out-of-bounds write and use-after-free in devices/vector/gdevtxtw.c (for txtwrite) because a single character code in a PDF document can map to more than one Unicode code point (e.g., for a ligature).

Reference: https://ubuntu.com/security/CVE-2020-36773

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index e0d1e4618f..cc06d092c1 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -26,6 +26,10 @@ CVE_CHECK_IGNORE += "CVE-2013-6629"
 # Issue in the GhostPCL. GhostPCL not part of this GhostScript recipe.
 CVE_CHECK_IGNORE += "CVE-2023-38560"
 
+# This CVE affects Ghostscript before 9.53.0
+# https://ubuntu.com/security/CVE-2020-36773
+CVE_CHECK_IGNORE += "CVE-2020-36773"
+
 def gs_verdir(v):
     return "".join(v.split("."))
 
-- 
2.25.1


