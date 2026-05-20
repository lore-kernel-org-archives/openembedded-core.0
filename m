Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7718FCD5BAC
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7283.1779265269507646396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pS9bzN3S;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488d2079582so44045025e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265268; x=1779870068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezcXUAgd3yypsXxRU0KXBXVe6zJ0PhpgRv7zqKFAc8s=;
        b=pS9bzN3SCfqd1tmLWGmuBK0jE3KAIseGTOVDFsFs7f7vU/IXIgR+GV/gv3YHbBg8OS
         385LmIUQ+0rPZHh3BzzWCvFTNV2Cv028pkRKT7OOhBmdiWV24jsoOcwX5PsSo0tWm9Ip
         Ngv+ry7tsWXOX87OSsn/4m7e90LSDJFl4ei24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265268; x=1779870068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ezcXUAgd3yypsXxRU0KXBXVe6zJ0PhpgRv7zqKFAc8s=;
        b=BvpCIWfMTW8SQUupVxoysqBzYBCE6bNjOAX88To3NwLnKf0U7WRDa+hCD0e1r8hImA
         p5saYqq7ycpAsYcDs0ieE9ARO6pG7KJYiGTKZ9VAnUvKLk2AQ8VHdB3VDieCcgL78PMG
         8q/ixMNeJjYc++rdtML1Mf1m26yylFeplbA5JnW0S4gP0bAgUsWDtc1fHk3XgI4UV4VV
         Pde0rib9uMzWMFDwHD4w9AQvjdciBrkGlLJuTtpY0zeeMDJr73RhUqYzTi6g5+GlcC0Y
         j5lrVbwD93oO6xymgndE9XId7e7YDMXID9ssW7InFJJ3K2hc6I+qaSNCahERFGkeBiH8
         dTLQ==
X-Gm-Message-State: AOJu0Yw0M+qyHLOgGMkNSxR3faSnqZ0JiIuec4GIz2SghOG26Hznm+wN
	X8ij25zxdYMMQ//Dp0n4xjbFA7Sxqxs5tJaOiwpj1+KwfYW0lnRHDS4tPI6kHL4OvhtU3QLGgCF
	FixWm
X-Gm-Gg: Acq92OGRSreEeSqTVN/ncBuZrFoPdM0JV8I+b2yY2j8hUg5KOIPEybEvAtw+qHvFwN7
	mL+mXqLevtiG+YnEd8GblsGUEExXp1mKHExXzi5k9VRnauDKKKmKxX+pCnF8ppq0H+7iS5B/v4O
	aiC8NAbaOXl9/RVfhDc6JEdTbLkWK48b/XR98Y5kXPiSiLs/OuGovq8R7FD8CM6c80/f9F55i/n
	HDkm13AdRLYu6Vci49duvtVNtdoCj2gxNg6Egif4VrcErugVGZwnNB1COejCl/YeaxTPoXByZ2V
	laRy1eKHvs1bxeaNnU2QWu2huzxAXa9Y48lgdlzak2S/y5pew5X38KiZDH4tiZZ6jCR0UoKynRK
	f6FyazlcXTReDw7u4KQVSxsuOYdKhRV/Sn1IUiR3Tmya3phep3mxbLwEHgyY5dgMWV6NQSPp5N5
	lrrJEodlggWIIWsdHBw2HWD0jvF/OSgZu910NlG8bPWQ1YliG4+xZLZ0HJe3ukIg5n/BJSpi5gi
	7MzWrXO0oH+YMplZb1XX6rcsE5C
X-Received: by 2002:a05:600c:a11c:b0:48f:e468:1761 with SMTP id 5b1f17b1804b1-48fe60e47afmr260947745e9.2.1779265267877;
        Wed, 20 May 2026 01:21:07 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 14/28] libarchive: set status of CVE-2026-5745
Date: Wed, 20 May 2026 10:20:15 +0200
Message-ID: <0dc232f55182667d7d45a5895d770c9aea95dbb7.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237413

From: Peter Marko <peter.marko@siemens.com>

Debian security tracker [1] links Github issue [2] which points to PR
[3] which has been fixed on 3.8 branch with [4].

[1] https://security-tracker.debian.org/tracker/CVE-2026-5745
[2] https://github.com/libarchive/libarchive/issues/2904#issuecomment-4257068822
[3] https://github.com/libarchive/libarchive/pull/2905/changes
[4] https://github.com/libarchive/libarchive/commit/8c04ac3c91841cdf75dc9de4a405cd7c69

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a3f38d68bd58f2028f8097d2cb11486d8a8f75ad)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/libarchive/libarchive_3.8.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
index 577362ef8b0..e8c3a3bfe3d 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -91,3 +91,4 @@ RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
 
 CVE_STATUS[CVE-2026-4426] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"
+CVE_STATUS[CVE-2026-5745] = "fixed-version: fixed since 3.8.6"

