Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42E6C0015E
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:18 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.17332.1687453870843929384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 10:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JVXS6Qiy;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-51bea30ccbcso876773a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687453869; x=1690045869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJaALFaVd9wts4+5UTP+qAt/kwrsDkyMJy+zCwegHIk=;
        b=JVXS6QiyIhRUzgLmS7n7UAa00GQyPWNW/gt+M6Wkbm2zUbQ4VG/FabAUMXXyGuXX66
         SxNFb4r9DoAL621U95mcs+VHoDUOW2h887NQr6CKRP9hXM4psxIQOAdIpAId1Jdr6tKu
         d0gRto+cSnA9+Jx4f+UIhu7uhx2gbteduHlnWCpBEtig+3SSprKg/hNAKdY081WQy0KN
         R/uoKpNWkkhalCLctY/VTWq5k/94r3qmp452LvQbNhOJv0wmxrhtctdVvIcMXzQQSAfh
         LqHa3kiP0W3JlE3r4/fwZYTykxIYIUdIQBsCGMiqJSRbZHZw8yqAJPNcR5pKwrA98CMH
         4iNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453869; x=1690045869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJaALFaVd9wts4+5UTP+qAt/kwrsDkyMJy+zCwegHIk=;
        b=gm4/z1PpeEvXLgHxWpCtD+qPUZDqF2DU0pAvFCNucTAwQ1mdK5Q5wDO/LgCpN/70ha
         XIf76e3BYp/dS6ZvsI1IsIAqouB1UfL7CPDqMf9i3c7Yr3Ub4Tt6EXhG46mw6+6kei7T
         jSX5IjPURaVD+O1nTNxWhObX961qvgQrc7E2W26j6L+PHYny8O4u6cg2rEU6L9PZc5sF
         swbBZ0ye7eTUb6+EU2bctq7pKWhQd5IUfZ5CGMyQHlsZ7QqG9qaFx2xj7FoZks3bKFl3
         z9eZyXB7vNzIKHe7VQxd6+uAQ3JnlE+aCEDGpduGizkBZGIzRRJVUeouoOyhYworAnR6
         EkrA==
X-Gm-Message-State: AC+VfDzrVxsPa8AXFNUGOZ3XSnXHR2gp9T+NgyrX4dQMc74eqKOwQQ3s
	CSXYXwausywqFXSQstTVy77DULAP8Rs=
X-Google-Smtp-Source: ACHHUZ4G1gEUy3JEJn0bcoakunIxAuHY3eXPHcKnt/QoOfsr21CDLEZKqnQKADmU/18JVMoSYrBDpw==
X-Received: by 2002:a17:907:3f99:b0:973:e349:43c9 with SMTP id hr25-20020a1709073f9900b00973e34943c9mr17199207ejc.77.1687453868934;
        Thu, 22 Jun 2023 10:11:08 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b00982b8cd7a44sm4917053eje.139.2023.06.22.10.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:11:08 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/9] runqemu-ifup: configurable tap names
Date: Thu, 22 Jun 2023 19:01:22 +0200
Message-ID: <20230622170946.10082-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622170946.10082-1-adrian.freihofer@siemens.com>
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183279

Feature: Hard-coding the interface names to tap* is not always a good
idea. Introduce an environment variable which allows to change this:
OE_TAP_NAME.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu-ifup | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index 26714518020..9820dc535c9 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -40,12 +40,16 @@ else
 fi
 
 
+if [ -z "$OE_TAP_NAME" ]; then
+	OE_TAP_NAME=tap
+fi
+
 if taps=$(ip tuntap list 2>/dev/null); then
-	tap_no=$(( $(echo "$taps" |cut -f 1 -d ":" | sed 's/tap//g' | sort -rn | head -n 1) + 1 ))
-	ip tuntap add tap$tap_no mode tap group "$GROUP" && TAP=tap$tap_no
+	tap_no=$(( $(echo "$taps" |cut -f 1 -d ":" | sed "s/$OE_TAP_NAME//g" | sort -rn | head -n 1) + 1 ))
+	ip tuntap add "$OE_TAP_NAME$tap_no" mode tap group "$GROUP" && TAP="$OE_TAP_NAME$tap_no"
 fi
 
-if [ -z $TAP ]; then
+if [ -z "$TAP" ]; then
 	echo "Error: Unable to find a tap device to use"
 	exit 1
 fi
@@ -69,7 +73,7 @@ if [ ! -x "$IPTABLES" ]; then
 	exit 1
 fi
 
-n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
+n=$[ (`echo $TAP | sed "s/$OE_TAP_NAME//"` * 2) + 1 ]
 $IPTOOL addr add 192.168.7.$n/32 broadcast 192.168.7.255 dev $TAP
 STATUS=$?
 if [ $STATUS -ne 0 ]; then
@@ -83,7 +87,7 @@ if [ $STATUS -ne 0 ]; then
     exit 1
 fi
 
-dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
+dest=$[ (`echo $TAP | sed "s/$OE_TAP_NAME//"` * 2) + 2 ]
 $IPTOOL route add to 192.168.7.$dest dev $TAP
 STATUS=$?
 if [ $STATUS -ne 0 ]; then
-- 
2.41.0


