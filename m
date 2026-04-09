Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D741E98FD2
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:00:08 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.136112.1775750398142677647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yvA94Ecr;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so1016158f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775750396; x=1776355196; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hh1S4I66m4GVSBIIy1BtX/Md276XqDavCSzcnFAEIKc=;
        b=yvA94EcrhXL/TjsJa32wazX0ltHJ4V7A0PG5aUbVasWy/hHN+EpGTk/GfIAMCVpFmp
         l8Wh1ZVrZQNXcpCtx/sQSa3/rVPaKrCF71CFj7E1aC5U64SyxM0cXDKDAALQzc1D8Paq
         Gy7SU7hKzaNVKy/1tHnWu6NNFut7gbPRjgzuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750396; x=1776355196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hh1S4I66m4GVSBIIy1BtX/Md276XqDavCSzcnFAEIKc=;
        b=VadUJ7k09ftqhQ3z8IPyldZoUEz2JzfBTOswa018dZYS81y7+ZQ5lqPOsT0r+6NPgN
         M6GrdpdeokiblCNA0z1zE8Iil0fp3ievJxzH3ukMG9dxaxGOIMLP7FOcjY8bC0McHCeZ
         vcCDnJpJikcfFA00YXwa7peaFiOFrDfr0kLDNvoFzPE7LVdY8moHO5XnA2iSjTYLG5Kv
         hVBLKfBA2tywOZYyBL7I+YPYhtnL0ykxpjJC0PY6g48bto18Wgd25Gghlku0FI7djMHY
         qezZhH+DwJEMkp65ZuXy5nFgpefG07zl1UYJHKFVo0cRXloP6owdOuFfToUQ9IDYNqUE
         iWxw==
X-Gm-Message-State: AOJu0Yzi2Aa1sO0c/MyrO9VmNylGa+SOWj1+B8orb+5CEwHHTlHos9nX
	SEqaJr63dB5lSu2FAGX5ktwa3gaB5X65rTYSEWezOceEDFxx54gACaJmV09I1v91KjCc5sVoCol
	4nWQPSWNz0tqR
X-Gm-Gg: AeBDievIWr/wd7XTiuLlQiUykBAKxBNq51XS4DK0VsujHFRVfExDB4aC1KhhJeI3lPy
	8xZYUfGv1EdNrHqRIuyw0qO1GplJEXbGO2B6Qanwfcx8yV4rM0VcDB8maimm5xPhXjCbg79bWk6
	wKNKbQaZG8eWdlEVX6+VmJ7ufCK+4a9IYL7eOYvsCa37YXV3/Ytd/0dsk8QevKGDbyVEqyIoyVl
	b3I2J+gAJUZcuttpu/ucvr6K0ADeYAM7UzOSYup1qPbaEl09BPnCk7oJEPWr1hPPkzvZKvv+MGB
	zSvhaDmzuK3U24qmP2xnHIlQvbBDTWwN3vjoWaVpnsZ2AVNE6Zn2esVqoy/xUr9JiI9TJeRlPFb
	WaGJCU6HmFC2bm0R2duASoYjBZ7XOxf+q9WyW0liiTt3R9liqppBW6RNmxAn3CILRTeqk4qxPDO
	Ul/eZ0NFAyfa9C1TxTWxRmRdpjNUG1G4SV2pp296G3LyfqOLplhxw6CcuLWgzlp/yG/RMyVC55z
	IYmcAPDKdZ4pbK/kRFTBZXlxa2q
X-Received: by 2002:a05:6000:2c05:b0:43c:4810:dc4a with SMTP id ffacd0b85a97d-43d5a17cfafmr5909529f8f.38.1775750395887;
        Thu, 09 Apr 2026 08:59:55 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003cc57ca6ff0f11d4.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3cc5:7ca6:ff0f:11d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm69149364f8f.3.2026.04.09.08.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:59:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [kirkstone][PATCH 2/5] oeqa/manual: Default to https git protocol for YP/OE repos
Date: Thu,  9 Apr 2026 17:59:32 +0200
Message-ID: <20260409155935.2245789-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409155935.2245789-1-yoann.congal@smile.fr>
References: <20260409155935.2245789-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234928

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/manual/crops.json                  | 2 +-
 meta/lib/oeqa/manual/eclipse-plugin.json         | 2 +-
 meta/lib/oeqa/manual/toaster-unmanaged-mode.json | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/manual/crops.json b/meta/lib/oeqa/manual/crops.json
index 5cfa6538432..cf6d19e6bf3 100644
--- a/meta/lib/oeqa/manual/crops.json
+++ b/meta/lib/oeqa/manual/crops.json
@@ -276,7 +276,7 @@
                     "expected_results": "this should output the directory of the devtool script and it should be within the sdk workdir you are working in.  \n\n"
                 },
                 "5": {
-                    "action": " 4a) git clone git://git.openembedded.org/meta-openembedded in  layers/build  directory   \n \n4b) Add meta-openembedded/meta-oe in bblayer.conf as mentioned below: ${SDKBASEMETAPATH}/layers/build/meta-openembedded/meta-oe \\   \n\n4c) devtool add \"npm://registry.npmjs.org;name=npm;version=2.2.0\"   \n\n",
+                    "action": " 4a) git clone https://git.openembedded.org/meta-openembedded in  layers/build  directory   \n \n4b) Add meta-openembedded/meta-oe in bblayer.conf as mentioned below: ${SDKBASEMETAPATH}/layers/build/meta-openembedded/meta-oe \\   \n\n4c) devtool add \"npm://registry.npmjs.org;name=npm;version=2.2.0\"   \n\n",
                     "expected_results": " This should automatically create the recipe npm.bb under /recipes/npm/npm.bb  \n\n"
                 },
                 "6": {
diff --git a/meta/lib/oeqa/manual/eclipse-plugin.json b/meta/lib/oeqa/manual/eclipse-plugin.json
index 6c110d0656e..6f655a2ba90 100644
--- a/meta/lib/oeqa/manual/eclipse-plugin.json
+++ b/meta/lib/oeqa/manual/eclipse-plugin.json
@@ -246,7 +246,7 @@
             ],
             "execution": {
                 "1": {
-                    "action": "Clone eclipse-poky source.   \n    \n    - git clone git://git.yoctoproject.org/eclipse-poky  \n\n",
+                    "action": "Clone eclipse-poky source.   \n    \n    - git clone https://git.yoctoproject.org/eclipse-poky  \n\n",
                     "expected_results": "Eclipse plugin is successfully installed  \n\nDocumentation is there. For example if you have release yocto-2.0.1 you will found on   https://downloads.yoctoproject.org/releases/yocto/yocto-2.0.1/eclipse-plugin/mars/  archive with documentation like org.yocto.doc-development-$date.zip  \n  \n"
                 },
                 "2": {
diff --git a/meta/lib/oeqa/manual/toaster-unmanaged-mode.json b/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
index 29d11a87d5b..3d1dba447b3 100644
--- a/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
+++ b/meta/lib/oeqa/manual/toaster-unmanaged-mode.json
@@ -10,7 +10,7 @@
       ],
       "execution": {
         "1": {
-          "action": "Set up yocto project and toaster test environment. \ncd ${installdir} \ngit clone git://git.yoctoproject.org/poky  \n\n",
+          "action": "Set up yocto project and toaster test environment. \ncd ${installdir} \ngit clone https://git.yoctoproject.org/poky  \n\n",
           "expected_results": "NA \n\n"
         },
         "2": {

