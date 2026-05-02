Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4005ECD342F
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:29:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9470.1777739381203272881
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Uplmog0k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488d2079582so30199955e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739379; x=1778344179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3k88H2fzg/B6jncEhTHyy2EyuO8nl/nWOVFaVIZFpr0=;
        b=Uplmog0kkBV68T9DoM/B+O7ARSQlQC2f7JP0lRLlc6CJEOy2Asl26V4kre/L5+O3Y9
         hlUP6nGGs4eea3Hbo0rObRslHRntv8nMA2XgDD28XhymC7gRIwd93Rs2pylqf+x7w7g/
         RyrifZ9AYfDvgZFReJXupBp4PsAQpbjb5U++w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739379; x=1778344179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3k88H2fzg/B6jncEhTHyy2EyuO8nl/nWOVFaVIZFpr0=;
        b=pQ2/Kr3oPRqN5KMSyQPrwBRjI2PnAOHwWmoUpbt+ql2rsyHZRhi7ygB/ozgUFqAOlF
         62A9tEsXlJpv2TEHqqgaW7wABaS4kHZlWhqqBOfvhWsDyRggrgGs+vc4BOiZi/TsWyTW
         VqTr10ImWxgcMW4VRdPrUSnF/0YhE4AIdkntTRBE17yJ8ZFD5YBc1aSPMuL0aUgCafrG
         V+ID0jqS2XKRZunkAFduhzQOeHT/98IqcCCNCBUK79+fD+CU3Xv67KW1ysJwOaLwQ7M1
         rh0vQqGKT6ymbDNhEaiOK7WDWLUQuaVm7avWza+NCkHM278CeCUfYyb0b+61AwO5J1qx
         vSNw==
X-Gm-Message-State: AOJu0YwRFEBgHwsk4XUI2KxJjXRyKxgbo5y+DaLvHBiwhSTtBaTJXqLL
	8hVj5iQGUitYqG5qClJAoof9UMOp5E/yssI9I2w58RuULSngdfT3UmQqa8msSCQMr6NAp4ypmgG
	X/9kOJcHW+fJAqXS7b2/dOD8eFF9ghFzJizQ3mL3N9nWEP+paReA1N0IKf4ejncOIwq9/JDN+0Q
	5OwWmhQEhz9+m4dOU=
X-Gm-Gg: AeBDiesD1sWPQuk5Jolw2DHEvlCGN2BGOQmT/jomGV3AMSlodiVOaetsa+4VzwWrdrp
	6SDlpgdInatdKzSaciVOnDaru/bHxLlE/DKAVvJANvuQtv/sa/fiT/wzZEiK7QSWVd80BdLv1fp
	nogabsJVfxymRcdGQG3tbzZDIM01xB0eIqCHSW3TW0ag4AXWq81BPOIwJ8rU5ajPWO+ZMx3THO1
	9l+ZvMhHIpbmDDP2qMrTlYuzjKtouXaDhdI2XewW9Zv+dnc5U9Mvat3WyRMC3Stnm0FCqMgwtiv
	mg/XCOoFLh/HOtpYLwX6YxLouWlbHZCLkGhnr9PIebmPJFM5gRA0aGQnZrUjeMocYYfFfg/qfg8
	UINEdyIvnUhvDivOg/gnrbLAqULYf+OQdBzL0mYtiz6jfbbA2YYQodjOWn4W4aCkaEhIN256MPF
	bnoZQmMlK5bAe/5sBbHoSyphfd4eqS9E5kmLa1+QfdeWaL0ps1JEU6ogTv6JBkJNw=
X-Received: by 2002:a05:600c:a402:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48a9865f7c3mr41098555e9.15.1777739379082;
        Sat, 02 May 2026 09:29:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.29.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:29:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/62] dhcpcd: upgrade 10.3.1 -> 10.3.2
Date: Sat,  2 May 2026 17:28:25 +0100
Message-ID: <20260502162929.1377831-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236314

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../dhcpcd/{dhcpcd_10.3.1.bb => dhcpcd_10.3.2.bb}             | 2 +-
 ...20-resolv.conf-improve-the-sitation-of-working-with-.patch | 2 +-
 ...001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch | 4 ++--
 .../0001-remove-INCLUDEDIR-to-prevent-build-issues.patch      | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.3.1.bb => dhcpcd_10.3.2.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
index 6a77ab9f1fe..6ebfc195323 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "42ff6d2548209af3185473e6cb6f9d235c48bbf4"
+SRCREV = "243ad84ac67a87d631ff7eb83b2eed2727acebb5"
 
 # Doesn't use automake so we can't do out-of-tree builds
 inherit pkgconfig autotools-brokensep systemd useradd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
index 512e33aebf9..7e04b5c303d 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-20-resolv.conf-improve-the-sitation-of-working-with-.patch
@@ -1,4 +1,4 @@
-From d1581ce103db0a5db0b1761907fff9ddd6b55a8a Mon Sep 17 00:00:00 2001
+From c91f9cdc0ef56fa64f6ffdd811cc5b0e41991b2e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 9 Nov 2022 16:33:18 +0800
 Subject: [PATCH] 20-resolv.conf: improve the sitation of working with systemd
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
index 484b84f94ae..9d3065a48b8 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -1,4 +1,4 @@
-From e9b1376c59b15e7b03611429187d9d89167154b5 Mon Sep 17 00:00:00 2001
+From dd892eba0147120efdcae923746c444a9d2a76d2 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Fri, 10 Mar 2023 03:48:46 +0000
 Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
@@ -29,7 +29,7 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
-index 91fdde2c..b467dc3b 100644
+index ebbf06c0..c7ffee6b 100644
 --- a/src/dhcpcd.8.in
 +++ b/src/dhcpcd.8.in
 @@ -826,7 +826,7 @@ Configuration file for dhcpcd.
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
index fd3fae7e7e0..bebc79831d6 100644
--- a/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-remove-INCLUDEDIR-to-prevent-build-issues.patch
@@ -1,4 +1,4 @@
-From c2ebc32112e0cd29390b4dc951b65efae36d607b Mon Sep 17 00:00:00 2001
+From 0775eb1b965bbf9b0efb0b1c42c3adf3d8cd31cb Mon Sep 17 00:00:00 2001
 From: Stefano Cappa <stefano.cappa.ks89@gmail.com>
 Date: Sun, 13 Jan 2019 01:50:52 +0100
 Subject: [PATCH] remove INCLUDEDIR to prevent build issues
@@ -11,7 +11,7 @@ Signed-off-by: Stefano Cappa <stefano.cappa.ks89@gmail.com>
  1 file changed, 5 deletions(-)
 
 diff --git a/configure b/configure
-index a60da137..3673de8b 100755
+index e9c08f18..3f0770b7 100755
 --- a/configure
 +++ b/configure
 @@ -26,7 +26,6 @@ BUILD=

