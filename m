Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web12.7956.1604187939166114718
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 16:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vGH56LLP;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id o18so10468380edq.4
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 16:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iu42vgTo7zxkqxs4Yug0Qt4N0b+xLbqY+oVxEMXeYL0=;
        b=vGH56LLPvGMU6qf9dsKk+RUGLnpFtIMFi85AoTYTqQ78OHnq2vJse98nuIKHsfiye4
         4b4tVXT3Y4jqb/3L7Oknaj07T6N5wo+mIr5tPY1l8ShdML3OS3q7eRkXjhr+tqP+boaw
         puexpIo466Bx61g1xp8lHXCMlcELfvI2QTg3x6LsImNhrGCFs6Xb09ph8bI8ZdOl0v9+
         HbbwqZKMFVQvIC6KYjri8i20RiJS8HNGGDV2k1i7LLEmkyx15I1RitnqSkPHU1BULrbm
         87K8e8UY7aJMsP1IkvoomCAmBAq/INDJZiVanWP/IE+Wu7oWDMq68mUeSzB/oNtANBFB
         jzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iu42vgTo7zxkqxs4Yug0Qt4N0b+xLbqY+oVxEMXeYL0=;
        b=J9x7SjnYfMcCGg+ziU3/drondFqsxV+gUYcaYS6D6KgKv21F0Z+J5uzUHwkwi2Qk9n
         rKyQq2+6xbLPzRPHKwpZKsWwwGjYZpasY/BiAl1FSkUbla2KQd/tv8ZMaHDqN2y0hk+C
         PbFbgzhwz17SAfTCjywTu2Gy20qmxgQPEyj3MpD/iH4I8VgrPUOBviOJemKqzOUms4xy
         FC+bHLxQstXN+imZo11JgZhrmt1+lGQUrfe51s75I9jIAInHL1B+529LWAk4yJIGH1ju
         SkHtKaBUTgxLPqN4ZJ+rqAepUeO33om5mkM7GG3QFdP4r96xemwHMI4VDzV1pYmBDc7o
         ZUQA==
X-Gm-Message-State: AOAM531LXC+zBbkBLGldW1fgZc91qQ2QZA+RtQkZnRSw4V2y9ow2LSbU
	qT2hRFPdhqUTsZA64Z8hh170jUSwPbo=
X-Google-Smtp-Source: ABdhPJzv8q/d9CeaMCdkkWmNerYbib4WQsGRLKN9aU1YX3OrEjdnqEfjchiyMjxxWyOZ61PLm4KCJQ==
X-Received: by 2002:a50:a683:: with SMTP id e3mr9725826edc.33.1604187937326;
        Sat, 31 Oct 2020 16:45:37 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p8sm1135976ejn.5.2020.10.31.16.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 16:45:36 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/3] lib/oe/patch: prevent applying patches without any subject
Date: Sun,  1 Nov 2020 00:45:31 +0100
Message-Id: <20201031234533.4017117-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* this was discovered with
  $ devtool finish --force-patch-refresh
  where it was removing some patches and replacing them with
  patch in filename called "patch:"

  e.g. this .patch file:
  https://github.com/OSSystems/meta-browser/blob/311067d2d8a50cee5c836892606444f63f2bb3ab/dynamic-layers/rust-layer/recipes-browser/firefox/firefox/fixes/fix-camera-permission-dialg-doesnot-close.patch
  confuses devtool which results to create new .patch file called "patch:"

  $ devtool finish --force-patch-refresh firefox meta-browser
  NOTE: Starting bitbake server...
  WARNING: Host distribution "ubuntu-20.04" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
  Loading cache: 100% |###################################################################################################################################################################################################################################| Time: 0:00:00
  Loaded 2480 entries from dependency cache.
  Parsing recipes: 100% |#################################################################################################################################################################################################################################| Time: 0:00:00
  Parsing of 1718 .bb files complete (1717 cached, 1 parsed). 2480 targets, 68 skipped, 0 masked, 0 errors.

  Summary: There was 1 WARNING message shown.
  INFO: Updating patch 0001-Bug-1554949-Fix-WebRTC-build-failure-with-newer-linu.patch
  ...
  INFO: Updating patch pre-generated-old-configure.patch
  INFO: Adding new patch patch:
  INFO: Updating recipe firefox_68.0esr.bb
  INFO: Removing file /OE/build/test-oe-build-time/poky/meta-browser/dynamic-layers/rust-layer/recipes-browser/firefox/firefox/fixes/fix-camera-permission-dialg-doesnot-close.patch
  INFO: Cleaning sysroot for recipe firefox...
  INFO: Leaving source tree /OE/build/test-oe-build-time/poky/build/workspace/sources/firefox as-is; if you no longer need it then please delete it manually

  this looked like incorrect parsing of the git format-patch
  files exported from workspace/sources (the git format-patch
  version of fix-camera-permission-dialg-doesnot-close.patch
  starts like this:

  $ head 0008-original-patch-fix-camera-permission-dialg-doesnot-c.patch
  From 37dfa11961b48024bedcfb9336f49107c9535638 Mon Sep 17 00:00:00 2001
  From: Takuro Ashie <ashie@clear-code.com>
  Date: Mon, 20 Aug 2018 10:16:20 +0900
  Subject: [PATCH 08/34] %% original patch:
   fix-camera-permission-dialg-doesnot-close.patch

  so first I've modified GitApplyTree.extractPatches() to be able to
  parse the original patch name correctly even in this case where subject
  is wrapped, but then it still wasn't right, because we ended with
  correctly named .patch file, but all we could use for Subject line
  was the name of the original .patch file (instead of the Subject
  from metadata commit which introduced this .patch files as some other
  .patch files get when refreshed with devtool.

  In the end the issue happens even sooner in GitApplyTree.prepareCommit()
  where it correctly found the Subject from metadata commit, but then
  didn't apply it when there weren't any other outlines from patch headers.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 2b1eee1003..fa92abe248 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -416,7 +416,7 @@ class GitApplyTree(PatchTree):
                     date = newdate
                 if not subject:
                     subject = newsubject
-        if subject and outlines and not outlines[0].strip() == subject:
+        if subject and not (outlines and outlines[0].strip() == subject):
             outlines.insert(0, '%s\n\n' % subject.strip())
 
         # Write out commit message to a file
-- 
2.27.0

