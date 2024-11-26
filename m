Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B598CD6554A
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 18:32:04 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.53882.1732645918412808359
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 10:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BRmFQNUU;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3825c05cc90so3863003f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732645916; x=1733250716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XYKYf+Lzs2uSYftImemBQ+1sMIxjSSdZuksOqysITlM=;
        b=BRmFQNUUwwTAZbjUW7L6vUo4e1ZVEbRS08zT8V+mbG2j8NntfEbMofEYkRlWfOpTqi
         QiFH8HEHZM7q6w6DYmQGS28D7RSsiWM1yAgywa4whzzjLn7MrfjZ6IdFpw0bZgdVKYJ2
         rqXMjKl1/Z4ktZptZeoxLNAvDR0X5IaXdghLMU5NKc8P00KNNqRu212uLOZW+ezk3n9Z
         ozUddz2heyuQU2f4++Cd9C7xPFJhu0GRA689TxfqVATujQyk0b/0DzIpWH9zIMxUc8SI
         uv7SckcWJFj17klzdlgu3Ek5aS93mo3G6LBpGh+crmHbMEmikIqx73C8w1f0DTLxeQRQ
         BYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732645916; x=1733250716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYKYf+Lzs2uSYftImemBQ+1sMIxjSSdZuksOqysITlM=;
        b=INc7EHfGdRHpcq2/1TocdxKD/7xPzFgs+KpHQ+vRpXKxUkCe4YjsGvxI70Jo6Q/VXn
         xcneGg4gUI/qYDLOTGDOQX+y7DJGrbOZglDVT6answtmocV5m7qx5T3Ta1NA5prcq287
         8H+XgGOxRGNv5UAcDdUzYTFRl4ZQW+NC7WHM1ZCC56QqRsH06JWwKZfps2AcopT42j60
         SVljL4cMgi4hpQYhcQlYhtMBiTNifMCf4cLAMzhyZrvWCbilmcstMLq1tXc225zgTFFK
         hbQqIZsAVEVrk66V8TQ/UO3DH0exerJQ4YcrBM4QObrBZV+utNhuN/GdIgNnya5kupsh
         TxDw==
X-Gm-Message-State: AOJu0YzZV68XdiJI30YiPZx2gH34Lqo/HDaNeoafXoqMHz5jZ3P1cdyE
	SAcIZZWtG01jyrYmGZPN5MTYhUhesyq7nS81IxfZ2aJGDE5xzXNX0qC5mw==
X-Gm-Gg: ASbGncvLrvoz2Tix5tBizkZeTSiOZagb264sMnA/w9ZdWW/JgOckgTNrSochj1DlpmE
	vA1zZNd0JcpOXRQ+0P9ZPBiBOQjQuDn63jcWC63S09NGL4mJlNdws29cUV8zIdRxOBtvqa2H4DA
	RY6U8pleE6ng9VZzDGCSQJbv04pgciENNSFQXu81T92VGjnZutnZJOdUOy56a3Ox10hvJhk54mO
	ji7sypPbBgQe3A2VOlLItlEuxR42WDCV8Ljkq8/FmNwy1VRsYsRmceceDnqMEXE3TpCYwJHnv4=
X-Google-Smtp-Source: AGHT+IG6GgUmw5xgTJS5Xm2lnw/IDlKi37QbeZf37ofXeV2qwLxHZJkJxuN53w8Dv0m2+GRY2UZ6wA==
X-Received: by 2002:a05:6000:188c:b0:382:2276:c93c with SMTP id ffacd0b85a97d-38260bce871mr16317443f8f.44.1732645915577;
        Tue, 26 Nov 2024 10:31:55 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434a5f96236sm32368685e9.35.2024.11.26.10.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 10:31:55 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH 1/2] python3-rdflib: drop python3-isodate from RDEPENDS
Date: Tue, 26 Nov 2024 18:31:49 +0000
Message-ID: <20241126183150.7417-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 18:32:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207882

On Python 3.11+, the built-in datetime module is used instead.
This change was made in v7.1.0 release.

See PR 2929: https://github.com/RDFLib/rdflib/blob/main/CHANGELOG.md#2024-10-17-release-710

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-devtools/python/python3-rdflib_7.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.1.1.bb b/meta/recipes-devtools/python/python3-rdflib_7.1.1.bb
index 133c92ed4d..da4b777ff5 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.1.1.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.1.1.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "164de86bd3564558802ca983d84f6616a4a1a420c7a17a8152f5016076
 inherit pypi python_poetry_core
 
 RDEPENDS:${PN} += " \
-    python3-isodate \
+    python3-datetime \
     python3-pyparsing \
     python3-logging \
     python3-numbers \
-- 
2.43.0


