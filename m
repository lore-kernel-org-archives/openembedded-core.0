Return-Path: <chase.qi@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6473C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 06:47:28 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.502.1667976448056194890
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 22:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iG8Licm0;
 spf=pass (domain: linaro.org, ip: 209.85.215.182, mailfrom: chase.qi@linaro.org)
Received: by mail-pg1-f182.google.com with SMTP id f63so15433129pgc.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 22:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ciy7iww4kF9FxaLV6D4FwUwdipHmv9T6FKG4ZkxG320=;
        b=iG8Licm0pIlZZNN7NBrGLIlAoKJxwcDrr9lwgB2+FhLkFLGN4bT99R+7n64fZyafJC
         9SBEyFXlwjxPaZM3amM3JH2ZViqypT+oVNSWMB/23HzYIkSWv8eZt/73AMkCaFFhpBNW
         DS7M4rFdm0PARthN1HDXKB//B1i0OtX9ct6cCxUGnbTFNePpEBsRvFb+G4CfTFY7lBoD
         +RuM67TK2k8ajUYd12eKSAKZsDgshkSkrqks/Pv5tidk4180K9wQ5grmS32WArFNI+yf
         59DKM6UdJxzsWk683pC3oiOWB6ll/cLZE4uaqmru32qAfqPeBgQvjvnJkrRDPbyhG0vj
         ELIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ciy7iww4kF9FxaLV6D4FwUwdipHmv9T6FKG4ZkxG320=;
        b=XgyktIJ8muCDhnS+cSN8nQ2U74qkHShmtn/pSRM/tUXb9b5TGGE+aMz05F0KGpiNwh
         g1LmU/zVPb/NcwGBoHTRCDFQU30ey0B0SIg9fGuBO3XfOFRkF8ZCjNSsOsabzceugP4x
         JxZ18AaL812Mg+Ns4ZW9711kQSR7o/UNP9P9DIV3m52GhR03H4S5jDdOHZT8zQJ0tTNS
         UtIhDAJE1UwEz1HYVMd66MQv+95fuT6kdbpaxOkIkfqWd+9RKzOa7retSGJhngRuCx8c
         BOBHtwcjjAyyIId462LskRhP0KPPtjqZbNZ/4C+9D8O0NtIv9iXxy2ox93hyBGwaZcoS
         YxQg==
X-Gm-Message-State: ACrzQf0CsHCXopWum3btcBQOOCL7oukGNYNu6TOZEvSYX13D+6qLQWdK
	EZxTIhWXUKQ7coAQaOefTHEywmNUXYZqkFhC
X-Google-Smtp-Source: AMsMyM75ZZsBTkHk10za0iCZR7qgnG+KcT2RA600mltehK3gwFdjlrbHKPcIPtDxpNo5YizFpbRuhQ==
X-Received: by 2002:a65:6a0f:0:b0:46e:f67c:bcee with SMTP id m15-20020a656a0f000000b0046ef67cbceemr51428591pgu.38.1667976447203;
        Tue, 08 Nov 2022 22:47:27 -0800 (PST)
Received: from localhost.localdomain ([107.161.26.140])
        by smtp.gmail.com with ESMTPSA id n190-20020a6227c7000000b0056cea9530b6sm7458650pfn.202.2022.11.08.22.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 22:47:26 -0800 (PST)
From: Chase Qi <chase.qi@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Chase Qi <chase.qi@linaro.org>
Subject: [PATCH v4] libc-test: add libc testsuite for musl
Date: Wed,  9 Nov 2022 06:47:09 +0000
Message-Id: <20221109064709.3543904-1-chase.qi@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 06:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173012

libc-test is a collection of unit test to measure the correctness and
robustness of a C/POSIX standard library implementation. It is developed
as part of the musl project.

Signed-off-by: Chase Qi <chase.qi@linaro.org>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/musl/libc-test/run-ptest    | 28 ++++++++++
 meta/recipes-core/musl/libc-test_git.bb       | 51 +++++++++++++++++++
 4 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-core/musl/libc-test/run-ptest
 create mode 100644 meta/recipes-core/musl/libc-test_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 57319cd8f5..5b7ce77c3c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -306,6 +306,7 @@ RECIPE_MAINTAINER:pn-libarchive = "Otavio Salvador <otavio.salvador@ossystems.co
 RECIPE_MAINTAINER:pn-libassuan = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libatomic-ops = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libbsd = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-libc-test = "Chase Qi <chase.qi@linaro.org>"
 RECIPE_MAINTAINER:pn-libcap = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng-python = "Yi Zhao <yi.zhao@windriver.com>"
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


