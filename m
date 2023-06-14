Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB02EEB64DA
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:33 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.7341.1686734965750310034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=e3dOur/g;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-977d4a1cf0eso72982866b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734964; x=1689326964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wWnnk3/OWk0V3vA0y5OwGq4MFU8RiuL21WE4zwNx/Os=;
        b=e3dOur/g+LkP+Kob/dKzcwxxFBzsL23YrSCS7AswjLlnEVoSS5Pscy+u/z1Cpfl7re
         P+NyadxzG2jxT3INhiOAjm8G52vcSgdAbIp/NSB4IVNeeG3WhbZEJXvVQXby/stXrRIj
         rhzfopW+EC9aDVLUY9k1inNuMnfisxLUMywYx6EgfanFozemci1feaLRLUu2ctzoVxlu
         4I5nq1ei7K9efwZyZr+8Xu4qxMjOtyMN3fjj8Wzsr/WhJxKGdH47jKulpVH2G8IaHjyQ
         qQ66pRz+363WIlB3xDcJg/e8n8QdAn4hoBKvXl2Uu8ehz8qrAd2X9aGqu1XfvM1iiWkw
         Adpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734964; x=1689326964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWnnk3/OWk0V3vA0y5OwGq4MFU8RiuL21WE4zwNx/Os=;
        b=eazTB95YW3zSw38qp1S5OxUaDDDV+4arHHkgybHCX0KK/cAivdeflHmzgQij0Ga6+i
         n9GdIKCYHZfLR7BYKLqrgT0Te6kTXUXIYZgmqPYY7+VjLP+Yqk124XwAnhp3nFUUd/QF
         rNfBtZx0Gq0YW0vXRmYBYkr2u4CQdyhyGQMKyvobQUIxbJJ7hlTPHTvDu7Ae1RIyd8Dz
         rKpu3ItY0Z/3a+JFyNYarb9/7iYimiT0AnOaNbnCPWRcxoNgUX6nWiAGR34mA7LAqt4Z
         SaCvRAXDgoAFZdgBgj9Zd7kaaD/YdfOVnJCJ7L0tO02qKi+5aDpbR7DuBnBSDhQVRRKZ
         5GhQ==
X-Gm-Message-State: AC+VfDwgrrQbRGx4u6n8WdbseRYWFEdQCiPEHEYdXS94sYsttIstQxJt
	rR6ycA9RWG68J9i2050362D6yPvY7vg=
X-Google-Smtp-Source: ACHHUZ69INtUlAZ+YImL1vv3H/vsQSLV08ju0+KPLjNoGndEJo604Ozl0/Da4ZQZZcc4Q+U8/NR0Cg==
X-Received: by 2002:a17:907:a0a:b0:958:4c75:705e with SMTP id bb10-20020a1709070a0a00b009584c75705emr13664305ejc.17.1686734963829;
        Wed, 14 Jun 2023 02:29:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/55] insane.bbclass: add a SUMMARY/HOMEPAGE check (oe-core recipes only)
Date: Wed, 14 Jun 2023 11:28:24 +0200
Message-Id: <20230614092918.4065570-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182746

This was done in a selftest, but that is too late and creates
friction in integration as errors are not seen until autobuilder fails.

Bonus fix: SUMMARY check wasn't even working, as in the absence
of one set in the recipe there is a default value set from bitbake.conf.

I left DESCRIPTION check out for now, as many recipes don't actually
have it, and it's set from SUMMARY (plus a dot) if absent.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass         | 26 ++++++++++++++++
 meta/lib/oeqa/selftest/cases/distrodata.py | 36 ----------------------
 2 files changed, 26 insertions(+), 36 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 8788f58fc5b..632f738c86d 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -34,6 +34,7 @@ WARN_QA ?= " libdir xorg-driver-abi buildpaths \
             missing-update-alternatives native-last missing-ptest \
             license-exists license-no-generic license-syntax license-format \
             license-incompatible license-file-missing obsolete-license \
+            missing-metadata \
             "
 ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
             perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
@@ -1473,6 +1474,28 @@ python do_qa_unpack() {
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
 
@@ -1484,6 +1507,9 @@ do_configure[postfuncs] += "do_qa_configure "
 # Check does S exist.
 do_unpack[postfuncs] += "do_qa_unpack"
 
+# Check basic recipe metadata (e.g. SUMMARY/HOMEPAGE/RECIPE_MAINTAINER)
+do_fetch[postfuncs] += "do_qa_fetch"
+
 python () {
     import re
     
diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index c83a3a7bd67..fd262fe3c9e 100644
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


