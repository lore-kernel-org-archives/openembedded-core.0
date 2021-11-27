Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5013EC433EF
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:17 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.34437.1638006856658938380
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AIh8i9Wq;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id j3so24087154wrp.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zVPL17f4XzN2HuR9hOmX/lND8AOqnB6c3WPdf+U5NyA=;
        b=AIh8i9WqqlPj5CuQlzN+cOlvFydXsTu8ElawoNqtersQaHlwTgd3CBpoGQVdEfvJVk
         pxcFwhqAmXvsTae7YCkbFBfrxs6kmM38GCk+vFD1+qXJopDjkFzQ7xxZm11EDDeLyEBh
         MOiC6v8m4EYT5PSOVaiZChhh6Erchv5zR8ljiXJZVdyv0TqhRCcS1PlXluWy7s520kQG
         BBcj8gTLnk9RpykS8KRotCpO/vN5k48k3ZoaM4HaxHVNZvK0RlK49VlKadAwa3KxhOXp
         smZy2giW3bqIFFX2B7ZeGJyrDt10a5F9Q6FVAvXmgepTzQuw2DIWKzM/0RaI9wGLJr87
         ffvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zVPL17f4XzN2HuR9hOmX/lND8AOqnB6c3WPdf+U5NyA=;
        b=4Z0lOXMWseep2LXD53vj7UKxGaJQ98aYKWKRqja6ybZ6MsUhUaIlhly0veiVrkl5XY
         76zggAXzWj+MZAu8YvhVROYfL+FpGR4Wa+w8G4uZDQkecmp/L2JQOh3py6RUFYWpm7uv
         sgT+b3/3bm0DW15sgyQvvDh3cAn1K83bnMBnC+Jo/N97xUTbS6m6JlsywhMm/g0OpnXr
         hp/KXUNhiXRFSiJ3d/kk3jja30uVpUCVaeEvSod6C40hpJnrsPnG8M6opgpWvLNfhqvP
         ZrRgJGwKLDcrw7Gm89CUapUR1bJl7czPGbXlfpCASpcgJoQKfD6/xwFIkgkcg+aojizh
         oJJQ==
X-Gm-Message-State: AOAM530vZrImJccVOVH07TiWup47zlVGJKKy4qB2DPsG9H561jLoNJDI
	0hIJeM/+xLzdlLTThpeybL34qVTnmFEAqQ==
X-Google-Smtp-Source: 
 ABdhPJwp822Tf+WXpWISY947jRunOUM3PPBZ1OyYtXY4/jCuUu627+BQATRQt+B4rQgSs+YglEVynA==
X-Received: by 2002:adf:f10f:: with SMTP id
 r15mr18481899wro.553.1638006855255;
        Sat, 27 Nov 2021 01:54:15 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/13] go-helloworld: test at runtime
Date: Sat, 27 Nov 2021 10:53:55 +0100
Message-Id: <20211127095357.1748429-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211127095357.1748429-1-alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158860

This adds a smoke check for whether the Go toolchain actually
produces working executables across a range of architectures.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/testimage.bbclass                |  2 +-
 meta/lib/oeqa/runtime/cases/go.py             | 19 +++++++++++++++++++
 .../packagegroup-core-tools-testapps.bb       |  7 +++++++
 3 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/go.py

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index e606de25fc..66de0e07c6 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -61,7 +61,7 @@ BASICTESTSUITE = "\
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
index 94405fd8fe..e8f0811485 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -18,6 +18,12 @@ KEXECTOOLS:nios2 ?= ""
 KEXECTOOLS:riscv64 ?= ""
 KEXECTOOLS:riscv32 ?= ""
 
+# go does not support ppc32, only ppc64
+# https://github.com/golang/go/issues/22885
+# gccgo may do better
+GOTOOLS ?= "go-helloworld"
+GOTOOLS:powerpc ?= ""
+
 GSTEXAMPLES ?= "gst-examples"
 GSTEXAMPLES:riscv64 = ""
 
@@ -49,4 +55,5 @@ RDEPENDS:${PN} = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', "${X11TOOLS}", "", d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', "${X11GLTOOLS}", "", d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', '3g', "${3GTOOLS}", "", d)} \
+    ${GOTOOLS} \
     "
-- 
2.20.1


