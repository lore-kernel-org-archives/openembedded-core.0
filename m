Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F83D767F5
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 11:43:28 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15105.1766144601497971424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 03:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QkO1WAey;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so15747035e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766144600; x=1766749400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QYEFXynZ6z2giDTXuSACF5RTGmP+FMi5dV2Dcg+oGY=;
        b=QkO1WAeymtBHmXko/rhQod0OOxk2kAWM1pxBwsfHxk0RCCuthKgIYe8ZxVwqY5fqC5
         Nn4z9O4dWgnDYHAASYBSfK/BY0niwtwN84uHLtxWjZnK4Xz2+JAaaWAETUgY/48LY0A+
         Rwl9jv66tOlqfGBWhRuJInYU2vbOD4wnkhDvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144600; x=1766749400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QYEFXynZ6z2giDTXuSACF5RTGmP+FMi5dV2Dcg+oGY=;
        b=leczOlfQr+yenDO0FTt+9oipQ++97kCtuM+jUTAn7yuLwGp0GEgEMsfpX/2n+0H/dd
         5uM4W6unxSjhiqHWUh5K7HuURFQBbhSB+DlwxsSdtkcj/5CV9fHDsO4O6BFX1y+WbVyP
         hC0V47zS0fRJGv4UUzaJQqhSdCX1SJ7WD96qrqcH55NK9wjSfim/z7lKzqnGV9fmM9MU
         pR4PDzLZGfnJwubiXynBXCoonlYCtq0NguzJ+ESqoULDCTqaiN03DqR07wb/iQg7B7Ag
         bvnx/nXjptQzmcC4GiTD0vNWpf+wghIB3uMYIRbPP/xgw4rLI+6yBsK3oEJoLzkQw0Fs
         qoVA==
X-Gm-Message-State: AOJu0Yy0/XK9bJwsc4NkWrhSP5ax5ANRrCY+l1pAa/kARH5W2SR2bo+q
	mxQeem+Ru3l+uFYw8lOFo6/aHr40ZWkt6od3HGmN+NDjp3WuTXm1oQfF/kX2pMijMus/A+ABQZe
	NfDpOMmE=
X-Gm-Gg: AY/fxX6GG94Shn34OEloEIv3NLvFfraAm+94djDGVgKILn38AmH84W9dVR0Eo1XQP8D
	cqFR5sggs2jvswI5LAh6baFUGe5V2s+VIMFm5pNKT84XV9qSK/muzE0wuNuMMPrMdHDJAV3AraF
	GYPdnxxvE/M+OaQaPLDNU/Uy6fDiChOnSGAfjFa7I8T0V0GRLR5repum2p+pCKt40fZc9DeyLi+
	WYH3upixdi9pNGMnexm5eeD/RgCTgOas7GczRbsI3+nIwDJG2/Bw6zAc+PuchyS2y6EvDJeJe7K
	mGInWWP7yp0jrNgyqDkJHGfOM/qZGWw8O/Jozdc+l4nn4Ka7xzi5NTxKEfpqMhY3DXvirqa8Zrt
	0/UNcyJaSroShQfo8XajX98r8s1e3kv0Jrquj7Z8tx3mBCDQV07OgmfYi8ysM62iUzRtxVx6wEv
	vG6SN5OocUxaMV/iQiBoKpUTRmUAMufU7xmIJXrqW0x7RWKmYHjcy0H1E5W9MM0qiCuqpRVkli+
	zJgR/R84Azoc41cnak=
X-Google-Smtp-Source: AGHT+IEFW5vjHD2LCy5icZjDq08zAW16jFb/7gQc/QhR1tOwJwJvRNzCGAFpXBRiXM5o3ZO0KhMSMw==
X-Received: by 2002:a05:600c:46ce:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-47d1953bb1emr24680545e9.1.1766144599866;
        Fri, 19 Dec 2025 03:43:19 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b749esm92167635e9.14.2025.12.19.03.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:43:19 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v3 2/2] meta/files/layers.schema.json: use URI shortcut for some remotes
Date: Fri, 19 Dec 2025 12:43:16 +0100
Message-ID: <20251219114316.1574858-2-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219114316.1574858-1-corentin.guillevic@smile.fr>
References: <20251219114316.1574858-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228219

Among the three sources, only two have a single remote. So we can replace
their entire structure 'remote' -> 'origin' -> 'uri' with a shorter one
(property 'uri' only).

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 meta/files/layers.example.json | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta/files/layers.example.json b/meta/files/layers.example.json
index f3b6522083..d990502205 100644
--- a/meta/files/layers.example.json
+++ b/meta/files/layers.example.json
@@ -5,11 +5,7 @@
             "git-remote": {
                 "branch": "master",
                 "describe": "",
-                "remotes": {
-                    "remote-alex": {
-                        "uri": "https://github.com/kanavin/meta-alex"
-                    }
-                },
+                "uri": "https://github.com/kanavin/meta-alex",
                 "rev": "05b25605fb8b2399e4706d7323828676bf0da0b5"
             },
             "path": "meta-alex"
@@ -18,11 +14,7 @@
             "git-remote": {
                 "branch": "master",
                 "describe": "15.0-hardknott-3.3-310-g0a96edae",
-                "remotes": {
-                    "origin": {
-                        "uri": "git://git.yoctoproject.org/meta-intel"
-                    }
-                },
+                "uri": "git://git.yoctoproject.org/meta-intel",
                 "rev": "0a96edae609a3f48befac36af82cf1eed6786b4a"
             }
         },
-- 
2.51.0


