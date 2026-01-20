Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894C6D2ED12
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:26 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6491.1768916302713508806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=errhaScN;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso44798705e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916301; x=1769521101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7R5cglNmpbUTbkBObI1Fnz3pw9dow44tsfoaZQn0vU=;
        b=errhaScNXYQ7Lik8rkkimxBDgMZoiGFEnXuw0aHoetsKYIn77MQxOloFjrq29g3xZZ
         JnzVjwbBwU1HIdEw3GoA22kaT/MmNjOHNBXZj0MQmfY5yFzbLzJEVu9qTodnyTtgr/PA
         kLUh4vCaiBeuxE1s5lKbA0A0SgWwVyKOEnIYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916301; x=1769521101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C7R5cglNmpbUTbkBObI1Fnz3pw9dow44tsfoaZQn0vU=;
        b=HA0B9VTtwKoDzERP0yJfFKEGtaKIPyq7wnHN5LXR68mW+8DDZyQtAPn03/Y65kpD3u
         cSCmUeG5CefdgBdKpcDt0dEFTIsm57FCKx8y/W4yGg3bcStvkvGsvY3grxC1v4g/aVde
         ywlIYEbKCJvYLb+X5QTTXD91kLqvJTSl6hzFvdulszDeX1bjevQM5OlAILNdqCShFsBy
         rjHxK0C4qXJQnNy1Qn1Ueg1sS/q2aUaR4L9Y2pkv0XdVH5B6rmWzlWmmbAiK6XNv/rBg
         /tf8xZgXk+ARF0jWbbz/kogUGjwETz1aNX6aQSodfWXOZHo7C7ArQub0FlQb/ptloay/
         iiNg==
X-Gm-Message-State: AOJu0YwJka54jOHqv3JkZEGy8je72aNSgSN11AL31pEZJOxpZzlVXSA5
	kYEMH+Fz57NYduyAX1oP7a/jI2ZC5KlOzD+jI10PD9ww2P6tz8ubIEUUSWVjNZdpTMjgRHtcBSp
	5UNt5
X-Gm-Gg: AY/fxX5X1rhMN29zRZ6qfqMpyUYpx3o7SracqPsBBOmfnTBqc8zsIRC2wp9TD6HyAPB
	BxFYabFC7PRZrdJ7l2DPPstQMmO921D5VQno2rqgyQixhKiljxMYU3mxzvX05qs8FfR5yDYIKpq
	BMUx1vMXsKDGc/rPSQDJsvEF/0U7VMwMaPWv3k0GQpkUIYfCyOI1nxhI/K8eFxfUASq5uMetjgM
	4vB+nXgBljCZdA9dVxINSyeudwWpHI0kiw1H3uuyJETpYRhbZOmK0ZZKgAaLiOr/GQ5mIS+UwYv
	1eOaCEt2ba0dlFgiMJwj/9j4J2D6L8UkopeVSHglSyPNMTgHCOZNevIKQDbuRG4Ch1iXLRfCCEn
	cXqb2djYuFgLlwsxXgm7ASTpzhZTRDYsBoj0NfmR4AdGjCv1ffIKmcBimJC8Uc3QH0OQoatYeK4
	IKRdqzv6ou7E1EG1cJHatTUq3XDsgFAvlZENbwDC9dDywP59mGI3UUd3cb65JkQXRLGAgYiuxTO
	LPktqQlp49byBYqLp5YKA==
X-Received: by 2002:a05:600c:1d05:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-4803e7e7c62mr30439175e9.17.1768916300717;
        Tue, 20 Jan 2026 05:38:20 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:20 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/26] pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'
Date: Tue, 20 Jan 2026 14:37:47 +0100
Message-ID: <092488b12817ae69204d287b1c0365710820e2ac.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229731

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The pseudo update was causing hangs in builds, pull in the fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8acdbefd0a148c8b7713f46066ae8489984c5d2d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 31d473cf67..dae4f4bc84 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "9ce8c09980af23ebd4ebf072010469882d0459a6"
+SRCREV = "125b020dd2bc46baa37a80784704e382732357b4"
 S = "${WORKDIR}/git"
 PV = "1.9.2+git"
 

