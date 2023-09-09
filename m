Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771F4EEB57B
	for <webhook@archiver.kernel.org>; Sat,  9 Sep 2023 01:56:13 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.9815.1694224567182065409
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 18:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cCyiRrWF;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1c4cf775a14so1782252fac.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 18:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694224566; x=1694829366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rvG5qLpvOXp2Ipj13iuHExdC0w2WYGLYe5vCsMeRHOE=;
        b=cCyiRrWF+xCp9jrQQ6dTTnM/tsyvsMk9JU57Diru1Ta8gjaxru2BCJPhW5g+A7NTKE
         nZ/JkhyR859TxbCougxrd5WWosWxcWdjuKk9pqmzuUt8CivyniJRwi7sLWHml4t0DPCS
         8mwODiH3VdOxtafYSPmsKMm8r8F+agt3R9vMUS6YM7yQ4G8aJOIxBFg6xo/tG6ny6sZ2
         EEiyqYhL8NxwFeFx/BeICOBPxBLR/crSNSh7XauwimQXCdJgmELh1HHIBmzPZwOsF7Oq
         wuv94asrgmN/0Ycbjiz11NIiBYn/sUgKvp+L/mE6/s/pLMrK4psIDxbmDTcbmPVBseDg
         hVJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694224566; x=1694829366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rvG5qLpvOXp2Ipj13iuHExdC0w2WYGLYe5vCsMeRHOE=;
        b=IQOujM8pj/lJxHtjHiRPHB+062FPxD9rXtU79SkW0wBBD6PvJH9BJG0Fwcj52JVh+1
         OowbV84bp4ci1hmBpCJgfClBMYyVB2+fOSsrcWlJdpQZsbDkrycI1WHutBmUQlFv4qwt
         YDcZDSYwYGuogrCfPh7ZY25t9reSutka92fOpTsPFVlCuZW1tCx6Cd8NraBEbOx0W1Jw
         wx2ygIA1CRfrsGQRjena/GmqvNDuyDlBKtXKO5eJtctD5UoikiKxN599Bg2UxF7hw0zo
         PjMSnseOzkzIurXHWsVjTHMTtXURdyrBLRlkbURHEBIfZlItCoLMd7izKUOtDW+ZY7lM
         4xeg==
X-Gm-Message-State: AOJu0YxVr83dZ6s83uHB4Di+9P63D3E1E5iVDtDT6jH47ISodrdIlZDf
	xXzhGVkRGWwhapCZjQqxXVlhSwywmVko9g==
X-Google-Smtp-Source: AGHT+IGCKbjy294wtibai3EzgKGYbxo808GWcck4aR70czUbbV4gHd3WhqTWgcp+7PZBR94JcsvKfQ==
X-Received: by 2002:a05:6871:58a:b0:1d0:fa7b:c3f9 with SMTP id u10-20020a056871058a00b001d0fa7bc3f9mr5092265oan.30.1694224566123;
        Fri, 08 Sep 2023 18:56:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::a05f])
        by smtp.gmail.com with ESMTPSA id o13-20020a17090a420d00b002696bd123e4sm1811778pjg.46.2023.09.08.18.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 18:56:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libc-test: Run as non-root user
Date: Fri,  8 Sep 2023 18:56:02 -0700
Message-ID: <20230909015603.135685-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Sep 2023 01:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187444

Some of tests impose rlimit on it before running which wont be imposed
when running as root user.

Fixes
src/regression/pthread_atfork-errno-clobber.c:23: (pid = fork()) == -1 failed: fork succeeded despite rlimit
src/regression/pthread_atfork-errno-clobber.c:23: (pid = fork()) == -1 failed: fork succeeded despite rlimit
FAIL src/regression/pthread_atfork-errno-clobber-static.exe [status 1]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libc-test/{run-ptest => run-libc-ptests}  |  0
 meta/recipes-core/musl/libc-test/run-ptest    | 29 ++-----------------
 meta/recipes-core/musl/libc-test_git.bb       |  5 ++++
 3 files changed, 7 insertions(+), 27 deletions(-)
 copy meta/recipes-core/musl/libc-test/{run-ptest => run-libc-ptests} (100%)

diff --git a/meta/recipes-core/musl/libc-test/run-ptest b/meta/recipes-core/musl/libc-test/run-libc-ptests
similarity index 100%
copy from meta/recipes-core/musl/libc-test/run-ptest
copy to meta/recipes-core/musl/libc-test/run-libc-ptests
diff --git a/meta/recipes-core/musl/libc-test/run-ptest b/meta/recipes-core/musl/libc-test/run-ptest
index 0b4b687dec7..53cd34f506f 100644
--- a/meta/recipes-core/musl/libc-test/run-ptest
+++ b/meta/recipes-core/musl/libc-test/run-ptest
@@ -1,28 +1,3 @@
 #!/bin/sh
-
-set -e
-
-cd /opt/libc-test
-make cleanall
-make run || true
-
-echo ""
-echo "--- ptest result ---"
-# libc-test runs tests by module(e.g. src/api) and generates sub-module test
-# report(e.g. src/api/REPORT) first. After all tests finish, it generates the
-# consolidated report file src/REPORT.
-report="/opt/libc-test/src/REPORT"
-if ! [ -f "${report}" ]; then
-    echo "${report} not found!"
-    echo "FAIL: libc-test"
-    exit 1
-# libc-test prints error on failure and prints nothing on success.
-elif grep -q '^FAIL src.*\.exe.*' "${report}"; then
-    # Print test failure in ptest format.
-    # e.g. "FAIL src/api/main.exe [status 1]" -> "FAIL: api_main"
-    grep '^FAIL src.*\.exe.*' "${report}" \
-        | sed 's|^FAIL src/|FAIL: |;s|/|_|;s|\.exe.*\]||'
-    exit 1
-else
-    echo "PASS: libc-test"
-fi
+chown -R ptest:ptest /opt/libc-test
+ su -c ./run-libc-ptests ptest
diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index e63abe838d2..619a959fd29 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -13,6 +13,7 @@ SRCREV = "18e28496adee3d84fefdda6efcb9c5b8996a2398"
 SRC_URI = " \
     git://repo.or.cz/libc-test;branch=master;protocol=https \
     file://run-ptest \
+    file://run-libc-ptests \
 "
 
 PV = "0+git"
@@ -48,5 +49,9 @@ do_install () {
     cp -r ${S}/src ${D}${install_path}
 }
 
+do_install_ptest_base:append() {
+    install -Dm 0755 ${WORKDIR}/run-libc-ptests ${D}${PTEST_PATH}/run-libc-ptests
+}
+
 COMPATIBLE_HOST = "null"
 COMPATIBLE_HOST:libc-musl = "(.*)"
-- 
2.42.0


