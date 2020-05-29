Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.671.1590789817800884849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 15:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dfkrFM4h;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id e1so5656444wrt.5
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 15:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1tZ4dOUhddBAvFZLsX6c5iTUHJn63DkwEJp7MKgQmqI=;
        b=dfkrFM4hSgugQ51Zm9qM+DQ3ESuy3RPf9ZYklgv1wrXnznPuOwsajcs9zQgNxI0q4g
         Mp4ZKngZUCoAZw3vfsLMTJx1xcwcqB32OhhIoRbgCG+/Pv0g5xpc58G+rv4QvW3fPkU2
         QCjVtE9FtTtXoRZtosKvkb9NJVpvWlobqUD1IB7YhvhAV5+Hx7kIpH60oh7VytFKoLWO
         SLyBA9LK4q/Ato/lMf+tneVqvQI0oTI8t+TJ7TLzX9u/fBxpxeurkHqYjCZmGiuGNFgJ
         UqCXZxlj7lZd99AZv5YgnQe1NW7sUB1peKiTlHSDAA14MO6AYpF6jKountHOYdZTnI1L
         N1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1tZ4dOUhddBAvFZLsX6c5iTUHJn63DkwEJp7MKgQmqI=;
        b=LK94Wa+fAvRNJoq9L7spKETOvmdy1uKTiCWeER7NLi8P78MXq7ur2w8iGSR154YXkx
         436ul4W0FBFZ2qV0pU71fhOJwz7Yym6Rnwws2dph0vmg1jE3mQoLX5U9v7fq7OhI9j1K
         AP9wBz73rThWhZvx9Q0NMWPWJuPtkdtUSqRi69GwDgVY3jywbcbYuXV4MgUY+mGnitK5
         cfKhc3MOTTBqvKhM2+2vQnrbrkxYO1gTv9VruQ5eg5BLivI3Ax4AbibBkGZGVQ/+D5/I
         CH0p53LuW3ECntfz6tdhiW2jjDhmLqhqpUMMz3nct/xbGun+jY3y6evke3JVIJtea7ij
         VozA==
X-Gm-Message-State: AOAM532TRGfcsY0FTO7r+agapoSRMTcKRdfgWVFcg3n2ceON0nCT+3Vh
	wC1Hz8Ke5uNUQf17Kr+x8L9fFT18
X-Google-Smtp-Source: ABdhPJwgXgwMs7OX30+syTJGnyfWs8llig5Ez9KEyUxDdIhcGL4Cd+4oeqjBiVs1HtGM8zGYieFJVw==
X-Received: by 2002:a05:6000:4c:: with SMTP id k12mr10402631wrx.215.1590789816016;
        Fri, 29 May 2020 15:03:36 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l2sm10338631wru.58.2020.05.29.15.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 15:03:35 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 3/6] lib/oe/patch: prevent applying patches without any subject
Date: Sat, 30 May 2020 00:03:25 +0200
Message-Id: <20200529220328.3480555-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
References: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
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
2.25.1

