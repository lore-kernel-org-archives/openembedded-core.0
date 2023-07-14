Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C19EB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:58 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.831.1689374028861027232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Cu+CWhfe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b8b4748fe4so15165495ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374028; x=1691966028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilgUWe+Bmiu4fizUqgcDZkBsdfVcNdL4FLOOIc1J7eE=;
        b=Cu+CWhfeiQZa6xdJy5MHM7PTnsO9PKvlBE/GfrixAGLrg0NGGZupN0UwvjLM6iOrAu
         mue9S55cBxfcrizUt+EEsHKQ3rGGf1HckfY+efBxP150vaYeGdlMLBGBB/Cecr+dPmdE
         mKRPo4Xkzo44Q0ukrcBzs3W9zIyAjZX5L0atEBjCfIaLTs2RY4YRgYmITXImMpTdC/du
         hp7VmLG6IUF8Tc26kJKpY/+cVEwUwiuSyuXU/+XwIgXZ8+V9oiokpxA9dcsFA5nkU9lF
         UeUH4l+se298HhDqipL4NL8K4E1O8mfxx/J7BZ6t5/QIZEYG3OVaNsGjMg9AOKawqni8
         JqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374028; x=1691966028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilgUWe+Bmiu4fizUqgcDZkBsdfVcNdL4FLOOIc1J7eE=;
        b=SsPLPZb1HFG0/ke3xYZPh2UOswG76jBH7/tNUfna9/eeuxuQ4aNmONBQhcmF5nyPTf
         y5b6Vl7uBTbgAylkNWQ9+DR5cgYcmAr6pj94QiliJzDslUYkq3pYJ7sEno82IAt3r96c
         fKDgUhaxvT3UbUc5YpOgrt8Zu66Jtx/spgvzgEuUhVW9F63lQ3p5Pnv+zLS1BIp2bveo
         4XMQrFBlVgIgloKNDJK8A2UTJY93FXLXcD3eGYcP5nEjWKC76Zmj4k9nB0W049uugNi+
         7xx4sgaQrxXe8sl+g0NZCPyHbyhdGFOLhRGXvMZpu0f+Li9uCbAj7WhBotn0Mc3yIlUd
         YqWw==
X-Gm-Message-State: ABy/qLYV1n2ZhjC5hvSzfztEchFCthnm9BqkLu3R8PbbZWJeHC6RQRqd
	wABS/JkaTYDvJqPWy6sfCFZyl/QcVfJ3M/X30n0=
X-Google-Smtp-Source: APBJJlHRGKaWhqxqBa0ZnQLn+DxY5tOmL/TWOyzFRA72olLh73OuEhmWT1MBhSlt9wAsXhtmyfkGjg==
X-Received: by 2002:a17:902:c1d2:b0:1b8:a569:f980 with SMTP id c18-20020a170902c1d200b001b8a569f980mr4454568plc.65.1689374027803;
        Fri, 14 Jul 2023 15:33:47 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/26] libxcrypt: fix hard-coded ".so" extension
Date: Fri, 14 Jul 2023 12:32:51 -1000
Message-Id: <06f8aaf8ee03b07f79e1a17708b5946782e389bd.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184299

From: Etienne Cordonnier <ecordonnier@snap.com>

2 issues:
- the .so extension is hard-coded, and therefore the libxcryt package compiled with
  meta-darwin is empty, because the dylib files are not contained in FILES_${PN}
- nothing actually produces a file libcrypt-*.so (the symlink file is libcrypt.so, without dash), thus
  defining FILES:${PN} manually to contain libcrypt-*.so has no effect.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ed6bfa2428b4f1ba7f09d6e9e67c462ff355153)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 61b0381076..454a55d73d 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -17,12 +17,6 @@ SRC_URI += "file://fix_cflags_handling.patch"
 
 PROVIDES = "virtual/crypt"
 
-FILES:${PN} = "${libdir}/libcrypt*.so.* \
-               ${libdir}/libcrypt-*.so \
-               ${libdir}/libowcrypt*.so.* \
-               ${libdir}/libowcrypt-*.so \
-"
-
 S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
-- 
2.34.1


