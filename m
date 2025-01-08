Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00BDC02183
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:39 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.14215.1736325754158089402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Agna0gmc;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaeef97ff02so2112323366b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325752; x=1736930552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcXQonvPsydneXliEJ/SjEClMXShffNJI0MIx0a+oBM=;
        b=Agna0gmc613uZUP2u/MygAvUVmTHxhOhP01Wdp/W/FlNzlOryynXXoKBO3PWhu73r9
         nO+tuSnOjD3vXBO4PP0TMe9NgzS5Mqy2H0bmCi5Ibj2spYssj3eYvcwR/HdIq/AU52wP
         OoUi1++dIUOIm5DcZ1eKlAer1JftF7FenZIV7+ruZBfPrBVj7Juksd22IOvOu0yBkBh4
         RQVAoaO0HNhovE9Ap2ba29E6QAdpL2SHPDVQNO3Lrv+UMNA17mKgby42/RauwCsVpy83
         hbHtmJCU/uR3MtQsflb8TNT23TrsimaTpSm4i+0eOKPMHDupddmVyJ8ALiz6cNCJ8PjF
         6iFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325752; x=1736930552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcXQonvPsydneXliEJ/SjEClMXShffNJI0MIx0a+oBM=;
        b=XZOg5qjktsoWfqIQJN5Uz+rkNkZY4Lf25sxdBEoarkEOXrQzmAN2lJmMmTZrui/MRO
         MpUZHTMS9YB6+EG33WYdPDUOVWHNmVn2GN0E0airJ8NGtVbA2YCRNXXrTJEd/KFQEVLf
         hbonkhU71ka2+HMYw4byACvUEgjWTd4mlVZnoT+UN0AMEF1gFp1KLtFAeNxrvO+/8l99
         hDoCkbrGbtB9eJAHaoIa4C40iL8YKrhQhqM1uoFjN8vucJuVb/Z+IBMEmpTiP7ADJuQA
         uDGASaYPzQgre8yZUmZdgsSZX42d9WHScsMYXLOW5tpUqifW9BPV2Rw3UoJsRFbUYYrQ
         UQuQ==
X-Gm-Message-State: AOJu0Yzezn9WZgMx8wWdwTz644ICvX/o/9asURM+mIriK+Gy9oyZgVsl
	beFwSW5a0dQiV9/lA3xL2goGQGv00JFm5GeEK9w+zHi+BsDIUXK7smhBXg==
X-Gm-Gg: ASbGncslJct07ujUoWGJbBk1p9X6aVxwWk7szX8dRGhgrpOydGMrRwZUBXRpfNYKz6S
	XUCbRgRTd9yM1b9dSl34ju5eROjWX8xQtqci2e8HzPljnFWa9qRm7u/Xjhn95B5zGaAM2BQu7r+
	GIB6d0p8KeTTIswZWf+kvPiuFiqTlDvj+uQDzG+aosdEBUcYOwj+G8jLkAXqMCiqla2LdWMtFxP
	Qayt9CuDKIDPXmGvtRB/uWKdaYLTfZIzCrOqrEheOugCHeZJha5qd3a6MRlCTs3Ayh/29fIfEsE
	EdrQg8LU2xCSpom/Kw==
X-Google-Smtp-Source: AGHT+IGerNQdy8I3GvqiJxLs+JplmQ3vN8Lz/kbLhur7ppjQvxcDAX5EzxX9aUQPlPVdtWyJKlXPOQ==
X-Received: by 2002:a17:907:7faa:b0:aa6:832b:8d76 with SMTP id a640c23a62f3a-ab2ab6766c4mr149995466b.12.1736325752372;
        Wed, 08 Jan 2025 00:42:32 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/20] python3-click: update 8.1.7 -> 8.1.8
Date: Wed,  8 Jan 2025 09:42:10 +0100
Message-Id: <20250108084226.117178-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209525

From: Alexander Kanavin <alex@linutronix.de>

License-update: renamed file

Convert from setuptools to flit.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-click_8.1.7.bb => python3-click_8.1.8.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3-click_8.1.7.bb => python3-click_8.1.8.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb b/meta/recipes-devtools/python/python3-click_8.1.8.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-click_8.1.7.bb
rename to meta/recipes-devtools/python/python3-click_8.1.8.bb
index baff4cbd45c..31b9e43a942 100644
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
 
-inherit pypi setuptools3 ptest
+inherit pypi python_flit_core ptest
 
 SRC_URI += "file://run-ptest"
 
@@ -23,7 +23,7 @@ RDEPENDS:${PN}-ptest += " \
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-    cp -rf ${S}/setup.cfg ${D}${PTEST_PATH}/
+    cp -rf ${S}/pyproject.toml ${D}${PTEST_PATH}/
     cp -rf ${S}/docs ${D}${PTEST_PATH}/
 }
 
-- 
2.39.5


