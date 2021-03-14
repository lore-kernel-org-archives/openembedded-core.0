Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.5594.1615726694212662012
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 05:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tS11YRGV;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id j7so4281792wrd.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CnnsKLaj75O8RmgjgYxYI9lE6/NC6jsQGtAFzpwrM1k=;
        b=tS11YRGVhd/nfI1UEn2ew4UwbaOQRfjwUtmRijtrZmzwDPmih9fBRky1LPC7khsP5y
         8V0jelzI/KIeqcALEXBPZWb0EDywXtjPt5qQM3yyPsNfvCIUuEtfYdr5AHw8M++7pVZc
         8UHpI5E4uGR6ecOHZ8DRwNadKjmJTJWKfjFpeODub5IZeyVC9jCkl2W0eCGmuDCB2g6M
         4TQSo1/JWfncFyBRfUc1948lY6I3MCG7PLioQajOTr5VWWBKGf5X8k9ZezDmBgwBk9Tg
         a7TWXhe7n4CpFseYW+QbmspEM7NF7TZtYKwOyUfbOPs3ErXTSyTml3ABJN0hwhArngJV
         JGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CnnsKLaj75O8RmgjgYxYI9lE6/NC6jsQGtAFzpwrM1k=;
        b=aIqkQrvrqQzDRfq8NcixelspJ62TZ0b/uxowVCrzuilhVES8k7lOECOhw1YwCZ5PZR
         IOegjO/JPmcyT2Hg6SKbTu801NXMZv+SDb57XpvsGoB53oO4ZHkUemN1RfeOdc+5PpFN
         BjUa4xtUtknAxc+DUNpGatbs8ZtW44BQEhwM23xzLXeEAngrdcc6CiGN77Vha+WggRzy
         YzjWTTcU4lD23G1XlTgvb142anE+YOsgg49eK2JF6JN/zlMP1iXdiyLTJyR9abrgk2bm
         Q3iaRm5O8ihAmKJQJRnlPFOgNcPdQFxfjMmKa0WbpI46RdFD8v56VYKAWVhRCUesRZyj
         zT+g==
X-Gm-Message-State: AOAM531g+bDM/YayA5zUCyN5Si0DpkVRoumrBzBWmmujlyZbRV9na1MG
	6PtJR3D5S2XA5vDcrQfvoTFR/1J/RmE=
X-Google-Smtp-Source: ABdhPJx7GqHpOEr0in/gUaD4cAqLB2eGe7UdbIAIcMppGqxJahfi2qU6YN8UzDP9bvzlpHklWqlxHQ==
X-Received: by 2002:adf:b355:: with SMTP id k21mr23134183wrd.156.1615726692414;
        Sun, 14 Mar 2021 05:58:12 -0700 (PDT)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.100.235])
        by smtp.gmail.com with ESMTPSA id a131sm9554738wmc.48.2021.03.14.05.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 05:58:11 -0700 (PDT)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dorinda Bassey <dorindabassey@gmail.com>
Subject: [PATCH v3][RFC] distrodata.py: Test to track recipes without HOMEPAGE or DESCRIPTION
Date: Sun, 14 Mar 2021 13:58:03 +0100
Message-Id: <20210314125803.13160-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Dorinda Bassey <dorindabassey@gmail.com>

This test is to keep track of recipes that do not have a HOMEPAGE or DESCRIPTION,
with exceptions to recipes whose SRC_URI are not linked to external sources.

Results of this test: it take about 2 to 3 minutes for this test to complete execution
depending on the laptop used, Recipes that didn't have a homepage or description were found,
and using list data structure instead of set() returned an ordered list of recipes that
didn't have a homepage. Hence it's easier to view recipes with missing homepage and description.

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
v3:
-Changed commit log
-replaced set() with list data structure for consistency in the script and order.

 meta/lib/oeqa/selftest/cases/distrodata.py | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index e1cfc3b621..fbc0c2a98d 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -40,6 +40,42 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
 """ + "\n".join(regressed_successes)
         self.assertTrue(len(regressed_failures) == 0 and len(regressed_successes) == 0, msg)
 
+    def test_missing_homepg(self):
+        """
+        Summary:     Test for oe-core recipes that don't have a HOMEPAGE or DESCRIPTION
+        Expected:    All oe-core recipes should have a DESCRIPTION entry
+        Expected:    All oe-core recipes should have a HOMEPAGE entry except for recipes that are not fetched from external sources.
+        Product:     oe-core
+        """
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=False)
+            no_description = []
+            no_homepage = []
+            for fn in tinfoil.all_recipe_files(variants=False):
+                if not '/meta/recipes-' in fn:
+                    # We are only interested in OE-Core
+                    continue
+                rd = tinfoil.parse_recipe_file(fn, appends=False)
+                pn = rd.getVar('BPN')
+                srcfile = rd.getVar('SRC_URI').split()
+                #Since DESCRIPTION defaults to SUMMARY if not set, we are only interested in recipes without DESCRIPTION or SUMMARY
+                if not (rd.getVar('SUMMARY') or rd.getVar('DESCRIPTION')):
+                    no_description.append((pn, fn))
+                if not rd.getVar('HOMEPAGE'):
+                    if srcfile and srcfile[0].startswith('file') or not rd.getVar('SRC_URI'):
+                        # We are only interested in recipes SRC_URI fetched from external sources
+                        continue
+                    no_homepage.append((pn, fn))
+        if no_homepage:
+            self.fail("""
+The following recipes do not have a HOMEPAGE. Please add an entry for HOMEPAGE in the recipe.
+""" + "\n".join(['%s (%s)' % i for i in no_homepage]))
+
+        if no_description:
+            self.fail("""
+The following recipes do not have a DESCRIPTION. Please add an entry for DESCRIPTION in the recipe.
+""" + "\n".join(['%s (%s)' % i for i in no_description]))
+
     def test_maintainers(self):
         """
         Summary:     Test that oe-core recipes have a maintainer and entries in maintainers list have a recipe
-- 
2.17.1

