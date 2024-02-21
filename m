Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0B7C5478C
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.463.1708544449740769062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nhhMISIh;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3394ca0c874so3862894f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544448; x=1709149248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7bhVNL8gqP7pW4LkdgBGQIDdPXEh/44XiT2BOyBBtg=;
        b=nhhMISIhZEyjHrdTm1ghnZ4Z0yTC/LChmO/MyTBS5Df+XmRQwyAfvade+9HMVXrQ2y
         6s6vu6gTal/ftdJnfkBjwY/Q7WSSAIWYBdYdrLZskhWk8v0KEpHSZ6FzwbgKrIU1a0L0
         0jd2vinX0wxi8Sv/DFHXhwjuJZjt7fINqhynjIVBgvDAQluFkeTAylnKMdsZCv7Shcnz
         0MPwhJt3x6yqS6o4j+9BNMo5KPSwHJqCbKYsOTnZ5ZoWdfvTqgPpZREwkzoBYTpHS8l5
         u/1iinI07oOTG5ZlI6Y9sEUtzmSeDcEq8vY6SisUIB4RYt4y9/7bavF8LlgXWAhD4Z0V
         qF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544448; x=1709149248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7bhVNL8gqP7pW4LkdgBGQIDdPXEh/44XiT2BOyBBtg=;
        b=ZVqmk2dobs6HQ7PESxCzVj2gUrufZ+DxZGc8DOlF84WxKdu1ogHdmTpGpCtilMkl6m
         QDQo6nLtqe5jV6JmGHiACrLsN+LvRFelA0SMe4QvDY+Luk1stTw2+Lrh9MdrjZFjuHnj
         OHBNvb5rP/p7eJvOlvjRLg44JWv5I6yJmvHYlU25WmdOd+lAHXeHn7+TNJRhd7Or2GTn
         w6tKMkp+iZCgzOIEh5kULQBQoRoe150rJQSrOvF4yGkkJ7/OQC3OkGSW+G0r1T0O6exC
         UJgyIHubQKvmLya8Rch07+KZHQ/HadEz2hJsX7rrbf8AsW24AJUEXfRjKxi6lTrhm4Ap
         N8Zg==
X-Gm-Message-State: AOJu0YxnDGk49Vekx+ZFpZSjq/+28FVU6JCzE++p5AQGusnt0K36Knkt
	kkKOHYPdEZM9oM0y4xDuY7C3jUCTmhlVdn0AUcnP29HmDrO5H0J56g63yNPr
X-Google-Smtp-Source: AGHT+IHIIhAneg/2XAqF/SGr+n/Cm4KcvyDUWlRdPQ3HZ2NYJJ9QMlGCdthionWJMltmxIR9Wp524Q==
X-Received: by 2002:a5d:4102:0:b0:33d:248e:5b7 with SMTP id l2-20020a5d4102000000b0033d248e05b7mr9823330wrp.28.1708544447882;
        Wed, 21 Feb 2024 11:40:47 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:47 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 09/13] oeqa/selftest/oelib/buildhistory: git default branch
Date: Wed, 21 Feb 2024 20:37:01 +0100
Message-ID: <20240221194036.1804463-10-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
References: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195993

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


