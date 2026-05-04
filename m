Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85137CD3423
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 06:33:12 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9182.1777876388516782585
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2026 23:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WFOe9pNd;
 spf=pass (domain: mvista.com, ip: 74.125.82.50, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso8539949c88.0
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2026 23:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777876388; x=1778481188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmgVivE6O6/j7dBLKSmOvnH05xmzvfGmyHxToq+Xzo0=;
        b=WFOe9pNdtP3HXaEVQ+bz8zmz6WCiKfWcN98+poVd/X8BMaBrgzB1z+TkUjlyH0OVIL
         IF5SeiiOWd5A7kkC+r8BpK4/nV+EgInmMwgaXu5uKZAh1+jmJLkiE1HBU46xbX4W6D6S
         ckyJqm6ekUlirXSWwBWty7Q3hIbdl4nvF3Hpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777876388; x=1778481188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmgVivE6O6/j7dBLKSmOvnH05xmzvfGmyHxToq+Xzo0=;
        b=GnnNO62MMe+mo7SCVIJ3Tqf0XuR8iUhEpUmf99Vg1zshuCAXp0kSJmnPB8sEPwmO8z
         z34FgiomX2n5sTLXyI1HDKPxgKqFyV5NpAgEdKgT79NNWaBE7K5ZZ3oDaR7QBLgPpEXW
         d/P3pFix5kJJqDa4fIO+sbNX2UCnAjhyhUontpIt/oqzUv9D8VPEVgnNogtSeOhhahxb
         17EjVTeunYYYs3ofX4JwhtgyzhPBvXD+17FrvPgPrd/0McGzMQEUSVLuPjNbQrbI/LMb
         7x7KU84hUIWktdNKyfYNAHPXvsh06tIDDWHVASKjkxE9wCtKwaw5KQmFTRs9xbUi25qL
         BZfA==
X-Gm-Message-State: AOJu0YzXIBgBaTL4zXY6PnZbN2wyJg+Yj7+ZYk/+gNNRjP7rSbbvkN6i
	7wW08qLo3nmyj26Ug1KjGaN20Eg7MV3i0xU8egjlN5EP/s69Em3JUwe+qxtq6F4ebgUe3wms5e0
	ChrePWnI=
X-Gm-Gg: AeBDieudv92lYCbpSi/T4eN/c3POSL5s8lTS+0uCGPc7x+QHe+q+QmZy5VpIt0oraXt
	lg9E9YfMofPQMVlFhxyud2rfwOSkLkjm6EV0nmX7Yz1UhcshyehmstFLowOSGsxY6i5fYcK7zJZ
	VSUS0vjnxg2hknbd4wnhRDV5FQHkvSXEli2RTif/lUoVmltmMiQFhNaybHoi64oSHykx+X4+oB/
	mgZ5VjRchyeOaKmYUHV7Oq7GXan+qE9BeCkncK8GhH2SkCfEkIoRO5IAxiEDumG1kG6Umgwn4zR
	zDoUp/drTgsOWf9XpuM+Cjcq4e90adSGyUvR/1ONj6nNdpmorv0wQNKwLWxwWsEBrQ2TXJvAaYb
	46bcZeNnJS2WO7mAZK7jieI/aKE+5C4/ywBAqyWPx/N0o0QyPLHuP9kbpEuWCaX2rn+GLkh7F8K
	ABTh2I110HIUekTlhrmSX536+YirS6Ihoz1UVlEYEC2UtEb34=
X-Received: by 2002:a05:7022:4391:b0:128:ce44:be8f with SMTP id a92af1059eb24-12dfd7da1c2mr3595516c88.2.1777876387794;
        Sun, 03 May 2026 23:33:07 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df81ec067sm14995802c88.0.2026.05.03.23.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:33:07 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>,
	Ross Burton <ross.burton@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/3] libexif: rewrite ptest handling
Date: Mon,  4 May 2026 12:01:58 +0530
Message-ID: <20260504063159.30681-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260504063159.30681-1-hprajapati@mvista.com>
References: <20260504063159.30681-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 06:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236432

What started as replacing the installation of libtool wrapper scripts
ended up being a rewrite of the ptest integration.

There are only ~15 tests so we can install the binaries with libtool,
extract the test names from the Makefile, and just run them with a few
lines of shell.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../recipes-support/libexif/libexif/run-ptest | 34 +++++++++++++++++--
 .../recipes-support/libexif/libexif_0.6.25.bb | 21 ++++--------
 2 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-support/libexif/libexif/run-ptest b/meta/recipes-support/libexif/libexif/run-ptest
index 2d23159eb0..6a50f64822 100644
--- a/meta/recipes-support/libexif/libexif/run-ptest
+++ b/meta/recipes-support/libexif/libexif/run-ptest
@@ -1,3 +1,33 @@
-#!/bin/sh
+#! /bin/sh
 
-make -o Makefile runtest-TESTS
+all=0
+passed=0
+failed=0
+skipped=0
+
+for t in @TESTS@; do
+    "./$t"
+    case "$?" in
+        0)
+            echo "PASS: $t"
+            passed=$((passed + 1))
+            ;;
+        77)
+            echo "SKIP: $t"
+            skipped=$((skipped + 1))
+            ;;
+        *)
+            echo "FAIL: $t"
+            failed=$((failed + 1))
+            ;;
+    esac
+    all=$((all + 1))
+done
+
+if [ "$failed" -eq 0 ]; then
+    echo "All $all tests passed ($skipped skipped)"
+    exit 0
+else
+    echo "$failed of $all tests failed ($skipped skipped)"
+    exit 1
+fi
diff --git a/meta/recipes-support/libexif/libexif_0.6.25.bb b/meta/recipes-support/libexif/libexif_0.6.25.bb
index 59c22753d0..c57855303f 100644
--- a/meta/recipes-support/libexif/libexif_0.6.25.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.25.bb
@@ -23,25 +23,16 @@ do_compile_ptest() {
 }
 
 do_install_ptest() {
-    install ${B}/test/test*[!\.o] ${D}${PTEST_PATH}
-    for f in ${D}${PTEST_PATH}/test*; do
-        sed -i "s/\(LD_LIBRARY_PATH=\).*\(:\$LD_LIBRARY_PATH\)\"/\1.\2/" $f
-    done
-
-    install ${B}/test/Makefile ${D}${PTEST_PATH}
-    sed -i -e "/^srcdir/c srcdir = \$\{PWD\}" ${D}${PTEST_PATH}/Makefile
-
-    install -d ${D}${PTEST_PATH}/nls
-    install ${B}/test/nls/*[!\.o] ${D}${PTEST_PATH}/nls
-    install -d ${D}${PTEST_PATH}/.libs
-    install ${B}/test/.libs/* ${D}${PTEST_PATH}/.libs
-
     install ${S}/test/*.sh ${D}${PTEST_PATH}
 
+    for file in $(find ${B}/test/test-* -executable -type f); do
+        ${B}/libtool --mode=install install $file ${D}/${PTEST_PATH}
+    done
+
     install -d ${D}${PTEST_PATH}/testdata
     install ${S}/test/testdata/* ${D}${PTEST_PATH}/testdata
-}
 
-RDEPENDS:${PN}-ptest += "make bash"
+    sed -i -e "s/@TESTS@/$(makefile-getvar ${B}/test/Makefile TESTS)/" ${D}${PTEST_PATH}/run-ptest
+}
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.50.1


