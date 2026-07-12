Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04A1C44507
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:48 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9339.1783835501962694923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=U3Sl1n61;
 spf=pass (domain: underview.tech, ip: 74.125.224.54, mailfrom: vince@underview.tech)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664cdeab266so3503710d50.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835501; x=1784440301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52V2lB6SOTx+tXjml57+r7QEFF2uVbn0jE1cTUQdaAE=;
        b=U3Sl1n61pOdv3N5cX0y69xUwZqhY2tWzObKYJEG6hcuZE0Gxqr1Bt1lkw6AMWb875r
         Kghfs8iwSIJprKD/iBz41donRTWAGTximEF2okXfZxh5mJtpVCoT5bmhKij7qI37nxZt
         gHueGamJ+yN8RE54+znFOb8TqgDPvf3UNBrOMSmtsXVOrwmb/QDMoc7AhdKIekHvvIGK
         UrMA6SKEcL6JS0PHjEKE6mjZU6mesDn9YhAuBqBtezh3vqdEVL5CjS8P9F1FIuzENY7H
         6qNy7yrlG1U+G/1PeZ187wjmijQInWRr0FLuGj17f9aJWQDAFjyuUgMp0N+Tj1U38vuI
         T+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835501; x=1784440301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52V2lB6SOTx+tXjml57+r7QEFF2uVbn0jE1cTUQdaAE=;
        b=LJvgxQ6Z2fyHTxgareNPFY700MQJb47vlV/QQ9y5IYjbBO9z0vU22rQYKc7IHMyWPC
         9uF8b8ZmXOYuFGxyGTtC79xzTFC+vMQF0Pz9L7mWkXtNZ0KZPiBhiMwxSFV8qb9/MddU
         kNmmKivJiNdtdSV8roVY7e5v+DTMUA32ydzov9kfLaKFrlTk/cxpopEc3mltJdKS55RH
         sozG31ZHlxy8CL7mg1okRrk74IWe7xBLkhn3rmMhqrxJBrPOgQr41W3rUwSVdub/LwLM
         Q9sXtO70QsGWjhi91dC4QsKO9XoHU1HmXNwBlopG3nH/pOP4RK/Xal6w53BHmSzSYF/U
         /3AA==
X-Gm-Message-State: AOJu0YwI3OLZ4XTFJQlEIIzoou7nfrT2lV1VJtNJAR21avYXM3qOl7VW
	zKRz0XXcek00PrbD3S/rWo2XOaLYQmT15InBBY6GYWhTA9fwXtWTCFFa+LeYUUszacyvRfCivM6
	blS8S
X-Gm-Gg: AfdE7cmpH8s98EmHz2o4/GhBzdIFxLNFKwRlMnljBI79CNUFcTwpWX4K4KkdmnJS4oJ
	DKIVTZFnHXJq6TP73HIp+IKlg2MapXW4aqXsc04FbmOpaifCy4kwinABGKt4ItO1bW5hllB2Dg1
	PZW8gjpbOI/ATcFxs6t/a2egw1NgbsAQIpR4bdnpHuUto+YhucWelzHoeYblX5JktLIn4cY76AW
	l58YINtSsj5H0z7xK9QoywDQeJxV4nOQHrqG99txdeETpkX9xZfrWqRhnL733FY14Lmw4Y+NFD7
	3wr/nE4bDT7soroDh9etCoAcV12JbabK8BDMNIdp176E0GgJ9PEAMaAQyvR6/QgaFTNvcbseIkO
	yj9NaZjnkn7qQxf+IweHcyDkbpNQqFx1VWIje6at38rHxRwD1pbVen+y+V1OyuvVZnsfYtAnVaI
	6Kr8W+FV7upeHPEg==
X-Received: by 2002:a53:b202:0:b0:667:8b90:3574 with SMTP id 956f58d0204a3-667d7f18520mr2693541d50.102.1783835500985;
        Sat, 11 Jul 2026 22:51:40 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:40 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 13/26] mdadm: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:41 -0400
Message-ID: <20260712054954.4063745-13-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240738

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/mdadm/mdadm_4.6.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.6.bb b/meta/recipes-extended/mdadm/mdadm_4.6.bb
index b1d0a27c7f..41726bc37b 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.6.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.6.bb
@@ -85,12 +85,12 @@ RDEPENDS:${PN}-ptest += " \
 "
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
-    kernel-module-loop \
-    kernel-module-linear \
-    kernel-module-raid0 \
-    kernel-module-raid1 \
-    kernel-module-raid10 \
-    kernel-module-raid456 \
+    ${KERNEL_PACKAGE_NAME}-module-loop \
+    ${KERNEL_PACKAGE_NAME}-module-linear \
+    ${KERNEL_PACKAGE_NAME}-module-raid0 \
+    ${KERNEL_PACKAGE_NAME}-module-raid1 \
+    ${KERNEL_PACKAGE_NAME}-module-raid10 \
+    ${KERNEL_PACKAGE_NAME}-module-raid456 \
 "
 
 FILES:${PN} += "${systemd_unitdir}/*"
-- 
2.43.0


