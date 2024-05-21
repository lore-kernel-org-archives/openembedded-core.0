Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A558EC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 13:52:55 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.20186.1716299569432858747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 06:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=BKLhNPbq;
 spf=pass (domain: foundries.io, ip: 209.85.208.177, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e564cad1f6so77381471fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1716299567; x=1716904367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X/+BZ7b0l+c7s42g01T7sLH29K8qorbF6xyzIvTtpFo=;
        b=BKLhNPbqyMl606HAwYdnBzFrFeRlkOevQ9JCZ3mhp5jnTIydVH9jPhXFrgrICG5iMb
         nxFMUVUwipjcaxPEHyRotmiLr1Ui3yGTiFf5OyBvnnXqXQY+pf05JBYUSY4B3Gi4uMOc
         o+MUv394PDiPeQGowJLfewbhe+G+mKEgbSFmdvWi8YgcQBolT0FLp+gz6EWjeRXu9Mw0
         W7VQUTnXCuCvPWppFpZ2Yp1rv6uV45AlDZFfWZnKqJjdP5Jsa0Z2z/o8rpq4+umUSNyC
         cVDYCzEof6Ku+aetPfW3wBnP8xMEHeQ/saC6aIEaSsyXQAX76DuZFgEjAwTOe7TodZS/
         Retw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716299567; x=1716904367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/+BZ7b0l+c7s42g01T7sLH29K8qorbF6xyzIvTtpFo=;
        b=PibYdRBVEgGtwCRYoS8GQ/fhiMsIUiEQmdG1huW9q4njU+vi/1WKrmc4IbUNaGvATF
         lV3sqJUWzFHPF7z4+SdvBvg9f9Y1pxmlV/JKTB2naqiFUpQR3KFTdkG+rxNgd26noqYq
         mA22QTNahhQhQ+fr6cZ7iQI9oC/NlzBtqvY9iMloUsxWATHA6XHXqxMADz9+mh3DxNy8
         qqgj7WXf7dfUXLMY6sh9YNrLP4R0VVvEspq1poroOCC0S77qBekVsxENT/F9PTmzzgw4
         q3ZNN2y+ihYj/JzzPLAVhZsmKHqVxcLtxLucB8qh2tnIyxLnrR08glIz4SDB/i4oFNbB
         Sl+w==
X-Gm-Message-State: AOJu0YzCK564A2gqLaw5npG/SMHGkRgQtO/Vn1UnRT8RSfPt5HuKIzL0
	/W8OMZ6wNWunfreOm0Fa77JQYHBhgqanZOqFOlaqyuUJN8QDiKpw0CVbe/fUNM7FgXRXh+9oPbE
	OgPE=
X-Google-Smtp-Source: AGHT+IEO4gz2+C2wvuzkirQNt5ygdBMiMVhHftz1WzzMlR2POi6yL8LT5Pmkoz8VFwLLEJ7IPAFVZQ==
X-Received: by 2002:a05:651c:c9:b0:2e4:7996:f9f0 with SMTP id 38308e7fff4ca-2e51ff4e458mr224615921fa.17.1716299567057;
        Tue, 21 May 2024 06:52:47 -0700 (PDT)
Received: from localhost ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-575058cd7casm7269317a12.65.2024.05.21.06.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 06:52:46 -0700 (PDT)
From: Igor Opaniuk <igor.opaniuk@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	jorge@foundries.io,
	jose.quaresma@foundries.io
Subject: [RESEND][PATCH v2 1/1] initramfs-framework: support force reboot if fatal error occurs
Date: Tue, 21 May 2024 15:52:45 +0200
Message-Id: <20240521135245.480762-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 13:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199641

Add support for force reboot in the case of fatal error. In some cases
it's better to force reboot (especially when hw watchdog is not
engaged) instead of waiting for 3600 seconds, for example in order to
trigger some recovery procedure during next boot procedure
(after unsuccessful OTA update etc).

ALso fix indendation issues in the fatal() function implementation.

Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
---

Changes in v2:
- Drop RFC tag as requested by Alexander Kanavin

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


