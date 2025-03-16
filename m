Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FD4C35FF7
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.31784.1742141550419930398
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cmSv3/XH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so14956815e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141548; x=1742746348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/vOl3PvWrpQOQFRUJePT7sfKmN/Cq4zLOMmGBW4CUQ=;
        b=cmSv3/XHg0Jz4IVDV3xnGuU+BGGuH5ksaIe3sjyVVxAiGLElb2IKH4jU8eW+UdFbZN
         JUuMMEW9lG9kBuIK/L0S+Axl8V5eGa96/7Ksv6ZsgwitiZGJxEVYwvMnlFUog0JGk5yW
         +7Iw+90VD8KwAKsB4JpqLXpNGLY+c91pxXHWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141548; x=1742746348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/vOl3PvWrpQOQFRUJePT7sfKmN/Cq4zLOMmGBW4CUQ=;
        b=RXLYsoWBNRtEsFOuNx/BRLPN+dUhDjQk8E6ISCThGPAxWRmaZqzdDH7Zdck7BM81Za
         JN80Bbt/iJjjJg9jNvTtr7dUSrE2miASLWWwi29hSUKms2Riuxs0HlB+6JFTyKqJ8w6C
         EeL0eFKrxQ5L4LOjrUiPwNK5zRvfZ5C2KGhV3x56fOZTJyfF1PAg60kwbPaqXBRE9V1d
         jbYb0ehVGysyHhP/kCP6b/E/3WvIP1JUQREVcR6+FQp1XyxEXHmywU5C7qMmEsDzpqwa
         Nxd3gd73MydtQIsKatY7qHaHbTpi5mXEJF5aaX8tsBA17RoB7BUyxgVdbVXsXejDMbfJ
         2Upw==
X-Gm-Message-State: AOJu0YwhSYA4p0XoSKjIWp7uuCTX3Fyvvmv3qZrkeeksVH74tBxu8Z6y
	H+XwFLg19IJyAvcLxtsMj7g1ZQ5i78sRlirVUTQHemRKZC2WMIBcFdd+WjIUr9fxDLC7I9A+Zcg
	E
X-Gm-Gg: ASbGncvYqYYN8ykMVh3pWSaostgL5ooqVCiYjhDx3fx6/8NBmk7s51ZmX1Y7F6KeYpl
	mbVQ2Tz4KHCq5VVfwSsCxVveA8SaWH+RpV+udyFTWDktEnvxUnGLR1EDFZloMO2H/xC6Grgl7bE
	yXPsrOmk/z3srmuxRsNuPKRs4Z1TWS398yV6OSj5f5MTBTpW7TxZbdGNs0otAG+X857UnNcu+k4
	km5oiwcfjCYJ/e6WyI5LwW2w6mO01KpzC11g5a0AOq5sAkEIB2Im4M4RHOc1MsQq7rY4MqGmbID
	2I1HPK7F1IhYRHqpSaXjzMiRgizaPCm7bH3ZXonJMi49+pRbunpkDBac0zE9T/jfjnA4RLeJQQ=
	=
X-Google-Smtp-Source: AGHT+IGLBxU8tSnFgCnYgThjDvRxZZrpNqfRvEa9nHBmKjUeoySfupHwp3P8Ke6HkzREGyRx3UVxFg==
X-Received: by 2002:a05:600c:1914:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-43d1ebfcc1dmr113355645e9.0.1742141548459;
        Sun, 16 Mar 2025 09:12:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:27 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/43] libxslt: upgrade 1.1.42 -> 1.1.43
Date: Sun, 16 Mar 2025 16:11:39 +0000
Message-ID: <20250316161209.3629986-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213016

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxslt/{libxslt_1.1.42.bb => libxslt_1.1.43.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.42.bb => libxslt_1.1.43.bb} (95%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.42.bb b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
similarity index 95%
rename from meta/recipes-support/libxslt/libxslt_1.1.42.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.43.bb
index 9985dd88274..d251fa8122f 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.42.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.43.bb
@@ -15,7 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "85ca62cac0d41fc77d3f6033da9df6fd73d20ea2fc18b0a3609ffb4110e1baeb"
+SRC_URI[sha256sum] = "5a3d6b383ca5afc235b171118e90f5ff6aa27e9fea3303065231a6d403f0183a"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 

