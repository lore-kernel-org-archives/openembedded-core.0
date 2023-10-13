Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A3DCDB485
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:33 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.51153.1697234013573250338
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZCHfswBC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6b201a93c9cso1061597b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234013; x=1697838813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyCdyjcDMkJHbxv+zSMG5TaqJBSdITQcicdgpNISoKQ=;
        b=ZCHfswBC7mCrWvWooAI4zS6bhm69yseu3IQRuIZKxZRFZ3t3nbJ/7Ou0IVnRLnndzO
         skxX9zHjFG5fwOZAE0nJaTcwcsEDznn1ua/uQtdNjSXnQsJxAnSmngIIPOOckvWWsFZh
         eUz95jtc3FVrF0gFzfh0yzYYTcDKBFI6T76ovLg3SCligYjw+YNrggbOYrH1JJ6ealsi
         OfNV7ggH5WJuzV4/73jZYI0d7NKWs9cIRdeOi+W10W9UvpYL+8TD/oXOzRlATK81Nc0N
         7OLWsu8/dGcl8SPOZMmgNhIGHp0qQKVyKzWDn0PaFRyw9klA/0uPjtyBZ5Xt9c7TJF2a
         ra2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234013; x=1697838813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyCdyjcDMkJHbxv+zSMG5TaqJBSdITQcicdgpNISoKQ=;
        b=uAVtA6XZLH6X8HntOt9V6TZFcPk2M1ilLrmbkP7k72paUKrKqDPFtUia9xyRCVH1cf
         sY9CRYhIDbPaAcCj359AP1/MSHMe/mlIeCnpqV7Azq0rY3o4fSLB3kcQJL64pDA0Oz6n
         FYdRYRB3nmmPowwbS90LLbpeIQn7rrRjbXUL7aA5QZcaLTmvQO69BqcT040r8W/D4jhM
         kBO+YosL4MyH0PIn880IYS+QMQ2FxSxj78NokWExYeLGMZQ4aLGXO1HyUcR1s1YVOaTP
         TuT7GmMk2rDqobrvPEDU13f53yYgPiuLgZtvxEOi5QIl8i0BtoS+q5cxq+ZnY8pvGjYq
         WNKA==
X-Gm-Message-State: AOJu0Yx/vMKyRtO07fQWoWXrzxu+CFAwoFEdGxkZxLNTtkZUrl81zWv+
	ukQ8jXwXP8ocMZt4R0eHUq/gK88/+fGnO1SzbEU=
X-Google-Smtp-Source: AGHT+IFXSbs0n4nyoR/wS24BV86gNSJD6SXhlVGGem9ZuKBDnAbadXCf5P8o4LNlkhEdJ20oJ6DSEA==
X-Received: by 2002:aa7:88c2:0:b0:6b2:2a2d:7a25 with SMTP id k2-20020aa788c2000000b006b22a2d7a25mr3719566pff.29.1697234012749;
        Fri, 13 Oct 2023 14:53:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/27] libc-test: Run as non-root user
Date: Fri, 13 Oct 2023 11:52:41 -1000
Message-Id: <16075f19b49cb23ead2dec6746d2be6773ae4ae7.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189094

From: Khem Raj <raj.khem@gmail.com>

Some of tests impose rlimit on it before running which wont be imposed
when running as root user.

Fixes
src/regression/pthread_atfork-errno-clobber.c:23: (pid = fork()) == -1 failed: fork succeeded despite rlimit
src/regression/pthread_atfork-errno-clobber.c:23: (pid = fork()) == -1 failed: fork succeeded despite rlimit
FAIL src/regression/pthread_atfork-errno-clobber-static.exe [status 1]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 585bf4b780a8ad60ba2b33cede4f0092ff61ddfc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../musl/libc-test/run-libc-ptests            | 28 ++++++++++++++++++
 meta/recipes-core/musl/libc-test/run-ptest    | 29 ++-----------------
 meta/recipes-core/musl/libc-test_git.bb       |  5 ++++
 3 files changed, 35 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-core/musl/libc-test/run-libc-ptests

diff --git a/meta/recipes-core/musl/libc-test/run-libc-ptests b/meta/recipes-core/musl/libc-test/run-libc-ptests
new file mode 100644
index 0000000000..0b4b687dec
--- /dev/null
+++ b/meta/recipes-core/musl/libc-test/run-libc-ptests
@@ -0,0 +1,28 @@
+#!/bin/sh
+
+set -e
+
+cd /opt/libc-test
+make cleanall
+make run || true
+
+echo ""
+echo "--- ptest result ---"
+# libc-test runs tests by module(e.g. src/api) and generates sub-module test
+# report(e.g. src/api/REPORT) first. After all tests finish, it generates the
+# consolidated report file src/REPORT.
+report="/opt/libc-test/src/REPORT"
+if ! [ -f "${report}" ]; then
+    echo "${report} not found!"
+    echo "FAIL: libc-test"
+    exit 1
+# libc-test prints error on failure and prints nothing on success.
+elif grep -q '^FAIL src.*\.exe.*' "${report}"; then
+    # Print test failure in ptest format.
+    # e.g. "FAIL src/api/main.exe [status 1]" -> "FAIL: api_main"
+    grep '^FAIL src.*\.exe.*' "${report}" \
+        | sed 's|^FAIL src/|FAIL: |;s|/|_|;s|\.exe.*\]||'
+    exit 1
+else
+    echo "PASS: libc-test"
+fi
diff --git a/meta/recipes-core/musl/libc-test/run-ptest b/meta/recipes-core/musl/libc-test/run-ptest
index 0b4b687dec..53cd34f506 100644
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
index 6d64592f0c..060f5f9f12 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -13,6 +13,7 @@ SRCREV = "18e28496adee3d84fefdda6efcb9c5b8996a2398"
 SRC_URI = " \
     git://repo.or.cz/libc-test;branch=master;protocol=https \
     file://run-ptest \
+    file://run-libc-ptests \
 "
 
 PV = "0+git${SRCPV}"
@@ -47,5 +48,9 @@ do_install () {
     cp -r ${S}/src ${D}${install_path}
 }
 
+do_install_ptest_base:append() {
+    install -Dm 0755 ${WORKDIR}/run-libc-ptests ${D}${PTEST_PATH}/run-libc-ptests
+}
+
 COMPATIBLE_HOST = "null"
 COMPATIBLE_HOST:libc-musl = "(.*)"
-- 
2.34.1


