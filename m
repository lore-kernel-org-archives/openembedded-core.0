Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D40C5472C
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.9514.1724319338236210212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RQACK+wS;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5bec87ececeso856007a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319336; x=1724924136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqpQszASOSvfGpTK9A0jvaFgU/ZVZxZjUFyAHXtPvKo=;
        b=RQACK+wSLDvreMFN+0AnyffnjxyKConPLx6rTg0UvO6mO7oztJZBNAHKIuMsQhz2t3
         kBSlZWDJl42ipHOczuMS2cDgUp12E5q0PO33bhCDw2dK2Q/qxVeUW+SfiB1JFLQtmyMw
         52Kim9VI014HLDSpbQjgsEw1QxCom9RtAx4iMxyix/MjIiR7MAlGBCKGvxefmtiH+K6D
         BWTWYKIkVyMfzJn/VxrJUMnJJvgFuorLjgraj/e6AHicBAfrD1BLe+u2Oa1bMNi4TzHE
         X0rjSFIG7+u37L46j8PhNS+JnHpNi8iWx1Jc+jfPTnZOsJ4R0DfAPOOm35xFw2gyEloQ
         HxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319336; x=1724924136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqpQszASOSvfGpTK9A0jvaFgU/ZVZxZjUFyAHXtPvKo=;
        b=SsYYsdth5MTHGTd84s5TP9155t+ufHyeF48/E0xD4LUybSO4dzX1ihnt8XxPwvAOfU
         TwAfvbTSsx8PjmluzSvpidis+efSrxJ4nd2TDcx6S2WI33mBb7wPA07V3WV5/4uN9/CP
         /42gd0vhViURyIBK2/46HsFqFpVHJ6+hL8JjyeDl1f7pZyTuOsQDKYJBy449W38qR4Mz
         3yyfJPgZ0AhINA+k8/j7iQh2NYfkpm8XSf2i9PND7ppiOGd/KzHxub20K06OQp5D1YZ2
         BfKCS5q3a3qyQUFprbMmVmqbVXJ4Z7S5/+tYyw3p82e4I50dLraQbOu29L0gMaGwO+BS
         W3MQ==
X-Gm-Message-State: AOJu0YzofE4pQRTx75hM51f83TI4lUa0Snf8uMtQSzm00jsqR0ns4GeB
	RgIvGAksLV6k1y+7bUBlXxFsEezK0sVWcU3KIwKXC15HecOBUZ6D22J7Ww==
X-Google-Smtp-Source: AGHT+IFpFqWMk8pqNdrELM4MEK76oyC5h8IeEqX9mLPisRZfjLnxSSbBBMDA+IeQ9PUm9r5vJKCUMA==
X-Received: by 2002:a05:6402:1d4d:b0:5be:ea84:2ffb with SMTP id 4fb4d7f45d1cf-5bf1f262fd0mr3247548a12.37.1724319336133;
        Thu, 22 Aug 2024 02:35:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/32] libva: upgrade 2.20.0 -> 2.22.0
Date: Thu, 22 Aug 2024 11:35:06 +0200
Message-Id: <20240822093521.36790-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203632

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{libva-initial_2.20.0.bb => libva-initial_2.22.0.bb}      | 0
 .../libva/{libva-utils_2.20.1.bb => libva-utils_2.22.0.bb}    | 4 ++--
 meta/recipes-graphics/libva/libva.inc                         | 2 +-
 .../libva/{libva_2.20.0.bb => libva_2.22.0.bb}                | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/libva/{libva-initial_2.20.0.bb => libva-initial_2.22.0.bb} (100%)
 rename meta/recipes-graphics/libva/{libva-utils_2.20.1.bb => libva-utils_2.22.0.bb} (90%)
 rename meta/recipes-graphics/libva/{libva_2.20.0.bb => libva_2.22.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva-initial_2.20.0.bb b/meta/recipes-graphics/libva/libva-initial_2.22.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva-initial_2.20.0.bb
rename to meta/recipes-graphics/libva/libva-initial_2.22.0.bb
diff --git a/meta/recipes-graphics/libva/libva-utils_2.20.1.bb b/meta/recipes-graphics/libva/libva-utils_2.22.0.bb
similarity index 90%
rename from meta/recipes-graphics/libva/libva-utils_2.20.1.bb
rename to meta/recipes-graphics/libva/libva-utils_2.22.0.bb
index 3bce9a1e325..078cd7ea0a7 100644
--- a/meta/recipes-graphics/libva/libva-utils_2.20.1.bb
+++ b/meta/recipes-graphics/libva/libva-utils_2.22.0.bb
@@ -14,8 +14,8 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b148fc8adf19dc9aec17cf9cd29a9a5e"
 
-SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.20-branch;protocol=https"
-SRCREV = "2ad888bb463dc9bfb3deb512ec9faf78f1d3bfa8"
+SRC_URI = "git://github.com/intel/libva-utils.git;branch=v2.22-branch;protocol=https"
+SRCREV = "1a13ae13382b7b548f3a7e8035e1d7df66662c0a"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))$"
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 486291bcedd..784ab8b79f0 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "f72bdb4f48dfe71ad01f1cbefe069672a2c949a6abd51cf3c4d4784210badc49"
+SRC_URI[sha256sum] = "e3da2250654c8d52b3f59f8cb3f3d8e7fb1a2ee64378dbc400fbc5663de7edb8"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.20.0.bb b/meta/recipes-graphics/libva/libva_2.22.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.20.0.bb
rename to meta/recipes-graphics/libva/libva_2.22.0.bb
-- 
2.39.2


