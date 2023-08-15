Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D01EC0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:25:13 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.138765.1692116704793860130
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3tmCLwbj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bc34b32785so34698185ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116704; x=1692721504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcBv57VDyhzJDtYPADul3TZhJFXBAzxkqahhZg9uLfk=;
        b=3tmCLwbjVpj+XRULQ9S2QevOaRxfIN3dZK/S9ccF+fZ4IelUPL9vGRpbZqxUnTVdi8
         vywQcveGFGeZLyNLl5BpFIORENgIqPuXUQaHzPCyEUVZ0u010mRNlswPdNqSw/DD3oef
         uaGSdK+SKs1QBJNi6JJTzOcnbJcEB9tCxnS385a/2pGmJuXwMjkhwvhlgoyTkzf1fp2v
         WB9jeLMbybobTRPi1US7MBVFUPcF8UN4nPTG5C6M+mZjs7XdkxQRUpeTGyAtW/yQG6Ti
         vxbD18e0kdRvfk2gpKHPacSztbY9BlmWcqlzdFbteoH9515YeSxfYTwQid3tvYD6nBKM
         GIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116704; x=1692721504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcBv57VDyhzJDtYPADul3TZhJFXBAzxkqahhZg9uLfk=;
        b=cWkcBL7ofhP/G4rbD++PWOJJ5L4+9fxSRiUNx44bGaGKHlZGAi6kjeWR+2p5YGnqIv
         4LuPSKO4qiUDA0ZdkAU1Fd4ymLwc43aNsyL21q6OkUFCnr6LvClW7k3TGRc/6wHMYu7f
         K7uWyYS5PNNVsccElb3WejG/cHeiElZcwyNUhJlBl6uywIQ+x4qIdPTZ7/rzi+pnfBwP
         BHVfsHggGSRE44Z7TFzPmDknkYeh1eq6GMpBo6hZ1TULtz4IpKG8U3Fv3DnVRMF+tjtK
         cqgdvnjK4NviYl/+vMZsUwmB34xH8osggjnfmHFy6HJkwzLvoZa937Z4LXebftdCHYvC
         BA4w==
X-Gm-Message-State: AOJu0YyDhogNHcXSkcye44UTcsty4DYV3tvUY3hDC0vdSAb0HbKmWpil
	KLFf/RHcRl9QMrA+ftTv7YJZ+3OCYT1eJaKaQ7I=
X-Google-Smtp-Source: AGHT+IG8g4leYBXiyEIx1sIXYF3zc3buc9mEdlUDevsZXfXb7t6NV0Z9fdUSBxbCPmLCzt3DVpuTeQ==
X-Received: by 2002:a17:902:8c8f:b0:1b8:8670:541 with SMTP id t15-20020a1709028c8f00b001b886700541mr8875166plo.25.1692116703874;
        Tue, 15 Aug 2023 09:25:03 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.25.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:25:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/18] devtool/upgrade: raise an error if extracting source produces more than one directory
Date: Tue, 15 Aug 2023 06:24:25 -1000
Message-Id: <80bdc1b1e116224c6960af194c70e0d08a2fb3ca.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186095

From: Alexander Kanavin <alex.kanavin@gmail.com>

This can happen if running unpack task produces unrelated files and directories
(e.g. if recipe_qa or other tasks run); in this case it's better to stop, rather
than allow devtool to continue and error out much later with a message that has
nothing to do with where the problem originated.

The idea here was to handle tarballs that don't contain a top level directory and thus
the source tree is one level up; this basically never happens, and if it does we
should find a less brittle way to handle such tarballs.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b25e922b271794906b22450c7e6cc18fcab51ff8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/upgrade.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 6c4a62b558..e015a85982 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -35,6 +35,8 @@ def _get_srctree(tmpdir):
     dirs = scriptutils.filter_src_subdirs(tmpdir)
     if len(dirs) == 1:
         srctree = os.path.join(tmpdir, dirs[0])
+    else:
+        raise DevtoolError("Cannot determine where the source tree is after unpacking in {}: {}".format(tmpdir,dirs))
     return srctree
 
 def _copy_source_code(orig, dest):
-- 
2.34.1


