Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94388D5AE7A
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:59 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3005.1765620115756614619
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hevl7cqM;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29f30233d8aso14599545ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620115; x=1766224915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOKmkdf0gaQqhEA4DNoUf6L1Cw0wQ2i8nuFqBtbu3uU=;
        b=Hevl7cqMYFMu73gNt/kdlAfj6/zqtkOIdTvlg9iOi7KLpJx/+I4R8kf+TdaGwGtgQi
         4nDeBLNxuz65H9hD/OvGablizPwDS7dalwDYDPtclpcxAlIHqnyjBVTDqLG0JiYjMXmI
         K7MryVEuWjHwwqY526niHmw6jsr6BxMWpJ46/iFB/+AZTydsToUTv/9lFcatmwj5hWiI
         iSPS+vgfTlDZ6JFThVgCK7PXXmHkLNYUqhIDRdxqZaXg0CPokU84n1aIL8koNucbcp2O
         JZDuJKxKuuAwv2sSb4zwI4WbQE/psHRYyk6mC6QUbrjvTCpXAIY5hT8hxLeJfIM6ydQ9
         Py6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620115; x=1766224915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xOKmkdf0gaQqhEA4DNoUf6L1Cw0wQ2i8nuFqBtbu3uU=;
        b=Ew3t5J61bvW1K7qXToSm3BOP9nZN+eZi8JXmOmxfK8kiIpefp8vzrIMsYWrD3vfsOF
         ngeUUuJJAyKMRZ8XdHRfKry2zqkrIU9Ev6Bu62q1K8oFx/ehhYrn31+h8TaLDmff9Hr0
         XnkESCHOgv4KxoJ4vS4czN/Ub778ArUd4f996cG5674bs1PZfYKoqKBwwz794zHpckzR
         0Eee9hArkO6s0vX8VF3yx6Jm1H8eUzvzZT73+5vNhxQNNaWHkgHkzO+IvDRO4+gMJDa3
         m4OBORcg2exUFJh0yg33D56pIHxtMqLFsKfMDnHcMZz97OPAPt1AvmQxJDE7cnzVoGvM
         hsPQ==
X-Gm-Message-State: AOJu0YzFQP0mOmS4LuJKmfjbpTZWA4/GwZuPKQRa2jR9pbwQHl2R9mSU
	ewndMkKYCDZv6Boole7oUFq0346euIfEg4zQLMJidPOF7beMnpNyxMN9ON4TAXjv
X-Gm-Gg: AY/fxX4ce8YZodc9uabxJxAoAT0n3F0c1w4oFF4Z7F3UBFZCH+3KFQ+SkSUYw0xLbQy
	glNAFDfb8r3RqoWWPUixaitBaGhYdXFwmFVMpr+yPVaKsJpjEMDSY8RbfQQEwgKXauwBCcVX/Dh
	1LPgRWIr8aHm+fGeSgSJXQixzhc9Bf5L5zQMLym75nV3qJDJBFFz2i8+polej3rJfcK3Mt0aFPK
	xTyQ1QZrU6tr6hlyO9dnHuN24XU17nQza7JvYDlhsbjlx2r6krMoJM5Kh2QdRaHHOn5po3xbclx
	Wqwtmwi4KIsRLhd0lMORPkmYISrNasrcy96k0ZDbwnUcsRWh2muZ2jpO/YFKAMCfmLKPJu2hvn1
	9uC6r02VztP3kxtU4E9LaLP76UTWVggsXAjl1EiAvjwjLjpKAFZ/Zo0eOlL+KUaTgVhjCGWh1y9
	Nsw1toLjWhfGlBJxoTq1vk97xq
X-Google-Smtp-Source: AGHT+IHlQL5rlApAaO6BcLbkiNoCOKwDG4LRGlKjYA5VK/u2xbuevVc92zy/hbpz+e1IjQxPfJXipw==
X-Received: by 2002:a17:903:943:b0:29e:9c82:a91e with SMTP id d9443c01a7336-29f23b1406dmr46842675ad.7.1765620114821;
        Sat, 13 Dec 2025 02:01:54 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:54 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 49/67] utfcpp: add ptest support
Date: Sat, 13 Dec 2025 15:29:13 +0530
Message-ID: <20251213095931.2571498-49-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227667

From: Gyorgy Sarvari <skandigraun@gmail.com>

Also untangle the licenses a bit: the tests/ftest.h header is covered by
MIT license, however it is only included if tests are enabled.

The tests take less than 2 seconds to execute.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 49314caa7eb8efd86577121337a0b0d7472eab1b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/utfcpp/utfcpp/run-ptest  | 23 +++++++++++++++++++
 meta/recipes-support/utfcpp/utfcpp_4.0.8.bb   | 18 +++++++++++++--
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/utfcpp/utfcpp/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 3cd5f244be..09613294d6 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -87,6 +87,7 @@ PTESTS_FAST = "\
     rpm-sequoia \
     sed \
     slang \
+    utfcpp \
     wayland \
     xz \
     zlib \
diff --git a/meta/recipes-support/utfcpp/utfcpp/run-ptest b/meta/recipes-support/utfcpp/utfcpp/run-ptest
new file mode 100644
index 0000000000..85e18bd4d9
--- /dev/null
+++ b/meta/recipes-support/utfcpp/utfcpp/run-ptest
@@ -0,0 +1,23 @@
+#!/bin/sh
+RET=0
+cd tests
+
+for t in $(find . -type f -executable); do
+  case $t in
+    *negative)
+      ./$t ./test_data/utf8_invalid.txt
+      ;;
+    *)
+      ./$t
+      ;;
+  esac
+
+  if [ $? -eq 0 ]; then
+    echo PASS: $t
+  else
+    echo FAIL: $t
+    RET=1
+  fi
+done
+
+exit $RET
diff --git a/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb b/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
index 7f6eb367f1..628e8ee0ce 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_4.0.8.bb
@@ -2,14 +2,28 @@ SUMMARY = " UTF-8 with C++ in a Portable Way"
 HOMEPAGE = "https://github.com/nemtrif/utfcpp"
 
 LICENSE = "BSL-1.0 & MIT"
+LICENSE:${PN} = "BSL-1.0"
+LICENSE:${PN}-ptest = "BSL-1.0 & MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
                     file://tests/ftest.h;endline=25;md5=d33c6488d3b003723a5f17ac984db030"
 
-SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV} \
+           file://run-ptest"
 
 SRCREV = "f9319195dfddf369f68f18e7c0039b3f351797fd"
 
-inherit cmake
+inherit cmake ptest
 
 FILES:${PN}-dev += "${datadir}/utf8cpp/cmake"
+
+EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DUTF8CPP_ENABLE_TESTS=ON', '', d)}"
+
+do_install_ptest(){
+	install -d ${D}${PTEST_PATH}/tests/test_data
+	install -m 0644 ${S}/tests/test_data/* ${D}${PTEST_PATH}/tests/test_data
+	find ${B}/tests -type f -executable -exec install {} ${D}${PTEST_PATH}/tests/ \;
+}
+
+# the main package is a header-only library, which produces an empty package
+RDEPENDS:${PN}-ptest = ""

