Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1762BCCD18D
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:50:51 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.2337.1760064649998411954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=raXdstf4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so1584705b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064649; x=1760669449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+YUxQVu3s+mrZtqn41ktEG7tWWBj0erKt+psdJ69Vk=;
        b=raXdstf48AOtbaxE7I1NzrHlOAoZkDFI7wXRZJQZol2/rpZHLbvsOEKySbEu7N0daZ
         afpdUDOYLL8HA9c2xVyMyRKZM7mRjh8UV6PJrSP/mzAN6sys2qgDngGIxyuEwHMGjQbM
         mq0gl2QXiT0WAJqt0QzFbJUtG2yQ+IGr6YRbxlLKpnChEYxgx780HVzixf6DU+eoCeEB
         VdiLdr0EhORqhVctoqSxZIeYkXqJbgiDPpKuzZmfNQJEw1bqHYttdFyAiJY65QlN8btO
         g600eWj6z8TGtFebFdArNZ3J+vccQWBc/3B2QBmSVoyiHeDKOYBhhJi5s1TVjM+Yi7MM
         irZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064649; x=1760669449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+YUxQVu3s+mrZtqn41ktEG7tWWBj0erKt+psdJ69Vk=;
        b=St/8gndQZTlBot06u54nABUiqOSf8SwpMdu039P6D30Bj2Y8Gm8mnFT52T19uGWKQ5
         tbEozWAi/XXETnFPz4xSqdS8gHwPSlQyiW7rw/mkjOGCKQzo8D6o9tp5dxTVydmSXhXE
         1NfKvBky1FCnWV6S+StgyXaAnqT4FwW52UbOI6kOAdgen9aasXj2z3EBTSlYRdJo7atW
         PcEVJ7fsZaaS5tHEI4UNWiFh8RefQHqR916I3WpvMdjBr8eJECpdlmhNwaxhnlqCLHWn
         tRTalS3Kbsno+j2OQ22k752XjVZH2O+b1VQncVLqKk9YnZxO3SFma6X2qoG/d2N81/os
         ykFQ==
X-Gm-Message-State: AOJu0YwAwr+ATZBY8odOM3BspM5Bw34/vzwjkcpV44pt1FJVHYNoZpjg
	h6/Kp3bAkB9p4EJz34xPuhQ6OUYQ5Altu09XT/QKNsA7nFN+0xoBcoyrswbST6p12l0D/t7O+h4
	13tU/
X-Gm-Gg: ASbGncuX+LCsDhDBggWaHrT207mbfwevE65RDiSFqpaId6gYXPSmJ4nVkD7s/u42udc
	yl5BYErSzqFwOyw7RxAZLoEnUEZmtvzQf5ek5jZdQLDtLKtn2CdwJdge/YeBAYmexyXSIa5G771
	9IqyIC9rE7UAxIWmU/MrK+ghl62ZlL15mMFr2CBAl50EX8+ens5+7vEHskrglZNbAA6F4M6tR+w
	410ngJj3kYk7YorwvqkLD6FakwSCqXHz9HcvUA31QrYva5KwZGxQO+x6o0ocJXCLpyW6pnM4ps6
	enF1PHDr/8PYdByCBddb0FmXBOCZwZeNgz5rses1OfuZUb7MJoLqhEoTLGMrMdlLow/7LbGFbpA
	BCSAkrovphYtgTBeUP8NLOQZqFJzgvuMr
X-Google-Smtp-Source: AGHT+IHGWwVNaQiRTTlfnkC82rnz3onP6UHaRrBY3yY90Ddeo6/EkskXu+mO4kkorQ6VeoRl0klRHQ==
X-Received: by 2002:a05:6a00:2346:b0:77f:605f:20e1 with SMTP id d2e1a72fcca58-79387a28824mr10222489b3a.27.1760064649224;
        Thu, 09 Oct 2025 19:50:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.50.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:50:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/18] gstreamer1.0: ignore CVEs fixed in plugins
Date: Thu,  9 Oct 2025 19:50:22 -0700
Message-ID: <c5a68886247d4417de4ecaa8460e25e84ab93b0d.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224647

From: Peter Marko <peter.marko@siemens.com>

All these CVEs were fixed in recent commits.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gstreamer/gstreamer1.0_1.22.12.bb           | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
index 3f28459e2d..cfc66745e3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
@@ -74,17 +74,26 @@ CVE_PRODUCT = "gstreamer"
 
 CVE_STATUS[CVE-2024-0444] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-bad in 1.22 branch since 1.22.9"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_PLUGINS_BAD"
+CVE_STATUS_PLUGINS_BAD = " \
+    CVE-2025-3887 \
+"
+CVE_STATUS_PLUGINS_BAD[status] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-bad"
+
 CVE_STATUS_GROUPS += "CVE_STATUS_PLUGINS_BASE"
-CVE_STATUS_PLUGINS_BASE = "CVE-2024-47538 CVE-2024-47541 CVE-2024-47542 CVE-2024-47600 CVE-2024-47607 CVE-2024-47615 CVE-2024-47835"
-CVE_STATUS_PLUGINS_BASE[status] = "cpe-incorrect: this is patched ic gstreamer1.0-plugins-base"
+CVE_STATUS_PLUGINS_BASE = " \
+    CVE-2024-47538 CVE-2024-47541 CVE-2024-47542 CVE-2024-47600 CVE-2024-47607 CVE-2024-47615 CVE-2024-47835 \
+    CVE-2025-47806 CVE-2025-47807 CVE-2025-47808 \
+"
+CVE_STATUS_PLUGINS_BASE[status] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-base"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PLUGINS_GOOD"
 CVE_STATUS_PLUGINS_GOOD = " \
     CVE-2024-47537 CVE-2024-47539 CVE-2024-47540 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 \
     CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598 CVE-2024-47599 CVE-2024-47601 \
     CVE-2024-47602 CVE-2024-47603 CVE-2024-47613 CVE-2024-47774 CVE-2024-47775 CVE-2024-47776 \
-    CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 \
+    CVE-2024-47777 CVE-2024-47778 CVE-2024-47834 CVE-2025-47183 CVE-2025-47219 \
 "
-CVE_STATUS_PLUGINS_GOOD[status] = "cpe-incorrect: this is patched ic gstreamer1.0-plugins-good"
+CVE_STATUS_PLUGINS_GOOD[status] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-good"
 
 PTEST_BUILD_HOST_FILES = ""
-- 
2.43.0


