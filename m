Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109A0CCA473
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 18:39:38 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.11472.1658515170135604690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OKPbnlp9;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id sz17so9998125ejc.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S2gGM0nCMacGqlv+UkTB3wEJ1JPOUOjxGo4Pn03f78o=;
        b=OKPbnlp9qvH/HCt42irYNh6KsWqHvzafIuwm1u9azR8kRahFoPUdAbLZFBXK9Tyd+0
         mLU5u2igLEEEPgyzDVJw2wxzk4hao+Bhc7SsWB4mDf434gWleJF+yeBPAQ2y5DowdMi+
         zH9Go8LZd5ed8vmPw5oY55tNpJ2C1oUkZweZtCdDnzSrXvTa41CDmGA8a5s5Sg2UDZzU
         KIUkrgMaVT/ikJS0hPu97H2AinG2lRTdhNWY8ZUkH/8R9zafMB89xhCgc17DRewFK0wo
         L8ac8zuG747Zlzica2tUq8erOH5CgaXjPFsIwGCWMSmrK76maLxKlTaaf/Jsy4HxDqA0
         gZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S2gGM0nCMacGqlv+UkTB3wEJ1JPOUOjxGo4Pn03f78o=;
        b=SIe0ubf0oHIoUic2pqf7YwGlRAfiovWGFphRQDEXOiwuMHE9lotZb/Tc79gCWRiyCg
         bmKRYQLma9HQg5v32gCTazFlnicDWQWR+rcghSh2Wza8GcLlrUfEJoaTGDr/hRBMVjrG
         PBkfjmKreuvP/iZvoiw+uhgdDCn6t/Qz1UZuNtmlJ3LIa62+0Phle+PURB5v3uDRfUFh
         xAWYC6DP9etUms6kmQl3OaT2o/hl4GoCsBPYm3UAUrQfrG5SZQfFYFSSJYEkUqugPvzl
         SGSx4mj5spw6ftEN9uf4dqUfK26XZDx1r/C7AeWmAXOtDe62xQvjisf+EDzhKgGdEkJ3
         kgAg==
X-Gm-Message-State: AJIora9fyc7sQ/lP7vr6SEew+hPYiPDOnB2N7hP/ykX0kg97gD4x1ztL
	YtODT1BCU0yZ9vtnIXaZsue5XhSXJAM=
X-Google-Smtp-Source: 
 AGRyM1uLiNUVgsk8WMrox0wUoJzrIr99q90vwAwiYxUFU1pCZ9Hafi2BAhbkRlRco/0tqqOowTGGWQ==
X-Received: by 2002:a17:907:7745:b0:6f3:674a:339 with SMTP id
 kx5-20020a170907774500b006f3674a0339mr945745ejc.207.1658515168533;
        Fri, 22 Jul 2022 11:39:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 bt8-20020a0564020a4800b0043bba5ed21csm2931885edb.15.2022.07.22.11.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 11:39:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/6] oeqa/sdk: allow epoxy/galculator tests to run in esdk and
 direct yocto builds
Date: Fri, 22 Jul 2022 20:39:14 +0200
Message-Id: <20220722183916.360600-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220722183916.360600-1-alex@linutronix.de>
References: <20220722183916.360600-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 18:39:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168421

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


