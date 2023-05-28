Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8402FC7EE2F
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:28 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.32993.1685293701302189309
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=b25/5JbU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-64f47448aeaso1848277b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293700; x=1687885700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqWCxiVWwmvmWYlfWpt74NtBI0GiCy3wIAAZEJF4EVY=;
        b=b25/5JbUi/0LSzpdFmPN2NyQ2+p1gsNc0Jsx74UALr1qtFwPqCZ2BrC8Ww8BLton0p
         q6podt7ZjpoXRW5Oe7IpNZl5yYzvXfZgmhv3S8XlJN0hHw1vvk6+DfPoMj7JG7sS9b/E
         PZxhmK0raBs8dJ/F/Wsn02M4BCqDn5lTt5TX4cV5DywktvzM9KAMT9+v88tuDFyirnWw
         LeljZ+gVa/RWNcofmb/XzW7ydTXmVzXx79CnuQ28Afdygk3lAzdpVUEVzneXJlsthmOB
         H0fKrs6aJhA47aQSRB2I+koZpRvxvM/yW46vUCMbYCKlpiMft9tsFnqQA1jKuTh/heA1
         U4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293700; x=1687885700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqWCxiVWwmvmWYlfWpt74NtBI0GiCy3wIAAZEJF4EVY=;
        b=SbTarAiCcUIJ+Zm55JJ7yxymymFxjr021I7Cco5UGrBXJMaDUWOs92xgeMopIxKWY8
         XItzqYc2Eg3muRxMI2OL2kiF1V2JpQL+AhSEF30K2VgGnSgGDS2edZE2EceunWV4ojjw
         TZ9QoymYIVXvOo7vE4mxMg/0E5sKa3lsJkTL/Z14ZZdUJiMDNStANgyUeJBzEv29HgT6
         C0m3TirXQobywPpgsSjO4paBnYs5cRYX1wwGpIGI+Ts+w4ZPJAd9rfK8VtXL1teFe3/o
         eLpMU8hBuApr1k4CnefQu2QbpekmPAUPx6KON4LkZmNe8UbNLcFewEoqjo1KMIEcuOUQ
         xzMA==
X-Gm-Message-State: AC+VfDwLgSL+cj804Jti9bjMF0yNKSmBhTCy6jLyayXKVoweZyYCx46+
	Gww57tkkOqnTMbhRRaVPdn598dpW5D2K0NrE41s=
X-Google-Smtp-Source: ACHHUZ7/ojDGiJLQl7Y7CKCDghqqkZDF/XGUvmQVqh4C2q39oNu7TDxEEhbPzpiCCB7co7zKxnLdvQ==
X-Received: by 2002:a05:6a00:1913:b0:64d:722d:a8d9 with SMTP id y19-20020a056a00191300b0064d722da8d9mr12450606pfi.28.1685293700314;
        Sun, 28 May 2023 10:08:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/12] cpio: Run ptests under ptest user
Date: Sun, 28 May 2023 07:07:53 -1000
Message-Id: <fd5bd772ab031606dcfe637fe7425b52b51365fa.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685291299.git.steve@sakoman.com>
References: <cover.1685291299.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181845

From: Khem Raj <raj.khem@gmail.com>

Running these tests under root user on musl works ok but it emits
additional diagnostic

cpio: dir: Cannot change ownership to uid 0, gid 0: Not supported

Ideally its better to run this test suite under non-root user which
is often how these are run. Moreover, tests work on musl as well.

(From OE-Core rev: 22d19266269c28f596f031fcba8f2831c6465880)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 587e007d9febfe92fef434dea984d31642bb23a1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cpio/cpio-2.13/run-ptest |  9 +--------
 meta/recipes-extended/cpio/cpio-2.13/test.sh   | 10 ++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb        | 18 +++++++++++++++++-
 3 files changed, 28 insertions(+), 9 deletions(-)
 mode change 100644 => 100755 meta/recipes-extended/cpio/cpio-2.13/run-ptest
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/test.sh

diff --git a/meta/recipes-extended/cpio/cpio-2.13/run-ptest b/meta/recipes-extended/cpio/cpio-2.13/run-ptest
old mode 100644
new mode 100755
index f027574e86..f35a756d6b
--- a/meta/recipes-extended/cpio/cpio-2.13/run-ptest
+++ b/meta/recipes-extended/cpio/cpio-2.13/run-ptest
@@ -1,10 +1,3 @@
 #!/bin/sh
 
-# Define cpio test work dir
-WORKDIR=@PTEST_PATH@/tests/
-
-# Run test
-cd ${WORKDIR}
-./atconfig ./atlocal ./testsuite
-
-./testsuite 2>&1 | grep -E '[0-9]{1,3}: ' | sed -e 's/^.....//' -e '/[ok]$/s/^/PASS: /;/FAILED (.*)/s/^/FAIL: /;/skipped (.*)/s/^/SKIP: /;/expected failure/ s/^/PASS: /;/UNEXPECTED PASS/s/^/FAIL: /' -e 's/ok$//g' -e 's/FAILED.*//g' -e 's/skipped.*//g' -e 's/expected failure.*//g' -e 's/UNEXPECTED PASS.*//g'
+su -c ./test.sh ptest
diff --git a/meta/recipes-extended/cpio/cpio-2.13/test.sh b/meta/recipes-extended/cpio/cpio-2.13/test.sh
new file mode 100644
index 0000000000..f027574e86
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/test.sh
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+# Define cpio test work dir
+WORKDIR=@PTEST_PATH@/tests/
+
+# Run test
+cd ${WORKDIR}
+./atconfig ./atlocal ./testsuite
+
+./testsuite 2>&1 | grep -E '[0-9]{1,3}: ' | sed -e 's/^.....//' -e '/[ok]$/s/^/PASS: /;/FAILED (.*)/s/^/FAIL: /;/skipped (.*)/s/^/SKIP: /;/expected failure/ s/^/PASS: /;/UNEXPECTED PASS/s/^/FAIL: /' -e 's/ok$//g' -e 's/FAILED.*//g' -e 's/skipped.*//g' -e 's/expected failure.*//g' -e 's/UNEXPECTED PASS.*//g'
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index d48429b8ce..400c6b2f90 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch \
            file://0001-Fix-appending-to-archives-bigger-than-2G.patch \
            file://run-ptest \
+           file://test.sh \
            "
 
 SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
@@ -58,9 +59,24 @@ do_install_ptest() {
     install --mode=755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
     install --mode=755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
     install --mode=755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
-    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+    install --mode=755 ${WORKDIR}/test.sh ${D}${PTEST_PATH}/test.sh
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/test.sh
 }
 
+# ptest.bbclass currently chowns the ptest directory explicitly, so we need to
+# change permission after that has happened so the ptest user can write a
+# temporary directory.
+do_install_ptest_base:append() {
+    chgrp -R ptest ${D}${PTEST_PATH}/
+    chmod -R g+w ${D}${PTEST_PATH}/
+}
+
+# The tests need to run as a non-root user, so pull in the ptest user
+DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
+PACKAGE_WRITE_DEPS += "ptest-runner"
+
+RDEPENDS:${PN}-ptest += "ptest-runner"
+
 PACKAGES =+ "${PN}-rmt"
 
 FILES:${PN}-rmt = "${sbindir}/rmt*"
-- 
2.34.1


