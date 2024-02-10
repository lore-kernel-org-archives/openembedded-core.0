Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF39C4829A
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 13:17:41 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.13253.1707571060164353623
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 05:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RA+yu7Vr;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-557dcb0f870so2509369a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 05:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707571058; x=1708175858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnQhLxw+yNMEQmtOkEbRwEjPHfeGOzi68EDWJzOgaho=;
        b=RA+yu7VrwggyciR/BdpnA2R4S74syeM8jxIzo7TbjhSypGcMf2wwG0K00+Yphby91i
         qKu1Z3bsDHjJ82brrKCY82PpGxCEdbDUtftRy4u7bfO+mrVg1asvulRLadV3zgwDAp1O
         TWLeZ2hDzXEsCzreMoDV6d/tiPLoehSpyDUv6J5aPxd94VWEhPP4x5KQsNsm+MAYjJ4t
         2EKlRLDOvyh7sr8tkHL5b41+XlOPX9hRY9tSWuqJscHkcOtx8sKgbd7QGVdbumP0J40T
         6/gpzrr6jP0RQqrKwPcX+Ph/hv8+yqGca5kH6dO/lsaEkuhUAGxPQqe26Bzl4cwyj50b
         Q32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707571058; x=1708175858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnQhLxw+yNMEQmtOkEbRwEjPHfeGOzi68EDWJzOgaho=;
        b=JaIJn9Z3EftikDEj9taZBwBOO0OyYqWTohrUPDdidsYQL3/s42lpvAoJa+WO3heLhJ
         2vhgW2Dq3Lc1nG8V1G5ailqZ/hxtGwfdpI9t7CpkmfyCPjDzWziYrD5+tOOnFIJrKVI1
         hWd6//88XFGch/aXj/PTbMYenIIccjw83NY3JucGmDZAqlQg5innnD0P6li0d82JWFBb
         /KuhA94sm2GJ6GYEFN/hUo61VsJIRn0KzALWfJco3/qHbldPmtfI5f2MBvm3w+UFzo7G
         SHdCmLPc35g5h33m6jeEFUUcqGuLqkYZaaJDmOK8IvciZ95d0R9h8iZGrFEh65EREfEY
         VCJw==
X-Gm-Message-State: AOJu0YwAZbZLLDJwJFIjmZT3pLkEngWTcSaBGMsyDrZmk+4qZvUTGaL7
	1IXqvo5IA1qH0adsLe+BrgDu9SNwS8JNFX1m+Z1e8yTLmH29MXPcWolF66MU
X-Google-Smtp-Source: AGHT+IGEFqbB2res1QVCpvwI/wj0bYOA+uDTLUYqVXEIK3oAggueHMfLPBVRxjtF536BzMKz1sE94w==
X-Received: by 2002:a17:906:57d5:b0:a3c:3b07:28f0 with SMTP id u21-20020a17090657d500b00a3c3b0728f0mr740891ejr.45.1707571058196;
        Sat, 10 Feb 2024 05:17:38 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id hu20-20020a170907a09400b00a3bd0742a94sm1793064ejc.9.2024.02.10.05.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 05:17:37 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/7] oeqa/selftest/oelib/buildhistory: git default branch
Date: Sat, 10 Feb 2024 14:15:53 +0100
Message-ID: <20240210131727.342583-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240210131727.342583-1-adrian.freihofer@siemens.com>
References: <20240210131727.342583-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 13:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195265

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
---
 .../oeqa/selftest/cases/oelib/buildhistory.py  | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index c3c15d83c0f..042ccdd2b48 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -30,6 +30,16 @@ class TestBlobParsing(OESelftestTestCase):
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
@@ -67,10 +77,10 @@ class TestBlobParsing(OESelftestTestCase):
         changesmap = { "foo-2" : ("2", "8"), "bar" : ("","4"), "bar-2" : ("","5")}
 
         self.commit_vars(to_add = { "foo" : "1", "foo-2" : "2", "foo-3" : "3" })
-        blob1 = self.repo.heads.master.commit.tree.blobs[0]
+        blob1 = self.heads_default.commit.tree.blobs[0]
 
         self.commit_vars(to_add = { "foo-2" : "8", "bar" : "4", "bar-2" : "5" })
-        blob2 = self.repo.heads.master.commit.tree.blobs[0]
+        blob2 = self.heads_default.commit.tree.blobs[0]
 
         change_records = compare_dict_blobs(os.path.join(self.repo_path, self.test_file),
             blob1, blob2, False, False)
@@ -86,10 +96,10 @@ class TestBlobParsing(OESelftestTestCase):
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
2.43.0


