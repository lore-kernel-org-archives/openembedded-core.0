Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17146C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 04:07:47 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.23073.1646626065007202423
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 20:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YxJv2XX7;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id s1so12640487plg.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 20:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ju5zQB4R60cnN3gKXP/cfmtPwuQR/6VHxQWOKclpMV4=;
        b=YxJv2XX7gnFlgsSSrHVsvO+iADKn51YPj674NbhfpCs314Km0o1OGZMv3+lYA82bae
         +OZYEHPVSSMX33ICVDzyExhXiiPZrqaSsffDsFzCHWoPeafAXzlCWdRBxsNDILj5tmAY
         com9rmGzFenVHn6b4d+WYycTRj1Xy6DOzr5IjvnzgTjhIiRPNhciHFMtpKjuvC7vl4LU
         g3hw/0nVwpmgx1G0ouv5ncC1iKqc4Qf4Y9hoJkzOE06HPYH62/iC8LfONzapKmz1jKHJ
         AZQuxi1kwq3SFmSBqCCoGT7PwJBRRhed8aQyzjZONoWaBksO6jkdNSFtK5zcJXZR5LQF
         3M6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ju5zQB4R60cnN3gKXP/cfmtPwuQR/6VHxQWOKclpMV4=;
        b=bvyXNL6VtLB6FdG/S4IN43GDgU2z0tsLCg+Df14mGJ5BcyhME3dtn18dpO5h/uVquo
         +o1R00KctGdoOpz0bGMaZ1lrPD+KLkR7K8iQLPcfc6nRQTHkA0NR0W/O3CWvPyTEH4BD
         EwRdH0F+PKLly16RpZxxXLw/qlhnlzvL3qUjvm68+LtyXjTOAx3Jd4WLywtyD6J0Xa57
         8WVtvCH7hCxE9qaRu02hqw33NGaHjbMFR+CkveKcmE6akAty1pBa6sz5zavYc6EVlH9U
         ZTbdOlb5gxflZEpBQL/xVRKyOWmLuKlNTGxcmwaZ6bPfZvas7ZR8swGW/Nw4E5cuZtZe
         MyRg==
X-Gm-Message-State: AOAM531n3pQ49DfjPbJhHIv/gelRUyTGj+VaiJIhmkcIZk0u6Nl7H6Wa
	OyOlrxpKfp3gdnI7FzIG2OmCJ0VBGpdXgg==
X-Google-Smtp-Source: 
 ABdhPJzI2+kxpvojNFXkwgvX+nModnwP9VxWSLd/YLhl3nNbuYRAQ2LTma/P22hOliGmjoPXdbfv1w==
X-Received: by 2002:a17:902:d2ce:b0:151:6781:affa with SMTP id
 n14-20020a170902d2ce00b001516781affamr10384155plc.168.1646626064190;
        Sun, 06 Mar 2022 20:07:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 j13-20020a63594d000000b003639cf2f9c7sm10438821pgm.71.2022.03.06.20.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 20:07:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] kmscube: Fix build when x11 is absent in distro features
Date: Sun,  6 Mar 2022 20:07:41 -0800
Message-Id: <20220307040741.3566970-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 04:07:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162796

distros might use openGL but not x11 ( e.g. EGL ), therefore fix build for such
combination

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 68cbe8c9fbf..58ce26a3d51 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -24,3 +24,6 @@ DEPENDS = "virtual/libgbm"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
+
+CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
+
-- 
2.35.1


