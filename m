Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7130C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 19:38:02 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.4931.1706816273591653789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 11:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cpM23bhn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6ddc0c02665so863435b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 11:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706816273; x=1707421073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vl0eAIhiGYkZlRENrZneh2pD0ndVybEqit5a4twiuqw=;
        b=cpM23bhnOABz07SbW4X2rDhS4IwObklCjm8aWdzPRFCgeVNy2GU7USDNw1N0giuhNe
         dxVPSxxapSqdhMsg6ARmgA836Vkb74FBzvvGR/jLxB9j6SqCR42Ue4GLyrv2Da38bDQV
         XsK4mq9MExzUn4OdAyGveM4YWubMN5zc1AgeHL8eEbsPjMkUiznq0trp3mSTBv4WaqNq
         wBKYXVz83l1z2c0Qa6AgLtW0STdNE/PQJkxzITdX8NgRcOzTEHbZlCsSJPCXOVRrS7yb
         HZqSgAT62/nCy0IE0i0BugpKEpN6VdTjazgqLxJqcIkJRRENpDvvTMk+q9cS0PJiAx/Y
         /Iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706816273; x=1707421073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vl0eAIhiGYkZlRENrZneh2pD0ndVybEqit5a4twiuqw=;
        b=kbe80FsG8WzyRCR2b2+m17jmCswB8A7+4IseAX0RRWJWFfKAool3Jr/bWIR4u7Cceq
         AXCnNtkyAlt9PqsoiLbiNyZMOYlwVMdLPMBKOe3BCmgkXtQjqiDmvcw2GJ1KuaAUcik7
         Tb4NA0NwNsDvJ3z3/B2yIovYbmtCc8yJaOSFJMccW75QtD8sEJ4Szi9T3IW7CNDhfQrd
         k22jizBT+XefNqnOIeohC02WzcV5c0GrTTIJkbAYKT8WOZZKIaVA6OGkM9Gdh5f4lP1W
         Dy8sLFre1MdcuLaLzZGmwQVU0mDJtmsfaxmuKXcN/taC5EbBh+JdQxawnjKm7NrHvt1o
         GHxw==
X-Gm-Message-State: AOJu0YyFghgqmWsc7Q1PmARlE59CWW5KAD8DPx0zstx6ThQ1sMBAC1BY
	k6Sy97IdYKQGfc+seoxEylTWC3CCkkbZ5hUPnJf0L5/ln5xgX9OgRk29XyQCNEopj0yFvQtlv7l
	0Ejo=
X-Google-Smtp-Source: AGHT+IHn/pdGWytbMYdz1cNHf2fV8jYIMcy+uOEX3FnCDl4ZC++xa4beAPzVJu80arXCIwbiXfZ42Q==
X-Received: by 2002:a05:6a00:3206:b0:6db:b287:d43c with SMTP id bm6-20020a056a00320600b006dbb287d43cmr114876pfb.24.1706816272679;
        Thu, 01 Feb 2024 11:37:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id e10-20020a056a001a8a00b006dbdbe7f71csm109717pfv.98.2024.02.01.11.37.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 11:37:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/4] image-live.bbclass: LIVE_ROOTFS_TYPE support compression
Date: Thu,  1 Feb 2024 09:37:42 -1000
Message-Id: <60d88989698968c13f8e641f0ba1a82fcf700fb7.1706815725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706815725.git.steve@sakoman.com>
References: <cover.1706815725.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 19:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194738

From: Ludovic Jozeau <ludovic.jozeau@smile.fr>

The task for fstypes with compression is the same as the task for the
uncompressed fstypes, e.g. when adding tar.xz to `IMAGE_FSTYPES`, it will
be included into the do_image_tar task and not creating a separate
do_image_tar.xz task.

This commit fixes `LIVE_ROOTFS_TYPE` with compressed fstypes by
depending on the actual task instead of the non-existent
do_image_<fstype>.<compression> task.

Fixes [YOCTO #15331]

Signed-off-by: Ludovic Jozeau <ludovic.jozeau@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 67c507e3d42e52a6d452c4a453eeaf7f2e2d68d6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 2c948190cf..c0c1fb31ac 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -30,7 +30,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         virtual/kernel:do_deploy \
                         ${MLPREFIX}syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot \
-                        ${@'%s:do_image_%s' % (d.getVar('PN'), d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')) if d.getVar('ROOTFS') else ''} \
+                        ${@'%s:do_image_%s' % (d.getVar('PN'), d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_').split('.')[0]) if d.getVar('ROOTFS') else ''} \
                         "
 
 
-- 
2.34.1


