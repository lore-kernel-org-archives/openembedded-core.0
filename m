Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D2BC7EE23
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 17:26:45 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.1272.1684776398211154241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 10:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=NmDLhqVi;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-510d9218506so7916143a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 10:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684776396; x=1687368396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wWnnk3/OWk0V3vA0y5OwGq4MFU8RiuL21WE4zwNx/Os=;
        b=NmDLhqVizPCXWS/lpE1UmBnu1e12Z2xRL14066/AfyufAu5moa355jl5ffwWep0oRi
         a1WfSojrhLDCA8Xcm9K7lbz+/JdVK97r+/Xare+V1Hw5P1MrDUVCySQmP+i7ROpfjWiL
         rp2yFstcpJsJ8HzNMygkG+bfIaNFBbWn5/OTRRTvPXBkW0p3wUw2v7DcjR90fQjgsI5B
         RaSXe+tHx1auBmqCBgHcVvOA/3VHF6AdAoXetuRHdB5mftMmnCXiTSwyAcfTq6ZB7c+m
         vr5vLcPdyS5WkpbdXyn8rjJSt9aa8dCXFL56vWGG/Lyf772u2UaQm3z9LUavZuPwNs2E
         t2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684776396; x=1687368396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWnnk3/OWk0V3vA0y5OwGq4MFU8RiuL21WE4zwNx/Os=;
        b=RkGtbByDMLjwuGc0oUmdlhge8rtRZgilLH3QCiBmka3tzShMv3Flw46elU46nCV2Dk
         A5VhQDUAiSmrDVzO+YQ+hoDC4TG3KKQ6z4aHkc63uQkXjN6ZQ0sS8L4Z/VIciTD6OhcW
         8uOyddzv/l6bd8+V6PzsiiRzNSZcXsDkQHmEIOZhIkyIPHtwp7UEiypD1RxRjsnIH+Jt
         smIySnjvmuuHYZvUvXeSyE+JIvmibdoE69PM2ndezzanYJVlo6fuL3Z+BvmfAu49wacz
         VkAfZegFu9FJtZBvZw0Oi5i+YCnP0Gix9ykOEL6FZK36Z47crlhLRzaTWokMnyrNvI/n
         3dig==
X-Gm-Message-State: AC+VfDyFVXgukSPgxHZJvhQ6fVBi0Ko/17pZbIYNeJepKTiorZd8OC4s
	bbDfmI/nzfKQe+kqHgs6UEZHfu0KSSY=
X-Google-Smtp-Source: ACHHUZ7nvwSQuvhAbkQJ7HGhjNmNW1AwpE4ffHn+3PKKJNJLfn2iKDXWRiRui7XOdQmYQ8O6cYbHPA==
X-Received: by 2002:a05:6402:354e:b0:50b:c350:f9ca with SMTP id f14-20020a056402354e00b0050bc350f9camr18509072edd.10.1684776396365;
        Mon, 22 May 2023 10:26:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id c9-20020aa7c989000000b0050b2f588db6sm3124350edt.16.2023.05.22.10.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 10:26:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/8] insane.bbclass: add a SUMMARY/HOMEPAGE check (oe-core recipes only)
Date: Mon, 22 May 2023 19:24:56 +0200
Message-Id: <20230522172503.1651374-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 17:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181601

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


