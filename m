Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E40FC02185
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 12:50:45 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.43089.1736858067366709510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 04:34:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EsY80Gsb;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: arturkow2000@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3003d7ca01cso49862991fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736858064; x=1737462864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVxtP3mEg1zvLOnnyXlnjDGOSyoXCT1n08lG2cN8FfQ=;
        b=EsY80Gsb3K/vWI67ZNBNBkCzAZkNa5WYnM5kWOkoewZITl+Zm4b+KgxBSlnV0lOfyk
         k/gWhfdwtj5FZRDvf99lackExNXiaMhNE0AVi/ikn3zZyXroGiMlcb8lijuZnyRHN/YP
         CaHAj7/CWC8UbzsqAsshTHsh8NmXrQqZzfi5nRQyuOlq/60z9Y6F9L8SezgdDLdRi78c
         uLNYEUGAj+xQqjjSPsaWvug+D8qo/iNHjCvf+bIhX7mUkDUfvZ3UvIakBiHsySCurbDh
         qfxXG9iW9NnjO4BGpu9wApN/u8V4+KXvutq2UgYk819uCMjaCs85Wa+XSZCmm30EKrWg
         jaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858064; x=1737462864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVxtP3mEg1zvLOnnyXlnjDGOSyoXCT1n08lG2cN8FfQ=;
        b=KMgbUfxXaaW7uBYwDx2DTi3zmOeADUpZyYn8fp25YAz4sPr3nv0uS5BZpfJ4R4IJNK
         vCGn3d1AzGEd+b4AUZK1a7ut5w55pGfw7tU7YSSpSI1KLAqdV1rBznJMPPgge93LsJXW
         QR+52wQE64Wu18z4TB3Kf7fBKFJEcfOJTpCyECyYp4g1y55fLfN4YOo5eU1d4XsILHYr
         z+rhHBWm+M6GD1vD67m4iLZVZtQ+0+/qAJnERxiSGNjw2GUkA0GyNVpeaXLLEEZ++7ki
         n/NZDF8N3H7oj7fACHDfkfZyFiNyGS3DLuYGDt9WE22206wI+LOJTvGCvWuv3RSGteK/
         MrOg==
X-Gm-Message-State: AOJu0YxTnSvSWn2A7Dtgec3S6cHjljJsxkvaV8HZ5t8WJ3c1gmGLI3eo
	iV8uyfz/mOL5manFv0QJjwM3/0UuPa5YNrL6VLP/Y6fRuZuOrorcEJEFnA==
X-Gm-Gg: ASbGncvSg7ROj8Ypio5q9WxNDJ+/zBSDkPYwCBenFmOGISi8//BXJC2TTCYKk5GiFow
	psLYCv9xf846QbIUrDjZeQRP36/B4fbVZ2smsGeVilO8Kxf9qwjgdNn6sE3BjRXgf3S9LA1EKk8
	p3Xqbs9nbyH9XJzN+Fsj0p/O29Eq0zRYDMx0Ye73usHGEmnDkzuQzYh33iMlz7BzHtJ93C75d5M
	ZtYUHHE6Hnkq/fK5baDedfYqIu62kKOOSesHyHPkrUZVDCOqnNlRt4jpT51CjFT
X-Google-Smtp-Source: AGHT+IHUTE4uJbwJ1AgxHkjR7VLmgpWkAKboV3bjjxO8tMhj3DH62zrQWFuNnNS1BTeydaKUymmChw==
X-Received: by 2002:a05:651c:a0b:b0:302:40ec:a1b3 with SMTP id 38308e7fff4ca-305f45a0a29mr79469851fa.21.1736858064287;
        Tue, 14 Jan 2025 04:34:24 -0800 (PST)
Received: from eta.play.pl ([2a02:a312:c49b:a180:86d6:2e13:1a85:5192])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec4d6sm17230521fa.111.2025.01.14.04.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:34:23 -0800 (PST)
From: "Artur Kowalski" <arturkow2000@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH v2 7/8] systemd.bbclass: support user units in postinst and prerm hooks
Date: Tue, 14 Jan 2025 13:26:15 +0100
Message-ID: <20250114122613.3046925-11-arturkow2000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250114122613.3046925-4-arturkow2000@gmail.com>
References: <20250114122613.3046925-4-arturkow2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 12:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209799

Handle user units in a manner similar to system units where possible.
Not everything is supported by systemd, but systemd limitations only
affect runtime package management - during update user services are not
reloaded/restart and each user must re-login or manually restart
services.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 meta/classes-recipe/systemd.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/systemd.bbclass
index 177ee5d974..4c9f51d33d 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -40,14 +40,24 @@ if systemctl >/dev/null 2>/dev/null; then
 		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}; do
 			systemctl ${OPTS} enable "$service"
 		done
+
+		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}; do
+			systemctl --global ${OPTS} enable "$service"
+		done
 	fi
 
 	if [ -z "$D" ]; then
+		# Reload only system service manager
+		# --global for daemon-reload is not supported: https://github.com/systemd/systemd/issues/19284
 		systemctl daemon-reload
 		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ] && \
 			systemctl preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
 
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}" ] && \
+			systemctl --global preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}
+
 		if [ "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+			# --global flag for restart is not supported by systemd (see above)
 			[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}" ] && \
 				systemctl --no-block restart ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
 		fi
@@ -62,6 +72,10 @@ if systemctl >/dev/null 2>/dev/null; then
 			systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
 			systemctl disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)}
 		fi
+
+		# same as above, --global flag is not supported for stop so do disable only
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}" ] && \
+			systemctl --global disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}
 	fi
 fi
 }
@@ -111,6 +125,9 @@ def systemd_service_exists(service, user, d):
 
     return path != ''
 
+def systemd_filter_services(services, user, d):
+    return ' '.join(service for service in services.split() if systemd_service_exists(service, user, d))
+
 python systemd_populate_packages() {
     import re
     import shlex
-- 
2.47.0


