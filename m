Return-Path: <chase.qi@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23361C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 05:42:00 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.16168.1667454111806280742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 22:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LSnTFVhe;
 spf=pass (domain: linaro.org, ip: 209.85.210.173, mailfrom: chase.qi@linaro.org)
Received: by mail-pf1-f173.google.com with SMTP id q9so702562pfg.5
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 22:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xubeEaczaT4ZCVNIeW73wfot37DKk2can+d78J1T+YA=;
        b=LSnTFVhe6Tk5ClVbYjE1xQndsZHq+gVL4FKZEUx4IfnFb/JxcQfes6v8WdIl5EwodZ
         xWueTiRNCSEw6TdkkmFqbAc+nDH8eJYDg3dcqqKvOM7ETBEHz0ZICCyiKk0kr0YdNjH0
         4Lc7y6WQZp65JUIwx4Mung7xVpP7zH+7jXk8EDVXkrAJxgvBMvm/MkEDCbjM8UD/4AeM
         sAGh8/s7eAzAWbGZl9FI3EegU6FuGiIrX3l43qw0B5QUccXGIICRQcP6GL2iJdOtXhcA
         MxZZ+8QRdvUOY/C/SNfFQvh0FZhfRCpE3Xh7rwcPES1T+bTqqZarQ/40foPQ2Wtt4abo
         jn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xubeEaczaT4ZCVNIeW73wfot37DKk2can+d78J1T+YA=;
        b=GGDrYIkVv0aNhXpgxi2mzRBLinCWgWhf8tZAghsgTlZRTxZaX+aQBTW0PdhruKqNNT
         L/tztKpmaj/vPyQ5Zd0DcKCZmAe9ClzKSbs0/U7bZX/t/Ie0tRta9FRfD9rPVJNgZbMa
         IdadAPKwOT7Kfjh4sGK0vI4X8BxOHXQVgBhl+vWqaeLPMssjcihYTWqWvxIEbWG1lW0I
         5OlopRglxaSrkSjnjz4Vw79hZrTCRdA/Lmsbivz7mB532N/SvF9dcdpEiyhBPkKtXm57
         Zgn3UA+l31z0Hj0Kw5nYyhWcMH5H/lRqi5I70648hns6X3NaxN0uotJNDPYIGgnAd/tb
         l5HA==
X-Gm-Message-State: ACrzQf1w6qIUaPcP5tX7CX3gSKB0kEYHFv0Gs85HwdBTXWoXiwAf3wxZ
	6q4WbOa/GXZmsa3iDJGv7/L7vnDcE+Qxay6Hx+M=
X-Google-Smtp-Source: AMsMyM7ui1FjCplTVyQVzJ/wLGMXSDTWttv1wSMihm0M/vRyw+8Wgk1t/vPB94Ea8TXB0S/o64FXaQ==
X-Received: by 2002:a05:6a00:88f:b0:558:8186:3ec3 with SMTP id q15-20020a056a00088f00b0055881863ec3mr28259274pfj.83.1667454111081;
        Wed, 02 Nov 2022 22:41:51 -0700 (PDT)
Received: from localhost.localdomain ([107.161.26.140])
        by smtp.gmail.com with ESMTPSA id e15-20020a170902ed8f00b0016be834d54asm9284613plj.306.2022.11.02.22.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 22:41:50 -0700 (PDT)
From: Chase Qi <chase.qi@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Chase Qi <chase.qi@linaro.org>
Subject: [PATCH] libc-test: add libc testsuite for musl
Date: Thu,  3 Nov 2022 05:39:26 +0000
Message-Id: <20221103053926.719998-1-chase.qi@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 05:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172610

libc-test is a collection of unit test to measure the correctness and
robustness of a C/POSIX standard library implementation. It is developed
as part of the musl project.

Signed-off-by: Chase Qi <chase.qi@linaro.org>
---
 meta/recipes-core/musl/libc-test/run-ptest | 17 ++++++++
 meta/recipes-core/musl/libc-test_git.bb    | 45 ++++++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/musl/libc-test/run-ptest
 create mode 100644 meta/recipes-core/musl/libc-test_git.bb

diff --git a/meta/recipes-core/musl/libc-test/run-ptest b/meta/recipes-core/musl/libc-test/run-ptest
new file mode 100644
index 0000000000..30abcdfba5
--- /dev/null
+++ b/meta/recipes-core/musl/libc-test/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
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
+    exit 0
+fi
diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
new file mode 100644
index 0000000000..d5d8845727
--- /dev/null
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Musl libc test to be run with ptest"
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
+RDEPENDS:${PN}-ptest = " \
+    bash \
+    grep \
+    musl \
+    packagegroup-core-buildessential \
+    sed \
+"
+
+do_install_ptest () {
+    cp ${S}/Makefile ${D}${PTEST_PATH}
+    cp ${S}/config.mak.def ${D}${PTEST_PATH}/config.mak
+    cp -r ${S}/src ${D}${PTEST_PATH}/
+}
+
+# libc-test-ptest depends on empty libc-test.
+ALLOW_EMPTY:${PN} = "1"
+
+COMPATIBLE_HOST = "null"
+COMPATIBLE_HOST:libc-musl = "(.*)"
-- 
2.25.1


