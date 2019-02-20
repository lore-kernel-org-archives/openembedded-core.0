Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id AD3B97CB01
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 21:39:55 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id n2so15559004wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 13:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IRdkSmf2Soi89yPGbzw+lOL/MEElJa2AvkrO4HN5WRw=;
	b=AbAvF9Q8l03q2Fq0dThhxZoy/nbFRR+JF+HJwtv1kpX7aX44NgOVdex2/lqaKoZu1g
	kgvFrISf/rGfIVr9xdHWg623zS2hnm7AHiQWiDq4k119twtQ9q8x9oRqMhvhbhwo7qwJ
	2EoxCx8jF1OR8IEsVpSfLLzn1E31DOknA0UvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IRdkSmf2Soi89yPGbzw+lOL/MEElJa2AvkrO4HN5WRw=;
	b=llIEQYssz9gl4i5cxWkKuLMgM1+DYgiXdirjALcpNlqweDkd6kiGzi8sIDqhSCyCU6
	boCTvHSw6R7uOw2BwLuPv4KcFXHFK8Do8buccQqyGS1MYm1vKwNUaUxT8OaXG+fVFLhY
	FI2CAGa302w4MpuuobgMEHKa7haTqYbpcyYl7Lhl2Gm6ReWDZSZfktao4Y/ME+qWiF6b
	epL8VL/fBFozo3P6tteIel5qTBtJPIM59tLZdfkrrJ3Sz8bc6yug9Q2WtJgj7004jUfM
	/IbaMhp8Sr8760hH7gCekwsYBYXRfZeFWnxo6d2647v5XuctvXa22UXfq+tN0k2ebbIZ
	EZhA==
X-Gm-Message-State: AHQUAuYn7Wf6Zk4Btc0YfVBoktUu0FaIlhWUkq3/Bz8mF7qZIOvkqoUm
	F3NF2q91G4xE1Abf/wqWZj9GmXMC2b0=
X-Google-Smtp-Source: AHgI3Ias7x09jXleUo3kxnPfdPqd8C58hrRITh6vx0EkRiCjm5y6CtK2Rgy6vG3e/8uUQF6DRePdtw==
X-Received: by 2002:a5d:6a88:: with SMTP id s8mr23912255wru.303.1550698795740; 
	Wed, 20 Feb 2019 13:39:55 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k6sm13243581wrq.82.2019.02.20.13.39.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 13:39:55 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 21:39:51 +0000
Message-Id: <20190220213951.9462-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190220213951.9462-1-richard.purdie@linuxfoundation.org>
References: <20190220213951.9462-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] oe-build-perf-report/gitarchive: Move common useful functions to library
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2019 21:39:55 -0000
Content-Transfer-Encoding: 8bit

These functions can be reused by the resulttool code so move to the common
function library for this purpose.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/gitarchive.py | 71 ++++++++++++++++++++++++
 scripts/oe-build-perf-report      | 90 ++++---------------------------
 2 files changed, 81 insertions(+), 80 deletions(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index fddd608593a..ff614d06bbf 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -17,6 +17,8 @@
 import os
 import re
 import sys
+from operator import attrgetter
+from collections import namedtuple
 from oeqa.utils.git import GitRepo, GitError
 
 class ArchiveError(Exception):
@@ -171,3 +173,72 @@ def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_ms
         log.info("Pushing data to remote")
         data_repo.run_cmd(cmd)
 
+# Container class for tester revisions
+TestedRev = namedtuple('TestedRev', 'commit commit_number tags')
+
+def get_test_runs(log, repo, tag_name, **kwargs):
+    """Get a sorted list of test runs, matching given pattern"""
+    # First, get field names from the tag name pattern
+    field_names = [m.group(1) for m in re.finditer(r'{(\w+)}', tag_name)]
+    undef_fields = [f for f in field_names if f not in kwargs.keys()]
+
+    # Fields for formatting tag name pattern
+    str_fields = dict([(f, '*') for f in field_names])
+    str_fields.update(kwargs)
+
+    # Get a list of all matching tags
+    tag_pattern = tag_name.format(**str_fields)
+    tags = repo.run_cmd(['tag', '-l', tag_pattern]).splitlines()
+    log.debug("Found %d tags matching pattern '%s'", len(tags), tag_pattern)
+
+    # Parse undefined fields from tag names
+    str_fields = dict([(f, r'(?P<{}>[\w\-.()]+)'.format(f)) for f in field_names])
+    str_fields['branch'] = r'(?P<branch>[\w\-.()/]+)'
+    str_fields['commit'] = '(?P<commit>[0-9a-f]{7,40})'
+    str_fields['commit_number'] = '(?P<commit_number>[0-9]{1,7})'
+    str_fields['tag_number'] = '(?P<tag_number>[0-9]{1,5})'
+    # escape parenthesis in fields in order to not messa up the regexp
+    fixed_fields = dict([(k, v.replace('(', r'\(').replace(')', r'\)')) for k, v in kwargs.items()])
+    str_fields.update(fixed_fields)
+    tag_re = re.compile(tag_name.format(**str_fields))
+
+    # Parse fields from tags
+    revs = []
+    for tag in tags:
+        m = tag_re.match(tag)
+        groups = m.groupdict()
+        revs.append([groups[f] for f in undef_fields] + [tag])
+
+    # Return field names and a sorted list of revs
+    return undef_fields, sorted(revs)
+
+def get_test_revs(log, repo, tag_name, **kwargs):
+    """Get list of all tested revisions"""
+    fields, runs = get_test_runs(log, repo, tag_name, **kwargs)
+
+    revs = {}
+    commit_i = fields.index('commit')
+    commit_num_i = fields.index('commit_number')
+    for run in runs:
+        commit = run[commit_i]
+        commit_num = run[commit_num_i]
+        tag = run[-1]
+        if not commit in revs:
+            revs[commit] = TestedRev(commit, commit_num, [tag])
+        else:
+            assert commit_num == revs[commit].commit_number, "Commit numbers do not match"
+            revs[commit].tags.append(tag)
+
+    # Return in sorted table
+    revs = sorted(revs.values(), key=attrgetter('commit_number'))
+    log.debug("Found %d tested revisions:\n    %s", len(revs),
+              "\n    ".join(['{} ({})'.format(rev.commit_number, rev.commit) for rev in revs]))
+    return revs
+
+def rev_find(revs, attr, val):
+    """Search from a list of TestedRev"""
+    for i, rev in enumerate(revs):
+        if getattr(rev, attr) == val:
+            return i
+    raise ValueError("Unable to find '{}' value '{}'".format(attr, val))
+
diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index af4f0469f6b..f6fb458c2eb 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -37,58 +37,18 @@ from buildstats import BuildStats, diff_buildstats, BSVerDiff
 scriptpath.add_oe_lib_path()
 
 from oeqa.utils.git import GitRepo, GitError
+import oeqa.utils.gitarchive as gitarchive
 
 
 # Setup logging
 logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
 log = logging.getLogger('oe-build-perf-report')
 
-
-# Container class for tester revisions
-TestedRev = namedtuple('TestedRev', 'commit commit_number tags')
-
-
-def get_test_runs(repo, tag_name, **kwargs):
-    """Get a sorted list of test runs, matching given pattern"""
-    # First, get field names from the tag name pattern
-    field_names = [m.group(1) for m in re.finditer(r'{(\w+)}', tag_name)]
-    undef_fields = [f for f in field_names if f not in kwargs.keys()]
-
-    # Fields for formatting tag name pattern
-    str_fields = dict([(f, '*') for f in field_names])
-    str_fields.update(kwargs)
-
-    # Get a list of all matching tags
-    tag_pattern = tag_name.format(**str_fields)
-    tags = repo.run_cmd(['tag', '-l', tag_pattern]).splitlines()
-    log.debug("Found %d tags matching pattern '%s'", len(tags), tag_pattern)
-
-    # Parse undefined fields from tag names
-    str_fields = dict([(f, r'(?P<{}>[\w\-.()]+)'.format(f)) for f in field_names])
-    str_fields['branch'] = r'(?P<branch>[\w\-.()/]+)'
-    str_fields['commit'] = '(?P<commit>[0-9a-f]{7,40})'
-    str_fields['commit_number'] = '(?P<commit_number>[0-9]{1,7})'
-    str_fields['tag_number'] = '(?P<tag_number>[0-9]{1,5})'
-    # escape parenthesis in fields in order to not messa up the regexp
-    fixed_fields = dict([(k, v.replace('(', r'\(').replace(')', r'\)')) for k, v in kwargs.items()])
-    str_fields.update(fixed_fields)
-    tag_re = re.compile(tag_name.format(**str_fields))
-
-    # Parse fields from tags
-    revs = []
-    for tag in tags:
-        m = tag_re.match(tag)
-        groups = m.groupdict()
-        revs.append([groups[f] for f in undef_fields] + [tag])
-
-    # Return field names and a sorted list of revs
-    return undef_fields, sorted(revs)
-
 def list_test_revs(repo, tag_name, verbosity, **kwargs):
     """Get list of all tested revisions"""
     valid_kwargs = dict([(k, v) for k, v in kwargs.items() if v is not None])
 
-    fields, revs = get_test_runs(repo, tag_name, **valid_kwargs)
+    fields, revs = gitarchive.get_test_runs(log, repo, tag_name, **valid_kwargs)
     ignore_fields = ['tag_number']
     if verbosity < 2:
         extra_fields = ['COMMITS', 'TEST RUNS']
@@ -133,36 +93,6 @@ def list_test_revs(repo, tag_name, verbosity, **kwargs):
 
     print_table(rows)
 
-def get_test_revs(repo, tag_name, **kwargs):
-    """Get list of all tested revisions"""
-    fields, runs = get_test_runs(repo, tag_name, **kwargs)
-
-    revs = {}
-    commit_i = fields.index('commit')
-    commit_num_i = fields.index('commit_number')
-    for run in runs:
-        commit = run[commit_i]
-        commit_num = run[commit_num_i]
-        tag = run[-1]
-        if not commit in revs:
-            revs[commit] = TestedRev(commit, commit_num, [tag])
-        else:
-            assert commit_num == revs[commit].commit_number, "Commit numbers do not match"
-            revs[commit].tags.append(tag)
-
-    # Return in sorted table
-    revs = sorted(revs.values(), key=attrgetter('commit_number'))
-    log.debug("Found %d tested revisions:\n    %s", len(revs),
-              "\n    ".join(['{} ({})'.format(rev.commit_number, rev.commit) for rev in revs]))
-    return revs
-
-def rev_find(revs, attr, val):
-    """Search from a list of TestedRev"""
-    for i, rev in enumerate(revs):
-        if getattr(rev, attr) == val:
-            return i
-    raise ValueError("Unable to find '{}' value '{}'".format(attr, val))
-
 def is_xml_format(repo, commit):
     """Check if the commit contains xml (or json) data"""
     if repo.rev_parse(commit + ':results.xml'):
@@ -578,11 +508,11 @@ def main(argv=None):
     if not args.hostname:
         auto_args(repo, args)
 
-    revs = get_test_revs(repo, args.tag_name, hostname=args.hostname,
-                         branch=args.branch, machine=args.machine)
+    revs = gitarchive.get_test_revs(log, repo, args.tag_name, hostname=args.hostname,
+                                    branch=args.branch, machine=args.machine)
     if args.branch2:
-        revs2 = get_test_revs(repo, args.tag_name, hostname=args.hostname,
-                             branch=args.branch2, machine=args.machine)
+        revs2 = gitarchive.get_test_revs(log, repo, args.tag_name, hostname=args.hostname,
+                                         branch=args.branch2, machine=args.machine)
         if not len(revs2):
             log.error("No revisions found to compare against")
             return 1
@@ -598,9 +528,9 @@ def main(argv=None):
     if args.commit:
         if args.commit_number:
             log.warning("Ignoring --commit-number as --commit was specified")
-        index1 = rev_find(revs, 'commit', args.commit)
+        index1 = gitarchive.rev_find(revs, 'commit', args.commit)
     elif args.commit_number:
-        index1 = rev_find(revs, 'commit_number', args.commit_number)
+        index1 = gitarchive.rev_find(revs, 'commit_number', args.commit_number)
     else:
         index1 = len(revs) - 1
 
@@ -612,9 +542,9 @@ def main(argv=None):
     if args.commit2:
         if args.commit_number2:
             log.warning("Ignoring --commit-number2 as --commit2 was specified")
-        index2 = rev_find(revs, 'commit', args.commit2)
+        index2 = gitarchive.rev_find(revs, 'commit', args.commit2)
     elif args.commit_number2:
-        index2 = rev_find(revs, 'commit_number', args.commit_number2)
+        index2 = gitarchive.rev_find(revs, 'commit_number', args.commit_number2)
     else:
         if index1 > 0:
             index2 = index1 - 1
-- 
2.20.1


