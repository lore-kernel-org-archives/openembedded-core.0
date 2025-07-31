Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9221FC87FCA
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 15:33:31 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.65200.1753976005885819156
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 08:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CuZfboOw;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b783ea502eso739427f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753976004; x=1754580804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y2i9yzi/p3tGLVer0kwwFtrV/7rZI5g3L7aJzSNxjU=;
        b=CuZfboOw58TXMYfwwlVc0g1NXMT5dXI/D1iJGGUD8CUQioB+iMBSg9mLWJrLkaCnW4
         Qz1m9LGTFAiolBpYpUQ7XnD9JtIYecGsFzouBoWxXj37DXTTpoHf0u9M+5vcWsN1LP6X
         Kt8uoU+GYjb2UYnYOB8qIzsNEvLEk0muZQmN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753976004; x=1754580804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/y2i9yzi/p3tGLVer0kwwFtrV/7rZI5g3L7aJzSNxjU=;
        b=NclG6e1wyN6rY+Ec+NV+bk5NCagd2dGivSRVtyj1JVsO+MzNhS+cGmCiu13hsooYMR
         pPRnLZS+HRD3htxYVGoicHTEk2vKdjpgykyTwGmeF0udY0Oy/3ws4BU1VtoGRnQPHnOO
         YvZpROut74HYoaa/QxFm/Netjb9O0ANCPp/iGIomPLL5L1ATJIncGhHLgVU7O0Wk9GEg
         sk5uAc6S22rsV9mGKoVx/wla+lpXIUCFRRquG8FFogXAfxiTscMOHna07IuiEAVpyT6u
         BNreR0IPh4et4Vca0mU1eBzrA6CyoZiryzvWNkb0R3f9HXi+IgRGaGveBv06RP8j8Cnj
         7Jmg==
X-Gm-Message-State: AOJu0YwT95i5rTcVnLnJxPu6RPjE65+NpH0RIDreC4F5HAcAWz0rTk2p
	2ArqPk//GUYbw76FHIm780eDwE8U2LXH8uBX/6SDN4jVAFXuVVaZtLLfKoOO4NB+YB92k7870Op
	LQ4RUxzJd3A==
X-Gm-Gg: ASbGncu1ZtTxtrKITJ8xtxDVHVa6ijWpHqwhudmkIv7boX1xhFjy/6zKmVwkqEcFkTE
	87sGxMse/io8EYTqMUIDx77v8OE6ae+gYvxb5Gow/BnMDz65NGJSnZIJFyOOwjHNpjapRBOV34k
	t1/LdCu++0m0BuR9lm+1KX8UeM3Hc1r2ieKoz3WcMc0FndCV4/Pmnmi8J6R985cdp4TVd0roi2r
	kCLTomq8aXD80cqH/VXShYRNTe5im5lVhauirDZjmWrXpjBAxOT8jscWBFqQ6617CjYWCRVERCX
	u4+0Mzt8eWP80oPJnN0Z/xS248+km7w8/AU5m9qqXw36yjq9U2kaaQaHuXfz/VEEcl0sUkoIAo2
	ugQMs/yEmbRz580IXBrmYw3FIFKGjIKT4YzX7Eyyt2RlQZ2M6oAMb40PA+1km3E2E9GTuhOuw59
	jj13WIGxG1SjSNz3/GV7bGAwBxVXRcSF00jq9AvSFdtbU5pQ==
X-Google-Smtp-Source: AGHT+IGNQVtsTbRmNxgBKPMELfoBLT6ZPgcwyRsZfFwA1G4Np5lSBM+dY7MHEpN/l+kZ+z0q0DpXVg==
X-Received: by 2002:a5d:5f4c:0:b0:3b7:8acf:1887 with SMTP id ffacd0b85a97d-3b79d4e387emr1313353f8f.13.1753976003842;
        Thu, 31 Jul 2025 08:33:23 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c475067sm2703727f8f.58.2025.07.31.08.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 08:33:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v5 3/4] runqemu: accept vmtypes and wictypes for rootfs paths extensions
Date: Thu, 31 Jul 2025 17:33:12 +0200
Message-Id: <20250731153313.3693397-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731153313.3693397-1-yoann.congal@smile.fr>
References: <20250731153313.3693397-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 15:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221200

From: Yoann Congal <yoann.congal@smile.fr>

When using a .wic.zst image, its fstype is detected by default as
".zst" which prevent booting correctly.

Fix this by adding wictypes (and vmtypes while at it) to the list of
known fstypes. After this fix, the initial fstype is correctly ".wic.zst".

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index c668906bdd..da53265219 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -380,7 +380,7 @@ class BaseConfig(object):
             # Check filename against self.fstypes can handle <file>.cpio.gz,
             # otherwise, its type would be "gz", which is incorrect.
             fst = ""
-            for t in self.fstypes:
+            for t in self.fstypes + self.vmtypes + self.wictypes:
                 if p.endswith(t):
                     fst = t
                     break

