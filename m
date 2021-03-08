Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.3285.1615237935871153070
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 13:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YLXQfXqO;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so1702719wmj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 13:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1vJiqrIlyorJ96LUHi4MkHViGZOMqMBXslBf3DzD9Lg=;
        b=YLXQfXqOWnaqUlwHQnQcgnwalNIBElN7rO6u3wWuSnXHnVRYviA6+Spu8h+tgTrjhz
         x5qlaqt6Gw0QTj49mJZBqhyInc34iPsPJXTzNjkiwA4YdSaZ51CS8VudAkicTsUIkDTg
         YJjrGUtbV5xabFFWtux+dQ/+Az5qMb+YxdXXuLNZTUg5v7PNTxf/p8Qw+ezh1OJQu5OA
         W8kkyetCFuBi25HAOr1qui2L5D9AFydBggA5d4ctSrr/AyDqoIF5BeZ7OrvAxJ5DhsGw
         DaipKUUEmR4GqrPkb5eHUHh6/B2vi29R9BCoZAKVo1uPelAN3kNh8ITj9EoFPbBOSbYX
         /TGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1vJiqrIlyorJ96LUHi4MkHViGZOMqMBXslBf3DzD9Lg=;
        b=QV05D4q0XYewjpiwa/Pr4E+ugW4qhvy6elx4I1YwTIv8Z0+gkIaVMM0l6Ov5OQbboW
         O0SIb9WL0cLlsTp+sceMviJ8O1K3iIrHldNXNSJ+v2G48O8WddDIp06esN42fN/gUgGW
         dg7KcyVyUfdtZjjEsZlMeR+7wVXgz0tctBEkidFeDZqOS1D/EdF858XUfbdQZZoEKoSS
         uJ5e0JYpmtOf1Abv5FXVPkT4ebBw69nTDOifxmq2oYfMtCeEr9XdEiHop+n5eLbPArSF
         m8JeTG8wRlBAxNemS8+l3mJCOgONvLUZPsj0IyrdDF9LpssUBpk60DQzoQvOYAx//Bdu
         2VpQ==
X-Gm-Message-State: AOAM533p5ruSYQ2AI128NF/Vnuzcpysi5atg1sBbKA/64cc0/RWH39SW
	Tf7jhRCaP9OlSgcuqt3eoUuzSI3GXiDD+w==
X-Google-Smtp-Source: ABdhPJyAOAdCVTQOiox8Y5f4oDJvvml6Ksl3/9sr526dI8EnBZs48Y8ZOVWtCOAOv0I38LL0CZ70Cg==
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr616687wmd.83.1615237933919;
        Mon, 08 Mar 2021 13:12:13 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.38.122])
        by smtp.gmail.com with ESMTPSA id f14sm801164wmf.7.2021.03.08.13.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 13:12:13 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dorinda Bassey <dorindabassey@gmail.com>
Subject: [PATCH v2][RFC] distrodata.py: Test to track recipes without HOMEPAGE or DESCRIPTION
Date: Mon,  8 Mar 2021 22:12:07 +0100
Message-Id: <20210308211207.6853-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Dorinda Bassey <dorindabassey@gmail.com>

This test is to keep track of recipes that do not have a HOMEPAGE or DESCRIPTION,
with exceptions to recipes whose SRC_URI are not linked to external sources.

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
v2:
-Changed PN to BPN
-Used set() instead of lists
-Changed condition for checking recipes with missing DESCRIPTION

 meta/lib/oeqa/selftest/cases/distrodata.py | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/distrodata.py b/meta/lib/oeqa/selftest/cases/distrodata.py
index e1cfc3b621..633bf25dc7 100644
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
+            no_description = set()
+            no_homepage = set()
+            for fn in tinfoil.all_recipe_files(variants=False):
+                if not '/meta/recipes-' in fn:
+                    # We are only interested in OE-Core
+                    continue
+                rd = tinfoil.parse_recipe_file(fn, appends=False)
+                pn = rd.getVar('BPN')
+                srcfile = rd.getVar('SRC_URI').split()
+                #Since DESCRIPTION defaults to SUMMARY if not set, we are only interested in recipes without DESCRIPTION or SUMMARY
+                if not (rd.getVar('SUMMARY') or rd.getVar('DESCRIPTION')):
+                    no_description.add((pn, fn))
+                if not rd.getVar('HOMEPAGE'):
+                    if srcfile and srcfile[0].startswith('file') or not rd.getVar('SRC_URI'):
+                        # We are only interested in recipes SRC_URI fetched from external sources
+                        continue
+                    no_homepage.add((pn, fn))
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

