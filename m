Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD8DD63956
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:44 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.13847.1732111058450311864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mh1NrFrd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2124a86f4cbso20468225ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111058; x=1732715858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D4p8N/hsiYwHmbx8TgiAizmOPZSrkOuSl5pPkRX8juw=;
        b=mh1NrFrdK+WnTRV0Grf7sd+yVTO2nUcwtkercvEdHqRnPD24fZ4aBO/lvQsNQJAvVP
         s4ake5jlyz6KXilAWl5Ix7yBMf6jxc1sWZW+3q24lVWC6CiLmjeA6/xXP0PhuDIgQKvm
         /tWDU82B9pP2rqM3mJQRpBrkYe/k6/oTs0aBG44QYh+/KB9waGbeo9cX9yot9XF29wf+
         qnkxJiLiZILD3DkHBnoLBDPOdk+x8me562UgtM60+FspbwQ/ZxiD0Cu62Ntpvefk6a5c
         a6EcHGoDYDiMAzOSyzVppr/kwA3cj6FgKsTafYg8MS7J/uoOWomBR7A4FZqG6U4oazi5
         7YKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111058; x=1732715858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4p8N/hsiYwHmbx8TgiAizmOPZSrkOuSl5pPkRX8juw=;
        b=gkpOOuQmppzi9jOD1pKjZcV5fh4bl5SDs7pZhqv85WZ09QKwvOJiK3y3slVaGfvh3Y
         GNZ94POw7nVAEYWH0Awekt8PPAxQeeSvV2SpvqgWm+704+t1h7RHq/anVbOQNPXEIUUp
         SgCBVyKOO2q0dKVnADVuXEmAu8mfaBB0yFkSJ4PpVQ9Atex9cI6hwo3Xt81YdPnIoKuI
         kYsqJ0/sX3L88RCwgZ92l2hxn9p3vimq8ZMTlpoAg5cIymQHB6+3233ejF7ukO1vqONf
         eHo0A7Ra58YGrELNy3I7mjcn45ZvfRp4ZnFosDCC0DgdJ36s+2PED8Bnv2wBbNPhd8Bw
         iVnw==
X-Gm-Message-State: AOJu0Ywi3PnNyKR7XqR6IZL9Js0fGfKoAUxGAPFo3rrceKR5KYjJ8mn8
	/HxQAcOSP+eGjscvhS9dxXHxTjysk7wAwTOcsKcEMbUBZAHQFQzEDAwbhBY0kXxUF3/2ZqG+0mT
	Y
X-Google-Smtp-Source: AGHT+IFxCzxVSOOWoodH/owbQF7zOYCjzx7doNJK+TwkbbvOCL7gL/0ZfQgpoXdgUgsg9NUQbDqRBw==
X-Received: by 2002:a17:902:fc85:b0:212:46c2:632e with SMTP id d9443c01a7336-2126a35328fmr40284045ad.15.1732111057737;
        Wed, 20 Nov 2024 05:57:37 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 17/31] package_rpm: Check if file exists before open()
Date: Wed, 20 Nov 2024 05:56:49 -0800
Message-Id: <71512c028ac7b214c5dd6932aee9c5c6a9381e4f.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207441

From: Pavel Zhukov <pavel@zhukoff.net>

Exception handler tries to read() /etc/passwd file in sysroot
and if file doesn't exist for any reason then it raises FileNotFoundError
exception which mask the original source of the problem and makes
debugging of the issue more difficult.

Fixes:
Exception: FileNotFoundError: [Errno 2] No such file or directory:
'/codebuild/output/src1899304708/src/build/tmp-container/work/core2-64-oe-linux/emqx-bin/4.3.12/recipe-sysroot/etc/passwd'

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4ad9a0e0b11eb7bc5a3dd45fc8945e094ea949e9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/package_rpm.bbclass | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 474d2491eb..ddc4bf3a6a 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -201,14 +201,22 @@ python write_specfile () {
                 try:
                     owner = pwd.getpwuid(stat_f.st_uid).pw_name
                 except Exception as e:
-                    bb.error("Content of /etc/passwd in sysroot:\n{}".format(
-                        open(d.getVar("RECIPE_SYSROOT") +"/etc/passwd").read()))
+                    filename = d.getVar('RECIPE_SYSROOT') + '/etc/passwd'
+                    if os.path.exists(filename):
+                        bb.error("Content of /etc/passwd in sysroot:\n{}".format(
+                            open(filename).read()))
+                    else:
+                        bb.error("File {} doesn't exist in sysroot!".format(filename))
                     raise e
                 try:
                     group = grp.getgrgid(stat_f.st_gid).gr_name
                 except Exception as e:
-                    bb.error("Content of /etc/group in sysroot:\n{}".format(
-                        open(d.getVar("RECIPE_SYSROOT") +"/etc/group").read()))
+                    filename = d.getVar("RECIPE_SYSROOT") +"/etc/group"
+                    if os.path.exists(filename):
+                        bb.error("Content of /etc/group in sysroot:\n{}".format(
+                            open(filename).read()))
+                    else:
+                        bb.error("File {} doesn't exists in sysroot!".format(filename))
                     raise e
                 return "%attr({:o},{},{}) ".format(mode, owner, group)
 
-- 
2.34.1


