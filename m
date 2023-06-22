Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A98C001E0
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:18 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.17338.1687453874898691744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 10:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PnBukERA;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b45b6adffbso101798531fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687453873; x=1690045873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnBny6s1kUXPkb1ezOM2RAnALkyUOxh1mS9b/6Ww1/U=;
        b=PnBukERA4kZ+Q60zdM546O1evKIfzik82ZtH3Ao8GQHsKqJtZkqB3y+K15FHaCLmw4
         Xhe3ujX8FUyOLAMFXPiqmPR3EdWEGDUs01VPd4Pk0VAV7Gw4h0DYUfi9vf2MCO+X1G79
         ABHjjq7O5tOpd94M412sSydf2hyzx0Mw+tV9tvlCJvdkWLIZzDzJzk+P6UJQ2+X+Fe25
         mYzVaMk6R8McLPk0HqrcgCS6R7idvUB72i+se4zTD36AMXfoJTTQNeWMV8vdOwfyyhMf
         XeL2Ph7s8mYFy+dDeDVCIbbcwzwUrUxPN6f+ftEgUMHatdlNjnj/MBJNVAeAtt4J9Dnl
         qQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453873; x=1690045873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnBny6s1kUXPkb1ezOM2RAnALkyUOxh1mS9b/6Ww1/U=;
        b=DbZ1xSSK4n3Uv75lO+IhLWbS1TXah6lo444EuINuSG3N44c6Br65YU8sdV8kFYWZEu
         hNQQJeuFTTial/E3MomTbbd+0H1xRPjlC2H+6EAWjVfgssmvV+VEj2Tpsjl/i2hM8//9
         z3xHZX1VsXj3dO88eOKDf+7Wa20xX4gO48Rue4y/ljJqa6etFUkZGK4WGFLUQw10c4Qq
         vPB/A1O2bs45fN3EvF+gU1YIj+7fbNWm9h5kskU9PsXi4jlTHZ74tQAD6HmpUMEjNyiD
         xCMi8p2QlbLi0Jfzp8ZVp+g/ej5iLssY+kbN1HuligdKqzWw0VJ9UKN5UW4/OKAFZD4s
         8K3Q==
X-Gm-Message-State: AC+VfDyoAK/ydm/N9vFaLOFX8ixCvIYLoAZrKmqi9CBQIrASI7TSWAgp
	Bp+gHW/pgRHTjJw6EB6XZCEVitWmZmQ=
X-Google-Smtp-Source: ACHHUZ6F1RpjZeNmcKlTz2MlD4wYCdisWDM2Pj0rU5zLzfN7o3kSJZoYbgDiTCRnXAlZicm0X2uQQA==
X-Received: by 2002:a2e:9d19:0:b0:2b5:8153:deb3 with SMTP id t25-20020a2e9d19000000b002b58153deb3mr4713327lji.4.1687453872487;
        Thu, 22 Jun 2023 10:11:12 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b00982b8cd7a44sm4917053eje.139.2023.06.22.10.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:11:12 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 7/9] runqemu-gen-tapdevs: configurable tap names
Date: Thu, 22 Jun 2023 19:01:27 +0200
Message-ID: <20230622170946.10082-8-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622170946.10082-1-adrian.freihofer@siemens.com>
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183284

Feature: Hard-coding the interface names to tap* is not always a good
idea.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu-gen-tapdevs | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index 7f67ee5540e..cbf80089290 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -45,6 +45,10 @@ else
 fi
 
 
+if [ -z "$OE_TAP_NAME" ]; then
+	OE_TAP_NAME=tap
+fi
+
 # check if COUNT is a number and >= 0
 if ! [ $COUNT -ge 0 ]; then
 	echo "Error: Incorrect count: $COUNT"
@@ -64,7 +68,7 @@ if [ ! -x "$RUNQEMU_IFUP" ]; then
 fi
 
 if interfaces=`ip tuntap list` 2>/dev/null; then
-	interfaces=`echo "$interfaces" |cut -f1 -d:`
+	interfaces=`echo "$interfaces" |cut -f1 -d: `
 else
 	echo "Failed to call 'ip tuntap list'" >&2
 	exit 1
@@ -83,7 +87,7 @@ fi
 
 echo "Creating $COUNT tap devices for GID: $GID..."
 for ((index=0; index < $COUNT; index++)); do
-	echo "Creating tap$index"
+	echo "Creating $OE_TAP_NAME$index"
 	if ! ifup=`$RUNQEMU_IFUP $GID 2>&1`; then
 		echo "Error bringing up interface: $ifup"
 		exit 1
@@ -95,7 +99,7 @@ echo "Note: that the tap devices be set as unmanaged in the"
 echo "Note: NetworkManager.conf file. Add the following lines to"
 echo "Note: /etc/NetworkManager/NetworkManager.conf"
 echo "[keyfile]"
-echo "unmanaged-devices=interface-name:tap*"
+echo "unmanaged-devices=interface-name:$OE_TAP_NAME*"
 
 # The runqemu script will check for this file, and if it exists,
 # will use the existing bank of tap devices without creating
-- 
2.41.0


