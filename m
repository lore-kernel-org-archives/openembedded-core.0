Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.7934.1604187941414970693
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 16:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PNNEjSbR;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id a15so1649235edy.1
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 16:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cg5THHSe9DnQLfJb98IF1xSq1QekzizofsuLO8xfE2A=;
        b=PNNEjSbRE4l0yXoErrJPwe+4ijsg+J/x1kk820XL0nqK+NOmjgOOkE4uUNK2La4+TP
         lYdp/Yuaz39vrePsbVCaBweToVvIJ3qVX0kI0TjCnwDpngQ+SJZBZZCWe/BX9jp0PDll
         MJntXSSHF+TcZlAbP7CENcFEh5fpyZQZLg1mswRn1/s2UgT9N8OVKK+Ls+tHaQz1yG7p
         TQ/23aLZR3+oYSZUiHLjcRxoCha1VR+L0KDz3nOZAMaRjwRzhcwRnN/nL+aWaI+Im+AB
         DzP8QkQtZVcSi20ac2HntlaCc6ig4PXNI/KeHEHJu5O5nOznNVpc1ViUyRFSdJci+rTv
         fB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cg5THHSe9DnQLfJb98IF1xSq1QekzizofsuLO8xfE2A=;
        b=VL1c3i278jw5xCigS1m229ZWnPHqrbbQIfv8stY6J6gY2qAN7BtzYRkOSGysmXrtLO
         5NP5UgKVe2JQu8IaouPGrTV0XhSlnjivKu9qLqIJFmLbQAg9MR2WWNyv/phUXRbfT58y
         Kf5ictpdJw/458UbJHQCh7M5J1YFgbJMOG8reEesn4wkUIUrkNQY+pITPO4rCzQgGCdO
         xHohx2KIWIwL0PsanKKFViZLLNsXKRwoE66AHFMQYtQci5ui6HHrwHeNTl8f0ikaiGkF
         cmiCj6QRAkM0ctFIb1fJLSxxs2CGQBzEHU4Tum0LHxCrLab2E8G09lQ3SpcHp9lkize1
         UhOQ==
X-Gm-Message-State: AOAM533k96EE5AgaaE56bhkOl81B+Y2UvAK2bPFtCg5I0B4N5DWFPO6A
	nqaykiwnZO3iyWBvgEZpbHR8s68W+4s=
X-Google-Smtp-Source: ABdhPJyJugA26UB6oD7T96p+I3UTJ2ttN6sQpFMaS2IsCsOli6omzhk2S3pXJu58eRSUro/JJmb0OA==
X-Received: by 2002:a50:8acf:: with SMTP id k15mr9694812edk.351.1604187939713;
        Sat, 31 Oct 2020 16:45:39 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y3sm6096931ejk.92.2020.10.31.16.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 16:45:39 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 3/3] Revert "lib/oe/patch: fix handling of patches with no header"
Date: Sun,  1 Nov 2020 00:45:33 +0100
Message-Id: <20201031234533.4017117-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201031234533.4017117-1-Martin.Jansa@gmail.com>
References: <20201031234533.4017117-1-Martin.Jansa@gmail.com>
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

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
2.27.0

