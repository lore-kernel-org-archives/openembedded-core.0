Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59809C4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:35:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.11521.1634657704804795274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FYdJ5RjK;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso3645069wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=csOzSeaAvmP9A6VLX5QyGU8WVjrhqogDlRadXv78org=;
        b=FYdJ5RjKgm8xMFFdfFfAslY4o2GRrIGQcg6eQj7rIuZmHwpAB1q1fj6WIMGm6bfPUy
         3B70tKbYuWPozS9DUKfCERUKRgmn87CNk6lnWMCTxB118IxEvVQ86dAxUDgxKZ7u+i/s
         BgWt0Xu1gswqRQiHn+Q8+LSoZ2jFxqkzca401vhGUFCSo6b7O/WjoYf1PMrenG74vFKB
         Y+RudDfT8TzqWo3i0K0ocPL7sNNn5Nh41fzCDZl40bJjNBR+Z2LSUVZoXp4MOm10Q4X2
         4kxPuPANy4NvIgZWBIEvbJIAKZichOHegQF0+IoqBmX0PDE+fBa9bbbg0GYjqdzhVH9O
         tCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=csOzSeaAvmP9A6VLX5QyGU8WVjrhqogDlRadXv78org=;
        b=UFWsLM1vMmChTxGJOj3BL5+q6eKSu4ujXPis1ldCFY/tH9EGzNt80AsCUubbqxUqzn
         O5SjCtqiegR/6elVcgFZFYm9kciBnHowFtASoqfP7VxU+28go1I7bAEKhyggyLgVPJ1L
         J3voeMgw+WyiTdrt3iohWZz0iGWm1NIcDy8xlwTDy1h8KiN8/pnlisGE33l8uKz1Ryky
         Md1V0XZzHKSBMwd3B+QOWSx2GmJWElneE2neCJvao+W+sJqmOJaFR+b/HL+3S7tVy5NC
         qpqnwvvqFD0Kx4cv4Mdo5sHboHR/EZ5NlR22P+IDuTARE7+hzZRQEZur0MBZ8voctidu
         r/cg==
X-Gm-Message-State: AOAM532y8HOZ9Hnjhm0HSFkotrJ/8ChnRazPQpX/ociUyzNCWkYBOu7H
	QseP3gxBy7up09AcdDE5VGv4zjGD1b4=
X-Google-Smtp-Source: 
 ABdhPJyPz3Zt89+GtX6X3eeJcEf7Q/iuc7gq9q/BYKkNIQSSqqQxPtuydNjNj3jW2sCJttwwXHOQIg==
X-Received: by 2002:adf:b355:: with SMTP id
 k21mr44807715wrd.380.1634657703469;
        Tue, 19 Oct 2021 08:35:03 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:35:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 55/65] libwpe: upgrade 1.10.1 -> 1.12.0
Date: Tue, 19 Oct 2021 17:34:09 +0200
Message-Id: <20211019153419.3319802-55-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:35:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157174

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/webkit/{libwpe_1.10.1.bb => libwpe_1.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{libwpe_1.10.1.bb => libwpe_1.12.0.bb} (88%)

diff --git a/meta/recipes-sato/webkit/libwpe_1.10.1.bb b/meta/recipes-sato/webkit/libwpe_1.12.0.bb
similarity index 88%
rename from meta/recipes-sato/webkit/libwpe_1.10.1.bb
rename to meta/recipes-sato/webkit/libwpe_1.12.0.bb
index 68214ffbad..ac4ee3eb23 100644
--- a/meta/recipes-sato/webkit/libwpe_1.10.1.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.12.0.bb
@@ -11,7 +11,7 @@ inherit cmake features_check pkgconfig
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a327b3ffcf2356dbe8148c1db4bbdc5359d7e7163d177f67551a8393b144adf0"
+SRC_URI[sha256sum] = "e8eeca228a6b4c36294cfb63f7d3ba9ada47a430904a5a973b3c99c96a44c18c"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.20.1


