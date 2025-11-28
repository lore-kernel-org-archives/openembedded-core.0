Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4F3D116EA
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10263.1764310754114700650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TUN76VxY;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2956d816c10so17520195ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310753; x=1764915553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJVzdidqg0g4jguAarHihVHXfY/xxC3XcMOsDCUg26g=;
        b=TUN76VxY/fbtng/doJwecuS7AZwWaSpr1emo85Aftdi9LLVS8hc1sPq07MWDc1eKvo
         gcH3CDTL20rSnJLlBj+yhTLXd7paOctWcXhainwK6tJQusLMLCfz4lBCJdg9YfIp6Xxw
         y5qATyEVNcV5ft3QU0xJ/8fHI6StnHNX6PN+/l9eMDWZU5Xau5Jp7Lg0WuEc0mhoCVEq
         5dwH8kindyI+yfwjMqgsBG7cEydAqeaHsZURPqOV24T18FB1f10ffKMn1ROnWesGVQNV
         3LBT71Rx+2b4Glvj01K7KSpzfNxby1h8v8H4Vvt34dCbPPQwZc2qrg/TN2ylGPxaA8e4
         6ZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310753; x=1764915553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qJVzdidqg0g4jguAarHihVHXfY/xxC3XcMOsDCUg26g=;
        b=F2CkTwZkJy6Mqlhq8/HfbgNGmjxMiP7AyWbrBRCC8/SzbW/Vm31yq1i/85OqMWaa7x
         O/4utK0ltFeYhT1YCOOLXqSGDjcHfC+0184Q/cMvOLYRi0Uc00yuYj3GCdxPYiK66J3V
         tvgX39zW2Cw2W7clm5103Y/GfsG9W0YyjvG29wbk+CJf3NaafWR7IF2oRfNKlBjPGtga
         MlZ+PDshQF0q+o73htTH3SbDNbQS6RaX+8k6Y7hayipgvKC7UaRcWI97u4GzCGVFGSdS
         1L3QZhR0/G1gK8VmJ8U3xMPzHu5hhoH4xIldXdYDwwc8NCDFG4E1P1CWxBMQvNJk1yu9
         jI5w==
X-Gm-Message-State: AOJu0Yxk7N7e30CqnvK9SZSL9zucDWjGkRgSJY5A+LknwGvMZ+QjInoH
	ZbvWYrdZ+QmqRiutL1Qq3BK4epMlCKBlhLVy+11jQM+yiqq0JynxAEXFvyXAzw==
X-Gm-Gg: ASbGncvbvIjq8juVNrnu4cP3FURipninFLxumjy92lzoJjcA/b5JePsU3qlGeuTxox5
	vtA12wA7+sKpRG2wbVtAiMWvC2cMnRlEdnkcPVCXidUbVKSghzAU89dviwd+9116nqiS/fVzV1N
	puKgXLJHKfwOq7g9HAet3Yoc1cRnC8kBpdea8Zc+clbDp/gKPbeneFTW7fsfJMBr6c63T/oeFFF
	OYguFx9nwyCq9gxjzJzZebZHXgLLzrvDuDEiNktVU9zevNm1HFK34HpZcjM4Gftlyj5X1rsu5vi
	t32OWhcE0oAUNtLidtTUIv0wGIGxUv6MKjUSMzNY73cO6ItU3WXEFHREeCdX5DFlH0QOAdOB0+o
	Scj6D8r1u7Y9VggsrxEJiWg5kJHmL0a4i/G9i5az1Nchd3WyRmLfXsWq5b0NcJSmcUn2z7oDyMR
	ueUfnEmGNypRZPcXHSaldZ92Ti
X-Google-Smtp-Source: AGHT+IEEwkYswnIehI/RyTUl92vFZzNOOZmTW+nDoZchQ+S7+dgydkMl0T7XwmANiEETEbXecEJpRQ==
X-Received: by 2002:a17:903:2408:b0:295:4d62:61a9 with SMTP id d9443c01a7336-29b6bf353fdmr296692915ad.38.1764310753351;
        Thu, 27 Nov 2025 22:19:13 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:19:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 09/14] msmtp: upgrade 1.8.31 -> 1.8.32
Date: Fri, 28 Nov 2025 19:18:46 +1300
Message-ID: <20251128061851.1634479-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226892

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://marlam.de/msmtp/news/msmtp-1-8-32/
---
 .../recipes-extended/msmtp/{msmtp_1.8.31.bb => msmtp_1.8.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.31.bb => msmtp_1.8.32.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.31.bb b/meta/recipes-extended/msmtp/msmtp_1.8.32.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.31.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.32.bb
index f43dc38bd9..548c94aaaf 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.31.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.32.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "c262b11762d8582a3c6d6ca8d8b2cca2b1605497324ca27cc57fdc145a27119f"
+SRC_URI[sha256sum] = "20cd58b58dd007acf7b937fa1a1e21f3afb3e9ef5bbcfb8b4f5650deadc64db4"
 
 inherit gettext autotools update-alternatives pkgconfig
 

