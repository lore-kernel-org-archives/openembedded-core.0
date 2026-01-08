Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8783ED1D467
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 14:46:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7897.1767883555188947551
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 06:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nNqp8HvV;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A16AC4E42000
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 14:45:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77544606B6
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 14:45:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C83CD103C889C;
	Thu,  8 Jan 2026 15:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767883553; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yKvrYZXW45CuR9HQEAxsa6T/6j/9KXxxfAJGLIaZPbI=;
	b=nNqp8HvV4fUwLmxrtHD2wTsz5K4IqRUnnB1b1tvkHpoXjzk90mGgTtYEIyY9QARTHs4z6u
	zhdznTn4IVjYM0NG1RJDRzdOCAPlkJ5tcRphs0iweHXRT7Rg1wBZVXJ0eLTNZlAxesnYLV
	bS5LJYVrnISVJLSXGkUzAx/CEdn2y+WdtXR+TMBL5UjMOOwSdNPU+3V8zqwPpQpcy4oPsq
	qxEFP64yPMhA8vt4v5vSydgxzCS+J2lpg3vSR9nM0XvDYBtEZUYgoN5MU1hoh3q33ZzXMJ
	I6OwmygLexRXwoxwxn/gMtwd1g1LutfC54DXar/TQmVNod9Zw+nw4TucyHhFAg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Thu, 08 Jan 2026 15:45:42 +0100
Subject: [PATCH v2 1/2] oeqa/gitarchive: Fix git push URL parameter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-mathieu-fix-15696-v2-1-fbb0967fdfed@bootlin.com>
References: <20260108-mathieu-fix-15696-v2-0-fbb0967fdfed@bootlin.com>
In-Reply-To: <20260108-mathieu-fix-15696-v2-0-fbb0967fdfed@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767883551; l=5056;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=IoBterGziLtZjEx6nV335LYdMsx6tmwPjLWoM/ERy84=;
 b=ieAP5CaKE42bDakUI6s6vgZuiZ88zoVjWJqWJ3uY14IIX3b79/fjtVttt3lZnxFM3+anzibpH
 Mwrku0mthUVCwbVsBx3xQvC7wrpG0sWYv3mdGeFbH7mzRFH3LbHv4UW
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 14:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229079

The gitarchive() function takes a `push` parameter than can be either a
boolean or a string. But this parameter is then passed to
expand_tag_strings(), which clearly expect it to be a string if it is
defined. Split this in two arguments: a `push` boolean value and a
`push_remote` optional string.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/lib/oeqa/selftest/cases/gitarchivetests.py | 4 ++--
 meta/lib/oeqa/utils/gitarchive.py               | 8 ++++----
 scripts/lib/resulttool/store.py                 | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gitarchivetests.py b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
index 71382089c124..dcf0eb3be569 100644
--- a/meta/lib/oeqa/selftest/cases/gitarchivetests.py
+++ b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
@@ -74,7 +74,7 @@ class GitArchiveTests(OESelftestTestCase):
                               "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
                               False, "{branch}/{commit_count}-g{commit}/{tag_number}",
                               'Test run #{tag_number} of {branch}:{commit}', '',
-                              [], [], False, keywords, logger)
+                              [], [], False, None, keywords, logger)
         self.assertTrue(tag_exists(git_obj, target_tag), msg=f"Tag {target_tag} has not been created")
         delete_fake_repository(path)
 
@@ -88,7 +88,7 @@ class GitArchiveTests(OESelftestTestCase):
                               "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
                               False, "{branch}/{commit_count}-g{commit}/{tag_number}",
                               'Test run #{tag_number} of {branch}:{commit}', '',
-                              [], [], False, keywords, logger)
+                              [], [], False, None, keywords, logger)
         self.assertTrue(tag_exists(git_obj, second_tag), msg=f"Second tag {second_tag} has not been created")
         delete_fake_repository(path)
 
diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index 7e1d5057482f..6ec17d36958c 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -162,7 +162,7 @@ def expand_tag_strings(repo, name_pattern, msg_subj_pattern, msg_body_pattern,
     msg_body = format_str(msg_body_pattern, keyws)
     return tag_name, msg_subj + '\n\n' + msg_body
 
-def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_msg_body, branch_name, no_tag, tagname, tag_msg_subject, tag_msg_body, exclude, notes, push, keywords, log):
+def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_msg_body, branch_name, no_tag, tagname, tag_msg_subject, tag_msg_body, exclude, notes, push, push_remote, keywords, log):
 
     if not os.path.isdir(data_dir):
         raise ArchiveError("Not a directory: {}".format(data_dir))
@@ -179,7 +179,7 @@ def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_ms
         tag_name, tag_msg = expand_tag_strings(data_repo, tagname,
                                                tag_msg_subject,
                                                tag_msg_body,
-                                               push, log, keywords)
+                                               push_remote, log, keywords)
 
     # Commit data
     commit = git_commit_data(data_repo, data_dir, branch_name,
@@ -195,10 +195,10 @@ def gitarchive(data_dir, git_dir, no_create, bare, commit_msg_subject, commit_ms
         cmd = ['push', '--tags']
         # If no remote is given we push with the default settings from
         # gitconfig
-        if push is not True:
+        if push_remote is not None:
             notes_refs = ['refs/notes/' + ref.format(branch_name=branch_name)
                            for ref, _ in notes]
-            cmd.extend([push, branch_name] + notes_refs)
+            cmd.extend([push_remote, branch_name] + notes_refs)
         log.info("Pushing data to remote")
         data_repo.run_cmd(cmd)
 
diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index b143334e699d..f3caafaff822 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -82,7 +82,7 @@ def store(args, logger):
                                   "Results of {branch}:{commit}", "branch: {branch}\ncommit: {commit}", "{branch}",
                                   False, "{branch}/{commit_count}-g{commit}/{tag_number}",
                                   'Test run #{tag_number} of {branch}:{commit}', '',
-                                  excludes, [], False, keywords, logger)
+                                  excludes, [], False, None, keywords, logger)
 
             if args.logfile_archive:
                 logdir = args.logfile_archive + "/" + tagname

-- 
2.47.3


