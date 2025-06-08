Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32AEC5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 12:23:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.36156.1749385378825558066
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 05:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TpUIVFJ+;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so43680425e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 05:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749385377; x=1749990177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2WxYovGd7OM/pp7r3uGaQ1RvOvu49ORNQ+R8LGYEQR4=;
        b=TpUIVFJ+FChOLDqkJ7vYj47zztr7OayeBm5+9Wr81KvsdcZCG5Od0lG500t39W+kyS
         frDlPt9VtgGX6D+3r4WzjhnPBR1tBAlWIkDbHlzf1H89lvGrC0nZ0hEKZ3jzpTpjXyn8
         KTjWeFTfqh8oGCRzCrIrEMC8QQpBvw2zTaLDCngsU/k4P+Yss51eEmWL15kRCoLbkUL/
         k2v/P0iXtE7Gckgs8HEhwd7xywjDr4x6LqrdwDpMnNwApCzOCguSzekN/7vIM2MBVfs1
         JG0Sql6IngBTPhlV9QYzGKdZeLucSCT8iVxr3BFbSgN9CGxo0GVD2dGNf010Zwv9l/qw
         XHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749385377; x=1749990177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WxYovGd7OM/pp7r3uGaQ1RvOvu49ORNQ+R8LGYEQR4=;
        b=j73HRwdaNncfrFY29Fj2GhPyM2KdZUbWx9G+8U7FpeoDx439eTtqnIMCf+zfIpCN3K
         cY8hou2Uf3QgTHDrzlUdSTlYKTFQM/06NjeoyaK+QurZA7fHAZT2MJ0/v3DrsTUxAvUa
         cESQVUkmpcjPuKGsJH4wn1YW5A0qMCHxpWmG+A3nNWWy0PV54VU8gDMzZRd0cjFCuOzs
         b2RkBf+OG93s483iv+lzdB9fBw5vKrPxHdqsCW1YWGzAmIIQYfEy6MRyF2o/+upGB3et
         RjLt9abzbDSdorTWV9/OTutWeRTdIlgOVZFC7swul7sPa4lsxOhZMnPGUmeuWWtPUngH
         6fiA==
X-Gm-Message-State: AOJu0Ywvd7HWqDi+eWWX31pkbvdeu32Dah8TvmOdb2dtq3CD7djoC9PE
	Id0boOFRk3OCof0YpudmmHzfa16twZDCI8RxRM5BD2mDGfRymsBagBq353bV3A==
X-Gm-Gg: ASbGncsy1X++PcjQ+g/HekNAXPizy7UasWPvhkD3wBZyaX/4vEUFEK2/5mkYIDhPFvU
	VBdkoq2jdsdZNPplVRam2B5aI/IsMB1qMfsNz67rquSYDp5xwUrTMdJ0msOVqUV0m4Ww1RTtUY4
	G2ydqLd6Wm6+CQUK2OTn7/p0oo0NP/dd29TKdq8LIRfPKuCtQ7WH4uWYBr8vihk1w1IGloQ3N6b
	97y+DZI+VZqwD89Cnjn9ZV/OIbQxXhG4UCuUndTHnAHbSl0YMnmzZ76rccR1cx1gYBYSFx3sr2H
	ALqufLsLZzQ2Vt+NMDjT+3ELmSiQTON5HXsEgaLNiAgNl1VrLnScIt3IqpXiy24sbShJ4SBzl/h
	3UCHitNBM714=
X-Google-Smtp-Source: AGHT+IGmFkC4t3xV/EnjCcoDKl8IV0IIlz96l4cO3CPjee/+X6n/ORvh0KJPdVbo6f+zrzXopghQmg==
X-Received: by 2002:a5d:5f4b:0:b0:3a3:727d:10e8 with SMTP id ffacd0b85a97d-3a531ce7122mr6977994f8f.50.1749385376696;
        Sun, 08 Jun 2025 05:22:56 -0700 (PDT)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244fd02sm6982004f8f.75.2025.06.08.05.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 05:22:55 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] python3: drop old nis module dependencies
Date: Sun,  8 Jun 2025 12:22:44 +0000
Message-ID: <20250608122244.3093502-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 12:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218217

libnsl2 and libtirpc were build dependencies for the nis module.

The nis module was deprecated in Python 3.11 and removed in Python 3.13

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-devtools/python/python3_3.13.3.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.3.bb b/meta/recipes-devtools/python/python3_3.13.3.bb
index 6839d28e19..11dd6f4b8f 100644
--- a/meta/recipes-devtools/python/python3_3.13.3.bb
+++ b/meta/recipes-devtools/python/python3_3.13.3.bb
@@ -72,8 +72,6 @@ DEPENDS = "\
     bzip2-replacement-native \
     expat \
     libffi \
-    libnsl2 \
-    libtirpc \
     ncurses \
     openssl \
     sqlite3 \
-- 
2.43.0


