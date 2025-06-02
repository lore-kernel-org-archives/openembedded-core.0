Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B2D8C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 10:36:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.46568.1748860181829224592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 03:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KVGcDJeT;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: samanfatimarehman@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so30114625e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 03:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748860180; x=1749464980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHMtzU67RJ+5yfO3m3gO9GGjkWfqGM5aCrBPTovilEs=;
        b=KVGcDJeTwWTYvfeQAfFsobING0wHrwqZIcf2yW2u52ioIlx4D9iqiEKV1SqzYk0562
         2Z5xoi1z7cJicrUVPCRsssPvck3aU+CORZSNqQ6za3FpRpkABEFkv+XGWf6oKxBU8n8H
         ouYft+b1/F6WhA4IQXwWvK72l8J5gzxgUA15llk7CJK+7ThHS2j5MtbgKzMAMY7P4BGb
         nHr1a9KfWxeiF+iMrMirsr4L+ObrQ9SYUPn0N+Py8d0pVQH/4TNTfGiBqpK38+y2GVU8
         jNYj+liM4DTfyf9QUb4f84CB0JspRnAEIBcTiRuCi5Rt/fbDBU9p/DL06/JFb4Lj3AQm
         LbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748860180; x=1749464980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHMtzU67RJ+5yfO3m3gO9GGjkWfqGM5aCrBPTovilEs=;
        b=LPjXqu5w+jKJxzuuQRcitZJMNnWP39HxaKhWEaGW4F2pOPtI93fwM2yeHYwPuhnz4E
         9tysZLrzd7KETMYgNcrRpNgV/vQzfW605lwcZv0PnpEVY15biGv6j1MCRXYVFCt9Rp1Y
         KRmJoiHvcNjZLGa6abU4+clk3O89pT8dW055GNcpf13inswL0zuB2oDE87qgA6ZwDTHk
         kbFmoNTqrUfw6aI1VJY1MF1jiSuhWG1Zhs+5QHFju4q0Tcis5ElctgXXkfwDt7IWfWui
         YAgYO+xy9jiSeIXmf8JUUB8DxUwGMMoBM84A3il2l/giAUmQHiMhpDiVGK3SBgCY7SfS
         Atvw==
X-Gm-Message-State: AOJu0Yxgv0pOU7k/knHRYMtXSL0PSR9k3P7zVXm8Kprt96n+9JGlNZGA
	wyRYz3OcHJ2BO/n6vr/RufgAATW/1VXFz2WSuomZxjfEdxE/wqlDwkjDEcrFe5LDbKY=
X-Gm-Gg: ASbGncvQFNMPFv2KygH/tuAaTSP6obJ6z7Sa01PQfQlxR4KRHxRnwDLPJwQLwf2joJp
	Ih6m1x3c/D3qJ5ig5FZlrKAaMf2Dy3kr+zgDpG2GlKR2sTuGVxIJQc8bBL/WA1GGyS11dcJRK8W
	rQYqwvrWoKwtMlb1ZE2nAuRS/x0g86LTk7MEy2wEssmQpQSkXm83W6+YXxn1bspxSS30l50Qd+q
	xCoQR/hbyqSOXEt3mnmsBviZt5sfXJ/yzc9P8YnFFemzUZt0rECaSyy3v6l2ZP5L6NqQmjfKCrd
	UtLw1CN7bCRUAPYB1UNAtvPN9gSmt9uY2KUnzqg8/7MqZmpFA85s7aYelaIX6RQHTveeJ9Gv5OL
	Km6Ubfo+G2DE4M8E0Dscaaxm9emBLOSCd/sidwoE=
X-Google-Smtp-Source: AGHT+IEinSt6Brri6WXYlgMifAX936JGthKJbSB64nu4zdLKFNnZ167ibmhKvW+HrUA6xXIqW3Griw==
X-Received: by 2002:a05:600c:45d0:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-450d882b456mr87742865e9.5.1748860179500;
        Mon, 02 Jun 2025 03:29:39 -0700 (PDT)
Received: from de2.fritz.box (ip-109-091-203-121.um37.pools.vodafone-ip.de. [109.91.203.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009757fsm14505428f8f.78.2025.06.02.03.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 03:29:39 -0700 (PDT)
From: Khalil <samanfatimarehman@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: samanfatimarehman@gmail.com
Subject: [PATCH 1/1] Rectified license file paths for final images
Date: Mon,  2 Jun 2025 12:29:17 +0200
Message-Id: <20250602102917.2424749-2-samanfatimarehman@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602102917.2424749-1-samanfatimarehman@gmail.com>
References: <20250602102917.2424749-1-samanfatimarehman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 10:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217713

Signed-off-by: Saman Fatima <samanfatimarehman@gmail.com>
---
 meta/classes-recipe/license_image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-recipe/license_image.bbclass
index 19b3dc55ba..b5eb27fe3b 100644
--- a/meta/classes-recipe/license_image.bbclass
+++ b/meta/classes-recipe/license_image.bbclass
@@ -219,7 +219,7 @@ def license_deployed_manifest(d):
             " ".join(get_deployed_files(dep_dic[dep]))
 
         for pkgarch in pkgarchs:
-            licfile = os.path.join(lic_dir, pkgarch, dep, "recipeinfo")
+            licfile = os.path.join(lic_dir, dep, "recipeinfo")
             if os.path.exists(licfile):
                 break
         if not os.path.exists(licfile):

