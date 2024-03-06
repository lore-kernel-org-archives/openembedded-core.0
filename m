Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94BBC54E5D
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:23:52 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.16301.1709742229103883670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TXZcOW79;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33d90dfe73cso702990f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 08:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709742227; x=1710347027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Ktja1MmMrDj+AHeJOCveetzFV7ywNZ0wNZ/sCMk9W8=;
        b=TXZcOW79FNizlx47FEpGQA/oNRtQOHreRFYsVSleXDSFArktNR22GCFUAMPZIHG2+i
         jwBfU2xlyxml7hgUOfW8OIYBN997SM3Ak/D029RE3E8zQY+zk4f1w3/Syi3JRxtgMXLK
         bK4DMqo57899koFwooofoWMSjtr2FzHAxeXXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742227; x=1710347027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ktja1MmMrDj+AHeJOCveetzFV7ywNZ0wNZ/sCMk9W8=;
        b=jQtiz9OrYQCfK7J+Kln9MvvU7gqrOE6eR56FyBftMhVRLP3RZl8wvu/cZdELoCp9+r
         e5oxDQ84JlTdnQ4V1dj++SpwMZ4wy2Nmd1e4p16Azu+FviXtQ2BUVxRy7Z8wBYO7p/di
         s+4rjwwdsH9rHJZ3JliuVRhO8fsOAxbGEWgLHvjwptyp4WFTbRSTWsihL55e5ygCPV+c
         DgHJf3XR3g56VwA2WBfK3fq77NlX8sjS4ZZNx0Y2/JOE2UDhdUuleiqpvmeYV70VdL4o
         lsMejk+zADCH9V7wUfic9gOiL7DV7LDi6W/2cdkCJMxgmxwkYdRL/JiafcsbIE5wDl5y
         eDsQ==
X-Gm-Message-State: AOJu0YzBEjbpFYoqtAMUmpxpi0EcJv6WbIYKkHMPl+4/VKStbCdtFFM2
	9TujhTbtL34dsmdDgcF7/z3YpSqqPQcjZupn77F8tWY6HNNqxTOS2FJdDyzjFSvRT3Ep8dbeiOB
	c
X-Google-Smtp-Source: AGHT+IG1Z98AnRWyH/IhEYYhyJCSNRz8P0rTjtZwbnRhX888ld4Qz/4KRi4/NhjHglHAsuZsvYSahA==
X-Received: by 2002:adf:d052:0:b0:33d:61c7:9b2c with SMTP id v18-20020adfd052000000b0033d61c79b2cmr5427395wrh.34.1709742227069;
        Wed, 06 Mar 2024 08:23:47 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f9c:b564:4f14:a0ea])
        by smtp.gmail.com with ESMTPSA id k34-20020a05600c1ca200b00412f81ba413sm1929791wms.11.2024.03.06.08.23.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 08:23:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] oeqa/runtime/login: Various code improvements and fixes
Date: Wed,  6 Mar 2024 16:23:36 +0000
Message-Id: <20240306162341.2267587-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
References: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 16:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196738

* Allow tools to be found from the host PATH so that imagemagick from a buildtools
  tarball/sdk can work
* Reformat the code to have imports at the start of the file and have more standard
  formatting and whitespace
* Always save copies of the images, the space imapct is negligle compared to the
  debug win
* Write the images to ${T}
* Use bb.utils.mkdirhier() instead of more complex code
* Restrict the tests to images containing matchbox-desktop

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testimage.bbclass |  1 +
 meta/lib/oeqa/runtime/cases/login.py  | 91 ++++++++++++++-------------
 2 files changed, 49 insertions(+), 43 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index ad040ee8f07..ed0d87b7a72 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -221,6 +221,7 @@ def testimage_main(d):
     # ones of the current environment because some tests require them.
     for var in d.getVar('TESTIMAGE_UPDATE_VARS').split():
         td[var] = d.getVar(var)
+    td['ORIGPATH'] = d.getVar("BB_ORIGENV").getVar("PATH")
 
     image_manifest = "%s.manifest" % image_name
     image_packages = OERuntimeTestContextExecutor.readPackagesManifest(image_manifest)
diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/runtime/cases/login.py
index aea3bfc778e..175a60c48ca 100644
--- a/meta/lib/oeqa/runtime/cases/login.py
+++ b/meta/lib/oeqa/runtime/cases/login.py
@@ -4,9 +4,13 @@
 # SPDX-License-Identifier: MIT
 #
 
+import shutil
 import subprocess
-from oeqa.runtime.case import OERuntimeTestCase
 import tempfile
+import time
+import os
+from datetime import datetime
+from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.runtime.decorator.package import OEHasPackage
 
 ### Status of qemu images.
@@ -22,14 +26,27 @@ from oeqa.runtime.decorator.package import OEHasPackage
 ###
 
 class LoginTest(OERuntimeTestCase):
+    @OEHasPackage(['matchbox-desktop'])
     def test_screenshot(self):
         if self.td.get('MACHINE') in ("qemuppc64", "qemuarmv5", "qemuriscv32", "qemuloongarch64"):
             self.skipTest("{0} is not currently supported.".format(self.td.get('MACHINE')))
 
-        # Set DEBUG_CREATE_IMAGES to 1 in order to populate the image-test images directory.
-        DEBUG_CREATE_IMAGES="0"
-        # Store failed images so we can debug them.
-        failed_image_dir=self.td.get('TOPDIR') + "/failed-images/"
+        pn = self.td.get('PN')
+
+        ourenv = os.environ.copy()
+        origpath = self.td.get("ORIGPATH")
+        if origpath:
+            ourenv['PATH'] = ourenv['PATH'] + ":" + origpath
+
+        for cmd in ["identify.im7", "convert.im7", "compare.im7"]:
+            try:
+                subprocess.check_output(["which", cmd], env=ourenv)
+            except subprocess.CalledProcessError:
+                self.skipTest("%s (from imagemagick) not available" % cmd)
+
+
+        # Store images so we can debug them if needed
+        saved_screenshots_dir = self.td.get('T') + "/saved-screenshots/"
 
         ###
         # This is a really horrible way of doing this but I've not found the
@@ -50,8 +67,6 @@ class LoginTest(OERuntimeTestCase):
         # 'works'.
         ###
 
-        import time
-        
         # qemumips takes forever to render. We could probably get away with 20
         # here were it not for that.
         time.sleep(40)
@@ -62,46 +77,36 @@ class LoginTest(OERuntimeTestCase):
             # Find out size of image so we can determine where to blank out clock.
             # qemuarm and qemuppc are odd as it doesn't resize the window and returns
             # incorrect widths
-            if self.td.get('MACHINE')=="qemuarm" or self.td.get('MACHINE')=="qemuppc":
-                width="640"
+            if self.td.get('MACHINE') == "qemuarm" or self.td.get('MACHINE') == "qemuppc":
+                width = "640"
             else:
                 cmd = "identify.im7 -ping -format '%w' {0}".format(t.name)
-                width = subprocess.check_output(cmd, shell=True).decode()
+                width = subprocess.check_output(cmd, shell=True, env=ourenv).decode()
 
-            rblank=int(float(width))
-            lblank=rblank-40
+            rblank = int(float(width))
+            lblank = rblank-40
 
             # Use the meta-oe version of convert, along with it's suffix. This blanks out the clock.
             cmd = "convert.im7 {0} -fill white -draw 'rectangle {1},10 {2},22' {3}".format(t.name, str(rblank), str(lblank), t.name)
-            convert_out=subprocess.check_output(cmd, shell=True).decode()
-
-            if DEBUG_CREATE_IMAGES=="1":
-                # You probably aren't interested in this as it's just to create the images we compare against.
-                import shutil
-                shutil.copy2(t.name, "{0}/meta/files/image-tests/core-image-sato-{1}.png".format(self.td.get('COREBASE'), \
-                                                                                                 self.td.get('MACHINE')))
-                self.skipTest("Created a reference image for {0} and placed it in {1}/meta/files/image-tests/.".format(self.td.get('MACHINE'), self.td.get('COREBASE')))
+            convert_out=subprocess.check_output(cmd, shell=True, env=ourenv).decode()
+
+
+            bb.utils.mkdirhier(saved_screenshots_dir)
+            savedfile = "{0}/saved-{1}-{2}-{3}.png".format(saved_screenshots_dir, \
+                                                                        datetime.timestamp(datetime.now()), \
+                                                                        pn, \
+                                                                        self.td.get('MACHINE'))
+            shutil.copy2(t.name, savedfile)
+
+            refimage = self.td.get('COREBASE') + "/meta/files/screenshot-tests/" + pn + "-" + self.td.get('MACHINE') +".png"
+            if not os.path.exists(refimage):
+                self.skipTest("No reference image for comparision (%s)" % refimage)
+
+            cmd = "compare.im7 -metric MSE {0} {1} /dev/null".format(t.name, refimage)
+            compare_out = subprocess.run(cmd, shell=True, capture_output=True, text=True, env=ourenv)
+            diff=float(compare_out.stderr.replace("(", "").replace(")","").split()[1])
+            if diff > 0:
+                # Keep a copy of the failed screenshot so we can see what happened.
+                self.fail("Screenshot diff is {0}. Failed image stored in {1}".format(str(diff), savedfile))
             else:
-                # Use the meta-oe version of compare, along with it's suffix.
-                cmd = "compare.im7 -metric MSE {0} {1}/meta/files/image-tests/core-image-sato-{2}.png /dev/null".format(t.name, \
-                                                                                                                        self.td.get('COREBASE'), \
-                                                                                                                        self.td.get('MACHINE'))
-                compare_out = subprocess.run(cmd, shell=True, capture_output=True, text=True)
-                diff=float(compare_out.stderr.replace("(", "").replace(")","").split()[1])
-                if diff > 0:
-                    from datetime import datetime
-                    import shutil
-                    import os
-                    try:
-                        os.mkdir(failed_image_dir)
-                    except FileExistsError:
-                        # directory exists
-                        pass
-                    # Keep a copy of the failed screenshot so we can see what happened.
-                    failedfile="{0}/failed-{1}-core-image-sato-{2}.png".format(failed_image_dir, \
-                                                                               datetime.timestamp(datetime.now()), \
-                                                                               self.td.get('MACHINE'))
-                    shutil.copy2(t.name, failedfile)
-                    self.fail("Screenshot diff is {0}. Failed image stored in {1}".format(str(diff), failedfile))
-                else:
-                    self.assertEqual(0, diff, "Screenshot diff is {0}.".format(str(diff)))
+                self.assertEqual(0, diff, "Screenshot diff is {0}.".format(str(diff)))
-- 
2.40.1


