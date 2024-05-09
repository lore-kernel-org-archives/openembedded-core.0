Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED5ADC41513
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 01:30:56 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.13.1715218255351798128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 18:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mKcAYKmi;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so290294a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 18:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715218254; x=1715823054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YtvmovBBWnofGhcs6Aevab305mRK4DwcGIVZRdkW6s=;
        b=mKcAYKmi+M6ca5aw0lqErV6mHKhrT60Ykhpl9wG6RJfvgTKp3Dynrv3C80dHEfdwDo
         QvDYmK+SyRHgQg3yVq/2F2xrF+n4uDcVX8UV58/TDbi5RjBsqrAkmzG7HFw17hvwY3tk
         bjyBYOjKZJ6g9EKND8Do1li7tQpBAeckpTnv9AElIZrwUH9/uIyzkRVNn2Bgo0u0PdY0
         BBED31IpoxtbsUpgw9uB8x7OYSybRIY5gNcQldPdIj1T2cE93URcYT1C49QMVxERHaKH
         PW5T1aEU3YYXZmEilalHF7fkBuRQRwkPABZSe6YnZ5M8YkdkPzxS1/nrNQq0FuI6ZN5P
         HUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715218254; x=1715823054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YtvmovBBWnofGhcs6Aevab305mRK4DwcGIVZRdkW6s=;
        b=tAbCVeBomiQcckDOSE0FOXQVqkn2EOBbxBa+6yFvDo7CVQKH1b4DCPM4F36JnBPwkS
         r1OCrFCV8LedLIqXINARXw+B0OPfVHjsk5TmvmZA1zcolnN2WMEiqWXeTiZti3+HScwM
         HlUbl6/hRJBO9ntw4dCBrf466xyoZytl7hGcHFYzJf2xRMCoFRb930Zy2okpAvs0k9PF
         ByVGGr7b0Nf5LfTTW9JPwBzYmX8xFbd0EnugfPRHOveKirxvhStj+xxKrKJXso6T3uLL
         4TGYqwn2QR4gzgh+AJvWJXOYA147QnHyFu+hCUlceISdGrBjCA1NHTY7P/5u0JaFnvUE
         FOuA==
X-Gm-Message-State: AOJu0Yx7nzEzdzcylZYsOr80LYBhDTFJ4h/w2cEaUP8LoCIVry/L7B6d
	sw5d2RYz7GyVgMe6bB87Z6PpxYd542RLZut/7kWIJu5BQzMaN5/75i7IqoNQ
X-Google-Smtp-Source: AGHT+IFtkbmavdUGQTdDIddd5vOd8hxu2zhG2QLDv5pNHV6oDzCAuzrnYPSm+VnfY9/mWtJU1xwONw==
X-Received: by 2002:a17:90b:1914:b0:2b1:9fa4:16fd with SMTP id 98e67ed59e1d1-2b6163a3570mr4554037a91.4.1715218254402;
        Wed, 08 May 2024 18:30:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::af2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b67158de4dsm244558a91.42.2024.05.08.18.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 18:30:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2 4/4] iproute2: Fix build with GCC-14
Date: Wed,  8 May 2024 18:30:49 -0700
Message-ID: <20240509013049.523093-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509013049.523093-1-raj.khem@gmail.com>
References: <20240509013049.523093-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 01:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199135

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Rebased

 meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
index 68f7611943f..24539e3d998 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.8.0.bb
@@ -26,6 +26,8 @@ PACKAGECONFIG[selinux] = ",,libselinux"
 
 IPROUTE2_MAKE_SUBDIRS = "lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc rdma', d)}"
 
+# This is needed with GCC-14 and musl
+CFLAGS += "-Wno-error=incompatible-pointer-types"
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
 EXTRA_OEMAKE = "\
-- 
2.45.0


