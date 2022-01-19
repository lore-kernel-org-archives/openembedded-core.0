Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0195EC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.4636.1642588895497400986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ck+G6h5d;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id v123so4508298wme.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ETRvalpC8D0NikRa+/DyFH9y9nDqPdMU9UT+wKgo0w=;
        b=ck+G6h5d6AfVH7/4Kb4jzYblOXdnWoIvxdZGG59pSWpfcpIUBVWaN+60XK93bR+Nbx
         tayt50mLZ+3NvwJZenyUHlmz1On78frB/UyTUfYbug00CioEGuBdL5X5ZYi2ijO4U38s
         7fdfiVQp1/YNf69JJD1CEBD2USl4xHIv11l/jSQ9pjFutZJPpldQ7u+PiuiNp+QzFgl/
         xmmjYPlYqrZMKFGI8cNfuirk47tCUQ0UHP/6MxHyiPwzzRW/d/b64sM5ua7N0HDWiSGt
         mx5cC0W9Jscr2kCL1dxab0/wzHtKGvmvLU43SwQDsBnOu+JpQgH17MS/roouzYvA2gay
         QViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ETRvalpC8D0NikRa+/DyFH9y9nDqPdMU9UT+wKgo0w=;
        b=NxpyZJcLhKNs/v6yLud2Ie4NVIK5QWm42ZxOC5hJCr7kxjnpTxgWgP/wK3zxZ8g77l
         OTmKLQkzz6VDlFfUnas2Bou2LamISpUlCJKgMyoVcAJsWrSr7Y5cAZLOKifhdHVbX/xk
         FHa9pYPBNtMuW2skrb2IpdwRWCa7CY5Gw1xPNJE+Tf9Yd/r1x135Tmw/1bRp/kHEg8BW
         2MYsadJBNRYiLdyKAYML79LOv6EErdEqp0rLurRagvRsi7s3++Y8uZWaWsNkhQ8TavvL
         kF8vYUYRM96b7NiW+X/vgnSlbDeS51fF9hF8thQNpjk9yJQk/agFopWbGTPqJX76198l
         XcTQ==
X-Gm-Message-State: AOAM533pfnJEsN5HTmJO17eCyIacEMjTyh1d6MnLH8yABnmRto8HgFUw
	eehA0y3QDMJ3w+WibOWInYmb10IvFaM=
X-Google-Smtp-Source: 
 ABdhPJw6q4ZHtpImY0u9opYmIXyUTubSHOmyyuqO3dHOC5sFo/Cn++D1BZGdSidhYpUKBulgTa801Q==
X-Received: by 2002:a1c:4d09:: with SMTP id o9mr2889332wmh.22.1642588894153;
        Wed, 19 Jan 2022 02:41:34 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/39] sqlite: update 3.37.1 -> 3.37.2
Date: Wed, 19 Jan 2022 11:40:50 +0100
Message-Id: <20220119104117.2120127-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160703

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sqlite/{sqlite3_3.37.1.bb => sqlite3_3.37.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.37.1.bb => sqlite3_3.37.2.bb} (77%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.37.1.bb b/meta/recipes-support/sqlite/sqlite3_3.37.2.bb
similarity index 77%
rename from meta/recipes-support/sqlite/sqlite3_3.37.1.bb
rename to meta/recipes-support/sqlite/sqlite3_3.37.2.bb
index a13cca633a..56364b4828 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.37.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.37.2.bb
@@ -3,8 +3,8 @@ require sqlite3.inc
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
-SRC_URI = "http://www.sqlite.org/2021/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "40f22a13bf38bbcd4c7ac79bcfb42a72d5aa40930c1f3f822e30ccce295f0f2e"
+SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI[sha256sum] = "4089a8d9b467537b3f246f217b84cd76e00b1d1a971fe5aca1e30e230e46b2d8"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.20.1


