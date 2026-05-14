Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64105CD37AC
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 19:42:17 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19887.1778787735159201468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 12:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=h1xZ98LP;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5165195c8b0so5993181cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778787734; x=1779392534; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaEuO4vB9fvomnwny9ZoxO00vZdTDe9DV+z/H/23T+w=;
        b=h1xZ98LPx5Yuzb3fKRlCVd3zYOQx2Z8PIt+O6grtqIQXsMIK5YUD5i0J2omCqFnX2Y
         rVRF+XIhFPmzC4lRB0stO8h7FWgde4IBtkgF6gdu/f2Mbzrlim9AAMe6OeP5kj3nHFj8
         pNbuXfx0DnHu3txPOXt5W61BY0GHmx8gXoEHV0wpwtpFi8kL6bYPpl+lSOonc+faht1e
         gRoYi1hDVb0QIBnCWyRr/Otax+ect4Tm7FAdfSqsJSfL6qMLd8AXWCaSBfoh5kdZ3yBo
         doD8N8kJQBfKUCcO8PBE7Uw81CW9XM+C2RG0zlxZdf50Vp1lf3P9VmNdxYgr3g1Tj0Yo
         jtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787734; x=1779392534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xaEuO4vB9fvomnwny9ZoxO00vZdTDe9DV+z/H/23T+w=;
        b=a7Yo8Zcquc9t2MxzJNGGIerbFMCxog0lHyTPbX7c4rt1TEimt7noxtSGx+xEnAaNly
         R3CRfnsF3nXIiq5fvlntXS+yEvbGunnVfm7aYyCByWDfZxA4EFR46O4Abt7kJ7OyK0py
         ze+bMvmKJ9Qk3XxtMJr/8cmGq2rjJ4WeWUjX0iAKbhdxBPbJ+Pwb1nMKvzFlycr213ct
         BCFGOA6QiVJgjFqh8hfAtEhNpZoNxYB7E3sTqBhMU0nczaRiCK0n+mcS16lCnaVTTRZv
         fze8efDoogkTeeJndHByrAfm8NPMd9vXQh2Jj/6sdgo55VXUdF2R2jBfTm/UlWDoGp6C
         nEXg==
X-Gm-Message-State: AOJu0Yyobkr2kOsDcn6rJNveo6Pll/OmIZTtwoRxVVNlfMcb3rW0IiH8
	xH/Q6sNw0ZG/imoW5FxJwPXNkrYwYm8s10uAELQktYm9HnaZCD1yTLzwzgb2VnrSWGwUpStDqRD
	dtKLdN7g=
X-Gm-Gg: Acq92OErKlq4pi7S6CzoekIrmW64e6EQaqt6sbmx1c7ExPunLDpio0EGnjvpGh+Jk+6
	1GcFx9xUkdzi0NPU3BLzMNT76ksf0y8YDhXlUjJxCNDA3js1Zva48M1eW3y+dfIrD0bgfsAsw+P
	dUO1+tPizsOldb8iqLPeUEaTmovGkKgRwhqVFP1HB2+IDze47KBldOxaFrhH+leeUzuauHISNpi
	Z6ridUFP0bpgzfu/1vdqWE7E4FLR3Lu67N/CDOmhgkepeMzW+kAtEO6uNpA0DN9mJpz4pnxJnS9
	C4ePbK2lm2v/mlM7NO4pUlcktI5cy5ri/8TtuNGYK2OyubdS3BVD64TWkCAJI/XpKiizScbfgtI
	mR9jzKDNSnjlXiMQz08dL2TrTgLfKCPlpR2BXVvf75iYQZpbPCmdeMCL6eVulWa/8zK0mDqda+W
	GWlPahIRAt63ncVSkDPR6oZwgYag==
X-Received: by 2002:a05:622a:1b90:b0:510:1543:31eb with SMTP id d75a77b69052e-5165a2674a2mr10530221cf.53.1778787733504;
        Thu, 14 May 2026 12:42:13 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:537:a9f7:1a84:f246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51645d51f06sm23789471cf.19.2026.05.14.12.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:42:12 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 02/11] patchtest: test series mergeability
Date: Thu, 14 May 2026 15:41:58 -0400
Message-ID: <20260514194207.1958325-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514194207.1958325-1-tgamblin@baylibre.com>
References: <20260514194207.1958325-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 19:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237049

Reintroduce mergeability (or, more technically, applicability) testing
of mbox files. This requires several changes

mbox.py:
- Store the raw mbox data as a variable in the Patch class
- Simplify get_branch() so that it parses each tag in the patch subject
  line individually
- Rework the invalid tag list to help avoid incorrect interpretation of
  project/repo names as branches

repo.py:
- Add check_patches() to step through each patch in the series and test
  whether it applies (using a temporary branch)

test_mbox.py:
- Fix the branch comparison logic in TestMbox so that we don't
  automatically skip patches lacking a branch tag (which is the case for
  the selftest patches). This also adds some flexibility for when
  testing against other branches is desired.
- Add pretest_series_applies_on_branch(), which runs before all other
  tests
- Report the subject line for any patches which fail to merge
- Skip the branch check for detached HEAD case so it still works with CI
  systems
- Remove the unused headlog() function

AI-Generated: Uses Claude Code

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/mbox.py            | 50 ++++++++++-----------------
 meta/lib/patchtest/repo.py            | 44 +++++++++++++++++++++++
 meta/lib/patchtest/tests/test_mbox.py | 40 ++++++++-------------
 3 files changed, 76 insertions(+), 58 deletions(-)

diff --git a/meta/lib/patchtest/mbox.py b/meta/lib/patchtest/mbox.py
index 1d95819b7a..400d73f19f 100644
--- a/meta/lib/patchtest/mbox.py
+++ b/meta/lib/patchtest/mbox.py
@@ -42,6 +42,7 @@ class MboxReader:
 
 class Patch:
     def __init__(self, data):
+        self._raw = data
         self.author = data['From']
         self.to = data['To']
         self.cc = data['Cc']
@@ -66,43 +67,28 @@ class PatchSeries:
         self.branch = self.get_branch()
 
     def get_branch(self):
-        fullprefix = ""
-        pattern = re.compile(r"(\[.*\])", re.DOTALL)
-
-        # There should be at least one patch in the series and it should
-        # include the branch name in the subject, so parse that
-        match = pattern.search(self.patches[0].subject)
-        if match:
-            fullprefix = match.group(1)
-
-        branch, branches, valid_branches = None, [], []
-
-        if fullprefix:
-            prefix = fullprefix.strip('[]')
-            branches = [ b.strip() for b in prefix.split(',')]
-            valid_branches = [b for b in branches if PatchSeries.valid_branch(b)]
-
-        if len(valid_branches):
-            branch = valid_branches[0]
-
-        # Get the branch name excluding any brackets. If nothing was
-        # found, then assume there was no branch tag in the subject line
-        # and that the patch targets master
-        if branch is not None:
-            return branch.split(']')[0]
-        else:
-            return "master"
+        # Parse each [tag] in the subject individually
+        tags = re.findall(r'\[([^\[\]]*)\]', self.patches[0].subject)
+        valid_branches = [t.strip() for t in tags if PatchSeries.valid_branch(t.strip())]
+        return valid_branches[0] if valid_branches else None
 
     @staticmethod
     def valid_branch(branch):
-        """ Check if branch is valid name """
+        """ Check if branch is a valid branch name (not a patch/project tag) """
         lbranch = branch.lower()
 
-        invalid  = lbranch.startswith('patch') or \
-                   lbranch.startswith('rfc') or \
-                   lbranch.startswith('resend') or \
-                   re.search(r'^v\d+', lbranch) or \
-                   re.search(r'^\d+/\d+', lbranch)
+        # Known project/list identifiers that appear in subject prefixes
+        known_projects = {'oe-core', 'bitbake', 'yocto', 'poky'}
+
+        invalid = (
+            lbranch.startswith('patch') or
+            lbranch.startswith('rfc') or
+            lbranch.startswith('resend') or
+            re.search(r'^v\d+', lbranch) or
+            re.search(r'^\d+/\d+', lbranch) or
+            lbranch in known_projects or
+            lbranch.startswith('meta-')
+        )
 
         return not invalid
 
diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
index 6a7d7d2d3b..29ce9062a4 100644
--- a/meta/lib/patchtest/repo.py
+++ b/meta/lib/patchtest/repo.py
@@ -10,6 +10,8 @@
 
 import git
 import os
+import tempfile
+import time
 import mbox
 
 class PatchTestRepo(object):
@@ -79,6 +81,48 @@ class PatchTestRepo(object):
 
         return None
 
+    def check_patches(self):
+        """Try applying each patch in the series sequentially on a temporary branch.
+
+        Returns a list of (subject, applied, error_message) tuples, one per patch.
+        Patches are applied in order so that each result reflects the cumulative
+        state, matching how the series would land in the real repository.
+        """
+        results = []
+        temp_branch = '%s_check' % self._workingbranch
+        self.repo.git.execute(['git', 'checkout', '-B', temp_branch, self._commit])
+        try:
+            for patch in self.patch.patches:
+                # Prepend a From_ separator so git-am recognises the file as mbox
+                from_line = (
+                    b'From patchtest@patchtest '
+                    + time.strftime('%a %b %d %H:%M:%S %Y', time.gmtime()).encode()
+                    + b'\n'
+                )
+                with tempfile.NamedTemporaryFile(mode='wb', suffix='.patch', delete=False) as f:
+                    f.write(from_line + patch._raw.as_bytes())
+                    tmpfile = f.name
+                try:
+                    self.repo.git.execute(
+                        ['git', 'am', '--keep-cr', tmpfile], with_exceptions=True
+                    )
+                    results.append((patch.subject, True, None))
+                except git.exc.GitCommandError as e:
+                    results.append((patch.subject, False, str(e)))
+                    try:
+                        self.repo.git.execute(['git', 'am', '--abort'])
+                    except git.exc.GitCommandError:
+                        pass
+                finally:
+                    os.remove(tmpfile)
+        finally:
+            self.repo.git.execute(['git', 'checkout', self._workingbranch])
+            try:
+                self.repo.git.execute(['git', 'branch', '-D', temp_branch])
+            except git.exc.GitCommandError:
+                pass
+        return results
+
     def merge(self):
         if self._patchcanbemerged:
             self.repo.git.execute(['git', '-C', self.repodir, 'am', '--keep-cr', os.path.abspath(self.patch.path)])
diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index 5cf02af7bd..55d1068df3 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -9,17 +9,8 @@ import collections
 import patchtest_patterns
 import pyparsing
 import re
-import subprocess
 from patchtest_parser import PatchtestParser
 
-def headlog():
-    output = subprocess.check_output(
-        "cd %s; git log --pretty='%%h#%%aN#%%cD:#%%s' -1" % PatchtestParser.repodir,
-        universal_newlines=True,
-        shell=True
-        )
-    return output.split('#')
-
 class TestMbox(base.Base):
 
     # base paths of main yocto project sub-projects
@@ -82,26 +73,23 @@ class TestMbox(base.Base):
                     commit=commit,
                 )
 
-    def test_series_merge_on_head(self):
-        self.skip("Merge test is disabled for now")
-        if PatchtestParser.repo.patch.branch != "master":
+    def pretest_series_applies_on_branch(self):
+        repo = PatchtestParser.repo
+        target_branch = repo.patch.branch
+        current_branch = repo.current_branch
+
+        if target_branch is not None and current_branch and target_branch != current_branch:
             self.skip(
-                "Skipping merge test since patch is not intended"
-                " for master branch. Target detected is %s"
-                % PatchtestParser.repo.patch.branch
+                "Patch targets branch '%s' but testing against '%s'"
+                % (target_branch, current_branch)
             )
-        if not PatchtestParser.repo.canbemerged():
-            commithash, author, date, shortlog = headlog()
+
+        results = repo.check_patches()
+        failures = [(subject, err) for subject, applied, err in results if not applied]
+        if failures:
             self.fail(
-                "Series does not apply on top of target branch %s"
-                % PatchtestParser.repo.patch.branch,
-                data=[
-                    (
-                        "Targeted branch",
-                        "%s (currently at %s)"
-                        % (PatchtestParser.repo.patch.branch, commithash),
-                    )
-                ],
+                'One or more patches in the series do not apply cleanly',
+                data=[('Patch', subject) for subject, _ in failures],
             )
 
     def test_target_mailing_list(self):
-- 
2.54.0


