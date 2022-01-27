Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D604DC433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:23 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.26423.1643278822821345692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gCZGhI4M;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id f17so3861365wrx.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p8v87IClhkvEuqeiHOt0rU8VCk7rR2qJk4uLwsEQBMw=;
        b=gCZGhI4MrAfW3EmfUqwiNZAbiWuEZYr49EXO/vPru+kaPJCLagffbVwFCyEM2QE90Q
         EXFA6u9liljp8oRfmx2SMAUXhNTDCmRBMj9/nCXRM0Ro1wDnmeJIjFySNKyFCvPKkHxU
         3GoCnrwLh3xaNbWjhaKR+s+WUNwNpRv7zG4Bh0OCdzQTF4hnEq+tFSqenXvQC7XmDKK/
         FLpR6yG7Ry/Zi9wXTgfZ6323pfKr2K1eTFb0Fg9WvcoMRMqTQ1Op1enIvKgc6nVCTCe9
         41363IbIHayu06O5o8u2feJZLjX/CQz/BeJ/ymfeDbABW05C5jBCg57VUEHoswPD75qi
         rgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p8v87IClhkvEuqeiHOt0rU8VCk7rR2qJk4uLwsEQBMw=;
        b=C7rkhbwzdIvkgnFjcdrP8ZQWLUFgQN+r0ZStbXAyo8974CdIrhBuQUzSNPHEB/P05l
         HC+abbw+5+5mfH+kf9L+e8jiFsxoWT+xcusPFKR6BOVyEcH2efrNaTPP8WBdcQ2PREX4
         Au4sagU0+Ua7/PjJFz1MJDJW8O619hjuvXxof9OyMNVt6QH/dwSOZZGAPqkAyL7+ctd/
         CUu8c3PT0+c+MSkPV4HCLEqz1PX4kNFLZC5EUSbbf26OykbqlQWgVAPv1Ax0vZn2g0IK
         uRr3QjoPq+YCWAS5DchchQ91D+s1IqnwoHCj5oYPKl/5hjKtAMxNDfE75kRUAJRwVZCR
         LsXA==
X-Gm-Message-State: AOAM532hl5JK+K76CtnvSSsQEfsxLcmLtdV+QPcehLEXFeYYI2fKw+lR
	+T/JhTEFvZoH8Ht5IPK0eTy6M43onAw=
X-Google-Smtp-Source: 
 ABdhPJyo2AGLXpaoyrhVfcHS1Gli94TJY2+aCc+jvJdfkZHX9ZBpT397bJvc3N+zAhSh4wMYp8e/Rw==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr2320012wri.526.1643278821384;
        Thu, 27 Jan 2022 02:20:21 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/17] webkitgtk: upgrade 2.34.3 -> 2.34.4
Date: Thu, 27 Jan 2022 11:19:53 +0100
Message-Id: <20220127102005.3050843-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161027

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../webkit/{webkitgtk_2.34.3.bb => webkitgtk_2.34.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.34.3.bb => webkitgtk_2.34.4.bb} (98%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.4.bb
similarity index 98%
rename from meta/recipes-sato/webkit/webkitgtk_2.34.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.34.4.bb
index 4b3d89ad82..cfae4eafef 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.4.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            "
 
-SRC_URI[sha256sum] = "0d2f37aa32e21a36e4dd5a5ce7ae5ce27435c29d6803b962b8c90cb0cc49c52d"
+SRC_URI[sha256sum] = "975f5019199ba7699191835cf75e01a18b94e3bcd0107da7389d4ddcb1aba406"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.20.1


