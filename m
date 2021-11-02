Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C94C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:19 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.6592.1635842598573580043
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kxVEWjlY;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d3so31987894wrh.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AEvr+Igq1yhRiiLkIUTWSXiwD6aXpYJ60q4WiSlvQ9U=;
        b=kxVEWjlY74ptX7jzT8t4QSlbUEm2Sc9TPScx37eF+WbRjd9Xkz3l4/4tG0v2TX3JsA
         oB7r8iHl2tobJoBEse/J+eRBZeUl4F4DZx7pUrBv11MxwxUGw7tkAn8VZqsy0NwPBZPh
         5Dobc24Pm/tzmRQGJqLmDzLBXLSEvfz8WIlgv8mBNxrEYlZQ3c7AG23Sn6Qo+nY0JDwM
         VaoSrF63ryOqL9lDnhMKn4pE69dTRHItJXdGbcfKSFlKwzgSMy0JnEV6JS/cjDs3lvtF
         Hy1TWc5pYS3wHDYS+tXYhNL38wUWykHJRRMczU8uaZ11xgKv7of3rusqkB960nEV8j7o
         MOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AEvr+Igq1yhRiiLkIUTWSXiwD6aXpYJ60q4WiSlvQ9U=;
        b=hxlcaG2xXmAcOtx0SaPkV3sjnpfd4gCxD03jErDn3qUGJN1CEUdnCLlOeH+ktfTXpK
         DLClw4iMP4O5wr35PO1GhUF+q7Qyv0cscS9yerpJombod9/f64QOdkkEh/6xWDRG6HH4
         NF47tRJcHsMolmQfCQ6eProSOTwFjWXRHTFeqEB4Fa3qo09anvNc9cECQaR95WkxAdc+
         S2kvWak0sHo5o8sy1iUwsbjxRzYkR9ScodbhJZCIqpgww8hES/ifQ/AwT9EIxGd8xy2B
         jhp7NJl/OHNiVwGrxFD68j9s4033klohbmy/aFtBTmcx7w9Z0dy88L1BJ/jOIjAnZDSm
         F4mA==
X-Gm-Message-State: AOAM533Bzi12SpuhfB6YWWWgkhZTI9d5NhcuE86Mz2rB18tsThiYqp1W
	WEl7yZcbAIh+MppzlX6RnOMnoNC0lrU=
X-Google-Smtp-Source: 
 ABdhPJyb0fBnKE1zl/X+BgUkeuV+Q55pw1yYU8sHsSkHDO0bjuqTH/iFo37lonQddEmMM+yLzVhYmA==
X-Received: by 2002:adf:df0b:: with SMTP id
 y11mr21010826wrl.181.1635842597193;
        Tue, 02 Nov 2021 01:43:17 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/33] libsoup: upgrade 3.0.1 -> 3.0.2
Date: Tue,  2 Nov 2021 09:42:49 +0100
Message-Id: <20211102084303.2974802-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157757

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsoup/{libsoup_3.0.1.bb => libsoup_3.0.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.0.1.bb => libsoup_3.0.2.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.0.1.bb b/meta/recipes-support/libsoup/libsoup_3.0.2.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.0.1.bb
rename to meta/recipes-support/libsoup/libsoup_3.0.2.bb
index 1e4d3b272b..3d90e79290 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.1.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6f0c316d10f8458b96f564c7644be3c2011bd75ad5054c8db26afb0c9a91bc47"
+SRC_URI[sha256sum] = "98ef53ed9b4815ec05232155371af803a9928f4652acc685ff02086be16a3ff5"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.20.1


