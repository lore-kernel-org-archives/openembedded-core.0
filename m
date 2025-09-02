Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF84FCA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:47:00 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.89799.1756849605261863141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iqIJoXhZ;
 spf=pass (domain: konsulko.com, ip: 209.85.210.182, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77252278757so2046604b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 14:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1756849604; x=1757454404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RmQ6QP93e8goOGrLeLcyMaBDc8JAkdSQvdK1mdMGUM=;
        b=iqIJoXhZX51WpZxRg0zSxUP3aE5Q8WXtWPW/3BVrFHQMqL7JXz9BaGZGpBW/bv+8Fu
         z+O20IvQsTopkRIw43gcof4nsQqOt6oiqs+q1j74ZKyYRm0psw2D48lhe9S9g/Cz6eFw
         ufqN4YKx+DpLF2VeT6cwtY0/NkUC0DJZyJH/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756849604; x=1757454404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RmQ6QP93e8goOGrLeLcyMaBDc8JAkdSQvdK1mdMGUM=;
        b=imVKIX2n1d84JyxcW7A1meksUFYZJnHVb751/6w0pTxMagxOhahBx01C+FQqSfJTKM
         XQgOt8nxZkOIctulQbWxHzeT8T+rHwzGnUZVqw/GNdj9VP8yvKGldJMaLRvu+UWoaFvw
         QL2r/+jVSdRKjAB7tnYRfPAjm1wnKqg3ML2DMw6+ySWmL4k31KCcqv5xrudbcKGWiJmD
         7p3BfznAjtxbgL7iGDWZ59o9y33dN6I8invXBC9ChJmjbrQIdzq+QTzkI0S9x7H7yEis
         eVFY8gFDON8qspI/P5REk9hz3rkt4wul442P4GSA0VNTEuyzZ9QbHr2CMpNY2R59cess
         pInQ==
X-Gm-Message-State: AOJu0YxIOpoOx3tG84ITw/IXVPk1cgs/x2lMUaD3/K1vXVLetAQzPcEy
	58K6ycgIL4TbKrt5cG+3rXi2rUfMjXFn60n1V1iU5VDD3UcZ5pNeRC0UdL9ap7U5nYK0jvCbvva
	iyERSU5s=
X-Gm-Gg: ASbGncsUgjEeJROD6ELIyegDw6T4ImJD/CS54OZIMSXVxV8OoIQJkTdGUO1S9Bpczih
	nB9kajTe8wRGB81E8hCHFbKLA9ciURTDmoUuNK1ayaf8YKonKtEKy/mqSeAosta9E/cTJ7dTBnO
	xdaAVxf3wXo9Zv6zO1U9wdegwWBqT+DehwXpPiYocxHdcJmZUlc1x5Hdhve+albldOUJcNN3j/Q
	oGUeII3GRuWG7E5F1sqvKRe37C6SISTlU5xdO6S/1/yzmX59c2RS/+aDuMEoqtyW6A90LgwHqh1
	wEP//1lFLwb8QczQfrdii9BfpKFv8Br5eNPPtghoXtZk33F23nd4hVzsgeUtEf+8ke2bbFvl7By
	o6fSGgAUy5Yn+iTDfsvPybbKOeST5ae37bkqU5oAcWjby22v6qMJXh6QLj6YhlQ==
X-Google-Smtp-Source: AGHT+IGpy5P43A98pwFktx4HjpbQdLFv+U5zkOGVyV1jgZjOToh7/11zPR7TuNrynYQYj4HmbffJ4g==
X-Received: by 2002:a05:6a00:130d:b0:772:3ef:369e with SMTP id d2e1a72fcca58-7723e22cf8fmr16605007b3a.11.1756849604269;
        Tue, 02 Sep 2025 14:46:44 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4fe18asm14702773b3a.95.2025.09.02.14.46.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 14:46:43 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] python3-maturin: upgrade 1.9.3 -> 1.9.4
Date: Tue,  2 Sep 2025 14:46:25 -0700
Message-ID: <c61219898f51423ba8097a636128ffd47502526d.1756849390.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756849390.git.tim.orling@konsulko.com>
References: <cover.1756849390.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222748

From: Tim Orling <tim.orling@konsulko.com>

1.9.4:
* Add a use-base-python option to pyproject.toml with the same behaviour
  as MATURIN_PEP517_USE_BASE_PYTHON.
* Add builtin sysconfigs for GraalPy
* Fix calculation of platform tag for FreeBSD

https://github.com/PyO3/maturin/blob/main/Changelog.md#194

Comparing Changes:
https://github.com/PyO3/maturin/compare/v1.9.3...v1.9.4

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-maturin_1.9.3.bb => python3-maturin_1.9.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.9.3.bb => python3-maturin_1.9.4.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin_1.9.3.bb b/meta/recipes-devtools/python/python3-maturin_1.9.4.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.9.3.bb
rename to meta/recipes-devtools/python/python3-maturin_1.9.4.bb
index eca474af663..f47c8061bbf 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.9.3.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.9.4.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "267ac8d0471d1ee2320b8b2ee36f400a32cd2492d7becbd0d976bd3503c2f69b"
+SRC_URI[sha256sum] = "235163a0c99bc6f380fb8786c04fd14dcf6cd622ff295ea3de525015e6ac40cf"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.43.0


