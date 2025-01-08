Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E167FE77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 16:49:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.24577.1736354964534087318
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 08:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nfb2rVUs;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43618283dedso345205e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736354963; x=1736959763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6qtrVdNxnRSGBcj1+fPkU6Kjoft+8MABe5a76fpW/jI=;
        b=Nfb2rVUsoHgwKwipxerG6fvEumDWOiRDVYx7nWyOXgb6wuV9e6KqtMenNuDNo8BUfJ
         W91bIBpBDxMpAMTCYPUG5/taz80uQlfyrpo4Xi/pvrdI1l1D0pVMnaW6pzA6RS4+HDdu
         y2GmuL4cdpZQyBatXKlwNGK21+A+jyCWpdR+A83XBUwsRmS5DRD2KOY9rIay7cpUnlT5
         1LFBQ3hl6RXfmTV1qszf0sA6CGWkVVcaj4JAg/S20jJT8jDIs6rX4nBVedfgD8uwF2W+
         h32Efm0YIAE3nAjNrCLxaZznvjVxGW3NJepIDnTlTQ3q5m4EBO8cdiGJmIOF/rYgNwbm
         MHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736354963; x=1736959763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qtrVdNxnRSGBcj1+fPkU6Kjoft+8MABe5a76fpW/jI=;
        b=qdZkzn4FLq/DUoegYapkIKxTlQvGBk0+pl9NJ3mZ7NbAO+T8I3zpe5ZwmONS0rrUVb
         2C5WGKBq24+Pz+Sxp3tGP2ba+kHyLzffEf2V+HMbgtpE+vhZAQnlKIbxNXWTLiEZWNTD
         TN8OvfQ0C2yvDX8Bew/7U9v4CqE/DJL/oNtYdtpViyBUBjlR47eKBqGHEVQ3xdQZMR4m
         7ziP2ZeLj0OGqB3GUKIHLsrTPOd7Bu6UrPhwKnnjbB6jUaijS8uRODGnG8x0XyJjjvsv
         hJj0OEVwaSGLFPVWBpkYAQxYXrBVCqQCmcXz/v4xcXlLepNNF/8e+H1lQdumPyqQm97U
         s/Qw==
X-Gm-Message-State: AOJu0YwOM3VYNAjB1j4qmXD17DdmU2VzId9Q8/6xpAJLifWKzz2HukG6
	SiIUHai9VfCSBIL5bXTDHsCbe7zqVflIpD86xbg8KQ7GJzB8dwmzZF3w9A==
X-Gm-Gg: ASbGnctHLucGMnc36l2ry7U9g5+0K5w36DmZCX+jyZj/T60B6O8E1Shd5EZ59EN27h0
	PLoErOY4iZaFP2Kg+Hrt1zE5461KXKVM4zomiiNUsnwmedvYBl6szbgVMGC6z12aJYXLD1uOaQY
	5dGN3H1VKOKXGCKTckfx9G7GOWsu2Ct+mO49iKuQB20962q5a/0Luq6Iq3wfTHQngc1x4yDjL4Q
	d2h6ydd96eIT7YR5pGaA2IEycXp7ZPkDb4ZSi7Yt+KwQ4ywOoLqKTdr4G/VSvfvb7skFrBgnKMP
	k8apW531jV2ZEM8JpQ==
X-Google-Smtp-Source: AGHT+IFMGekJQn2l4/Se83mLFTN3GIXtFqjPNcSYEZDb6XFts9fV+pYOYxoyqbRjyLvRNKgjbCePmA==
X-Received: by 2002:a05:600c:45c3:b0:434:a90b:94fe with SMTP id 5b1f17b1804b1-436e26c3c3fmr35121135e9.10.1736354962474;
        Wed, 08 Jan 2025 08:49:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc12dasm26649075e9.10.2025.01.08.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:49:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/2] python3-click: update 8.1.7 -> 8.1.8
Date: Wed,  8 Jan 2025 17:49:15 +0100
Message-Id: <20250108164916.2671907-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 16:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209582

From: Alexander Kanavin <alex@linutronix.de>

License-Update: renamed file

Convert from setuptools to flit.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-click_8.1.7.bb => python3-click_8.1.8.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-click_8.1.7.bb => python3-click_8.1.8.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb b/meta/recipes-devtools/python/python3-click_8.1.8.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-click_8.1.7.bb
rename to meta/recipes-devtools/python/python3-click_8.1.8.bb
index e8eeec36e8b..7be3d735460 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.7.bb
+++ b/meta/recipes-devtools/python/python3-click_8.1.8.bb
@@ -6,11 +6,11 @@ Line Interface Creation Kit". It's highly configurable but comes with \
 sensible defaults out of the box."
 HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=1fa98232fd645608937a0fdc82e999b8"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "ca9853ad459e787e2192211578cc907e7594e294c7ccc834310722b41b9ca6de"
+SRC_URI[sha256sum] = "ed53c9d8990d83c2a27deae68e4ee337473f6330c040a31d4225c9574d16096a"
 
-inherit pypi setuptools3 ptest-python-pytest
+inherit pypi python_flit_core ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
@@ -19,7 +19,7 @@ RDEPENDS:${PN}-ptest += " \
 "
 
 do_install_ptest:append() {
-    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
+    cp -rf ${S}/pyproject.toml ${D}${PTEST_PATH}/
     cp -rf ${S}/docs ${D}${PTEST_PATH}/
 }
 
-- 
2.39.5


