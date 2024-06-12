Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366F5C27C75
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 20:14:47 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.3960.1718223279217012514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 13:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qdh32MOv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso9064465e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 13:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718223277; x=1718828077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFHOsOJCIa61qTuyOb2JfVu5gI39XpGsnzKm13w6PA4=;
        b=Qdh32MOvvqDWdS/sXjCEzXOP98o5Pbrx9ECb5rgS5DCNTCQVQYldahcd3dyGKL9UjM
         EeIV57E3kSyOCc8PrnmK7j31+mBVj+BAlheJU/1yNAbptFPCJMY96iA0lXawlTxj9fhB
         J6nO6z2KStUkhCTLGy7a/eXX9yWFmcTeYI8hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718223277; x=1718828077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFHOsOJCIa61qTuyOb2JfVu5gI39XpGsnzKm13w6PA4=;
        b=RnmtpleN/5adJ06KkqoyK3AkdNF084dHvL7iU8CNEB0NttTs5dlJrWZUSFr1HA6URN
         ic00ECAW/smbr1ISXRkYxHm5Ppy63Uf3r1gSgfv3pheh3wRCgiKEkN5ChsJ7bS87P/Br
         V+HXefuzzu00DyRy3j9op2T39SAt4bd3MvlsPItG/m4foT9Knm4/3S9b9FT4lhBOW8w4
         Tt0Qwgkf8qeMZxLa8krp4I+mwHcBvDBydfHTdggBf6TUw3wFKVLSu/SQnKOrtZUhsWmj
         SgEn4gfuYPTuLO4nNH9ER6er43+tL9v8/uRGVBWToZY90dMXWWGdviqFA7qLLOfNZuZo
         CvWw==
X-Gm-Message-State: AOJu0YzCozPXFsra7NOogqhWO/VJiTsfw8ZVIW4lfL8PiTBR6Eri/e5+
	lTa9fWOnHHEnWt2/w+fRHTxEmNAGyXVcKaZuQk5khLvVZK3SWMHitpGqTb2rLGneLUrHZ+AxxCu
	T
X-Google-Smtp-Source: AGHT+IHPy1RReMZAa0mYiIxBs3HcDtOPFEP3piVaZho2juN7A4Vkw5iBrJgrgCtHsHpo83Pu7huvng==
X-Received: by 2002:a05:600c:4f83:b0:421:8179:6127 with SMTP id 5b1f17b1804b1-422b87b3999mr6133915e9.20.1718223277185;
        Wed, 12 Jun 2024 13:14:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c2e8:7191:b6d9:616d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9c1sm36927955e9.7.2024.06.12.13.14.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 13:14:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/sdk/case: Ensure DL_DIR is populated with artefacts if used
Date: Wed, 12 Jun 2024 21:14:35 +0100
Message-ID: <20240612201436.871102-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 20:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200580

Where we're using DL_DIR in sdk archive to try and cache testing artefacts,
copy into the cache so that it gets populated and this doesn't have to be done
manually. Currently we're making a lot of repeat requests to github as this
wasn't being populated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/case.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/sdk/case.py b/meta/lib/oeqa/sdk/case.py
index c45882689cb..46a3789f572 100644
--- a/meta/lib/oeqa/sdk/case.py
+++ b/meta/lib/oeqa/sdk/case.py
@@ -6,6 +6,7 @@
 
 import os
 import subprocess
+import shutil
 
 from oeqa.core.case import OETestCase
 
@@ -21,12 +22,14 @@ class OESDKTestCase(OETestCase):
             archive = os.path.basename(urlparse(url).path)
 
         if dl_dir:
-            tarball = os.path.join(dl_dir, archive)
-            if os.path.exists(tarball):
-                return tarball
+            archive_tarball = os.path.join(dl_dir, archive)
+            if os.path.exists(archive_tarball):
+                return archive_tarball
 
         tarball = os.path.join(workdir, archive)
         subprocess.check_output(["wget", "-O", tarball, url], stderr=subprocess.STDOUT)
+        if dl_dir and not os.path.exists(archive_tarball):
+            shutil.copyfile(tarball, archive_tarball)
         return tarball
 
     def check_elf(self, path, target_os=None, target_arch=None):

