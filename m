Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5B8D5B140
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:19 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3018.1765620137172435982
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ckH9FxCD;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a07fac8aa1so9328125ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620136; x=1766224936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nzspoOzdQQcwqInV2ySTIsB9fsgdL4qo6wiz3CADywY=;
        b=ckH9FxCD1jOUK4Xzxr45YdGFRn8Of/JoAtqElA07ZttA40LF11I/47Yb5w5QePhLyK
         vWg0H5LXV23D6ivGb1ildEAuYobcI1gUlwJW7SuiGfOSVapBFL+IRsDs0xtXtL6aN18l
         uS1EH9kry6rk/RLyOr/3ESnqUnSIovzNoMZsLJEpAJk8WW2TvelmrNE2TvxoO/xKUNjG
         kE5E3c5kuAw+idUXcuhPmPWTxhP9OUG5G/NRoOv3RRvtGHzeWalJde5jPkNB0p3h560d
         RjP67v3N/z9UlqNOCX68EKxNZiGMFdQVJJ2MOWDSaA8ei6vx7L7z0zMCfL9dz6RzZD0w
         t6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620136; x=1766224936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nzspoOzdQQcwqInV2ySTIsB9fsgdL4qo6wiz3CADywY=;
        b=b/0hr3528uh7yTvH59+VrjT3lbOR8dB4fP1aAUL8IgZIHehbnlPr4DxzW6yGsaGJI7
         l3op0yXrsMkSRwqX84EKrboIVkS1PKTkmsyRTnvz2FIxzEbTgtmrocob3PLUkGqbp/nX
         Zowo9dEY72KC2ybm0kpFeZl4t3yUdFzMVOMNCokX/FIDV7bMbZTz/bsZZNQ1Yq2GRScs
         oHXwcGzDwBjRHC4K7t3QxKm587euxNv2+O8ol8w7umZuJXF7KVAxgw2HNkq2JpKhgnyr
         cF4TzpUGLc9fp+77RSp/LJKEarT2PleN/3ktWx4H++M++FsAl0td/5oQDjHdNL10iqte
         iLWw==
X-Gm-Message-State: AOJu0YzOwq8hsqgK5/S11Yy6i6y4hPcbSr7gFpuDsgXSJjnPvcFT+n+V
	MtNQmEWzafdBaUoy8oIad90PKBaIB9abft0+gKYckiK0FVSDuw5DTy64e1PpjPFN
X-Gm-Gg: AY/fxX6IO0c2WRoYYTHwm+/qnszCSNc1+X7BU8QNNjkWXef6euVmUVOQYM0/ttEO7F/
	18dw3/azsVXx1TgnCi2W5X+7t8nYC4ytr+wJ5dXeqUNHCPvymdFcF+Sz78cf0miXgLeqhHktYkC
	Jrwg/zQTCLE/iUrMt+DSbmLL19q+iJ6Hx2e0FPrXqYIgEIeG7KPmKuB8BhJC+kqQv5wT/roE6ML
	jA52aFbfCS8YVZeDd7xSnW896MtBb78JZsXhzExAP7x9h92JxtvZlrSpaOpGO/ek2EwL2b9rS9N
	8ZieTqqgo2uagV/X2tpu5KGl1NVF2TE5umXQ4AWISk0h0vNVcYMsgd6b5SR2GYBZN9K+aKt8Jrp
	BsO2mCMHUMdzN3V6pyCTocZPanzR/H0cuii4QTQ/e11W4WO1zdqrz0zy2fF5VHGGLPQ47fubuiD
	FgzwIkZIzq1qrjT7/WVv5bM0Dj
X-Google-Smtp-Source: AGHT+IEcoSz1qLDtQq6CYu+2RhfdW9L0MeIZ13rzwiMTjPV4XujO8VC3ZLlvG18EsUFRURBsANiMrQ==
X-Received: by 2002:a17:903:1a03:b0:2a0:afeb:fbb6 with SMTP id d9443c01a7336-2a0afec014amr201825ad.8.1765620136394;
        Sat, 13 Dec 2025 02:02:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 56/67] python3-numpy: fix run-ptest
Date: Sat, 13 Dec 2025 15:29:20 +0530
Message-ID: <20251213095931.2571498-56-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227674

From: Changqing Li <changqing.li@windriver.com>

Hardcode path will make run-ptest not work when package is installed
under /usr/lib64, error like:
ERROR: file or directory not found: /usr/lib/python3.*/site-packages/numpy

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8a83d9cf127e28aecd3d737e20719c5e01d9c9cf)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-devtools/python/python3-numpy/run-ptest | 4 ++--
 meta/recipes-devtools/python/python3-numpy_2.3.4.bb  | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-numpy/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
index a1c80323d6..b5edc5cf48 100644
--- a/meta/recipes-devtools/python/python3-numpy/run-ptest
+++ b/meta/recipes-devtools/python/python3-numpy/run-ptest
@@ -5,7 +5,7 @@
 # the tests to report "no space left on device" errors. Create a custom
 # directory for these and point pytest at it so we can take advantage of the
 # storage provided in the rootfs.
-export PYTEST_DEBUG_TEMPROOT="/usr/lib/python3-numpy/ptest/tmp"
+export PYTEST_DEBUG_TEMPROOT="@PTEST_PATH@/tmp"
 mkdir -p "$PYTEST_DEBUG_TEMPROOT"
 
 # test_mem_policy fails if there's no C compiler present, but we don't want to
@@ -13,5 +13,5 @@ mkdir -p "$PYTEST_DEBUG_TEMPROOT"
 # large amount of storage, so skip that too.
 # remove test_validate_transcendentals if
 # https://github.com/numpy/numpy/issues/27460 is resolved
-pytest --automake -m "not slow" -k "not test_mem_policy and not test_big_arrays and not test_validate_transcendentals" /usr/lib/python3.*/site-packages/numpy
+pytest --automake -m "not slow" -k "not test_mem_policy and not test_big_arrays and not test_validate_transcendentals" @PYTHON_SITEPACKAGES_DIR@/numpy
 rm -rf "$PYTEST_DEBUG_TEMPROOT"
diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.4.bb b/meta/recipes-devtools/python/python3-numpy_2.3.4.bb
index 7f82ca87a7..520c567bd4 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.4.bb
@@ -39,6 +39,12 @@ do_install:append() {
     nativepython3 -mcompileall -s ${D} ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/__config__.py
 }
 
+do_install_ptest:append() {
+    sed -i \
+        -e 's|@PYTHON_SITEPACKAGES_DIR@|${PYTHON_SITEPACKAGES_DIR}|g' \
+        -e 's|@PTEST_PATH@|${PTEST_PATH}|g' ${D}${PTEST_PATH}/run-ptest
+}
+
 FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/lib/*.a \
                           ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a \
 "

