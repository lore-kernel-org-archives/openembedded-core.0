Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B9DD5AE6D
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:01:29 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2898.1765620087784546157
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NsSco138;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0a33d0585so877575ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620087; x=1766224887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14BQPEUm62EdDmgstf/OPrS88iIHmyNcWBAdwd0jUVY=;
        b=NsSco138TEZcIm6TxJAkgm53Zt9at8m/UQ7fyGJXZaHmjf/n/NTki+LlN17glxfRCa
         f+UMEpAQqQJOGiU6LWPHmRPkudGpZPWG5hp6ZvKBbZiVQRFwrrDMc/NA2sNwLg7tFbyi
         sELhhCSPDVB3ApVEKyNoUy2RevIb+uKdd4gpD+nUJWAqTiCCRa/BIPH3DL09Op5sE/Pm
         wWjck3kJ0IiLxUbrZtRt+LQ/2BV99+3g2rcRsaYCpjfk7WoSzulDhkWurU/E9rudnWiI
         2meZSgI53/ihOvbXZK6Gu7kZfMNlJkj4qtHvDgSeWYGbs0YPXBkNfBHbQ/lU/JTd6jJc
         hgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620087; x=1766224887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=14BQPEUm62EdDmgstf/OPrS88iIHmyNcWBAdwd0jUVY=;
        b=blZ3apb9ci9e+eqEfjGCuO9XRuSMyEWqbM2FPahtgKYUtI/Xg89Zr1i6MEn0fx9k0x
         bdsVw9dz9RBqKrgIxy+85li+8tHS6IvkX+Iz/zM4m36PXPQ9PEC0oThV9VQ+LrxkHfdB
         wfYiCS8y7IEmNXxDcsY/UCYIhpt6VifaeboZlglqouPScL0OeOseDplEJ+7pqymwFEVJ
         CjdbC/qgZjwdnGhZgG5BvsUADJEtbeVgMdfUHFy0D+BPL/eYM3vHHIhpJlIS2d1gVwtn
         MHTWk3MZZPjdTJ+qpagakN094xmT/GR3wYuCXEvxkTqbODUPJ3Jne/dnC0eAhwnnqRdQ
         NB7Q==
X-Gm-Message-State: AOJu0YxRr11Zl6Ut7xJlcwM+sohncuwHIb23B/XzFfFzceTgrluhmmwz
	l1APCHcqKdxxgBjDJfxCUqTCgDPNtV7UMHrH005jL5cE9f/IqH5ZjDZC80RdkQMN
X-Gm-Gg: AY/fxX4fJ3O0LD9u7/qMKst3ftDFNykbHiAXWutQYdzW93AYt0Y38DLoGbRNVq9ZnYC
	KnlEndLds6x5SH5fhd9Od9rd13QgYDcrqqtHsU/euMlcJD5r5drpeO9lMpXl8N4OmEK14GXIybd
	82iP4U0PWJXnaH1ozvpzu+zZZFiT4z9w131nDGaA02KqIgnHZiA9QHBtVlbOOL/ZlKYp89CnxQE
	TRHfIW7w6zblPg/DjCtkXZi2nt47l6Vtizp16Wr0yeO1ebVxHKK0j267267omOe013mdRCdVj84
	7wfh3Ad86ZQylgZBgRlM1S8j31pw5BCReel0lCtbD5vG97/3Cw305jgBoESKo+hB5NN7yUpCJxI
	O05qgXyBQyn8rBUdWy7BCmr1srACVO3GTbPgQRQpaFqcJtTno8E6ZPirbxChlljtiZdnnLVJU4Y
	nHK+uNTd9YKxzPmFhvNzltO9oq
X-Google-Smtp-Source: AGHT+IFjF6qLa4lRlHt5Qp3zuwctvw1zBW+g2fuSp/vBM8PsbhpWSquJF42FcdfMl6N8z4OfHaNOzg==
X-Received: by 2002:a17:903:4b2d:b0:297:db6a:a82f with SMTP id d9443c01a7336-29f23e3a070mr38624915ad.24.1765620086868;
        Sat, 13 Dec 2025 02:01:26 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:01:26 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Pratik Farkase <pratik.farkase@est.tech>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 39/67] libcheck: add ptest support
Date: Sat, 13 Dec 2025 15:29:03 +0530
Message-ID: <20251213095931.2571498-39-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227657

From: Pratik Farkase <pratik.farkase@est.tech>

Add package test (ptest) support to libcheck recipe to enable
running the test suite on target devices.

The implementation installs:
- Test binaries (check_check, check_check_export)
- Test helper binaries and scripts
- Shell script tests that validate various output formats
- Test configuration files

All 9 upstream tests pass successfully:
START: ptest-runner
BEGIN: /usr/lib/libcheck/ptest
PASS: check_check_export
PASS: check_check
PASS: test_output.sh
PASS: test_check_nofork.sh
PASS: test_check_nofork_teardown.sh
PASS: test_xml_output.sh
PASS: test_log_output.sh
PASS: test_set_max_msg_size.sh
PASS: test_tap_output.sh
END: /usr/lib/libcheck/ptest
STOP: ptest-runner

Note: The test_vars SRCDIR path is set to /usr/src/debug/libcheck/0.15.2/tests
to match the debug source paths embedded in compiled binaries.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 1bb06e23c1c87829e5c4211e34229305c7d5f851)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libcheck/libcheck/run-ptest               | 24 ++++++++++++++++
 .../libcheck/libcheck_0.15.2.bb               | 28 +++++++++++++++++--
 3 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libcheck/libcheck/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 06d113e264..3cd5f244be 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -28,6 +28,7 @@ PTESTS_FAST = "\
     icu \
     json-c \
     json-glib \
+    libcheck \
     libconvert-asn1-perl \
     libexif \
     libgpg-error\
diff --git a/meta/recipes-support/libcheck/libcheck/run-ptest b/meta/recipes-support/libcheck/libcheck/run-ptest
new file mode 100644
index 0000000000..6523b1d146
--- /dev/null
+++ b/meta/recipes-support/libcheck/libcheck/run-ptest
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+# run-ptest script for libcheck
+# Runs the libcheck test suite and outputs results in ptest format
+
+cd tests || exit 1
+
+for test in check_check_export check_check \
+            test_output.sh test_check_nofork.sh test_check_nofork_teardown.sh \
+            test_xml_output.sh test_log_output.sh test_set_max_msg_size.sh \
+            test_tap_output.sh; do
+    if [ -x ./$test ]; then
+        ./$test > /dev/null 2>&1
+        if [ $? -eq 0 ]; then
+            echo "PASS: $test"
+        else
+            echo "FAIL: $test"
+        fi
+    else
+        echo "SKIP: $test"
+    fi
+done
+
+exit 0
diff --git a/meta/recipes-support/libcheck/libcheck_0.15.2.bb b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
index adf95f5040..e45c1d0264 100644
--- a/meta/recipes-support/libcheck/libcheck_0.15.2.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.15.2.bb
@@ -6,7 +6,6 @@ segmentation faults or other signals can be caught. Test results are \
 reportable in the following: Subunit, TAP, XML, and a generic logging format."
 HOMEPAGE = "https://libcheck.github.io/check/"
 SECTION = "devel"
-
 LICENSE  = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
@@ -14,20 +13,45 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/check-${PV}.tar.gz \
            file://automake-output.patch \
            file://subunit.patch \
            file://0001-Fix-texinfo-errors-and-warnings.patch \
+           file://run-ptest \
 "
 
 SRC_URI[sha256sum] = "a8de4e0bacfb4d76dd1c618ded263523b53b85d92a146d8835eb1a52932fa20a"
+
 GITHUB_BASE_URI = "https://github.com/libcheck/check/releases/"
 
 S = "${UNPACKDIR}/check-${PV}"
 
-inherit cmake pkgconfig texinfo github-releases
+inherit cmake pkgconfig texinfo github-releases ptest
 
 RREPLACES:${PN} = "check (<= 0.9.5)"
 
 EXTRA_OECMAKE:append:class-target = " -DAWK_PATH=${bindir}/awk"
 EXTRA_OECMAKE = "-DENABLE_SUBUNIT_EXT=OFF"
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+
+    install -m 0755 ${B}/tests/check_check ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/check_check_export ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/ex_output ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/check_nofork ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/check_nofork_teardown ${D}${PTEST_PATH}/tests/
+    install -m 0755 ${B}/tests/check_set_max_msg_size ${D}${PTEST_PATH}/tests/
+
+    install -m 0755 ${S}/tests/*.sh ${D}${PTEST_PATH}/tests/
+
+    install -m 0755 ${S}/tests/test_output_strings ${D}${PTEST_PATH}/tests/
+
+    if [ -f ${B}/tests/test_vars ]; then
+        install -m 0644 ${B}/tests/test_vars ${D}${PTEST_PATH}/tests/
+        sed -i \
+            -e 's|if \[ x"[^"]*" != x"\." \];|if \[ x"${TARGET_DBGSRC_DIR}/tests" != x"." \];|g' \
+            -e 's|SRCDIR="[^"]*"|SRCDIR="${TARGET_DBGSRC_DIR}/tests/"|g' \
+            ${D}${PTEST_PATH}/tests/test_vars
+    fi
+}
+
 do_install:append:class-native() {
     create_cmdline_shebang_wrapper ${D}${bindir}/checkmk
 }

