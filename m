Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DEDCAC5AB
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 18:58:10 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.14532.1758283555921579891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 05:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ImiIWccB;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: nmjain23@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b54d23714adso1586980a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 05:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758283555; x=1758888355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ruioq41Nf5460HayBdRVqpIzpAyIUufIVWNNhoGGZi0=;
        b=ImiIWccB7sa74ldmAonkcqDxjLgtR0Ks3bkumB5xNkiavj8RqXmegISI07Ezj1mz0u
         4R+G736SxZgbqj/JsbqC0zoR7En1WxROL1IbcOdiq3oVYur2wCVGUQ86sW2c3bl9j2Fj
         oZlpqqdRKFUGog4DuA3/DXBZ080CIeESl9Zroqy3XUnMth1sY97IPg/UwmAjSPfUYfMC
         jOpiEXHPJdfgalH6vOYn9+/pD7yqD0MjqsCVnEZu/3hmVPJ326bG/1+MOkPfyoARWN2b
         /vPBljinW8VMCEiEmrDqZG0QlolBldJf2BdC9LBXGd+DlZ6lEHhhqKjd8cgQh0RemhQL
         PixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758283555; x=1758888355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ruioq41Nf5460HayBdRVqpIzpAyIUufIVWNNhoGGZi0=;
        b=QzXsLOubkb04tldSqS/0qb7ZISTzDgIxSTNi8sA53FAHre4/IWvhMVNopxwmClykUf
         rAQ21fLGaGLM8Z5He0KVijF/QJBOw1TjmwaoVaoRNXA9Gg5wmVdIx29FQVICo8cCMh0v
         R0wk16aa9xHHg0IRF7hG63ooRh0EUCbVKzdfNOdvrifLIWt9+rymQiVX7rUm3T3hCdDN
         h3HT5NUVqBuru6vL0TxqY1nS+TgSbWf6LwSnoWucRNDuJagxWyYoTHLZmdhd+BiRrN89
         brdwDUJVi1O5QRgMvTtXn7IsHT7pVzFXESX7fdWwoJQPXyzYIANDI6TYEKZQk+iiEdU+
         QPdg==
X-Gm-Message-State: AOJu0YxMcBOK1oWwoSBdCwH4kR9aUe/7wcq0eUiJnTA7CmvhJTj+SPqQ
	bgT2Z9U3bqBti/yMXuTSzrt3erHt/V1WbaPsM8XwVaeKa8OphtU2VIyyjLljzQ==
X-Gm-Gg: ASbGncseB7NHkPh5yze8G/0tiN0fKxwnOWv6xv0v/wYZfIJ98IX/voPNrtqn+mRqi8H
	UUJJhuKchwN4IXzfnbgqHt6PqYSVwD8Mi46gI2o+VGCFdSX2TCEHOFKQG0AblI/TRoLDWXxS/BO
	SYZn8/1t7O4T7AaS4F90u4vl0eIsF5LAW/9jTxVl9ko5YYllJ/dR7vuuS7Vgh1lI5PMpJ/YZYxf
	N/TM2A1qbDf27Q6nwq86LutRHiRh69uEUAHcz4H1NzUfIv8AoG5dZEagxmf5N907kjpH71QXlTg
	hG5PuHKrUcDHFw7wSRlukNxcuU4k5++8u5/67jMR+5JgzDiSduHinaMvJ+Xq8NhUHWxy5OZMury
	YRLuPC+FduvL6HrlDJuwLABhTXg5u
X-Google-Smtp-Source: AGHT+IEvXuX0QywdosCp5wruvRUScwlOR++4XoTQKqtyT4cb+ajdnyFwgw51tmOYuPl6WOL0yw1VQA==
X-Received: by 2002:a17:903:1d0:b0:269:af6f:8067 with SMTP id d9443c01a7336-269af6f86a3mr56167165ad.28.1758283554884;
        Fri, 19 Sep 2025 05:05:54 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.133.67.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698018167asm53321085ad.57.2025.09.19.05.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 05:05:54 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra.Thakur@kpit.com
Subject: [PATCH] libmd: add ptest for 'libmd'
Date: Fri, 19 Sep 2025 17:35:27 +0530
Message-Id: <20250919120527.1517036-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 18:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223772

Adapt the compile 'test' phony target from Makefile and deploy as
ptest for libmd.
It takes less than 30seconds for ptest completion

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../conf/distro/include/ptest-packagelists.inc |  1 +
 meta/recipes-support/libmd/files/run-ptest     | 18 ++++++++++++++++++
 meta/recipes-support/libmd/libmd_1.1.0.bb      | 17 ++++++++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libmd/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e6e725bd25..4be87fb780 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -30,6 +30,7 @@ PTESTS_FAST = "\
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
+    libmd\
     libnl \
     libpcre \
     librsvg \
diff --git a/meta/recipes-support/libmd/files/run-ptest b/meta/recipes-support/libmd/files/run-ptest
new file mode 100644
index 0000000000..0c4a5f64ec
--- /dev/null
+++ b/meta/recipes-support/libmd/files/run-ptest
@@ -0,0 +1,18 @@
+#!/bin/sh
+
+cd test
+status = 0
+
+for testbin in *; do
+    if [ -x "$testbin" ] && [ ! -d "$testbin" ]; then
+        if "./$testbin"; then
+            echo "PASS: $testbin"
+        else
+            echo "FAIL: $testbin"
+            status=1
+        fi
+    fi
+done
+
+return $status
+
diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb b/meta/recipes-support/libmd/libmd_1.1.0.bb
index dc588a0f95..a39a5ec65b 100644
--- a/meta/recipes-support/libmd/libmd_1.1.0.bb
+++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
@@ -11,6 +11,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0436d4fb62a71f661d6e8b7812f9e1df"
 SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz"
 SRC_URI[sha256sum] = "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332"
 
-inherit autotools
+inherit autotools ptest
+
+do_compile_ptest() {
+    sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" test/Makefile
+    oe_runmake check
+}
+
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/test
+    for bin in ${B}/test/*; do
+        if [ -x "$bin" ]; then
+            libtool --mode=install install "$bin" ${D}${PTEST_PATH}/test/$(basename "$bin")
+        fi
+    done
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


