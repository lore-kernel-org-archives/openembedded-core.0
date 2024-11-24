Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B21E668BC
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 16:24:01 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.69357.1732465434648086630
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 08:23:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bJhO5ZES;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-382325b0508so2382815f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 08:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732465432; x=1733070232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XYKYf+Lzs2uSYftImemBQ+1sMIxjSSdZuksOqysITlM=;
        b=bJhO5ZESM2Z9Q9Lqh79SwDgu23xkt0HohSuNw7mrxZkIb5CyZSxnegOaR6U2XECsYO
         AvYBCJcrrV0ueMAurncFtQRPn/4yOWFrXdeWXEWkfH5wYx0eR7Ul8eurX9ZRCNA9idm/
         5R0g1RVORMybjHSgiga2UIG5qNg7u51Pp0VOIjt65M/VgAWiZOTkpdbQPI21dMwO25EH
         m9bSTK+W1Smx+vTy1gL1IrsavaVj+KPh9LOqKmbDXHMyUxLgMq1E5sY65Es+Oc3fgm7o
         M9pccEl1/YaxBa0OreLs8omD4p58fTh/3Or+tQUO0l0wZ0tQzg4bQRwEucQUYF0PKSwC
         w8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732465432; x=1733070232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYKYf+Lzs2uSYftImemBQ+1sMIxjSSdZuksOqysITlM=;
        b=DI+jqB2i5iF01EP/FVs+JmS3xpxXZUcPfJnN7DIrHCQUZaQ56yrrLhYE/TByCdMVs+
         +G7p470PipfidhKb2rC/8EetYKBrq5Tx+W5CxQLhlqxSqwsPp1kGw5GNGTokrTeuKsBp
         gwyO+u9lokxXExfx3LN/27P5CrneLtjqAfHBdZeHPrGS8OeUwYAAgzDc9BuVMSLhhMv5
         JPC/ItFcqbvYv/AJCxeCIvez0x7v/hBWqw4BbvR38sDOW7LsnDxlH3b1e4SKeJmA/+l+
         CxvmiWWQEPrjCQN0E48ne0u+ecnOVOIhJpDyVs8Fwobq3x9GXcnga2lK/T+IbrJy1mb1
         6EeQ==
X-Gm-Message-State: AOJu0YyOrkN5Mr29TsS0Gp0WHk+bXYC5dZAI/Tr0cxeaYIEBTupRlB/5
	NPXntPR3AMBpsJfC6bNsj4u2KSry6MqjYuIH7TXklE528363EfcFMtkEFw==
X-Gm-Gg: ASbGncsFPtwcWXkWhgO3MH13yfmIPG/UiiSaYQKgd+eqo4AhTW+JA8u7RFm/7Wh7eGZ
	VYUAzke8ZI+Pqx9F0XIyT5W17/JN2vsLRa33Y1yE4ZzB1CNJwLfhHCN6yribhVcYSNdsx8wIv98
	yAkg1vnJCzPPaWFMz6lPr+VgtIWtkrLfc8j/dPG+yTACzxlFZ42Q9w0fSH+xx8u1+NYy/0XVWr3
	RaUs3qL+X6ogErHO/aZwIRLIMNwmZOM0xNQQKIBKVeiJsSLaL/UBuU5ny3fKhcFXkOnS29nhgI=
X-Google-Smtp-Source: AGHT+IElunY6xTaTDPptCGMpqda5+M/ci2AOWHyRRV/cfNxaM9Rrah7DEt76BXzZeSGRyhNB3ykNWA==
X-Received: by 2002:a05:6000:280a:b0:37d:45f0:b33 with SMTP id ffacd0b85a97d-38260b486aamr5905930f8f.9.1732465416842;
        Sun, 24 Nov 2024 08:23:36 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde8c804sm97467825e9.30.2024.11.24.08.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 08:23:36 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] python3-rdflib: drop python3-isodate from RDEPENDS
Date: Sun, 24 Nov 2024 16:23:28 +0000
Message-ID: <20241124162328.702209-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 16:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207710

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


