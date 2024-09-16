Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E88C3ABBF
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:19:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.127883.1726453186174571024
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sr2FJEbz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-206b9455460so29579375ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453185; x=1727057985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfU1ATu8YF/XeYDsAmlN1vIrMqYMHOtO44r1vZeZtaY=;
        b=sr2FJEbzDsXXX0jyVUbIvzrmzpkWKPMqjKOgxeLhKwTcz4qMIlIBx0rxVd56XNTxYW
         2RDHEd8bzl+dZJi+hXbN5GZf6Q34pIeFDkWgqvhk14VvDvWFgc4DvkXUzjsNalHqI/Mc
         TN+kVsNbxOImwRgZ7V6Nw3u7mSJWXcX8Wk5GSayZe55aR7bwooX2VXSBU9anp9rw+ReV
         tSGPETnOlFC1jl1A5FGqRLic8+1ObyNw8to0ud1xRifLvjPkUVbRZnchQwQ6f7cBuQyZ
         qch/N++JhgIdGKO1OzN1d8rnywLUWMzbm9+CoOFz0G6MbOVYYrPNOv/jyMcNAhB+P4O9
         xysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453185; x=1727057985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KfU1ATu8YF/XeYDsAmlN1vIrMqYMHOtO44r1vZeZtaY=;
        b=Vqy8SN+5A7MP0d0PYXBly/IyWC/AiOyW3Y8ZLZ55yoIVYNNTWoXCRaQcpawPlfsqkp
         EcmR9jckQqoA/K7w3vf3Cry22S1nP/7ooO4mx+VVp+XQtHXXRFO2ngxGWZXXMt0zZsGg
         2slZU64ag2kD2jJremBU87R2dE6tdVX5EYcNTHjYlkjF/qLWvGH9GyJjekLBPP7hgvQU
         s3vEoIKclbyFOu+w87AaLI8WQ7+13cT1s9/M1VcrRum4m+EByFUQ3lJXa49M0FAqOw7C
         tFZDhBkp+VLT+ZxvcfPqM1ctnKWZuZyuavAdqFQQarTlogoEAViLuanI6a2/RptvxZq+
         nvRQ==
X-Gm-Message-State: AOJu0YyQIK6J4kVODdTRSgQ/YV++JLj/i/Zcs8845IetZgpTbp29pI1I
	j25fMM3U10dU+R3G2UeN2Gju+lM6pjgmwkTwsw7Q1Upk985bY7YK6PjOCjqeB5I/joIiiIu9/bY
	ikcg=
X-Google-Smtp-Source: AGHT+IH9hUYlVJoY553sjZwgqxtfSxPdX4KFkF9cIWXZQN8P5B31Si7p6eA47Y7yQmHmSZ5XhOHkpQ==
X-Received: by 2002:a17:903:2306:b0:207:60f4:a3bf with SMTP id d9443c01a7336-2076e54e53fmr217469775ad.2.1726453185360;
        Sun, 15 Sep 2024 19:19:45 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794764144sm27698175ad.304.2024.09.15.19.19.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:19:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/11] yocto-uninative: Update to 4.6 for glibc 2.40
Date: Sun, 15 Sep 2024 19:19:26 -0700
Message-Id: <0a8ba360f111d379af436de86e0a990be02910bb.1726453060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726453060.git.steve@sakoman.com>
References: <cover.1726453060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204590

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b29bfd333dffe635ab67475dcd8d22ad8b114c84)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 657c1032f9..a6f7107dfe 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.39"
-UNINATIVE_VERSION = "4.5"
+UNINATIVE_MAXGLIBCVERSION = "2.40"
+UNINATIVE_VERSION = "4.6"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "df2e29e2e6feb187a3499abf3b1322a3b251da819c77a7b19d4fe952351365ab"
-UNINATIVE_CHECKSUM[i686] ?= "8ef3eda53428b484c20157f6ec3c130b03080b3d4b3889067e0e184e05102d35"
-UNINATIVE_CHECKSUM[x86_64] ?= "43ee6a25bcf5fce16ea87076d6a96e79ead6ced90690a058d07432f902773473"
+UNINATIVE_CHECKSUM[aarch64] ?= "c2d36338272eba101580f648dd8dff5352cdb4c1809db7dedf8fc4d7e7df716c"
+UNINATIVE_CHECKSUM[i686] ?= "0041584678109c18deca48fb59eaf14cf725cf024a170ab537b354b63240c504"
+UNINATIVE_CHECKSUM[x86_64] ?= "6bf00154c5a7bc48adbf63fd17684bb87eb07f4814fbb482a3fbd817c1ccf4c5"
-- 
2.34.1


