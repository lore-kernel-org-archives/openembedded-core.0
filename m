Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197C0C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:21:07 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.8330.1745414459795873477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=w2WkCaZw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7399838db7fso1081146b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745414459; x=1746019259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpHDf6nJAcNeh2PLlKgUsirqP48uzjydH/mFMK8ykxE=;
        b=w2WkCaZw2D6bTUV27L6VVoSE0+qg15Yk/mtanC+yDXDmoYWOxB6EQftL9/5Ss9TGdY
         uuyoOHO2OzuB0U0f+jXGTu7e9VsEYU0w/bcXJNCeklbIGFDWgqErNbGQ/MmAqq4Bk8qF
         tkE0MkkEBwgSDnVOTbGCmuvEdbqf6fES3rPVxgB/nK/bqCWykzes0eynrjynU95DJg2T
         nPATZPvZYxEo7MQPWOQa8tseL0Kb4kMmYm/1a5sUwVJbGPV5zy7rBxa0OQuFZvFAFRWV
         MfC5UwTx053P2bGZL8WYfVBrQEz5w0UiRSp2p/VTGTmVPkyfX+Fde3F9mpWryID8lvpy
         DKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414459; x=1746019259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpHDf6nJAcNeh2PLlKgUsirqP48uzjydH/mFMK8ykxE=;
        b=DOm2GIVybRZaxBdsYlYB6+mOFWGuGZreuiSJblMMC0Dc5pfdLJP+gJG22LYpmaMjSE
         eGQnIE5zcarruaUrDSPUFSBSDmj+B94nGmJNxlmA0f57Fe2M4E4Kw4H5IgXfgD1gy0no
         k/YCHFEcjBiiJJdbY33/bi2ji3Uy1GQxhUIaVnTog0ZjZk/bWdDzsGH09q+UcEjCYIbS
         3fKMnn4z/pZ67oNmU76enqjDP/BC7K/txtGj/G87dZzj9zu+CDp4ipibw0ubbK/7lW+H
         UXzXkdGgsknk5iv9ztpZZVniDg2Lh2EKyAmsMcN6ih9nFAHugyLcUsrBqIwinYc7dbtY
         8rZQ==
X-Gm-Message-State: AOJu0Yy0L5/th8QXUpay22ACz4WjcmdCA2GFy06AD+Lu36E44ysP5u7A
	J3zZJeY7KGZJP66XOPCXIlNxlHARrf9paXIFb8RX4oL5IsVb66ErrTmmkvNHzfCdLDSXZDzHCOe
	s
X-Gm-Gg: ASbGncuMhN1QWrOaxcHKkGuBhffB6SibwmIZWoMdHApir6DXsidpGmIrEjmu2WVa0Ee
	V1ZREWidmX2xLeq621fe/E0o0oE7mOg5gpwkaNGZoD8kjMYU/MdUGnq6PoZ/dgOz2RZckKL/wUY
	21VNkAJS+InVeyO6b/y66ouXu84trHyqMV7E1UxFqpk0JKXMx3Orsvl/qLru9owwTUvlKshMQFi
	db5VNkmzFGBQVISvYvncfVyTI7yPGCxRZzOmTwnS3i9l9bpYA5dU3S/2p7THdeYwR6wAORjUt89
	eJbV0rWml7+0bt/IYUvgvSDvNLL2IsGcQ5EZGnGgCA==
X-Google-Smtp-Source: AGHT+IF17Get/RX+xU5yfQeu5e19h8vJpvFYtp8z9kDdBdQZEIsMkOBfxLQuCearzfffh1xebDCIUw==
X-Received: by 2002:a05:6a00:3394:b0:73b:ac3d:9d6b with SMTP id d2e1a72fcca58-73e1359a73cmr4552043b3a.4.1745414459085;
        Wed, 23 Apr 2025 06:20:59 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:371e:10cb:f3ce:33f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e510bsm10898037b3a.66.2025.04.23.06.20.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:20:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/14] python3-jinja2: upgrade 3.1.4 -> 3.1.6
Date: Wed, 23 Apr 2025 06:20:24 -0700
Message-ID: <a935ef8f205c9510ebc5539c133960bc72504902.1745356684.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745356684.git.steve@sakoman.com>
References: <cover.1745356684.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215306

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for - CVE-2024-56326, CVE-2025-27516, CVE-2024-56201

Changelog:
https://github.com/pallets/jinja/blob/3.1.6/CHANGES.rst
https://github.com/pallets/jinja/blob/3.1.5/CHANGES.rst

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-jinja2_3.1.4.bb => python3-jinja2_3.1.6.bb}     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb => python3-jinja2_3.1.6.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
index 2c02037011..de2b251049 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
+SRC_URI[sha256sum] = "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
 
 PYPI_PACKAGE = "jinja2"
 
@@ -21,6 +21,9 @@ SRC_URI += " \
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+
+    # test_async items require trio module
+    rm -f ${D}${PTEST_PATH}/tests/test_async.py ${D}${PTEST_PATH}/tests/test_async_filters.py
 }
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.43.0


