Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EFCC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:27 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.2257.1643826506140233282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pSvuxARZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id j2so244263ejk.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lu3yuf6TJ6CbXvSpMRIC9LG0nSTnKw37sSC9qDE7n94=;
        b=pSvuxARZj/XSovpVAbhrrMLkWQtcPi1w0KDMbwRDj4NYbbgLg7t6klKA7t3TBSYqA5
         L7QS/5PqrMtgBo4ceCTJpfejtvuiHTEhhgryTwDFvlu1IP2yjmzXAAqhZhsYkmtUynbA
         RUcBK3cmea6BTY+XvsF22M/cSSaB9kZ6qX0qGsOvVAA65sEQBwbvwBylMI4Pfw/GOJKJ
         as4g590P6JqgYYdTQ8PXnnBESguQ1c4HBPUxqDCCwhfazxQTPLmEDLKlCkgzPz6dRbfF
         bJFjZT5bwjPimTQ1D8mN/hOeC2gYx5dcvlP6ihhGbyv/LhOgcXv2gYkyKoU/JXLFdx9J
         syAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lu3yuf6TJ6CbXvSpMRIC9LG0nSTnKw37sSC9qDE7n94=;
        b=hCDSC0l5Bef1JKdYY3Wdn6g4hM+jej4XCKLVLs6Co/ke44ylX08pfOzuuQ59lajL7b
         qWvhvtDNkBJQbVfllLIbEVTXyVqI9PWJ1YhjIrtZi1lYHtQeXvFm3qnClAuMidP/AQ1n
         LqogQLcBlhkjaYUtmBU78r5u5xsErktmVmsUlA2/3wrgBG1avGQ9poIObuNTwkL3pMLm
         H9Yl8KDjK1j0+ZhSc2tzzt57wvtDNltHdLqqdWqsmVMMqjqIR+uAaWYXqE1+cL5qd2zc
         OHa5TNUCFt6KetKTKraJMYNelRwAJzE2BNtyQSCgMPiEKiSBWkCH9xN8X4pZLJnGNAcF
         Jw3g==
X-Gm-Message-State: AOAM5337nlbhab6sSeRTQGcJdjyqObW3vcbZ5NLo6ihLWqTO33N67kJy
	+fof/Nu+2JDylCF6MfxRSouZghNqC+M=
X-Google-Smtp-Source: 
 ABdhPJyrAAlWtWBQ5hAWnOhc6xP6K2eTsyoiQlCpldoxDCpzu4lNMrpuLfT2AityGkzP/2pfu43P2A==
X-Received: by 2002:a17:907:2849:: with SMTP id
 el9mr26400105ejc.201.1643826504719;
        Wed, 02 Feb 2022 10:28:24 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 25/33] mesa: upgrade 21.3.4 -> 21.3.5
Date: Wed,  2 Feb 2022 19:27:50 +0100
Message-Id: <20220202182758.919991-25-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161250

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../mesa/{mesa-gl_21.3.4.bb => mesa-gl_21.3.5.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.3.4.bb => mesa_21.3.5.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.3.4.bb => mesa-gl_21.3.5.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.3.4.bb => mesa_21.3.5.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.3.4.bb b/meta/recipes-graphics/mesa/mesa-gl_21.3.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.3.4.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.3.5.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 71cc3b4617..e8093f5665 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,7 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
            "
 
-SRC_URI[sha256sum] = "77104fd4a93bce69da3b0982f8ee88ba7c4fb98cfc491a669894339cdcd4a67d"
+SRC_URI[sha256sum] = "d93b2a9d2464ee856d7637a07dff6b7cd950f295ad58518bb959f76882cf4a4c"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.3.4.bb b/meta/recipes-graphics/mesa/mesa_21.3.5.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.3.4.bb
rename to meta/recipes-graphics/mesa/mesa_21.3.5.bb
-- 
2.20.1


