Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCE9E77188
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 18:28:09 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.33227.1735410484917819115
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Dec 2024 10:28:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=exo8H4Y2;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: colinmca242@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-844d5444b3dso289429639f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Dec 2024 10:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735410483; x=1736015283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nhm80MyvcxT7MX65Q1tZBH+exlYCA/BujfMb2CJnd14=;
        b=exo8H4Y2d8C4q/GbnmwDY1nKQKJERF7gkncnvdkSasdHzOTzgnK7YlxRj7ZA+ajZPA
         7T0WUkhvw0jn4vA77Ln5dXFQe4JmmN7kAieIDQ4lUEh8IPjtKRrVqEabf6k0wjudLPxM
         ks0hnEVIQtRRnfQ11JzV9oUzT7feLs95H8Fjhk+/dh7YYax/5QJ2Hf+Ce5k6d8r16f5U
         E+1v55skfmctshtVROgyNrh30Ier9olGTtSsynIpv4nLSimxsyoCfG8e5p5CPpeQ8OOb
         +otClxFvf2zXfJxC5iBv53cEVHVjyz152BtshuK89BiAhZUbBL++XqcmIh3IFTSwjdJW
         dY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735410483; x=1736015283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nhm80MyvcxT7MX65Q1tZBH+exlYCA/BujfMb2CJnd14=;
        b=OiSkjx1ud69yMok01tvLInAUvRienbEE+weguKkfnx5PpgTBgI3hNqJOPNCPZ46NxW
         S2coGyzVnBll5Bc0ohnQU0mlxNgEWZ+t4QqfYBWb18tMa3N9wKHZwYGA/lK6+Ypb2uOP
         ND7Ke4UMzp5FXHNU3LPCtizQDJ6io2uPb4OH6qpp6ioUEhuG2rgzlSgiuoRM3lxW0Rkz
         GzoZjzgtj5o5rDc7HJpyC258WacI3BQGdlH53neX/7uSwHWwaqNPciE3VbWE4RvahQvM
         oe51DVhX2CmPRTY9k3/9SlrE4NvlUdtPETtiW13ybt0m2DfZQ/jSNi5Cfir4llbp9YOc
         I17w==
X-Gm-Message-State: AOJu0YxKVpIJjoeP0ZIEE4PbddVSh4XFtp1orHj1gscyQv2EN+5Dei3J
	LSNjheM2Gmvt+Lipf0DNNwaHH52YgY2gVRRGeDHM7v5OqdONVDmSW3mKUg==
X-Gm-Gg: ASbGncsk4xOY75wxPpiT8rHr/Txhu2424+uP3Eh/Q1S77nmRGoOMgr2reLTyHgnc1S3
	0Bnk8lzqUd0TKEcvi2oRHvou6TcDhuORtEYMSnVMz7ZQ47Kwlpj8r7OMb7PUQF+0Z3sZ4L/J4dX
	S6tzTq70GQUNKv9ZCou4drjb8f7FTvXnDVg53cqudqt32huNP8RVH84LVS5IdzxZ+CrwxRcHxAz
	T0zVw5kNylfLog+s7iX0tfOS3DDZbq0jtGO4pXkm11Y7DdUJ1lCCpJG0QhZXlQ3r/AotBU=
X-Google-Smtp-Source: AGHT+IEORcMxhVoPaAAEybNrJquaiua7NCCCfacXZHqBgfjYQzVLuIVa4Il43YqU2A2TC72/sLL77Q==
X-Received: by 2002:a05:6602:6c0a:b0:82a:a4e7:5539 with SMTP id ca18e2360f4ac-8499e7dc0e8mr2456287739f.2.1735410483158;
        Sat, 28 Dec 2024 10:28:03 -0800 (PST)
Received: from monolith.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8498d8279afsm452766439f.30.2024.12.28.10.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 10:28:01 -0800 (PST)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
Subject: [PATCH] cve-check: Rework patch parsing
Date: Sat, 28 Dec 2024 18:27:57 +0000
Message-Id: <20241228182757.2346256-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Dec 2024 18:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209122

The cve_check functionality to parse CVE IDs from the patch filename and
patch contents have been reworked to improve parsing and also add tests.
This ensures that the parsing works as intended.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
---
I noticed that there are some patches, especially in older verisons of
Yocto, where the "CVE: " tag was used with multiple CVE IDs in different
formats, like "CVE-YYYY-XXXX & CVE-YYYY-XXXX" or
"CVE-YYYY-XXXX, CVE-YYYY-XXXX". Currently, only space-delimited CVE
IDs will be parsed, but documentation doesn't indicate that is the only
supported format. I figured it'd be nice to update the code to be able
to support multiple formats, that way this patch could be backported to
fix those patches. I also wanted to add unit tests to ensure the patch
parsing behavior is preserved.

I'd also like to update the patch filename parsing to parse multiple CVE
IDs from the filename, but based on the comments, it seems like there
was a reason why only the last CVE ID is extracted from the filename.
I'd be happy to submit a V2 patch or an additional patch to update the
function if that sounds good for the maintainers.

 meta/lib/oe/cve_check.py                  | 141 +++++++++-------
 meta/lib/oeqa/selftest/cases/cve_check.py | 196 ++++++++++++++++++++++
 2 files changed, 278 insertions(+), 59 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 647a94f5af..af88a65655 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -8,6 +8,7 @@ import collections
 import re
 import itertools
 import functools
+import oe.patch
 
 _Version = collections.namedtuple(
     "_Version", ["release", "patch_l", "pre_l", "pre_v"]
@@ -71,77 +72,99 @@ def _cmpkey(release, patch_l, pre_l, pre_v):
     return _release, _patch, _pre
 
 
-def get_patched_cves(d):
+def parse_cve_from_filename(patch_filename):
     """
-    Get patches that solve CVEs using the "CVE: " tag.
+    Parses CVE ID from the filename
+
+    Matches the last "CVE-YYYY-ID" in the file name, also if written
+    in lowercase. Possible to have multiple CVE IDs in a single
+    file name, but only the last one will be detected from the file name.
     """
+    cve_file_name_match = re.compile(r".*(CVE-\d{4}-\d+)", re.IGNORECASE)
 
-    import re
-    import oe.patch
+    # Check patch file name for CVE ID
+    fname_match = cve_file_name_match.search(patch_filename)
+    return fname_match.group(1).upper() if fname_match else ""
 
-    cve_match = re.compile(r"CVE:( CVE-\d{4}-\d+)+")
 
-    # Matches the last "CVE-YYYY-ID" in the file name, also if written
-    # in lowercase. Possible to have multiple CVE IDs in a single
-    # file name, but only the last one will be detected from the file name.
-    # However, patch files contents addressing multiple CVE IDs are supported
-    # (cve_match regular expression)
-    cve_file_name_match = re.compile(r".*(CVE-\d{4}-\d+)", re.IGNORECASE)
+def parse_cves_from_patch_contents(patch_contents):
+    """
+    Parses CVE IDs from patch contents
+
+    Matches all CVE IDs contained on a line that starts with "CVE: ". Any
+    delimiter (',', '&', "and", etc.) can be used without any issues. Multiple
+    "CVE:" lines can also exist.
+    """
+    patched_cves = set()
+    cve_match = re.compile(r"CVE-\d{4}-\d+")
+    # Search for one or more "CVE: " lines
+    for line in patch_contents.split("\n"):
+        if not line.startswith("CVE:"):
+            continue
+        patched_cves.update(cve_match.findall(line))
+    return patched_cves
+
+
+def parse_cves_from_patch_file(patch_file):
+    """
+    Parses CVE IDs associated with a particular patch file
+    """
+    patched_cves = set()
+    filename_cve = parse_cve_from_filename(patch_file)
+    if filename_cve:
+        bb.debug(2, "Found %s from patch file name %s" % (filename_cve, patch_file))
+        patched_cves.add(parse_cve_from_filename(patch_file))
+
+    # Remote patches won't be present and compressed patches won't be
+    # unpacked, so say we're not scanning them
+    if not os.path.isfile(patch_file):
+        bb.note("%s is remote or compressed, not scanning content" % patch_file)
+        return patched_cves
+
+    with open(patch_file, "r", encoding="utf-8") as f:
+        try:
+            patch_text = f.read()
+        except UnicodeDecodeError:
+            bb.debug(
+                1,
+                "Failed to read patch %s using UTF-8 encoding"
+                " trying with iso8859-1" % patch_file,
+            )
+            f.close()
+            with open(patch_file, "r", encoding="iso8859-1") as f:
+                patch_text = f.read()
 
-    patched_cves = {}
+    patched_cves.update(parse_cves_from_patch_contents(patch_text))
+
+    if not patched_cves:
+        bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
+    else:
+        bb.debug(
+            2, "Patch %s solves %s" % (patch_file, ", ".join(sorted(patched_cves)))
+        )
+
+    return patched_cves
+
+
+def get_patched_cves(d):
+    """
+    Get patches that solve CVEs
+    """
+    patched_cves = set()
     patches = oe.patch.src_patches(d)
     bb.debug(2, "Scanning %d patches for CVEs" % len(patches))
+
+    # Check each patch file
     for url in patches:
         patch_file = bb.fetch.decodeurl(url)[2]
-
-        # Check patch file name for CVE ID
-        fname_match = cve_file_name_match.search(patch_file)
-        if fname_match:
-            cve = fname_match.group(1).upper()
-            patched_cves[cve] = {"abbrev-status": "Patched", "status": "fix-file-included", "resource": patch_file}
-            bb.debug(2, "Found %s from patch file name %s" % (cve, patch_file))
-
-        # Remote patches won't be present and compressed patches won't be
-        # unpacked, so say we're not scanning them
-        if not os.path.isfile(patch_file):
-            bb.note("%s is remote or compressed, not scanning content" % patch_file)
-            continue
-
-        with open(patch_file, "r", encoding="utf-8") as f:
-            try:
-                patch_text = f.read()
-            except UnicodeDecodeError:
-                bb.debug(1, "Failed to read patch %s using UTF-8 encoding"
-                        " trying with iso8859-1" %  patch_file)
-                f.close()
-                with open(patch_file, "r", encoding="iso8859-1") as f:
-                    patch_text = f.read()
-
-        # Search for one or more "CVE: " lines
-        text_match = False
-        for match in cve_match.finditer(patch_text):
-            # Get only the CVEs without the "CVE: " tag
-            cves = patch_text[match.start()+5:match.end()]
-            for cve in cves.split():
-                bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
-                patched_cves[cve] = {"abbrev-status": "Patched", "status": "fix-file-included", "resource": patch_file}
-                text_match = True
-
-        if not fname_match and not text_match:
-            bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
+        patched_cves.update(parse_cves_from_patch_file(patch_file))
 
     # Search for additional patched CVEs
-    for cve in (d.getVarFlags("CVE_STATUS") or {}):
-        decoded_status = decode_cve_status(d, cve)
-        products = d.getVar("CVE_PRODUCT")
-        if has_cve_product_match(decoded_status, products) == True:
-            patched_cves[cve] = {
-                "abbrev-status": decoded_status["mapping"],
-                "status": decoded_status["detail"],
-                "justification": decoded_status["description"],
-                "affected-vendor": decoded_status["vendor"],
-                "affected-product": decoded_status["product"]
-            }
+    for cve in d.getVarFlags("CVE_STATUS") or {}:
+        decoded_status, _, _ = decode_cve_status(d, cve)
+        if decoded_status == "Patched":
+            bb.debug(2, "CVE %s is additionally patched" % cve)
+            patched_cves.add(cve)
 
     return patched_cves
 
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index 3dd3e89d3e..7a73681b84 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -121,6 +121,202 @@ class CVECheck(OESelftestTestCase):
         self.assertEqual(has_cve_product_match(status, "glibca:glibc test"), True)
 
 
+    def test_parse_cve_from_patch_filename(self):
+        from oe.cve_check import parse_cve_from_filename
+
+        # Patch filename without CVE ID
+        self.assertEqual(parse_cve_from_filename("0001-test.patch"), "")
+
+        # Patch with single CVE ID
+        self.assertEqual(parse_cve_from_filename("CVE-2022-12345.patch"), "CVE-2022-12345")
+
+        # Patch with multiple CVE IDs
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2022-41741-CVE-2022-41742.patch"), "CVE-2022-41742"
+        )
+
+        # Patches with CVE ID and appended text
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2023-3019-0001.patch"), "CVE-2023-3019"
+        )
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2024-21886-1.patch"), "CVE-2024-21886"
+        )
+
+        # Patch with CVE ID and prepended text
+        self.assertEqual(
+            parse_cve_from_filename("grep-CVE-2012-5667.patch"), "CVE-2012-5667"
+        )
+        self.assertEqual(
+            parse_cve_from_filename("0001-CVE-2012-5667.patch"), "CVE-2012-5667"
+        )
+
+        # Patch with CVE ID and both prepended and appended text
+        self.assertEqual(
+            parse_cve_from_filename(
+                "0001-tpm2_import-fix-fixed-AES-key-CVE-2021-3565-0001.patch"
+            ),
+            "CVE-2021-3565",
+        )
+        
+        # Only grab the last CVE ID in the filename
+        self.assertEqual(
+            parse_cve_from_filename(
+                "CVE-2012-5667-CVE-2012-5668.patch"
+            ),
+            "CVE-2012-5668",
+        )
+
+
+    def test_parse_cve_from_patch_contents(self):
+        import textwrap
+        from oe.cve_check import parse_cves_from_patch_contents
+
+        # Standard patch file excerpt without any patches
+        self.assertEqual(
+            parse_cves_from_patch_contents(
+                textwrap.dedent("""\
+            remove "*" for root since we don't have a /etc/shadow so far.
+
+            Upstream-Status: Inappropriate [configuration]
+
+            Signed-off-by: Scott Garman <scott.a.garman@intel.com>
+
+            --- base-passwd/passwd.master~nobash
+            +++ base-passwd/passwd.master
+            @@ -1,4 +1,4 @@
+            -root:*:0:0:root:/root:/bin/sh
+            +root::0:0:root:/root:/bin/sh
+            daemon:*:1:1:daemon:/usr/sbin:/bin/sh
+            bin:*:2:2:bin:/bin:/bin/sh
+            sys:*:3:3:sys:/dev:/bin/sh
+            """)
+            ),
+            set(),
+        )
+
+        # Patch file with multiple CVE IDs (space-separated)
+        self.assertEqual(
+            parse_cves_from_patch_contents(
+                textwrap.dedent("""\
+                There is an assertion in function _cairo_arc_in_direction().
+
+                CVE: CVE-2019-6461 CVE-2019-6462
+                Upstream-Status: Pending
+                Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+                index 390397bae..1bde774a4 100644
+                --- a/src/cairo-arc.c
+                +++ b/src/cairo-arc.c
+                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t          *cr,
+                    if (cairo_status (cr))
+                        return;
+
+                -    assert (angle_max >= angle_min);
+                +    if (angle_max < angle_min)
+                +       return;
+
+                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+                    angle_max = fmod (angle_max - angle_min, 2 * M_PI);
+            """),
+            ),
+            {"CVE-2019-6461", "CVE-2019-6462"},
+        )
+
+        # Patch file with multiple CVE IDs (comma-separated w/ both space and no space)
+        self.assertEqual(
+            parse_cves_from_patch_contents(
+                textwrap.dedent("""\
+                There is an assertion in function _cairo_arc_in_direction().
+
+                CVE: CVE-2019-6461,CVE-2019-6462, CVE-2019-6463
+                Upstream-Status: Pending
+                Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+                index 390397bae..1bde774a4 100644
+                --- a/src/cairo-arc.c
+                +++ b/src/cairo-arc.c
+                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t          *cr,
+                    if (cairo_status (cr))
+                        return;
+
+                -    assert (angle_max >= angle_min);
+                +    if (angle_max < angle_min)
+                +       return;
+
+                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+                    angle_max = fmod (angle_max - angle_min, 2 * M_PI);
+
+            """),
+            ),
+            {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463"},
+        )
+
+        # Patch file with multiple CVE IDs (&-separated)
+        self.assertEqual(
+            parse_cves_from_patch_contents(
+                textwrap.dedent("""\
+                There is an assertion in function _cairo_arc_in_direction().
+
+                CVE: CVE-2019-6461 & CVE-2019-6462
+                Upstream-Status: Pending
+                Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+                index 390397bae..1bde774a4 100644
+                --- a/src/cairo-arc.c
+                +++ b/src/cairo-arc.c
+                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t          *cr,
+                    if (cairo_status (cr))
+                        return;
+
+                -    assert (angle_max >= angle_min);
+                +    if (angle_max < angle_min)
+                +       return;
+
+                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+                    angle_max = fmod (angle_max - angle_min, 2 * M_PI);
+            """),
+            ),
+            {"CVE-2019-6461", "CVE-2019-6462"},
+        )
+
+        # Patch file with multiple lines with CVE IDs
+        self.assertEqual(
+            parse_cves_from_patch_contents(
+                textwrap.dedent("""\
+                There is an assertion in function _cairo_arc_in_direction().
+
+                CVE: CVE-2019-6461 & CVE-2019-6462
+
+                CVE: CVE-2019-6463 & CVE-2019-6464
+                Upstream-Status: Pending
+                Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
+                index 390397bae..1bde774a4 100644
+                --- a/src/cairo-arc.c
+                +++ b/src/cairo-arc.c
+                @@ -186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t          *cr,
+                    if (cairo_status (cr))
+                        return;
+
+                -    assert (angle_max >= angle_min);
+                +    if (angle_max < angle_min)
+                +       return;
+
+                    if (angle_max - angle_min > 2 * M_PI * MAX_FULL_CIRCLES) {
+                    angle_max = fmod (angle_max - angle_min, 2 * M_PI);
+
+            """),
+            ),
+            {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463", "CVE-2019-6464"},
+        )
+
+
+
     def test_recipe_report_json(self):
         config = """
 INHERIT += "cve-check"
-- 
2.34.1


