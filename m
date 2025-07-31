Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BDFC83F17
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 08:27:29 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.56790.1753950445266371943
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 01:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0Gp2cjRk;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b783ea502eso385952f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 01:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1753950443; x=1754555243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y2i9yzi/p3tGLVer0kwwFtrV/7rZI5g3L7aJzSNxjU=;
        b=0Gp2cjRkA4VKb/jmIFN8uXXxZuawPxXr6zTYFV2pRSBQlfxkrRRnHkCRqcFSHAVLGo
         zTMDZRebSAGsgS94agfK6U3SsmwrOBVYEQKk1zQMUq9E3PqqcxbZzKyyOKR8BGf35iyU
         YXaUUmOHGuEuDFLufMhFN0/nRHqqkqzf0B+Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753950443; x=1754555243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/y2i9yzi/p3tGLVer0kwwFtrV/7rZI5g3L7aJzSNxjU=;
        b=AaJPDrec6S+5mSbp/X8n7hLw0nhLRO+ukrolyP957eakxjHYE+8OJkz/2U4UlZ79EX
         BGlKDC652owKSJYWSXZ+hrfB2IFv6cRtN0ISRTOAiVLSw326bOPJcvnURE48mR3F1n59
         l95AneUnS+64U28j8xcqG1qOT9vONNS4P9FQqApX10R4GJjSUzP4OADIC4s9Ir+c9ltt
         LfbKDBym05bspw0aSMnSAwZujlrkIfg/IQy15w80EzPf40zNFD9S2Ctrf/jNeqWGlaLB
         DHxGantdGIJg3d9a0UFPGRKO8r0zraTeSLxmvp1oHl3ZW1N97Nqf/ZHVRRcbsGQlWwbq
         JWcg==
X-Gm-Message-State: AOJu0YxFnr4ESqvgTP5ARhT8j0GwdGc8LVgYAle/DNLuTfqYuP7c6bHJ
	2shjV+hU+h/znm5g1zPtNut9Y8s3QEHm+wNf56JMiyn6CeSTOWPHnytS1t28xGpHokZluMleiq+
	7yRYXZchWEA==
X-Gm-Gg: ASbGncsfacf1wnoTqiwzpBidD1o5Xou/WGwC6bkygZh/omNbpt6pAGVOe2NlKX0j5IA
	jD5U8i0SXuUlxS7d8CjyP9Pmy1LcUBm23iTsQrS1o8NfwT+t6IqptrM1Ggd58K7S8PhuYvNdtU/
	w0i0k5doUN3tPFUNrYJuJTmt6amYN/+51lpnBBhVpblTg2e11b77Ppo/dc+3m84+tBN/l/sDX7G
	f6gAtWqlB6Yv/Tbzg4SM/v0Sz+8UvVHSQt+K6VwxZ65jVUcOlU3ABbYbp7MGvxQLx3A0InQAF3n
	lBdkId0MFlb0H5HtpGs9MATEmVYqgxNbeSD3bJE2jytbkbaxqYbqXXwbrby65prd2CvQv8YdBH2
	ueamMPQ3dX6PVjOz5VWYql6mw/VViKshnceOgJ8dx+cHHhAXLqjkLafY/Eu9Mw3g9k8jhO2v6Rr
	OsaTXiNXTqIxNJej3xWdhY6RXESzxX198WCls=
X-Google-Smtp-Source: AGHT+IHZEVJKtvKE/fKRPr2NTVVKtKKUOj4Lop2qXaEYRzixrEsQEQ9UvIETzGgNFk88a57zgMaGUQ==
X-Received: by 2002:a05:6000:220d:b0:3b7:8ba2:9818 with SMTP id ffacd0b85a97d-3b79d4e3419mr1095152f8f.22.1753950443323;
        Thu, 31 Jul 2025 01:27:23 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c47908esm1562672f8f.59.2025.07.31.01.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 01:27:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 3/4] runqemu: accept vmtypes and wictypes for rootfs paths extensions
Date: Thu, 31 Jul 2025 10:27:06 +0200
Message-Id: <20250731082707.3481718-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250731082707.3481718-1-yoann.congal@smile.fr>
References: <20250731082707.3481718-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 08:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221178

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

