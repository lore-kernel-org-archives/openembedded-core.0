Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.12487.1604673386353446952
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WgpLxS8y;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id k7so745265plk.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MeBxCeLtoyIyP3/nYutY01T5h/usjsydftgc4dB/YGo=;
        b=WgpLxS8yOxwpHNCCZqokHc1VMbHua0KW0Nj6nUYVXb8bsO53tALKqe5iKchAppi2lA
         JB6NzQclS/sSKG5kPbld2GHlxVx8sAkF7tqg2VtFOPif6ylfl1mlpvdZ55NVkykZozSk
         sxx8LQoZWKP81lAfk22CKsPvEQt4DVqLbOIlWiIZN0VshWjVxe5by31MBX9yx5IMA6/4
         dtWj47erdEBV4cM7V+/PvnQTLK3i2gdu91b6cQ5wKye5cY03P5CV/Vzsw35ph2lmBzfH
         zPu6UirKVqMJGKRA7prqwyOSU5zhckMms08T4FcTnP2Di8PPK72b2Sl3tTiVvLeX00VO
         tRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MeBxCeLtoyIyP3/nYutY01T5h/usjsydftgc4dB/YGo=;
        b=F6bS301KY6CTFFTLA1B6rrnjfpVB3/VhcXJGFwMkOyyHyFDA3mEXsK1amPIcLtvfYe
         sT0+UAIPFiqbDHdMoesSR6CyIr529sF+hPVY9FzfTJa6BcYe/dZHUtY78ucUfofYoXcl
         +ZsaNXMR5qb0a6NEjJgMKVwm9zSUJy3NFdWfZ1u7/gTJuZk8fnENYyC97GXhbg1rv0+D
         JdiI87DNehuvMk7N4GLAG6ywwjG89K/1hhSJfenUv71TvsRI2vu59SuwOxjVBu/wRVcH
         Qaypq7vgW1mIg+51nho4O88MO8r6xFkl3y3/7Rw029CESDQO/AkSkPIsKMXGhj1JBE94
         NfQw==
X-Gm-Message-State: AOAM530xr/CzKYqlf+OMdMudDsHu2h4F4LU0EeLuO2psGPXcCJ0vqglN
	jgUWBrmc9ZMX3p9ei7eQThYoj7jnx/ZlVMbX
X-Google-Smtp-Source: ABdhPJwPDwYv8SbakyNy5U/SO2z5NY6wPwvGUyb0xPz4ZwQzKq7qyc11wYuMkomh0IDLR/8VbrHQIA==
X-Received: by 2002:a17:902:d713:b029:d6:c5aa:c163 with SMTP id w19-20020a170902d713b02900d6c5aac163mr2036233ply.59.1604673385329;
        Fri, 06 Nov 2020 06:36:25 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:24 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/20] lib/oe/patch: prevent applying patches without any subject
Date: Fri,  6 Nov 2020 04:35:17 -1000
Message-Id: <f4349c395749c30e70587fc276913530e518836b.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

