Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CC8CD37AC
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:42:27 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19915.1778787743955530690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:42:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=EAJHTmw2;
 spf=pass (domain: baylibre.com, ip: 209.85.219.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8b3d6b215cfso125261196d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778787742; x=1779392542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03sLf7GZ43UAXBy/c8TQkTofSGXJSiF8liOGS0PQ/GQ=;
        b=EAJHTmw2cqhVZImZuuW9UXmRKqOMMIE9Rbh5bakaFiw/D3V9pF0UM2dPaJzeoM9PMt
         NSHjK8MTGqTpjMWXAKyBA+Ixg5aE9o+Ut5JwrMhUs+P2+GrXteTpfO6l7PnqwMvYJEoI
         cAn3WRfWiaj//WmWBhi+VQjSgv844AqscSlsNZNPIT7TztAfP015om7nlA6ladpIUm9H
         pX66ryKVps33RhWJQVUv4po3jp8cAEE7kZABUr5BLCGdeooJN4KCzKY00070ArE9JsbY
         Z64wKzY6FVIhTTFbq2kjNqA3/vOzJHNrKOnpygaE6d63enuT28R1PAg3SZfC7V+E1vLh
         gQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787742; x=1779392542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=03sLf7GZ43UAXBy/c8TQkTofSGXJSiF8liOGS0PQ/GQ=;
        b=sInVERrwBIbuJW4PCewNT0sq2WiTTAxiqP9pNCHUMxWx6eWwvAL7H8NWX4qRmkDQSh
         i0rSpnAfNEH02zgnYewuisvlf6isKisghoN0R6FPQ/GlsY8D06OAelrI9+g2YRRjmaCb
         7FJkgv1E8853vIQIyXQToYZ6TS984xSJ2Q01RSr9hIaj1/s625szK3gzYsJEIdlyoLOC
         LorDcMb8+rW4FPW70nmxpuswPH+J8kT6gtRY+E8y3gly8JqkUKz0l8MKEUPikN6TMY74
         MEjM7CVVtwTQN5eltte9KQDy832gMV3bkHxNRMdb4vprnk0dEtga9S49x9VoX1rFnhuj
         zcSg==
X-Gm-Message-State: AOJu0YzTqYIjFZgHptzJZEoJh9iV9fnvwQUJEdo6U9zlMW7/gK17pAXn
	i/AgGcNWRn3rh/BQs2+DfnVAS1FAHEl5dQzOYbv44J4pMfabl9wJzR6zpxuIhr2upyc9VrfTq8o
	oLAU3lsc=
X-Gm-Gg: Acq92OF0WKyLHWCi4rUQzmtv9mK9tesMz/a9o2yV97OezthwcdQcy8I4vhn90m5lFHK
	u9NxQenNh5W6zrFwJH1xg40hML8JsEexmjAw3AEj/gpDsmKTYgphiaaWBBxa+NH4E/BLLpevZ1e
	ROs4KHI2Nz8laBMENnwWxzaI13Jire30zVTMQBwOgPxXpNbKxmEPiBpXSg5YdRxEIIpzO7x3Wxc
	bEIhFG4iYkF3HmYGXdnoGIg4qRmeVsPijacANK42WcLUiDyu7j1RfvoMJyDW/ugnDIFCjzIhbuO
	ZQmHyplKeaBAdUaY766EgmwkL8EFf/1NX7z6RZ4Ejpmwl889l3qiHXvav52xLQEZEjdeCH8g4q1
	5sDoLNyveDFZS6PC46DWQYEOGJPvHb5IWKxW8xOT7vAvCIY6tfJtT90Zpjox8fDHp8OfHYuh30s
	tSl10CQ7rSAr1tsP+AcPAi1C/ILQ==
X-Received: by 2002:a05:622a:544c:b0:50f:b260:cad7 with SMTP id d75a77b69052e-5165a1ec980mr10712821cf.41.1778787742375;
        Thu, 14 May 2026 12:42:22 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516457d630csm23862571cf.14.2026.05.14.12.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:42:21 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 06/11] patchtest: test_patch: improve patch-specific tests
Date: Thu, 14 May 2026 15:42:02 -0400
Message-ID: <20260514194207.1958325-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514194207.1958325-1-tgamblin@baylibre.com>
References: <20260514194207.1958325-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237053

[YOCTO #16247]

- Create two new tests:
  1. test_patch_malformed_context, for catching empty lines which might be
     treated as context lines (and ensuring they begin with proper diff
     characters);
  2. test_patch_trailing_whitespace, for catching trailing spaces/tabs on
     new lines.

- Be explicit about line numbers when a patch has one or more malformed
  lines. To do this correctly, we actually have to rework the test a bit
  and extract the inner patch hunks for checking, otherwise we are
  functionally testing the entire diff and reporting malformed lines for
  the whole commit. This means, for example, that we could see something
  like this for an mbox adding a patch with only 29 lines:

  |FAIL: test patch malformed context: Malformed patch line: context line is missing its leading space prefix (test_patch.TestPatch.test_patch_malformed_context)
  |    Patch: 174c24d6e87aeae631bc0a7bb1ba983cf8def4de.patch
  |    Lines: 23, 36

- When no new patches are introduced, patchtest reports that there are
  no *CVE* patches introduced, but this is not the only type we
  potentially carry. Remove that acronym from the message so the warning
  doesn't mislead users.

- When running test_signed_off_by_presence() and
  test_upstream_status_presence_format(), don't test the existing tags
  if the patch has only been modified to carry forward. This way we
  avoid sending false positive emails out during some upgrades and patch
  refreshes.

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_patch.py | 80 +++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index 9f1d7d2c8f..42a4f7f9ac 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -10,6 +10,23 @@ import os
 import patchtest_patterns
 import pyparsing
 
+
+def _format_line_numbers(nums):
+    """Format a sorted list of line numbers as compact ranges, e.g. [1,2,3,7] -> '1-3, 7'."""
+    if not nums:
+        return ''
+    nums = sorted(set(nums))
+    parts = []
+    start = end = nums[0]
+    for n in nums[1:]:
+        if n == end + 1:
+            end = n
+        else:
+            parts.append(str(start) if start == end else '%d-%d' % (start, end))
+            start = end = n
+    parts.append(str(start) if start == end else '%d-%d' % (start, end))
+    return ', '.join(parts)
+
 class TestPatch(base.Base):
 
     @classmethod
@@ -17,7 +34,7 @@ class TestPatch(base.Base):
         cls.newpatches = []
         # get just those relevant patches: new software patches
         for patch in cls.patchset:
-            if patch.path.endswith('.patch') and patch.is_added_file:
+            if patch.path.endswith('.patch') and (patch.is_added_file or patch.is_modified_file):
                 cls.newpatches.append(patch)
 
         cls.mark = str(patchtest_patterns.signed_off_by_prefix).strip('"')
@@ -29,7 +46,7 @@ class TestPatch(base.Base):
         if self.unidiff_parse_error:
             self.skip('Parse error %s' % self.unidiff_parse_error)
         if not TestPatch.newpatches:
-            self.skip('No new CVE patches introduced')
+            self.skip('No new patches introduced')
 
     def test_upstream_status_presence_format(self):
         if not TestPatch.newpatches:
@@ -39,6 +56,8 @@ class TestPatch(base.Base):
         standard_format = "Upstream-Status: <Valid status>"
 
         for newpatch in TestPatch.newpatches:
+            if not newpatch.is_added_file:
+                continue
             payload = newpatch.__str__()
             lines = payload.splitlines()
 
@@ -147,6 +166,8 @@ class TestPatch(base.Base):
             self.skip("There are no new software patches, no reason to test %s presence" % TestPatch.mark)
 
         for newpatch in TestPatch.newpatches:
+            if not newpatch.is_added_file:
+                continue
             payload = newpatch.__str__()
             for line in payload.splitlines():
                 if patchtest_patterns.patchmetadata_regex.match(line):
@@ -169,3 +190,58 @@ class TestPatch(base.Base):
                 if not tag_found:
                     self.fail('Missing or incorrectly formatted CVE tag in patch file. Correct or include the CVE tag in the patch with format: "CVE: CVE-YYYY-XXXX"',
                               commit=commit)
+
+    def _iter_inner_patch_hunk_lines(self, newpatch):
+        """Yield (lineno, raw) for each newly introduced hunk content line in a .patch file.
+
+        Reads from the outer diff's added lines so we check exactly what the
+        submission introduces, regardless of what may already exist on disk.
+        lineno is 1-based among the added lines of the inner patch content.
+        """
+        # Collect inner patch lines from the outer diff's '+' lines.
+        # '++++ b/file' (outer '+' + inner '+++ b/file') starts with '+++' and is
+        # excluded, but in_hunk will already be False from the preceding '--- ' line.
+        inner_lines = []
+        for line in str(newpatch).splitlines(keepends=True):
+            if line.startswith('+') and not line.startswith('+++ '):
+                inner_lines.append(line[1:])
+
+        in_hunk = False
+        for lineno, raw in enumerate(inner_lines, start=1):
+            if raw.startswith('diff --git') or raw.startswith('--- ') or raw.startswith('+++ ') or raw.startswith('index '):
+                in_hunk = False
+            elif raw.rstrip('\n\r') in ('-- ', '--'):
+                # git format-patch email signature separator; nothing after this is hunk content
+                in_hunk = False
+            elif raw.startswith('@@ '):
+                in_hunk = True
+            elif in_hunk:
+                yield lineno, raw
+
+    def test_patch_malformed_context(self):
+        for newpatch in TestPatch.newpatches:
+            bad_linenos = []
+            for lineno, raw in self._iter_inner_patch_hunk_lines(newpatch):
+                # git strips trailing whitespace from blank context lines, leaving bare '\n'
+                if raw.rstrip('\n\r') and not raw.startswith((' ', '+', '-', '\\')):
+                    bad_linenos.append(lineno)
+            if bad_linenos:
+                self.fail(
+                    'Malformed patch line: context line is missing its leading space prefix',
+                    data=[
+                        ('Patch', os.path.basename(newpatch.path)),
+                        ('Lines', _format_line_numbers(bad_linenos)),
+                    ],
+                )
+
+    def test_patch_trailing_whitespace(self):
+        for newpatch in TestPatch.newpatches:
+            for lineno, raw in self._iter_inner_patch_hunk_lines(newpatch):
+                if raw.startswith('+') and raw.rstrip('\n\r') != raw.rstrip():
+                    self.fail(
+                        'Trailing whitespace in added line',
+                        data=[
+                            ('Patch', os.path.basename(newpatch.path)),
+                            ('Line', repr(raw)),
+                        ],
+                    )
-- 
2.54.0


