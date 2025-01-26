Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A608C02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:48:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.29137.1737895698715389711
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 04:48:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FIqGjOB3;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436249df846so23286275e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 04:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737895697; x=1738500497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzN5T0BXFcY+nLUfi7LvXcltC7d20woaRAPvoSW0nus=;
        b=FIqGjOB3PPJxZXmnwLLz4qpU2TZ1AoFVk7QRley5et3BvKVSO7Tkho1QTar5w77zar
         5mfDhUnMyCKzoHsVG023IGItea3JzHAKYdZqfM6bip4Rg1sl0DbV95vHtD6fFNHHKDd+
         qsIt4vjyC+TZ+w5XpQdUGiOJJyAzqiz2TBY3I80ZM4+z8Yizz8zcQUS/nS8ydZocmqjH
         eAgydRXay9MN0wZfbr5pu552tBbCu45PzSQm4kIUtnmMDDoccUOpCyeSiC72X8uYrLg/
         z5CZux7JeclcpB4bq993qZS3UusAPtZvVaVsziBK9KXfWlO/i0NTJwwADEIFiL5YRe8g
         1NDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737895697; x=1738500497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzN5T0BXFcY+nLUfi7LvXcltC7d20woaRAPvoSW0nus=;
        b=TpPfviEnE/NG7Uzp672LiXJgDCS8mVFmr0uJpE0mz7nh/znMu3I3yjGtmyY6LbpJk2
         dk9YrAsz50M2bAGwBxsOlCGJjmfQrkUbR+S0dpuZuSMBcVhJA0YmeztHtJUufW+xcKIz
         hS8+mUJ8A/AbdJ5SBDtbBgOns/z0rOBjwTX6MeDzHe0ViHgIVJJNCb0ra806vdPZ8Q3c
         XnVYXo5hT06lA4D2fK51VBXIVIu7KLgOwAVcosGtujYQFAHvNf3gkHHcPsTw0bvjU0mW
         OPPH1QizSVSd8SCNdYYelaPEYt1LNcoPHLmIOd2gnNcFyh3KiqScuaN3sbIZZAFW6Z5/
         bJFA==
X-Gm-Message-State: AOJu0YyP6MroeEd+z2kvTCxoSCJMWW6GT7hekQajPNXgug1Xu4zZh/vi
	OgitEe/yocGOlJ/0XRiXuET7Bb62Mz/+lu3CG1rnULM0l3OwtKNb2i9q8g==
X-Gm-Gg: ASbGncvbUiKRwJpPQXRPKOAkSzGiy2bRAfwydSrKMbfSAEap1BObVZmVNTK/4+WD8ta
	s31O9PRQz7ZD5UFP+vyj2PrxT+XYaVqANh7XurFbppVB/3pHqK2gnLyJEHR9nSR05KvDEUn9Zu0
	3a3wCJTQxu2ELJuJnRqA3IHyd5hFYZaMT70ncLpdcM464WV7nGIdWcs3ysFmwByTtT/ZB/+uhsA
	v0Ipn3ls8a1eFI60Z5SUxkErXupwERzwECL/P+uXn4z4aCGLXSTH9QmbysxjB150qsRvvEDx33f
	UVY0Dzype+nTBS4Wz3FVArHiFJ0=
X-Google-Smtp-Source: AGHT+IE4ExhGBRazayrgBW+3dOCduxDynZ0Pen6S2UyTrDWNyovfO8nThiP8x8EN+QCS0Uvv0hYCJQ==
X-Received: by 2002:a7b:cc8f:0:b0:438:a214:52f4 with SMTP id 5b1f17b1804b1-438a2145332mr248109315e9.25.1737895696717;
        Sun, 26 Jan 2025 04:48:16 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48a906sm95938295e9.18.2025.01.26.04.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:48:15 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap,styhead][PATCH 4/5] oe-selftest: devtool ide-sdk use modify debug-build
Date: Sun, 26 Jan 2025 13:48:05 +0100
Message-ID: <20250126124806.1453644-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250126124806.1453644-1-adrian.freihofer@siemens.com>
References: <20250126124806.1453644-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 12:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210283

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index fc08906117..ee75687f01 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2493,7 +2493,7 @@ class DevtoolIdeSdkTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         self.add_command_to_tearDown('bitbake -c clean %s' % recipe_name)
 
-        result = runCmd('devtool modify %s -x %s' % (recipe_name, tempdir))
+        result = runCmd('devtool modify %s -x %s --debug-build' % (recipe_name, tempdir))
         self.assertExists(os.path.join(tempdir, build_file),
                           'Extracted source could not be found')
         self.assertExists(os.path.join(self.workspacedir, 'conf',
-- 
2.47.1


