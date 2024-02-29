Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A65C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 12:05:32 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.23118.1709208332716026437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 04:05:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=I6rPhEig;
 spf=pass (domain: baylibre.com, ip: 209.85.214.173, mailfrom: pidge@baylibre.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dcad814986so7230605ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 04:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709208332; x=1709813132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zT4AbVhu6H9WAka2IRAXJrdHC7XhGer3jqr8FYMbLEw=;
        b=I6rPhEigUTCSsaIMY/Dkt+6kDPogsuA5bBPc2Z8zds95Q9wfy1bxhow6nfUvWdgYqx
         oOuy6WWmFF8i9z7cTiUGdVwmgn1geunB85QgMY941TBI++KU9r5Xb9aSOkILWJ5vEbpW
         vm0r3NYH7DhMPKiX5K8jJZIaEGyGAmU0k8tSEmrIuPmeoritqvD695oyPP8ws6WR3aju
         CX8suOBT82SV8OkjD9mFZ3cunc1TBEcooCeZn3m6EIJ/He4vTgc155jM5iaOai7IBhv3
         8PF6IFVB9V49EiZL2qLpnrREG8/89oLF+qkF2x1A2mlEX+Fqret33CKEjM/bHlX4y5G2
         wmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208332; x=1709813132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zT4AbVhu6H9WAka2IRAXJrdHC7XhGer3jqr8FYMbLEw=;
        b=r9VO034UQE4jBF0ujYtgyNdHeb8v+xplqWz/lUI6kV9Rr2R5rYE98Ds+U26AyX4eri
         /lOa9lLL7mKm9kHiJ65/UtB0O+zDe+pgPBZqQjxOvxyTiCi0mLHLamqAZHNVH3Y+8qLu
         Kpp5HnXkoyKHsSTuJqaUFJR/8I4zWobpLGBFQof5AWSTBcTSPCyZO03YyvD54G5dhTDX
         izMVvONS2qTSfYTeBtyiY61+C4JgPgAxxJFFCIurbJnDBPqSt81m1wwYMdMnBmoavN+v
         PkShYjNqo0h3Udv1C/lntpDUZY9xEFXHSCSilPM6u0hBH3OGkPPvw08UBggXOeLwbSxH
         +OEQ==
X-Gm-Message-State: AOJu0YxO/X1sFYpYzoE8OpwjTtNMheCfGuL9SU3/IOaxuIipgiJjAkPf
	rWg5IrSf3YyoNqjDE2oEsfCvaqbwdv6ViiEot6DKRyvcdkDHyXPo9wBqI6GmFexEUU1+mRR5xCA
	2YaE=
X-Google-Smtp-Source: AGHT+IG4a5sBRLPn8g3odnC3JaxpW4WUgSih2bek+OcydJQtO+sU1vzsM89r8auoIVH9fE/za0908A==
X-Received: by 2002:a17:902:cec6:b0:1dc:a681:ca08 with SMTP id d6-20020a170902cec600b001dca681ca08mr2184426plg.28.1709208332193;
        Thu, 29 Feb 2024 04:05:32 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id j6-20020a170903024600b001db608107ecsm1289675plh.167.2024.02.29.04.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:05:31 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 4/4] login.py: Proof of concept for screenshot testcases
Date: Thu, 29 Feb 2024 12:05:07 +0000
Message-Id: <162460c0ed09ceb703abb17a2878ce2938d2d3c4.1709207755.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709207755.git.pidge@baylibre.com>
References: <cover.1709207755.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 12:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196434

This takes the work rburton did on image screenshot testing and
expands it.

Right now this works with most of the qemu based machines except for

- qemuppc64
- qemuarmv5
- qemuriscv32
- qemuloongarch64

See "Known Issues" further down.

This test takes a screendump of a qemu image, blanks out the clock
and compares it to an image we have on record. If the diff is exact,
the test passes. If not, it stores the image in build/failed-images and
fails out.

In order to enable this test, you will need meta-openembedded/meta-oe in
your bblayers.conf for imagemagick and the following in local.conf:

IMAGE_CLASSES += "testimage"
TEST_SUITES = "login"
TESTIMAGEDEPENDS:append:qemuall = " imagemagick-native:do_populate_sysroot "

Known Issues
------------

The main issue is that I've yet to find a gating factor that would allow
me to tell when the qemu instance is fully up and rendered. I've tried a
few tactics here, (dbus-wait, qmp) but for now a disgusting
time.sleep(30) is there.

You can replicate this by running qemumips. The screen load takes forever,
but you even see it on qemux86 where the Home and Workspace Switch icons
will sometimes take a while to fully load.

Eventually I'm going to have to take multiple screenshots and compare
them, but then you get into the issue where the question is, is the diff
greater than 0 because it hasn't fully loaded or something is actually
incorrect.

There are the issues I know about:

   - runqemu qemuppc64 comes up blank.
   - qemuarmv5 comes up with multiple heads but sending "head" to screendump.
     seems to create a png with a bad header.
   - qemuriscv32 and qemuloongarch64 don't work with testimage apparently?
   - qemumips64 is missing mouse icon.
   - qemumips takes forever to render and is missing mouse icon.
   - qemuarm and qemuppc return incorrect width
   - All images have home and screen flipper icons not always rendered fully at first.
     The sleep seems to help this out some, depending on machine load.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
Co-authored-by: Ross Burton <ross.burton@arm.com>
Co-authored-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/lib/oeqa/runtime/cases/login.py | 107 +++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/login.py

diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/runtime/cases/login.py
new file mode 100644
index 00000000000..aea3bfc778e
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/login.py
@@ -0,0 +1,107 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import subprocess
+from oeqa.runtime.case import OERuntimeTestCase
+import tempfile
+from oeqa.runtime.decorator.package import OEHasPackage
+
+### Status of qemu images.
+#   - runqemu qemuppc64 comes up blank. (skip)
+#   - qemuarmv5 comes up with multiple heads but sending "head" to screendump.
+#     seems to create a png with a bad header? (skip for now, but come back to fix)
+#   - qemuriscv32 and qemuloongarch64 doesn't work with testimage apparently? (skip)
+#   - qemumips64 is missing mouse icon.
+#   - qemumips takes forever to render and is missing mouse icon.
+#   - qemuarm and qemuppc are odd as they don't resize so we need to just set width.
+#   - All images have home and screen flipper icons not always rendered fully at first.
+#     the sleep seems to help this out some, depending on machine load.
+###
+
+class LoginTest(OERuntimeTestCase):
+    def test_screenshot(self):
+        if self.td.get('MACHINE') in ("qemuppc64", "qemuarmv5", "qemuriscv32", "qemuloongarch64"):
+            self.skipTest("{0} is not currently supported.".format(self.td.get('MACHINE')))
+
+        # Set DEBUG_CREATE_IMAGES to 1 in order to populate the image-test images directory.
+        DEBUG_CREATE_IMAGES="0"
+        # Store failed images so we can debug them.
+        failed_image_dir=self.td.get('TOPDIR') + "/failed-images/"
+
+        ###
+        # This is a really horrible way of doing this but I've not found the
+        # right event to determine "The system is loaded and screen is rendered"
+        #
+        # Using dbus-wait for matchbox is the wrong answer because while it
+        # ensures the system is up, it doesn't mean the screen is rendered.
+        #
+        # Checking the qmp socket doesn't work afaik either.
+        #
+        # One way to do this is to do compares of known good screendumps until
+        # we either get expected or close to expected or we time out. Part of the
+        # issue here with that is that there is a very fine difference in the
+        # diff between a screendump where the icons haven't loaded yet and
+        # one where they won't load. I'll look at that next, but, for now, this.
+        #
+        # Which is ugly and I hate it but it 'works' for various definitions of
+        # 'works'.
+        ###
+
+        import time
+        
+        # qemumips takes forever to render. We could probably get away with 20
+        # here were it not for that.
+        time.sleep(40)
+
+        with tempfile.NamedTemporaryFile(prefix="oeqa-screenshot-login", suffix=".png") as t:
+            ret = self.target.runner.run_monitor("screendump", args={"filename": t.name, "format":"png"})
+
+            # Find out size of image so we can determine where to blank out clock.
+            # qemuarm and qemuppc are odd as it doesn't resize the window and returns
+            # incorrect widths
+            if self.td.get('MACHINE')=="qemuarm" or self.td.get('MACHINE')=="qemuppc":
+                width="640"
+            else:
+                cmd = "identify.im7 -ping -format '%w' {0}".format(t.name)
+                width = subprocess.check_output(cmd, shell=True).decode()
+
+            rblank=int(float(width))
+            lblank=rblank-40
+
+            # Use the meta-oe version of convert, along with it's suffix. This blanks out the clock.
+            cmd = "convert.im7 {0} -fill white -draw 'rectangle {1},10 {2},22' {3}".format(t.name, str(rblank), str(lblank), t.name)
+            convert_out=subprocess.check_output(cmd, shell=True).decode()
+
+            if DEBUG_CREATE_IMAGES=="1":
+                # You probably aren't interested in this as it's just to create the images we compare against.
+                import shutil
+                shutil.copy2(t.name, "{0}/meta/files/image-tests/core-image-sato-{1}.png".format(self.td.get('COREBASE'), \
+                                                                                                 self.td.get('MACHINE')))
+                self.skipTest("Created a reference image for {0} and placed it in {1}/meta/files/image-tests/.".format(self.td.get('MACHINE'), self.td.get('COREBASE')))
+            else:
+                # Use the meta-oe version of compare, along with it's suffix.
+                cmd = "compare.im7 -metric MSE {0} {1}/meta/files/image-tests/core-image-sato-{2}.png /dev/null".format(t.name, \
+                                                                                                                        self.td.get('COREBASE'), \
+                                                                                                                        self.td.get('MACHINE'))
+                compare_out = subprocess.run(cmd, shell=True, capture_output=True, text=True)
+                diff=float(compare_out.stderr.replace("(", "").replace(")","").split()[1])
+                if diff > 0:
+                    from datetime import datetime
+                    import shutil
+                    import os
+                    try:
+                        os.mkdir(failed_image_dir)
+                    except FileExistsError:
+                        # directory exists
+                        pass
+                    # Keep a copy of the failed screenshot so we can see what happened.
+                    failedfile="{0}/failed-{1}-core-image-sato-{2}.png".format(failed_image_dir, \
+                                                                               datetime.timestamp(datetime.now()), \
+                                                                               self.td.get('MACHINE'))
+                    shutil.copy2(t.name, failedfile)
+                    self.fail("Screenshot diff is {0}. Failed image stored in {1}".format(str(diff), failedfile))
+                else:
+                    self.assertEqual(0, diff, "Screenshot diff is {0}.".format(str(diff)))
-- 
2.34.1


