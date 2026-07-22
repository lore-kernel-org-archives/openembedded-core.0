Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7454DC4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:36:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44995.1784716585407972591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=faZfJCaI;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f6de72faso40990315e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 03:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784716584; x=1785321384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D18I69B5mOY4SuOMKtnXI98xvmPLHn5+GJrsIp7l8eM=;
        b=faZfJCaIiSuo4zoeUS4Q+QC6yYs8TcjLCQ6D1OQgBlQ7XJtiUSgJRuFJ9CI7D/80h+
         vISatUnI5N+nOmZ9Myf/sNnJLOmELRTJ+EP90xhO5PaDq8pp9JdB0XxA5OWijZEx65g5
         hcal7A9C2jukk3Wx8J0FJjLNvMUrzlrkdTMOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716584; x=1785321384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D18I69B5mOY4SuOMKtnXI98xvmPLHn5+GJrsIp7l8eM=;
        b=Q2TNe6Txk7YRdyn293Hq6cZBe9ZGOeQpfc2yDNJcBAhwqiUW0DpSsy+FYmlr8gC5ax
         7YSvjqzMISOoiHLzNVWHh44wLRrKBXaCxF+XqIZfgjFTFNszeZ9srx92Nt3M6V4L6d2b
         nLZnS24Cbyl2u6bnhdSgF1z0/1BWAddDoKlqDIcZCFcTDgFujwod0eGp8YvVU2TDFlgE
         U1dqkQZkaz1SX62ZLBejA+FqV2AOyqlL+eGf/yu043cAhVKplJqbOFeBwrIwGGkvbSFW
         7n/5qTaBHGiZjMM4ott+qFqQ5HoZqHFrW5bbUD+HoVtvZ54Om3NSln7Ah7dTUQ4/Wci1
         clRw==
X-Gm-Message-State: AOJu0YzR/QJzuAcR6SRUGO1heYMJaQDTqwJWnf7KttWUbTEFaIJrBAXb
	qbH0jX8G2+5+5gWCM+hRYqhrFAUza9K10GHW8b+GAyIsVAH0KA1xDRjM6HyXXAv+QwgM5JnToU2
	UcRUB
X-Gm-Gg: AR+sD12CBUN9n2DhvoAN1rPlpqnQunwCDM8SDxGUBHoa3n/N19x5kGzidPs7JzQGzsI
	0i3wj9ppQHnPcsWgb9/dfI5oE06znV8EXtdMsxDI0CdBn35xloF16c2+1Cx2OgXV4kyhm6D4RrJ
	X1lAkipGMb8E0XvsC0XqCLPsOJE3i0o+3TszGgfVahgaj/19sShl9UzZoBqYCnwEF+t73rfV+X/
	zYgjspv9t5GtttyKEm9DT8uOAIuOH+p0M2Nf36JJgwraOSGVrMUP1j5ZkLMwZ1f5O5OJcqG80Y7
	kjdBRhGaixFS8ek4o03e5SaA6JWqvcsikd2e0iDRgwzfex5P4Ds2biVrm2SZ4KDscF6b/yzkx3R
	QhdQffzU5wwGK2RUTWmizfD3hU6NdX3MkLr4l/ofwc/zF0IVCAxJrSHM+30MU+TCD/joW3BBOwD
	kAcxQQre3Wv5oWWCmasda7+k9mkjVYmKuCRm7/1ubRbuFgjiKzXiieLlDg5jLYRyocSoS3wYRBj
	U1y/Cud9OxgVJDIgJsxKJMCgWAiyNw=
X-Received: by 2002:a05:600c:3b98:b0:495:495f:bc30 with SMTP id 5b1f17b1804b1-4956a4fff26mr37280015e9.12.1784716583661;
        Wed, 22 Jul 2026 03:36:23 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c7desm197275745e9.7.2026.07.22.03.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:36:23 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 1/2] python3-chardet: Upgrade 6.0.0.post1 -> 7.4.3.bb
Date: Wed, 22 Jul 2026 13:36:19 +0300
Message-ID: <20260722103621.1810876-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241656

Upgrade to relase 7.4.3:

- Fixed ValueError: embedded null character crash when input
  contained a <meta charset> declaration with a null byte in the
  encoding name (e.g. b'<meta charset="\x00utf-8">').
  codecs.lookup() raises ValueError on embedded nulls, and
  lookup_encoding() was only catching LookupError. Also added
  defensive ValueError catches in _validate_bytes() and _to_utf8()
  for completeness.

License-Update: Change 7.x license from MIT to 0BSD

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-chardet_6.0.0.post1.bb => python3-chardet_7.4.3.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-chardet_6.0.0.post1.bb => python3-chardet_7.4.3.bb} (61%)

diff --git a/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb b/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
similarity index 61%
rename from meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
rename to meta/recipes-devtools/python/python3-chardet_7.4.3.bb
index 0ca0aef3ac..30c44c6d7c 100644
--- a/meta/recipes-devtools/python/python3-chardet_6.0.0.post1.bb
+++ b/meta/recipes-devtools/python/python3-chardet_7.4.3.bb
@@ -1,9 +1,9 @@
-SUMMARY = "Universal encoding detector for Python 2 and 3"
+SUMMARY = "Universal character encoding detector"
 HOMEPAGE = "https://pypi.org/project/chardet/"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
+LICENSE = "0BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bd0753b9dc12e5e3da3047778fcf1dca"
 
-SRC_URI[sha256sum] = "6b78048c3c97c7b2ed1fbad7a18f76f5a6547f7d34dbab536cc13887c9a92fa4"
+SRC_URI[sha256sum] = "cc1d4eb92a4ec1c2df3b490836ffa46922e599d34ce0bb75cf41fd2bf6303d56"
 UPSTREAM_CHECK_REGEX = "chardet-(?P<pver>6\..*)\.tar"
 
 inherit pypi python_hatchling
-- 
2.47.3


