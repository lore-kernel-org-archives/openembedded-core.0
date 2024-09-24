Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650E3CF9C73
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 11:55:13 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.11951.1727178908883048148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 04:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=jftmYKYG;
 spf=pass (domain: baylibre.com, ip: 209.85.160.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-45821ebb4e6so42505481cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 04:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727178908; x=1727783708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2xcCZjVXrd1YDkgwIv49FDjlGlColOeW4xtpKRV0dM=;
        b=jftmYKYG88N0PCTX6TE3vHu8p3PjQIyNoWLN55bTKcrc7OdLMLKS68DIXaQ+xo+M/r
         B5dJzBExmu2wxFA1Dow5Pi6JAnzAlFdb5z4CVa+Ch4no7YIaI6V7xOq/0PY52ucOpFuV
         yxAfEsZwdaTfsKgzGCIESCGMV8rf0i3/yyFjeoQIdOe4vAVH9B4a3mn7QJRvomcEvx8U
         fGhYtnu9nHQbyltSyOMCPaOv5ZtW5go3VOnvdX0A80k4P9snqsQ8wJU0tTCaAYg/ReK2
         sFV3ZhSLT1dBGC/Qus6sqVKlmYXSbOR7sRpfhsNLaiJcCeGnMpifhOtqS7JUCagidtYa
         TbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727178908; x=1727783708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2xcCZjVXrd1YDkgwIv49FDjlGlColOeW4xtpKRV0dM=;
        b=C2ALbS8Nf+ha4Jf7ptgy5l7W90wSjCQMEu8lRQt/zgEoYfFLUn3iU8s2EvixIPIc7k
         MaXCWdDmXDaPDNWMLhLmBwHlUlHgYzgwiTQszlYF19LkpewxP4DcQ+H5VbGJ9YlNjsg9
         6ramiZ5nyYd35yuvKoKWZhrH2WUD33xlX2L/VmhqxozBXUWgXuBtrNq8wxqOKlhl+url
         3PIa6S+rBPFTG9y5hLqqawJ2wxmk9ezCsOijV8PBEyHs6f8vSrHwFC9gi11vu1f4aPLY
         0eBhXAy34AbhWnKfUZKFz+Fzrxbv98Hp7bxArLvaQSEr2An5l6mpkGZkGd0CsirjtN2N
         1HiA==
X-Gm-Message-State: AOJu0YywrjXA1+CNpL0zMWNMb3n6kOyuUtIdJZvuRAX4ZwTNIXxKJLC8
	hNFrLhq6TH/OhHX9hOGCUApHJVTlNTn/DI3pC3VKx2+YPmUESILeQ7agG9Ci1u8EchZcjhbDcqA
	1z2Q=
X-Google-Smtp-Source: AGHT+IENf1OTghp0wwW3fNHpf2ueIDPgkvvkeGwzd1NZWAYG3iihxlsvmORjWoKFNmTjV9Pc2drJzg==
X-Received: by 2002:ac8:5fd0:0:b0:457:cbf6:ec80 with SMTP id d75a77b69052e-45b228cee82mr253039581cf.43.1727178907590;
        Tue, 24 Sep 2024 04:55:07 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b525456d3sm5553611cf.13.2024.09.24.04.55.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:55:07 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/6] patchtest: test_mbox: change ismerged -> canbemerged
Date: Tue, 24 Sep 2024 07:55:00 -0400
Message-Id: <20240924115503.1599651-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924115503.1599651-1-tgamblin@baylibre.com>
References: <20240924115503.1599651-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204853

The merge logic is a bit weird as-is. Remove the ismerged() method and
replace it where appropriate with canbemerged().

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_mbox.py | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_mbox.py b/meta/lib/patchtest/tests/test_mbox.py
index e6b8ad21f80..895ffde42b0 100644
--- a/meta/lib/patchtest/tests/test_mbox.py
+++ b/meta/lib/patchtest/tests/test_mbox.py
@@ -43,7 +43,7 @@ class TestMbox(base.Base):
 
 
     def test_signed_off_by_presence(self):
-        for commit in TestMbox.commits:
+        for commit in self.commits:
             # skip those patches that revert older commits, these do not required the tag presence
             if patterns.mbox_revert_shortlog_regex.search_string(commit.shortlog):
                 continue
@@ -52,7 +52,7 @@ class TestMbox(base.Base):
                           commit=commit)
 
     def test_shortlog_format(self):
-        for commit in TestMbox.commits:
+        for commit in self.commits:
             shortlog = commit.shortlog
             if not shortlog.strip():
                 self.skip('Empty shortlog, no reason to execute shortlog format test')
@@ -67,7 +67,7 @@ class TestMbox(base.Base):
                               commit=commit)
 
     def test_shortlog_length(self):
-        for commit in TestMbox.commits:
+        for commit in self.commits:
             # no reason to re-check on revert shortlogs
             shortlog = re.sub('^(\[.*?\])+ ', '', commit.shortlog)
             if shortlog.startswith('Revert "'):
@@ -79,22 +79,24 @@ class TestMbox(base.Base):
 
     def test_series_merge_on_head(self):
         self.skip("Merge test is disabled for now")
-        if PatchTestInput.repo.branch != "master":
-            self.skip("Skipping merge test since patch is not intended for master branch. Target detected is %s" % PatchTestInput.repo.branch)
-        if not PatchTestInput.repo.ismerged:
+        if PatchTestInput.repo.patch.branch != "master":
+            self.skip(
+                "Skipping merge test since patch is not intended"
+                " for master branch. Target detected is %s"
+                % PatchTestInput.repo.patch.branch
+            )
+        if not PatchTestInput.repo.canbemerged:
             commithash, author, date, shortlog = headlog()
             self.fail('Series does not apply on top of target branch %s' % PatchTestInput.repo.branch,
                       data=[('Targeted branch', '%s (currently at %s)' % (PatchTestInput.repo.branch, commithash))])
 
     def test_target_mailing_list(self):
-        """In case of merge failure, check for other targeted projects"""
-        if PatchTestInput.repo.ismerged:
-            self.skip('Series merged, no reason to check other mailing lists')
+        """Check for other targeted projects"""
 
         # a meta project may be indicted in the message subject, if this is the case, just fail
         # TODO: there may be other project with no-meta prefix, we also need to detect these
         project_regex = pyparsing.Regex("\[(?P<project>meta-.+)\]")
-        for commit in TestMbox.commits:
+        for commit in self.commits:
             match = project_regex.search_string(commit.subject)
             if match:
                 self.fail('Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists',
@@ -122,7 +124,7 @@ class TestMbox(base.Base):
                       data=[('Diff line',self.unidiff_parse_error)])
 
     def test_commit_message_presence(self):
-        for commit in TestMbox.commits:
+        for commit in self.commits:
             if not commit.commit_message.strip():
                 self.fail('Please include a commit message on your patch explaining the change', commit=commit)
 
-- 
2.39.5


