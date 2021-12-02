Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3799C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 11:21:21 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.7117.1638444080582355139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 03:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CBhHk5qS;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so3314555wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 03:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bO4vOSVuDvYIZFJ+B7SOkdUmWZf3JUjCwdcG3jxxH70=;
        b=CBhHk5qS5ChnFE3Z+aE1mGOo1TzX2SgCzCQhq8yW6T5f0bUuloLmQRoYKgy9LLcxY4
         e68TtKuTMHp5zgzQXqqMPjwrgWElFQZ0XQvQALi54+OPei+O+rmAeJSnrR7mXlCfut+n
         1w116tvawgiO+oHaQ1EFTztAJ0rMPXiLM54391rMc9RzP2ni5Z8ZYGUFxeY07P1yyhFM
         D706KVEt84F11Ju67S3rVvp4MJ0ChaJ7uOz+wtlwCT0Hu4UyottE2VOu3bkdteX964It
         QP6MH534tKn1Mcu7FmVPicnodbDVOfSkXqfYGxoJIBGCNfvT5Nar6F8hZNVhU+sWWQwf
         0Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bO4vOSVuDvYIZFJ+B7SOkdUmWZf3JUjCwdcG3jxxH70=;
        b=egwkrvwMYL1PXlidhFpLCx9fOQt6PcREPZ7udgiZuLOCz5BFjQSEaD3LF0lH6y/QiI
         4cYKTKUl2se5QEFBAi269UD4thyjXJPneGO2Gupc6qaa6DKe4/zmUk4+1c3546zskgem
         QFCkNvAZPSq6xM8kkOxY1ltwR6xb/XVtbN1Cm9SbksoyDTgG+ipHmvvAvt3Kqijfyd4H
         ApfOXL0RiurCI20OGZmevNi2y5ZNYA2cEOADQY1yTPak4hrf8UIhpUoWYQ8H+D51wFs8
         vlbpxPvoaGvlXokecFmrAgh8+jDoYPOubOJEU6dIoQYKA/hy3Xf15A5x1EBW0MQIqt+R
         WDBw==
X-Gm-Message-State: AOAM533UFIOWV5GSVNXudgxWIRBAUYHSS/dxleJgV2woE7xjAjGwkIvB
	O+rCxmrn/NV81sZ0wRRnm91WKx4M42HgUA==
X-Google-Smtp-Source: 
 ABdhPJz/wYySnbjL4/k4nt0lRp83JS6NJHtDjPfpgfulQnHIv59qN4mrhuyvDqEr0EBFBox62b49pQ==
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr5675572wms.192.1638444077743;
        Thu, 02 Dec 2021 03:21:17 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 x13sm2327526wrr.47.2021.12.02.03.21.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:21:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] go-helloworld: test at runtime
Date: Thu,  2 Dec 2021 12:21:16 +0100
Message-Id: <20211202112116.1133149-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 11:21:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159086

From: Alexander Kanavin <alex.kanavin@gmail.com>

This adds a smoke check for whether the Go toolchain actually
produces working executables across a range of architectures.

(From OE-Core rev: 2819bb2cf22c6cfcaeaee79f0280097ec9cb9327)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass                |  2 +-
 meta/lib/oeqa/runtime/cases/go.py             | 19 +++++++++++++++++++
 .../packagegroup-core-tools-testapps.bb       |  7 +++++++
 3 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/go.py

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index b1aef626f7..80c19b1e60 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -58,7 +58,7 @@ BASICTESTSUITE = "\
     ping date df ssh scp python perl gi ptest parselogs \
     logrotate connman systemd oe_syslog pam stap ldd xorg \
     kernelmodule gcc buildcpio buildlzip buildgalculator \
-    dnf rpm opkg apt weston"
+    dnf rpm opkg apt weston go"
 
 DEFAULT_TEST_SUITES = "${BASICTESTSUITE}"
 
diff --git a/meta/lib/oeqa/runtime/cases/go.py b/meta/lib/oeqa/runtime/cases/go.py
new file mode 100644
index 0000000000..89ba2c3ecb
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/go.py
@@ -0,0 +1,19 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class GoHelloworldTest(OERuntimeTestCase):
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['go-helloworld'])
+    def test_gohelloworld(self):
+        cmd = "go-helloworld"
+        status, output = self.target.run(cmd)
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        msg = 'Incorrect output: %s' % output
+        self.assertEqual(output, "Hello, Go examples!", msg=msg)
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index a5fc152859..3c946c57ef 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -17,6 +17,12 @@ KEXECTOOLS_microblaze ?= ""
 KEXECTOOLS_nios2 ?= ""
 KEXECTOOLS_riscv64 ?= ""
 
+# go does not support ppc32, only ppc64
+# https://github.com/golang/go/issues/22885
+# gccgo may do better
+GOTOOLS ?= "go-helloworld"
+GOTOOLS:powerpc ?= ""
+
 GSTEXAMPLES ?= "gst-examples"
 GSTEXAMPLES_riscv64 = ""
 
@@ -48,4 +54,5 @@ RDEPENDS_${PN} = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', "${X11GLTOOLS}", "", d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', '3g', "${3GTOOLS}", "", d)} \
+    ${GOTOOLS} \
     "
-- 
2.20.1


