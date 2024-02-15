Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B70C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 22:17:35 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.4908.1708035445664939800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 14:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AOCyKOOt;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33d00a999b4so582105f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708035444; x=1708640244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7bhVNL8gqP7pW4LkdgBGQIDdPXEh/44XiT2BOyBBtg=;
        b=AOCyKOOtmMuNccpR/n+zB7DfhgR1AHcTJlRF0QZObdqv1ilrmmaYC5E0VvLcFu4C9q
         0FHWqmzlnJf22mAfXynGC1avsKUdMRpo9BwY7SH6VnjK+IeY2b31oSVxwphxhSk5c3BE
         HIQCxHHRzR3rpmqHrtq1YJLQNGvEICYwX2W3LNM0Z1z0RcTnf9QSr9B6Zzy9tcCg5ySC
         6lkJZDf8Wr8gCKzgGBOOROkMkuu1etUz54+ou6OTLqVXpjTDwQ1P+Vw711isQyCdgWYv
         NXwJdJPXv1qCWqRV0Jl6k9gsd4Sr+rzK7PNFbNZPfwidrU9E0AjTLpYdHeZ+g7hWySKo
         TtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708035444; x=1708640244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7bhVNL8gqP7pW4LkdgBGQIDdPXEh/44XiT2BOyBBtg=;
        b=bxDbhfAxSjHh4s9XyUNtK6JHr8dg1DBJQHBYzhhU98yeA2+w8Dp3kReAQDTRM92TEf
         X2F8kNaSbEXm+fRLzy8/CcWp6DC5nfT5zXtjiebB8OywDq4BwiowPLC+E5d/mnZDNn/W
         UPplPmSLnoLPbVz63/13y9OaZqSG9A4r4NnxY3wxQHBGHOWpadszR12JIhox8xu+Yu9P
         KMtQjDcpxcNsoi9EQSzhuJ/m+LoXCQJ2aRL1vsWNWhHtLTS0Z9+HRMFUwQn6cwB0waiT
         aevPnGEumrYz++ZNY9nOKEL7klhmS/QlRMii7wrncgJDsQcXwgSTjp5sSye0C2HVDK/l
         XLhg==
X-Gm-Message-State: AOJu0YxQshU0VuvWMAf7QhED32rVylpNftiGDjag2G3XT6bvdNeLwR/Z
	B/I2A7U+gn6rQYDctmQNQpTtcMPC4TtiuZGhCAd4hoU053DgPuVCnezPdZF8ctM=
X-Google-Smtp-Source: AGHT+IF2jxnP7n6m5Gw+0g5ADcwmVAC8lKDOZqkj0KjzfhdXnyYq6/1adKlvdkAegQaGSXONqqGBZA==
X-Received: by 2002:a5d:4fc5:0:b0:33c:d9f8:9d8 with SMTP id h5-20020a5d4fc5000000b0033cd9f809d8mr2321660wrw.48.1708035443964;
        Thu, 15 Feb 2024 14:17:23 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d65c5000000b0033cda3d3916sm335334wrw.88.2024.02.15.14.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:17:23 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [kirkstone][PATCH 08/12] oeqa/selftest/oelib/buildhistory: git default branch
Date: Thu, 15 Feb 2024 23:13:54 +0100
Message-ID: <20240215221711.332614-9-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240215221711.332614-1-adrian.freihofer@siemens.com>
References: <20240215221711.332614-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 22:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195719

From: Adrian Freihofer <adrian.freihofer@gmail.com>

On hosts with git defaulting to main branch the following exception
occures:

File .../buildhistory.py", line 99, in test_compare_dict_blobs_default
  blob1 = self.repo.heads.master.commit.tree.blobs[0]
          ^^^^^^^^^^^^^^^^^^^^^^
File "/usr/lib/python3.12/site-packages/git/util.py", line 1114, in __getattr__
  return list.__getattribute__(self, attr)
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: 'IterableList' object has no attribute 'master'

Support main and master branch for these test cases.

Note: setting the default branch with --initial-branch requires git
version 2.28 or later. Some of the still supported host distros do not
provide this feature yet.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from master: 7df99843d8f31d8e0c2872ff625f4a5abf28f740

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../oeqa/selftest/cases/oelib/buildhistory.py  | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index 33bd6df2f3..ae12aa0865 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -28,6 +28,16 @@ class TestBlobParsing(OESelftestTestCase):
         import shutil
         shutil.rmtree(self.repo_path)
 
+    @property
+    def heads_default(self):
+        """
+        Support repos defaulting to master or to main branch
+        """
+        try:
+            return self.repo.heads.main
+        except AttributeError:
+            return self.repo.heads.master
+
     def commit_vars(self, to_add={}, to_remove = [], msg="A commit message"):
         if len(to_add) == 0 and len(to_remove) == 0:
             return
@@ -65,10 +75,10 @@ class TestBlobParsing(OESelftestTestCase):
         changesmap = { "foo-2" : ("2", "8"), "bar" : ("","4"), "bar-2" : ("","5")}
 
         self.commit_vars(to_add = { "foo" : "1", "foo-2" : "2", "foo-3" : "3" })
-        blob1 = self.repo.heads.master.commit.tree.blobs[0]
+        blob1 = self.heads_default.commit.tree.blobs[0]
 
         self.commit_vars(to_add = { "foo-2" : "8", "bar" : "4", "bar-2" : "5" })
-        blob2 = self.repo.heads.master.commit.tree.blobs[0]
+        blob2 = self.heads_default.commit.tree.blobs[0]
 
         change_records = compare_dict_blobs(os.path.join(self.repo_path, self.test_file),
             blob1, blob2, False, False)
@@ -84,10 +94,10 @@ class TestBlobParsing(OESelftestTestCase):
         defaultmap = { x : ("default", "1")  for x in ["PKG", "PKGE", "PKGV", "PKGR"]}
 
         self.commit_vars(to_add = { "foo" : "1" })
-        blob1 = self.repo.heads.master.commit.tree.blobs[0]
+        blob1 = self.heads_default.commit.tree.blobs[0]
 
         self.commit_vars(to_add = { "PKG" : "1", "PKGE" : "1", "PKGV" : "1", "PKGR" : "1" })
-        blob2 = self.repo.heads.master.commit.tree.blobs[0]
+        blob2 = self.heads_default.commit.tree.blobs[0]
 
         change_records = compare_dict_blobs(os.path.join(self.repo_path, self.test_file),
             blob1, blob2, False, False)
-- 
2.43.1


