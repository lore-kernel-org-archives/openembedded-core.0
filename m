Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.672.1590789820158102190
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 15:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W1tGG+T3;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id c71so5263332wmd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 15:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+xLRlO9x0ghV2JfirUB7c0/6YcyFAWAcHtyeg4CCkhQ=;
        b=W1tGG+T3xxsuRk/xV6BXt2Wo/e417J0jTtk6J0MwR7awoDvx2Hn50UQJH1jIrPgoia
         0wTsFhc+9UzOhgJgfKaCJ4IJLww+WpkF5w9v0TLmsah2nGUxpItCMDHb+9jKy42Ql0tl
         hEPOeAyuokBvxfp2sPePErA7DUV8yTdCmqtvOqaW5FYcoOKNYMWAp0WX+JXt9rvhWcnG
         OjkpOM5EU7XVIqEfMNe4jOKx9Vje23aAya/Ozm9/kmL8QURBc1cALT252NqVwk+bEOub
         Hutpc32EXrYwntT0LbqCoRRrJddqFQoxEVDC7gYKjPi27V3j4rmEsJhUY72uhWGkJqD7
         ipAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+xLRlO9x0ghV2JfirUB7c0/6YcyFAWAcHtyeg4CCkhQ=;
        b=LGt2P/y+ICY9Sbtp/Z3gWH9/TxxPZ5efZ9LmEgLNxwe8wmX/YOyO2kVVCixbJt5cpx
         vMaCIjP9dkYM3TzwSGEZCgSpQNgVksfl3g2jnUoMxJ9y762NTaGAOnKElHeWvlavwD7w
         EjHZ7HE9Opp4fhnX5IibqnU92N3/VSrdRQK3F1Mx4ZuBKWMzfj8WzZfwybbEmV3a15c3
         RikJo96+DIHvVUZIwy1LdRxIEFejLtfn2+yTyh1fyMiT24jtFwSuX1roKqQ5NY5RyPwo
         NHOtOmRQbSW1QfjxF6lj+g8ggulvCQ5EG2OBvAPCii2lbUs1hef9rgUVy44AG8PYi4fl
         W5PA==
X-Gm-Message-State: AOAM531GTkHi25q8hqYLxV2+YmFeaPVWLDrMdkBfF1PU1u8jw5Cls6Y+
	MEK+LZ94CjCfhU+UwCPo8vVN8uSl
X-Google-Smtp-Source: ABdhPJzpz5TPcvwZgb5RgB0hEd9TzkK6EoL00dvvAPkg15LVBBFISQhoE1QYyaXI4v/wtKAccgK8jw==
X-Received: by 2002:a1c:28c5:: with SMTP id o188mr10016493wmo.62.1590789818327;
        Fri, 29 May 2020 15:03:38 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f2sm12222889wrg.17.2020.05.29.15.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 15:03:37 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 5/6] Revert "lib/oe/patch: fix handling of patches with no header"
Date: Sat, 30 May 2020 00:03:27 +0200
Message-Id: <20200529220328.3480555-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
References: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* This reverts commit d9971f5dc8eb7de551fd6f5e058fd24770ef5d78.

* With the missing Subject line fixed in GitApplyTree.prepareCommit()
  we should be able to revert, the fix which was trying to help it by
  parsing GitApplyTree.patch_line_prefix ("%% original patch:") also
  from Subject line, now GitApplyTree.patch_line_prefix should always
  end on separate line which is then skipped when copying the lines to
  resulting patch, see original commit message from Paul:

    lib/oe/patch: fix handling of patches with no header

    If a patch applied by a recipe has no header and we turn the recipe's
    source into a git tree (when PATCHTOOL = "git" or when using devtool
    extract / modify / upgrade), the commit message ends up consisting only
    of the original filename marker ("%% original patch: filename.patch").
    When we come to do turn the commits back into a set of patches in
    extractPatches(), this first line ends up in the "Subject: " part of
    the file, but we were ignoring it because the line didn't start with the
    marker text. The end result was we weren't able to get the original
    patch name. Strip off any "Subject [PATCH x/y]" part before looking for
    the marker text to fix.

    This caused "devtool modify openssl" followed by "devtool update-recipe
    openssl" (without any changes in-between) to remove version-script.patch
    because that patch has no header and we weren't able to determine the
    original filename.
---
 meta/lib/oe/patch.py | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index bb1c40aa1e..7ca2e28b1f 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -439,7 +439,6 @@ class GitApplyTree(PatchTree):
     def extractPatches(tree, startcommit, outdir, paths=None):
         import tempfile
         import shutil
-        import re
         tempdir = tempfile.mkdtemp(prefix='oepatch')
         try:
             shellcmd = ["git", "format-patch", "--no-signature", "--no-numbered", startcommit, "-o", tempdir]
@@ -455,13 +454,10 @@ class GitApplyTree(PatchTree):
                         try:
                             with open(srcfile, 'r', encoding=encoding) as f:
                                 for line in f:
-                                    checkline = line
-                                    if checkline.startswith('Subject: '):
-                                        checkline = re.sub(r'\[.+?\]\s*', '', checkline[9:])
-                                    if checkline.startswith(GitApplyTree.patch_line_prefix):
+                                    if line.startswith(GitApplyTree.patch_line_prefix):
                                         outfile = line.split()[-1].strip()
                                         continue
-                                    if checkline.startswith(GitApplyTree.ignore_commit_prefix):
+                                    if line.startswith(GitApplyTree.ignore_commit_prefix):
                                         continue
                                     patchlines.append(line)
                         except UnicodeDecodeError:
-- 
2.25.1

