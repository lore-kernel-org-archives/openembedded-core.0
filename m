Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D7CC7EE31
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 14:23:34 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.8201.1750515812803301829
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jun 2025 07:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aije80tL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso1215345a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750515812; x=1751120612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySnMFH6TEi9MQ5hyGsDztv0hnjiVfcW42UAAJO4vSOQ=;
        b=aije80tLqdHKgowgx1CPHglM6F/bYRAKT+NN+pp22d1msVKivCWJBzmtI4TR91o+DI
         lCEEa95rszOBw8SahG3jvuVQXxB20ntM9vXmk0OiFEUbCFBRQYt4zKihBvAbXnc/9zuo
         Kiu5aS+jet/J8IeuVqT1wX7OK2pZr+j69/4cRIPrbdfX8ckZuhBnow8gfxZLUsiltTMy
         gkD9sQ7RRw0s6NbgmjCa9iCBUo98lSw7kcbK1HHqZvGZZqYtz5lv+wkg0gARcGztPKal
         M6J3VSwR74ZN1Y9Zz7fQJnZL/w4j7O0yKhQZDunatllCq6acd885iEz1I3No8BgEfB1p
         nMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515812; x=1751120612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySnMFH6TEi9MQ5hyGsDztv0hnjiVfcW42UAAJO4vSOQ=;
        b=Db7l+MtVVeElPMSFnsL2ArW159QYpMJv69e9c/lnBuQZJ/SzdlvAsTzkHk0ITMssMK
         /BiUaVF30Dsm3O8aM8mw7j0IAdIuUhrq1ipceSc+nStMmj2dx2T1y9heX+c+3hYU4yj2
         gg501OK16Td+e/5RZwabeQJtyLz3pCZJZo81qcQ4Nkjl84tsAvoq4te2iDHmqwbwlxjD
         QzkWRhMSEN5gRZr0j+L1i0BgrECa6f/sbhWaP55Ri5lSf7pXUsivObjLk3QhcbBpe8Ev
         A4JWvPH2Sz2UDHeMCYRT4gXododQj1BDV/JMJ8ANDSS42Na6pF4c+JJ2eCHhBuX0uXSF
         SIEQ==
X-Gm-Message-State: AOJu0YxBzw9UFX//tUcLpV3Rxw8Hgoy2u5DECi8YJshOsb36ycA9RZpZ
	4lERjeC9v/XihVkDwMML7FHUDLBy6kZT67jZ2XCfW04gseh/D6yVls6aJKIL9nW/fngEgi617MS
	pe01Y
X-Gm-Gg: ASbGnctm9RScaQTaqT0t+qZGWEDYOtFz1va3GbAMa3G6zrNtvVFqPHaU0GCgojuqc72
	av9yC2v6p7niI5PDPfBYef1TI0Vujs0Kvi28580BSpOTOXhLAeX6GUP90Od9NnYZBhaVcww6xe1
	UfnbzeUR+XXmHkWOrhCn8PYamqOvhA2R8NUiJeCHpTDECqG7yQPfV0hcsmZGV2J4R9ao+G0IlBd
	/KeJZBJZXAvOa7jBQi3fZYesyF4BOnjC1koKNWU6NR9tb8kL75uLi8E+q2pdjKY9aEk0XzJL2hL
	OnKszZHCGCsFAc5RS1vN/kDI6tIwUWW4CCSl8gsELIvqodiczzMUZA==
X-Google-Smtp-Source: AGHT+IG+O2VjWsk3KWvvRNuKLJ5bI12T1nYIAddfkSxTU2LUevqrllGdA9zQVvxBubBvgyS39rxkXg==
X-Received: by 2002:a17:90a:d64f:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-3159d63d9e7mr12241794a91.12.1750515812031;
        Sat, 21 Jun 2025 07:23:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bf1:320c:7400:5bfc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a23e6efsm6596807a91.16.2025.06.21.07.23.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:23:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 5/7] bind: upgrade 9.20.8 -> 9.20.9
Date: Sat, 21 Jun 2025 07:23:15 -0700
Message-ID: <8131a878c2d3c5e8b48a1b33a70f8eae90d3e5ca.1750515680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750515680.git.steve@sakoman.com>
References: <cover.1750515680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jun 2025 14:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219163

From: Praveen Kumar <praveen.kumar@windriver.com>

Overview of changes in bind 9.20.9
==================================
Security Fixes:
1. Prevent an assertion failure when processing TSIG algorithm.
2. DNS messages that included a Transaction Signature (TSIG) containing
   an invalid value in the algorithm field caused named to crash with an
   assertion failure. This has been fixed. (CVE-2025-40775) [GL #5300]

For additional feature changes and bug fixes, please see:
https://downloads.isc.org/isc/bind9/9.20.9/doc/arm/html/notes.html#notes-for-bind-9-20-9

(From OE-Core rev: c9d59ba50a102ace907779612e74646dec133271)

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.20.8.bb => bind_9.20.9.bb}                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.8.bb => bind_9.20.9.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.8.bb b/meta/recipes-connectivity/bind/bind_9.20.9.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.8.bb
rename to meta/recipes-connectivity/bind/bind_9.20.9.bb
index 864daed97e..93ff957fc5 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.8.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.9.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "3004d99c476beab49a986c2d49f902e2cd7766c9ab18b261e8b353cabf3a04b5"
+SRC_URI[sha256sum] = "3d26900ed9c9a859073ffea9b97e292c1248dad18279b17b05fcb23c3091f86d"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


