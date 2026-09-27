Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EFDCA5FA7
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:55 +0000 (UTC)
Received: from mail-wr2-f17.google.com (mail-wr2-f17.google.com [74.125.225.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33580.1790495022062123892
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ougarz23;
 spf=pass (domain: smile.fr, ip: 74.125.225.81, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f17.google.com with SMTP id ffacd0b85a97d-4887d06c669so1576296f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495020; x=1791099820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ju4T4+nI0Ckg0c+w4U2y9F/tTSGQ1ESr1vXL35iGoiA=;
        b=ougarz23rbQJ9LavwjM38tcAkShsuNCHjcgmwjqdZOXxxp+lCPSRxB/PpEHVaMuc99
         fHykWYvhC75n/SHlDDATMk1LAsDrtsbHvmfAhEexe6ektNCCbIvTbE8FtleNOcDl3s3+
         j5/7BXM9ZTwG5haPdB41yuQGY4HmIzr9KZkxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495020; x=1791099820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ju4T4+nI0Ckg0c+w4U2y9F/tTSGQ1ESr1vXL35iGoiA=;
        b=t072Hs/hVGPf1L+1SkugqlMz95d6fBJSY35R1s3MoeMYq/GG2ZPiQ6GTOU1zvqBqvM
         s//ywRgfTJtMSFkZ28Kmu9dN6r+VoDckWoTu7sfNP+mKWUVpNMyyaTj4Kjrk7yPAnOts
         HMkFaRxeg8AO9y6dV23LXNIWuhxMM/eOxboP10d+IhjtB4LnBU41YvQDi2CZHiGBzGVJ
         7XSbRO1SRq2/6xkrE+hvuknyXXR47iS8qnhL4BtxYOx1HEYrzxNlyLmdD07hQdaOIJPv
         clQ3qC8zZp446olASxXdPcYj9UXASsr+i2RVE96Rwe7bGJE4DKwDM/LorSsr55yCrA50
         WC0A==
X-Gm-Message-State: AFq9FYJvy4im9ooRXIzb8cI/9xuHMO8dtg/AsxywIqhS5QtwUCCUAglE
	Out67T36rJUHnx+ieUiehyQLouOmqx1coE2NuTPTq7gO7hrZRMF5VN5WlmsO4v7W7upyYNTG9KI
	sMI+tgKQ=
X-Gm-Gg: AYBFou1FakuVKg+PMuwH6mNZ4GcaoxFfcJ8yOjOpAP/A5fbpYjl8nCtCwJW6Na9QD0t
	xyVf19TX7r//nFM4TpEPbP41gx9KBwdBxWuh6ig2xQbjhJnFJBbMZ6iQevImUL8IvIyCu53NllK
	BXOWv76BApggQgLTOAyNW4l8vGCDe+y/i4oTApsgBHfB1irYLbxws90yTD2plubv2/29GNzpqQX
	+MVi9iFqHOXN3eE69DqtkvJRSJrT07G/R2mZ7YLGp3MEUVv2BeKA5ZzxiutSi9I26ys+rsququ9
	FgxwdJ/O0D6lKH+D7UZnFC3tpjotUBxFAmSQ1nSS91bA2jCX4EX2uluXS67HA2KtC1+kXkwuB7a
	uZuvm/ZYYwhOoztAV7eAd9mkrB0AMq0JSwkmEeUK8V8hfGo2uwhfLD2JOc9h+h9kUg/5cHBipoS
	wQ3Eh88FmX2o0xN0awcTDRBB6gd3Zudw3JMHWMP8my1WpTEunv7YzK5rHECKhBcGkGtTVRkYbve
	YeBGRdxDyRxItycbuoEmIA8mb0oBuNOncKCSDibd9kR1HeiWtLiadi01Qc/GeFbWOaEHqKtTg==
X-Received: by 2002:a05:6000:268a:b0:486:f9d9:fe0d with SMTP id ffacd0b85a97d-48872abc48emr18865140f8f.29.1790495020311;
        Sun, 27 Sep 2026 00:43:40 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/28] dhcpcd: upgrade 10.3.1 -> 10.3.2
Date: Sun, 27 Sep 2026 09:42:54 +0200
Message-ID: <3fc3aa51109a3bb43d92b2664e4005848b87f1c1.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246653

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e61572f9a24839a1a2386a51d40b561f340f78f)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
index eb257cb27c1..5895a2669d9 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
@@ -21,7 +21,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://CVE-2026-56117.patch \
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

