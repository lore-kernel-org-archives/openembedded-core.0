Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D17C25B77
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:33:33 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.4769.1715060008442876422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iymITuxZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ed96772f92so18182905ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715060008; x=1715664808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS8Ng2ILnd/moW06hNKZoPQzRtfOgKrme3ZDRhA8xTg=;
        b=iymITuxZPfJnULUVQVNPI2JH2vgQ0BK6t8jMCTzs4ZgsUTB47kUiyaB8xDQnon7860
         k1BSTqU37iKlpGfph055P4xJnKm8MMs1ap82Qdmfg4c22zui04N1aoeSWo4X4dmhKVL0
         vzk7PDhhH1uIApmo6AJjw3xvzpkD3XmOp6urfvT0OS9AV0ZtrmUhduXcWiGdf/q9el68
         S3zTlbnJC86jERiezxoKbJy2th6tFoUzIdl+3r9Kh1/wQlzIQbTSedCipBfS89Cpm5mx
         gVWVfrdU+b3mA0dHe7xqalZDXqUKH3atCkhRXDIay0i1q2sy7wp9ffLpO5VkITGuEiBB
         2Glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715060008; x=1715664808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS8Ng2ILnd/moW06hNKZoPQzRtfOgKrme3ZDRhA8xTg=;
        b=c/YP2Ik3m7U7JeUc2n/dU0iDk5Qi2+Y07gkAkBsBN+rZv61tuFINPRhbE3XipvQUDA
         HKGE+kLcxPG5sXdBmXA0Ppdw6PVJMWqCHVf3f0l4ohCBGQ42sauoHXKv1Az7g8dka4Z/
         N1kugt3+yBgZOSHT7zFkEmzJjYBzUq79Y/kikH++EmP+/pmbZ736ZrAhYhzAdy4uz6qa
         EQxQGppGgTN0tSA3Mj71NJIby9Hd42UTgh5U+kMoNNgstg/VojoMMx7diXgqxexLIFWq
         j+DLvBjovF+D3Ha61rotsaL1AGH9/EOiVwe6ikNGT1PNYp+VOCcgZ/O8bYIx5k9DcV7T
         xzug==
X-Gm-Message-State: AOJu0YxDMXWi70badeuonFAPe1EKHaCN5MHHVV4MnlLiJEYxK6LSSk2m
	QRLvEBDNksB9gU/hVYtUy84oNYSHpYyUIUmrWy6sLNb+URbuxx30zYKuWQRB
X-Google-Smtp-Source: AGHT+IGHtQViT8kiVGbCLunQKHq63DG64GDwejKBlVCzBo+5Y7tiJuqjypxT9xAytDsf26H6EJRBLw==
X-Received: by 2002:a17:902:ccc5:b0:1ec:2517:3a06 with SMTP id z5-20020a170902ccc500b001ec25173a06mr13365658ple.27.1715060007597;
        Mon, 06 May 2024 22:33:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001eb4a71cb58sm9221483pla.114.2024.05.06.22.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:33:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 05/11] p11-kit: ignore various issues fatal with gcc-14 (for 32bit MACHINEs)
Date: Mon,  6 May 2024 22:33:16 -0700
Message-ID: <20240507053320.1566814-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507053320.1566814-1-raj.khem@gmail.com>
References: <20240507053320.1566814-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199074

From: Martin Jansa <martin.jansa@gmail.com>

* these are reproducible only with 32bit MACHINEs and probably related
  to time64.inc

* http://errors.yoctoproject.org/Errors/Build/183154/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.25.3.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
index b7ebd44abc6..2ede38deba2 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
@@ -32,3 +32,13 @@ FILES:${PN} += " \
 INSANE_SKIP:${PN} = "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# # This one is reproducible only on 32bit MACHINEs
+# http://errors.yoctoproject.org/Errors/Details/766969/
+# git/p11-kit/import-object.c:223:62: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
+# git/p11-kit/import-object.c:229:70: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
+# git/p11-kit/import-object.c:264:78: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
+# git/p11-kit/import-object.c:223:62: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
+# git/p11-kit/import-object.c:229:70: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
+# git/p11-kit/import-object.c:264:78: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.45.0


