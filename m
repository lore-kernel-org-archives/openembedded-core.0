Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF0BD6CFD2
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:44:45 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61706.1769147084650742098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 21:44:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m/r940Kw;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: nmjain23@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so21039665ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 21:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769147084; x=1769751884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OnliR1gl9evlBnnLs4wL2ddI5Ab2XJCPVEJdJ5CiF2k=;
        b=m/r940KwlgiirPmjiaVE5K07kFNCDCypvKneKvxkwIHmWJzVjdf45UH1myAnHMOa6D
         kulTrsKbblwRkKJDF/1VFp9dqBM/9tcx/MEP7hdKCuNu9xIb68vUQtu2GS1fHhnjw4n5
         ONWPFEodAxFQqGYw5YMvy8P2FUOcRrAvETNZ1q5MLf5dXidqWHNlYCFN9ViwOkTRogos
         c+BGQPB+ZKWa/tjp7edimQLerSZtODZE/elWDUvvgdlBJwM2RjTW2CxuJXF+iHlzA3B2
         jQvPXlyLcDQx3ICtvBP/8ThedmmGa5S1bEkKjkquWUcRnLHiAwaqfEwEpIh11I5QbTSv
         WB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769147084; x=1769751884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnliR1gl9evlBnnLs4wL2ddI5Ab2XJCPVEJdJ5CiF2k=;
        b=LKevKHbsifZCy2ZXzxpo7zfGUCklxe+g8rRZk9csAWYlfabR28KG/MMj5/PEMT4f4K
         qxYB7fcrBhywX5GzC3q0POS/fbNe3MOqJDYFKi1zIGuL9CAizsQFCVxL07XA+hj0r9yc
         YWPaSkP6R4zqPuV1bpXC+wkcVXUOEMBzZyu40Nls2hHsY28dIlXCOX1vOWeNVEHyV2B1
         0aeTn918HnDyGfBQKTWCcfT01CbTFJ7OtsFtL/ZLnVqFeosm08fDUUsAhKe1kwJg8Q8G
         WC9aGK4UZtL/BPqduHs2XNxlhbDo7DYQxtMqd0PNgPS0MhA79VGONwtOI0gzEg7PVQ0r
         rhbQ==
X-Gm-Message-State: AOJu0Ywvo1nJKGT5hk40bDw0IFVyRtye3TYnGJNDcRMc94MhGlqBtfyX
	dUzh/r7J/UvFwF3XjMNuxJMPtx8bZZ5zknhJbYE6x+2va231Jfh4P/W8JDJ5og==
X-Gm-Gg: AZuq6aL49CWXkwe3Q+z/vHzvx/fdmJVsmpCi8s3B7LCnaU0b3qxfcvBYZdIc5jDsP2l
	P6BSctY1N55ACGIqUr4bQK+xKOoGy+krKA2aGHo0xSkQpkuZXX2a3N6kv61IISv83wN2/lnee6A
	dQtoHBKBR/0LkqSKQLNDONysoUWfRHWu2wWjw89g99fNWhhvwrolDj/Y+GAA1Ot57FenMRkxGxy
	lqTkbRqg7nSRBwn0nghSdiNiGBWhtme4IzszheN1qvQgJ43sVQeSIzNbO7S6FP0pAk9YbKwiCPv
	2swowMgcoF8tLXahZU86RCZp0WWYSGXjaghWY1lEBcL54zhzdkRpNcOjhRnU6g+QOhR0K4QdnDg
	UPDbTefEjDrLqPCt0J+XwOLQb3vs/TMiAPYxWzFYyx7BLsyQjOfFRxTfKh+bcAY1FwmPIvMBWLQ
	vK8QoqfCeX9jL5DUXu
X-Received: by 2002:a17:902:cf0f:b0:2a0:f828:24a3 with SMTP id d9443c01a7336-2a7fe62514dmr18909265ad.28.1769147083651;
        Thu, 22 Jan 2026 21:44:43 -0800 (PST)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97693sm8928275ad.66.2026.01.22.21.44.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 21:44:43 -0800 (PST)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][master][PATCH] libmd: add ptest for 'libmd'
Date: Fri, 23 Jan 2026 11:14:25 +0530
Message-Id: <20260123054425.3413000-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229867

Adapt the compile 'test' phony target from Makefile and deploy as
ptest for libmd.
It takes less than 30seconds for ptest completion

Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/libmd/files/run-ptest    | 18 ++++++++++++++++
 meta/recipes-support/libmd/libmd_1.1.0.bb     | 21 +++++++++++++++++--
 3 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libmd/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 739995bcfe..b9616e9bf4 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -32,6 +32,7 @@ PTESTS_FAST = "\
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
+    libmd \
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
index dc588a0f95..ffc59deb26 100644
--- a/meta/recipes-support/libmd/libmd_1.1.0.bb
+++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
@@ -8,9 +8,26 @@ HOMEPAGE = "https://www.hadrons.org/software/libmd/"
 LICENSE = "BSD-3-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0436d4fb62a71f661d6e8b7812f9e1df"
 
-SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz"
+SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz \
+	   file://run-ptest \
+"
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
+            ${B}/libtool --mode=install install "$bin" ${D}${PTEST_PATH}/test/$(basename "$bin")
+        fi
+    done
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


