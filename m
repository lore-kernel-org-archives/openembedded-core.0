Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEA4C30658
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 22:29:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.37312.1719959354437457274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 15:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TluqzWfZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42567ddf099so33138785e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 15:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719959352; x=1720564152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ClHL+0AFoZVAyMUxkPhAzjVVhJPuUzllYuTqBuOdnyA=;
        b=TluqzWfZY0dxGm49mgbniCbyy43mi59nEAvFd5oMraZEkPMPqj5Q7b+EfLR9tKm+YU
         dO7ctVICQPXfhxpgjlwtGvZ/PfiAx/aYHkrViR5QwVyYwknybGBULoivw8/zitSmWQkp
         LCCTPkG1rXDeadSmhcJzsBJr9x0d/K+Ie3rkMHeGGIHWOeOcrEJsDkgN2lmaq/LwBmjC
         rpNg9AATyhdrSU1SSlAULLtbTj1HCey/2jSTHnTVwg0gsS/piDLuZi3S0hfkZETBut/M
         EUv/93C2bhtYZ+AgTFR2+OIUSB3qtfDkgGjRkjYGw2zBWLiRzXiAxsegbsY+P5eVwL69
         6fXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719959352; x=1720564152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClHL+0AFoZVAyMUxkPhAzjVVhJPuUzllYuTqBuOdnyA=;
        b=E8pa8MAEw7wHkPct2SvOa5VCMus0Qazpt1dP8rOc0GUs+mZSRvgNOApURCp6qOSnGM
         bNafdn99zbVURs2/NYP1uu7BVLZMMoW0EoL3+Mn4Sku7S+loQ4vi2JBTsLXOLvi88c8a
         kA2xF32EXhBJbMXTcvt/hnYL1kbkcc7h1gVLPUQpz8ZkdjJBKkRYSPusmIZ8fOFca4+Z
         9nl8TKHjfrN2BOFIQO8gVJyJm2l0R1dCZummNZj+Bj8uJbX0TGN9UIu+lqlvo441/nil
         UB18U5KkholU8dKJw6hi7Zyr4thi+9b9FICqNOX/KhjHA7dKzcLICF3QURS58/COOwJ2
         shdA==
X-Gm-Message-State: AOJu0Yx2UTk7GjCbm4/5Mf4dVDuAP8SQd8qF4Z48kHNkGL+x3vXhMYz7
	y+DkIQ8QVgbOswdOk/jEqXRHqYjHnrMK5D613pFyFO8NEmrisdRu4prJ+VuW
X-Google-Smtp-Source: AGHT+IGTiWmRZDurYmS6JMGYdbQV+zvwQNCA93HAvpN227n9yUgXqytnh3D1dRGzd8nBoBKo8AdK/w==
X-Received: by 2002:adf:f5ca:0:b0:367:91be:b12b with SMTP id ffacd0b85a97d-36791beb244mr280674f8f.40.1719959352165;
        Tue, 02 Jul 2024 15:29:12 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd687sm14369130f8f.14.2024.07.02.15.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 15:29:11 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] python3-requests: cleanup RDEPENDS
Date: Tue,  2 Jul 2024 22:28:33 +0000
Message-Id: <20240702222833.3826-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 22:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201444

Drop the following dependencies from RDEPENDS:
- python3-ndg-httpsclient
- python3-pyasn1
- python3-pyopenssl

Add a missing dependency into RDEPENDS:
- python3-certifi

Additional fix HOMEPAGE, the old link doesn't work

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


