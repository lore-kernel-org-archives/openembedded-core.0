Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C03FCD98E1
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:40 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105041.1781424212936160601
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EhluRlLy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b7866869so23584385e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424211; x=1782029011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODOC+n0cW6T6dFC7xNnwlyKlZkS+CmISoDaKdaWlXcQ=;
        b=EhluRlLyRj7LZdNs+36/YeFtLOPNvw+HM54wzOW8lChSugLLmqgHrJulyVsqM8B6R1
         qOD/rFt4XpACQb9Fu2qk6ojZyMxR1L3KcSzYI+82nR0zWop7vpK6PqcALnUX6uJz0u8j
         LCn9szLd1iU+cLDMwFdfEwLvplXVjx6WaYJk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424211; x=1782029011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ODOC+n0cW6T6dFC7xNnwlyKlZkS+CmISoDaKdaWlXcQ=;
        b=BrPh2nZo5dX+hKY7CqKb/lqp9vf6K/kPKooqSLV2zunhemkmRSvrQ6oufOatrUspbn
         a52caShcbPkr5rMUWeF8JlH2ilh8EIwlQYKI7duGxVjhfEinlcqWVLyyNCJA2HJUdZgx
         t8XMDOfTdS3UtXwjGIK3aJGzaW4ACQzXkZaCSu9Mbau/dERyPpFAo/NVqLCsTthWbXDN
         6VBd0fZA7tkXu3gWJCcfwlJoEQqPDJKXoZ5mKuhxXzwu4/WgL5/1NNXn+h5NZhPOxNLZ
         6I5vi+cL3yqz17o/20oN3HjwyQlewec6c+Z7ILecEwgmfqzsmQOulE5N5iCqTOwxoZ3G
         RMhg==
X-Gm-Message-State: AOJu0YwqfPNwdjHZUPSM9M8+GPNoUerLZY6fn61uPTEcgP2lEDIFfRWs
	JsdzxAzpevXSFsLXGzQcG1s2v1WRzYudvVUiJ7B5o34FFBuxSOxPbZ0nQ5quYvA61pGxca/rkCz
	Lr2JG
X-Gm-Gg: Acq92OHrEx/NlTafZZMfdZaoZcYahLwstDy9ScnsYSDU+3BVaHIV1mUK4K1YwPKz6iT
	vQ3o598PKn5ZxpsIO/Ldl+likKXNdqlMvy8vwHJN37ZYzCaCs6WmeK8B/zgax3lrKlaRnyPwz0k
	/cxSvN+tdtpwOFUldKWjGWaiAJ1J4ZCyLIUFIlENIiRtZrmK57r8NbAsI4WtmBa5PHQ50au/3I3
	svgW/bmS8KwuoyaHWxGqFxWImQG0zMpjX/eoK59Oj6TBfhZN6MoGHNv+grz2VZ/wkDAg2/TSZ0Z
	ctE5HsUk8dVo4DnQfdAT7eU6mbs1e0Q5WwVMapF+I7ZrwWpIaQAatQeFYU3Yx/+ckoRyvcM2BfB
	cuErejiLSyAGXq+3A4Mkg8CTQvGxKzmF9dL6d8zoISAn8mQMO4HwKYYwPMFiZNA28qTqf4cVHqa
	OBt3JadPuCSlt/EB67h0cVRnkO6lnfujIqY9sXuRAuFEFo/B7ghmwn
X-Received: by 2002:a7b:cc8e:0:b0:490:b0e1:2161 with SMTP id 5b1f17b1804b1-490ec4c1396mr83316955e9.2.1781424211238;
        Sun, 14 Jun 2026 01:03:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/56] glslang: upgrade 1.4.341.0 -> 1.4.350.0
Date: Sun, 14 Jun 2026 09:02:25 +0100
Message-ID: <20260614080307.4017177-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238698

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
 .../glslang/{glslang_1.4.341.0.bb => glslang_1.4.350.0.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.341.0.bb => glslang_1.4.350.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index 150242ce1d8..d74f37db91b 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From 6a4237802d8a79f65ed74b12865e2ce5b666993d Mon Sep 17 00:00:00 2001
+From ee46f2f608ccbe9617ce41235d047f080d972ff7 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.341.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.4.341.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.350.0.bb
index aa4f48bb9c3..bc33931b3c5 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.341.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=50ff9d0fcde2d5b953ebe431c48e34e3"
 
-SRCREV = "f0bd0257c308b9a26562c1a30c4748a0219cc951"
+SRCREV = "275822a6261ee689aadb1da5f09a0ec2f058685c"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "

