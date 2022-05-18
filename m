Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512F6C4167D
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:26 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.3546.1652871565007118720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ngvm5Zfa;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id i19so2995527eja.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yeNOd/UFhHH4+LSoovGqoQHUvk9KTkBpWq7xfEm+W38=;
        b=ngvm5ZfaUx42rg7RRc3LQW+qSr6HEDNLHn6G1dGDttHU3wgkYN9stbcbpgmnJXhljH
         jhhwuOBebhH/e5/ExleGr15i1ogQXHq8TA+3TXlN+zgQVUD4qUTBVPMPvUYju+JAyycc
         lAGMSVKrkg2oDBV2tQ+DbtAhrIWonFFYrOXt2NwcchApUwiilOfmF7Z37fk/pEueBikB
         IZY18fgXs67xo11xnwxPw8UxnRFETGMA83YfyvsostgauIgjBCpeLS9/Ge3VnQvlyCT5
         cMCM4YrBWawUgZi7MNeWoA4gfNbPAmhXTT5ubqr2BaL5QM3U+Iu8YrDL28JGmOzVyskW
         yw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yeNOd/UFhHH4+LSoovGqoQHUvk9KTkBpWq7xfEm+W38=;
        b=WOS8hy2M9lPUeZ/2DQWf65RLYoIuf4Q9XpMOMVXCTMe98YgCWcTCiR531zShNSryH7
         2KcEYKzSuSWa8PU9Z4FWQ7HIdjf9JE3C87a5yAyAXhbcyhOe0ufLHPWRmRfgJYFiHXLJ
         dRi9omr8psb9d7237R7OqukdQ/sUDhg6YT5JyxHDoNFF7X0hwOLtZ1wspz0usAw3SPFT
         KDYWejPpMstFG3wGN4IBmvxzgExR4nh7jxwaA97YnOkJky0HE2JUTePY51a/GGHTKU47
         d0UbhyPTSqYkcwNcBY7LF0MG0F4kgbXkaBc7ji50VgxNaqpM9VEQBBx0C2LRzONRhADr
         xcGg==
X-Gm-Message-State: AOAM532hgCrvdwvCVYtZrfLpnjIcpdVQaizvZ4bPYDOGtRgVDxYsjBwL
	eyhOD/kxekgqwuQT3MJFM90OIUfPN+M=
X-Google-Smtp-Source: 
 ABdhPJzTmgKNAqJsC/yPtSZH+PAw+5SyVF7YC0XSNPw871gj1RL1+XN4LAEZXHYo/3FZGHgttfehNQ==
X-Received: by 2002:a17:907:6e28:b0:6f4:6428:6ee8 with SMTP id
 sd40-20020a1709076e2800b006f464286ee8mr22647718ejc.608.1652871563623;
        Wed, 18 May 2022 03:59:23 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/49] python3-bcrypt: upgrade 3.2.0 -> 3.2.2
Date: Wed, 18 May 2022 12:58:30 +0200
Message-Id: <20220518105843.3299331-36-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165833

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-bcrypt_3.2.0.bb => python3-bcrypt_3.2.2.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_3.2.0.bb => python3-bcrypt_3.2.2.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb b/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
rename to meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
index 6a4d1aef5c..54070e4b9c 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_3.2.0.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
@@ -5,8 +5,7 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 
 DEPENDS += "${PYTHON_PN}-cffi-native"
 
-SRC_URI[md5sum] = "fe31390dab603728f756cd3d6830c80a"
-SRC_URI[sha256sum] = "5b93c1726e50a93a033c36e5ca7fdcd29a5c7395af50a6892f5d9e7c6cfbfb29"
+SRC_URI[sha256sum] = "433c410c2177057705da2a9f2cd01dd157493b2a7ac14c8593a16b3dab6b6bfb"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.30.2


