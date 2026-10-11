Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE8BCA9ED5
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:07 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23558.1791708065570755917
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SP5Lcexj;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c411d6615so542313f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708064; x=1792312864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DZjjLcDCtbNRqsZUJw7VODyYTXvq9fliRaBgHcEn7wM=;
        b=SP5LcexjxlPN+mnKLf4J7imjYy30GkdNBv2TuW0naQSZ79V209syXCyo21CTsgpbHJ
         2n1Gd9xzWwR+IKpwlZoTnYwEsQFfNKayhWBqKcrwnfmrd+f+tXFFPhQdvXTQLzrKAjZE
         dLgO/gJHNV9+urZwBknhTIbLg8Yrd1WVCs52g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708064; x=1792312864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DZjjLcDCtbNRqsZUJw7VODyYTXvq9fliRaBgHcEn7wM=;
        b=AsZ44Sj5ZadMzZuPEwoAYcxPxipzycCxswENSizuFvDYR0vP0vU1c4B8pj0xGGPEt6
         psdNJXFkWgbqQKkVhpvD0H7k2hW9ESooHGkydfvE2eo3pXAr6zIaAca4J0YtRgL7ji9T
         W1Qe4M4UNcq7ViyjhRsE+hmKAN3Glx9oGA+3/FoJ+axro+xcQKs1XMrWvS4vMXHd1VSa
         KVLM7vG7k4h0fOkedJGAkeKYzRddiz2rbwC+Yh9PwdNIk0R2XM3TF+CnwvksDTFA1OTo
         R0zUBjZBjkmyqvFqIEWeGaKF8teSLjdHKbSKBhB+8wuli4iWTuxrqGDB0DSgpBJcyVsN
         Ey2w==
X-Gm-Message-State: AFq9FYLctgFOBPMRpMiItWDH5finSzqqNrk3fu/3by5clm7FP+YkuVjC
	syUbCv1b8KF/VHDt3B1LeSNbAWrEfWDfv2xAz9PZbK3xp2ECVQYKk/0EplQ9VemTADsCtYDmb42
	jwkN7ERg=
X-Gm-Gg: AYBFou1vf1BENHloLNbufbCUNzo1VpfUC7TLiOxXE9CnZ8AE0TKw2uIRWrmzS/4FpfI
	J7l8GHjoLy79Xt0eMvyEsYFpop7vRhM6338JBhMZNLwYOeR1sNL3rpQzOZ1dkXiE28UYfG6Lh64
	aeWieLi9ui1y8LLKM1jkA3h10PaEWw7KsaDSt7HISXyfDE8CjLXoDJl2qAp07qNNaG7eWR/QvEb
	FKryhAckvN2mj3FxrZ/gsa29YEgupI97i25+3TOWayKDKnJ0IcBo5ojY5Q1apGtRjYbRI39hY1s
	LrtQ59BfdObiUJDzKKYZgGahE2f3oMRayM2sOnL8wzF6MXsiZtxcLvBDyxJ21WY3XAHKwSTdRBE
	RVLLwTBwUVbQlRK0N2LSeXfEFYfX3MJ0+VGk+m+xgnCrlZrs9rtFE0N3GB1OLJzsl3NdtyLCGBx
	sgsNe7j+gPH1NUzYMurgbmKAQJBXGN3kC+A1WAo3d5b2lRuAi2wivGh3gzKh69MaoQN1wEqzGRF
	2QoS7EROUis6+oa0rCBRav5WxcXcABnmgJeqKUSP9wu1ZBesl7TBIODOI/I9BW8v6HUXVV8HA==
X-Received: by 2002:a05:600c:4ec9:b0:4a1:8961:78dd with SMTP id 5b1f17b1804b1-4a18e4c9e46mr124780195e9.27.1791708063740;
        Sun, 11 Oct 2026 01:41:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/60] ppp: set status for CVE-2020-15704
Date: Sun, 11 Oct 2026 10:39:40 +0200
Message-ID: <26bcc748aee748d6c05682c7bab04c2221a95c94.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247516

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

Per [1] this is Ubuntu-specific issue.

[1] https://security-tracker.debian.org/tracker/CVE-2020-15704

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 1f875a76c3b5aca955f705163b07dd1fe20373be)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index 37e223b4abe..698d6930ebe 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -79,3 +79,4 @@ SUMMARY:${PN}-password = "Plugin for PPP to get passwords via a pipe"
 SUMMARY:${PN}-l2tp     = "Plugin for PPP for l2tp support"
 SUMMARY:${PN}-tools    = "Additional tools for the PPP package"
 
+CVE_STATUS[CVE-2020-15704] = "not-applicable-platform: specific to Ubuntu"

