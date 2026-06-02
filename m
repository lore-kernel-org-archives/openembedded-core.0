Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6365DCD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 12:02:16 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23361.1780401726631704251
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 05:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OqsNl8ws;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8584e80bd3so1269019a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 05:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401726; x=1781006526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PYJrwf2wjynM/yxJOMjiUyFp1zFTGPaXrwHMvNfy2A=;
        b=OqsNl8wsacW6lnM/NFiX7Esgny1I1zI/D4JW6pi1wKv8BWZez2vM8AFMpgpVuxqHga
         u33VzI/zxCjRTK3MM+Eqggj0RXCTsZLIKdPurxnieYZ+kG9w0y2PdyG6s5CDGXlUjDt5
         MN2rbbVZ/75Ws6kWa/0VOo7QCKjvu7NyM2gJGfXfJT4dFhyCIqRDtcH3jbeih4hV07nL
         JTAAkODHGsfCgCwFU1+6QnNz4U03jVQYg3lNIKeyUoIclOG/69AelN9K0hQ2yJoC3mVV
         VzIwn0c36Cv853vB360qZBWQxRI19g3PlYtKg3IRy2ZtR8r+ETbiMOdVyGL8ocQpn+RT
         vImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401726; x=1781006526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PYJrwf2wjynM/yxJOMjiUyFp1zFTGPaXrwHMvNfy2A=;
        b=Zx/6e/srSf2yjC8Qa96556fUnrohdDt4NhOWw0lBIm0IXc51K55UU3Aj8Gbh6MsRfE
         RtmQMg4HQtx8+vMHmnFOwMm/O7enLuzwcFk8tPUOgZ3Mdbgo2A/O2D/+kr14C1p/EUcO
         kwc4cIMu3SbVuv9OeVoqw9X9/IT768YssCRVTWqp5K/l2VayvgpQ8SHK7fK0fD+jNSs9
         ULmHTmGk0yYDl0Xs2CdEwYSu5DLYU5v63fWL+bnTGbhslg1ObAKNaYVsXqVs0ZKLj+Zz
         NmK18jO3b5ZVLXZkhqFjm3Uk9o0WqbH1ImoNK8s1VeCqS3Qeg4cmdV6jbSnn1/4HnvG/
         cSHA==
X-Gm-Message-State: AOJu0Yw7Ux5aIiP2G2GbK/tqT4TWEbUM7zZhWLXsq2kCWNBcGeXUanV5
	HQO7txjnvKaEW3Ogah17vSRVXFOziaP/mEAqByXMbvo6pgGbEEa6cYc=
X-Gm-Gg: Acq92OGo8wRJuGiurW7GTna19YD1BzgHz21VnJZ7O9k42j+JrdvFUmkN3BJ2MhnR385
	DvB+qRO+1UnxUjYvdfDCcC6HXSRhmfwiZGGb1d5uV7vf6jyzW0bv6Aw/bwHPXvU1QK8BIF4NYrA
	lPrHxqCDB6VYOtyXVj2O5KkY+9dvc2EyEIo9hgm2cAWnKKrlZ1ny3Imi9g23iB4F6jSmSbuVZj8
	hMokBQiI4pc02zxpJJZvDspSO24/DWF/vtw0AJgqbFQmNBi8A61CjJDQBAz6cYi1gBAqrYX9eP2
	bzV0PGlA/xEgpFbE+4jtr6DvY3MW9CSa9CMGncSbyWreByx5Mue8O60iEWBxtI/jkZCDZ5yjWA7
	SkytXIQQdzHHc5m9smi3Xz2Va1bnRZ7u4UucCLy1SNTAFA8M4p4iXSzwlBBmybWp2TWsDEe06U1
	OQ9lZ2HQ+iQOqfyhDVjin2UVrzy7uBc9frxpBt98eh60lrcgM=
X-Received: by 2002:a05:6a20:7d86:b0:39b:ae5c:164d with SMTP id adf61e73a8af0-3b427fdcccbmr16775883637.4.1780401725789;
        Tue, 02 Jun 2026 05:02:05 -0700 (PDT)
Received: from BLR1LPT000710.. ([2409:40f2:2011:7b5a:eebd:710:ba44:1784])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771d367esm12370986a12.11.2026.06.02.05.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 05:02:05 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Nikhil R <nikhilar2410@gmail.com>
Subject: [OE-core][master][PATCH v2] rsync: add ptest support
Date: Tue,  2 Jun 2026 12:01:35 +0000
Message-ID: <20260602120135.4181978-1-nikhilar2410@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 12:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238037

Package the upstream rsync testsuite and helper binaries
into rsync-ptest package and add a run-ptest wrapper for
executing the tests.

backup.test is skipped due to intermittent failures
observed on qemux86-64.
The issue has been reported upstream:

https://github.com/RsyncProject/rsync/issues/941

Tested on qemux86-64 using ptest-runner with all
executed tests passing.

Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/rsync/files/run-ptest   | 17 +++++++
 meta/recipes-devtools/rsync/rsync_3.4.2.bb    | 46 ++++++++++++++++++-
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rsync/files/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 50b6a8a41e..40af77a697 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -95,6 +95,7 @@ PTESTS_FAST = "\
     qemu \
     quilt \
     rpm-sequoia \
+    rsync \
     sed \
     slang \
     utfcpp \
diff --git a/meta/recipes-devtools/rsync/files/run-ptest b/meta/recipes-devtools/rsync/files/run-ptest
new file mode 100644
index 0000000000..762efd23a3
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+cd $(dirname $0)
+
+# backup.test intermittently fails on qemux86-64
+# (observed ~5 failures in 20 runs).
+# Upstream: https://github.com/RsyncProject/rsync/issues/941
+TESTS=$(cd testsuite && \
+    ls *.test | \
+    sed 's/\.test$//' | \
+    grep -v '^backup$')
+
+python3 runtests.py \
+    --rsync-bin=/usr/bin/rsync \
+    --tooldir=$(pwd) \
+    --srcdir=$(pwd) \
+    $TESTS
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.2.bb b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
index 5fe1bc2c2b..29f89284fb 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.2.bb
@@ -15,12 +15,18 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            file://determism.patch \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
+           file://run-ptest \
            "
 SRC_URI[sha256sum] = "ff10aa2c151cd4b2dbbe6135126dbc854046113d2dfb49572a348233267eb315"
 
+RDEPENDS:${PN}-ptest += "\
+    python3-core \
+    python3-asyncio \
+    bash \
+"
 # Out-of-tree builds don't install the documentation currently
 # https://github.com/RsyncProject/rsync/issues/846
-inherit autotools-brokensep
+inherit autotools-brokensep ptest
 
 PACKAGECONFIG ??= "acl attr \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
@@ -62,6 +68,44 @@ do_install:append() {
 	install -m 0644 ${UNPACKDIR}/rsyncd.conf ${D}${sysconfdir}
 }
 
+# Avoid "make check" since it executes the testsuite during the build.
+# Only build the helper binaries required by the ptest package.
+do_compile_ptest() {
+    oe_runmake \
+        tls \
+        getgroups \
+        getfsdev \
+        testrun \
+        trimslash \
+        t_unsafe \
+        wildtest \
+        simdtest
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    install -d ${D}${PTEST_PATH}/support
+    cp -r ${S}/support/* ${D}${PTEST_PATH}/support/
+
+    # Several upstream tests access files directly from ${srcdir}
+    # (e.g. fuzzy.test, itemize.test, mkpath.test and wildmatch.test).
+    install -m 0644 ${S}/configure.ac ${D}${PTEST_PATH}/
+    install -m 0644 ${S}/rsync.c ${D}${PTEST_PATH}/
+    install -m 0644 ${S}/rsync.h ${D}${PTEST_PATH}/
+    install -m 0644 ${S}/wildtest.txt ${D}${PTEST_PATH}/
+
+    install -m 0755 ${S}/runtests.py ${D}${PTEST_PATH}/
+    install -m 0644 ${B}/config.h ${D}${PTEST_PATH}/
+    install -m 0644 ${S}/config.sub ${D}${PTEST_PATH}/
+
+    cp -r ${S}/testsuite ${D}${PTEST_PATH}/
+
+    for p in tls getgroups getfsdev testrun trimslash t_unsafe wildtest simdtest; do
+        install -m 0755 ${B}/$p ${D}${PTEST_PATH}/
+    done
+
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2024-12084] = "fixed-version: fixed since v3.4.0"
-- 
2.43.0


