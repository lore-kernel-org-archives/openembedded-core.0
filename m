Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EAAC54E51
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 21:57:31 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.2008.1709071046624600362
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 13:57:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YRn1voiY;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.51, mailfrom: steve@sakoman.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7c7db34d162so76838539f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 13:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709071045; x=1709675845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icJ2AEAYXxXy9sAaUjPsd9UtqfK6peXDHMxdOF7NsYY=;
        b=YRn1voiYA6BQb4z4SKOWR1Y8qSPHAZ9Q8O6ggazkiphT6xk0nsYj5sUDgmmskq+Bly
         Tevr4K34bxuNLjnXpFhc4KR1wA80sK4z2DllPl/9uGg0sgPTqXgFV82b/LANTvAsvCLM
         Tnyy9hLRFCFavTD9AGYgsZ5OSyfVJS+r70iZd8j+kKZ5566j9UFHVAiYtlKUyf0x997E
         aolyUnWgMAr9rpGcJd0brXilmCHhUWA3uS9oHuI8OaJ3+fgc6lEk5iIIRGRstLn26AzH
         W4wFiWUHSdnsUUQ4Dq0zfq7pNBPBnj1uy9jFZLCZxonbDhkYQ57aFtuvUmoVC8OJVXwf
         7tZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071045; x=1709675845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icJ2AEAYXxXy9sAaUjPsd9UtqfK6peXDHMxdOF7NsYY=;
        b=g8t2FLWWMwUfAReF9JTaeCB46zC3fTAheqWUSUnbU1/xwfbNNzwyjSY8NXdy6VU3yz
         8hKm+/Xp24/5Jhq/WYkKuIkzl/mPljkb10YBMiGYUqz6U2flJlkjzr49KzIa+oiWnS9i
         93ZBfz0iDzKhoMrqTS4lsm9SD9JEsYzolIo1mxEKLzE5TWqlZEyeF1xqZyXPAv8ACNDn
         +idugiZ+M0koyzGn2ld0aqoWXdLZYwRXznTp9iiEiujvEq1WHmP1lLh0CkyjCS+VIS8z
         1huBvGDsZbbll/gbdCaJlPB4xDmN8Bdow3h9fq7GaBjauKiKkdYLlzrZOexNXRip17nk
         5FLg==
X-Gm-Message-State: AOJu0YyliXS5yyyjgOuW0owbhnH8DcqM5CeLrjp/8lLJBHjpApNnWsDe
	snSmhhi+F/yTDTHAju0ngLprdvIamobC3rIAV9NA8hDpnIjW+ZKcecL8MBJiTuZUCeS36VJCo57
	R8rc=
X-Google-Smtp-Source: AGHT+IEFRTROumWDw6+2E9K09Of0z8zyGp2fUtJi+6PHNq/rhTbB2wZAKi7+xo1PGqiUO3LChblAPQ==
X-Received: by 2002:a92:cd4a:0:b0:365:3d96:4b98 with SMTP id v10-20020a92cd4a000000b003653d964b98mr10190134ilq.2.1709071045661;
        Tue, 27 Feb 2024 13:57:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b006e50bbf4e71sm4936428pfa.9.2024.02.27.13.57.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 13:57:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/16] oeqa/selftest/oelib/buildhistory: git default branch
Date: Tue, 27 Feb 2024 11:56:56 -1000
Message-Id: <095598eb7c9aa64797c8a41255fa28b695398054.1709070850.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709070850.git.steve@sakoman.com>
References: <cover.1709070850.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 21:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196308

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


