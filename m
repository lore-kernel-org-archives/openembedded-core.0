Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE077E77166
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 22:39:08 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.813.1733265540027969207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 14:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A5vk7ML1;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-29645a83b1bso3465511fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 14:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733265539; x=1733870339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KD+2W3Aj+3zVC2XCPb/xlRU+sivR+uUgFccjROC340w=;
        b=A5vk7ML1pwkf844MGfffdy5wcy+xDKtLTeyWW5RnhGvBhAIiAEulQI4J3GRwYWiGjP
         7eETIlOR/oA4WbkPQhbuihnHGfHAX4yiHrLjFFrZtllj+HCKQRluNbilcTnJVm+Pguv9
         HSzDiRtx4JfzclhG6lfn8tpMwOT+35dBMzYYO1pI8jp6Vr0j27q1OLtFbEb0cCtgq42s
         o31Scv6bRLKPg5ZiklpxBd/fMM4ehi3TbtF1y2yQrf6uqo5/sp69AMB7wZaorGd4MByr
         Z08ZbmqNWo4VceLRgEGCjQL4HWsN3EVIQjINWFnZjs1R+RQXExOImAi7/BYmyFiBEg9F
         nG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733265539; x=1733870339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KD+2W3Aj+3zVC2XCPb/xlRU+sivR+uUgFccjROC340w=;
        b=Mn4iTCntqyv77oYYLdpXsoCZFkfdKlovEuxXugirTSMeTMFQLVRuQLSO9f/yPUR14P
         3bG2GootAPcvEM7F3SJZwoJ/oiZ0BxKIbzVU7Bum6eGqQ/t4vKXJPWVQLDgchJ7PlpDT
         Fzw670UhE1zKLOFwtNZ+Uvp8VHcZbaB4PsS1aILV99wIeLt8Hlve1AU4nNHdov8yM2fr
         SAxEWnJcBKK52R7/59w/WQW+x1/QQpUp8l6c+sJkuKLq2HH+An/4sAlUz2VD4vnplqxo
         gwOCjHVIsSIZnoYXt9gZxCr8tcqiYV488FgIrBjIoUEF1Djg2BXXyZKQIQ6s4KT9581p
         JpRA==
X-Gm-Message-State: AOJu0YxhnQX9XDScWVosr6o60QnaGr44gFU/vyeqWHoB2el9XdFXEdOf
	uCttqCYrGK2TdK5H3bA0lksysNT/UMQDRZ1k1Z6aELfHKPAnZwNHsaXFhQ==
X-Gm-Gg: ASbGncvd5vCJgpfK7Q0HThgXMM/+gZBuXeIW0lyoZBuKKzZAxBNMmhApoDHYuqggatk
	DjmrT6/u9GOYOZY8DEJEYFD7miSSGnuapxMfpuqMgZcYRGgysHTtLM2/Nc32s06Ge2ly3cOLsDV
	zfykUb2k6MeXOjsQOkZeL3Mop27OhDlXDOd1by3DAYiKeiolWBh+5YTWibhNywKu5UcGCHyKybB
	hZnApWI58ZdDz/HwjKO7MzS5wFacvmxqVXiJKw/zQ/eN20V
X-Google-Smtp-Source: AGHT+IHUFqKVD/i9RDiciOTVk7T5eqdPgC8OlO3iib6rkFkPZWPdStvey0B76jlygarQUAdMmpT4Zw==
X-Received: by 2002:a05:6870:7022:b0:295:ef93:3df7 with SMTP id 586e51a60fabf-29e9b17c2d0mr1639858fac.18.1733265538677;
        Tue, 03 Dec 2024 14:38:58 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29de928c9b7sm4037836fac.22.2024.12.03.14.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 14:38:57 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 5/5] lib: oeqa: spdx: Add tests for extra options
Date: Tue,  3 Dec 2024 15:37:10 -0700
Message-ID: <20241203223844.2689172-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203223844.2689172-1-JPEWhacker@gmail.com>
References: <20241203223844.2689172-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208226

Adds a test for several of the extra options provided by the SPDX
classes. In particular, these are the options that can produce
non-reproducible results, so are not enabled by default in OE core. This
test takes care to configure the build so that the tests do run in a
reproducible manner so that pre-built test objects can be pulled from
sstate

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py                |  13 +--
 meta/lib/oeqa/selftest/cases/spdx.py | 118 +++++++++++++++++++++++----
 2 files changed, 108 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 7d01715ce24..9a3b188dbbb 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -875,16 +875,11 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             else:
                 missing_spdxids.add(spdxid)
 
-        bb.debug(1, "Linking...")
-        missing = self.link()
-        if missing != missing_spdxids:
-            bb.fatal(
-                f"Linked document doesn't match missing SPDX ID list. Got: {missing}\nExpected: {missing_spdxids}"
-            )
-
         self.doc.import_ = sorted(imports.values(), key=lambda e: e.externalSpdxId)
-
-        return missing_spdxids
+        bb.debug(1, "Linking...")
+        self.link()
+        self.missing_ids -= set(imports.keys())
+        return self.missing_ids
 
 
 def load_jsonld(d, path, required=False):
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 83840702199..9b35793d139 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -7,9 +7,11 @@
 import json
 import os
 import textwrap
+import hashlib
 from pathlib import Path
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars, runCmd
+import oe.spdx30
 
 
 class SPDX22Check(OESelftestTestCase):
@@ -73,8 +75,6 @@ class SPDX3CheckBase(object):
     """
 
     def check_spdx_file(self, filename):
-        import oe.spdx30
-
         self.assertExists(filename)
 
         # Read the file
@@ -86,13 +86,16 @@ class SPDX3CheckBase(object):
         return objset
 
     def check_recipe_spdx(self, target_name, spdx_path, *, task=None, extraconf=""):
-        config = textwrap.dedent(
-            f"""\
-            INHERIT:remove = "create-spdx"
-            INHERIT += "{self.SPDX_CLASS}"
-            {extraconf}
-            """
+        config = (
+            textwrap.dedent(
+                f"""\
+                INHERIT:remove = "create-spdx"
+                INHERIT += "{self.SPDX_CLASS}"
+                """
+            )
+            + textwrap.dedent(extraconf)
         )
+
         self.write_config(config)
 
         if task:
@@ -120,11 +123,17 @@ class SPDX3CheckBase(object):
         return self.check_spdx_file(filename)
 
     def check_objset_missing_ids(self, objset):
-        if objset.missing_ids:
+        for o in objset.foreach_type(oe.spdx30.SpdxDocument):
+            doc = o
+            break
+        else:
+            self.assertTrue(False, "Unable to find SpdxDocument")
+
+        missing_ids = objset.missing_ids - set(i.externalSpdxId for i in doc.import_)
+        if missing_ids:
             self.assertTrue(
                 False,
-                "The following SPDXIDs are unresolved:\n  "
-                + "\n  ".join(objset.missing_ids),
+                "The following SPDXIDs are unresolved:\n  " + "\n  ".join(missing_ids),
             )
 
 
@@ -188,12 +197,93 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
         objset = self.check_recipe_spdx(
             "baremetal-helloworld",
             "{DEPLOY_DIR_IMAGE}/baremetal-helloworld-image-{MACHINE}.spdx.json",
-            extraconf=textwrap.dedent(
-                """\
+            extraconf="""\
                 TCLIBC = "baremetal"
+                """,
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
+
+    def test_extra_opts(self):
+        HOST_SPDXID = "http://foo.bar/spdx/bar2"
+
+        EXTRACONF = textwrap.dedent(
+            f"""\
+            SPDX_INVOKED_BY_name = "CI Tool"
+            SPDX_INVOKED_BY_type = "software"
+
+            SPDX_ON_BEHALF_OF_name = "John Doe"
+            SPDX_ON_BEHALF_OF_type = "person"
+            SPDX_ON_BEHALF_OF_id_email = "John.Doe@noreply.com"
+
+            SPDX_PACKAGE_SUPPLIER_name = "ACME Embedded Widgets"
+            SPDX_PACKAGE_SUPPLIER_type = "organization"
+
+            SPDX_AUTHORS += "authorA"
+            SPDX_AUTHORS_authorA_ref = "SPDX_ON_BEHALF_OF"
+
+            SPDX_BUILD_HOST = "host"
+
+            SPDX_IMPORTS += "host"
+            SPDX_IMPORTS_host_spdxid = "{HOST_SPDXID}"
+
+            SPDX_INCLUDE_BUILD_VARIABLES = "1"
+            SPDX_INCLUDE_BITBAKE_PARENT_BUILD = "1"
+            SPDX_INCLUDE_TIMESTAMPS = "1"
+
+            SPDX_PRETTY = "1"
+            """
+        )
+        extraconf_hash = hashlib.sha1(EXTRACONF.encode("utf-8")).hexdigest()
+
+        objset = self.check_recipe_spdx(
+            "core-image-minimal",
+            "{DEPLOY_DIR_IMAGE}/core-image-minimal-{MACHINE}.rootfs.spdx.json",
+            # Many SPDX variables do not trigger a rebuild, since they are
+            # intended to record information at the time of the build. As such,
+            # the extra configuration alone may not trigger a rebuild, and even
+            # if it does, the task hash won't necessarily be unique. In order
+            # to make sure rebuilds happen, but still allow these test objects
+            # to be pulled from sstate (e.g. remain reproducible), change the
+            # namespace prefix to include the hash of the extra configuration
+            extraconf=textwrap.dedent(
+                f"""\
+                SPDX_NAMESPACE_PREFIX = "http://spdx.org/spdxdocs/{extraconf_hash}"
                 """
-            ),
+            )
+            + EXTRACONF,
         )
 
         # Document should be fully linked
         self.check_objset_missing_ids(objset)
+
+        for o in objset.foreach_type(oe.spdx30.SoftwareAgent):
+            if o.name == "CI Tool":
+                break
+        else:
+            self.assertTrue(False, "Unable to find software tool")
+
+        for o in objset.foreach_type(oe.spdx30.Person):
+            if o.name == "John Doe":
+                break
+        else:
+            self.assertTrue(False, "Unable to find person")
+
+        for o in objset.foreach_type(oe.spdx30.Organization):
+            if o.name == "ACME Embedded Widgets":
+                break
+        else:
+            self.assertTrue(False, "Unable to find organization")
+
+        for o in objset.foreach_type(oe.spdx30.SpdxDocument):
+            doc = o
+            break
+        else:
+            self.assertTrue(False, "Unable to find SpdxDocument")
+
+        for i in doc.import_:
+            if i.externalSpdxId == HOST_SPDXID:
+                break
+        else:
+            self.assertTrue(False, "Unable to find imported Host SpdxID")
-- 
2.47.1


