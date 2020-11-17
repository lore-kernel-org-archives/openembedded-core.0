Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web08.16780.1605656900664334721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vqQ2ptyd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id o3so10737928ota.8
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 15:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GNX2miH5DDU+jZKipaZt63Zx8C23nZ+PfLQkfaTobnA=;
        b=vqQ2ptydvOpoIa1HblRUDLk4NbZSxkkRcklx2Gzl3Gq695vCczLo9NTQQvXJN3ZZ1n
         2y42zaF3kcSgPweGGp7iY3AmIr2j5FWOB3cDl57IRzhnk78wmDZi3zhtnBoLjrafZRn2
         /kwLIgxxHbuhPOYhiesEPKAqHTQXe2NiNdY4j2cRF/FPePF2aGU602GCQzKp/d1qoq+j
         HmUwewqAAbpnlql1Z8sNLiS04wx47JKmy9Zm2e7JsSnNF6BGIBIlkOJCBwXNz6xd2RYq
         vT2gcipHs+o1c0cAB+rpip9m5rbin4WNQD8a4/waHi5rmPlT4GTI4+gH1WLoLpeYnyKi
         18Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GNX2miH5DDU+jZKipaZt63Zx8C23nZ+PfLQkfaTobnA=;
        b=L6q1MUiCVPOl+PZawj7lznCmjoz5B9Y13/IQaQew02Khsr6wJqCnmsZiTpF1Xim+Y6
         TFxpDcrrM8Q7Jv0U5MNpA6PB9fs8VetHTUYHKt24JY/iNcX3VhqbhrmT6rTS4tFWT8E0
         Exp0SQ4n/xGBdUZs8+thagrzjCaHOyymwgEGxy7GNJR30zFSbjD8WFhUw4zMWZ6jjmzl
         CP+aqqkqYcfJPDvuiA3VDlBFGjV9ki7zi42paUYzdYdl6W6U+s11ObZlrBa8LZN2ZuAg
         RtrfgqqvgxUf+08LctqBa91mKjiAD2u2zb6iquCtPjGlDjJKCNICQuJIipcUwvrsPur5
         eEhA==
X-Gm-Message-State: AOAM530t353Ib8xLJLLlsfM2kfaXJb1x9TBkiIM2Sd5xp5AgpaMYHGCQ
	pv9TsCwsezGN2/uHImnBKINHh6PZIC/AM9H2
X-Google-Smtp-Source: ABdhPJxkMfhAP/KehEZXMlD/nNKqYUHz7bw7ywz/ECt/gs1405fpKhEzr0PWHUPULnqNTnBt8Zkd9Q==
X-Received: by 2002:a05:6830:1d8f:: with SMTP id y15mr4738347oti.332.1605656899490;
        Tue, 17 Nov 2020 15:48:19 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id s131sm6715936oie.58.2020.11.17.15.48.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:48:19 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/9] lib/oe/reproducible: Fix error when no git HEAD
Date: Tue, 17 Nov 2020 13:47:33 -1000
Message-Id: <02e42107e1c6145c215bfd74fe17fd8abc2db04f.1605656725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605656725.git.steve@sakoman.com>
References: <cover.1605656725.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Fixes an error that occurs when attempting to get the timestamp of the
latest commit when there is no HEAD in the git repository. The easiest
way to trigger this condition is to use the 'subdir=' option when
specifying a 'git://' SRC_URI.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a64caca5b5dbe4a76acd0b5709b2c3e75b245863)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/reproducible.py | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index f80a85ddef..f4f58dd952 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -47,14 +47,23 @@ def find_git_folder(d, sourcedir):
     return None
 
 def get_source_date_epoch_from_git(d, sourcedir):
-    source_date_epoch = None
-    if "git://" in d.getVar('SRC_URI'):
-        gitpath = find_git_folder(d, sourcedir)
-        if gitpath:
-            import subprocess
-            source_date_epoch = int(subprocess.check_output(['git','log','-1','--pretty=%ct'], cwd=gitpath))
-            bb.debug(1, "git repository: %s" % gitpath)
-    return source_date_epoch
+    if not "git://" in d.getVar('SRC_URI'):
+        return None
+
+    gitpath = find_git_folder(d, sourcedir)
+    if not gitpath:
+        return None
+
+    # Check that the repository has a valid HEAD; it may not if subdir is used
+    # in SRC_URI
+    p = subprocess.run(['git', 'rev-parse', 'HEAD'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, cwd=gitpath)
+    if p.returncode != 0:
+        bb.debug(1, "%s does not have a valid HEAD: %s" % (gitpath, p.stdout.decode('utf-8')))
+        return None
+
+    bb.debug(1, "git repository: %s" % gitpath)
+    p = subprocess.run(['git','log','-1','--pretty=%ct'], check=True, stdout=subprocess.PIPE, cwd=gitpath)
+    return int(p.stdout.decode('utf-8'))
 
 def get_source_date_epoch_from_youngest_file(d, sourcedir):
     if sourcedir == d.getVar('WORKDIR'):
-- 
2.17.1

