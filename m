Return-Path: <igor.opaniuk@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A5CC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 13:50:15 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.20154.1716299410374331431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 06:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=Psi6sVa+;
 spf=pass (domain: foundries.io, ip: 209.85.218.44, mailfrom: igor.opaniuk@foundries.io)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a5cdd6cfae7so890457066b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1716299408; x=1716904208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X/+BZ7b0l+c7s42g01T7sLH29K8qorbF6xyzIvTtpFo=;
        b=Psi6sVa+sa7I03lFm2itlxD+6XCZXyPN4orR7ervWletdHNCDre498n/WwCi/8mMT1
         b3KIa9vQjCZEJQ/CAj0jK6HuE7bji2WCrMZw2IzOzgRwMCn2nebYeR6aRKKzDgWid4ZI
         PmCZJcG7hG4i2bif3JgnnE/Q5S0niSaVcv6PCtJPhyuW4keZ+rzpt8Q3+uPxZpJJypZV
         yW9hYOUrKP7usN9KL/453Vq7k3U5brsj92KHl7rQ59Eb7f6xPF68xjpmD1zOQ6mFMumJ
         sNwz5WCS94ljTjDM6xYn0fPWcWIVBGyRymSXuaUs+1rjcrbfZNQBeZQ5Wb7JYcTKnRWF
         wtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716299408; x=1716904208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/+BZ7b0l+c7s42g01T7sLH29K8qorbF6xyzIvTtpFo=;
        b=ZIHAwWJyay1kKbGnllu2jKIrAQYbq5wYLx/THY+pfX0LjxYxCxpUJaHtKopSraksJf
         UtfV1lv0BAAyvyttWm4yKBtz1yYlYaHuqEcwTH616KNO7g6ME+NSnRANnF1ABE7MyBft
         WL4d64cUwZu84Wpd4NIyMy3ni9mno9n5FzcryEusYt6T7eUYLc6wr9wUwtTY+W9uhnjQ
         YSv8CNrf++mMXUzfie+g1i/L9fSY+KpfUavqz0knWOim1Z/u91e00667QMlCpX4Uwb2j
         ydyCtR11uJ2jJUzhBvcf6MN2pOashZ+5VEG3fc4Xx9tK0k1Fa+uSqgHiuvG4u72WvLRs
         RrKg==
X-Gm-Message-State: AOJu0YwPrL6W3MEX1IEvGpzNreV7g0FH5vDmCAzjgSGxj1V33FGw6Der
	yYNwEOlhytqJsKGQOjcswGbpiEWCKrb6PPFkZEE6Bulc/xTfpFOHKrNcFL3IJpmxkGyAljtEjra
	JwDs=
X-Google-Smtp-Source: AGHT+IG7WC1bOwLjlfu7+iSiUiZoptSMzx6c8ucqJSiqFJ49MCJR4kv7ZIfsGo+3mEPloFpDESiPWw==
X-Received: by 2002:a17:907:770f:b0:a5d:239:1a59 with SMTP id a640c23a62f3a-a5d58d54c19mr840427466b.3.1716299407688;
        Tue, 21 May 2024 06:50:07 -0700 (PDT)
Received: from localhost ([185.186.156.113])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1787c686sm1607396066b.47.2024.05.21.06.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 06:50:07 -0700 (PDT)
From: Igor Opaniuk <igor.opaniuk@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: jorge@foundries.io,
	jose.quaresma@foundries.io
Subject: [PATCH v2 1/1] initramfs-framework: support force reboot if fatal error occurs
Date: Tue, 21 May 2024 15:50:06 +0200
Message-Id: <20240521135006.480641-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 13:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199640

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


