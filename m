Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2A4F357B8
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:32:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21456.1771943567319936311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EZQ9hn0C;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48371119eacso66106175e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943565; x=1772548365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Z4wMYnoc/zzgxcXLmOuz0WObSB3eRD8a0L8fHUwCN0=;
        b=EZQ9hn0CTxOo6fbVs0ABIznuwiDkKn3fJLpB4cTE0uBpHVfxX9LvIdDO2/++MRRHy0
         FvHN6RCj6BSMbv9vy4MM62fsqg8hfJflPfLQdFsIBBefxC3Zai5B0Sj1ipO4u6Myidgi
         7pg8AiVHuJ7Nto1KOXN7hJWnq+zXUl2LoCyHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943565; x=1772548365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Z4wMYnoc/zzgxcXLmOuz0WObSB3eRD8a0L8fHUwCN0=;
        b=fQWxz5Co8EsH2JVRJwFHmKTXWiByRMV9Y+3R8n9HvBZlJwDcnutUrWgRVJaDpmdRqX
         +YOEX+cw4NPMG50nmvk2o2iqBJfTA6+1PsoWKSogVXviF/iGRqa6LHmraDaTlUE72VfS
         B8UKrvku6BNCgpXqqlbMdxJXMlWnr2TnRSeRGpuRLDN8TtiGtXIUdQhJB2EVXtyOnGYo
         DNYLlOs2oibLXWv8FD9jtzzLVSJV1hFMUYgI4gW1xSZKMadyfB7f+Vd4oknTi/tbWNeX
         mlIGsO6PkFMQzUTmpah/2hibZxpMKsZVpQ0KqqYxRgjGqGxJsXLeSX32JxyJjZG6kRon
         iROg==
X-Gm-Message-State: AOJu0YwCDhjo0PZvAPcINv8CKR1mwUQufdYM3su29iTq7RsAEkbFd8og
	ID2h+tel+R23WA+EGxzDsIovy1YFYxfKTDlQaFTCMnoR3XUsTKGQZa5nOl5SNZ9HT6QhmncmCtL
	IU9ia
X-Gm-Gg: AZuq6aJ+bnvSdppzen5nV+n5gFdTwExjru8KXuuJGeTHSRXUSkIScm6/VBBMsXP0qei
	Ic156vNRLsYzdKOTcCH0ecgpxzjqbezWQ6yuMiYnS9xP8Lh592mWJjBEfnneYjqMxHM9wT/sIa8
	A9JaR/EawJtRrA23Xv6BB4g6NYYOMwgoXUbZrnI3P+rhUpzi8I6U1wcRZCC3+WyhQRGwSnoIDvF
	M5xlAM0RsnEyctnZ0Lh81g2AwSlYI5OSAqN3oES0at4yySLrhJXrQpbA8mhuReXruAcKP/WAUkS
	IfqEAR4Dkn58jSx8qhGq3zIpYWO0Q+2bnRXIS5JvwffDqscUzazWTBDp59GsoPb+RIZkBM5EKvH
	0NDO1fDMFhtX19QNVpY1Cz8OnSsfekFnCOiXh79KUbWgJEZIQt9dIiu0xH65hp8Sx04oieLs1ww
	yNo4sNAdgOvRAT7ZJ6XlB+bG/8szD8kA2JSBDYEBX0/Wr0RQDH0j4yx4lb6qsvd3Oces70cyWHH
	qJS17DcHcvuYLBEoVNPiZxot8A8j8sQ0w==
X-Received: by 2002:a05:600c:1e1d:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-483a9637a55mr223265755e9.25.1771943565330;
        Tue, 24 Feb 2026 06:32:45 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:45 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/44] pseudo: Update to include a fix for systems with kernel <5.6
Date: Tue, 24 Feb 2026 15:31:29 +0100
Message-ID: <933971c6628fa3fe85c7fb45d4b0c87d98750ce1.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231806

From: Yoann Congal <yoann.congal@smile.fr>

 $ git log --oneline --no-decorate  9ab513512d8b5180a430ae4fa738cb531154cdef..43cbd8fb4914328094ccdb4bb827d74b1bac2046
43cbd8f ports/linux: define __NR_openat2 if missing

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9a35f32b983de724d2c2e436c017b49d5b70469)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index bee6fcb1497..0f063f18812 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "9ab513512d8b5180a430ae4fa738cb531154cdef"
+SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
 S = "${WORKDIR}/git"
 PV = "1.9.3+git"
 

