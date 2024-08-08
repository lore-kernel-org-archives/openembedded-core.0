Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1830FC3DA7F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 02:29:14 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.50964.1723084144655118819
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 19:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kRQILNWZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2cfd1b25aaaso459706a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 19:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723084144; x=1723688944; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsWE9+TwUtJzUHmEvg7Nj5KkLejuQSG7yVezMKFA4bg=;
        b=kRQILNWZ8UvsQPUrGLVmA6LbadUV5rXdI6Q8uJ1RguLL9SWMEjtSgtR4Qyr8B9oaKc
         qdnGKL0BdWFROijybP0XXzhTxv0G8kj8CNdaMj929++Jqtfw4YTrh0ni82lsert2qcnH
         v+AxoLknaXQWfKmAxxngCdwoawesM+0RSCYxbC/uRU7leV19UqHV7151IY9/5c9mtEj6
         uuoJGN0wZm5LNwx8+hVh/1yNjtT7TcpcI7vA6sYal0wczCIZCnPuffu7IUPnSrkZIAhY
         eV1oBbE5zZDLswnXyUi0n4YYxzjjd0BDyU5qQUpDgUKdolo1fOb5PiJWVOBP9FOhBdJm
         BFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723084144; x=1723688944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsWE9+TwUtJzUHmEvg7Nj5KkLejuQSG7yVezMKFA4bg=;
        b=vOt94w1veCvhd96IAUP2mIGHl/PdR1FSw2Qa1TWoIqXxJ7HZnXe7VMMJlj2aJJR/ze
         yTEvmJRRpdyQdjALGbIaU942w96a+iMJZoHvwTYgXp0nutsDHg4PtkINgHZil/jreCcg
         FAoxl/ea9T7XWGSsjI/tatrIy4CPwhJyIaWwLvFoCFUQGe4uLEtPV31oFyQXnoH/+o/w
         KMvxDvFwz7qsmFH0GcBMb3KHpR8m7sk5yWBWTDCETACITq2RLRnQtFf4DYAEtBebV7C7
         kW5voLd9uW7gtaEN2QfxNfhjIPykJYU0OcsHd3NqcbX38ejCiBf10zHWTNkGRXZrtkJw
         uQhw==
X-Gm-Message-State: AOJu0YymIF+j3BjkUSN4o9s/fcP2uq/06wOsAzIH2i4MJPSVuf7h8t1F
	F0s/AIRKP/mxg6SKKxhm7WZEMcuSP5gZJEz14vMD0FFEAMLcGv1S/ieGsKfzuBIj5k6+uXreWvo
	v2Oc=
X-Google-Smtp-Source: AGHT+IGYY8N1mvW5a9MxjFVX6MMSAGEeMiksmBaeIYpXet6TGrQBHzPQgmpSyOWXhdCKVmqEoGe88Q==
X-Received: by 2002:a17:90a:9af:b0:2c7:c7e6:eb89 with SMTP id 98e67ed59e1d1-2d1c33fe379mr586283a91.23.1723084143889;
        Wed, 07 Aug 2024 19:29:03 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b0c796sm2269198a91.33.2024.08.07.19.29.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:29:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/10] bind: Upgrade 9.18.25 -> 9.18.28
Date: Wed,  7 Aug 2024 19:28:43 -0700
Message-Id: <45fccf634a3ba0f60ee16522b7a767bb778dd984.1723083840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723083840.git.steve@sakoman.com>
References: <cover.1723083840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 02:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203107

From: Ashish Sharma <asharma@mvista.com>

Includes security fixes for:
			CVE-2024-1975
			CVE-2024-1737
			CVE-2024-0760
			CVE-2024-4076

Changelog:
=========
https://gitlab.isc.org/isc-projects/bind9/-/blob/v9.18.28/CHANGES

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.18.25.bb => bind_9.18.28.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.25.bb => bind_9.18.28.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.25.bb b/meta/recipes-connectivity/bind/bind_9.18.28.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.25.bb
rename to meta/recipes-connectivity/bind/bind_9.18.28.bb
index cc35604aba..ca2aef233b 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.25.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.28.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "5a4a70432a33d009f0e6e9dbb328aae7a5e27507e98e28bf3c0c6b250ccb2ab3"
+SRC_URI[sha256sum] = "e7cce9a165f7b619eefc4832f0a8dc16b005d29e3890aed6008c506ea286a5e7"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


