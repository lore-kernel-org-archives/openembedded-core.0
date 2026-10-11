Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEA0CA9ED3
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:07 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23428.1791708066091022406
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eHDC6tHa;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c02782159so553385f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708064; x=1792312864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B+f1JEQ/tlxS0qhtHIA25Ioj3m7kgjXXelU1ui0Msgw=;
        b=eHDC6tHa3FUyBHh0WNUXT4ejdBtj4vVB9813AkDixkjtK2NOZpftW9IUi3K3hIYU0d
         G64tfJHvy9X6efvpc+Bl4zIpLfF+G3NGwOZMwltM26SB/pINEwPwyDZhe3VgnZvjfWdi
         5QDevmvgP/B9CuLOyRNk2drijj8jGLMvNYIrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708064; x=1792312864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B+f1JEQ/tlxS0qhtHIA25Ioj3m7kgjXXelU1ui0Msgw=;
        b=aDpxxfpiLQnCD/qtprKcG0mHJT8jubwI9vqTtmVXiQWQZYKmfGxBpZcTY+wsMIlMhF
         jcnJU4BwLHvFLS9lia3Vdl7rs8yRp8q7AlHhEV6s5jwaZT+pe4ysQ/m9ytszJyhynyyL
         MXJyj0hqmDT4bWsrCjFgsFmP/aaUEqVDJSxPk6RwKzfMuO4znR2Ve0y+dsKKPKOjiNor
         WbZCo/yeO2bikCAbYhap2j+3p68M74MY5uNbP7VvErgOpUDEhe5Uo2t/CitvK/bpIHwI
         mnvOjVYWWDv9rbnjrrfyRrgifwGrzAHkvv8KHN3SaMnhNAL/NJMqsyYO6PwTgOXSW7vE
         mdgw==
X-Gm-Message-State: AFq9FYK1Prup88faueMfVWXAMr8Vh2R6AODoetvTSQAXRcy4vSXHOB2a
	3xfJPmQIGa1qLVX3L9/x0G9Ur3ZBiT3HOSrm0vifYFDdrRBbUnNSsT3JuJ85vXq7uYD+GR8WI7T
	tvqwGBpI=
X-Gm-Gg: AYBFou2JDIudVyfm1+b2jRSK2ARbkzs7rDe85ZmtpJHkh5PJtl3r5/fanQDWHEeqsAf
	kEPlW7rjXwcsRxNsoSYqU3EyRjyInD2UKQEx1DHPCsnMAICIps+QZ4cxrurCaGdyGJOuhMtZ05M
	F3W5vq4FfByT1Ij0sJkEXisuodYPoKFwTS+0eclggwBJrILM2vCk4USOiW/gQLmTc9+dAt/Y1rv
	DR4f0b/GmxualKXBnaKuRPzaU0YdE2GKy4gJU1qbu5gSqEzC350vgsRH2b4ScRcYtN5Eom28pth
	VL/5SGw1zJIgY46yxeyIUcYXSg1DKDRj5LQi6Bp3/SVcOblRRND0A2P/gM7iMX3JKaftYh2GjLh
	aD68Jt9D9wnTaZ33mVTR9PjJbo86kWzFFNFsYwyeG4BoDCDZ229fEEOZVo8gq4OOq3a1zDMRKme
	FElGef0LLPEKx7w7r0M6YgDTXulfvSDlz2piiK6LhKn9Orn9PB497ZaoB43Irocavn+vMhlxhNJ
	iki/mdQfrjHnDZEpxOQoBFtnBsedFxc9mfOMEb9t7VcaCZio7VcV9GzC+kVDjEJjETiDG7Dbg==
X-Received: by 2002:a05:6000:4288:b0:488:6ed9:b11d with SMTP id ffacd0b85a97d-48dbacf554cmr11210939f8f.52.1791708064281;
        Sun, 11 Oct 2026 01:41:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/60] pulseaudio: set status for CVE-2020-15710 and CVE-2020-16123
Date: Sun, 11 Oct 2026 10:39:41 +0200
Message-ID: <f238f086cb899acf95f46fdb850d16f1bc246597.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247517

From: Peter Marko <peter.marko@siemens.com>

New version of sbom-cve-check makes more torough version validation
and version strings with distro specific suffix is no longer accepted,
thus leaving some CVEs without version to compare (no-version-ranges).

Per [1] and [2] these are Ubuntu specific CVEs.

[1] https://security-tracker.debian.org/tracker/CVE-2020-15710
[2] https://security-tracker.debian.org/tracker/CVE-2020-16123

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: d202f8cb555f04eda34eb2793c5802aac43f58cc)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a8a5a1e074c..1df24bf04ba 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -297,4 +297,6 @@ RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
                                   bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit', d), \
                                   '', d)}"
 
+CVE_STATUS[CVE-2020-15710] = "not-applicable-platform: specific to Ubuntu"
+CVE_STATUS[CVE-2020-16123] = "not-applicable-platform: specific to Ubuntu"
 CVE_STATUS[CVE-2024-11586] = "not-applicable-platform: specific to Ubuntu 16.04"

