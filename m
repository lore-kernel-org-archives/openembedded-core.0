Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5877CCAC5B5
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:41:10 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.12031.1758807667718010079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cP7XKGYs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-269af38418aso12004055ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758807667; x=1759412467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0GCShmGU89DOy3NlgylJGuE9uLWS9ybz06T04nO45U=;
        b=cP7XKGYs4b9L4NxfNdKKHmypyu4qrP+J54tyCRy074rBrjbHjErWWkmh7riWJB5bQI
         NcOUdtAgmiEYQhZYCcprzi4ZKCvZctEtbXmSx2kNm3xLCFuTivgqW/4mr35Y2qUe4eNv
         8r9+tTKCtrYYZor4SEZLG/G09ohpOFFmIoLZrRgOZzGruE4qryj/C9ufvhgly+LgKq5r
         myAr/3KdHcasWvoFUFMhU4vm4Lm87CWEwtbTxE858f/UD6OPLLv2ePLyVBrq5loNfcky
         qipOyWF4aayV1gUDAimr95jwUbzb+bMUaKyb3yXAXokFSxTFBBYgjdqiNzEswuJwGM+V
         5eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807667; x=1759412467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0GCShmGU89DOy3NlgylJGuE9uLWS9ybz06T04nO45U=;
        b=qkBr95WPvdA0rK52bw44pnqHTikWi1e81OTI65Jx5zkOhSsbJnT3XEPdO0xslKO8x5
         FTthOTYIX5q7SrN7ugiV9ZW0qze3qGHZEA8SXQlngokWbmQzj0ppfsi5UT6yzMZwiv8k
         vpPGUSxfDgd7MJq/LWCCY/4U6Lp4SnCSreZdQKGIMfmlwIUgA0lgGYW25YOliYfTRzPa
         NwbY3HdyYphsk4FUC9SlcgDuDy8pmjbLLrj9jyGJ/fYYktG046zLVdIgG9BmFCkZItWL
         xbBP4XBi18wlt7HI9n6BbVjnPrLafoT55jArdZWP4Fo2Ch78tp6XDaguiIkUc/slogFG
         IzEA==
X-Gm-Message-State: AOJu0YymbSKWptKOftkIaha6Rf7YYLnfa203Y6ohZaP4/cLrMiJy5cS1
	IkI2m2fr/G7WoRamwiXeJZz6Rl3DwvmSDlLDqauEYASJuYSX9iXLmpxFlz/9MugSZzm/PRdYTpX
	TJdgr
X-Gm-Gg: ASbGncswhGUv7nv2n7qqMmziBs5mx05yRJ/rMExN2+kJLZEPzQfTtm9nRYyC75bLfEX
	wznvEHeCkipDr+aat9s/p1nWLQ/wBSN6ET5Dq1Nb6ZPR28MGNvU+Gt+ClQd3suiXOobQzqCtoH/
	JcHCXEXVyQl9WfQrNa9mzJ5u5BzLlfiqFTj+vc1MnA4NN/zBwAVNqzvxzdZFz6/VPmv7VQjyMlU
	2S+GXvyw0KJ/6+fg4NFM1zUEk5z1Kmuva3G/tJCAroBrdQcEftgDbllS9i6Z6SZ6z70HFHA3lTz
	26f62SbuyihsEKL8AKa4kDOrKs8Nfk4Wa6y2TDWE/wfa3hg9flurEXGf4g7+D9MtvwzkHJkZRSA
	XKgAvmpt1fC5r6Q==
X-Google-Smtp-Source: AGHT+IFJ9jsKXovFEK41QMy7nhLiXjnFlFOeeCoSGTpopQSsDqwmoBXKLcqRRHm9djjjP55IufMT1A==
X-Received: by 2002:a17:903:b8f:b0:276:484c:dc57 with SMTP id d9443c01a7336-27ed4a6f05amr42915485ad.49.1758807666829;
        Thu, 25 Sep 2025 06:41:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:127b:348d:dc99:9937])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3346e9eba87sm2430014a91.0.2025.09.25.06.41.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:41:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/11] llvm: update from 18.1.6 to 18.1.8
Date: Thu, 25 Sep 2025 06:40:47 -0700
Message-ID: <3a171fde7d5cb0c2dfb6d1b11f08b061826284c2.1758807463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758807463.git.steve@sakoman.com>
References: <cover.1758807463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 13:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224021

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/llvm/{llvm_18.1.6.bb => llvm_18.1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/llvm/{llvm_18.1.6.bb => llvm_18.1.8.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm_18.1.6.bb b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_18.1.6.bb
rename to meta/recipes-devtools/llvm/llvm_18.1.8.bb
index caad611d7a..1f4b7e74d7 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.6.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
@@ -28,7 +28,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0002-llvm-Fix-CVE-2024-0151.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "bd4b4cb6374bcd5fc5a3ba60cb80425d29da34f316b8821abc12c0db225cf6b4"
+SRC_URI[sha256sum] = "0b58557a6d32ceee97c8d533a59b9212d87e0fc4d2833924eb6c611247db2f2a"
 
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


