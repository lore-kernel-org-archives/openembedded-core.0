Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.13132.1615064010566754135
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Mar 2021 12:53:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WCoaP8Is;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso1448271wmi.3
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Mar 2021 12:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ujJuF0ddECLVv3CfR4Z0qcwC6j4/SF6QNkQEkCTizc8=;
        b=WCoaP8IsE8dCZ58udnGYwZZ5Yqi98iwGjc21GDdUj4tazczXU9dLp0Nj7kmPnFucRu
         s28hiHsWHXkKKVu7rCK8qE54BDorup+dsZuFTLkgq+DqMGSLf324IPqm93kL3/ErBd8j
         9v3a+45MZaLXi116jUFfxIC0db1dhZw7ENuFSVu3HRb+yDhThFR4HPPL7ZWtmmONcYXF
         3cWceW2p5OVbtwrEblhlX5s8HuGj1GqkOQViiwMReEiQqTxLVw6UcLv4ExOBdaqzHzwx
         yuZtBkkodqWyoUiSoz/L+IDfOrBW+qiaM+M7aEgg7Lbo0JDi2SDl4cvrTOV7OyOGh3hr
         OUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ujJuF0ddECLVv3CfR4Z0qcwC6j4/SF6QNkQEkCTizc8=;
        b=P2PqPWuXhpoc14Xuyhiy6uyHftj968aRz9b5BMgcFG9fbm0T8IP3mHGOwOhZ/nMfn8
         KEu4XoAyjxyW0kJQ+Mhb7S2jwxUpPPB7/Lrui7StEZetlh1HTK2q4x22m+G5Cte6S3H2
         LlFQoBliGk0bl9lTC0QgbJPqkEVS9NXLsjDzGn2OKGjoRP12elrYth2L11xJoSuNeTQ8
         HCR3WeC93dLhITTHgzdfkkP4SNWHJl8HzYiskRs82rUgStnSHAd1qkTLtqrq2vTkshvm
         gQ/2MES72KDZfeYGrakR7KKDQipHBAycl7svpHUg/6Db6LLsx1eL0nWYvjNNyhhYQeWv
         JWYg==
X-Gm-Message-State: AOAM530jZrcr5TQJsoTwOAF8Prmhq5N6uPr+B3lkVhLyT2G+zSWsdd/+
	OuUcHXe/DQHGkTWWIMaTouHSzT685pU=
X-Google-Smtp-Source: ABdhPJwC/VxtXmNyin0F80zQnqtyzsGPIt6B+53UR/PborJCgJWjFFVT4QFhjZJ1oX3eU8CW8aw5Mw==
X-Received: by 2002:a1c:5455:: with SMTP id p21mr15036350wmi.138.1615064008727;
        Sat, 06 Mar 2021 12:53:28 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.70.143])
        by smtp.gmail.com with ESMTPSA id h22sm10744179wmb.36.2021.03.06.12.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 12:53:28 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [RFC] distrodata.py: Test to track recipes without HOMEPAGE or DESCRIPTION
Date: Sat,  6 Mar 2021 21:53:20 +0100
Message-Id: <20210306205320.28581-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

This test is to keep track of recipes that do not have a HOMEPAGE or DESCRIPTION,
with exceptions to recipes whose SRC_URI are not linked to external sources.

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/lib/oeqa/selftest/cases/distrodata.py | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index e1cfc3b621..d8df0b530c 100644
--- a/meta/lib/oeqa/selftest/cases/distrodata.py
+++ b/meta/lib/oeqa/selftest/cases/distrodata.py
@@ -40,6 +40,40 @@ but their recipes claim otherwise by setting UPSTREAM_VERSION_UNKNOWN. Please re
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
+                pn = rd.getVar('PN')
+                srcfile = rd.getVar('SRC_URI').split()
+                if not rd.getVar('DESCRIPTION'):
+                    no_description.append((pn, fn))
+                if not rd.getVar('HOMEPAGE'):
+                    if len(srcfile) > 0 and srcfile[0].startswith('file') or not rd.getVar('SRC_URI'):
+                        # We are only interested in recipes SRC_URI fetched from external sources
+                        continue
+                    no_homepage.append((pn, fn))
+        if no_homepage:
+            self.fail("""
+The following recipes do not have a HOMEPAGE. Please add an entry for HOMEPAGE in the recipe.
+""" + "\n".join(['%s (%s)' % i for i in no_homepage]))
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

