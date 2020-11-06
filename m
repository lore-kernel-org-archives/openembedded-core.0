Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web09.12490.1604673391324752011
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=K1LyDBFq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.194, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f194.google.com with SMTP id z24so1087808pgk.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=cs1QOTMkwr6fm67Z9g0SqjhOvKiuwkG+0PZRf/v8TiM=;
        b=K1LyDBFqWcBVILvm6tnHjB7JXe/bPwz7vc+mnmP17WdxJZHH6PVHMGqM7qFzDHV78H
         E1t/P0whuz5rlbI5tv1wGeTwznJ6LfObcbmUSGJuHzDP0B1R2/rQy3xYtAJxZJZR14Is
         h9TIUiqgjuElyXqwkymKFcMQhmW+MbSmLovU8N6Ae1KOs+t5WzPj/I/YeHRECY5dV1CM
         9QgOxL6Ovygua00BcpXDoS7dV5b+BHk+dbYapqS+9hyu0OTkQn8g9/IaG07UmjGf8nWT
         VU4JxoozaiHLLMHunkVNQ/Yz5/RdRKGkxTLuEKQ7RrwXZay0j+6vn5cr+UfJH4/FQ/qE
         NO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=cs1QOTMkwr6fm67Z9g0SqjhOvKiuwkG+0PZRf/v8TiM=;
        b=BbHyfKwn+e8pluGc3j7jzeqoED4UcTb2ys7DLwo9RxmTs79+s2ydsya4nVUGlXcdFq
         AZ6gOZUd+k6eONJ6M7c9s4GtnT1Vs7Eru2CnjtLWTkOle3gHXfWPZsvMI9qYNR4vI83p
         D1rD8n0jtjdAAgf4W1q1wPJqtZu2UBF1ryv4frVFnvvZJEUNjI3YJ4mohfKWpRVIa0Vc
         s9zqWUTyAYtYDkf/c4KJWwxkYhUbUdoz8fXtZTnWQ3HkjWbfN8kSCqXOJhr33u8OZ8pw
         tKzm7XXrac3kp4kfLge4jrwy/gezYqoUaaX5mxzHaRlKnpGjP+QGLYF6tCtkdbMLNC5+
         MJ2g==
X-Gm-Message-State: AOAM532VcLhH7iHjfn8Ae+k8jgib/QRW9YHYaqc4f4UJsp1FdrR9FE3K
	quzW+nZDAAQypaJaKc9Yjd+ERVbYH2UuZPR+
X-Google-Smtp-Source: ABdhPJxUOZNHcPnTJQWsnSL+GwRS5D79AScaKNykZ2a0Q5KTtS4W4kX5GT0VqHg7+SiQLb5Mo0ZUaw==
X-Received: by 2002:aa7:9341:0:b029:18b:b43:6c7 with SMTP id 1-20020aa793410000b029018b0b4306c7mr2102968pfn.7.1604673390349;
        Fri, 06 Nov 2020 06:36:30 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:29 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/20] Revert "lib/oe/patch: fix handling of patches with no header"
Date: Fri,  6 Nov 2020 04:35:19 -1000
Message-Id: <419d45ad6a72c6e296e27f9ae36ddf2a45671bfe.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: Martin Jansa <martin.jansa@gmail.com>

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

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

