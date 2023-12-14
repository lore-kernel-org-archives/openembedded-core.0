Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A71AC46CA2
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:46:08 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.22349.1702561567308503693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bir1bOuw;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so66467065e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702561566; x=1703166366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJR42CGzTFw2B2GH1aFPyryGB0RLjblm/6vFcLY+p9s=;
        b=Bir1bOuwxnH5yenfU95FeIQt6QrlR1LQ14rzdcv9JveQnhJB/gQagYPU0QqvWpnn7v
         SOB2NalM+ahVElFyxwiUJhj64siULc844g3eqqWdVKCwBe9AwemSU2Cuw452mncz0Ftc
         P8ABcLKIHqp04Hucrjd0Q+jo6YxqODJ3IXI+ldNoTijEMmyCgiquY0/MVPWI2u0f3xrQ
         n6aF46X2qNUfAREsH0BUxCRATDtn6A5vvIgP3FVHNdb9uuvOtUGsqHxndNSXU7cCmOV3
         J/n7JV+L/lHPlcs7lLcNlHvYh1V2NP0AVzXxyNaWy4a04qn5RcM1NCzenb3oMrrBUnsl
         p0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561566; x=1703166366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJR42CGzTFw2B2GH1aFPyryGB0RLjblm/6vFcLY+p9s=;
        b=byXGvWxN3y1XbD1BU3LfM5e/fhahnq3lrid7Fc3ify8bd+24gKo84cyiekP7ZE3UQX
         yLwt5n7yTgtkLIwLR9vEH1IDy1ZFOIxgLeItxOee6aB0UZN0She3UXkKiTYSELbn9rd5
         PZldnu/vl5IBixeDiwgCdOoOr77yzZvyv9BKcuMWqkffZEIa4+SSeggRL8O4Yu8vvCtc
         7J95yyq4A/Za98vZ/JNaTlaAxWQnhoED1eH3splOCoy5uW9RcwCzcfM9tnkVU/UFX90N
         MRWVP68S91DMyaXwE1Y407CIHBOWoIU+QonWdlBFozyd72QjFq+AykigKOl/9l+0puC5
         69YQ==
X-Gm-Message-State: AOJu0YzpXgoyoENXXIFSRQ7pNC4rGqOAQWP2eHzZF0MhAGtrS2Xnn4Oq
	VCgMhgkXqyqYuAqx+ticsFWPg8DfBCM=
X-Google-Smtp-Source: AGHT+IFeDGdCQgbKG07QkR8Xog+rvHVIepX8eQnBngvTyT9bjbvzFiIgup8XnDxIsq/BhP9rbhF5BA==
X-Received: by 2002:a05:600c:3b06:b0:40b:2a15:9b30 with SMTP id m6-20020a05600c3b0600b0040b2a159b30mr4927963wms.1.1702561565477;
        Thu, 14 Dec 2023 05:46:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003feae747ff2sm27293710wms.35.2023.12.14.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:46:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/9] oeqa/selftest/sstatetests: re-work CDN tests, add local cache tests
Date: Thu, 14 Dec 2023 14:45:20 +0100
Message-Id: <20231214134528.1973602-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192371

With the rework of printdiff, it is not longer useful for checking
absence of sstate objects in a remote http cache, as it would only
report the top level missing signatures, and leave the recursive
investigation to diffsigs (which relies on ability to list cache
files - not available over http).

The CDN check can be performed by simply running 'bitbake -DD -n'
which is very verbose, but neverthless reports the amount
of missing sstate objects and what they are in a way that can
be programmatically extracted and checked (as suggested by RP).

This also adds local sstate tests, as they can be useful to
determine whether the missing cdn objects were never created or
erroneously cleaned up, or if they were created but didn't propagate
to cdn.

[YOCTO #15303]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 99 ++++++++++++++-------
 1 file changed, 67 insertions(+), 32 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 795cd5bd85f..f52ca77c09c 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -884,47 +884,82 @@ expected_sametmp_output, expected_difftmp_output)
 
 @OETestTag("yocto-mirrors")
 class SStateMirrors(SStateBase):
-    def check_bb_output(self, output, exceptions):
-        in_tasks = False
-        missing_objects = []
-        checked_urls = []
-        for l in output.splitlines():
-            if "Testing URL" in l:
-                checked_urls.append(l.split()[3])
-            if "The differences between the current build and any cached tasks start at the following tasks" in l:
-                in_tasks = True
-                continue
-            if "Writing task signature files" in l:
-                in_tasks = False
-                continue
-            if in_tasks:
-                recipe_task = l.split("/")[-1]
-                recipe, task = recipe_task.split(":")
-                for e in exceptions:
-                    if e[0] in recipe and task == e[1]:
+    def check_bb_output(self, output, exceptions, check_cdn):
+        def is_exception(object, exceptions):
+            for e in exceptions:
+                if re.search(e, object):
+                    return True
+            return False
+
+        output_l = output.splitlines()
+        for l in output_l:
+            if l.startswith("Sstate summary"):
+                for idx, item in enumerate(l.split()):
+                    if item == 'Missed':
+                        missing_objects = int(l.split()[idx+1])
                         break
                 else:
-                    missing_objects.append(recipe_task)
-        self.assertTrue(len(missing_objects) == 0, "URLs checked:\n{}\nMissing objects in the cache:\n{}".format("\n".join(checked_urls), "\n".join(missing_objects)))
-
-    def run_test_cdn_mirror(self, machine, targets, exceptions):
-        exceptions = exceptions + [[t, "do_deploy_source_date_epoch"] for t in targets.split()]
-        exceptions = exceptions + [[t, "do_image_qa"] for t in targets.split()]
-        self.config_sstate(True)
-        self.append_config("""
+                    self.fail("Did not find missing objects amount in sstate summary: {}".format(l))
+                break
+        else:
+            self.fail("Did not find 'Sstate summary' line in bitbake output")
+
+        failed_urls = []
+        for l in output_l:
+            if "SState: Unsuccessful fetch test for" in l and check_cdn:
+                missing_object = l.split()[6]
+            elif "SState: Looked for but didn't find file" in l and not check_cdn:
+                missing_object = l.split()[8]
+            else:
+                missing_object = None
+            if missing_object:
+                if not is_exception(missing_object, exceptions):
+                    failed_urls.append(missing_object)
+                else:
+                    missing_objects -= 1
+
+        self.assertEqual(len(failed_urls), missing_objects, "Amount of reported missing objects does not match failed URLs: {}\nFailed URLs:\n{}".format(missing_objects, "\n".join(failed_urls)))
+        self.assertEqual(len(failed_urls), 0, "Missing objects in the cache:\n{}".format("\n".join(failed_urls)))
+
+    def run_test(self, machine, targets, exceptions, check_cdn = True):
+        # sstate is checked for existence of these, but they never get written out to begin with
+        exceptions += ["{}.*image_qa".format(t) for t in targets.split()]
+        exceptions += ["{}.*deploy_source_date_epoch".format(t) for t in targets.split()]
+        exceptions += ["{}.*image_complete".format(t) for t in targets.split()]
+        exceptions += ["linux-yocto.*shared_workdir"]
+        # these get influnced by IMAGE_FSTYPES tweaks in yocto-autobuilder-helper's config.json (on x86-64)
+        # additionally, they depend on noexec (thus, absent stamps) package, install, etc. image tasks,
+        # which makes tracing other changes difficult
+        exceptions += ["{}.*create_spdx".format(t) for t in targets.split()]
+        exceptions += ["{}.*create_runtime_spdx".format(t) for t in targets.split()]
+
+        if check_cdn:
+            self.config_sstate(True)
+            self.append_config("""
 MACHINE = "{}"
 BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"
 SSTATE_MIRRORS ?= "file://.* http://cdn.jsdelivr.net/yocto/sstate/all/PATH;downloadfilename=PATH"
 """.format(machine))
-        result = bitbake("-D -S printdiff {}".format(targets))
-        self.check_bb_output(result.output, exceptions)
+        else:
+            self.append_config("""
+MACHINE = "{}"
+""".format(machine))
+        result = bitbake("-DD -n {}".format(targets))
+        bitbake("-S none {}".format(targets))
+        self.check_bb_output(result.output, exceptions, check_cdn)
 
     def test_cdn_mirror_qemux86_64(self):
-        # Example:
-        # exceptions = [ ["packagegroup-core-sdk","do_package"] ]
         exceptions = []
-        self.run_test_cdn_mirror("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
+        self.run_test("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
 
     def test_cdn_mirror_qemuarm64(self):
         exceptions = []
-        self.run_test_cdn_mirror("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
+        self.run_test("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions)
+
+    def test_local_cache_qemux86_64(self):
+        exceptions = []
+        self.run_test("qemux86-64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions, check_cdn = False)
+
+    def test_local_cache_qemuarm64(self):
+        exceptions = []
+        self.run_test("qemuarm64", "core-image-minimal core-image-full-cmdline core-image-sato-sdk", exceptions, check_cdn = False)
-- 
2.39.2


