Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4954AC5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 11:16:26 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8366.1708686976580392092
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 03:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=YUQ5x+ft;
 spf=pass (domain: baylibre.com, ip: 209.85.128.51, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4128cfb6b6fso1605995e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 03:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708686975; x=1709291775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CFclcN12JTKAHVOE7eXKqbPuOKmNPtKLFSRNJbCnVY=;
        b=YUQ5x+ftqV7voDiUl2w12/gmTVekUMX3B8qlBFiEOjo4sYcmdWZlL558O+N0RAhlsN
         1iqVQ10o1BckdfY7u+WUSCCRQofGEoc8SEoqcyvKTWKF8oTu1fUxYF9cp9yb8eKGoWOE
         0DFxm8eBL0uJqfJc2NVH0DYWvgAkcg6llQ6vSIx3emA3zLpI2+e4iYFgeSd6FUu2BwgQ
         UVnD1qmG+/4UQNB5PsZGfKa5gSSESm2CdWW0ig09ONwrwZO2tpfr72mdlvyJWdaI+jg5
         be9nz7A8Z/B/HNIeOQ27zfFx4jy7w2aP3cuiYcdW0bM5jW3SHgIYOsBSERrSPeiPwFTd
         LVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708686975; x=1709291775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CFclcN12JTKAHVOE7eXKqbPuOKmNPtKLFSRNJbCnVY=;
        b=ncxcabiexG7XxI3sK0/smHdO7aQQk4BVr2dYWyUb4u9ktIFHDQe5r2bfIWhtwZyD1H
         YWGuLdDTJBxyJAm67444pW1qpEsqdZ//VyM5lMPgkGo3ZyZ/8MlCfWeS3crS/gEAJCms
         s3Y5AabC8N2cyeY4MyLWaihK5pIPaorGb08i1AzwvJuD4T99lM7iCniOq5rNOLxyvDVu
         UEGrZRi0z3mIMsE8hA20M+W1ymWe1HBj0uzf7514KYR6jzaWRToDAbKgshhcLX5k+1y0
         yQs+jvrEF7DyuS6C7mVh8bU0+ZE2pHMxNU5slj3IkIA2kDZaLmaJY/CejJxHaDCiMkpJ
         u8ag==
X-Gm-Message-State: AOJu0YzGNdR6o0HSV5frNKaQ5qSQU9YEVjzMsBYm2jNOgUsoCbzJf5bj
	yPw035Mp47JH1HWYul3TlHJeEyUV2LDsK4Axx5rhQHFDd1KOBjPG5ThfweogivrYC8w4aGic03D
	2Zl8=
X-Google-Smtp-Source: AGHT+IGyszs2N2/AcBRn0kbxrhVx7Dwb+eH4P7o6cw20X1xG4iCxHDgjUrayMFSEaV091jwPrT+OLA==
X-Received: by 2002:a05:600c:3516:b0:412:9228:d999 with SMTP id h22-20020a05600c351600b004129228d999mr812786wmq.39.1708686975067;
        Fri, 23 Feb 2024 03:16:15 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id jd17-20020a05600c68d100b004129335947fsm1895094wmb.8.2024.02.23.03.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 03:16:14 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH v2 3/3] creategroup*: Remove coreutils-native as a DEPENDS
Date: Fri, 23 Feb 2024 11:16:04 +0000
Message-Id: <1879795b4497d3d2a810ec520283ae0e6f3c4f7e.1708686845.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708686845.git.pidge@baylibre.com>
References: <cover.1708686845.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 11:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196059

There isn't any reason for coreutils-native as a DEPENDS, so
remove it to speed up tests.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta-selftest/recipes-test/selftest-users/creategroup1.bb | 2 --
 meta-selftest/recipes-test/selftest-users/creategroup2.bb | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta-selftest/recipes-test/selftest-users/creategroup1.bb b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
index ebbbfaa83d..afd23ed1ee 100644
--- a/meta-selftest/recipes-test/selftest-users/creategroup1.bb
+++ b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
@@ -3,8 +3,6 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 LICENSE = "MIT"
 
-DEPENDS = "coreutils-native"
-
 S = "${WORKDIR}"
 
 inherit useradd allarch
diff --git a/meta-selftest/recipes-test/selftest-users/creategroup2.bb b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
index ef697f09b4..f776f43aed 100644
--- a/meta-selftest/recipes-test/selftest-users/creategroup2.bb
+++ b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
@@ -3,7 +3,6 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 LICENSE = "MIT"
 
-DEPENDS = "coreutils-native"
 USERADD_DEPENDS = "creategroup1"
 
 S = "${WORKDIR}"
-- 
2.34.1


