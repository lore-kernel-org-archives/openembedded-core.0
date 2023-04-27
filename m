Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6675EC77B7E
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:35:41 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.14865.1682580936171306454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=g2zBesz+;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f09b4a1584so55596335e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682580934; x=1685172934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVZ7P8nu3gHOdYnH7PabS1edKddumbrCw7vxRb07xdg=;
        b=g2zBesz+Jcf2Nuve839qBGK3HPWJG1TKNKVZRTJFng90+cRfs9W1CNun3LiyBQVbWZ
         awEzzNusLmCTTAZt8Axll7h82H6C4IA/g6cynVNNULXm+8xC+FCsUZZFcJciUXqCMqFg
         f7hXbxMEMZTJZs98MoYTGf5s+05uSIJTAaAOD8uvWpAHlKr5GUvEShmrwDPM1zoNvSai
         7aTFwpRZUsBlfdUcce9OHc/6yA1s+/WJPyOSSkpoI6qez1QzImHaUEFoTBDyjuL2XHDt
         7RhkVqaY2JC0Ae2eNNk97+VJHswfBUKwQDDF0541KV5necjsbJ98QZhD0deAPJKNmOJW
         l8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682580934; x=1685172934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVZ7P8nu3gHOdYnH7PabS1edKddumbrCw7vxRb07xdg=;
        b=WqdJSbH80bhALwkndPEZuN6uEgklYVYJ70KS0IZfV/cRVb62Jo0qyCAPDp46/UKMDI
         AIeoOFC3O1J6I3hANuLW9tTGmOY2731PWOphVMJRzgKXFnfDr7UkymJbCflaPpzg5kYJ
         VRF+k050R3cO4Esg8ubyqovrRBcmvBYy2gcwRiaBkAVVkascNCO8UI8xxiB97rb8MVnz
         crXg1CPn1i2sv/vYwBenTwHryLu+c60bfKzt72R4ww0MeVwl8BTJVSEwneOgzZuS8IS9
         TM3Jdmqqq6LS8/F9m1X8K/LgKt5M0+2iERKk7jpjAfrtrIwSf86LaYOefGcmAPkGR804
         hrBQ==
X-Gm-Message-State: AC+VfDzfrvtgSv6m4Dcr+hJWPRw0tBqYkX3reG8cFGQFdzKEMBVvALSQ
	X6d/TKjlIC/IlhMBOoewECxDYFYfEfU=
X-Google-Smtp-Source: ACHHUZ6fBv8ITQXgGlFt9jU/Q/7L4WTuBfQK7EKHoiSujlAPXq/rOAWQ9Y2ms30zLZj+oA5691XPcA==
X-Received: by 2002:adf:cc90:0:b0:2f6:ece3:76a with SMTP id p16-20020adfcc90000000b002f6ece3076amr543959wrj.8.1682580934270;
        Thu, 27 Apr 2023 00:35:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id r4-20020adfdc84000000b002f598008d50sm17678411wrj.34.2023.04.27.00.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 00:35:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/5] insane.bbclass: add a SUMMARY/HOMEPAGE check (oe-core recipes only)
Date: Thu, 27 Apr 2023 09:35:24 +0200
Message-Id: <20230427073528.3956414-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180475

This was done in a selftest, but that is too late and creates
friction in integration as errors are not seen until autobuilder fails.

Bonus fix: SUMMARY check wasn't even working, as in the absence
of one set in the recipe there is a default value set from bitbake.conf.

I left DESCRIPTION check out for now, as many recipes don't actually
have it, and it's set from SUMMARY (plus a dot) if absent.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass         | 27 +++++++++++++++-
 meta/lib/oeqa/selftest/cases/distrodata.py | 36 ----------------------
 2 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index ee34d5208d1..64ad76c48e9 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -44,7 +44,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             already-stripped installed-vs-shipped ldflags compile-host-path \
             install-host-path pn-overrides unknown-configure-option \
             useless-rpaths rpaths staticdev empty-dirs \
-            patch-fuzz patch-status-core\
+            patch-fuzz patch-status-core missing-metadata \
             "
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
@@ -1481,6 +1481,28 @@ python do_qa_unpack() {
     unpack_check_src_uri(d.getVar('PN'), d)
 }
 
+python do_qa_fetch() {
+    def test_missing_metadata(d):
+        fn = d.getVar("FILE")
+        if not '/meta/recipes-' in fn:
+            # We are only interested in OE-Core
+            return
+        pn = d.getVar('BPN')
+        srcfile = d.getVar('SRC_URI').split()
+        # Check that SUMMARY is not the same as the default from bitbake.conf
+        if d.getVar('SUMMARY') == d.expand("${PN} version ${PV}-${PR}"):
+            oe.qa.handle_error("missing-metadata", "Recipe {} in {} does not contain a SUMMARY. Please add an entry.".format(pn, fn), d)
+        if not d.getVar('HOMEPAGE'):
+            if srcfile and srcfile[0].startswith('file') or not d.getVar('SRC_URI'):
+                # We are only interested in recipes SRC_URI fetched from external sources
+                pass
+            else:
+                oe.qa.handle_error("missing-metadata", "Recipe {} in {} does not contain a HOMEPAGE. Please add an entry.".format(pn, fn), d)
+
+    test_missing_metadata(d)
+    oe.qa.exit_if_errors(d)
+}
+
 # Check for patch fuzz
 do_patch[postfuncs] += "do_qa_patch "
 
@@ -1492,6 +1514,9 @@ do_configure[postfuncs] += "do_qa_configure "
 # Check does S exist.
 do_unpack[postfuncs] += "do_qa_unpack"
 
+# Check basic recipe metadata (e.g. SUMMARY/HOMEPAGE/RECIPE_MAINTAINER)
+do_fetch[postfuncs] += "do_qa_fetch"
+
 python () {
     import re
     
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index b5554a6c3c3..b443f2d3af6 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -39,42 +39,6 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
 """ + "\n".join(regressed_successes)
         self.assertTrue(len(regressed_failures) == 0 and len(regressed_successes) == 0, msg)
 
-    def test_missing_homepg(self):
-        """
-        Summary:     Test for oe-core recipes that don't have a HOMEPAGE or DESCRIPTION
-        Expected:    All oe-core recipes should have a DESCRIPTION entry
-        Expected:    All oe-core recipes should have a HOMEPAGE entry except for recipes that are not fetched from external sources.
-        Product:     oe-core
-        """
-        with bb.tinfoil.Tinfoil() as tinfoil:
-            tinfoil.prepare(config_only=False)
-            no_description = []
-            no_homepage = []
-            for fn in tinfoil.all_recipe_files(variants=False):
-                if not '/meta/recipes-' in fn:
-                    # We are only interested in OE-Core
-                    continue
-                rd = tinfoil.parse_recipe_file(fn, appends=False)
-                pn = rd.getVar('BPN')
-                srcfile = rd.getVar('SRC_URI').split()
-                #Since DESCRIPTION defaults to SUMMARY if not set, we are only interested in recipes without DESCRIPTION or SUMMARY
-                if not (rd.getVar('SUMMARY') or rd.getVar('DESCRIPTION')):
-                    no_description.append((pn, fn))
-                if not rd.getVar('HOMEPAGE'):
-                    if srcfile and srcfile[0].startswith('file') or not rd.getVar('SRC_URI'):
-                        # We are only interested in recipes SRC_URI fetched from external sources
-                        continue
-                    no_homepage.append((pn, fn))
-        if no_homepage:
-            self.fail("""
-The following recipes do not have a HOMEPAGE. Please add an entry for HOMEPAGE in the recipe.
-""" + "\n".join(['%s (%s)' % i for i in no_homepage]))
-
-        if no_description:
-            self.fail("""
-The following recipes do not have a DESCRIPTION. Please add an entry for DESCRIPTION in the recipe.
-""" + "\n".join(['%s (%s)' % i for i in no_description]))
-
     def test_maintainers(self):
         """
         Summary:     Test that oe-core recipes have a maintainer and entries in maintainers list have a recipe
-- 
2.30.2


