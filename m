Return-Path: <david.bagonyi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D1BC43217
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 13:47:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.15936.1668692865284080191
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 05:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xj7WUpcb;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: david.bagonyi@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id j5-20020a05600c410500b003cfa9c0ea76so1830211wmi.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 05:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T47dodwjaC+2u488MFCAbJF13ld+EmWVsw10LEylV9M=;
        b=Xj7WUpcbgu0v9ZZ4yXx+CTgsH0jaXfO8xNWeCxzC8+MShk98cZe7Xgl4CRYufLV34y
         r38zfe+FVzUR+zbkjbOOv1sHsayPuA/4hQ9rxGFyGmmC8pLZlJTYtFouHqoLJQH+XyW4
         l8hnzsLQ6dkoZDEbvO0Asd9lUivhr3OPg5rEUPuPcprnlJ2GDazZFQ2IdWI9n9Den3aO
         NcaMxoN7dMqqZUIqHxzBkOh9C7lpE1suN9EZh+j5T/1C9/Fm17J9SElCVa+e/6APc3qL
         97sncbbVZqMpLhJOOp0qWbx2yIDcfqlCiXgsaD7hfRQySE+7S82Mc2BSbrv+C+XYkuy4
         JhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T47dodwjaC+2u488MFCAbJF13ld+EmWVsw10LEylV9M=;
        b=PUJhaEzOnIiT08ZQSYyttaSvcOU+Vpn3or4PKHoIBIEi1in+WbRYPNO0JtZGMUcEiW
         ghgxNne/wMQwVLaaFRGK9nOdwScEKx9JkkboKjNM6SIAS8PiDPUOyQwkcsfeqv68jtGm
         HDRwRw2IS32/6/g0nV8ygIXeyqCRCU/XViuZ/P+ZxsXutJM7K/CaSvfpxvGIyBS2wkqB
         tAIc0lxHfnoimDoR2MqDek2Vq3wIEBtkBzeEjothiotNfFn9+YAtAd5iIwmzWdWo6ZyL
         fG8jVQYNWVi9fppEPGYPaGdZCIfmPZdOR/Vg3CpsZda/pq/vF5sQGkHZg8pBAD3qK7XU
         UdUg==
X-Gm-Message-State: ANoB5pml2mSyrSImqMahFHx00IaLGRmZ7ihY0RPWnPJluHvUEJPzroqf
	t6oOemK+ZDCoJYx72bVko7ddiBl1tBA=
X-Google-Smtp-Source: AA0mqf75OOMqR0EnpQi1VhYzfWtAw2/5bgsBJ9GI7yxL9lqtkoRekQ6VJNayQ1W42NGH6d1dWzOTqQ==
X-Received: by 2002:a05:600c:1d93:b0:3cf:d0ba:e5ff with SMTP id p19-20020a05600c1d9300b003cfd0bae5ffmr1774923wms.36.1668692863206;
        Thu, 17 Nov 2022 05:47:43 -0800 (PST)
Received: from ip-172-31-10-113.eu-west-1.compute.internal (ec2-52-211-148-236.eu-west-1.compute.amazonaws.com. [52.211.148.236])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d6a52000000b00236740c6e6fsm951148wrw.100.2022.11.17.05.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 05:47:42 -0800 (PST)
From: David Bagonyi <david.bagonyi@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: David Bagonyi <david.bagonyi@gmail.com>
Subject: [PATCH] u-boot: Fix u-boot signing when building with multiple u-boot configs
Date: Thu, 17 Nov 2022 13:46:59 +0000
Message-Id: <20221117134659.31743-1-david.bagonyi@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 13:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173423

The prepended code with the i and j variables clash with similar code in uboot.inc, so they need to be unset once we are done using them.

This commit fixes the issue that was introduced in d6858c9 "u-boot: Rework signing to remove interdependencies".

Signed-off-by: David Bagonyi <david.bagonyi@gmail.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 3dc029c429..3065c54577 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -149,7 +149,7 @@ deploy_dtb() {
 	fi
 
 	if [ -f "${UBOOT_NODTB_BINARY}" ]; then
-		install -Dm644 ${UBOOT_DTB_BINARY} ${DEPLOYDIR}/${uboot_nodtb_binary}
+		install -Dm644 ${UBOOT_NODTB_BINARY} ${DEPLOYDIR}/${uboot_nodtb_binary}
 		if [ -n "${type}" ]; then
 			ln -sf ${uboot_nodtb_binary} ${DEPLOYDIR}/${UBOOT_NODTB_IMAGE}
 		fi
@@ -407,7 +407,9 @@ do_deploy:prepend() {
 					deploy_helper ${type}
 				fi
 			done
+			unset j
 		done
+		unset i
 	else
 		cd ${B}
 		deploy_helper ""
-- 
2.17.1


