Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE0DCCA47D
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 10:33:51 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.5654.1655894027876612005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O8xFhuwR;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id h23so33201323ejj.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2gGM0nCMacGqlv+UkTB3wEJ1JPOUOjxGo4Pn03f78o=;
        b=O8xFhuwR1xptBGBCFHp7/uIV0oCCBHuZcMmbd3t8M9Rn/oarB1LPorHhVDfayJGQJ5
         zglhF8q4WNZNra9VpX7aTkoDAmwC60dNy9AJtcPgnKCT2G+6U/Ct6SRCGp8v3NDPqmKI
         C+sJizp314RocATXrPP6HcgNDyzVLdUqiK3NZz9pkN6ploVgq24KMJL0yrAWaoKUVCrY
         3vyTpKjQF/vn6fML4G9kS+hCxa0aaEL+VTwvHaS0LoPbA4rak/lCM3vvYmim5fojSU7G
         vksTnak6TDoLswJt1rpWsDTXcqOQgxRLXsDJPZ6cvdbeuY4tbF6ZXp9ggxcSZw4S/5u2
         Tunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2gGM0nCMacGqlv+UkTB3wEJ1JPOUOjxGo4Pn03f78o=;
        b=G2OmIkd7kdA8MEKSCdps1EjBLaBaF+74Hofw+aSd32135Vroejn0Jm4foff+Bf72Nh
         HPp1vEEYdcn5dM72U41dfwoxeBpR4sA1nDE274sDbAeWlbXo/xbHcExXsOUHIu4qibFA
         4ebDOwUkk8JIM2nJvxOY965FbiQ/Yrh/WJhP8NJGA8Mnxeo5sA9GKJnML7T4oPKtqLVM
         8WBhsPAF3UsITgmZ8BP186L8fQFwcMOtlxgMxWdiOLAHYIAMCwjL2CxsIzfXyoLWnsIx
         iKm1rjuCI+yf9vR5RhHphVKoKjbGjQeihbA9a6Q4DCY9u5cAUjPTCLC4hg5st3dRn1kW
         h92g==
X-Gm-Message-State: AJIora9K7H3K+e0UN4Jn39gps9VXnDAsyObRXi1RguMcmcCrsCPGfHLM
	lJtluDF9eoavwl+uN8+1bzafbWexg1k+Gw==
X-Google-Smtp-Source: 
 AGRyM1uAj1amHco2hdS68YFsJ8hxthHzY3I+rX71/1hz630zpp9QfM/WFSn3xBv5Z4VOuzyOoe02hA==
X-Received: by 2002:a17:906:561a:b0:711:cfa2:6a35 with SMTP id
 f26-20020a170906561a00b00711cfa26a35mr2543483ejq.251.1655894026366;
        Wed, 22 Jun 2022 03:33:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 lb21-20020a170907785500b007219c20dcd8sm6315826ejc.196.2022.06.22.03.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:33:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 5/6] oeqa/sdk: allow epoxy/galculator tests to run in esdk
 and direct yocto builds
Date: Wed, 22 Jun 2022 12:33:11 +0200
Message-Id: <20220622103312.1098389-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622103312.1098389-1-alex@linutronix.de>
References: <20220622103312.1098389-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 10:33:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167231

Other tests already have similar tweaks.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/sdk/cases/buildepoxy.py      | 3 ++-
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
index f69f720cd6..ad08b777f2 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -16,7 +16,8 @@ class EpoxyTest(OESDKTestCase):
     Test that Meson builds correctly.
     """
     def setUp(self):
-        if not (self.tc.hasHostPackage("nativesdk-meson")):
+        if not (self.tc.hasHostPackage("nativesdk-meson") or
+                self.tc.hasHostPackage("meson-native")):
             raise unittest.SkipTest("EpoxyTest class: SDK doesn't contain Meson")
 
     def test_epoxy(self):
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index eb3c8ddf39..58ade920c9 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -19,7 +19,8 @@ class GalculatorTest(OESDKTestCase):
         if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or \
                 self.tc.hasTargetPackage("libgtk-3.0", multilib=True)):
             raise unittest.SkipTest("GalculatorTest class: SDK don't support gtk+3")
-        if not (self.tc.hasHostPackage("nativesdk-gettext-dev")):
+        if not (self.tc.hasHostPackage("nativesdk-gettext-dev") or
+                self.tc.hasHostPackage("gettext-native")):
             raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain gettext")
 
     def test_galculator(self):
-- 
2.30.2


