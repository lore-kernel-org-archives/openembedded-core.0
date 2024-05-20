Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E104C04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 15:31:17 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.64060.1716219070040292502
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 08:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=AQilMlwe;
 spf=pass (domain: foundries.io, ip: 209.85.208.48, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-572669fd9f9so7709787a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1716219067; x=1716823867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4kzeDzBwJtog4J3Un9STCfzaRYAzPQ3yXA0rBQvs3kE=;
        b=AQilMlweX7scYgSVemrKwMD7rcZEDu9tEkLhU32FbD8ReejhhW4nuqXh+piTVfRbVf
         Fo0Nj3WZ8B9rnp1P7nBvG+qdpS0L/sfLitGXR8Nj0sN+tyAlhGkfj8XYLKKcLX+BlTer
         2R1k3coy04BEdY0KPDoWqby66f9zRYxALmcFUloFkFSGRs7DuwVh8yVf3RTweLLdWAZ+
         RDnIql+paX/Kwknk6lOfxYLee2baFN/lwQYcS7ZkyK8Al+qJca+oyGRvPzBWNEnCSvyR
         4MqafhycqrZwLPmhzX+JD4PLZrtsF6ve037BfSvenYRuySVdhnezMzfObCLGbzXQ6d79
         hJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716219067; x=1716823867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kzeDzBwJtog4J3Un9STCfzaRYAzPQ3yXA0rBQvs3kE=;
        b=OcKy2A2dh0E1CprtaFmhhQj8HYTu75TfXDpMBk4aJu7pTC9dJnORwYilHTe9e6cGNZ
         MnGGx1pPc2miQSQ/JkQCWMU65/wRc4fcV2XJJxxoYCxX3Bthf0LTdRCYTlNAWUpxuDvh
         XQfH4fzsbT9wGneOFxgSFHpW4Ems1eddRR7rYkXWysfR4bxwYDoDuikz+eFnnr8C6cSH
         86leH9FR/6xOzTK2YPw3F9PYAVpSeZr0c+55RIjFtMkhDooHfe/s73IFWdxWrYMr/Nrn
         TqVqDhEMEVC+PbBKgW8H8eAC80F+tzh9zmi0diMhku/40JY2tMgdmnJEU7nOnyRfP00g
         PAVQ==
X-Gm-Message-State: AOJu0YzpGrQSBKn6FslsaEhl1IK+TMHFEVI5KlVyJm5SSE4SD01nQ+JC
	kBfZuIs2N8eShw7x306jbDy+ytrTUQ6Qimp5TBTNWjRPWYgz69rhW2G/ZTZsDP2UtuWwHMRlsPq
	euGw=
X-Google-Smtp-Source: AGHT+IGf8GucjVKeBLQXHYPLBnfrv3kJcIJwzYU08QHgl38cWch8f4KIVHSxmQj1zRMlWSEgL5E5Cg==
X-Received: by 2002:a50:9f44:0:b0:572:72ff:da35 with SMTP id 4fb4d7f45d1cf-5734d5cc9b8mr18793870a12.12.1716219067373;
        Mon, 20 May 2024 08:31:07 -0700 (PDT)
Received: from localhost ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-574b519a11asm12186237a12.97.2024.05.20.08.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 08:31:06 -0700 (PDT)
From: Igor Opaniuk <igor.opaniuk@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: jorge@foundries.io,
	jose.quaresma@foundries.io
Subject: [RFC PATCH 1/1] initramfs-framework: support force reboot if fatal error occurs
Date: Mon, 20 May 2024 17:31:06 +0200
Message-Id: <20240520153106.150218-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 15:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199595

Add support for force reboot in the case of fatal error. In some cases
it's better to force reboot (especially when hw watchdog is not
engaged) instead of waiting for 3600 seconds, for example in order to
trigger some recovery procedure during next boot procedure
(after unsuccessful OTA update etc).

ALso fix indendation issues in the fatal() function implementation.

Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---
 .../initrdscripts/initramfs-framework/init    | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index 567694aff7..e3d8caa0e1 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -54,17 +54,20 @@ debug() {
 }
 
 # Prints a message and start a endless loop
+# Force reboot if init_fatal_reboot bootparam is set
 fatal() {
-    echo $1 >/dev/console
-    echo >/dev/console
-
-    if [ -n "$bootparam_init_fatal_sh" ]; then
-        sh
-    else
-	while [ "true" ]; do
-		sleep 3600
-	done
-    fi
+	echo $1 >/dev/console
+	echo >/dev/console
+
+	if [ -n "$bootparam_init_fatal_reboot" ]; then
+		reboot -f
+	elif [ -n "$bootparam_init_fatal_sh" ]; then
+		sh
+	else
+		while [ "true" ]; do
+			sleep 3600
+		done
+	fi
 }
 
 # Variables shared amoung modules
-- 
2.34.1


