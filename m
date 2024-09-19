Return-Path: <pmi183@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339D8CE8D73
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 10:10:32 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.16171.1726740629084269134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 03:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AgsFSMqN;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: pmi183@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-374d29ad8a7so423491f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726740627; x=1727345427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKhJTubu2tcNflzvyHAs0xIDcWSE4gGAqa9cBhsYLE8=;
        b=AgsFSMqNqJO5w9Sks3+0WfIBAgJjAuDxVRJVT+trovTOUFfHtMWpawEUqtGYouhXip
         wFcqIAU5b2lOkrG+BC/KO4mFQvvLuHlQhu0Ol8VbBgikk6pyToDF8zHCfkEbMpmrvDb8
         r357d9uUTaBf1gGHWFbz5tu/hhEDXnIkBjd21QVHHx8nipDPWTcVGDYM3OytnJBtXrU1
         FKAvDeE9gmnoeK4NebVslyq+HfEmgN1Y58WgEjLXx5EVS3FSczk2LPfz3zfVPkqjmvnU
         jE/WFFSF46LdrZ0oq5unTFV0IIvujjL2CSCaPPx0crvyWHn1XTw1hzlQqZ6GJp9ac2hM
         wshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726740627; x=1727345427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKhJTubu2tcNflzvyHAs0xIDcWSE4gGAqa9cBhsYLE8=;
        b=vCEiM15GZnOOcTc/fAtJQgsCGw2i62527YeF6lOyxOsJFYafJ1L+g9FFxhEh8WKQXd
         fAxSx4bBIsY/JYFs1WSn7YKfm+SS9iIqGd0jl1xNnT3Pz/Ch1irPd9iuTfQEyCcW49PS
         Oll7kcyKIh+D6zam1YPSkO1qchnl1zDdgBfHy6YI76r/aBh7vknccABQ8QqKu0am+qZ7
         tFQ8WXBhR5tX4ZLKq5BM0B/ze+y+jNECxqQHMJ5OJnUiDyfNVflAUI3hhZ5ajuKQMoPy
         YL1Ye1bUGfL+TmJtU8csfJ7tey7Jf2OguNmQcgidbuUMuKp4CzwJs3/JG1m9nYfUT4g2
         zXgA==
X-Gm-Message-State: AOJu0Yxd0JFlMCIIHpZaC73jp95VYu/+qrd1elmYmSu8el1VoxnDLVg1
	E7fVRicBH/eNb/9XN5+wDKKNKECBk1LebNiau9WNIXv2wiBefQnSCgN2GHp5
X-Google-Smtp-Source: AGHT+IGQr53xQebElhQxaD38CR0nD7+zpRx0rRlf7y+M2EvUrTVRbm07W5QfHOuE6+DQi/vxa6qhew==
X-Received: by 2002:adf:e111:0:b0:368:74c0:6721 with SMTP id ffacd0b85a97d-378c2d5163dmr14106590f8f.38.1726740627206;
        Thu, 19 Sep 2024 03:10:27 -0700 (PDT)
Received: from LAPTOP-0FHSM1V0.criticaltechworks.com ([78.137.195.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e7805193sm14561716f8f.98.2024.09.19.03.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 03:10:26 -0700 (PDT)
From: Pedro Ferreira <pmi183@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>,
	Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v3 2/3] buildhistory: Restoring files from preserve list
Date: Thu, 19 Sep 2024 11:10:19 +0100
Message-Id: <20240919101020.2858204-2-pmi183@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919101020.2858204-1-pmi183@gmail.com>
References: <20240919101020.2858204-1-pmi183@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 10:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204668

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
index d219519f86..08970aafea 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -110,6 +110,7 @@ python buildhistory_emit_pkghistory() {
     import json
     import shlex
     import errno
+    import shutil
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
     oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
@@ -223,6 +224,20 @@ python buildhistory_emit_pkghistory() {
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
@@ -250,6 +265,14 @@ python buildhistory_emit_pkghistory() {
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


