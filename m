Return-Path: <chase.qi@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19403C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 10:02:20 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.9353.1667556138599482841
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 03:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=PGogyntR;
 spf=pass (domain: linaro.org, ip: 209.85.216.49, mailfrom: chase.qi@linaro.org)
Received: by mail-pj1-f49.google.com with SMTP id k5so4056417pjo.5
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y9F0sI4nTky9QsmldEVCmL3Q83LtkY8R++HZ/cZt1HE=;
        b=PGogyntRlAj+wWl3315vyk7NpCVXHbu/I7Ng3yfxjkkmjtmI7euDTqlbImMrFuZiw2
         L/HuuW/kFgoPNwi4O4MKUmMHM/goO25PGtXjFR1L2+aDn/BA+VwWF89beXwhaxyGlHKN
         nL0Amxd8uMysD6OIIREbpMqukc/ZfaTCel1dhh7icQq4F2sD9WCbLjnXy6OX7NSWMuE5
         PA8wKEeoQzXXQ0ROybgbv/iuPtxEivuDIejT6o+KkApb6xEglwQeUPyS0FqBpUXx8q93
         xXnFXe/8hm1PZPrIH/u/2cpIcCammuPl3bGiYKfioG3VDlE8/9qdfElKO+D4JySUNL2f
         NtEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9F0sI4nTky9QsmldEVCmL3Q83LtkY8R++HZ/cZt1HE=;
        b=Lok6SbmNKDUuyKZah8WUFDRTs6YBMxXnpWwGvYEKJF9HL2ACWOcljFADvsPi7UjlOO
         Q+ycUsI8F3oYp+XsywHgtyFfNxX/qfT+GOGbuYxPvg/mEn28nAhgwJBQ9deh5x9+iXWX
         BWHQxAdlIoX95kuEbCw/lu6zoAVKk2E/pefpG+5arB4mL21TrZFr1lAjsckYsgyNYTU2
         l9Jkcua0q9iJzCbdhfHkymuw3wC1u1BqoXHzO7o1xeLuucCfc55wCEkv3D1HdEHuzY5E
         Hy+19ZH7+rWWoMuRTVnPplf/voxQvZ3b/2pc6RKXhpBSSHZO9WJrMa3gMkiDWLmOGZ4E
         4oaw==
X-Gm-Message-State: ACrzQf0kN/DHQpsCNNafnz+H9WIkhcEzTArdZoX6xLCzv39H2KCzoG2e
	IEXGHt4+RDpqI6emxPwt4W+Ho364Bpuo9Fd5
X-Google-Smtp-Source: AMsMyM6/5deCiggVolJKIaWIh/Gtm16s1ZeyGTcrPtwk3yj5dP13rTjl6WaH40IkU56s0XHEst4QWg==
X-Received: by 2002:a17:90b:3149:b0:213:63d0:88d6 with SMTP id ip9-20020a17090b314900b0021363d088d6mr36092800pjb.145.1667556137631;
        Fri, 04 Nov 2022 03:02:17 -0700 (PDT)
Received: from localhost.localdomain ([107.161.26.140])
        by smtp.gmail.com with ESMTPSA id n9-20020a63ee49000000b0046ff3634a78sm2043948pgk.71.2022.11.04.03.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 03:02:17 -0700 (PDT)
From: Chase Qi <chase.qi@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Chase Qi <chase.qi@linaro.org>
Subject: [PATCH v2] libc-test: add libc testsuite for musl
Date: Fri,  4 Nov 2022 10:01:40 +0000
Message-Id: <20221104100140.976337-1-chase.qi@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 10:02:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172705

libc-test is a collection of unit test to measure the correctness and
robustness of a C/POSIX standard library implementation. It is developed
as part of the musl project.

Signed-off-by: Chase Qi <chase.qi@linaro.org>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-core/musl/libc-test/run-ptest    | 17 +++++++
 meta/recipes-core/musl/libc-test_git.bb       | 50 +++++++++++++++++++
 3 files changed, 68 insertions(+)
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
index 0000000000..a30cee590e
--- /dev/null
+++ b/meta/recipes-core/musl/libc-test/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+cd /opt/libc-test
+make cleanall
+make run | tee libc-test.log
+
+echo ""
+echo "--- ptest result ---"
+if grep -q '^FAIL src.*\.exe.*' libc-test.log; then
+    # Consolidate output format.
+    # e.g. "FAIL src/api/main.exe [status 1]" -> "FAIL: api_main"
+    grep '^FAIL src.*\.exe.*' libc-test.log \
+        | sed 's|^FAIL src/|FAIL: |;s|/|_|;s|\.exe.*\]||'
+    exit 1
+else
+    echo "PASS: libc-test"
+fi
diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
new file mode 100644
index 0000000000..091aec74fd
--- /dev/null
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -0,0 +1,50 @@
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
+    git://nsz.repo.hu:49100/repo/libc-test;branch=master \
+    file://run-ptest \
+"
+MIRRORS += "git://nsz.repo.hu:49100/repo/libc-test git://repo.or.cz/libc-test"
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
+ RDEPENDS:${PN}-ptest = " \
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


