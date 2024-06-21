Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C2DC30653
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:43:09 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.70014.1718966581358290888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RAEzS9+L;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so35226431fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966579; x=1719571379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DW4ifLrCYa0FRZwMvxxTL3RV9p7o6PIThroXLZk/PDk=;
        b=RAEzS9+LtymlBYBRyPwLbVTeG+ZDkcEjtGXJOxc4W08WeZIFtzFCFWHG55TEjaFp1m
         l85RObYZti7reR+gjzGgxB4m6H+DliT2EcnayUz94XYBVhpmsUsP1W6YsO8AGKLE+u84
         0L6DVM2GCO4oN8Pkbusae1HN7DEhqkXlqLu6RmHg8GmDr057Qc8wnErRtLAjehGQjR8a
         QBH80YyBw/Yr2sj+3SK+Qosvvd38YazYxFlkWi96EbFzT0UqO+cLRG5qjdMnQV/BFq8Z
         wYmr8rSD71wT5DoCPol6l7sBcAbfkwTPdklZLIrrXSuem3+BlaiH2ez/OaMcvM0akV3Y
         qGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966579; x=1719571379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DW4ifLrCYa0FRZwMvxxTL3RV9p7o6PIThroXLZk/PDk=;
        b=bTUkdKckCNeeM8+HcdOA2FiZjcvbK6gMmT4P0BzSq538q2MYJcIZ3hYGSmlKVAEUYJ
         39cpqjWPLZPiP6B9M2uuHOF3vb/GpNASRselMKQmpMCXRwvvSMGcA8PeWALi2tGGGvYZ
         GRhOB+kppMFJhYibS/Jh0VuXBMi5cuYotSEI5O1r38GuIstaovab1Xsoo6AkoJxuw0YP
         xsP7ACqy7JCfk/qAb5kMwv1wgJZufxZlr1Kfpm0gBAxHCRpn/r/lLfE6F4tQgjGRaCNH
         Pwq+OfcOp6QYPZyPPYaXVgRyFOMqhaftWBsJ3Umr5JiBTWo6mm+FBi2zUlmIpSyNY1Sg
         8iQw==
X-Gm-Message-State: AOJu0Yw7Lre+/55DZ1bM3ieFdSOqNWJ/LFmb3Gvi5ckNoL9irsOZP2qt
	nbcSpH4TNyg4LwPrPKhHGe/Rgy4YZmqLv9I3kLgnpRW+dF4Yo9DsALSoew==
X-Google-Smtp-Source: AGHT+IF5cfnUt6CER/2j81p87zPz85S1xHGS81VqgLQay637WjbvM8jxc5wJq2uThitWOWNIBVCPuw==
X-Received: by 2002:a2e:8011:0:b0:2ec:575:bf9f with SMTP id 38308e7fff4ca-2ec3cfe9355mr64389981fa.37.1718966579054;
        Fri, 21 Jun 2024 03:42:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560addsm71378066b.175.2024.06.21.03.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:42:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/11] cmake: rename cmake-native recipe on version upgrades
Date: Fri, 21 Jun 2024 12:34:08 +0200
Message-Id: <20240621103414.2842509-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621103414.2842509-1-alex.kanavin@gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201010

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/cmake/cmake_3.29.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/cmake/cmake_3.29.3.bb b/meta/recipes-devtools/cmake/cmake_3.29.3.bb
index 9146fa8c0f9..50f760f1c51 100644
--- a/meta/recipes-devtools/cmake/cmake_3.29.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.29.3.bb
@@ -66,3 +66,6 @@ FILES:${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
 FILES:${PN}-dev = ""
 
 BBCLASSEXTEND = "nativesdk"
+
+inherit recipe-upgrade-additional-rename
+RECIPE_UPGRADE_ADDITIONAL_RENAME = "cmake-native_{pv}.bb"
-- 
2.39.2


