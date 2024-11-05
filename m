Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CA9D33A29
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:55 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.27950.1730832347369967391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mc1n7c8b;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso55694125ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832346; x=1731437146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y8Sl707spqOldVN9MV21RhfDUbNVH0J4xsVq2Tygoo=;
        b=mc1n7c8bmHqOzRnJWMMyTSwsVF9U1qwBoRURA2phC+qhGD3WUfTAPNNfcaZU5kO9Yv
         ZFWm6i8YGNRUuRoeiG5kPlGoDphi4T2Hx1CMxw8uH47ZpHvNsjSMwepTK0EUT1uy/uGU
         lPhsy+xoYtIRmxLL0LJa9og6a7V85HCy4nidMqDTQZszQwpolGsQY41fhf9wVoewu2Hl
         QEXYbom8C+rYb76nk+D0R3qb9mQvYUAhD6KI9q3/c6fHDU7MiixdnmdShjX+SrlWGHGF
         gbVpyPzdctsTxiLBjiDuXVsQw/dY/91Gaey0tOLeMd7xgfGf6XFOCTZABG0C6twMSvtL
         26xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832346; x=1731437146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Y8Sl707spqOldVN9MV21RhfDUbNVH0J4xsVq2Tygoo=;
        b=o6x1TTt+i48Bpv58mOmFHGixBjUtUBf/T3CuwWfTNDwlCwu8pme8/be1eBxEZluviM
         4laozINVEeKArHU3qtu21VyuB9AE4DlQaprE02lp1+l6reYY8o3VLJwFqV7QV11SQ+7X
         e0TGGXSeJ7E7+A/QmKJQY9L1HmZ3aFCucwhEbMlvRDeqww8HeVg2ygvlt7Co5LlU+0XU
         SUFYoqBLj2kmDTmzuk9Kk1tFilbQFOM6AgM7iNbys5LT0XmVRTT4YL0KIlm+72wBdf+K
         OXy3J5blkMVXBQK6vUTXEnxzJeJuTxCF6s9TB5pvX4jmtnc6nQpVAQWpxqb7EMnJEtEA
         yH9w==
X-Gm-Message-State: AOJu0YwhKtJjaTr7BZF7Q+GRzMYTP1z+MR751GwSnoExlLPz0Zv203Zx
	Etyc9aiY/vq2KimY/ZcQpTxe2nGcAahV3+19jl5xNnuSmdp+zIzON/0B9Q==
X-Google-Smtp-Source: AGHT+IEFePbjCKkLhBvltDWhU0txZ5LtcxmvhHuM74Bz2QmudJfHAGs19t4hiVA1YVAUpHrW0ED2zA==
X-Received: by 2002:a17:903:2b0e:b0:20c:769b:f042 with SMTP id d9443c01a7336-210c6c079fcmr530803965ad.31.1730832346583;
        Tue, 05 Nov 2024 10:45:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 04/19] scan-build.bbclass: Add class to enable clang static analyser
Date: Tue,  5 Nov 2024 10:45:23 -0800
Message-ID: <20241105184540.3450302-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206732

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-recipe/scan-build.bbclass | 60 ++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 meta/classes-recipe/scan-build.bbclass

diff --git a/meta/classes-recipe/scan-build.bbclass b/meta/classes-recipe/scan-build.bbclass
new file mode 100644
index 00000000000..e1a72de993e
--- /dev/null
+++ b/meta/classes-recipe/scan-build.bbclass
@@ -0,0 +1,60 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+EXTRA_ANALYZER_OPTIONS += "-analyze-headers"
+EXTRA_ANALYZER_OPTIONS += "--force-analyze-debug-code"
+SCAN_BUILD ??= "1"
+SCAN_BUILD:class-native = ""
+SCAN_BUILD:class-nativesdk = ""
+SCAN_BUILD:class-cross = ""
+SCAN_BUILD:class-crosssdk = ""
+SCAN_BUILD:class-cross-canadian = ""
+
+CLANG_SCAN_SERVER_IP ??= "0.0.0.0"
+CLANG_SCAN_PORT ??= "8181"
+SCAN_RESULTS_DIR ?= "${TMPDIR}/static-scan/${PN}"
+
+CCSCAN ?= "${HOST_PREFIX}${TOOLCHAIN}"
+CXXSCAN:toolchain-clang ?= "${HOST_PREFIX}clang++"
+CXXSCAN:toolchain-gcc ?= "${HOST_PREFIX}g++"
+
+do_scanbuild() {
+        rm -rf ${SCAN_RESULTS_DIR}
+        scan-build --use-cc ${CCSCAN} --use-c++ ${CXXSCAN} --analyzer-target ${HOST_SYS} --html-title ${BP} -o ${SCAN_RESULTS_DIR} ${EXTRA_ANALYZER_OPTIONS} ${MAKE} ${PARALLEL_MAKE} ${EXTRA_OEMAKE}
+}
+
+do_scanview() {
+        bbplain "================================================================"
+        bbplain "Starting scan-view server at: http://${CLANG_SCAN_SERVER_IP}:${CLANG_SCAN_PORT}"
+        bbplain "Use Ctrl-C to exit"
+        bbplain "================================================================"
+        scan-view --host ${CLANG_SCAN_SERVER_IP} --port ${CLANG_SCAN_PORT} --allow-all-hosts --no-browser ${SCAN_RESULTS_DIR}/*/
+}
+
+do_scanview[depends] += "${PN}:do_scanbuild"
+do_scanbuild[depends] += "clang-native:do_populate_sysroot"
+#do_scanbuild[cleandirs] += "${SCAN_RESULTS_DIR}"
+do_scanbuild[dirs] += "${B}"
+do_scanview[dirs] += "${SCAN_RESULTS_DIR}"
+#do_build[recrdeptask] += "do_scanbuild"
+
+do_scanbuild[doc] = "Build and scan static analysis data using clang"
+do_scanview[doc] = "Start a webserver to visualize static analysis data"
+
+addtask scanbuild after do_configure before do_compile
+addtask scanview after do_scanbuild
+python () {
+    # Remove scanbuild task when scanning is not enabled or recipe does not have do_configure
+    if not(d.getVar('SCAN_BUILD') == "1") or not(d.getVar('TOOLCHAIN') == "clang") or oe.utils.inherits(d, 'allarch'):
+        for i in ['do_scanbuild', 'do_scanview']:
+            bb.build.deltask(i, d)
+    else:
+        cflags = d.getVar('CFLAGS', False) + d.getVar('TARGET_CC_ARCH', False) + d.getVar('TOOLCHAIN_OPTIONS', False)
+        cxxflags = d.getVar('CXXFLAGS', False) + d.getVar('TARGET_CC_ARCH', False) + d.getVar('TOOLCHAIN_OPTIONS', False)
+        d.setVar('CFLAGS', cflags)
+        d.setVar('CXXFLAGS', cxxflags)
+        if oe.utils.inherits(d, 'autotools'):
+            cachedvar = d.getVar('CACHED_CONFIGUREVARS', False)
+            cachedvar = cachedvar + " scan-build " + " --analyzer-target " + d.getVar('HOST_SYS', False) + " --use-cc " + d.getVar('CCSCAN', False) + " --use-c++ " + d.getVar('CXXSCAN', False)
+            d.setVar('CACHED_CONFIGUREVARS', cachedvar)
+}

