Return-Path: <ludovic.jozeau@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE913C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 15:36:35 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.20885.1706196989028445796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 07:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=j3Lfr2Ks;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: ludovic.jozeau@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40eb033c1b0so51681875e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706196987; x=1706801787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ixjOzGSFzTVXBx3oPvuCu+U3ggitAnLoNAkXoeYo7s=;
        b=j3Lfr2KswpcLXd3fW0kZSQ5tn9IHhdRR/bUFRY04kV5qhAEtFdD+CCoZBI3Kcde2QE
         KtTOytixCyngq5RWV4YtZw9zJ5Ak8s5vqAipLolPvAC0zmNxGawTBnTeNP9QuWwOS1TQ
         6PnNM1yEXoRCDQPqeqDuEDtCzffNKuvZyNzZsSR+6wJgubLNaBKP3aA9V3CpD+ciaYrz
         SEP1bFDNIOTMjaUhXB+EJ/PzCLyJwvElY7TUs3hRVv1J+ScFMisNRl69zEQJzP+wAci8
         es0koDSnPsR8RHf3dHYx3LZUm7fFZdRTX/LGxm6becuEtAekmWw4/LjCg7+2viC5ezRx
         H6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706196987; x=1706801787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ixjOzGSFzTVXBx3oPvuCu+U3ggitAnLoNAkXoeYo7s=;
        b=FKOjPqpxbOPioumoK5p9AKyK6Ip6orWqnp7Kf7hWF2vCDzi1UwPzSGdVugQF4vygt+
         7VJb8OMYfYhGMYerVHz9HsghqHWhHUMqiwmjvLQBodypLmilgQx7IluwJ+MOfDI/yR9U
         owrTCYoXi/w6dz1NNsDubWFd+tAMwYfWsSGvLkUfipNzlZiMsef7YleI68vTEmlQa8XR
         G1PE9R9q6PI0R6mnQZQuVPW5ky+wLrrmBjt1QwrYhkbDetTP5IvBEqIQ7nQiBvSYf3Vl
         GYrg8no0SP7s0PwdpDf79I6bKS7rvAk5IHY9ayb6AZlcS7/oCw9ziHERZMYWTe2vQ0Mh
         p9Yw==
X-Gm-Message-State: AOJu0Yy3iqH06Jv2WrwEom2Puqe0PGnVNh0kFq6ASEcWwSEOWUZqFL9b
	gASturd+kGfTeua0vjqVKYNw29n5HcJTxgnFf6l6VkoUcKIWdXBa4H573kFii4wTc0k1drmHWQ8
	0QHw=
X-Google-Smtp-Source: AGHT+IH4yFsOUoMEuR5pTHWpAZzuE/HviD+Iz3r41aoh2pS1r8iCkkXh/Box1Mk1xDLmUy6tdZMwlw==
X-Received: by 2002:a05:600c:a01b:b0:40e:8a4d:55a5 with SMTP id jg27-20020a05600ca01b00b0040e8a4d55a5mr740981wmb.68.1706196986985;
        Thu, 25 Jan 2024 07:36:26 -0800 (PST)
Received: from localhost.localdomain ([37.165.209.130])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d63cb000000b00337aed83aaasm21109486wrw.92.2024.01.25.07.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 07:36:26 -0800 (PST)
From: Ludovic Jozeau <ludovic.jozeau@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Ludovic Jozeau <ludovic.jozeau@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] image-live.bbclass: LIVE_ROOTFS_TYPE support compression
Date: Thu, 25 Jan 2024 16:36:16 +0100
Message-ID: <20240125153616.7812-1-ludovic.jozeau@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 15:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194330

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
2.43.0


