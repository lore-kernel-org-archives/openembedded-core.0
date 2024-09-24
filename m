Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E42CF9C6F
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 11:55:13 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.11954.1727178910364872596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 04:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=hnukGeOp;
 spf=pass (domain: baylibre.com, ip: 209.85.160.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-457ce5fda1aso43555551cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 04:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727178909; x=1727783709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8j+EiwnqniY91MDCxhYVX+oFjvN34oNWgRf/z/6FpQ=;
        b=hnukGeOpZukLlevQUWgnJaOCRq0/J2bXDd0+mCSNYb+dEPi1ApllxsIfpMCg5mzIkX
         Lf6lDQZXXfNwqNCu/PQXiHOL5S0VA3PYUdcOcSQDvLXQE9A/NC6UeOndjSGmR32p60R+
         dOFJ5zlfDDgSP+xaIoRNcDT3NXPHe/CtZySRVKRZZGeLCe0IvoUMdgu4zyvZ+qWOeubq
         y62/c17sWNs0Ok/AIBC8HxrTctasukCCG7QGYKtiLsnvHauI7lHe/+V9sFdxqlEAQkSf
         /kIirXyjOSrimuH8kuseUogrvzN9rWh0oPx6fE0xHwc1gnv19TDiHaaT//A+Hx7XzNQ3
         VP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727178909; x=1727783709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8j+EiwnqniY91MDCxhYVX+oFjvN34oNWgRf/z/6FpQ=;
        b=Djo6VKCBTDNHBUwBxaAzSlfTM24OUIo6YQ+FmwvTdsdK/wdioPwQiluJUSArwfLTXH
         kJo2mg7EmMCDKMISEx5lpktCitcDpIFNfc75jpRnOIo++3io6IMNFAPEQEijYurtZnnD
         8txOv8f7QWvQ6MGlm61evgRX0Uw7VNyXB7Gd1DHpr/wnlYJ8FCBooUlBuHi8OL9aSrGR
         uRzrHG3O4cuPd4FOGi+sTZbz5k4rr3WG2xmMdEe5lj271iEWA+acYJealdaK2If7uiQI
         ++zeogy/G5tPGE2Y+sdA+5alEwdr/G9KfNV9wCsyCjRWwn+Dqhw37oU14tUyqcmiqdYP
         yK/A==
X-Gm-Message-State: AOJu0Yzm32Tb9uXcx+G/R3/Mad0b89zsiBm9hKjDqHbvJbF++HR0rRQc
	gFbrIxq4Lu/6BAtx4Hlgz9FIHd44rQ9+UMrlL/kjig6gImQXxm2N6RSNioZj8mTJdJME3laaf1L
	0AlI=
X-Google-Smtp-Source: AGHT+IGPyWn2KF/pSswPFJezp7ey/YkQvH6yI6ClMmEK0kTH+zQN752hjSpCGDBs6+I4TpcFBRFYDQ==
X-Received: by 2002:a05:622a:1a0d:b0:458:4a68:7d15 with SMTP id d75a77b69052e-45b228a9e14mr252605991cf.44.1727178909206;
        Tue, 24 Sep 2024 04:55:09 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b525456d3sm5553611cf.13.2024.09.24.04.55.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 04:55:08 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/6] scripts/patchtest: split out result messages
Date: Tue, 24 Sep 2024 07:55:02 -0400
Message-Id: <20240924115503.1599651-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240924115503.1599651-1-tgamblin@baylibre.com>
References: <20240924115503.1599651-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204855

Add a minor refactor for the result output.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/scripts/patchtest b/scripts/patchtest
index 278fc4e6e09..9218db232a7 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -165,16 +165,23 @@ def run(patch, logfile=None):
     postmerge_resultklass = getResult(patch, True, logfile)
     postmerge_result = _runner(postmerge_resultklass, 'test')
 
-    print('----------------------------------------------------------------------\n')
-    if premerge_result == 2 and postmerge_result == 2:
-        logger.error('patchtest: No test cases found - did you specify the correct suite directory?')
-    if premerge_result == 1 or postmerge_result == 1:
-        logger.error('WARNING: patchtest: At least one patchtest caused a failure or an error - please check https://wiki.yoctoproject.org/wiki/Patchtest for further guidance')
-    else:
-        logger.info('OK: patchtest: All patchtests passed')
-    print('----------------------------------------------------------------------\n')
+    print_result_message(premerge_result, postmerge_result)
     return premerge_result or postmerge_result
 
+def print_result_message(preresult, postresult):
+    print("----------------------------------------------------------------------\n")
+    if preresult == 2 and postresult == 2:
+        logger.error(
+            "patchtest: No test cases found - did you specify the correct suite directory?"
+        )
+    if preresult == 1 or postresult == 1:
+        logger.error(
+            "WARNING: patchtest: At least one patchtest caused a failure or an error - please check https://wiki.yoctoproject.org/wiki/Patchtest for further guidance"
+        )
+    else:
+        logger.info("OK: patchtest: All patchtests passed")
+    print("----------------------------------------------------------------------\n")
+
 def main():
     tmp_patch = False
     patch_path = PatchtestParser.patch_path
-- 
2.39.5


