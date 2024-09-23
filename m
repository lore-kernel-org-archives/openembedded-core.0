Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B0FCF9C77
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:24 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.36185.1727097259781820843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=X4wWpWlo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718d8d6af8fso3098687b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097259; x=1727702059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iB+VVySbJEYXokuwXAbAYt7DSDzGCW6pG4L1U4073Cc=;
        b=X4wWpWloVZ4CDLAIdsBmeterEAF/YSHug9iYYxRC+JME81pOMv8THFMrMbipRp4Mww
         AEuaqnsJXg/cp66fEI5k5WwsqgHbWN3+Z4z3GUnS2naokr/gH7j+ApUyXpVg61nT3V88
         ndFjFfx+cZObuUdKB99NlFyqj6CnOP+Of4FAkfJ/z0BVN9eknOSHqCEH5rQt8/7T9Yv0
         Pk7jjmnErwGz8dQvmjz2lmen8KPmclVmQRKSlZMPPEsT/mC9T7LN+ftyiw7Z4eAZ3xMR
         oNj1pT4Cmtf5whlA7lKpvHFZkzuwaS65zbSnXZsVuKdt3OYv4dDAuKyKIB+HAZch/OIl
         hj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097259; x=1727702059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iB+VVySbJEYXokuwXAbAYt7DSDzGCW6pG4L1U4073Cc=;
        b=plG4CtJM+rfr76TSaV9zvC8gB7QHWaVIxR99u3oKkn0xFLExjH33N0ZC/ERHRpWQkC
         1lUxjM4ix/xOitjU5jIFjCZ5eEFEWgyI5IHeIYqRN74pHZiSNOXYnQ6D2PsgstiUY8ji
         RwNU3jOAt7nL9xNrc5yjV0GFP30vjCjzbf7hhFk/lfpB/V3FwmEmMkVSam4QdMhvt/4v
         ckfWZF8En5+o4c6VD+A2CbAg6KvN2qv8whsGdyddBZWmELIHZDJRXtbcQjmcLFJwJDpL
         fNBOKMrZ1lk6VH8cTbBDteMJpBnWrmTYly05UkC1MeHFeN0MRTkiGg4izycys/ULb8j3
         ++hg==
X-Gm-Message-State: AOJu0Yzn76QlVYRU6Feg/7OUmFJQ1AIt5m4zoNwX+5WHPNRH9F5t/oqO
	7N5xxWMKrYkFI8Tq+DKFeGPtnn5/FgqOQtrCTvQtH2OzyNd7wp0XwMp3eFaT6YF2WFx/55qMlq2
	2YhY=
X-Google-Smtp-Source: AGHT+IFJ3GtoLARuVqAZ3GrkFBS/gFERfMlpaWzWy+rttanF+HhZt0VrIOizM7vdtjDC5DZuSJQtTA==
X-Received: by 2002:a05:6a00:14d0:b0:719:8f48:ff00 with SMTP id d2e1a72fcca58-7199c9c0aafmr15756381b3a.15.1727097259021;
        Mon, 23 Sep 2024 06:14:19 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/15] buildhistory: Restoring files from preserve list
Date: Mon, 23 Sep 2024 06:13:51 -0700
Message-Id: <8160fd3c042283a47a2601e1797847c303e1e7e5.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204816

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


