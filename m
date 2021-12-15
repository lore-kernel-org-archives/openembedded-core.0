Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADA8C2BA4C
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.2577.1639608043710181770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tz8pEYQ3;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id a18so40755671wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hirnghFVKLRj0WLGMrDXyDMIR0Dq8Ms5MJFbCDNJFrU=;
        b=Tz8pEYQ3F23/fjFXqRw2M1qJIBiaUOLF9irF5BsMQpKi+EaelRvww4d6uAJcfGja65
         JOvzM4oks/zWDaVKwOh0WQmh4X5NcZFojk/HPxfHKrFe4xvF8XKiURGJB9VPeQHWFHRa
         F2FktyCGB4iXP/yqeCkNlMd5SrRqjz1jt47CO/1UsZfHWQp2mIF3DtyoeHqRzBSGlsn5
         s3hTHD3rc22YXz7WwI2tuEgpHI6M5TkAVqel7KeYsEfnnc/8w3WDdGRtQMT5KlgOiKOQ
         dyBP1z1fg2fCk0MOf2+yKuGAaz6LjdCdlkAtgyJI5skLfi+u1rT8MMnTwDiEDvRpfRYn
         QdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hirnghFVKLRj0WLGMrDXyDMIR0Dq8Ms5MJFbCDNJFrU=;
        b=PJ6p8Agii0wvQ5CSlfA7aowDiSsNsatgoTD4GwwjhJx3ZNxBJ5bwHHEe8JNaoAhwZw
         Hza9EEUKgtxytNNmPNXErHvrlxqyxk92HnTa0BABrUEqhi2bLjnnPnnJUdjf96NVvRA5
         5ZnLfMZh4sJJcZudNURSHn05fishRccO8j+TliAH1X0gHdVSIkLzKCgVove4NAvEzuRN
         90JETvvn8riRL0ZdGUBTUF0wQf9GuIWxaxD00N253gOevnoMO02woNxjPUMg2KL1jIqA
         dC3oFBNPot9OkMLENUsYG7ZCMS00830hliryiiz3Tic6Xb2oKM98ac/fJjjWNR9nwQlh
         fCZw==
X-Gm-Message-State: AOAM532uYJa9VqeMow9kE0/IvuAPRi2EE78c6Rb2cIlqlKEK2GxSpDMF
	RQ1R/CAQB09+aN0/BpfW8xYGjBZMoV6kEw==
X-Google-Smtp-Source: 
 ABdhPJzIV1h350LD7teY/pIc2fk03R28JIr05xdibFqnpHe19AtJbCraOIod09gkprWcg1/JPi8cTQ==
X-Received: by 2002:a05:6000:1848:: with SMTP id
 c8mr6296622wri.265.1639608042327;
        Wed, 15 Dec 2021 14:40:42 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/26] rust-hello-world: test at runtime
Date: Wed, 15 Dec 2021 23:40:13 +0100
Message-Id: <20211215224034.1814148-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159747

This adds a smoke check for whether the rust toolchain actually
produces working executables across a range of architectures.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/testimage.bbclass                |  2 +-
 meta/lib/oeqa/runtime/cases/rust.py           | 19 +++++++++++++++++++
 .../packagegroup-core-tools-testapps.bb       |  3 +++
 3 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/runtime/cases/rust.py

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 66de0e07c6..1c5fd4ee6a 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -61,7 +61,7 @@ BASICTESTSUITE = "\
     ping date df ssh scp python perl gi ptest parselogs \
     logrotate connman systemd oe_syslog pam stap ldd xorg \
     kernelmodule gcc buildcpio buildlzip buildgalculator \
-    dnf rpm opkg apt weston go"
+    dnf rpm opkg apt weston go rust"
 
 DEFAULT_TEST_SUITES = "${BASICTESTSUITE}"
 
diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runtime/cases/rust.py
new file mode 100644
index 0000000000..b3d6cf7f37
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/rust.py
@@ -0,0 +1,19 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class RustHelloworldTest(OERuntimeTestCase):
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['rust-hello-world'])
+    def test_rusthelloworld(self):
+        cmd = "rust-hello-world"
+        status, output = self.target.run(cmd)
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        msg = 'Incorrect output: %s' % output
+        self.assertEqual(output, "Hello, world!", msg=msg)
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 1fee1c925d..e05e329020 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -25,6 +25,8 @@ GOTOOLS ?= "go-helloworld"
 GOTOOLS:powerpc ?= ""
 GOTOOLS:riscv32 ?= ""
 
+RUSTTOOLS ?= "rust-hello-world"
+
 GSTEXAMPLES ?= "gst-examples"
 GSTEXAMPLES:riscv64 = ""
 
@@ -57,4 +59,5 @@ RDEPENDS:${PN} = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', "${X11GLTOOLS}", "", d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', '3g', "${3GTOOLS}", "", d)} \
     ${GOTOOLS} \
+    ${RUSTTOOLS} \
     "
-- 
2.20.1


