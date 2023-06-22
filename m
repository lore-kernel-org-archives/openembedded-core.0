Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD914C001DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:18 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.17335.1687453872905853936
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 10:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Px3QPjYM;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9896216338cso305175866b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687453871; x=1690045871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONJYvyvdkvFGuLM4UO3pMjJRyQ0ivg5R9/cnJiQleNk=;
        b=Px3QPjYMhQpAjCvJmuBHF1ZNK/4DhJptRprLlFtUi+4fazYI5J0bOBJW7XCGIUm98Y
         lY1TpAZ+uGmK/y7WDW4tmvIx44vdu/BWfkJPzsiaHVJF71iXbLTHNkS1UUUeTamt2OlY
         cdDa9JrDkljR6A5u8zhFZv6S0WSCM70M/pMYrH16LRvCclA5FwwAm/6qNstLbtBQUyx4
         pRdOvEFlzWjpEFPjkSMw+hX9WtlZ26t7RDzXD8VJ+GMzgxFaIAHg26+BAMua0gFOqThV
         vTEm5WbHr5B6yBnI1KsW/rpPZA3KPkNVk5xgaDRUN+NLcUoaaStX+u2evajOO3nP0Rvq
         KEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453871; x=1690045871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONJYvyvdkvFGuLM4UO3pMjJRyQ0ivg5R9/cnJiQleNk=;
        b=fNKnlP5tXADtBOQLllv4me1XzGh4bUngWRBmB5SlDZ/wbu2saH6VYaYfI+zhKYdtVq
         UHp7ycElL51keHMOdR2PqLBsKza2+Wa+hQpMvsQSZOL4yItO+G5vVg72ZNEawtmezfo1
         KeXDR8BUeUtZW0wk8UuwZr1Pit7yJFLNG8cpGVyEOzH1BulI5S0YZ8Z8ZCSH1/pz1Ylr
         6YfppQcZqLEGwtJmaQhT9zkCZOpixGcQxN8tV59MNYdunfP07zFEmzYfMtlFR42408Wu
         sk62O9gTZvU3x5vqPZRoVFlOHXhsfLlN422g/BY+/uK9YrzIBop/MQ5ndOPi6GQ5WFHU
         abkQ==
X-Gm-Message-State: AC+VfDyb9MsnIUVEwitqH9jy5OEdDXLmFcoG/ga4YnCoM3OEE/QVkTlS
	Cj61BkTVgTD2r+6Vk/JtUjhImkXEKRI=
X-Google-Smtp-Source: ACHHUZ7D9unUTLiYcemZ/Cgov4oyvmbhOStKUkC07XFXaaZFmJMjBEuX7nWSex5mnReOOZcJ6Natfw==
X-Received: by 2002:a17:907:e8b:b0:988:9b29:564f with SMTP id ho11-20020a1709070e8b00b009889b29564fmr13454700ejc.40.1687453871086;
        Thu, 22 Jun 2023 10:11:11 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b00982b8cd7a44sm4917053eje.139.2023.06.22.10.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:11:10 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 5/9] runqemu-gen-tapdevs: remove staging dir parameter
Date: Thu, 22 Jun 2023 19:01:25 +0200
Message-ID: <20230622170946.10082-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622170946.10082-1-adrian.freihofer@siemens.com>
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183282

The parameter staging_bindir_native is no longer used. Remove it.
For now the script is backward compatible. With 4 parameters it logs an
error message but still works.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu-gen-tapdevs | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index ec3ecb03b9b..75547c13613 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -18,19 +18,22 @@ if [ -n "$SUDO_GID" ]; then
 fi
 
 usage() {
-	echo "Usage: sudo $0 <uid> <gid> <num> <staging_bindir_native>"
+	echo "Usage: sudo $0 <uid> <gid> <num>"
 	echo "Where <uid> is the numeric user id the tap devices will be owned by"
 	echo "Where <gid> is the numeric group id the tap devices will be owned by"
 	echo "<num> is the number of tap devices to create (0 to remove all)"
-	echo "<native-sysroot-basedir> is the path to the build system's native sysroot"
 	echo "For example:"
 	echo "$ bitbake qemu-helper-native"
-	echo "$ sudo $0 $uid $gid 4 tmp/sysroots-components/x86_64/qemu-helper-native/usr/bin"
+	echo "$ sudo $0 $uid $gid 4"
 	echo ""
 	exit 1
 }
 
-if [ $# -ne 4 ]; then
+# Allow passing 4 arguments for backward compatibility with warning
+if [ $# -eq 4 ]; then
+	echo "Warning: The <native-sysroot-basedir> parameter is no longer needed. Ignoring."
+fi
+if [ $# -lt 3 ] || [ $# -gt 4 ]; then
 	echo "Error: Incorrect number of arguments"
 	usage
 fi
@@ -38,7 +41,6 @@ fi
 TUID=$1
 GID=$2
 COUNT=$3
-STAGING_BINDIR_NATIVE=$4
 
 # check if COUNT is a number and >= 0
 if ! [ $COUNT -ge 0 ]; then
-- 
2.41.0


