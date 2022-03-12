Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B541DC433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 14:11:04 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.4885.1647094263777964744
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 06:11:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=igLxflhx;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id w27so19775150lfa.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 06:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U2t+QQ0BSph+GR1QafA8mdfbx1/a3LdZYtNPQyg9y7U=;
        b=igLxflhxkC7kj5LUEl70BFGVnwS3K6RwaUSssscT5i5tyVXUZ0fngfux151UnAc1fy
         sgZQTjCBGtEIqL4UJxubJ5QnmZNCy4CcL2U61PnBZP7XzTOKkaSqKEzZR/DKrN39ue/c
         Y2nkKJCR0HGR2R5goxbHH43jSvd4U9rqSpnAuXrIHsmvpR/AIs5ji2RQgd1rlfY90PCD
         XsjF9xeycSwfbJo0nlNJhn02GhUed1JVXQRX4oSLOosdFvcnUZL527jEtFExRxWAzWPV
         fmhBIXN11CLgsJjMu2plAiM1ldZRfKo2WaUefvUiftl93MNVx/p2EbTOc1r4INeAiDHj
         PRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U2t+QQ0BSph+GR1QafA8mdfbx1/a3LdZYtNPQyg9y7U=;
        b=7hy3zmiTYFHGaoHaNyk6uILvzQEHAODKBwNr+3gJtZxDYC3zg9BH3S36cLE1wVuUsy
         Kvi9YScDw93Gu/d68+GfB/0Vvz9c2nWdHkKMve8C7x12jZsJNSncccYnO9oJ3uJRxUe/
         htUCiOUjE0COpobrEEtzqQ7Wra0ivte6CuZKy9pcv24VAGkZU+RKoa7eLEgwdCNgKypX
         CeTVaQ0h1e6tAMNKIBjqjhdrBhNLLLSJlbvw38IxGklQte2U9yMHt/kzzRhEDVvd+cgm
         tQJYoNPHIIVj0ei3fGzX6et/kCWtaY+F/TxtWEvN4Idw7ACVVPS1C/NqGdbmuv4dm+hg
         xT6A==
X-Gm-Message-State: AOAM532aAbwMqSWne4lORJZZGo4pZq622hKSPrA9U4aMritHASa+ZbNL
	6TjG3tqHqslPvOyLW5LWMzOnwRznHzr9ww==
X-Google-Smtp-Source: 
 ABdhPJyQ+s/g3a/mgMQyRnGmJEYBJq5FAa2N6xad34NbMlAr3aXS9D9qGKVhejrV5nK0Q8WloBw2pQ==
X-Received: by 2002:a05:6512:2109:b0:448:5b9d:8160 with SMTP id
 q9-20020a056512210900b004485b9d8160mr8621751lfr.143.1647094261481;
        Sat, 12 Mar 2022 06:11:01 -0800 (PST)
Received: from peterliu-Precision-7530.lan
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 u7-20020a2e1407000000b00247f17646b4sm2493341ljd.59.2022.03.12.06.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 06:11:00 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] weston-init: add use-pixman PACKAGECONFIG
Date: Sat, 12 Mar 2022 15:10:56 +0100
Message-Id: <20220312141056.1035449-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 14:11:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163090

From: Ming Liu <liu.ming50@gmail.com>

Fbdev backend has been deprecated since weston 10.0.0, and it could be
replaced by passing --use-pixman to drm backend, add a use-pixman
PACKAGECONFIG for convenience.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 8e8c0454be..c34582137d 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -17,6 +17,7 @@ S = "${WORKDIR}"
 PACKAGECONFIG ??= ""
 
 PACKAGECONFIG[no-idle-timeout] = ",,"
+PACKAGECONFIG[use-pixman] = ",,"
 
 DEFAULTBACKEND ??= ""
 DEFAULTBACKEND:qemuall ?= "drm"
@@ -51,6 +52,10 @@ do_install() {
 		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
 
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'use-pixman', 'yes', 'no', d)}" = "yes" ]; then
+		sed -i -e "/^\[core\]/a use-pixman=true" ${D}${sysconfdir}/xdg/weston/weston.ini
+	fi
+
 	install -dm 755 -o weston -g weston ${D}/home/weston
 }
 
-- 
2.25.1


