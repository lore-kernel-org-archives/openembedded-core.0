Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2506C001DE
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:18 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.17336.1687453873831787006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 10:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jWgi2rU7;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-988a2715b8cso160274966b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687453872; x=1690045872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmCq8Zct8cIGVgBNMUsHLpcD5luVeHFR5qzunnMD0Pk=;
        b=jWgi2rU7MiieIe55qvxsFPNFiayTGls6ZtFusVlrfTr6bHMXQ9fA/sNqAz/RQb1yV6
         eohTQi3QvKvZOF8U4WsCuKjsxv9nAk5Vj/4zluRvWoCwDRfSS7phgun7m4QH5QU1EBfq
         XPdKvfI2bRf8a5uIUX0RACtVn1yKwyeN4B7aQ2Vr9rFp+4Ef+liaQdiEfZOWPDS76vIm
         Wawnqt9Jo+1u/+OZp/e8BMLqP+GbCbfYED4hkLGIlqkWsLIpIQYDJHbo9pS/K/TpSa1s
         giasnzBfokL4h4nciUYQ0FFkL92AWphqN7UR85AMGzr1zv7bMpqqVl46BD2ZWNqjio/t
         0wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453872; x=1690045872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmCq8Zct8cIGVgBNMUsHLpcD5luVeHFR5qzunnMD0Pk=;
        b=b569857v9dk5tDlwsPOWaEiSHXZmpep9z0iePSnkKDJUyCFFhBok1LdvNc/+nWImqA
         El3/IKKxB15UM12ezkOokAggvXavEcu6zhmhJtHFdvmDpiYQKGn1EG5tjnzaD7RrfuA2
         VxOTbbY/6qwGvPJhqWjz2HEUE/0a2Uc6iXz1l3vM0ZJxQim7hrK9z0Qjy96s5dMoWHK6
         oiHX+4G36FRTvQZ+Q7susmcz63hxM6BJ/W+eGvFGPYxOLc+d2kGS5ZOb4WSYAuN4HSUc
         bjKslfOKTg8HYmMTJhGMSzQXNpmntFSnTmxo1yKaa7dTm8dDRkOOQ1src7QTGXactJiX
         R06w==
X-Gm-Message-State: AC+VfDxPOEgIr+c3Jf0nZVe3Kv/XJabJ5s0iCbcKAiCdYBEJaKy6D/K1
	BzbhGUu0dE3VcRzVux7eruZpeii1ilI=
X-Google-Smtp-Source: ACHHUZ7MgvMuFdcu/uYbvRgj6vy0ADUmoMorqRC2gvEjTSn2jvSN9nBhyG2QEhzjmoLr3TBlCykaPg==
X-Received: by 2002:a17:907:2d10:b0:988:7209:f42 with SMTP id gs16-20020a1709072d1000b0098872090f42mr13155723ejc.7.1687453871829;
        Thu, 22 Jun 2023 10:11:11 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b00982b8cd7a44sm4917053eje.139.2023.06.22.10.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:11:11 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 6/9] runqemu-gen-tapdevs: remove uid parameter
Date: Thu, 22 Jun 2023 19:01:26 +0200
Message-ID: <20230622170946.10082-7-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622170946.10082-1-adrian.freihofer@siemens.com>
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183283

The uid parameter is no longer needed since ip tuntap is used
internally. Remove it. Backward compatibility to 3 or 4 parameters is
still supported.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu-gen-tapdevs | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index 75547c13613..7f67ee5540e 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -8,39 +8,42 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-uid=`id -u`
 gid=`id -g`
-if [ -n "$SUDO_UID" ]; then
-    uid=$SUDO_UID
-fi
 if [ -n "$SUDO_GID" ]; then
     gid=$SUDO_GID
 fi
 
 usage() {
-	echo "Usage: sudo $0 <uid> <gid> <num>"
-	echo "Where <uid> is the numeric user id the tap devices will be owned by"
+	echo "Usage: sudo $0 <gid> <num>"
 	echo "Where <gid> is the numeric group id the tap devices will be owned by"
 	echo "<num> is the number of tap devices to create (0 to remove all)"
 	echo "For example:"
 	echo "$ bitbake qemu-helper-native"
-	echo "$ sudo $0 $uid $gid 4"
+	echo "$ sudo $0 $gid 4"
 	echo ""
 	exit 1
 }
 
 # Allow passing 4 arguments for backward compatibility with warning
-if [ $# -eq 4 ]; then
-	echo "Warning: The <native-sysroot-basedir> parameter is no longer needed. Ignoring."
+if [ $# -gt 4 ]; then
+	echo "Error: Incorrect number of arguments"
+	usage
 fi
-if [ $# -lt 3 ] || [ $# -gt 4 ]; then
+if [ $# -gt 3 ]; then
+	echo "Warning: Ignoring the <native-sysroot-basedir> parameter. It is no longer needed."
+fi
+if [ $# -gt 2 ]; then
+	echo "Warning: Ignoring the <uid> parameter. It is no longer needed."
+	GID=$2
+	COUNT=$3
+elif [ $# -eq 2 ]; then
+	GID=$1
+	COUNT=$2
+else
 	echo "Error: Incorrect number of arguments"
 	usage
 fi
 
-TUID=$1
-GID=$2
-COUNT=$3
 
 # check if COUNT is a number and >= 0
 if ! [ $COUNT -ge 0 ]; then
@@ -78,10 +81,10 @@ if [ $COUNT -eq 0 ]; then
 	exit 0
 fi
 
-echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
+echo "Creating $COUNT tap devices for GID: $GID..."
 for ((index=0; index < $COUNT; index++)); do
 	echo "Creating tap$index"
-	if ! ifup=`$RUNQEMU_IFUP $TUID $GID 2>&1`; then
+	if ! ifup=`$RUNQEMU_IFUP $GID 2>&1`; then
 		echo "Error bringing up interface: $ifup"
 		exit 1
 	fi
-- 
2.41.0


