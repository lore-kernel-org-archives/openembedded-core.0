Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AD6CA9ED5
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23580.1791708093396594415
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jmO7zhCb;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4207ac26so959399f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708092; x=1792312892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5SYQq43Arbkx6LNu7EH+ccpXmcn5RIKlUEakBft//rI=;
        b=jmO7zhCbzl8UVaygrsviobZod90uWHDs++zVZ5bJgcKY0xlIeeZuTUnmmZnKFHgOdT
         gNRBH7vpBDMVHCM8+OmX89VU0EGW+PMEPJrgFvSyhT7B5yrqUZOf1rnA/t42NNM8iDld
         tbiDkIv0TQKZPsUSEHV/O0gJa8KQ+lv2Pt1Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708092; x=1792312892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5SYQq43Arbkx6LNu7EH+ccpXmcn5RIKlUEakBft//rI=;
        b=P6xj6hWxamadiXn9+Xhw5vVAugpUCSvCoMzv9EcOgIPp4ItRlHNH3RQ6vU+8Zho52U
         Vizv/b36Vw2t08DpqlQE34ATo/PfjD53fUN7rUozfnlBEX1llU6Nw8+JnBt9RKwkhn7Q
         uy25u4wZGAW7IxVWsjq4bLqAwBj4xUYSbI7/hxde5fXCvAqr3ylBehGhd8lCGtE6suWP
         A2QMi1oqAjSe02eVOx+A0GW9MpbV6RLeh+pVNCoygjY0SEErr/GlZD9bk+nbcRB+vvyA
         87WoB7yVyhielC5+wkyu3ecavZEQPyLNM9U4f8YlkunPjiYWbC47Fs5K3UxZNWrMcecV
         KlKQ==
X-Gm-Message-State: AFq9FYIKGe/37w/8Cbur3MR4HRT5gQnrxUUD4TywYHJiqkzHgNYs/0Fu
	AJQBOa0PEC1+TMhMIMLNRZeyuhv7JB/5WtACFhHsyj4iSerEyXt8qiZqjjUIQ0bw0NX2P95A9e6
	1N8uasNk=
X-Gm-Gg: AYBFou2uywxxxxqIHlMJK+HVMvUHJ3+A9MNvW50r7iD6KiA8s61Wi/BCjZvvOawC+OX
	ifrdCq7dt5mBI+VwD5sF5VlhNSlRzM/DeykgsY+07+lmegX/IuYNskNcvh9fdtfi9V8Dujyud15
	tUiFnYDl6/if8nsP3M1bjsSamI54Lbl2t2F9nheXGOdFPTpnS+S1rFsFXHM1sYCzBJzvxjSwpE8
	ua11BOeatrmeeeiQzH39vnVioZ1ExvLNrShYG2+7nz1tcjz8XJDetqRTOue2tFTRVDZ9Jnv3Y9b
	sOig9ildoEa+tGr7fwXcpT67v9SvH1kR6yaM9hjjpNW7N+LMfu/8j4nt0KcjPQQDBNI+pFTt3Xk
	n8P6C7xcHHPGEG/p4a1ijzLtVTPCGfySTluIdPGl04Jo6Ry8032YZPJRWHe3P+9orIQftdVkPjv
	/ZRRBGswjIS9JasBLPMNUpxUq6IWxZkPreP9UFXaSWMpxodvhzRJJDIqC7fZveYEV0s+77UUV2Q
	RlYp5L7WO81XLJlmazP0kXsplbT+4OfsdnZQ90mqRt1KkF4mvwxBZgotOLPJBy00BAOgumYsw==
X-Received: by 2002:a5d:504d:0:b0:48b:1b6:3df8 with SMTP id ffacd0b85a97d-48dbaaefac4mr8666211f8f.35.1791708091471;
        Sun, 11 Oct 2026 01:41:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 47/60] gstreamer: skip test_queue:test_leaky_downstream test as it's flakey
Date: Sun, 11 Oct 2026 10:40:20 +0200
Message-ID: <f0d256b7822e30fa64e4558cb4804ba916bb8b21.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247556

From: Ross Burton <ross.burton@arm.com>

This test occasionally fails, so skip it.  A bug has been filed upstream.

[ YOCTO #15408 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ac8fa6ada2a0cf0ae27316837985dd57b01e727f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
index 83a78fabd0f..d425eed825d 100755
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/run-ptest
@@ -27,4 +27,7 @@ GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,parser_convert_duration,parser_pull_frame_
 # https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/5163
 GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_device_monitor"
 
+# https://bugzilla.yoctoproject.org/show_bug.cgi?id=15408
+GST_CHECKS_IGNORE="$GST_CHECKS_IGNORE,test_leaky_downstream"
+
 gnome-desktop-testing-runner --parallel=4 gstreamer "$@"

