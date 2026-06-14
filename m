Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBF8CD98D6
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105046.1781424229691130642
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BJnxLP6E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49222b6e871so8323215e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424228; x=1782029028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbxCsS/iKPA6ZRpZ1x2mdtedA6vy05NhvOWLwV7T3Dc=;
        b=BJnxLP6EnEpKv7gxIWEdd11YItFUSrddUG0kcEqSVRysGDy4whiHpzf8tKAe6EA9O7
         JIaPbTH/y3Gml55MnZEKGC4+fMy/nclf6k18fllNQOalqQhRp4y04MfLJA7Exbv+yPg0
         cFSFF6FJccwwKdAlb32Cww0I+O4HWrcfIBmd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424228; x=1782029028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SbxCsS/iKPA6ZRpZ1x2mdtedA6vy05NhvOWLwV7T3Dc=;
        b=o6YoZNN4vLjMLoILWtR87xTZ4lgl79Rtsp48xX++cNEec9s1jnAvUpBE0uWVF5/vXg
         t/m7BcJHlBON9hFDGHVuiGcvZ7Pj73MiKgFa2hw8lsWt/xDj3tj4KvEeOQXMeD/uHBw0
         uw8xEXHHddJdvcoYga/+ktP+yy8Jd581id1Zozk+lQO98h7wVm2P9FOUxz7kitt/hrR4
         0HHW5CuEZPXXcWhz7zq0h0mtVfEWZQXnYFrBd+5qK4BkM9qhMM0UDTz0SpaarOTj/mr7
         eZPHAHqPfQX3X3acJmXuinS/3eBnbJXndrRwTwQ7XY2l/VjWdsgqU7lYJFG17oOOJVrs
         LK2w==
X-Gm-Message-State: AOJu0YxFckX8Yo9TsYc7hZgAE7N6fwFjFJkk3tHEvqWXP30cScdBsDGA
	ZRVv386BrPUiGxAv+a2Qe2McFrh0CWkbDTWfspG4m2LzvtubFv9bvNVx+YcP9BSqZZv2tXqjQ0s
	bZB9w
X-Gm-Gg: Acq92OGS0rZx5PtPVOyWimOHh6+RKKA/lNwTuQVy22IWaOF06YntdvrThC3m3ghZGKY
	h0sq3unIyiXeJzVqDqMOfyJYXW0mUOKI7eKkyqq2vCrsXwq9mfRL+Qqb+PZR37gChd5eWCPnTus
	zk7Pp+QHOhldoq8gkSC5pK1DgkmHQETlDI3ByeBCcd8wONJaORR5wUARp67tbOnl1Z7DZYJZq+0
	cP2NmJoAenaHWCAMOzis187mF8TUn/9w9SSepFya5mKH/6sGhgu939lSYo7B/6SzBnMfgK3C7zH
	L3w5pM+vxm9o3uVXLQRRmLulyzxwr+eONj3x/Zoy/mSTwy0c06+2JhFIXfrnE0XtUomCo3Y+5e2
	0Am1nU5Hoq+xXMhVMpQt5JYriKkc79sC9WeuEsdQKQr53pOocS+kVRmFOlio1AC7jx59cFL64yR
	qN2guHmC4r7fMCX/LKwjpW6B5tEOWh6dmaQpzKk4IBRN58033wTqys
X-Received: by 2002:a05:600c:e556:20b0:490:b9c3:6c58 with SMTP id 5b1f17b1804b1-490ec4fe879mr84106885e9.16.1781424228056;
        Sun, 14 Jun 2026 01:03:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/56] puzzles: upgrade to latest revision
Date: Sun, 14 Jun 2026 09:02:35 +0100
Message-ID: <20260614080307.4017177-24-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238708

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 3a6b38f01fe..71eb6673e3c 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "06e37f1e334d85c7c779f79ef9e484ff2f708269"
+SRCREV = "7ad37c64af3bc891372ec16db1531cee599b6e3a"
 PE = "2"
 PV = "0.0+git"
 

