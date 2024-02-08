Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B828C48BC0
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 08:29:05 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.13377.1707380938581574137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 00:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lbAxbuk+;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4101d4c5772so3449575e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 00:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707380937; x=1707985737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvyDOOSP/lWOMWhJXJdFeYOuuWd14pv1eA6T0A74dnU=;
        b=lbAxbuk+wnFmGMI/Cn4UV64rXbqmBxBMBoujeEHKIrTE4ng2MT3ShHG/5Jpry4IX6q
         Wtz3q+Vuf+MnsPN2S+ueuV96XUqGFOk27SspyHrou6UqXFdZZETicpDLd9lvSEsiDf5w
         EZ18mcOVeTVqZu65a6aDjd6F1MMh2jjtKP/o3DlJv7q/WpCwsvp2mAr6UJyuaBc2nsQb
         sdVpDGpt7+zWE8E2TM6y3oowvVkcy3AZ6YuhpqOYpqsLf67p1FcNZ1x5brzYodOM1jg6
         EdDhD/o3dq+aLK5JsfZVhiBh+yU0aB1WgZ1vUpg0kYD9ssVHqv/9PuNVEyRVNJ39Gvkl
         qtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707380937; x=1707985737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvyDOOSP/lWOMWhJXJdFeYOuuWd14pv1eA6T0A74dnU=;
        b=sxgEGTKpwhh70fmh5JYD5icUmimzNtBPnY2428vA7RDcVJmMcYFbwW4h5zRa7g3Uv4
         rnZHTxe1HDofY6S+Z5r1/c7KaMlDSOzDJYzcIvZ0q+0L4BN5SOy4mf7DjczSuP0qnf1L
         DOWAuNKNvq/OUkzyZlxKJn8F+0Zg6kaXeochmMUYBM+/Ysli4fn2E7sgzb8I8ja1raAy
         cqcLgg6l4Z/5MkiLds+28IsBYNUk2HuN2qMwaL2uW7AxEOTvUx6SEDYeTDHIdknBb6fq
         m+E0RXp/VHyTXkXM3G3V0WD+y9nzBqxC+oFTtKbse536KlXQGVKlBCFKJSW1wuCB/RQr
         h2IQ==
X-Gm-Message-State: AOJu0YwJIKYiPdxUT9g0H7eADFopBi/wZUOwnlPujO2N6OFs05LBf7k3
	k6/vgZXl5hBEl5Pu16ccY1QI76oxK8YrCeQaduAH+IHfM/dDWUd0RoHIDqn6
X-Google-Smtp-Source: AGHT+IHjCgB6mt1+zazrHGNDvKNwUd7hVpWbcLhgSQ4ve/SOJFsbVmpO3l+lVdWG7u/vvVz+xt7m7Q==
X-Received: by 2002:a05:600c:4e91:b0:40f:fd74:9893 with SMTP id f17-20020a05600c4e9100b0040ffd749893mr1378891wmq.5.1707380936703;
        Thu, 08 Feb 2024 00:28:56 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id j12-20020a05600c190c00b0040ebf603a89sm913321wmq.11.2024.02.08.00.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 00:28:56 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/7] oeqa/selftest/oelib/buildhistory: git default branch
Date: Thu,  8 Feb 2024 09:27:30 +0100
Message-ID: <20240208082821.430510-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208082821.430510-1-adrian.freihofer@siemens.com>
References: <20240208082821.430510-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 08:29:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195109

Define the git default branch to main and use it for all test cases.
This is also in line with what the build history does in practice with
newer Git versions.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
index c3c15d83c0f..762c0d47bff 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/buildhistory.py
@@ -19,7 +19,7 @@ class TestBlobParsing(OESelftestTestCase):
 
         try:
             from git import Repo
-            self.repo = Repo.init(self.repo_path)
+            self.repo = Repo.init(self.repo_path, initial_branch='main')
         except ImportError as e:
             self.skipTest('Python module GitPython is not present (%s)  (%s)' % (e, sys.path))
 
@@ -67,10 +67,10 @@ class TestBlobParsing(OESelftestTestCase):
         changesmap = { "foo-2" : ("2", "8"), "bar" : ("","4"), "bar-2" : ("","5")}
 
         self.commit_vars(to_add = { "foo" : "1", "foo-2" : "2", "foo-3" : "3" })
-        blob1 = self.repo.heads.master.commit.tree.blobs[0]
+        blob1 = self.repo.heads.main.commit.tree.blobs[0]
 
         self.commit_vars(to_add = { "foo-2" : "8", "bar" : "4", "bar-2" : "5" })
-        blob2 = self.repo.heads.master.commit.tree.blobs[0]
+        blob2 = self.repo.heads.main.commit.tree.blobs[0]
 
         change_records = compare_dict_blobs(os.path.join(self.repo_path, self.test_file),
             blob1, blob2, False, False)
@@ -86,10 +86,10 @@ class TestBlobParsing(OESelftestTestCase):
         defaultmap = { x : ("default", "1")  for x in ["PKG", "PKGE", "PKGV", "PKGR"]}
 
         self.commit_vars(to_add = { "foo" : "1" })
-        blob1 = self.repo.heads.master.commit.tree.blobs[0]
+        blob1 = self.repo.heads.main.commit.tree.blobs[0]
 
         self.commit_vars(to_add = { "PKG" : "1", "PKGE" : "1", "PKGV" : "1", "PKGR" : "1" })
-        blob2 = self.repo.heads.master.commit.tree.blobs[0]
+        blob2 = self.repo.heads.main.commit.tree.blobs[0]
 
         change_records = compare_dict_blobs(os.path.join(self.repo_path, self.test_file),
             blob1, blob2, False, False)
-- 
2.43.0


