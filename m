Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.15616.1631124102396832875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=djQtO/At;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id i28so4588071wrb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j/nTrrT1fY8Cb6DJfEvGsxojS9mhEDXz+d1p/x9U6iU=;
        b=djQtO/AtHY9HfHc3+MlyQ3nohJo0BqJVm8HdYKdLnZ0CyAXegSZmuD+WvBGsdD34Vk
         fL9hSROmAoJNnMqdicA/dG5LNd3DIBIic5qjXnW5KMJjhj4OvmmL0nefYHCXP2FlIn1x
         8gZ7hBlbiz/G0bX9u+mOQBAI2LtygoPyJB7ZvFQMRHB2JeMvXLj8qALr+aIO1/GWU3vF
         GDr3dpyLksFNhVx1x7elMlOKOa1mhaeIT9F6bs97bHVS3lh9AfWqGxND7cRsFh2Lhvyl
         QS5CWjAlOSEtgMr/J+nKQNZdYiGhdA3gmdaNDfCNhc8MKFf59lmWFHatCDBZOmSTRbNk
         jnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/nTrrT1fY8Cb6DJfEvGsxojS9mhEDXz+d1p/x9U6iU=;
        b=XgY2ri0bg1KP/8+JDQmtb8to63SU0EVtC5b+y5ARfTVNj4RiWgQ5zWF7168riW6k/l
         R7chDHDHCrbqNd7FrlqDuY/HekOTYG64POSxq1iGidxh9MJVUSLANnujANEBhtn3zYGD
         iDUqlBCNH2Rf6IkrkSimuKdtFGqPfyw5sqDA6UG1obceBTCkQncigGXjsFKrmx1kX/cG
         ojYUzwwdyNtNtVcvP/niHzzmtNdR5FO6o5gSFB2PmbPaud2FiJ5jNyzmb5/0whxTu1py
         EY3AG7VSdKuVV1e28RNRDOJsEiQ4//hQ7HFFO+CUOqpNL2NBpQPEX2cFgP3i0hqhJ/EZ
         yRUA==
X-Gm-Message-State: AOAM530oTCCsK/yKbCQc2zIJ7ZJspr0NDLZ1LS2kdhAzvogQpN61xz6m
	aykZoEGm5mlmtqU4iE31/gY93KKL3I4=
X-Google-Smtp-Source: ABdhPJyGI4es3w3JG2G6q3ib8EIj4BgEU9m0YgzH5aAxVRxHc2Y+jXePf2gPGzszJ97AyIThgOu9bQ==
X-Received: by 2002:adf:d1b2:: with SMTP id w18mr5726687wrc.6.1631124100999;
        Wed, 08 Sep 2021 11:01:40 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/26] core-image-ptest-all: bump RAM requirement to 4G
Date: Wed,  8 Sep 2021 20:01:17 +0200
Message-Id: <20210908180125.103473-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

/tmp is half that, and lttng-ptest writes just under 1G there
(and just over 1G on aarch64), so let's have a safe margin.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/images/core-image-ptest-all.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/core-image-ptest-all.bb b/meta/recipes-core/images/core-image-ptest-all.bb
index c1d6aa28a9..1472451675 100644
--- a/meta/recipes-core/images/core-image-ptest-all.bb
+++ b/meta/recipes-core/images/core-image-ptest-all.bb
@@ -18,8 +18,8 @@ IMAGE_OVERHEAD_FACTOR = "1.0"
 IMAGE_ROOTFS_EXTRA_SPACE = "1124288"
 
 # ptests need more memory than standard to avoid the OOM killer
-# also lttng-tools needs /tmp that has at least 1G
-QB_MEM = "-m 2048"
+# also lttng-tools needs /tmp that has at least 2G
+QB_MEM = "-m 4096"
 
 # Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
 PTEST_EXPECT_FAILURE = "1"
-- 
2.31.1

