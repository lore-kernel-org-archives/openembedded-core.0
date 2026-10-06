Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0313CA6004
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5179.1791319471775153993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vYjWSlJ2;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4207ac26so807243f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319470; x=1791924270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OQHCuQ8FK3nsGBLpVMLHlaTWt2PwoS9btnzncrcrhPY=;
        b=vYjWSlJ2bJNUo1Xp4LTB7N6gugOIZXwHt8UX9bszP/uDgYlg+k724QyA5bK9X6bXLV
         2SxeponaDfSH8qGfyEQCrAhwZXunoTKMg1+kYOVJpx+cqLAuk/WyRjsWqE29G9GGan4W
         DAAS6B0iZMkrubPm7bqKWlPsWUxni9+rgcGBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319470; x=1791924270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OQHCuQ8FK3nsGBLpVMLHlaTWt2PwoS9btnzncrcrhPY=;
        b=rHt/OesVttk5NrpV3o5zCdWRxab9RSa9MvdzfaFPGd/9HAcEfRjnGHHjS2P2F3/es+
         5aW5oqLbqbH1S6x1Wz1v7i0AcCwJaf0+gY8kU3q0feCiYSsPzOOnvf2CALJkCfPaEznw
         i5y/VOIWBNYpi363eBvSe/sJprUH9rOeGlEcuE4a7npBobXrcvMZpatV2D0KpMfOBL8w
         KEa3RCFePYiczY+SLFq4KTo1Vk1eu9HP4eeeRlLJ6IunueCvLlCkjbRWjfnWM/NqOaWm
         QzGUdS8Bn3W4z9mYm+35PP9mUSn/T1kbfSoVQc/F1T5VO8XHU0mJk9OvgoC+1yr+qcHf
         x1GA==
X-Gm-Message-State: AFq9FYLiEOOC0Z3edb3eHb+7eHvwVpP0DMCbkIb0PFaRVo4lzT7nNKSW
	doP/vjFxhCoTljNmtoXVGeHZ9TBKxU5nC29h1+aUtOqEzfbDxJn9+8p1oXmYIcJnjxSVAhXULPs
	5ZM7AUOY=
X-Gm-Gg: AYBFou1/fwjrlIn4uuo3CcEx/eiM1YS4+FcU3zct3jm5kgjcGXjB+6saB6hLJDdwSy5
	1va1Cup3e+hkhUjTrCUv0yhvZXNWhKYEKCVc74nVfHcDK4lqP+SneKuZJPO/HDIxCe6v1W/T7u1
	Ep/lCY8inLbpG3jyMfJlrA+VF9kOhPaWBQCGRCJJ7Vo54jR18fLlu8K/Nfs7hTZBIhY22fXDfpd
	6Un/2CZoYB26mdrfPMXWsqu6wDy788FvV1yF5U8O3lLaHKaUa1l/ZBxwhJY0XNlbIPKyrRZJ3sQ
	2aDnPab5ERWqM1c8PThp41aEsnZacDMqC3WQl1f9jrZ+wkVmOK+FSiRsaWzOsBDSXf2tY5fLunx
	IdozHlD6DaUpdFDMk8Hn6o7t46L3MBoIMGWMIJUQKknXh5iOVOydEfb7+y8y+dzIt760lZFtcC2
	RghJwtPxq6PMmZnIKDjlVL5ZZKUyMUJpLtobjUdVYQmm+Gccr2RgcZbmVlRkaTc6g5YElH5jB9w
	ytVzTkwcb6HlRpwqnLsicdeXPpPp4EdsdrnwQ8IbdyqGiOcYFIqX/uT74zqKcHxYRE=
X-Received: by 2002:a05:6000:3113:b0:48c:6a50:cbb3 with SMTP id ffacd0b85a97d-48c7289fdd5mr768842f8f.55.1791319469941;
        Tue, 06 Oct 2026 13:44:29 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 11/18] util-linux: update flock test patch Upstream-Status to Backport
Date: Tue,  6 Oct 2026 22:43:46 +0200
Message-ID: <bd7af852ba15d8a49d426b67de0753ea06b28749.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247348

From: Pratik Farkase <pratik.farkase@est.tech>

The "wait for flock child" timeout fix has been merged upstream, so update
its Upstream-Status from Submitted to Backport and point it at the upstream
commit.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 92026bfd34a6f8392e310d8e52cdbdc826f8aaaf)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...0001-tests-flock-increase-wait-for-flock-child-timeout.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch
index 7213b007861..30fc0641f1d 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch
@@ -15,7 +15,7 @@ Increase the timeout to 30s. The loop exits as soon as the child
 appears, so this does not slow down fast hosts; it only adds headroom on
 slow/emulated targets.
 
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/4639]
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/ab519f323c620a32b21a0861285f1a4a5591d3dc]
 
 Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
 ---

