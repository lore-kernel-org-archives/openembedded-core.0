Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E929AC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 07:38:52 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.16730.1709624324451489673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 23:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ONGRxJSu;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4515f8e13cso246145766b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 23:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709624323; x=1710229123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zz78oVVjWndC2ceyem1A7Pnl0NAWd6MqvgefMQo8kaA=;
        b=ONGRxJSu0aogMDDqZm5bcELMssdBqR5jdkokF/mqXeIUc5JTV+6bK7r4CJmHwtxpKh
         ZrYiXy/MSSwtkl35FM6VWBXeefiV9Mh7MTZrDIromH3p4o4Id1AQdknPYbLBEPTSElpv
         TXDvU2rkMEIjuTut52nS1I2Y1g6SC+5k320vWn0QMFAi01nTTaPTdsVx43Kv3ePzFuzC
         uF/DKpJfDyPnTuGW8o7p1iXY3n8ilIPW3AzcbEiquHFR90KdnYj2HLRLt5NEi4z/P4To
         fPdDQpxSsr/P3t9BmIcgXdWsCIkfMSWx+eylsst2PJNEUIsXKhk9a6Q2osWi5K59nhQ7
         7Lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709624323; x=1710229123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zz78oVVjWndC2ceyem1A7Pnl0NAWd6MqvgefMQo8kaA=;
        b=bz16wZJTFn1LWWVHwmvsxe3qN6O+3r2Zu3IF6dSjVpZ7bT03Yb90piO8vKNUzIInn4
         TEe2PYzXNUssE/I5noZPycu9CG8iLGeXVlH1CaetU9hfjSTBTVb0X7jHhalrl61G5B6J
         G3yxjF5IeFZ6/8MiWzckkYq6PphBIlpR+9WIclPnRjClS3NfR3QhwslUrmLomdAY9gWj
         tOkJs5PlOZ5s2EqcPnBRQyYhwbnfx1FR2ERLDjJqbtBoBUxi/WoAKLVHqxImLtY2avdE
         RrUAQ1X1kFn8VBEMYMYoGzSb9zsp6TmvyvBBzYtny4vFfJ+P2qeO1D9awX7xtK3qUZpQ
         I43g==
X-Gm-Message-State: AOJu0Yy5MNl4gCiPoeHle550ezVAcAF1d7DF+MWhClsqUFHIG8usfsBU
	r8E2FFnsbnhRAdemFqc2DH8rqWwRqHkriXCQ4HQhy5WC4XX8WARQJF0X2F9e
X-Google-Smtp-Source: AGHT+IGKIcpi8HMkHRX5jESAl7Kkb6c1P2YOOoCrE95Y5zQjA+NkZxdR9C6LwD3rTJRO6oK4Wf4LDA==
X-Received: by 2002:a17:906:150f:b0:a45:33fb:35e0 with SMTP id b15-20020a170906150f00b00a4533fb35e0mr4074794ejd.73.1709624322512;
        Mon, 04 Mar 2024 23:38:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906b18800b00a43fe2d3062sm5747592ejy.158.2024.03.04.23.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 23:38:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] xz: correct upstream version check
Date: Tue,  5 Mar 2024 08:38:32 +0100
Message-Id: <20240305073832.4133521-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 07:38:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196624

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/xz/xz_5.4.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xz/xz_5.4.6.bb b/meta/recipes-extended/xz/xz_5.4.6.bb
index 6c13e7ebe59..da3b75a10b0 100644
--- a/meta/recipes-extended/xz/xz_5.4.6.bb
+++ b/meta/recipes-extended/xz/xz_5.4.6.bb
@@ -28,7 +28,8 @@ SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${P
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "aeba3e03bf8140ddedf62a0a367158340520f6b384f75ca6045ccc6c0d43fd5c"
-UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
 
-- 
2.39.2


