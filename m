Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8A6C25B06
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 22:32:41 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.1037.1660170755860520879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xzxwqatf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id p18so15460258plr.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=umxWvzxTWDSiU5FdY9twduOqwB9kx+8Ukrs0Ir+sOtU=;
        b=xzxwqatfOdrStsre3s3PnwrT6mHXx+da9IL10IJ7bbs6qOR+ns+bkFf0pojaqkHq1V
         I+txLgQ0ddzwWKo+ZzfmTkl4Qn0hHnKpSwDPXGR7u/IXn41yZTgweW2Zleap0D381Rxa
         7MtjqlCdkzqk4ysOQoJfP8cBPQk6x2Z61jj3dOTuiGVqIT6Tk8OPjOpp3veiXALl7PMT
         BqbhSg3hc/YLfxh4SMeDpxpuhnB2zwerw8ERK5n4bNuGEP4w33VFLsEfdOmBJAfO7iKg
         /uCFguvRl5M2J8H4Iqbcwa5PS2WWCA1vXZ3AlXAIzO5vqjGkzDfm8JXkPIFJQUh4rWDc
         7ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=umxWvzxTWDSiU5FdY9twduOqwB9kx+8Ukrs0Ir+sOtU=;
        b=w7UTR+YAXCEJyzd/a2pghI98vXtkIUKJxrIr/Oz5ksSB1H+ffTPD87fxF5U16UIASA
         8png5aoutVPwk6MLbdjlunnNMRexRbJhqDpLzBxnWGrbB/H3yEdlz5fyDCqDx/nTYLFt
         I7S5thfSe9kprf2gUYoQxgsiQWicsBzpncCrrqdYQq6vjEx3cFghtwBsgzNspwFzvwtT
         uPkERmyTtQGqC2VFeruNHV5KOjH/+AXQNll/M7bejotdwkdW2BM/dZxQ5QdyAx5MlQer
         a5q0A4IxHk3d6vb4jkNCI3nSToTNndWm3pzPKOx4FXAZmpsW/lihp06ZB04Jyy7sByKf
         Xm3g==
X-Gm-Message-State: ACgBeo0VJNdxxCqCvdVz3iruDtLBtVlV/zon+skaiaS6dCrD8CGkGLjk
	yQ7DxXtoOSB+NJ3WIjPZDn0mRF273sQgNt4o
X-Google-Smtp-Source: 
 AA6agR62L7qfnDdGaryB/pMRL/ePJ8H/LAvQCJLH93yL/dmAVoH8+66SZLbomPZxCdRijHzbatyipA==
X-Received: by 2002:a17:90b:2243:b0:1f4:e8a4:8c38 with SMTP id
 hk3-20020a17090b224300b001f4e8a48c38mr5937177pjb.136.1660170754937;
        Wed, 10 Aug 2022 15:32:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa79ace000000b0052d7606d144sm2532513pfp.74.2022.08.10.15.32.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:32:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/11] insane: Fix buildpaths test to work with
 special devices
Date: Wed, 10 Aug 2022 12:32:04 -1000
Message-Id: 
 <0106c6a629d0a9f07d76ffaad2dc92e48021e1b0.1660170592.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660170592.git.steve@sakoman.com>
References: <cover.1660170592.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 22:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169219

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If enabled, the buildpaths test hangs in psplash as it tries to open
a fifo and read from it, hanging indefinitely.

Tweak the test to ignore fifo/socket/device files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2567edb7e0a8c5ca9a88d6940491bf33bfe0eff9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/insane.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 77a2039738..d6da53252f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -452,12 +452,14 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     """
     Check for build paths inside target files and error if not found in the whitelist
     """
+    import stat
     # Ignore .debug files, not interesting
     if path.find(".debug") != -1:
         return
 
-    # Ignore symlinks
-    if os.path.islink(path):
+    # Ignore symlinks/devs/fifos
+    mode = os.lstat(path).st_mode
+    if stat.S_ISLNK(mode) or stat.S_ISBLK(mode) or stat.S_ISFIFO(mode) or stat.S_ISCHR(mode) or stat.S_ISSOCK(mode):
         return
 
     tmpdir = bytes(d.getVar('TMPDIR'), encoding="utf-8")
-- 
2.25.1


