Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 959FDC05051
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 14:36:40 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.9063.1690468593776807241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 07:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=r1B+zyBi;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-992ca792065so138723966b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690468592; x=1691073392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJnORCtAArca2DjCo+uEEDsqFonoBN0ZZdiNVLZspgs=;
        b=r1B+zyBiqtxS7CVMiOeu5N7iLGaxV90r5YSxa5/oocPBMwEvGSzJUTGGwiW+CZjTLr
         KkQmBLAdxRpEcKPeVcwETeaZGN9YxFihtARgwV+MMRAi/qHCpBc10vV29l43gTJn/sV1
         4WNke4WP50mJl16KvPqQvhSmtJDvOUkPIIuNtc6Dwf63uZ0ERi3XfPxWPyGq0RmGLM5S
         1G98nLXRhuruIraWZSdFNIf1inRTBVedIKYljcaj/AmC3U7LC4VPzOkqEhhNRaX+JJXK
         24pQIAMY86UQ9fResBwjuzJVJ1H9YAH0c/l3HKjlQSfzW3cpCMigq0HoOsgpCjshuWAT
         Zqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468592; x=1691073392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJnORCtAArca2DjCo+uEEDsqFonoBN0ZZdiNVLZspgs=;
        b=h2k3XYmkjeHR0RzBd6Yp+tN0uMQn2+hdeSgHuVtcl7fnE/Oc3Q0egq8MU6akuI8+eR
         EVi2h6+VTRvIkAsD2rpM92q/810InO+uYNLibax6GKGGSvcPksX4qwX+RCIEGqo/tXAa
         Z9dqqHksO4rdqfQ70HPRU/RsSXsSPmGqpnyKyw/yNjtS/HZ/VfLgNhSoMa2/mL3XdJQz
         i/6kmKWCMHWCSBAldp38sCWNeKg86noUr1zkc7M+2AL1ErFrsqtc7DYFrosVNFnPfTnx
         UMthRsjJWKEG0158sNLaURcmxODxT9Gc4BuuZfClJBwRTAzJfAp5oIuKvxmPeYEYbOsK
         R1mw==
X-Gm-Message-State: ABy/qLbMTjwkIjKDGxLerenEQv4WBG3wIRmUBxQQmZYEKHSPE8lKm/RN
	SPsuZdO482RGpl4qCX1HHdMbrAKZCMU=
X-Google-Smtp-Source: APBJJlE0RRxiNbkal/BzzMKimOcBinYI+nGZPKZFmbgYqN9Hi1IBTeqvscR60iGP8cgo5pEaBcbTyA==
X-Received: by 2002:a17:907:7751:b0:991:d9cb:247d with SMTP id kx17-20020a170907775100b00991d9cb247dmr2163171ejc.57.1690468592108;
        Thu, 27 Jul 2023 07:36:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m10-20020a17090607ca00b0099bcf9c2ec6sm846725ejc.75.2023.07.27.07.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:36:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/21] insane.bbclass: add a SUMMARY/HOMEPAGE check (oe-core recipes only)
Date: Thu, 27 Jul 2023 16:36:10 +0200
Message-Id: <20230727143627.3718496-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230727143627.3718496-1-alex@linutronix.de>
References: <20230727143627.3718496-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184944

This was done in a selftest, but that is too late and creates
friction in integration as errors are not seen until autobuilder fails.

Bonus fix: SUMMARY check wasn't even working, as in the absence
of one set in the recipe there is a default value set from bitbake.conf.

I left DESCRIPTION check out for now, as many recipes don't actually
have it, and it's set from SUMMARY (plus a dot) if absent.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass         | 16 ++++++++++
 meta/lib/oeqa/selftest/cases/distrodata.py | 36 ----------------------
 2 files changed, 16 insertions(+), 36 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 148ae4b7ad5..78506c30b1e 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -50,6 +50,7 @@ ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
 # Add usrmerge QA check based on distro feature
 ERROR_QA:append = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', ' usrmerge', '', d)}"
 ERROR_QA:append:layer-core = " patch-status"
+WARN_QA:append:layer-core = " missing-metadata"
 
 FAKEROOT_QA = "host-user-contaminated"
 FAKEROOT_QA[doc] = "QA tests which need to run under fakeroot. If any \
@@ -1470,6 +1471,21 @@ python do_qa_unpack() {
 }
 
 python do_recipe_qa() {
+    def test_missing_metadata(d):
+        fn = d.getVar("FILE")
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
     oe.qa.exit_if_errors(d)
 }
 
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index 111bd3c9beb..ad952c004b5 100644
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


