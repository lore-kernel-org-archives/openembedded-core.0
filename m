Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD082EB64DD
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:18 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.17331.1687453870631971391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 10:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MGbKd7eF;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b46cfde592so84915231fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687453868; x=1690045868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6MbWQS15cHVvl56zQhC+6DHzBfvRuPBDwqTf9vAZIg=;
        b=MGbKd7eFHEINxu9AmX/4Tz8W7Ip8IKhlFSQSh4/Nuhq0z3cnqavxLvRBST+zCQiF66
         v4xvATk+Uii0n1zVMxYP7/Em+uRaIH8zQ9s73CGSI2XHIHdCx62fijgPA0zGX9mA0UeI
         eDv9WQ+wT/ZAvdudSZ59TKnUlR5MLM4ov8nXjYirQPzbtV93JuzJ/cWU3HYzajJjqG4p
         t4H6pvPuh2KORmvxNqiYS+LEZKp6KEZGxTJ18KipTqBQK/ECXTA+iFbV5fs0V2nEital
         xEP8xDCzF0951NX5YlMZGRvcIYg7D9oo2vPeYtKoNJOz/qLErWe6Apjx3c4F0XTngy3k
         u+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453868; x=1690045868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6MbWQS15cHVvl56zQhC+6DHzBfvRuPBDwqTf9vAZIg=;
        b=bDBJGmu7CHc+80VLn1hrUwTanFL1ziJA87Podp7+ZB0RI5pOLUqw4EgnhxSxy2XcPp
         4rywRLr9Q5nUKb46QvIU8RnohcSrodKbLHsRFLv1WT0opD7eZ112EfVjUDY7fNl09ph/
         rG4rhsoOWSDGdV4hnuH+ULDU9jVKutjpSlKW8XfppbWd2TPzngMt4uqQwaK8vpiCrGt0
         Satr2OLnXiRrtYegVhAgK0oLYMNjBTpl36JvJzUbZOEJwd1QaNt1ljBsjyX9v4ewKDhM
         aCuN0YZ+rEvCb2euDXvxhBb/Ts17iAlfmyCm0Hcn84JyWKvMaMwsI4K44gOPS/gijd/L
         7a0Q==
X-Gm-Message-State: AC+VfDwCrDElIPhTEbm99AQpz0AB/MMrnGBVMMSZorMbR/Lmry+V0ChW
	zB6e3N99ioCSSfvtJeYb0Lp1ozMPofU=
X-Google-Smtp-Source: ACHHUZ7Xq5NqOTZ+dAE0JRK7YWT3S33r49SGXY76pORlji9/+4W0T4+eTB7D8La2slMUFze5MkuONg==
X-Received: by 2002:a2e:b0ed:0:b0:2b5:882c:5a8d with SMTP id h13-20020a2eb0ed000000b002b5882c5a8dmr4015829ljl.8.1687453868273;
        Thu, 22 Jun 2023 10:11:08 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b00982b8cd7a44sm4917053eje.139.2023.06.22.10.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:11:07 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/9] runqemu-ifup: remove uid parameter
Date: Thu, 22 Jun 2023 19:01:21 +0200
Message-ID: <20230622170946.10082-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622170946.10082-1-adrian.freihofer@siemens.com>
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183278

ip tuntap does not need the uid, it was an unused variable/parameter.
Backward compatibility should be fine.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu-ifup | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index 5dc765dee82..26714518020 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -21,7 +21,7 @@
 #
 
 usage() {
-	echo "sudo $(basename $0) <uid> <gid>"
+	echo "sudo $(basename $0) <gid>"
 }
 
 if [ $EUID -ne 0 ]; then
@@ -29,17 +29,20 @@ if [ $EUID -ne 0 ]; then
 	exit 1
 fi
 
-if [ $# -ne 2 ]; then
+if [ $# -eq 2 ]; then
+	echo "Warning: uid parameter is ignored. It is no longer needed."
+	GROUP="$2"
+elif [ $# -eq 1 ]; then
+	GROUP="$1"
+else
 	usage
 	exit 1
 fi
 
-USERID="-u $1"
-GROUP="-g $2"
 
 if taps=$(ip tuntap list 2>/dev/null); then
 	tap_no=$(( $(echo "$taps" |cut -f 1 -d ":" | sed 's/tap//g' | sort -rn | head -n 1) + 1 ))
-	ip tuntap add tap$tap_no mode tap group $2 && TAP=tap$tap_no
+	ip tuntap add tap$tap_no mode tap group "$GROUP" && TAP=tap$tap_no
 fi
 
 if [ -z $TAP ]; then
-- 
2.41.0


