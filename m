Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BD6C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 05:12:00 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.17625.1709183519915756123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 21:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MtNOX/C0;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6de3141f041so356909b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 21:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709183519; x=1709788319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tlFbNBE3n4qtx54ZWSUNsgmU8Aw7PgbJbXiXscaQa/o=;
        b=MtNOX/C03qmif5sL6ofZN1bAX6sLAeXU1vfiXDYyiOOeHQA8bm2qIFpcCY9jCiKoS5
         fhbDMYK5ecq+7IDOdtQ0OHsjlcR0snb0TDQCFs7Sa5fcAw2+uFngB6Q3+Q2kDOSGEaZC
         hLIRpfsjMy3boB2LXXcs6mqDI4KFIS4iipr1ZPQfFljbC6kdO8ARXtvwKjkGvfVl01u6
         Xdaj2KajR4wyLnV5DrIjogIZxlkmYK/Hu1cTvBOTFb+NGcVJnnTrPR9cwz6IvgmwGFNj
         LWuacuI47XhaWnCexvv8uZk8aK2qbt6ek7oVgeZJ9qaxPOkbdoKFZyNicofLaohHuQsb
         jAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709183519; x=1709788319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlFbNBE3n4qtx54ZWSUNsgmU8Aw7PgbJbXiXscaQa/o=;
        b=b84XT/Zp0M5nuHAXMwiRehYvsXTLe+8GLnlWdRE7y7N6aOw9pPA3bIWgF8rx9YyPdq
         xV2SrvwI0eISRKzHS/FwL52gAu53/l8J+EJxKMHiRMoATHF+mJhLbtG5qDI+oDRESgU0
         lyMQjooZ+AWC64YHVyznYh+mzPCI1T9zqhMbpXqU06twZ22mNHyV29JezsPGtAF8IKue
         UzyvpOCtueEt8F7ql5BuJNEG206Lqi0e3H7ffqDkQyEAHJES+fRrgs5g1n5qXTTarQ1I
         XkbMjfRL7LOh2ND8iDDZqdg3Q7BjgxTARFoHf1GVKKscvMO0f+islQflSl+elCKbbiXZ
         yZBw==
X-Gm-Message-State: AOJu0YzT2Rw73b9BRHODYJDEm9+JyaqqEuMmvg/dPlIVP2KxKwDqVTGn
	uXdORpWcmp5VjXJiPgyLyG9GuogfZAw8Y2IITdf4IJqbH+q0MX9e+hJCbY+p16o=
X-Google-Smtp-Source: AGHT+IETXiZ9+1RgrUe/73mPmIdLJH6o5aHvy7/N4p6rkjjPej9TkxRp49QyUsuYbSTSY2w093y3JQ==
X-Received: by 2002:a05:6a20:8f92:b0:1a1:14f2:4b70 with SMTP id k18-20020a056a208f9200b001a114f24b70mr1100747pzj.22.1709183518960;
        Wed, 28 Feb 2024 21:11:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9a3d])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc8d6a9d40sm368304plx.144.2024.02.28.21.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 21:11:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Update to 18.1.0 RC4
Date: Wed, 28 Feb 2024 21:11:56 -0800
Message-ID: <20240229051156.3731622-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 05:12:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196412

This is last milestone before final release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 40103a94aea..111fb07fac9 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -24,7 +24,7 @@ MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "0d656f0f12d447ac0e197618a0d25495d66388d1"
+SRCREV = "461274b81d8641eab64d494accddc81d7db8a09e"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
@@ -148,6 +148,7 @@ FILES:${PN}-bugpointpasses = "\
 
 FILES:${PN}-libllvm = "\
     ${libdir}/libLLVM-${MAJOR_VERSION}.so \
+    ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
 "
 
 FILES:${PN}-liblto += "\
-- 
2.44.0


