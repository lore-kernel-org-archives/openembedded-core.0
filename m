Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4242AC02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:35 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.42255.1737395489912071203
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SorMqnLp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2162c0f6a39so106866385ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395489; x=1738000289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvTq3bQpfOD5kAD7Y0hMV9V98ISPNgg174lKPsPBvQ8=;
        b=SorMqnLp25ZSeRZQr/j9C4F2uJ7s+1LmuV1XFgWeN/w9Qmms/zzOx0D3ZfLvXDLMao
         uG4Nfo1RKNSMXr4ukh8enhMGtNAhcquDaSuOC6pK8SP8SwgPyTMEuXpl5BULa/BZocnS
         5ApdIr0ds9Lnxqeqyi1VTa+l7u54jCvKq7N46oSGq+RY2JVabh1u07TNvDLnf+2/+xiT
         ohC1L3x4UevF9/fH+FGYjETc12Itjq12dDhSD+Uva5MRn7z7kD19Aq6rfLbZ1qUNbrXC
         gNvdBURxVINwfncMYg3JtLSitt6yrMRnYn1RQgdcEJ/1EFvrLbmNr1zilJFS7Y3wcKZZ
         /NWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395489; x=1738000289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvTq3bQpfOD5kAD7Y0hMV9V98ISPNgg174lKPsPBvQ8=;
        b=Q5Zecrg8lQecbJ3A0+/BxiGj1wthTrQELnJVZ+dMbjnC/Ed5u+/bD3HGz96/BD4hz9
         bm6seg6CuKAxFH4u3GM5G1PCIf7uUNx46o99864biy8nRy+XdFUxYMFBEV6sAetlDfkh
         0UEIBtY5nxgJScriUWT37wfVHUVvlWrUtxu+UgieYNrpNCrypwdLAWQ5VyfPWyF72gWk
         uF4tEF1aG7quOCxZPJxfGI0Et0Bi2XS1OU+1fq7MdC2mAvxAF5J9jGkSVEOlfiYzw8IW
         sKdrgJ1b6xDGQVvMQFcewN4eqArCnC3+0Z+yu+Ub+0UORW/DXVVPZXh8CB3FouCG7c0z
         SuAQ==
X-Gm-Message-State: AOJu0YzkJxFT9AS5mFNvECSDyLo0I5nb+KdryXx17kdp+Syna/DnqSN1
	UwiX1Wm/+tYTzXTWk6sr7IFeHQwIno/W8ooOa9kMHtCC41HvswURRrZjVUe/8+AhFkbtAxszBYI
	cVoA=
X-Gm-Gg: ASbGncvb99BLk0LjotTE4QnqhXueLGvA9Rjp4dVGu/jkmUovDulxu99YhlQZ9CAWbEJ
	NnEEwgLq/aWbuPxaBo7wK1GZ5qsDrI1izyevhr3cghxv3gblm8cK+caFwQ+jRiC4RLMFVklq2/E
	rMPtFGydOkgTVdOzlhLjb3lH36vrkQxD5kiezN7zGH9bRkEvfaM6YZpNNLTW1wtY4l0PdzZMvig
	Iwe2isKMuswFvb7nMeJDgqR2vLn3sLPOWKF374msUMnrMEQXTmZ6JGMGw0=
X-Google-Smtp-Source: AGHT+IGQrgqv8fMZ58RNzX51lKxMYQ9OGBpX4uUY8KYo/M+3SvZ1p4XEivl4Sj4oStrRBAg9hQIQxQ==
X-Received: by 2002:a05:6a21:3389:b0:1e0:cc01:43da with SMTP id adf61e73a8af0-1eb2131a4e8mr19749739637.0.1737395488111;
        Mon, 20 Jan 2025 09:51:28 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/16] ofono: patch CVE-2024-7540, CVE-2024-7541, CVE-2024-7542
Date: Mon, 20 Jan 2025 09:50:57 -0800
Message-ID: <f76c9f6940df64654710a83a6f3c6168b63fc611.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210057

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick commit
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=29ff6334b492504ace101be748b256e6953d2c2f

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...024-7540_CVE-2024-7541_CVE-2024-7542.patch | 52 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
new file mode 100644
index 0000000000..0b06e057e5
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch
@@ -0,0 +1,52 @@
+From 29ff6334b492504ace101be748b256e6953d2c2f Mon Sep 17 00:00:00 2001
+From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
+Date: Tue, 17 Dec 2024 11:31:28 +0200
+Subject: [PATCH] atmodem: sms: ensure buffer is initialized before use
+
+Fixes: CVE-2024-7540
+Fixes: CVE-2024-7541
+Fixes: CVE-2024-7542
+
+CVE: CVE-2024-7540
+CVE: CVE-2024-7541
+CVE: CVE-2024-7542
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=29ff6334b492504ace101be748b256e6953d2c2f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ drivers/atmodem/sms.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/atmodem/sms.c b/drivers/atmodem/sms.c
+index d994856b..0668c631 100644
+--- a/drivers/atmodem/sms.c
++++ b/drivers/atmodem/sms.c
+@@ -412,7 +412,7 @@ static void at_cmt_notify(GAtResult *result, gpointer user_data)
+ 	struct sms_data *data = ofono_sms_get_data(sms);
+ 	GAtResultIter iter;
+ 	const char *hexpdu;
+-	unsigned char pdu[176];
++	unsigned char pdu[176] = {0};
+ 	long pdu_len;
+ 	int tpdu_len;
+ 
+@@ -479,7 +479,7 @@ static void at_cmgr_notify(GAtResult *result, gpointer user_data)
+ 	struct sms_data *data = ofono_sms_get_data(sms);
+ 	GAtResultIter iter;
+ 	const char *hexpdu;
+-	unsigned char pdu[176];
++	unsigned char pdu[176] = {0};
+ 	long pdu_len;
+ 	int tpdu_len;
+ 
+@@ -661,7 +661,7 @@ static void at_cmgl_notify(GAtResult *result, gpointer user_data)
+ 	struct sms_data *data = ofono_sms_get_data(sms);
+ 	GAtResultIter iter;
+ 	const char *hexpdu;
+-	unsigned char pdu[176];
++	unsigned char pdu[176] = {0};
+ 	long pdu_len;
+ 	int tpdu_len;
+ 	int index;
+-- 
+2.30.2
+
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 8205ea683d..1083b91d56 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -24,6 +24,7 @@ SRC_URI = "\
     file://CVE-2024-7545.patch \
     file://CVE-2024-7546.patch \
     file://CVE-2024-7547.patch \
+    file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.43.0


