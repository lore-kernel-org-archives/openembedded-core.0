Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BE0E6E7E2
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13482.1770113964677189919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FW5/IoGa;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so5838005e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113963; x=1770718763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abGix7wqEF/44PiODwmOhMpUoWajaKppLHWRZpZavOU=;
        b=FW5/IoGaZzlOPTNNWU56B8YIPdRuCVr82CQXnwR/F2OGr1H5CskhH38npIePUYs7fk
         bCFvqmdsA4hU2aiARR/BF+uZ4opg8LI9dxGqxCGVhkZBXK/dN7ev3v+s6+5W/eHdzOSZ
         t9yGU5GQA2aUBSi1hAtnl52VMwOmKt5niwlAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113963; x=1770718763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=abGix7wqEF/44PiODwmOhMpUoWajaKppLHWRZpZavOU=;
        b=ErwFQjzzb5oU2IL2ybPYBEqKQQ5VAXqUOkTJxB9Oa4unS3YiV+RZNFq/J7hx7Vemwg
         7rku00ctHBe2AuZBxRbl2tXO5TkkguY+u7as+iQ22kbM/mFsps5Ybv3TFbbllUemQtzC
         66saCUIfxxG8y5HmLTVPuY3MnAKXO3TU9mLCpaw62ppmR4jxJIUe0XEwpAsM45vu1rQy
         eXOdldspz9HOvpSPFmIUOhT0oVDe+9p0GZvgMbbUO8arPXjDLaKEvP1HbIj8nlh2Otd6
         83FQSNlmwrHW2/nRYi5F8z0ZwyZ0rgoNbWcDi5dbtz8JK4JGh0XQDz7R0gpPvrfAwqaX
         +d8Q==
X-Gm-Message-State: AOJu0Yx+2gZMnIZydDU8uKWON++7A75y65y8fyQaVeMgtbjaydy3qQSQ
	D9y/XL8tMwzxnP/7a6tuw8BIi/vGdOWO5o73S4L8GChg3SUhyndGdfAH+lQkKiypCS31VNk3rwG
	ZgZmmXsc=
X-Gm-Gg: AZuq6aJIkt3L1ed9G5GeSuen3idF/6tB3hwY/PGHX+Ndk720bpn4FGHUbvXr1NDq1jx
	o2xhpBasL1fO93yJNjvvB/GTR4Y96j5HxOgPNC/Hqyrq8I2C7MnbCx+sTzfO+i8+mUBBYuNot9d
	hLuQieKDrOAJx6CPQfRyH81ivkjlfziTlnKTZKQRgy+IIRCLUEXRq9/tvQWgs0vdX6GXTmbBCAr
	D+LsuLpIw2ZrDF5ESRJaqRaK5kL9BHgWqCKSGK/0SgShcMr9uh9CrLVI0XRqmoTb9IurmdnrGXE
	QHWdPMdIzHlIccpHlj9xNpt4uT+nUGJPSEIADqr9lBaMRcAquLtHTLGrrszi1Gj6Jwq6KGTz3MU
	RSeEcYObqGnfZwJZGu1HAEL7/JgIl55Ai5WR/Zx8faIYPwnfcJ9LM7h8SKEiKKvbhzFbVInPl/x
	aQBUmIAwho67wdcP/KF6bsv6VLfhrpQl3EQ6BIXZ6WPfdmkdrst1d8dETMlZksI4mtIHoClOX3j
	kp6Gowv4DjqBiUJGwHdtRNqhA==
X-Received: by 2002:a05:600c:8718:b0:477:9e0c:f59 with SMTP id 5b1f17b1804b1-48305133282mr33271895e9.2.1770113962532;
        Tue, 03 Feb 2026 02:19:22 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:22 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 01/22] oeqa/gitarchive: Fix git push URL parameter
Date: Tue,  3 Feb 2026 11:16:30 +0100
Message-ID: <6358b08df27aa2f8f109fc2ab9ad5026d59c7051.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230429

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

The gitarchive() function takes a `push` parameter than can be either a
boolean or a string. But this parameter is then passed to
expand_tag_strings(), which clearly expect it to be a string if it is
defined. Split this in two arguments: a `push` boolean value and a
`push_remote` optional string.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 024f08629feeec8198d1e489633e475959754cfe)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/gitarchivetests.py | 4 ++--
 meta/lib/oeqa/utils/gitarchive.py               | 8 ++++----
 scripts/lib/resulttool/store.py                 | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gitarchivetests.py b/meta/lib/oeqa/selftest/cases/gitarchivetests.py
index 71382089c12..dcf0eb3be56 100644
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
index 7e1d5057482..6ec17d36958 100644
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
index b143334e699..f3caafaff82 100644
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

