Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B23D2ED19
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:35 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5035.1768910967424918785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uIIRe9au;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so33430365e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910965; x=1769515765; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNz7FAA15gE4Gye59MMBcGVvU6mB2iTKMjbDJ9CSmMU=;
        b=uIIRe9auq46l5A+XdlPjV1yjYOmPAj+x7dxS+/KPhchcsEGcamCdzhdlCzKScZaF8J
         P+gq3zHby+AzCYdSkiVk9thi4wUfIIWFvutov1fWTjZAqsJCUMOfoGcTBJPmHZV5YVIX
         ns4+3qv0Jo/kJ7lIkiGf6c8ES7V10uSwwIOWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910965; x=1769515765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iNz7FAA15gE4Gye59MMBcGVvU6mB2iTKMjbDJ9CSmMU=;
        b=Yx0P9UMXuycEXECJ4TNU9t1BRNn8KN2QE9jPL7/Y6B5xJ1NUiCFG5aVCl9Qfv2KBNP
         Y6rosjg12rtniyeCCNhgwo9SA15vb9kumsyO4lHBnMsomiLXlH3zGRvpN+6Uqo9rSQDi
         ooPjTcpRRL+hwd8PDfyLTFDqA4kLwyzL2svKxT7fNEnhKfbnHrELg8n6d6vXhCsfgUiR
         7j1QWzt+jETdpQPrHduKTaR5cd8rt968kRVI54kRpMW9EhrFDhha7mKT1vYs11daO8JR
         b9uQjQWCb6Ahygqxx5ywtlbr4s8RUp6EgHiCKnbl0oXIH+uZzSPSur5h+uNiLUDVcu+A
         18eQ==
X-Gm-Message-State: AOJu0YxfQN+XMQzh5dvTbXAokEFdOgvCgVEqLrIKVhHLilzFloa3wToJ
	kZEkORnsXqfDV4iQ6DXPLo4zcvBnetWd+apJ6P3OyveIJC2D9kzmUpeMudd2xjjx1JJtcfGockk
	ZHGCm
X-Gm-Gg: AY/fxX4Sa4wqCzss/54iwuTzwPuiS7DXwEf2J64ceXna1ZJbl1/OAQERPYRhUmdbMpg
	cqvVrxb61GuGMz7lkdjiyVB9jHipgmp7H02Nmf2Nf3MGE90GFMx5CvbtUuKifJIWEllbZKgf1RI
	2QiBlEGjALFYyqRX/OwF78/VczlKcJ9i/8Baxp4jK4ePKRYaYQA3fMi2hhrb/NpK8XnExh2vr77
	vHXxYAfNete9sOaVbOTC0nZONmSeMjMZndyPoR1YixZrCyw+jQiP3gIqUT2mFuoHmrcytz4aqIc
	QdUdeTNzcT+1EDwHkE0R5sRWNRFBwZlkAR3ne80niu2NG1sc37zP12tRFAYgYUG4nx/8bHl/daz
	CQDekHGVmhm8p43VTRh00d4vefFbqASMYPOhPQ73vDsR89vFcrs9KETrkEbITek1nbAlGbQlZAp
	7vTGZEMQXbnRigdscNeuaJrgHe0BMGP4Ct/mLMLKz3tSrYMOPlcvPShQpq5xYNzRfsq/J1uK6br
	b4tPJpu4sEUxBFn7wsjIw==
X-Received: by 2002:a05:600c:3494:b0:47e:e8de:7420 with SMTP id 5b1f17b1804b1-4801e33a85bmr198079395e9.22.1768910965455;
        Tue, 20 Jan 2026 04:09:25 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/22] pseudo: Update to pull in memleak fix
Date: Tue, 20 Jan 2026 13:08:33 +0100
Message-ID: <6eda2338a0e3e7c10f160ef113acf059eda66f69.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229697

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 42137b6f97da0672af365cd841678f39ce5907d2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index ec9ef2dd5d..87730511a9 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,9 +12,9 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "b4645cb30573c5b3d5e94b9d50e1e2f8beefe9be"
+SRCREV = "d1db9c219abf92f15303486a409292237f1fc790"
 S = "${WORKDIR}/git"
-PV = "1.9.2"
+PV = "1.9.2+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

