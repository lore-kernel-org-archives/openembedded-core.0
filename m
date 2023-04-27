Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B4FC7EE23
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 05:21:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.13596.1682572863473668997
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 22:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WZUt/H9k;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f09b4a1527so81884955e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 22:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682572861; x=1685164861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFd/u77cDpQ/254hAqQuFvN4En4E30r9dIjLiihS64Y=;
        b=WZUt/H9kag95JF6PLY/bbMVfvQiCxEOOKfrGxlQd7eP+KJXTXwf/fj2gxCZAkL0vua
         F0JHAsTL68UBIttgM3zjQQ/HPz2IshsW/2CpnQyrXurELxFrvhfcHx6KSTpdviiPQdDI
         hufLxXqSetm5WZh7dXfWeQohmGNlcYmGMTpFoLLWwCH0QRbb4Opdj3iaxu6VGQhfsOc3
         ZXqGsf7c0PBxdujkcZ+RZ1JclQJp1EAkr9j9cOtiVHtZpjj0mD7/g8EbYSRCBUD5gh/m
         etDJlbIb6WE++9XB3p2IzcWYXKmqFFGC1u6Bk7I1QJtW3KbDpllLrYOG7xM2B3xY9sl0
         361g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682572861; x=1685164861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFd/u77cDpQ/254hAqQuFvN4En4E30r9dIjLiihS64Y=;
        b=KkJyt+2zcNTziJb+kq7R2Rf6HDqMkhOlP+X4AHbRY+lGzeNUhWGM0TC1S0QVNCl1JR
         H+AwkRapTtO9WKrDF2Pj2x/JYZlhnnENUd2hALV69YJEYbQfg2lvgzc9usmpMWCzK+Dp
         a4GsYPAGObA2Nypp27V4SStywLnEu1G3CS5x2uX1k8U61Q6N7wllHlluOWRy+XqVomGP
         BkJBe7r9Pbdxh6V3rhp6CqxLe9HK0x4ZG3dMw4S/HePrZXPFlnFDXkQJ7g0C7W58v7P6
         y6/UmR98OD0Pq5j1e9x/8CHTVhQQMT/BI2jZNxOhrVOw/7e3DAq/PmKDwBR+zD1Lu24i
         l6zg==
X-Gm-Message-State: AC+VfDxdOJl46bnwb2nUu/5HoRQXSeDL4Kgag+gp8aBP/9bbaFs4z6BM
	jc6pA4tOM0fIFKHSxxP0+vOcl3dVwfg=
X-Google-Smtp-Source: ACHHUZ5CJNkEOPyU7r/FEy1wPXqdCypmClPBg3om67FKRgp9VCPRjfTIwbUHSuWhSITeXoHRSSfR0A==
X-Received: by 2002:a7b:cc94:0:b0:3f1:69cc:475b with SMTP id p20-20020a7bcc94000000b003f169cc475bmr399168wma.36.1682572861475;
        Wed, 26 Apr 2023 22:21:01 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:e2ba:a159:c9f4:28dc])
        by smtp.gmail.com with ESMTPSA id jb12-20020a05600c54ec00b003f17003e26esm23240809wmb.15.2023.04.26.22.21.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 22:21:00 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCHV3 2/3] python3-bcrypt: enable build of unit tests
Date: Thu, 27 Apr 2023 07:20:55 +0200
Message-Id: <9108a98c81a8a351007a4621b1214e6ec2656cd1.1682572703.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682572703.git.frederic.martinsons@gmail.com>
References: <cover.1682572703.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 05:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180468

From: Frederic Martinsons <frederic.martinsons@gmail.com>

The source code of bcrypt extension doesn't define any tests
but it is to show the ptest-cargo usage

Below is the updated test suite output for the recipe (cut):

PASS: tests/test_bcrypt.py:test_invalid_params[password-$2b$04$cVWp4XaNU8a4v1uMRum2SO-513-10-ValueError]
PASS: tests/test_bcrypt.py:test_invalid_params[password-$2b$04$cVWp4XaNU8a4v1uMRum2SO-20-0-ValueError]
PASS: tests/test_bcrypt.py:test_2a_wraparound_bug
============================================================================
Testsuite summary

running 0 tests

test result: ok$<2>. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.01s

root@qemux86-64:/usr/lib/python3-bcrypt/ptest#

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
index 21f2eb6ba4..b4f245530d 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
@@ -7,12 +7,14 @@ DEPENDS += "${PYTHON_PN}-cffi-native"
 
 SRC_URI[sha256sum] = "27d375903ac8261cfe4047f6709d16f7d18d39b1ec92aaf72af989552a650ebd"
 
-inherit pypi python_setuptools3_rust ptest cargo-update-recipe-crates
+inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
 
 SRC_URI += " \
 	file://run-ptest \
 "
 
+CARGO_SRC_DIR = "src/_bcrypt"
+
 require ${BPN}-crates.inc
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.34.1


