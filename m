Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F053C636D7
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 15:06:48 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.17637.1675955206359966403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 07:06:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b+yJbBYK;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id bj22so1853261oib.11
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 07:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T6400u4gzbb/PhqniVQFfZ4qUbC39PydO63bLx7n5k=;
        b=b+yJbBYKrZX8Y9BElgc0BAKsmBYpKC83c2PSHz/fPXoX13EiL12eh/iQ9Sn5MnsaGw
         KN8tLGCMPupIl7sl9iudKCkjc0+yALqAeyJJhn6npe11y7qYbLqnP6HpIixeKMjnBDFP
         3DBmixNE3V7Wm852D6xrCcF1XWA7AHosUve2zkBLclaGdZfAeFYHrt5XHD9bI9yuq2Y6
         zWJpK5nqfXasY/zzfQcKFiqi8C2kRuEYPfkRxe6eTkmljJq1irVt4Smc7lU87qYc8OTk
         Jf6HmYYslvIOSGjqzCSU8ni7SxfGQcIkKcar462w7WLQ/J15bm7fGdeu3lBGlFyJC94D
         cQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T6400u4gzbb/PhqniVQFfZ4qUbC39PydO63bLx7n5k=;
        b=tYDA+QwZHswZVgz/tOoEwY1wuJJD6WD3JujWaVesQoD/aOw66C2Dp0MLMWOlhvLN/m
         VeeQ18lgPdXZKtHKF1bgv7c4R8EZ2l/E+1jpYQ/kERPFDZjxGvbjD707F0wIr58cuFd5
         8lIJujAEKIE7OxZFzPQGT/o/a69LY1KTMmxjbWYllzQlG0ck15Czm99LVuHJFj89DBRm
         TXtG5LiRmb+JarGOLq/zcO1MSKbRMlGj9Njn3lOXFtswNmXYjKVEYFQgyILd7/JIf6FC
         OisY8L6v1MmdxwWpBhaSvE+E4clgpCzynRyPZ3wx6rNu1+bYoDYlNZIUIKhmeaENwOpG
         Lhmw==
X-Gm-Message-State: AO0yUKUxYP827fjdSZBFx96kfGdTeldw9ThzW4zf1oJ2jc9XA4OH2I1J
	XN78guvVBTIqFiUhBrUirjrIjRAgVGw=
X-Google-Smtp-Source: AK7set+2yLQURDRZtuTEV94dnTz3freTRRS5Uyy61OI3jODwy5BrydQmGlDUkbihALX4iFadsJJCVQ==
X-Received: by 2002:a05:6808:8ef:b0:378:6346:ac71 with SMTP id d15-20020a05680808ef00b003786346ac71mr4885181oic.33.1675955205147;
        Thu, 09 Feb 2023 07:06:45 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id o203-20020acaf0d4000000b0035b4b6d1bbfsm914168oih.28.2023.02.09.07.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 07:06:44 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 1/2] classes/populate_sdk_base: Append cleandirs
Date: Thu,  9 Feb 2023 09:06:38 -0600
Message-Id: <20230209150639.114504-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230209150639.114504-1-JPEWhacker@gmail.com>
References: <20230209150639.114504-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 15:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176959

Append to cleandirs in do_populate_sdk so that other classes
(specifically, create-spdx-2.2) can add additional directories

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 7cc9535356f..1c619ef3cf1 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -208,7 +208,7 @@ fakeroot python do_populate_sdk() {
 }
 SSTATETASKS += "do_populate_sdk"
 SSTATE_SKIP_CREATION:task-populate-sdk = '1'
-do_populate_sdk[cleandirs] = "${SDKDEPLOYDIR}"
+do_populate_sdk[cleandirs] += "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-inputdirs] = "${SDKDEPLOYDIR}"
 do_populate_sdk[sstate-outputdirs] = "${SDK_DEPLOY}"
 do_populate_sdk[stamp-extra-info] = "${MACHINE_ARCH}${SDKMACHINE}"
-- 
2.33.0


