Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CC1CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 10:18:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16932.1781086712897068266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 03:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3pJhbozO;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so38861615e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781086711; x=1781691511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cleBijgVerO+eoOoE92hyDVItaWG2GRYMgOohlqB5/0=;
        b=3pJhbozOhl3ZXR/Jrm26Rw5QjUS26g1nAftPFv8kTFMUm5MW+w8oXo8GdDzU6TJbyf
         ID0qCwQalybFFeEc3xpVtqN6w+xZITAqdZtDtgjkk56tgOFT6cRnMAKjy0Ia+ovwt8O1
         VkpSvDYMX7Xo9KMvxrWuXZEbOHVM7LZPR/io8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086711; x=1781691511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cleBijgVerO+eoOoE92hyDVItaWG2GRYMgOohlqB5/0=;
        b=clGo5eNYMDKhCcLApZ/xGs5809KmHu1ZKdM9qXaUv75Vth2fpR2CXBbWRNxxYlk9D8
         W/CL4fvI4ZY5hcbHQ9ooeoBk8mS03y/Z+bI9EoQypbEeUaTOUpBAqlkDSQlGf5mFd+8c
         Dqh8FN3S5toVt2z1f2K1wHLp7XqPivjfJpTXfeWJi0EbTYypOMBx/NP8hIRQz37Ac5/a
         sn7F4jB8xVdo5zzFuU322hAjGqDpCd8hfzhlPsCIKHttQuwdjiPsnQF6PIijRISDnYyW
         gLniSWCb7M/h77YFd3nOlP3xGUlITVC+d3hQwfKE6bYtaJ1GNZGow3lSddfxgQK9DLDf
         mblQ==
X-Gm-Message-State: AOJu0Yws6PxGmIKy+XeZlSuKOSG4LjxiSowfPa2mjIshBtQbzm+eu7ZB
	K63n3dZZu7mYI7XJP2A0kU+D10H0+/6rJMZ/YK5aLUq4aJQ3SCIkdSSpdjjCJw1xvo48JQLRvdX
	UjryA
X-Gm-Gg: Acq92OHOcGaAbJU9omHFoOFzSUSlHcQeE7PHi469OGqLvAWuzGA+JPU1D5+m9Pg88IQ
	F2p9F4MF+OPXvqTtCeEuK7NAUVXo7l8hGxRwjlLMqcaa8Mgqsd1XbxYRI9Z+NXoqrYBukhVTCVx
	Tu+BZ6t9nZe506QXUZY+BG9WOIVNFwdSL7cB44fTS2yOltQYkVTrGvvoA7CZvoA1F912ihD03Gn
	mUKjcsMsUotqgwExW3C1rwEYW6g7hZTUrKWLGz/RSmCdYosmwdEeq5NwPuzWmyo4k9RETOoIQvD
	LdcFvs3crbXDD9CWV0bdEAFdTui+CBtQ6lnr5l6Sj3n7XQm9/qysO+xzF3ld61i3ZJT51/xlU7z
	KTGuXGXJ8/KwoI8mbKaRh+/oJx6P/DhZj7lsJAhPgrTVeXFrj9qsAk5buGRFIp/L01xZd1rY+wg
	nOdkMHSDQyYDjCMGVM/a4YcrrYuAlvHEsRCvsIzgL3fyNyrdPvcJO9qW7rpxTBR7RUqVK+zJC/1
	pv+EZ6UM87US8MOjIBi38SyYdXPAlqUQFgkXOLj4AcNagvHWg==
X-Received: by 2002:a05:6000:54f:b0:45e:b21e:f840 with SMTP id ffacd0b85a97d-460304ec0e8mr30327538f8f.8.1781086710906;
        Wed, 10 Jun 2026 03:18:30 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm55591592f8f.10.2026.06.10.03.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:18:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 1/1] pseudo: Update to version 1.9.8
Date: Wed, 10 Jun 2026 12:18:17 +0200
Message-ID: <39d4d267906f8e18d44e1ba5da84acc4a5a85b61.1781086226.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781086226.git.yoann.congal@smile.fr>
References: <cover.1781086226.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 10:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238348

From: Mark Hatle <mark.hatle@kernel.crashing.org>

Changelog:
    Makefile.in: Bump to 1.9.8
    pseudo_client.h: Fix typo in the comment
    client: permissions drop setuid and setgid
    tests: Add setuid permission check
    pseudo_client.h: Add +s to PSEUDO_DB_MODE for mkdir
    tests: Add test that returned stat is correct
    pseudo_client.h: Make it clear both macros must be updated together
    Makefile.in: Add pseudo_client.h as a dependency

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fa302de94c7da77a49ca0701580467ebaa8eda18)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 22bb938cd1d..45407b532d2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "5b7c4b59e7e198aab54b35ea194aeb6d99794f96"
-PV = "1.9.7"
+SRCREV = "823895ba708c63f6ae4dcbfc266210f26c02c698"
+PV = "1.9.8"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

