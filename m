Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D18D79742
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5098.1769846216976006786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:56:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=R2NjR9d/;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so22723505e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846215; x=1770451015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abGix7wqEF/44PiODwmOhMpUoWajaKppLHWRZpZavOU=;
        b=R2NjR9d/k2wlXzXWX2kZs/YmXqtr/LWR99hogsAvTIn+AKI9xq7WwC4t8O6ti0ksQC
         EgELj3mCTO1GzYNP0aTSWwDOt8299JVQl1Q9IBDMUejxY/tx6vt4cXeO3FA1lODQG8Z2
         S5upnJocJKBOA1IQMHSiS8JRuQiBRqNgOaBys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846215; x=1770451015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=abGix7wqEF/44PiODwmOhMpUoWajaKppLHWRZpZavOU=;
        b=kwrvRMKIkrPT2+i7LdqHgMjtvdbmhiZdeG+4j2+/9NqevgzkyNmozG2zMOb/rCdxzp
         CsqoyVrlYF1PpLwiNORb2W5Iz+Jf2danZSGDLbsOFhVgOc0Dkq6ZiI5PcHlgICkzQ+EP
         JbI+E4jGPfKP4kgmuPMgTLrgyhymOpg81pKftqD07ezlYr0qruE35STc6CxGuPFzfeZA
         34T4NvqxeJkif0qdQaLQiCLKkGc9jVfd1vyaazmgnG62sCDIMu8+UTbgIH+m0Q94Ex/L
         Oc+c2HpKW3sCmfZUhdPqdoBs6r/br0rlngwNPIl7fZC4L+HOJFbj1TeP39dVDSlfdt6o
         uuHw==
X-Gm-Message-State: AOJu0YxoOzXN+CyTfEBN2yEYqyYOSNPLYKbWY11mofgwYWxiLjLHa+Zh
	yRnL/D0qI/FA8r83MxAqewmjHNmUnrg1cgxvhQ2HS3Yy/J9dVXnxOZurWyLGzVI9wcSRvKPcpRz
	FjHkjBhg=
X-Gm-Gg: AZuq6aIYwB9scjuabsczs1mETaqUrLYna/dkyPKo3inDbaOn01PO697TdeuVqCOGnO/
	tCq0Z8VuEhuAn+IEUTDJXfuOVXsdijH9+cEwKkQeshVNE5lHS31mx7Iop5lX5PkXFztgTAXJGw+
	sqnT/b0dYrbLwD3PFQm6yUs9GXwPqWwmdzwrLlYK7CFwgXS2UMmpQLlH2yPKC2FAtMD6nDmkweQ
	mfd7lRswvZC5Xh76LxyYSuwum7LDvFKGC9MmFDrpKeSQt5GhfO0vIMOEEcXVM88r7ZDTACWySSx
	eS5GjEL4//1VOiZaECHZYRilkxr83tBSZhE75vVgNbwdR4PGcao4jlX/tjdO3ga4b66RkQv5UTq
	koGGFQJgMzbg3HQJGgi62RQDOdMdKkJEM+rXE3a55KsgbcCVZlb5Hr8yTuXAdlHBONzDbO5BbsL
	kVbGdjgglSyTwLJ9NcUiQbclg8A/4Gi9Zc94+MOR5eepec63jBfX1HwIorDp9OGPDgoZYf+L029
	i98At5daTnY6SKvV4Z4czVD7hc=
X-Received: by 2002:a05:600c:8b27:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-482db4997c7mr60045875e9.26.1769846215132;
        Fri, 30 Jan 2026 23:56:55 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.56.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:56:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 01/22] oeqa/gitarchive: Fix git push URL parameter
Date: Sat, 31 Jan 2026 08:56:12 +0100
Message-ID: <6358b08df27aa2f8f109fc2ab9ad5026d59c7051.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230206

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

