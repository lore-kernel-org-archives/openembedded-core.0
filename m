Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D2BCE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 04:33:19 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.30040.1695184393288021785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 21:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E4Dq23tW;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-76dc77fd01fso413671185a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 21:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695184392; x=1695789192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CcodTLlrdyd1O9QmqBe/X1M9OCFMIEm/Y5Pp9wUw18=;
        b=E4Dq23tWWB8opvnCjjCjj49O+67AUkIUfHnXR/O6Y+I5ChLXO0fIzCVCB1bHlH7diW
         jcoOw1+izO8mb8ejiKDLGm3YJ9h6jx4QoW5pTRF6uJqusybx9bie55Lf06UFT000qKZJ
         BwPWc+GDIG2NaK5beEqtenEsyt26+iIB5Mmwd+S1lV7BL2lQZ+dHBcSjjTWGK+c3HfMB
         xPaUxWuy3X6QaivnRXuoEk0lZN4rVGZ3yi0NJdNzKZW5HmO/ygykQJ2IeK870U78kDNr
         +X4OXX/OMwnd2tJXNLkTmZLgD5T9jGc1R6Mk/1ly/zr9RVP6BwXdjxFuoos7QzqkN/pO
         1R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695184392; x=1695789192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CcodTLlrdyd1O9QmqBe/X1M9OCFMIEm/Y5Pp9wUw18=;
        b=E4uvIVFK9RJBuIxtyv3fZAYGPnalZJX9aoaHQfohI8nRan4OQRnswTMWxVY1VMaATN
         /t3eKOzgTcMG2gMPs0iXk85TZ2bhztO5dpFhrH53lD+C9BRBqYKxuvSeLKrTKG+WXDKA
         jDF9PcK6Tre2B21WT0nO6A+yefUEs7k8lloVE4+0lQSifkHukUmR2qD5v92TLutYiKmK
         hgRsSkZXS0cNybPAPEsyCXf/tISfDQGkNF8TX0faHOg9PNyZ1v9Q2mK+vTxsG1iURNXS
         wRkpfpEadND46fDN798toe9JUpp80TYo2/bIzGRrwBli+9PLDiWQVBO+wGCHulR1kLpd
         37aA==
X-Gm-Message-State: AOJu0YwVMVLdOHQ0OZsnKnZQP/7wgbfTllS+zlT0SgQEnDRV2UMXGz6R
	vLK+bHHb3YyispbI8yYd6XiKJBsS7OY=
X-Google-Smtp-Source: AGHT+IFpLUrv0tc0EqK64P8bkYhc25nqoGqN6j7Mg6Wfu/37c3yPQ6PqktLQjpAVmp+B6nF3FKqpNQ==
X-Received: by 2002:a05:620a:2911:b0:76f:1614:576b with SMTP id m17-20020a05620a291100b0076f1614576bmr1858053qkp.1.1695184392190;
        Tue, 19 Sep 2023 21:33:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id l2-20020a637002000000b00570668ccd5bsm8845828pgc.14.2023.09.19.21.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 21:33:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] bsd-headers: Define __CONCAT and __STRING
Date: Tue, 19 Sep 2023 21:33:08 -0700
Message-ID: <20230920043309.265060-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 04:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187886

Sync with other musl distros

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/bsd-headers/sys-cdefs.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/musl/bsd-headers/sys-cdefs.h b/meta/recipes-core/musl/bsd-headers/sys-cdefs.h
index 209a623c0f0..841a5da8ba4 100644
--- a/meta/recipes-core/musl/bsd-headers/sys-cdefs.h
+++ b/meta/recipes-core/musl/bsd-headers/sys-cdefs.h
@@ -1,3 +1,6 @@
+#ifndef _SYS_CDEFS_H_
+#define _SYS_CDEFS_H_
+
 #warning usage of non-standard #include <sys/cdefs.h> is deprecated
 
 #undef __P
@@ -24,3 +27,8 @@
 # define __THROW
 # define __NTH(fct)     fct
 #endif
+
+#define __CONCAT(x,y)   x ## y
+#define __STRING(x)     #x
+
+#endif /* _SYS_CDEFS_H_ */
-- 
2.42.0


