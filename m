Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508111062890
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:29:34 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20256.1773232170008144917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 05:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VHTDsl0D;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so31413455e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 05:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773232168; x=1773836968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wE6I6RN4e4KoY5lfgkrxpGdyK/EKr3gDdu4R1tQAdZw=;
        b=VHTDsl0DWjSgPCM/qzDGkTI/FHAiR99psxlRwQt/OCawkjPcN0udrko9zyHaWWmz3E
         aXoCHxKWvxwPqXuON9hits5uSS2up5DlPmOV/QbSSzr7+UIo2APx7EabLEbBPM0RCx4s
         JyXTbLpzo4wNuFCyc5K0dkhW6aRpKNKHtFV5Ys3CD3SGofU4WG8ln1nauD44opwdWaCv
         mCA/eXZar0W88b7zjOB2ys9h5s3dMoq+Z9s8kxvO7tW1cvhN7iu5+PJ2031bTlxEaa4A
         UZkuccIOh05IavHcYkKUibpRa3CFCMc3HOiyAxk/3FmiOaLDXHcAL5RLcxddA8Ats9R/
         Qsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232168; x=1773836968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wE6I6RN4e4KoY5lfgkrxpGdyK/EKr3gDdu4R1tQAdZw=;
        b=gb6iYoA8/pupvA/ny7c66dLB0hWA+Y19fHC+uzWOFELhXtUeRhOrL1l8IU9wbgPeAd
         YWTtPZoxIw1hxEXyzlprvrum1epHBOPiXngAbUTTxiTfT08e/3hV9JFBMD5lelbpZIbg
         wOAXNEdK0tpa6iolkb8ec8HVIQsgWDO0jjdmaOyjyeOzVfq3vlCg/UcX5mw7r4ZJj8xW
         D1m511ZvZrdgMZPYuaizq8oJ1RhCJAWZHt3eGvo2NW75P3Jj/YlHaozemTVJ/kQoVk+z
         NrJFm6WwgBfIfR1dxNqFovo6gZcLKbB76Z7jSZ/vEcApg2g3GeCfRykCMoXTwEY0NV3+
         zVKQ==
X-Gm-Message-State: AOJu0Yz9QI0mCLHR71fowP8I49vG9fIU/pm52XuSfYP3UzFfK9y7FksF
	lNWIOjdTkPaGGVNY50zlhCwK8gjwTXh+KCWihHp+afc2iN3r9bQKo4hSVnqTuA==
X-Gm-Gg: ATEYQzyzSNylrxA2YbmKMxLHcFoDwiRlJ4BdaQIX0/cMzdVw3oVzAOtEiAdKNMvEO6d
	GbRSwYmo286TV7ej3yf4paIvDN3MqZUzzahfR/5gwc5IhNDcCHhpU9GOZ5WTpeEoZOGGbbnzI/7
	YemdQGOk/fkcH2W67exTolExapRNBkQhOnvExmlkUj9jSXGUttJrejSUNwEjjI55aoAjdMiHad8
	CkkVm0AVqdlvUstueyv72nFZgSCm/Mb7i7OPH33wvMXL8dmJhSCVpoJqntiAgyKBaCLEJMjd+lq
	NCziDwZq2+5Wx6SpxlXd09S+Iv9F2xiYDn0ptHG5fBHmUqiDCgWOTJRyYt9ZJ2aU2AE4Gr0pYaN
	/JWLpPs4HqabekWU2Ms59VnuIX5Mh7yUs4n1JRl9XK6iDeM0FrqkzbPUHA9aCzxGrFjFSeUn49R
	UVMmb/iT/bcXDTgGmmheuaoGp/l/R8p6dc+JrREgQLqoU=
X-Received: by 2002:a05:600c:4fcb:b0:485:35a4:939c with SMTP id 5b1f17b1804b1-4854b132402mr39711135e9.29.1773232167783;
        Wed, 11 Mar 2026 05:29:27 -0700 (PDT)
Received: from fedora (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854ad5ee37sm39671515e9.2.2026.03.11.05.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:29:27 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest subpackage
Date: Wed, 11 Mar 2026 13:29:19 +0100
Message-ID: <20260311122922.4160133-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232872

This fixes a QA error:

ERROR: QA Issue: bash-ptest rdepends on locale-base-fr-fr.iso-8559-1,
but it isn't a build dependency? [build-deps]

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-extended/bash/bash.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 634209c911..b43b1cbf89 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -32,6 +32,7 @@ ALTERNATIVE_PRIORITY = "100"
 RDEPENDS:${PN} += "base-files"
 RDEPENDS:${PN}:class-nativesdk = ""
 RDEPENDS:${PN}-ptest += "make coreutils perl sed shadow util-linux-setpriv"
+INSANE_SKIP:${PN}-ptest = "build-deps"
 
 RDEPENDS:${PN}-ptest:append:libc-glibc = " \
 	glibc-gconv-big5hkscs \
-- 
2.53.0


