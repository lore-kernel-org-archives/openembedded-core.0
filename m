Return-Path: <chase.qi@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA35C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 03:42:57 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.4157.1667878970377135829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 19:42:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vTOS18kr;
 spf=pass (domain: linaro.org, ip: 209.85.216.45, mailfrom: chase.qi@linaro.org)
Received: by mail-pj1-f45.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so11874476pjs.4
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 19:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ImGaGbolnMJQHL01KxlPOrYmegz9iuZkj3nhbb40lxI=;
        b=vTOS18krlvMb8KsQwbtFpmmIG8VA1g1PyiOs/AdpmbAbOfir+u0SPT1dmwHWPaoIb+
         sh/pLrhUn0o+ZizUmLsSHg8gfFsRTIKrPJZa8rzth2ZZx3V1U2W+jDkoM4rsHFkTdD8i
         NYbgJCyujVoyJMIfTZGsgdnt01JmOSBWnCrONDvEMsX7AXUQUuTlVi0hBxkGctEMDxl2
         Gfm/5nAwP5TTahT1HDWONFNCMr++AyB1AiM6k74mXMxsKuiIZvi0CmeHQyR6PNxNQfKV
         3vwLQqJq8askeEVqoNkspTostHvcXK60pQLChmOs62DTAjblUm4MQnuGYsMZMHv3kC5z
         mh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImGaGbolnMJQHL01KxlPOrYmegz9iuZkj3nhbb40lxI=;
        b=4TLr+w4J1eEeA0EkGCJNSeUwE/bmeCFiRbZ9BuUhw8z/RGbCjFTwHoGh0vVdhu/mWr
         rZOV4zrIuEy0q1YPNDePXSP5DaNHw2VJ+04Ita/+PLXoANeH9GUYNdiwICeODldKCQaN
         tPjD2NuSi1FG71HOk/24ocqFTNVG5fgbhRmjOb7kLDCpvDQV0bNCgwIyriGdL7DtQ1E2
         coTBijS2U+K7agsdAflSVGR5c+yl4auKC8zDoGy9ZuN6t0tTolojWVE69CLHh6ZPytYN
         etCYc1X65cZcpGvtOLGUBUdED/UZc8F8ggKZ+z3J5d85orGhWE2yNPuGiuLeXIe4Xz0w
         fLVg==
X-Gm-Message-State: ACrzQf1VBzxMHsEFsMXtZ50VCfS9NoGp3+UyeZ7NQSW5uxJPco9ellQc
	L63IyeWXkmoMC+kqTpreH6VszL2BQxWIgsHd
X-Google-Smtp-Source: AMsMyM4PODNXbc98va/9DJiGCwmdZDdrwcz0PUGZs4fl9gSzlWZUszS9VsP6YVqyUYf7qwELDZSZHA==
X-Received: by 2002:a17:903:18d:b0:186:9862:d15f with SMTP id z13-20020a170903018d00b001869862d15fmr53430266plg.6.1667878969440;
        Mon, 07 Nov 2022 19:42:49 -0800 (PST)
Received: from localhost.localdomain ([107.161.26.140])
        by smtp.gmail.com with ESMTPSA id nm1-20020a17090b19c100b00214247ac1acsm6974695pjb.12.2022.11.07.19.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 19:42:49 -0800 (PST)
From: Chase Qi <chase.qi@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Chase Qi <chase.qi@linaro.org>
Subject: [PATCH v3] libc-test: add libc testsuite for musl
Date: Tue,  8 Nov 2022 03:42:33 +0000
Message-Id: <20221108034233.3452233-1-chase.qi@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 03:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172948

libc-test is a collection of unit test to measure the correctness and
robustness of a C/POSIX standard library implementation. It is developed
as part of the musl project.

Signed-off-by: Chase Qi <chase.qi@linaro.org>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/musl/libc-test/run-ptest    | 28 ++++++++++
 meta/recipes-core/musl/libc-test_git.bb       | 51 +++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-core/musl/libc-test/run-ptest
 create mode 100644 meta/recipes-core/musl/libc-test_git.bb

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 32b0e5297a..3c9ff43bd9 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -105,6 +105,7 @@ PTESTS_SLOW = "\
 
 PTESTS_SLOW:remove:riscv64 = "valgrind-ptest"
 PTESTS_PROBLEMS:append:riscv64 = "valgrind-ptest"
+PTESTS_SLOW:append:libc-musl = " libc-test-ptest"
 
 #    ruby-ptest \ # Timeout
 #    lz4-ptest \ # Needs a rewrite
diff --git a/meta/recipes-core/musl/libc-test/run-ptest b/meta/recipes-core/musl/libc-test/run-ptest
new file mode 100644
index 0000000000..0b4b687dec
--- /dev/null
+++ b/meta/recipes-core/musl/libc-test/run-ptest
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
diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
new file mode 100644
index 0000000000..b5bfc6e34c
--- /dev/null
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -0,0 +1,51 @@
+SUMMARY = "Musl libc unit tests"
+HOMEPAGE = "https://wiki.musl-libc.org/libc-test.html"
+DESCRIPTION = "libc-test is a collection of unit tests to measure the \
+correctness and robustness of a C/POSIX standard library implementation. It is \
+developed as part of the musl project."
+SECTION = "tests"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=43ed1245085be90dc934288117d55a3b"
+
+inherit ptest
+
+SRCREV = "18e28496adee3d84fefdda6efcb9c5b8996a2398"
+SRC_URI = " \
+    git://repo.or.cz/libc-test;branch=master \
+    file://run-ptest \
+"
+
+PV = "0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+# libc-test 'make' or 'make run' command is designed to build and run tests. It
+# reports both build and test failures. The commands should be run on target.
+do_compile() {
+    :
+}
+
+RDEPENDS:${PN} = " \
+    bash \
+    grep \
+    musl \
+    packagegroup-core-buildessential \
+"
+
+RDEPENDS:${PN}-ptest = " \
+     ${PN} \
+     sed \
+"
+
+install_path = "/opt/${PN}"
+FILES:${PN} += "${install_path}/*"
+
+do_install () {
+    install -d ${D}${install_path}/
+    cp ${S}/Makefile ${D}${install_path}
+    cp ${S}/config.mak.def ${D}${install_path}/config.mak
+    cp -r ${S}/src ${D}${install_path}
+}
+
+COMPATIBLE_HOST = "null"
+COMPATIBLE_HOST:libc-musl = "(.*)"
-- 
2.25.1


