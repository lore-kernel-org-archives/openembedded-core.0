Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DDACCA479
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:02 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.28153.1658155800352709237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vWTUNemS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id q5so9225171plr.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VHZkuw3nrtGohByuggbevR1ZIdWuG2Xe+MV/4WfQaOA=;
        b=vWTUNemS1nAkHY27/AJl2iKnFBcWapOj0APTF4v3rw+uox8WJze24ME2Eu8Grj/vHJ
         oxeMJxTTAhVKB6YItzW2w/aZCUGwy/Z+Xqbnc2/JYyzxxWRzA6nfj84l35Ej0rZ5WJN4
         wzdcROr4OxmUEAdpmvtclBR5XxJeQYd4qN8BMxCc37u4fkXeN+g4yEdji/CWIU1mkb/3
         DP1DJGEF7cAAYrr5OVRpXSl/mhusn94SQiYvdQQZKwvI4i+NJJrIKIKicnEWoDX0usGo
         VwLZw+uzz+OAX2u0/TA/Ggmn6+gt3Vqpg503rXdAdcFd9LSf2udh7paQnBkT8MGH1dzA
         Sy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VHZkuw3nrtGohByuggbevR1ZIdWuG2Xe+MV/4WfQaOA=;
        b=mrGBbBCo9iqKQ7eBI19whdfGxcQ7WbK9jItAodZPsgtWJU69zkoj229A46B/llq8H6
         7CuYz4DOVA7igeti01mLUEj98dQDVJZJp5gUBMl+nyyVo5tlMxVZYlxLt4p2cLzgAsFc
         5ewycqXjc9bb+KwNKu/4U4TvObzJn3dZQ3Rj+WRjnu4xFpE6fs85nIwcncvnYO1ret4P
         YdKswT8EoN4yE1ngTwV6AWa1/j11sL1vbdFwvBhKck8oJz/+KDJJyhHvhplfNU3SQapW
         qP5JtnNHTd91oxjh/JjcAXFK7PUi5btoNbyziE08k2hodvlR9f9A+u5d+VljueF/pm4O
         OQ1Q==
X-Gm-Message-State: AJIora+ZRb1zU8N9oklAjWJyn90cPfpBRN0SDof7/1QwvCo89aBk1oHf
	AfJTo1smfwa/UFAhgkmNjp87BmU20iWT5lxn
X-Google-Smtp-Source: 
 AGRyM1sAFTCJaOzfqNUCUmHBwfQ9zqLnTaKz+ULK28uMykxONU3PFf/mEihuZ8Va0lwt2T8F0GHbJw==
X-Received: by 2002:a17:902:7611:b0:16c:5c53:d932 with SMTP id
 k17-20020a170902761100b0016c5c53d932mr28629986pll.1.1658155799245;
        Mon, 18 Jul 2022 07:49:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/35] insane: Fix buildpaths test to work with
 special devices
Date: Mon, 18 Jul 2022 04:48:41 -1000
Message-Id: 
 <1837c175d997ced1455537bb82fb86286711025c.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168216

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
index 6f6dcb3dd5..f3f80334f6 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -444,12 +444,14 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     Check for build paths inside target files and error if paths are not
     explicitly ignored.
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


