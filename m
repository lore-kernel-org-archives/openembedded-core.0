Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4606BC3DA40
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:46 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.8896.1720096062344043481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZwbsYcmY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fb222a8eaeso4297455ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096061; x=1720700861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neu8BO15xoMs1+SIEqXisIFm8p/2/lrQWHpiKtJKVh8=;
        b=ZwbsYcmY+6lU2IUjajbFLNZM+INgo6T5YjCHncgK/U3r/zbdY20PihY/+LPUc7oPO0
         migeVhiti4suzxCZI8mz08hgMcCiehG8VsyvN8TCeMz1EFYD3cj2ZgxrJpsEQss3TlEx
         O8QZxNLw7EQbLATwEbsCt3WCSlSqiwLXFKaaULuFOAbDDHSX4W/wkxdr6Wz1L/EERGUx
         LojnK/fLtA23qRjv95n+ScLuz5KeTJ3EM1Vql7/RJvJEYsHRFYJ3f2iqylbAZSw1JteI
         nSXqSyjc3oM46GMThHoESQ9sIgM9ci4p4XumpGX/HyEoWqcdIINNUhwLbcQiQ7ra6WaL
         vQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096061; x=1720700861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=neu8BO15xoMs1+SIEqXisIFm8p/2/lrQWHpiKtJKVh8=;
        b=SIdOtE/8Pzuhp9YbdYBum/n+O9+/plAOzK1y9Mq3PIJ1hUnxRMsV/M3whskcdOju0/
         xhrj0XqSMd+sNYMd3MJOn9IoRHZ3GCqmESaAIaE2kfIL53z7ugEVhjyN1QsZGYFmJmRk
         l9/eTtPpbuXY3dvz/BbfztKBD+QgxaNcx5WCMC+ux34OSwfEjzpDISCyb1qs4nzh40OH
         HmkMmhujn3xlUyjEHtVgVVru9U0o73YWcFoDWuYV0Ht87T+QOJzms8aG1GCxr4EkK8SM
         Ye65PcySqF9hToCSnk1FhbKH4dvTYkCVZjqfDwXMQz3oyf+qjukLCKIqAyRrUFSG+Tef
         sXeg==
X-Gm-Message-State: AOJu0Ywl+g756I8gyl1Fyi6W4hFdGnyhnLBzYTS51RV5+dN3OveLR5Be
	mC4bI19dA2Qi1fs6Sp5oI0/jfuZ8Ze5MGixOXw+vfwyzjR+G0vSDlCU4K10D6ETVufJwTzRF0Wt
	r
X-Google-Smtp-Source: AGHT+IF/K/IlMvoRFxVZUWbui7Pr05+kGKQII0gMFVT17dc0xaGcBJAPnbTCdlz2BhX66fvl4I0w1g==
X-Received: by 2002:a17:902:f645:b0:1fb:1cc3:646d with SMTP id d9443c01a7336-1fb33e57fb8mr11853075ad.29.1720096061532;
        Thu, 04 Jul 2024 05:27:41 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/21] python3-requests: cleanup RDEPENDS
Date: Thu,  4 Jul 2024 05:27:03 -0700
Message-Id: <3d9072c346bf7bdeecd6197df8b14e39399bdabd.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201553

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

Drop the following dependencies from RDEPENDS:
- python3-ndg-httpsclient
- python3-pyasn1
- python3-pyopenssl

Add a missing dependency into RDEPENDS:
- python3-certifi

Additional fix HOMEPAGE, the old link doesn't work

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-requests_2.31.0.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-requests_2.31.0.bb b/meta/recipes-devtools/python/python3-requests_2.31.0.bb
index df48cd54c3..287b4f8eee 100644
--- a/meta/recipes-devtools/python/python3-requests_2.31.0.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.31.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Python HTTP for Humans."
-HOMEPAGE = "http://python-requests.org"
+HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
@@ -8,12 +8,10 @@ SRC_URI[sha256sum] = "942c5a758f98d790eaed1a29cb6eefc7ffb0d1cf7af05c3d2791656dbd
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
+    python3-certifi \
     python3-email \
     python3-json \
-    python3-ndg-httpsclient \
     python3-netserver \
-    python3-pyasn1 \
-    python3-pyopenssl \
     python3-pysocks \
     python3-urllib3 \
     python3-chardet \
-- 
2.34.1


