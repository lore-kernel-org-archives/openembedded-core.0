Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E18FD116F9
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 12:15:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20101.1764591342677977203
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 04:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FnV7BiBL;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so24392845e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 04:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764591341; x=1765196141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eL4OCmlfKeXAWevWLdwsxEyqxPjNr7JKLnNW4PDxm38=;
        b=FnV7BiBLEZAbNJnc8x+CiuLRpxQHvnjWScccKgSyZNQkQGO15XfO6uqVjQsgr9CXBS
         HJ/CMcK69/3kwxyTPn5S4o76tZN1ZC1fCQ1Tk2Vay4WRhgbvPMqyojkZLO+uQfWeUmu7
         uAheEcMbvHIHuDzGsGXv0CfbrMWA/UxIVR9U94Gb6cyDShVcnuvp8TJPi+96X/PbEinn
         uAB/UuvRj5QYqgSwyR+T98Iqf8Zo6LfSaB88MncyFmpy347Cfg+fOXzWcmjFPATepEhP
         hXfVVcth5opsOzSjwCgmyWEuZUiCF3WO+mCVUhxfQM66XAle14BDBWwOaerQ+ZZi8Q1W
         76Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591341; x=1765196141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eL4OCmlfKeXAWevWLdwsxEyqxPjNr7JKLnNW4PDxm38=;
        b=IZ4bfaErO6TUJXrrWvUdCZ7xRAzMuwAQ3T4D3kCS8KG/KSwds/40S0Dc17+YU/G9YG
         4FTjM0HwkVXxfsNp3c6G4Zv2LZ8R0xVA1YKpDUnKj8KH6vw3lp/5X+53PzTWfkmZ8lME
         pfL9/mbehbu1Alu/m059E0+hqhsUHg8ZwshL4n6nwRr5e+GlHX+ejzVtA5GR5SqZGT4M
         iecDeAb3oMI5A8IK/wMO96uLTFszn7uyvumsaQWAmgJ6mszf84VmWPFEAn5mIPG3bcye
         pdoDLyDF3sGsWcsbb/NOGnu0cVeoxaK83fqcQhyvPZty+C4MOA8gfKFKTDmI4RA4d4LZ
         GoOQ==
X-Gm-Message-State: AOJu0YxorWG87Nrn/1HYZ+ZIMgIUzBJDpdWSQK1WnT+EaIYRgyJZ9fFY
	c6EGsRwmJpyJptpTGcPmzv1Px8TG8eBvAidvvB4RuJ5muVD2MXqaPXvz4/p/tw==
X-Gm-Gg: ASbGncu1s7zvuKKru1YUHoOac9ynBgbNUJM+XDUALaNXiGQO6gaUSEUDVcfbgWv7UOx
	J8FVPS3fP96QtK2/8J/DiHqzbebzTguVbVB96XY2qX53dwRA3AdUzWlVZjwYOAdYgeZIwRxaSw3
	KfvAaQQ+bdZXTyKUfKM44sCnUDFjwObcXF4/cCG4NriBYhJ/uyVl1NoRprgf0MV80G9nWWCkc7G
	Vh0TxedV/v2v5ia0i8L/7SVMgVl5xVQtZFpe6iVfUi78Pd30DwgAaAuFYm3Uw81t1n3T9sPZcpU
	wuXlk+crPoInizc8ypMt/QbgA7ZOOgxp6EVyj162gQP/EV1Fbnen/P+JOFRNXwiIDNjkxD4WibF
	X1CtdwE6f9uak0w71oRQD1xyy87kFcPUHEBu3PkcmyrWIm5ihDlNfuuGgCS73eKXJPCT8Nm3fFq
	1TryJwbj8X
X-Google-Smtp-Source: AGHT+IGZEnAW2/QC8nXX1EnTq8xY9buJW3V1aTjyH8m7cDhPihlmb9t5i5V3ffUMAlBRgg2GyZJ9bA==
X-Received: by 2002:a5d:5c84:0:b0:429:d3a7:18bd with SMTP id ffacd0b85a97d-42e0f35c851mr26909606f8f.59.1764591340660;
        Mon, 01 Dec 2025 04:15:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca9aea3sm25333180f8f.35.2025.12.01.04.15.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:15:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] utfcpp: add ptest support
Date: Mon,  1 Dec 2025 13:15:38 +0100
Message-ID: <20251201121538.2293818-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201121538.2293818-1-skandigraun@gmail.com>
References: <20251201121538.2293818-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 12:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227124

Also untangle the licenses a bit: the tests/ftest.h header is covered by
MIT license, however it is only included if tests are enabled.

The tests take less than 2 seconds to execute.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-support/utfcpp/utfcpp/run-ptest  | 23 +++++++++++++++++++
 meta/recipes-support/utfcpp/utfcpp_4.0.8.bb   | 18 +++++++++++++--
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/utfcpp/utfcpp/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 06d113e264..86c843e188 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -86,6 +86,7 @@ PTESTS_FAST = "\
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

