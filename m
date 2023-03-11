Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EADCC6FD1F
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.35738.1678494454290777969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dla6kWMG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id h14so6569122wru.4
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGIzl3DcMalCsHueiCIylw9PwsDLBPltXrN91ITHheg=;
        b=Dla6kWMGek522OOGraQTwEdxgP+dAVWrE/eUDmgvnkiAthHJ5lJFQ3UD5YXoyqK5YL
         jzlVdglPEXm99P0LYaV00YoK7lGDROFcO022FcMhBm2Hj/e5GdoZN0Kr9fWxS8vDlizY
         7QDm2ysSI7LF2Yg2E1PMpDtVCCDhOpYo/NiOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGIzl3DcMalCsHueiCIylw9PwsDLBPltXrN91ITHheg=;
        b=nr6mTjyl7yCIScFcCDEjd7zCf2nswHSUZLWZBk5ISUv2gg1aAX0SEJ4LYA9C7tSnem
         BfJ6Q914AzG/PfPy19f8SUPYo7s6+rcvRRBcvExbSLIgsLJXsWdYUK3aHwRw1bt5URm8
         1RHGYAMRvpxGPdqzBA8YYvZasuJ/dmmfkt5t216lDgj3mKB0vupYf1R9QuGDGuQy1oeQ
         TREMM7TuEK/2jCxviaEW923ijqenJow0E69+5stVKAAed/oSCgJ0LyZhbG68NsBfyhmj
         i9BWEFEDZj7HAZdkDJf6akGJKVDzx755ujR8AwRi5spn0JsnKE872N80fr0gKzMLjdG1
         6s1g==
X-Gm-Message-State: AO0yUKVdhIKqFIteQg61L3Z+0jumCdfyfCni70u8L+/jhMFp5QeNIXbU
	kFgrFlzSPGFGyfPQxdkjjJG3K3WTUsfqQZ9HEUs=
X-Google-Smtp-Source: AK7set8BpaZdYtIuUGVCP7FVtGKvqsBbLXtqEz9/s5sgZvJmTT/eWnRpb2Y2aKoWldt6CIHrEVT7TA==
X-Received: by 2002:adf:fd89:0:b0:2c7:ce2:6479 with SMTP id d9-20020adffd89000000b002c70ce26479mr18008346wrr.40.1678494452605;
        Fri, 10 Mar 2023 16:27:32 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/16] lttng-tools: Improve ptest debugging and fix dependencies
Date: Sat, 11 Mar 2023 00:27:21 +0000
Message-Id: <20230311002722.3211118-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178359

Improve the ptest runner script:

* log output is available should any test fail to aid debugging
* document how to limit the runner to a single test
* stop hiding errors to stderr
* allow easier single test execution by avoiding path issues with PWD

Also depend upon binutils since one of the tests uses addr2line.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../lttng/lttng-tools/run-ptest               | 19 ++++++++++++++++---
 .../lttng/lttng-tools_2.13.9.bb               |  4 ++--
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
index c4dbe50f21b..bf99322ef21 100755
--- a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
+++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
@@ -2,6 +2,19 @@
 # Without --ignore-exit, the tap harness causes any FAILs within a
 # test plan to raise ERRORs; this is just noise.
 export LD_LIBRARY_PATH=FIXMEPTESTPATH/tests/utils/testapp/userspace-probe-elf-binary/.libs
-makeargs="LOG_DRIVER_FLAGS=--ignore-exit top_srcdir=$PWD top_builddir=$PWD"
-make -k -t all >/dev/null 2>&1
-exec make -k -s $makeargs check 2>/dev/null | sed -e 's#/tmp/tmp\...........#/tmp/tmp.XXXXXXXXXX#g'
+makeargs="LOG_DRIVER_FLAGS=--ignore-exit top_srcdir=FIXMEPTESTPATH top_builddir=FIXMEPTESTPATH"
+make -k -t all >error.log 2>&1
+# Can specify a test e.g.:
+# -C tests/regression/ check TESTS='kernel/test_callstack'
+make -k -s $makeargs check 2>error.log | sed -e 's#/tmp/tmp\...........#/tmp/tmp.XXXXXXXXXX#g'
+exitcode=$?
+if [ -e error.log ]; then
+    cat error.log
+fi
+if [ -e tests/unit/test-suite.log ]; then
+    cat tests/unit/test-suite.log
+fi
+if [ -e tests/regression/test-suite.log ]; then
+    cat tests/regression/test-suite.log
+fi
+exit $exitcode
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
index 340b254b46a..58c0378d66f 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.9.bb
@@ -15,7 +15,7 @@ include lttng-platforms.inc
 DEPENDS = "liburcu popt libxml2 util-linux bison-native"
 RDEPENDS:${PN} = "libgcc"
 RRECOMMENDS:${PN} += "${LTTNGMODULES}"
-RDEPENDS:${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep"
+RDEPENDS:${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-core grep binutils"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-utils"
 # babelstats.pl wants getopt-long
@@ -84,7 +84,7 @@ do_install_ptest () {
     done
 
     # Patch in the correct path for the custom libraries a helper executable needs
-    sed -i -e 's!FIXMEPTESTPATH!${PTEST_PATH}!' "${D}${PTEST_PATH}/run-ptest"
+    sed -i -e 's!FIXMEPTESTPATH!${PTEST_PATH}!g' "${D}${PTEST_PATH}/run-ptest"
 
     # Prevent 'make check' from recursing into non-test subdirectories.
     sed -i -e 's!^SUBDIRS = .*!SUBDIRS = tests!' "${D}${PTEST_PATH}/Makefile"
-- 
2.38.1


