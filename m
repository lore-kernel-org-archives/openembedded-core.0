Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91225CF9C7C
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 11:55:13 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.11910.1727178907785037883
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 04:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Bar9/QPH;
 spf=pass (domain: baylibre.com, ip: 209.85.160.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-458320b30e7so36383231cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 04:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727178906; x=1727783706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZ8Qs6/PqnVQLDWCdl/titxOowBisUfxz8Wz9QCcjGQ=;
        b=Bar9/QPHMmokuwBT5Gk9iiol2t0oqtZ76ERqoJf8ChKNu7H/Tom5sLXWgCRo3/OTwu
         lWxqGCesD9e6NeLamMrZvAWo0GNMFmEg9YjMj7+ePYKCrdIqxH2SEfZB3ef44kPy93fg
         Roamd1TDzRFrHcqUM7Ogqf/aamCsZz93F8wN5CKj10zx7biiqd4n/q1piMK60ADJucRY
         Al8TdglNgq6LOLQ7fAbSvIlJpq5PmWuz6U4RLAB7XkS5iPkkHDcZm+ObuE55GBxzQwoy
         3RmtUEYxoRTimdbFHP03BnizhYpjgIF/Bv10WA0kqnzxtIal2WIiYcx7/t/NWbcs+Cpv
         iGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727178906; x=1727783706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZ8Qs6/PqnVQLDWCdl/titxOowBisUfxz8Wz9QCcjGQ=;
        b=vp6Cr1aikw/3huUsyDDunoyG82szPmiqBWhkUFTwgIsEvS+B5glVc4kCTAkD+dhkb3
         rhVLIpfszEUhl/pbE48aaLo/iB3nf1lj2iG7C+Nn64asXjT3raXdlaEwuC4GZNkLFaNh
         AsBzcS5rddtwh6z55Zk0wlOV3J127Vo8NOGHoBEXV9nhFnUxXxEAJP+XDGTf08T8Ir7/
         HH+PSTV1OZSl7/jNNEj5LPr7uTMthkAdAxA9JvCFMahzK2DUw87nMvAOiKsK12IJVwfe
         K6C9VnPiOViB5CvPov4SaMXm/SB+giTOxwN2tccvExl+P0tRdo4SbhnWlLhO3i3TI1Ko
         /IEQ==
X-Gm-Message-State: AOJu0YwqLkhCiETnboY+OJ3RGUIuL1pBUMsxXpnpd+FQaA9sO3Qpo4GA
	KM4a23rRpg3x6JCr3DVqcA3DX2evXMn4mUftgN1jYp5rXQ3D81ddUssLq54Bdr6jnyy101S0K5k
	VAu4=
X-Google-Smtp-Source: AGHT+IGB8B5G8en7cI2BPTCMAM+cbpDBdOc8wGiiI6IB8NeDjx8/P4PxfrMT4IgnqqobyCKee8mW6w==
X-Received: by 2002:ac8:7dd0:0:b0:453:76d6:65d4 with SMTP id d75a77b69052e-45b204dfe53mr223559561cf.11.1727178906036;
        Tue, 24 Sep 2024 04:55:06 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b525456d3sm5553611cf.13.2024.09.24.04.55.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:55:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/6] patchtest: patterns: add module, refactor
Date: Tue, 24 Sep 2024 07:54:58 -0400
Message-Id: <20240924115503.1599651-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924115503.1599651-1-tgamblin@baylibre.com>
References: <20240924115503.1599651-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204851

Currently, patchtest has a lot of spread-out definitions for patterns
used in various setup and test functions. Organize these by putting them
all into a new patterns.py module. This allows the tests/pyparsing
directory to be removed, as it is now redundant. Also remove some
definitions where they were duplicated or unused, and perform some
renames to improve readability and avoid collisions. Many of these
variables are composed from others, so the file is only partially
sorted.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/patterns.py                | 92 +++++++++++++++++++
 meta/lib/patchtest/tests/pyparsing/common.py  | 26 ------
 .../tests/pyparsing/parse_cve_tags.py         | 18 ----
 .../tests/pyparsing/parse_shortlog.py         | 14 ---
 .../tests/pyparsing/parse_signed_off_by.py    | 22 -----
 .../tests/pyparsing/parse_upstream_status.py  | 24 -----
 meta/lib/patchtest/tests/test_mbox.py         | 36 +++-----
 meta/lib/patchtest/tests/test_metadata.py     | 56 ++++-------
 meta/lib/patchtest/tests/test_patch.py        | 31 +++----
 .../lib/patchtest/tests/test_python_pylint.py |  1 +
 10 files changed, 137 insertions(+), 183 deletions(-)
 create mode 100644 meta/lib/patchtest/patterns.py
 delete mode 100644 meta/lib/patchtest/tests/pyparsing/common.py
 delete mode 100644 meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py
 delete mode 100644 meta/lib/patchtest/tests/pyparsing/parse_shortlog.py
 delete mode 100644 meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py
 delete mode 100644 meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py

diff --git a/meta/lib/patchtest/patterns.py b/meta/lib/patchtest/patterns.py
new file mode 100644
index 00000000000..ba97a4ffe9f
--- /dev/null
+++ b/meta/lib/patchtest/patterns.py
@@ -0,0 +1,92 @@
+# common pyparsing variables
+#
+# Copyright (C) 2016 Intel Corporation
+#
+# SPDX-License-Identifier: GPL-2.0-only
+
+import pyparsing
+
+# general
+colon = pyparsing.Literal(":")
+line_start = pyparsing.LineStart()
+line_end = pyparsing.LineEnd()
+at = pyparsing.Literal("@")
+lessthan = pyparsing.Literal("<")
+greaterthan = pyparsing.Literal(">")
+opensquare = pyparsing.Literal("[")
+closesquare = pyparsing.Literal("]")
+inappropriate = pyparsing.CaselessLiteral("Inappropriate")
+submitted = pyparsing.CaselessLiteral("Submitted")
+
+# word related
+nestexpr = pyparsing.nestedExpr(opener='[', closer=']')
+inappropriateinfo = pyparsing.Literal("Inappropriate") + nestexpr
+submittedinfo = pyparsing.Literal("Submitted") + nestexpr
+word = pyparsing.Word(pyparsing.alphas)
+worddot = pyparsing.Word(pyparsing.alphas+".")
+
+# metadata
+
+metadata_lic = 'LICENSE'
+invalid_license = 'PATCHTESTINVALID'
+metadata_chksum = 'LIC_FILES_CHKSUM'
+license_var  = 'LICENSE'
+closed   = 'CLOSED'
+lictag_re  = pyparsing.AtLineStart("License-Update:")
+lic_chksum_added = pyparsing.AtLineStart("+" + metadata_chksum)
+lic_chksum_removed = pyparsing.AtLineStart("-" + metadata_chksum)
+add_mark = pyparsing.Regex('\\+ ')
+patch_max_line_length = 200
+metadata_src_uri  = 'SRC_URI'
+metadata_summary = 'SUMMARY'
+cve_check_ignore_var = 'CVE_CHECK_IGNORE'
+cve_status_var = 'CVE_STATUS'
+
+# mbox
+auh_email = 'auh@yoctoproject.org'
+
+invalid_submitters = [pyparsing.Regex("^Upgrade Helper.+"),
+            pyparsing.Regex(auh_email),
+            pyparsing.Regex("uh@not\.set"),
+            pyparsing.Regex("\S+@example\.com")]
+
+mbox_bugzilla = pyparsing.Regex('\[\s?YOCTO.*\]')
+mbox_bugzilla_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
+mbox_revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
+mbox_shortlog_maxlength = 90
+
+# patch
+
+cve = pyparsing.Regex("CVE\-\d{4}\-\d+")
+cve_payload_tag = pyparsing.Regex("\+CVE:(\s+CVE\-\d{4}\-\d+)+")
+upstream_status_regex = pyparsing.AtLineStart("+" + "Upstream-Status")
+
+# shortlog
+
+shortlog_target = pyparsing.OneOrMore(pyparsing.Word(pyparsing.printables.replace(':','')))
+shortlog_summary = pyparsing.OneOrMore(pyparsing.Word(pyparsing.printables))
+shortlog = line_start + shortlog_target + colon + shortlog_summary + line_end
+
+# signed-off-bys
+
+email_pattern = pyparsing.Regex(r"(?P<user>[A-Za-z0-9._%+-]+)@(?P<hostname>[A-Za-z0-9.-]+)\.(?P<domain>[A-Za-z]{2,})")
+
+signed_off_by_prefix = pyparsing.Literal("Signed-off-by:")
+signed_off_by_name = pyparsing.Regex('\S+.*(?= <)')
+signed_off_by_email = lessthan + email_pattern + greaterthan
+signed_off_by = pyparsing.AtLineStart(signed_off_by_prefix + signed_off_by_name + signed_off_by_email)
+patch_signed_off_by = pyparsing.AtLineStart("+" + signed_off_by_prefix + signed_off_by_name + signed_off_by_email)
+
+# upstream-status
+
+upstream_status_literal_valid_status = ["Pending", "Backport", "Denied", "Inappropriate", "Submitted"]
+upstream_status_nonliteral_valid_status = ["Pending", "Backport", "Denied", "Inappropriate [reason]", "Submitted [where]"]
+
+upstream_status_valid_status = pyparsing.Or(
+    [pyparsing.Literal(status) for status in upstream_status_literal_valid_status]
+)
+
+upstream_status_prefix = pyparsing.Literal("Upstream-Status")
+upstream_status = line_start + upstream_status_prefix + colon + upstream_status_valid_status
+upstream_status_inappropriate_info = line_start + upstream_status_prefix + colon + inappropriateinfo
+upstream_status_submitted_info = line_start + upstream_status_prefix + colon + submittedinfo
diff --git a/meta/lib/patchtest/tests/pyparsing/common.py b/meta/lib/patchtest/tests/pyparsing/common.py
deleted file mode 100644
index cbce4c38bc8..00000000000
--- a/meta/lib/patchtest/tests/pyparsing/common.py
+++ /dev/null
@@ -1,26 +0,0 @@
-# common pyparsing variables
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-import pyparsing
-
-# general
-colon = pyparsing.Literal(":")
-start = pyparsing.LineStart()
-end   = pyparsing.LineEnd()
-at = pyparsing.Literal("@")
-lessthan = pyparsing.Literal("<")
-greaterthan = pyparsing.Literal(">")
-opensquare = pyparsing.Literal("[")
-closesquare = pyparsing.Literal("]")
-inappropriate = pyparsing.CaselessLiteral("Inappropriate")
-submitted = pyparsing.CaselessLiteral("Submitted")
-
-# word related
-nestexpr = pyparsing.nestedExpr(opener='[', closer=']')
-inappropriateinfo = pyparsing.Literal("Inappropriate") + nestexpr
-submittedinfo = pyparsing.Literal("Submitted") + nestexpr
-word = pyparsing.Word(pyparsing.alphas)
-worddot = pyparsing.Word(pyparsing.alphas+".")
diff --git a/meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py b/meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py
deleted file mode 100644
index f7fb82ec2bd..00000000000
--- a/meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py
+++ /dev/null
@@ -1,18 +0,0 @@
-# signed-off-by pyparsing definition
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-
-import pyparsing
-import common
-
-name = pyparsing.Regex('\S+.*(?= <)')
-username = pyparsing.OneOrMore(common.worddot)
-domain = pyparsing.OneOrMore(common.worddot)
-cve = pyparsing.Regex('CVE\-\d{4}\-\d+')
-cve_mark = pyparsing.Literal("CVE:")
-
-cve_tag = pyparsing.AtLineStart(cve_mark + cve)
-patch_cve_tag = pyparsing.AtLineStart("+" + cve_mark + cve)
diff --git a/meta/lib/patchtest/tests/pyparsing/parse_shortlog.py b/meta/lib/patchtest/tests/pyparsing/parse_shortlog.py
deleted file mode 100644
index 30d3ab35b32..00000000000
--- a/meta/lib/patchtest/tests/pyparsing/parse_shortlog.py
+++ /dev/null
@@ -1,14 +0,0 @@
-# subject pyparsing definition
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-# NOTE:This is an oversimplified syntax of the mbox's summary
-
-import pyparsing
-import common
-
-target        = pyparsing.OneOrMore(pyparsing.Word(pyparsing.printables.replace(':','')))
-summary       = pyparsing.OneOrMore(pyparsing.Word(pyparsing.printables))
-shortlog       = common.start + target + common.colon + summary + common.end
diff --git a/meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py b/meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py
deleted file mode 100644
index 692ebec3ffc..00000000000
--- a/meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py
+++ /dev/null
@@ -1,22 +0,0 @@
-# signed-off-by pyparsing definition
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-
-import pyparsing
-import common
-
-name = pyparsing.Regex('\S+.*(?= <)')
-username = pyparsing.OneOrMore(common.worddot)
-domain = pyparsing.OneOrMore(common.worddot)
-
-# taken from https://pyparsing-public.wikispaces.com/Helpful+Expressions
-email = pyparsing.Regex(r"(?P<user>[A-Za-z0-9._%+-]+)@(?P<hostname>[A-Za-z0-9.-]+)\.(?P<domain>[A-Za-z]{2,})")
-
-email_enclosed = common.lessthan + email + common.greaterthan
-
-signed_off_by_mark = pyparsing.Literal("Signed-off-by:")
-signed_off_by = pyparsing.AtLineStart(signed_off_by_mark + name + email_enclosed)
-patch_signed_off_by = pyparsing.AtLineStart("+" + signed_off_by_mark + name + email_enclosed)
diff --git a/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py b/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
deleted file mode 100644
index bc6c427c4ce..00000000000
--- a/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
+++ /dev/null
@@ -1,24 +0,0 @@
-# upstream-status pyparsing definition
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: GPL-2.0-only
-
-
-import common
-import pyparsing
-
-upstream_status_literal_valid_status = ["Pending", "Backport", "Denied", "Inappropriate", "Submitted"]
-upstream_status_nonliteral_valid_status = ["Pending", "Backport", "Denied", "Inappropriate [reason]", "Submitted [where]"]
-
-upstream_status_valid_status = pyparsing.Or(
-    [pyparsing.Literal(status) for status in upstream_status_literal_valid_status]
-)
-
-upstream_status_mark         = pyparsing.Literal("Upstream-Status")
-inappropriate_status_mark    = common.inappropriate
-submitted_status_mark        = common.submitted
-
-upstream_status              = common.start + upstream_status_mark + common.colon + upstream_status_valid_status
-upstream_status_inappropriate_info = common.start + upstream_status_mark + common.colon + common.inappropriateinfo
-upstream_status_submitted_info = common.start + upstream_status_mark + common.colon + common.submittedinfo
diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index cd76e58a717..e6b8ad21f80 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -6,8 +6,7 @@
 
 import base
 import collections
-import parse_shortlog
-import parse_signed_off_by
+import patterns
 import pyparsing
 import re
 import subprocess
@@ -23,19 +22,6 @@ def headlog():
 
 class TestMbox(base.Base):
 
-    auh_email = 'auh@yoctoproject.org'
-
-    invalids = [pyparsing.Regex("^Upgrade Helper.+"),
-                pyparsing.Regex(auh_email),
-                pyparsing.Regex("uh@not\.set"),
-                pyparsing.Regex("\S+@example\.com")]
-
-    rexp_detect = pyparsing.Regex('\[\s?YOCTO.*\]')
-    rexp_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
-    signoff_prog = parse_signed_off_by.signed_off_by
-    revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
-    maxlength = 90
-
     # base paths of main yocto project sub-projects
     paths = {
         'oe-core': ['meta-selftest', 'meta-skeleton', 'meta', 'scripts'],
@@ -59,9 +45,9 @@ class TestMbox(base.Base):
     def test_signed_off_by_presence(self):
         for commit in TestMbox.commits:
             # skip those patches that revert older commits, these do not required the tag presence
-            if self.revert_shortlog_regex.search_string(commit.shortlog):
+            if patterns.mbox_revert_shortlog_regex.search_string(commit.shortlog):
                 continue
-            if not self.signoff_prog.search_string(commit.payload):
+            if not patterns.signed_off_by.search_string(commit.payload):
                 self.fail('Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s"',
                           commit=commit)
 
@@ -75,7 +61,7 @@ class TestMbox(base.Base):
                 if shortlog.startswith('Revert "'):
                     continue
                 try:
-                    parse_shortlog.shortlog.parseString(shortlog)
+                    patterns.shortlog.parseString(shortlog)
                 except pyparsing.ParseException as pe:
                     self.fail('Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"',
                               commit=commit)
@@ -87,8 +73,8 @@ class TestMbox(base.Base):
             if shortlog.startswith('Revert "'):
                 continue
             l = len(shortlog)
-            if l > self.maxlength:
-                self.fail('Edit shortlog so that it is %d characters or less (currently %d characters)' % (self.maxlength, l),
+            if l > patterns.mbox_shortlog_maxlength:
+                self.fail('Edit shortlog so that it is %d characters or less (currently %d characters)' % (patterns.mbox_shortlog_maxlength, l),
                           commit=commit)
 
     def test_series_merge_on_head(self):
@@ -142,18 +128,18 @@ class TestMbox(base.Base):
 
     def test_bugzilla_entry_format(self):
         for commit in TestMbox.commits:
-            if not self.rexp_detect.search_string(commit.commit_message):
+            if not patterns.mbox_bugzilla.search_string(commit.commit_message):
                 self.skip("No bug ID found")
-            elif not self.rexp_validation.search_string(commit.commit_message):
+            elif not patterns.mbox_bugzilla_validation.search_string(commit.commit_message):
                 self.fail('Bugzilla issue ID is not correctly formatted - specify it with format: "[YOCTO #<bugzilla ID>]"', commit=commit)
 
     def test_author_valid(self):
         for commit in self.commits:
-            for invalid in self.invalids:
+            for invalid in patterns.invalid_submitters:
                 if invalid.search_string(commit.author):
                     self.fail('Invalid author %s. Resend the series with a valid patch author' % commit.author, commit=commit)
 
     def test_non_auh_upgrade(self):
         for commit in self.commits:
-            if self.auh_email in commit.commit_message:
-                self.fail('Invalid author %s. Resend the series with a valid patch author' % self.auh_email, commit=commit)
+            if patterns.auh_email in commit.commit_message:
+                self.fail('Invalid author %s. Resend the series with a valid patch author' % patterns.auh_email, commit=commit)
diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index f5dbcf01ed6..8c2305a1840 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -6,27 +6,11 @@
 
 import base
 import os
+import patterns
 import pyparsing
 from data import PatchTestInput, PatchTestDataStore
 
 class TestMetadata(base.Metadata):
-    metadata_lic = 'LICENSE'
-    invalid_license = 'PATCHTESTINVALID'
-    metadata_chksum = 'LIC_FILES_CHKSUM'
-    license_var  = 'LICENSE'
-    closed   = 'CLOSED'
-    lictag_re  = pyparsing.AtLineStart("License-Update:")
-    lic_chksum_added = pyparsing.AtLineStart("+" + metadata_chksum)
-    lic_chksum_removed = pyparsing.AtLineStart("-" + metadata_chksum)
-    add_mark = pyparsing.Regex('\\+ ')
-    max_length = 200
-    metadata_src_uri  = 'SRC_URI'
-    md5sum    = 'md5sum'
-    sha256sum = 'sha256sum'
-    git_regex = pyparsing.Regex('^git\\:\\/\\/.*')
-    metadata_summary = 'SUMMARY'
-    cve_check_ignore_var = 'CVE_CHECK_IGNORE'
-    cve_status_var = 'CVE_STATUS'
 
     def test_license_presence(self):
         if not self.added:
@@ -41,13 +25,13 @@ class TestMetadata(base.Metadata):
             open_flag = 'a'
         with open(auto_conf, open_flag) as fd:
             for pn in self.added:
-                fd.write('LICENSE ??= "%s"\n' % self.invalid_license)
+                fd.write('LICENSE ??= "%s"\n' % patterns.invalid_license)
 
         no_license = False
         for pn in self.added:
             rd = self.tinfoil.parse_recipe(pn)
-            license = rd.getVar(self.metadata_lic)
-            if license == self.invalid_license:
+            license = rd.getVar(patterns.metadata_lic)
+            if license == patterns.invalid_license:
                 no_license = True
                 break
 
@@ -74,11 +58,11 @@ class TestMetadata(base.Metadata):
             # we are not interested in images
             if '/images/' in pathname:
                 continue
-            lic_files_chksum = rd.getVar(self.metadata_chksum)
-            if rd.getVar(self.license_var) == self.closed:
+            lic_files_chksum = rd.getVar(patterns.metadata_chksum)
+            if rd.getVar(patterns.license_var) == patterns.closed:
                 continue
             if not lic_files_chksum:
-                self.fail('%s is missing in newly added recipe' % self.metadata_chksum)
+                self.fail('%s is missing in newly added recipe' % patterns.metadata_chksum)
 
     def test_lic_files_chksum_modified_not_mentioned(self):
         if not self.modified:
@@ -89,10 +73,10 @@ class TestMetadata(base.Metadata):
             if patch.path.endswith('.patch'):
                 continue
             payload = str(patch)
-            if (self.lic_chksum_added.search_string(payload) or self.lic_chksum_removed.search_string(payload)):
+            if (patterns.lic_chksum_added.search_string(payload) or patterns.lic_chksum_removed.search_string(payload)):
                 # if any patch on the series contain reference on the metadata, fail
                 for commit in self.commits:
-                    if self.lictag_re.search_string(commit.commit_message):
+                    if patterns.lictag_re.search_string(commit.commit_message):
                        break
                 else:
                     self.fail('LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message')
@@ -104,10 +88,10 @@ class TestMetadata(base.Metadata):
                 continue
             payload = str(patch)
             for line in payload.splitlines():
-                if self.add_mark.search_string(line):
+                if patterns.add_mark.search_string(line):
                     current_line_length = len(line[1:])
-                    if current_line_length > self.max_length:
-                        self.fail('Patch line too long (current length %s, maximum is %s)' % (current_line_length, self.max_length),
+                    if current_line_length > patterns.patch_max_line_length:
+                        self.fail('Patch line too long (current length %s, maximum is %s)' % (current_line_length, patterns.patch_max_line_length),
                                   data=[('Patch', patch.path), ('Line', '%s ...' % line[0:80])])
 
     def pretest_src_uri_left_files(self):
@@ -123,7 +107,7 @@ class TestMetadata(base.Metadata):
             if 'core-image' in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
-            PatchTestDataStore['%s-%s-%s' % (self.shortid(), self.metadata_src_uri, pn)] = rd.getVar(self.metadata_src_uri)
+            PatchTestDataStore['%s-%s-%s' % (self.shortid(), patterns.metadata_src_uri, pn)] = rd.getVar(patterns.metadata_src_uri)
 
     def test_src_uri_left_files(self):
         # these tests just make sense on patches that can be merged
@@ -138,11 +122,11 @@ class TestMetadata(base.Metadata):
             if 'core-image' in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
-            PatchTestDataStore['%s-%s-%s' % (self.shortid(), self.metadata_src_uri, pn)] = rd.getVar(self.metadata_src_uri)
+            PatchTestDataStore['%s-%s-%s' % (self.shortid(), patterns.metadata_src_uri, pn)] = rd.getVar(patterns.metadata_src_uri)
 
         for pn in self.modified:
-            pretest_src_uri = PatchTestDataStore['pre%s-%s-%s' % (self.shortid(), self.metadata_src_uri, pn)].split()
-            test_src_uri    = PatchTestDataStore['%s-%s-%s' % (self.shortid(), self.metadata_src_uri, pn)].split()
+            pretest_src_uri = PatchTestDataStore['pre%s-%s-%s' % (self.shortid(), patterns.metadata_src_uri, pn)].split()
+            test_src_uri    = PatchTestDataStore['%s-%s-%s' % (self.shortid(), patterns.metadata_src_uri, pn)].split()
 
             pretest_files = set([os.path.basename(patch) for patch in pretest_src_uri if patch.startswith('file://')])
             test_files    = set([os.path.basename(patch) for patch in test_src_uri    if patch.startswith('file://')])
@@ -175,11 +159,11 @@ class TestMetadata(base.Metadata):
             if 'core-image' in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
-            summary = rd.getVar(self.metadata_summary)
+            summary = rd.getVar(patterns.metadata_summary)
 
             # "${PN} version ${PN}-${PR}" is the default, so fail if default
             if summary.startswith('%s version' % pn):
-                self.fail('%s is missing in newly added recipe' % self.metadata_summary)
+                self.fail('%s is missing in newly added recipe' % patterns.metadata_summary)
 
     def test_cve_check_ignore(self):
         # Skip if we neither modified a recipe or target branches are not
@@ -191,7 +175,7 @@ class TestMetadata(base.Metadata):
             if 'core-image' in pn:
                 continue
             rd = self.tinfoil.parse_recipe(pn)
-            cve_check_ignore = rd.getVar(self.cve_check_ignore_var)
+            cve_check_ignore = rd.getVar(patterns.cve_check_ignore_var)
 
             if cve_check_ignore is not None:
-                self.fail('%s is deprecated and should be replaced by %s' % (self.cve_check_ignore_var, self.cve_status_var))
+                self.fail('%s is deprecated and should be replaced by %s' % (patterns.cve_check_ignore_var, patterns.cve_status_var))
diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index d7187a0cb1b..d856b216f09 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -7,16 +7,11 @@
 
 import base
 import os
-import parse_signed_off_by
-import parse_upstream_status
+import patterns
 import pyparsing
 
 class TestPatch(base.Base):
 
-    re_cve_pattern = pyparsing.Regex("CVE\-\d{4}\-\d+")
-    re_cve_payload_tag = pyparsing.Regex("\+CVE:(\s+CVE\-\d{4}\-\d+)+")
-    upstream_status_regex = pyparsing.AtLineStart("+" + "Upstream-Status")
-
     @classmethod
     def setUpClassLocal(cls):
         cls.newpatches = []
@@ -25,16 +20,16 @@ class TestPatch(base.Base):
             if patch.path.endswith('.patch') and patch.is_added_file:
                 cls.newpatches.append(patch)
 
-        cls.mark = str(parse_signed_off_by.signed_off_by_mark).strip('"')
+        cls.mark = str(patterns.signed_off_by_prefix).strip('"')
 
         # match PatchSignedOffBy.mark with '+' preceding it
-        cls.prog = parse_signed_off_by.patch_signed_off_by
+        cls.prog = patterns.patch_signed_off_by
 
     def setUp(self):
         if self.unidiff_parse_error:
             self.skip('Parse error %s' % self.unidiff_parse_error)
 
-        self.valid_status    = ', '.join(parse_upstream_status.upstream_status_nonliteral_valid_status)
+        self.valid_status    = ', '.join(patterns.upstream_status_nonliteral_valid_status)
         self.standard_format = 'Upstream-Status: <Valid status>'
 
         # we are just interested in series that introduce CVE patches, thus discard other
@@ -50,28 +45,28 @@ class TestPatch(base.Base):
 
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
-            if not self.upstream_status_regex.search_string(payload):
+            if not patterns.upstream_status_regex.search_string(payload):
                 self.fail('Added patch file is missing Upstream-Status: <Valid status> in the commit message',
                           data=[('Standard format', self.standard_format), ('Valid status', self.valid_status)])
             for line in payload.splitlines():
                 if self.patchmetadata_regex.match(line):
                     continue
-                if self.upstream_status_regex.search_string(line):
-                        if parse_upstream_status.inappropriate_status_mark.searchString(line):
+                if patterns.upstream_status_regex.search_string(line):
+                        if patterns.inappropriate.searchString(line):
                             try:
-                                parse_upstream_status.upstream_status_inappropriate_info.parseString(line.lstrip('+'))
+                                patterns.upstream_status_inappropriate_info.parseString(line.lstrip('+'))
                             except pyparsing.ParseException as pe:
                                 self.fail('Upstream-Status is Inappropriate, but no reason was provided',
                                           data=[('Current', pe.pstr), ('Standard format', 'Upstream-Status: Inappropriate [reason]')])
-                        elif parse_upstream_status.submitted_status_mark.searchString(line):
+                        elif patterns.submitted.searchString(line):
                             try:
-                                parse_upstream_status.upstream_status_submitted_info.parseString(line.lstrip('+'))
+                                patterns.upstream_status_submitted_info.parseString(line.lstrip('+'))
                             except pyparsing.ParseException as pe:
                                 self.fail('Upstream-Status is Submitted, but it is not mentioned where',
                                           data=[('Current', pe.pstr), ('Standard format', 'Upstream-Status: Submitted [where]')])
                         else:
                             try:
-                                parse_upstream_status.upstream_status.parseString(line.lstrip('+'))
+                                patterns.upstream_status.parseString(line.lstrip('+'))
                             except pyparsing.ParseException as pe:
                                 self.fail('Upstream-Status is in incorrect format',
                                           data=[('Current', pe.pstr), ('Standard format', self.standard_format), ('Valid status', self.valid_status)])
@@ -92,10 +87,10 @@ class TestPatch(base.Base):
 
     def test_cve_tag_format(self):
         for commit in TestPatch.commits:
-            if self.re_cve_pattern.search_string(commit.shortlog) or self.re_cve_pattern.search_string(commit.commit_message):
+            if patterns.cve.search_string(commit.shortlog) or patterns.cve.search_string(commit.commit_message):
                 tag_found = False
                 for line in commit.payload.splitlines():
-                    if self.re_cve_payload_tag.search_string(line):
+                    if patterns.cve_payload_tag.search_string(line):
                         tag_found = True
                         break
                 if not tag_found:
diff --git a/meta/lib/patchtest/tests/test_python_pylint.py b/meta/lib/patchtest/tests/test_python_pylint.py
index ef315e591ca..b03fd6f4f65 100644
--- a/meta/lib/patchtest/tests/test_python_pylint.py
+++ b/meta/lib/patchtest/tests/test_python_pylint.py
@@ -5,6 +5,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 import base
+import patterns
 from io import StringIO
 from data import PatchTestInput
 from pylint.reporters.text import TextReporter
-- 
2.39.5


