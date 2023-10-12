Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24109CDB482
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 13:25:12 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.11102.1697117103347094910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 06:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=IkG0QVVX;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-77574c2cffdso76646485a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697117102; x=1697721902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scX/uVvQUcTd48+wSq+kLfP73xk7ihLM9ckLG55IPkE=;
        b=IkG0QVVXbRU6U3A1g27G2fyToliTwtFIv+w06/SiIg63z0cS56MA6PvkTVHVvi76vw
         clQkYKuvkXUPKaXOIEhRCp0+wcIMihXcIn18gP9TugB3VxWjvgIXETioun7JgIE/hrxr
         tZVbbU9Y15QkEFQsPrQJel0m+mt66Hn60O3iDuNF6mASPXZdvOTy0f2V7VbGYor2v76r
         kqwnij0XmxyOtFYYjMBjX/cH36Dacii2EoT+mh8pO3Ud81FIkXjwEVPYZ28k1EVaz/Lb
         c7ya3iHEDDjmBqFq/9OdNHPl6+v28pXux4g2uQ0ecqIdt+e21WwnndXDV+gpBmheJG1X
         KHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697117102; x=1697721902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=scX/uVvQUcTd48+wSq+kLfP73xk7ihLM9ckLG55IPkE=;
        b=lfpULN+H7P3M8vdakGv6VQybB33hRpu74JDO6U0QU3lSGFcuVqaOjzrtIywczsD0q8
         P7C2JLq79OAEWnmlD2ZplmU+PiOsDdU8oTQ+dbhvKxt31M0E+7trP1b17iYU3s1UWIIu
         v/Ad0A7GprEKKcuYfUR54YZ2W7Ymz4SbuIcsQP6BzhvwEVXdp7cPatRA2QyjX61abUD/
         QalDQQneGxTaXI2cqe/793B2kI2Jkl6r45HuWdq/XhQQyaK8F24cAlk6cLIfcyXWTvph
         pVm5Qw7p1joPam8JjBRf8morwss+ATaLluHD70h4KdYBaZSHehWacwjMxNejTKaRjKhv
         XJIw==
X-Gm-Message-State: AOJu0YxVCbGfZceqxSG32TYkUyCj8HIpXWpvPVlDqQYs16pN0PnGpsjE
	BYKlEwsRq54/BUXmXlzfmQ3bVY5A3Q5V9OrOFeSpnw==
X-Google-Smtp-Source: AGHT+IGcOiQVq8bAbncUAE5XiLMp7ue4XkUQ/eHqUp8YJ3xfyjlL1loI1MJnTDMP5wOEGAVgbiN8fQ==
X-Received: by 2002:a05:620a:2a04:b0:773:cd00:e1ac with SMTP id o4-20020a05620a2a0400b00773cd00e1acmr26312191qkp.36.1697117101805;
        Thu, 12 Oct 2023 06:25:01 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id jy20-20020a0562142b5400b0065d05c8bb5dsm424094qvb.64.2023.10.12.06.25.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 06:25:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] patchtest: clean up test suite
Date: Thu, 12 Oct 2023 09:24:59 -0400
Message-ID: <20231012132459.2469304-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012132459.2469304-1-tgamblin@baylibre.com>
References: <20231012132459.2469304-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 13:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188997

Various tweaks to make the test suite cleaner and more efficient:

- Replace use of "re" module with "pyparsing" in tests (but not base.py)
- Make test_mbox_cve only check for CVE tags in the commit if the added
  patch has them
- Make test_mbox_cve SKIP instead of PASS if there's no CVE tag
- Simplify the bugzilla tag checking test now that pyparsing is used
- Modify the selftest script to correctly parse the new result output

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/selftest/selftest            |  2 +-
 meta/lib/patchtest/tests/test_mbox_author.py    | 14 +++++++-------
 meta/lib/patchtest/tests/test_mbox_bugzilla.py  | 14 +++++++-------
 meta/lib/patchtest/tests/test_mbox_cve.py       | 17 ++++++++++-------
 meta/lib/patchtest/tests/test_mbox_format.py    |  3 +--
 .../patchtest/tests/test_mbox_mailinglist.py    |  6 +++---
 .../patchtest/tests/test_mbox_signed_off_by.py  |  6 +++---
 .../tests/test_metadata_lic_files_chksum.py     |  6 +++---
 .../patchtest/tests/test_metadata_max_length.py |  6 +++---
 .../patchtest/tests/test_metadata_src_uri.py    |  4 ++--
 meta/lib/patchtest/tests/test_patch_cve.py      | 10 +++++-----
 .../patchtest/tests/test_patch_signed_off_by.py |  1 -
 12 files changed, 45 insertions(+), 44 deletions(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index d2b61e951ab..f8985314f5e 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -63,7 +63,7 @@ if __name__ == '__main__':
 
             for resultline in results.splitlines():
                 if testid in resultline:
-                    result, _ = resultline.split(' ', 1)
+                    result, _ = resultline.split(':', 1)
 
                     if expected_result.upper() == "FAIL" and result.upper() == "FAIL":
                         xfailcount = xfailcount + 1
diff --git a/meta/lib/patchtest/tests/test_mbox_author.py b/meta/lib/patchtest/tests/test_mbox_author.py
index fb8f10e1fd6..e68e7a5ac4d 100644
--- a/meta/lib/patchtest/tests/test_mbox_author.py
+++ b/meta/lib/patchtest/tests/test_mbox_author.py
@@ -5,22 +5,22 @@
 # SPDX-License-Identifier: GPL-2.0
 
 import base
-import re
+import pyparsing
 
 class Author(base.Base):
 
-    auh_email = '<auh@auh.yoctoproject.org>'
+    auh_email = 'auh@auh.yoctoproject.org'
 
-    invalids = [re.compile("^Upgrade Helper.+"),
-                re.compile(re.escape(auh_email)),
-                re.compile("uh@not\.set"),
-                re.compile("\S+@example\.com")]
+    invalids = [pyparsing.Regex("^Upgrade Helper.+"),
+                pyparsing.Regex(auh_email),
+                pyparsing.Regex("uh@not\.set"),
+                pyparsing.Regex("\S+@example\.com")]
 
 
     def test_author_valid(self):
         for commit in self.commits:
             for invalid in self.invalids:
-                if invalid.search(commit.author):
+                if invalid.search_string(commit.author):
                     self.fail('Invalid author %s. Resend the series with a valid patch author' % commit.author, commit=commit)
 
     def test_non_auh_upgrade(self):
diff --git a/meta/lib/patchtest/tests/test_mbox_bugzilla.py b/meta/lib/patchtest/tests/test_mbox_bugzilla.py
index aa53b77f87c..adf46b5d59b 100644
--- a/meta/lib/patchtest/tests/test_mbox_bugzilla.py
+++ b/meta/lib/patchtest/tests/test_mbox_bugzilla.py
@@ -4,17 +4,17 @@
 #
 # SPDX-License-Identifier: GPL-2.0
 
-import re
+import pyparsing
 import base
 
 class Bugzilla(base.Base):
-    rexp_detect     = re.compile("\[\s?YOCTO.*\]", re.IGNORECASE)
-    rexp_validation = re.compile("\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]", re.IGNORECASE)
+    rexp_detect = pyparsing.Regex('\[\s?YOCTO.*\]')
+    rexp_validation = pyparsing.Regex('\[(\s?YOCTO\s?#\s?(\d+)\s?,?)+\]')
 
     def test_bugzilla_entry_format(self):
         for commit in Bugzilla.commits:
-            for line in commit.commit_message.splitlines():
-                if self.rexp_detect.match(line):
-                    if not self.rexp_validation.match(line):
-                        self.fail('Bugzilla issue ID is not correctly formatted - specify it with format: "[YOCTO #<bugzilla ID>]"', commit=commit)
+            if not self.rexp_detect.search_string(commit.commit_message):
+                self.skip("No bug ID found")
+            elif not self.rexp_validation.search_string(commit.commit_message):
+                self.fail('Bugzilla issue ID is not correctly formatted - specify it with format: "[YOCTO #<bugzilla ID>]"', commit=commit)
 
diff --git a/meta/lib/patchtest/tests/test_mbox_cve.py b/meta/lib/patchtest/tests/test_mbox_cve.py
index 36548aa10c4..af3712c1928 100644
--- a/meta/lib/patchtest/tests/test_mbox_cve.py
+++ b/meta/lib/patchtest/tests/test_mbox_cve.py
@@ -20,12 +20,13 @@
 import base
 import os
 import parse_cve_tags
-import re
+import pyparsing
 
 class CVE(base.Base):
 
-    revert_shortlog_regex = re.compile('Revert\s+".*"')
+    revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
     prog = parse_cve_tags.cve_tag
+    patch_prog = parse_cve_tags.patch_cve_tag
 
     def setUp(self):
         if self.unidiff_parse_error:
@@ -34,15 +35,17 @@ class CVE(base.Base):
         # we are just interested in series that introduce CVE patches, thus discard other
         # possibilities: modification to current CVEs, patch directly introduced into the
         # recipe, upgrades already including the CVE, etc.
-        new_cves = [p for p in self.patchset if p.path.endswith('.patch') and p.is_added_file]
-        if not new_cves:
-            self.skip('No new CVE patches introduced')
+        new_patches = [p for p in self.patchset if p.path.endswith('.patch') and p.is_added_file]
+        if not new_patches:
+            self.skip('No new patches introduced')
 
     def test_cve_presence_in_commit_message(self):
         for commit in CVE.commits:
             # skip those patches that revert older commits, these do not required the tag presence
-            if self.revert_shortlog_regex.match(commit.shortlog):
+            if self.revert_shortlog_regex.search_string(commit.shortlog):
                 continue
-            if not self.prog.search_string(commit.payload):
+            if not self.patch_prog.search_string(commit.payload):
+                self.skip("No CVE tag in added patch, so not needed in mbox")
+            elif not self.prog.search_string(commit.payload):
                 self.fail('Missing or incorrectly formatted CVE tag in mbox. Correct or include the CVE tag in the mbox with format: "CVE: CVE-YYYY-XXXX"',
                           commit=commit)
diff --git a/meta/lib/patchtest/tests/test_mbox_format.py b/meta/lib/patchtest/tests/test_mbox_format.py
index 42a8491a098..c9e04658356 100644
--- a/meta/lib/patchtest/tests/test_mbox_format.py
+++ b/meta/lib/patchtest/tests/test_mbox_format.py
@@ -5,11 +5,10 @@
 # SPDX-License-Identifier: GPL-2.0
 
 import base
-import re
 
 class MboxFormat(base.Base):
 
     def test_mbox_format(self):
         if self.unidiff_parse_error:
             self.fail('Series cannot be parsed correctly due to malformed diff lines. Create the series again using git-format-patch and ensure it can be applied using git am',
-                      data=[('Diff line', re.sub('^.+:\s(?<!$)','',self.unidiff_parse_error))])
+                      data=[('Diff line',self.unidiff_parse_error)])
diff --git a/meta/lib/patchtest/tests/test_mbox_mailinglist.py b/meta/lib/patchtest/tests/test_mbox_mailinglist.py
index 1f9e0be07f8..c02c71ac6a7 100644
--- a/meta/lib/patchtest/tests/test_mbox_mailinglist.py
+++ b/meta/lib/patchtest/tests/test_mbox_mailinglist.py
@@ -7,7 +7,7 @@
 import subprocess
 import collections
 import base
-import re
+import pyparsing
 from data import PatchTestInput
 
 class MailingList(base.Base):
@@ -39,9 +39,9 @@ class MailingList(base.Base):
 
         # a meta project may be indicted in the message subject, if this is the case, just fail
         # TODO: there may be other project with no-meta prefix, we also need to detect these
-        project_regex = re.compile("\[(?P<project>meta-.+)\]")
+        project_regex = pyparsing.Regex("\[(?P<project>meta-.+)\]")
         for commit in MailingList.commits:
-            match = project_regex.match(commit.subject)
+            match = project_regex.search_string(commit.subject)
             if match:
                 self.fail('Series sent to the wrong mailing list. Check the project\'s README (%s) and send the patch to the indicated list' % match.group('project'),
                           commit=commit)
diff --git a/meta/lib/patchtest/tests/test_mbox_signed_off_by.py b/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
index 8fd705a2efe..59a89bd1bc4 100644
--- a/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
+++ b/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
@@ -6,11 +6,11 @@
 
 import base
 import parse_signed_off_by
-import re
+import pyparsing
 
 class SignedOffBy(base.Base):
 
-    revert_shortlog_regex = re.compile('Revert\s+".*"')
+    revert_shortlog_regex = pyparsing.Regex('Revert\s+".*"')
 
     @classmethod
     def setUpClassLocal(cls):
@@ -20,7 +20,7 @@ class SignedOffBy(base.Base):
     def test_signed_off_by_presence(self):
         for commit in SignedOffBy.commits:
             # skip those patches that revert older commits, these do not required the tag presence
-            if self.revert_shortlog_regex.match(commit.shortlog):
+            if self.revert_shortlog_regex.search_string(commit.shortlog):
                 continue
             if not SignedOffBy.prog.search_string(commit.payload):
                 self.fail('Mbox is missing Signed-off-by. Add it manually or with "git commit --amend -s"',
diff --git a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
index a25a65c6db2..784d432f018 100644
--- a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
+++ b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
@@ -5,7 +5,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 import base
-import re
+import pyparsing
 from data import PatchTestInput, PatchTestDataStore
 
 class LicFilesChkSum(base.Metadata):
@@ -13,7 +13,7 @@ class LicFilesChkSum(base.Metadata):
     license  = 'LICENSE'
     closed   = 'CLOSED'
     lictag   = 'License-Update'
-    lictag_re  = re.compile("^%s:" % lictag, re.MULTILINE)
+    lictag_re  = pyparsing.Regex("^%s:" % lictag)
 
     def setUp(self):
         # these tests just make sense on patches that can be merged
@@ -73,7 +73,7 @@ class LicFilesChkSum(base.Metadata):
             if pretest != test:
                 # if any patch on the series contain reference on the metadata, fail
                 for commit in self.commits:
-                    if self.lictag_re.search(commit.commit_message):
+                    if self.lictag_re.search_string(commit.commit_message):
                        break
                 else:
                     self.fail('LIC_FILES_CHKSUM changed on target %s but there is no "%s" tag in commit message. Include it with a brief description' % (pn, self.lictag),
diff --git a/meta/lib/patchtest/tests/test_metadata_max_length.py b/meta/lib/patchtest/tests/test_metadata_max_length.py
index b3a5dc9b791..477a9bff57f 100644
--- a/meta/lib/patchtest/tests/test_metadata_max_length.py
+++ b/meta/lib/patchtest/tests/test_metadata_max_length.py
@@ -5,10 +5,10 @@
 # SPDX-License-Identifier: GPL-2.0
 
 import base
-import re
+import pyparsing
 
 class MaxLength(base.Base):
-    add_mark = re.compile('\+ ')
+    add_mark = pyparsing.Regex('\+ ')
     max_length = 200
 
     def test_max_line_length(self):
@@ -18,7 +18,7 @@ class MaxLength(base.Base):
                 continue
             payload = str(patch)
             for line in payload.splitlines():
-                if self.add_mark.match(line):
+                if self.add_mark.search_string(line):
                     current_line_length = len(line[1:])
                     if current_line_length > self.max_length:
                         self.fail('Patch line too long (current length %s, maximum is %s)' % (current_line_length, self.max_length),
diff --git a/meta/lib/patchtest/tests/test_metadata_src_uri.py b/meta/lib/patchtest/tests/test_metadata_src_uri.py
index ce2ace17bb9..c19582ec2df 100644
--- a/meta/lib/patchtest/tests/test_metadata_src_uri.py
+++ b/meta/lib/patchtest/tests/test_metadata_src_uri.py
@@ -6,8 +6,8 @@
 
 import subprocess
 import base
-import re
 import os
+import pyparsing
 from data import PatchTestInput, PatchTestDataStore
 
 class SrcUri(base.Metadata):
@@ -15,7 +15,7 @@ class SrcUri(base.Metadata):
     metadata  = 'SRC_URI'
     md5sum    = 'md5sum'
     sha256sum = 'sha256sum'
-    git_regex = re.compile('^git\:\/\/.*')
+    git_regex = pyparsing.Regex('^git\:\/\/.*')
 
     def setUp(self):
         # these tests just make sense on patches that can be merged
diff --git a/meta/lib/patchtest/tests/test_patch_cve.py b/meta/lib/patchtest/tests/test_patch_cve.py
index 144e130707d..0ae85adcf9c 100644
--- a/meta/lib/patchtest/tests/test_patch_cve.py
+++ b/meta/lib/patchtest/tests/test_patch_cve.py
@@ -19,12 +19,12 @@
 
 import base
 import os
-import re
+import pyparsing
 
 class CVE(base.Base):
 
-    re_cve_pattern = re.compile("CVE\-\d{4}\-\d+", re.IGNORECASE)
-    re_cve_payload_tag     = re.compile("\+CVE:(\s+CVE\-\d{4}\-\d+)+")
+    re_cve_pattern = pyparsing.Regex("CVE\-\d{4}\-\d+")
+    re_cve_payload_tag = pyparsing.Regex("\+CVE:(\s+CVE\-\d{4}\-\d+)+")
 
     def setUp(self):
         if self.unidiff_parse_error:
@@ -39,10 +39,10 @@ class CVE(base.Base):
 
     def test_cve_tag_format(self):
         for commit in CVE.commits:
-            if self.re_cve_pattern.search(commit.shortlog) or self.re_cve_pattern.search(commit.commit_message):
+            if self.re_cve_pattern.search_string(commit.shortlog) or self.re_cve_pattern.search_string(commit.commit_message):
                 tag_found = False
                 for line in commit.payload.splitlines():
-                    if self.re_cve_payload_tag.match(line):
+                    if self.re_cve_payload_tag.search_string(line):
                         tag_found = True
                         break
                 if not tag_found:
diff --git a/meta/lib/patchtest/tests/test_patch_signed_off_by.py b/meta/lib/patchtest/tests/test_patch_signed_off_by.py
index 5892033af08..2df6419d264 100644
--- a/meta/lib/patchtest/tests/test_patch_signed_off_by.py
+++ b/meta/lib/patchtest/tests/test_patch_signed_off_by.py
@@ -6,7 +6,6 @@
 
 import base
 import parse_signed_off_by
-import re
 
 class PatchSignedOffBy(base.Base):
 
-- 
2.41.0


