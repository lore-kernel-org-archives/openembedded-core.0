Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2918CE8D68
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 10:01:41 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.15922.1726740093369632356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 03:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AsCvLx01;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: pmi183@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so5172145e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726740092; x=1727344892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEZZ2o05L7RdS9xhj19mzYIi0jE2fBxCwklBeRCzcSk=;
        b=AsCvLx01lO/hGyfbHSmr8nR+g5GqCmNT0s1E1rFvIf+QU7uQ+OdPW2ry5zbAKRPGMz
         BuK2/m28PF3g/NQ0dXmaO/TTLjsrk0yqo3nmbt4dZhFAgqvEKcCQiXXYHJ5qV8Lr8hI6
         276JJ3FTc2TvvU19I9WeeTt8zafBkLpCAa4LMGF2Z9ol97ThTmRMLqsa0E1j+zNey84O
         MOZOHnBDs8Ku1wGZP3R8TS4LDy2pf14GatVaaZO0Lu1kc+sR4IEnIl0HhO5ULWOhhw1W
         DyoancWsR7dI7uOvyJuoLRhKivX4z+QYJ+3M0Uvn/AMPNT7lFlGYw8V9+FVz9Mzxxstp
         VfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726740092; x=1727344892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEZZ2o05L7RdS9xhj19mzYIi0jE2fBxCwklBeRCzcSk=;
        b=KUECAX7Uh1ZIvHLjFEvzucy1XE56yj5I52vFFOOB5Pff6ZIvaOVHW7PZot9zCCVeW+
         QZQkz5ZlsORTQnqoOd8+4LxaHGr6gsJjg+Uo0UJ6WcLMIZFNvMTeoVTcIyfNSSxm/TH7
         y1w7LZBV5xx9wkKL4kldlKSnf6BpDNkOK99Ti3+9WQJTFFjE3LS3vWj2NK+nKXyELIxa
         OUmQuerOy3hSzUv49YgoBYbNaeFCK16wEt43dEYZSkUkZpxf8Si/iC7Otyp9aD7+Tdng
         R7tGdEGmjuuOO46f87j1WIV8KdU1tl7GHA/aNA5+04CsJQED7zvjf6P4+iaB01YyMUVt
         OHiA==
X-Gm-Message-State: AOJu0Yz9EDpTVe/zzeRZRUom9O1+2GDnuIxabXMYEk861YUz7xdMuelX
	erGMFW7FhH9TQV4qJJmiRj9b1fl5zHbRJu8vk4Vo4Wn0ZYHp6308GRbHjDYI
X-Google-Smtp-Source: AGHT+IHZ3bmrVxqKo2HfEmAjMQvWSc+YP3gxV6u0bPMzD30WeLDUuZrZ891j+wVGvN5BVyvz7RB+TQ==
X-Received: by 2002:a05:600c:1987:b0:42c:b4f1:f281 with SMTP id 5b1f17b1804b1-42cdb58f2bbmr178600485e9.34.1726740091643;
        Thu, 19 Sep 2024 03:01:31 -0700 (PDT)
Received: from LAPTOP-0FHSM1V0.criticaltechworks.com ([78.137.195.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e75452b8esm17679405e9.28.2024.09.19.03.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 03:01:31 -0700 (PDT)
From: Pedro Ferreira <pmi183@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>,
	Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH v3 2/3] buildhistory: Restoring files from preserve list
Date: Thu, 19 Sep 2024 11:01:26 +0100
Message-Id: <20240919100127.2857748-2-pmi183@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919100127.2857748-1-pmi183@gmail.com>
References: <20240919100127.2857748-1-pmi183@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 10:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204663

From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>

This fix will ensure that, when we activate feature
`BUILDHISTORY_RESET`, files marked to keep on feature
`BUILDHISTORY_PRESERVE` will indeed exist is buildhistory
final path since they are moved to buildhistory/old but
not restored at any point.

Signed-off-by: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f68a45aa238ae5fcdfaca71ba0e7015e9cb720e)
---
 meta/classes/buildhistory.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index b35508db27..8adb44eba5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -108,6 +108,7 @@ python buildhistory_emit_pkghistory() {
     import json
     import shlex
     import errno
+    import shutil
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
     oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
@@ -221,6 +222,20 @@ python buildhistory_emit_pkghistory() {
         items.sort()
         return ' '.join(items)
 
+    def preservebuildhistoryfiles(pkg, preserve):
+        if os.path.exists(os.path.join(oldpkghistdir, pkg)):
+            listofobjs = os.listdir(os.path.join(oldpkghistdir, pkg))
+            for obj in listofobjs:
+                if obj not in preserve:
+                    continue
+                try:
+                    bb.utils.mkdirhier(os.path.join(pkghistdir, pkg))
+                    shutil.copyfile(os.path.join(oldpkghistdir, pkg, obj), os.path.join(pkghistdir, pkg, obj))
+                except IOError as e:
+                    bb.note("Unable to copy file. %s" % e)
+                except EnvironmentError as e:
+                    bb.note("Unable to copy file. %s" % e)
+
     pn = d.getVar('PN')
     pe = d.getVar('PE') or "0"
     pv = d.getVar('PV')
@@ -248,6 +263,14 @@ python buildhistory_emit_pkghistory() {
     if not os.path.exists(pkghistdir):
         bb.utils.mkdirhier(pkghistdir)
     else:
+        # We need to make sure that all files kept in
+        # buildhistory/old are restored successfully
+        # otherwise next block of code wont have files to
+        # check and purge
+        if d.getVar("BUILDHISTORY_RESET"):
+            for pkg in packagelist:
+                preservebuildhistoryfiles(pkg, preserve)
+
         # Remove files for packages that no longer exist
         for item in os.listdir(pkghistdir):
             if item not in preserve:
-- 
2.34.1


