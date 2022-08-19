Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8739C32793
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.465.1660894084213324710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TAxIzyl0;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 z14-20020a7bc7ce000000b003a5db0388a8so3446103wmk.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=KvCN2wk50I9BwI3QZ60QDvjvOl30CW9OlUwdzw8gCUs=;
        b=TAxIzyl0U1fknL3QZSZtIEXUv1Ui0aWnN5j868+Aef1XuFdTKi8nwiqfxdGTetPI7B
         a2nMnsbhARZpfI3CpHyBsuSqk7s9RlPkORC36z26UxepqXsDTOGzV6S9HplhFbEhghIV
         Lzal3LkCCYtJ49+EW5KIiPDJEJV9N3luNd8bl2e6wDQhS917P5F3e0x+4ZflQRdyIG5l
         dXlt6WfdYKHcXlaojZTmmhiUACrU/qXuvbocJIKM24C6UkDCjQSAehDtU6spODvmE7Og
         EC18rqVFn8deKDX2Ts1VClT+qxZSyG+0bhR6/+S6jLSVAfM+Mt3vD6ikinKwzFAqZMG1
         jBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=KvCN2wk50I9BwI3QZ60QDvjvOl30CW9OlUwdzw8gCUs=;
        b=YeYBF9zex+l+XNoEr8QWzTIo8NTflvqsAUHjTQK7m5sbF27gvSvRZLUPsq15vicx3l
         lNxXukoyk6hbtd1vpTktWb1JN4ctFynVRMDcmmtA6OTn2L+5c9bzu+O3F3JO2kWFvKi8
         c05eNuYQPVhpSMmNzo0APGcOC9NADy0bJpORbiR6/kUvwIcrYaFh9X1TT0J6320JYbfT
         7l1nG3sWBNwclcXUAeLnp3MQpycHo5WkT1UIgwKSPo1GSPJeYbZ+G5zUcnVmnkOWpLms
         kE6qAze4AervKblEm4Jm/nM9xtI+nmNDQkZbAdDwIyyekJv7gibmAjnR4fpeqU8ZSdMU
         sT+g==
X-Gm-Message-State: ACgBeo1n02JWxuLPx1uvwDO/zS4xRlkRi6UP97c2t6cJl8Bf8kLylhGv
	JdUVusNR/TG1T7FIEKW+refODH3cyIA=
X-Google-Smtp-Source: 
 AA6agR5KtIkqvTgEZKB4tK9m6Yp6/WJ9iPVSvZ5AQLVe9F8Ud/+t2+1x3ZNRVvvGQeIC/wjpocbiVw==
X-Received: by 2002:a05:600c:1906:b0:3a5:f9e0:fcb6 with SMTP id
 j6-20020a05600c190600b003a5f9e0fcb6mr7429020wmq.157.1660894082675;
        Fri, 19 Aug 2022 00:28:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/42] libwebp: upgrade 1.2.3 -> 1.2.4
Date: Fri, 19 Aug 2022 09:27:04 +0200
Message-Id: <20220819072727.2236928-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169590

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../webp/{libwebp_1.2.3.bb => libwebp_1.2.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.2.3.bb => libwebp_1.2.4.bb} (95%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.3.bb b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
similarity index 95%
rename from meta/recipes-multimedia/webp/libwebp_1.2.3.bb
rename to meta/recipes-multimedia/webp/libwebp_1.2.4.bb
index 2d523df749..263589846a 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.2.3.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[sha256sum] = "f5d7ab2390b06b8a934a4fc35784291b3885b557780d099bd32f09241f9d83f9"
+SRC_URI[sha256sum] = "7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.30.2


