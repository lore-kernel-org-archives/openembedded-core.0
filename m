Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1BCC5478D
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 19:40:52 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.457.1708544444906607147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 11:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R/vS0By/;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33d6f1f17e5so1304798f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 11:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544443; x=1709149243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vpudt6jNN1yAEoz/e+sUy9Utg2xomIy1upS1JCnxes=;
        b=R/vS0By/4CCtBXDHKzUlHw/I72nfMb+1gavkWyitujku5C0voI4lw7i5logqkczbjm
         ONlPs1Mf515tQGaV/C3OEnOyi9zJsd9/rUOQi0jt70spVYK0oJOSI1AbdHgFDJ6Wvjm3
         IGS2mk86w5+KIqTN30bWpjcOx9QDtComH2P5YMqNw+s/ZWnU4lAKOaRudt9PFzAvgBWC
         +5uazj2TSqKBh52daTEhhXkM1EvftPXbehrcKCh1vtQWluV/ZsB0UMsK8+dw3bfDJnGT
         6FeoDBKBTvR01gm93YCX/fopQpiZg43QZ9WGbQ/7gox8m5AHRgvgZgxFr2lSxqBxxdwX
         00cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544443; x=1709149243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vpudt6jNN1yAEoz/e+sUy9Utg2xomIy1upS1JCnxes=;
        b=emQiURuFWTLfP6WUkf5IzAvtREhxRJ51UKLc4HTJkh0gGKG4PZf2Fw/t2JwixAmobQ
         xtVdpR0J+bARyalolapgPn8X20icvy47asVM+Fmix8DcoFcAuNvsG8y1DK7A1ntbnYC4
         6DB4cG1tFq7pHvi4/HNZGIrci+S9fWEvgBC1He4N2Qe47MEl/ldd6+8eI5Qun3hCd7Kp
         SDaZglxNNyk8ZI/XSNEjfmwz6RiXFizAB7eKXlGLyJpnF08PvBKzIyYlyzwdNsm64uME
         ZE4JR3LzxdH+UVGVR9eBsWh4bjehtC6kDprb3u61kf8PuGGlPNuYaU8XYGbeaWwn9Fyj
         AMNg==
X-Gm-Message-State: AOJu0Yz8kMtRaj8oDhynKpr5484YTUGpwV6dy8ovIfY8nJZB/fSiUSIA
	kDjYmACW8A33O7IP6T+ra5pc3tbUoW1WXGqQbkW+KTcIqqxXVulORV0C9UDo
X-Google-Smtp-Source: AGHT+IFRVKN3HoFQMItq4cRgFEGKD7ZpjZ0bwokrI59uNwJ0slUjgHEz3aQSEPvUL1yNgqhs5lJMuA==
X-Received: by 2002:a5d:5509:0:b0:33d:119c:ae8b with SMTP id b9-20020a5d5509000000b0033d119cae8bmr12328300wrv.49.1708544443184;
        Wed, 21 Feb 2024 11:40:43 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600016c500b0033d60cba289sm8764686wrf.68.2024.02.21.11.40.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 11:40:42 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH v2 03/13] populate_sdk_ext: use ConfigParser instead of SafeConfigParser
Date: Wed, 21 Feb 2024 20:36:55 +0100
Message-ID: <20240221194036.1804463-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
References: <20240221194036.1804463-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 19:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195987

From: Ross Burton <ross.burton@arm.com>

SafeConfigParser was renamed to ConfigParser in 3.2, and the
SafeConfigParser alias will be removed in 3.12.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Cherry-picked from master: 71b3e7f71727137b4b996cc4160c9cc1581824b8

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index ca1b7753cb..bdd86863c6 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -227,7 +227,7 @@ python copy_buildsystem () {
 
     # Write out config file for devtool
     import configparser
-    config = configparser.SafeConfigParser()
+    config = configparser.ConfigParser()
     config.add_section('General')
     config.set('General', 'bitbake_subdir', conf_bbpath)
     config.set('General', 'init_path', conf_initpath)
-- 
2.43.1


