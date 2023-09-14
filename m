Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F5DEEAA52
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 14:39:40 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.14006.1694702370030817517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Sep 2023 07:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=QPiz9LEI;
 spf=pass (domain: baylibre.com, ip: 209.85.221.41, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31fa666000dso914347f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 07:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694702368; x=1695307168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXyMUP5TDjhAfx5XRujVdS7ikN7f6R6uqrAG+vO9nPs=;
        b=QPiz9LEIFEBgnFYkuh2rgD8Ns0UU1UpUXe3jHYvJwOmw74k+nfjmzfKNfCKf64gyLN
         l4e8BVrrHBzFObABh5Dwnq/VDiULBazsjCs0vp+0PDPWIuEXH8iIUIJPJ6hK5617tfrl
         9jZLRgmfIiMqnACUP6tLLRp73N0jkYRl9zI3ALmiZoy4xCebyFzmi6QItiyiMNnRt3Lq
         vmvQHCke8pXMtpp88XBqrpl+ll/eEIvNnBb8Rbfdg0xJ8E5SVwa+O89Glfpf2UD1Ak71
         jl5/wwBbFBOj6zhMbsKrvnU/ZeVxFB0vc6leFCa+5FrvdSyDu1O4srUDB8uhKcb1IdZg
         rOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694702368; x=1695307168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXyMUP5TDjhAfx5XRujVdS7ikN7f6R6uqrAG+vO9nPs=;
        b=VOaIMXV+/WXjPkE51u2+Ta1fdSaE428v4vjjR5LzRDEsr1XpLvwpqtr0Xgf5j41dDb
         zwJTiCE7lE7ECRsMAY2r7zcCnjK6PlbMwRS2vdEBQONBIzpWnYDuuyNYR081NC/Xa5Rz
         xV1OIdiRQ3BYk+/nDnfA3wXWfwLdsj8dbGBrenheE7R35f3WZ/hhEhM1dRJcW2sYQi4S
         ARxuV2Q7+yDRiCANBpr1S5YGvukWz+wiz4ITiAwHoYWGiNesQ8dUodUeG4W7phs9aP8y
         B41aaK+hsYhfnQqoW7r9MHeUgbNl+v1uTAk9AELEDpnBMt4QpB4B+PNAZOoJv9BVM0Aj
         TRzw==
X-Gm-Message-State: AOJu0YxdhNBotd28Q4DkDGvhga13Eg6XqfsV8EVyWGgmGN2bVBSnSG2j
	RL66s1afrYKYh7RQaYJMXldgA1s8jCtZe52mwEc=
X-Google-Smtp-Source: AGHT+IHT5DIMku5DH+H8m0yYRUrjQ61l1OBi5LQRUAkpqp2KSnHwDiU69MH7wTtaqhRok/PIa9Hj4A==
X-Received: by 2002:a5d:6a4c:0:b0:314:1ca4:dbd9 with SMTP id t12-20020a5d6a4c000000b003141ca4dbd9mr4809317wrw.27.1694702368469;
        Thu, 14 Sep 2023 07:39:28 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d15-20020adfe84f000000b003197b85bad2sm1951818wrn.79.2023.09.14.07.39.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 07:39:28 -0700 (PDT)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lib/oe/package_managegment: Add nativesdk-intercept PATH
Date: Thu, 14 Sep 2023 14:39:18 +0000
Message-Id: <20230914143919.985474-2-pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Sep 2023 14:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187643

[YOCTO #15023]

This patch adds (and removes after function execution) the
nativesdk-intercept/chown|chgrp PATH before target_pm.run_intercepts
calls during populate_sdk builds.

This has been tested with cleanall builds and testsdk and fails on deb
due to an issue where $D${localstatedir}/cache/man/ does not exist for
some reason. I've a work around for that in the next patch in this
series.

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/lib/oe/package_manager/deb/sdk.py | 5 +++++
 meta/lib/oe/package_manager/ipk/sdk.py | 5 +++++
 meta/lib/oe/package_manager/rpm/sdk.py | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/meta/lib/oe/package_manager/deb/sdk.py b/meta/lib/oe/package_manager/deb/sdk.py
index 653e42ab3c0..6f3005053eb 100644
--- a/meta/lib/oe/package_manager/deb/sdk.py
+++ b/meta/lib/oe/package_manager/deb/sdk.py
@@ -69,7 +69,12 @@ class PkgSdk(Sdk):
 
         self.target_pm.run_pre_post_installs()
 
+        env_bkp = os.environ.copy()
+        os.environ['PATH'] = self.d.expand("${COREBASE}/scripts/nativesdk-intercept") + \
+                             os.pathsep + os.environ["PATH"]
+
         self.target_pm.run_intercepts(populate_sdk='target')
+        os.environ.update(env_bkp)
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index 6a1f167fb77..cc7a7ede547 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -63,7 +63,12 @@ class PkgSdk(Sdk):
 
         self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
+        env_bkp = os.environ.copy()
+        os.environ['PATH'] = self.d.expand("${COREBASE}/scripts/nativesdk-intercept") + \
+                             os.pathsep + os.environ["PATH"]
+
         self.target_pm.run_intercepts(populate_sdk='target')
+        os.environ.update(env_bkp)
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
index 85df6e949cc..ea79fe050bc 100644
--- a/meta/lib/oe/package_manager/rpm/sdk.py
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -67,7 +67,12 @@ class PkgSdk(Sdk):
 
         self.target_pm.install_complementary(self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY'))
 
+        env_bkp = os.environ.copy()
+        os.environ['PATH'] = self.d.expand("${COREBASE}/scripts/nativesdk-intercept") + \
+                             os.pathsep + os.environ["PATH"]
+
         self.target_pm.run_intercepts(populate_sdk='target')
+        os.environ.update(env_bkp)
 
         execute_pre_post_process(self.d, self.d.getVar("POPULATE_SDK_POST_TARGET_COMMAND"))
 
-- 
2.34.1


