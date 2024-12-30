Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F54E7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 19:22:43 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.68414.1735586562224922507
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 11:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MtFAkVV6;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: colinmca242@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a8146a8ddaso34711565ab.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 11:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735586561; x=1736191361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anx98xG3lOpoUamurIAxUi3miUl56lVxRM+FMsKxewg=;
        b=MtFAkVV6q78xTUsprShQpLkd2JBS9xueXuVxwBZvQd9zGFb3UVCmkeEAMPW7ZfxkZj
         oN3/AnR/xLbNDyCZLbNvAD/h5XOk1NAGynRKoYS42Zp5EBR9ovl6AE0Wiy43OIxv0aV1
         qgNSLeDcZBRgZb9Deey6Qy66nB7HatdH6CD6ZCXKoXQ65NwDde/XHQM/Nd5fqfHHqT4d
         7MJtKGO0TkFQKwxBP20VHchabwIgNlOGCtUx6eNSk4SYXmeeZNz2+Qb8kN60HfESP/Sg
         TRY6mceUrmVAt1qwvJh/IsDmzn32TkMOIKyeSgrY3Jvt3IEgym8JF0Ru+gN27Hgkqd28
         QZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735586561; x=1736191361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anx98xG3lOpoUamurIAxUi3miUl56lVxRM+FMsKxewg=;
        b=PBuZ94C3hRWP3h7TpH51qVd0p/5X1En6Lp66DDTSPjvQ8nXR7VQK9iKX2uzlW2X2t5
         6xp//xlJKBELH7fQBcklhrDkENueFr7YGYU670pjP3B9ydOKBz0bWtHyXP9zzli6ZWvh
         rClI8tkXX1jUDrktij3Jt9zcH6RcUhuKlgbSUrPAw4p+XlbT0+78Vx2r4NGv6KykZVCS
         YaXIoyhJUHDnFOEVjeHl+vtWvbQIch6n2zT9xUXXVDOSJwPesiq3i40Wh2V98lrdcZrp
         TedFAwGL9k+I049nvgtYuxWmL8it/rKeJ1JvJXfWoI6ViJcHG3/cJLu+pRROVgBmZIpV
         vuGw==
X-Gm-Message-State: AOJu0YwLW2JYtzBc7jc8WqEBXGB+/Q6YnLBb0czepSKK/NFuHO7JCKkP
	ZhC35MHw/rjATeZoPyBLYomtW49ILVk80uX2my+6GbzyVl05gIdwjvvfiA==
X-Gm-Gg: ASbGncutU8h8jCxfPtjHFJtFsBaxgbSomn3Av3ajOvo15kKymYdaQDddxXtlPmudzii
	Vk6MbNY+OH9kzAqs1O9fxwSBSipGsXYqYpvxI0ku2tP6OCFGw0sm1DXewpcoPv7ENwTTtcjhrgO
	N9d0pD838OpeVMhEIeZpidLG0lKv5xp/vgSU8Dcv4HRCzcAvNkozPAc8cjn4ZeCEExy4XC8H87s
	w2EblbhJMJpm2Jc8yWqyy/oaneoU+i2HXIJ7b7+OdnTADrzsm5qBy9VCTIfaJKyIDbaYYo=
X-Google-Smtp-Source: AGHT+IFzxoMlstTRbHqw7Uw4T+mOOEXbxnkAQD4pu5Lx06q7l1er86rKqkDrTyyazOAq/l2ebETZRA==
X-Received: by 2002:a05:6e02:1747:b0:3a7:6636:eb3b with SMTP id e9e14a558f8ab-3c2d514f981mr230738895ab.17.1735586560835;
        Mon, 30 Dec 2024 11:22:40 -0800 (PST)
Received: from monolith.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0de0532b4sm59686225ab.13.2024.12.30.11.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:22:39 -0800 (PST)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
Subject: [PATCH v2 1/1] cve-check: Rework patch parsing
Date: Mon, 30 Dec 2024 19:22:24 +0000
Message-Id: <20241230192224.113886-2-colinmca242@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230192224.113886-1-colinmca242@gmail.com>
References: <20241230192224.113886-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 19:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209182

The cve_check functionality to parse CVE IDs from the patch filename and
patch contents have been reworked to improve parsing and also utilize
tests. This ensures that the parsing works as intended.

Additionally, the new patched_cves dict has a few issues I tried to fix
as well. If multiple patch files exist for a single CVE ID, only the
last one will show up with the "resource" key. The value for the
"resource" key has been updated to hold a list and return all patch
files associated with a given CVE ID. Also, at the end of
get_patch_cves, CVE_STATUS can overwrite an existing entry in the dict.
This could cause an issue, for example, if a CVE has been addressed via
a patch, but a CVE_STATUS line also exists that ignores the given CVE
ID. A warning has been added if this ever happens.

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

V2 Changes:
I mistakenly created this patch without fb3f440 applied. I updated
get_patched_cves to return a dict instead of a set.

I also improved the docstrings for these new functions to be more
descriptive and also specify the return types.

I also found a few issues with the dictionary object created by
get_patched_cves that have now been addressed in this commit.

 meta/lib/oe/cve_check.py                  | 166 ++++++++++++------
 meta/lib/oeqa/selftest/cases/cve_check.py | 205 ++++++++++++++++++++++
 2 files changed, 317 insertions(+), 54 deletions(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 280f9f613d..85a899a880 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -5,9 +5,11 @@
 #
 
 import collections
-import re
-import itertools
 import functools
+import itertools
+import os.path
+import re
+import oe.patch
 
 _Version = collections.namedtuple(
     "_Version", ["release", "patch_l", "pre_l", "pre_v"]
@@ -71,76 +73,132 @@ def _cmpkey(release, patch_l, pre_l, pre_v):
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
+
+    Returns the last CVE ID foudn in the filename. If no CVE ID is found
+    an empty string is returned.
     """
+    cve_file_name_match = re.compile(r".*(CVE-\d{4}-\d{4,})", re.IGNORECASE)
 
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
 
+    Matches all CVE IDs contained on a line that starts with "CVE: ". Any
+    delimiter (',', '&', "and", etc.) can be used without any issues. Multiple
+    "CVE:" lines can also exist.
+
+    Returns a set of all CVE IDs found in the patch contents.
+    """
+    cve_ids = set()
+    cve_match = re.compile(r"CVE-\d{4}-\d{4,}")
+    # Search for one or more "CVE: " lines
+    for line in patch_contents.split("\n"):
+        if not line.startswith("CVE:"):
+            continue
+        cve_ids.update(cve_match.findall(line))
+    return cve_ids
+
+
+def parse_cves_from_patch_file(patch_file):
+    """
+    Parses CVE IDs associated with a particular patch file, using both the filename
+    and patch contents.
+
+    Returns a set of all CVE IDs found in the patch filename and contents.
+    """
+    cve_ids = set()
+    filename_cve = parse_cve_from_filename(patch_file)
+    if filename_cve:
+        bb.debug(2, "Found %s from patch file name %s" % (filename_cve, patch_file))
+        cve_ids.add(parse_cve_from_filename(patch_file))
+
+    # Remote patches won't be present and compressed patches won't be
+    # unpacked, so say we're not scanning them
+    if not os.path.isfile(patch_file):
+        bb.note("%s is remote or compressed, not scanning content" % patch_file)
+        return cve_ids
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
+
+    cve_ids.update(parse_cves_from_patch_contents(patch_text))
+
+    if not cve_ids:
+        bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
+    else:
+        bb.debug(2, "Patch %s solves %s" % (patch_file, ", ".join(sorted(cve_ids))))
+
+    return cve_ids
+
+
+def get_patched_cves(d):
+    """
+    Determines the CVE IDs that have been solved by either patches incuded within
+    SRC_URI or by setting CVE_STATUS.
+
+    Returns a dictionary with the CVE IDs as keys and an associated dictonary of
+    relevant metadata as the value.
+    """
     patched_cves = {}
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
+        for cve_id in parse_cves_from_patch_file(patch_file):
+            if cve_id not in patched_cves:
+                {
+                    "abbrev-status": "Patched",
+                    "status": "fix-file-included",
+                    "resource": [patch_file],
+                }
+            else:
+                patched_cves[cve_id]["resource"].append(patch_file)
 
     # Search for additional patched CVEs
-    for cve in (d.getVarFlags("CVE_STATUS") or {}):
-        decoded_status = decode_cve_status(d, cve)
+    for cve_id in d.getVarFlags("CVE_STATUS") or {}:
+        decoded_status = decode_cve_status(d, cve_id)
         products = d.getVar("CVE_PRODUCT")
-        if has_cve_product_match(decoded_status, products) == True:
-            patched_cves[cve] = {
+        if has_cve_product_match(decoded_status, products):
+            if cve_id in patched_cves:
+                bb.warn(
+                    'CVE_STATUS[%s] = "%s" is overwriting previous status of "%s: %s"'
+                    % (
+                        cve_id,
+                        d.getVarFlag("CVE_STATUS", cve_id),
+                        patched_cves[cve_id]["abbrev-status"],
+                        patched_cves[cve_id]["status"],
+                    )
+                )
+            patched_cves[cve_id] = {
                 "abbrev-status": decoded_status["mapping"],
                 "status": decoded_status["detail"],
                 "justification": decoded_status["description"],
                 "affected-vendor": decoded_status["vendor"],
-                "affected-product": decoded_status["product"]
+                "affected-product": decoded_status["product"],
             }
 
     return patched_cves
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index 3dd3e89d3e..511e4b81b4 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -120,6 +120,211 @@ class CVECheck(OESelftestTestCase):
         self.assertEqual(has_cve_product_match(status, "test glibca:glibc"), True)
         self.assertEqual(has_cve_product_match(status, "glibca:glibc test"), True)
 
+    def test_parse_cve_from_patch_filename(self):
+        from oe.cve_check import parse_cve_from_filename
+
+        # Patch filename without CVE ID
+        self.assertEqual(parse_cve_from_filename("0001-test.patch"), "")
+
+        # Patch with single CVE ID
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2022-12345.patch"), "CVE-2022-12345"
+        )
+
+        # Patch with multiple CVE IDs
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2022-41741-CVE-2022-41742.patch"),
+            "CVE-2022-41742",
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
+            parse_cve_from_filename("CVE-2012-5667-CVE-2012-5668.patch"),
+            "CVE-2012-5668",
+        )
+
+        # Test invalid CVE ID with incorrect length (must be at least 4 digits)
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2024-001.patch"),
+            "",
+        )
+
+        # Test valid CVE ID with very long length
+        self.assertEqual(
+            parse_cve_from_filename("CVE-2024-0000000000000000000000001.patch"),
+            "CVE-2024-0000000000000000000000001",
+        )
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
 
     def test_recipe_report_json(self):
         config = """
-- 
2.34.1


