Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9242C78848
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:39 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.18444.1726839576041132738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YrVI467u;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-719858156f4so1667614b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839575; x=1727444375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYXrKwI6OCxAGq6gTZvwN0sg8X4P2c0MieoHlYM4qcY=;
        b=YrVI467uUSSUkbFf9CRsR5EGlWGehshwC2/i9SVKjpCBz39QrkJIZIBHMAm3MbpMOF
         zk5HTFNe2eczMuakDiOyjrCFutASRW9xTWhFv4MJH2G0KIacrSGIhfFC/U/xqyc4m9NK
         BxHUg0blFb1JKVfFxXjOrG9chaIrfelwT+CuUlslsaMOM3VyjaZjQPN9dllN8+6MjLEC
         NCNR75bVpYNygmrpDIjTm987nMQkpIwCtX/gv6I04lFPzjdOGv3ixZBYHMHqMj0S3mM7
         lilzggcROaWt8xTY2VIW8YJ0SUs/Eh6pPJoWWWoDtVsIp4cbaLyUFLZgcXx75FB+J+tY
         1GOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839575; x=1727444375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYXrKwI6OCxAGq6gTZvwN0sg8X4P2c0MieoHlYM4qcY=;
        b=S3/KoVuyM7O9FfAl2BZd9BRSAHuQUieDL9EtKi9Y/0UBeQ8R9tmaWz05P5VJpFPiup
         JE3m/nR8SSSAao5EMQeispAntiPstLaW78Cw4DcStTDzIeclkPbxex5XUa36cSSUpRRG
         jFuPMGMQFU+7rsYcxi7Q3Frwd9FUoRSjyW1oi/XFtdfjH3sZxa4XEdg6mZZkH8tdAgF3
         5j84T5vPJ1DracEV9YlNM/Cu9gr9XZC8G5YgljtgAlLngB/GRQVacp6jn+w6lqxSjkoH
         xw6j1z7J3gpR3MQpAxWaPBMyRf7IQpH5JveA4JBiVcMs+neubqU5XIGo2BOm4bDcSdI6
         6oTA==
X-Gm-Message-State: AOJu0YzpRp0Rm3fd6FliKcUv9nAx0HqMnWB1NKY3VLBSDUj+4pNi1AyQ
	U3dIX+ZBMIlyqGB2wy6y2RZRJnxGy1uh8BaDcowN6JIkVWIckxuAOjOMbytll+PNrIhe5LRsQex
	l
X-Google-Smtp-Source: AGHT+IE/vMCi3HE7q+16Qsmj/ttaI+CqE2BOyGi7SmVWmXLTTkM4me9m1y/3VzPJlxjn3/FoTyxykA==
X-Received: by 2002:a05:6a00:4b52:b0:710:7fd2:c91 with SMTP id d2e1a72fcca58-7199ca4dfa4mr3817744b3a.26.1726839575166;
        Fri, 20 Sep 2024 06:39:35 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/16] buildhistory: Restoring files from preserve list
Date: Fri, 20 Sep 2024 06:39:06 -0700
Message-Id: <93ee5b0ee71a51daba9a332e8dba93d78a849677.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204747

From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>

This fix will ensure that, when we activate feature
`BUILDHISTORY_RESET`, files marked to keep on feature
`BUILDHISTORY_PRESERVE` will indeed exist is buildhistory
final path since they are moved to buildhistory/old but
not restored at any point.

Signed-off-by: Pedro Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f68a45aa238ae5fcdfaca71ba0e7015e9cb720e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


