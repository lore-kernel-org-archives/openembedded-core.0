Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70728104BFFF
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 10:44:08 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18242.1773225846340552521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 03:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YY0k/6qi;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38a43f1f978so40660761fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773225844; x=1773830644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=COCuCtKjxHRPbjkjpCXHwnc0NIFgfffDElB2Z1KmpVQ=;
        b=YY0k/6qiLYiCJDNDZvKp8cc+UUIosf5mCbz8PxKSqMv0UhWIf6gfvarjBzP6aO+jwK
         m9U6HW9oTCwmglkMwPO76/oeBkqSrtE8W0nEI3zQvd9lTKwfW7OUkMQw0xv+5a7KLIgp
         EBsvN4VkAp4RWDF2NutHkHMFgPwuzDOhb3TdrMOiZ8zjJuTbd0hxt5DeeKjP6xuEUqCE
         jmNOJeiyS1WE2KWVMyiuG04Pa7qL5kKJMP7yuN2WjNEMpdi5gatv+7szy7q0D5S9bLRO
         3si+KBD+sJG+1NyMiAzMbYRSLtvieEyU6+BF+gLuOJUJWqzSJfIMINoEUn+bsKyHq02f
         kMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773225844; x=1773830644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COCuCtKjxHRPbjkjpCXHwnc0NIFgfffDElB2Z1KmpVQ=;
        b=sMhBhZYlv4iVZFNybYNrTrpOwKAEGpLSnjlzho+LQqOZanIaFn4sUKE1uM9I8D6K2m
         Mi29DUXT+HHypEJSSdLmLo6tcE41KGsvb3NIJ29ruKGQwB0N7lCgrmbmKVcoHgoU1L5E
         KJcpzq1pb8LG8u7lxDxExyccS/9GXHZRjuvSmxtLaFJvdDgDMC0hyvidTM00M4Yy3zeX
         B7fSkJBflAK9UFAGCBwmEZ0rn4RkWLHQ9IkX74H020wRHqHIaBfILxlduOHPqNkLO3T9
         9qBmEqvW1p/PVks8fUM/2ltFcE0WgLBdw4Fa88NQaOq8fwiATEiNAPVHBggndIHVef8z
         EMig==
X-Gm-Message-State: AOJu0Yxux8rFqOGNJckTTyBcCt0Hjf1LH0dr3SurUJrdqf3EyUkZ3Nv4
	x0gE8pVMLBVNWzuMWD/BySOLYmLym4OMuSIDLmXLsGNJf0fCi4vGYjmLZN6+bw==
X-Gm-Gg: ATEYQzz1mNDPFL8JF1d+opYz6stmuqAbpGBqncJwSlzqvKlXqPT+ZRg+QvwLZssbJMl
	HDpLIYQOKLPC+nPiIfcobMUGtFe7oFrYYq9w6PupuxytAzWyvcmhWPdeRTNPOX7y3qeAEOXPkCt
	nr454Pf/3Vnq1UGowiVPKOOYc2lzZuoykS258De17MFOqc1+ik5zWfzOS2wi+nGcJRB4u51Yk7U
	/ki4OgBTsIfv0bS2/RROXdw8r5HuYWmc0AiLBFMR1dg7okqf6DDdDcMfZPhqIeqjQoltQVBWofa
	o5PCA7eIDsP87Q7YONGZhyCJOz10kNK+SHP6IkKIHD66llrPVRFMUOhtgJLQxIvXXZZhqg5XqF2
	kLNW7m+82qKEpXzHpZ7fZzVFWKANCDGhtn42ZE4Xw3yRGdrXE2PKbl65fGM9Q7TvYr//rIX3ZgL
	2QSU5vdWD17HbKEuN+hYduPfRx43vzq2fAdIKUhqsWaszrtGv/u/C+H/8COvv9pyxxiUSO0b6Mh
	U8eDv4rEGBlXrugUPm5NzFLJght1nPwjyU=
X-Received: by 2002:a05:651c:510:b0:387:1836:e7a3 with SMTP id 38308e7fff4ca-38a67dae1bfmr7519591fa.5.1773225843499;
        Wed, 11 Mar 2026 03:44:03 -0700 (PDT)
Received: from peterliu-precision-5680.emea.group.atlascopco.com ([2a02:aa1:165a:297b:4b57:eb03:87a4:c70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6f268sm2840331fa.36.2026.03.11.03.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:44:03 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] rootfs-postcommands.bbclass: use DATETIME as system timestamp
Date: Wed, 11 Mar 2026 11:43:59 +0100
Message-ID: <20260311104359.194321-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 10:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232864

DATETIME is being used in BUILD_ID and some other places to mark the
build time, let's use it as system timestamp, to have a consistent
system-wide timestamp.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index f0c7ee658d..43001e09b5 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -424,11 +424,12 @@ rootfs_update_timestamp () {
 		# Convert UTC into %4Y%2m%2d%2H%2M%2S
 		sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`
 	else
-		sformatted=`date -u +%4Y%2m%2d%2H%2M%2S`
+		sformatted=${DATETIME}
 	fi
 	echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
 	bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatted"
 }
+rootfs_update_timestamp[vardepsexclude] = "DATETIME"
 
 # Prevent X from being started
 rootfs_no_x_startup () {
-- 
2.43.0


