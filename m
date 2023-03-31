Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2728EC6FD18
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:26:56 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.47959.1680240404715480497
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QdziUm4x;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id t4so15950306wra.7
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680240405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVZ7P8nu3gHOdYnH7PabS1edKddumbrCw7vxRb07xdg=;
        b=QdziUm4xnF3XufVt+Txp8QMS9ebqBTlVouS1KKGsNNwuuAMHTUGGObyfZbV+sLpKZO
         bw/08Kox6P/vDEZZM68eWsa14FQIqYfSHgFnLR2gUJWFN1ltwaL3Ey88NjNvi51nM+id
         TtBaAl306Lf2OFKWWhSwyWU+o7tpxwRjMlp5K6Cgl6Q3O7vJNrgRRuCu6l3vEdLF6o36
         IycsI6LMAPK3w+tKrxtEbygIINUhZjwyQQKKBw03xxsfvmpKQngfoT6awVdhf7f7S/OC
         8GhDNG2CD2K8FiYRIgLmTHO4O5tqE1souOD1YUWaiEPSPlnGpJ6yBJnhjOWDAXuB1ajq
         pbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680240405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVZ7P8nu3gHOdYnH7PabS1edKddumbrCw7vxRb07xdg=;
        b=y2qavRvwbNa5d7Y30zdeeW5GKdxpr2SmKpGpVaAlAC8/BYRUaDKQmMSSW7u8XG+WG9
         cT8uKyOit21j/UO/p9Ha5Ya1/0+xJfdwEtkCqbQ7nLlV+kusFaX79gNHmtKZsIZmAWkN
         29aZxyn6+or1sC5EYivODp82pF6Z5I9tAgNvkbDrXCcKdqpfdLCw8n1nGqaJ0YH6rLmU
         YMDT5w8RKLAD+ahwsSusblcSCRW1rm8mU9TW3N9l2CFUt44A/kukaoLy2haU6A4Ejct4
         ad7TQ+0ZHIxG/3szCk6mtf0vJXVWyoCxzM88/MrAWAZYvCtRWPNSyxg7sNYF0nsgT+TU
         5dzw==
X-Gm-Message-State: AAQBX9evshvSFUC1p50rFZ0bNXri0gZ8B4HIGxrKaZHBPja8sAJdLAwL
	4aFwBxWgvFJZROb8w56VaG6rApBKpYU=
X-Google-Smtp-Source: AKy350bqv9rjsg9q6qzcSgLwGCeuvw+DltcrVMT37luPrrlpF3wLJc56TmqXOgoHShjQZKocxjeC8A==
X-Received: by 2002:adf:eb4c:0:b0:2ce:ae05:4436 with SMTP id u12-20020adfeb4c000000b002ceae054436mr19057116wrn.41.1680240404882;
        Thu, 30 Mar 2023 22:26:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d5265000000b002e55cc69169sm1146902wrc.38.2023.03.30.22.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:26:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/7] insane.bbclass: add a SUMMARY/HOMEPAGE check (oe-core recipes only)
Date: Fri, 31 Mar 2023 07:26:35 +0200
Message-Id: <20230331052636.978578-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331052636.978578-1-alex@linutronix.de>
References: <20230331052636.978578-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179387

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


