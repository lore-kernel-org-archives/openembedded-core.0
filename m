Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BD2C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 13:56:26 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web11.21689.1748526977430488910
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 06:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JtPdLPcd;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: hiagofranco@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52f404ddf3eso597335e0c.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 06:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748526976; x=1749131776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XfJ0naKbEnO8GYnzTkoPzMXaSvdLZfyDor40ZIboJOo=;
        b=JtPdLPcdh5y8pwEr3bzUDIjiCBkoarv4uWXAmgQeuSQJiyG61jtGI/5yZd0m0GEjJE
         6aP2I+IbtD9aL1V9zNB6WSbzaY8FUsaAWiMwpkCGsX7c/Ky7oEiJeUJUkiTnUSeBVXj+
         w1lROeIwnIRwyl8WvEAI4b0ZLsFng8lgddLQ+K/KxLZkQpfRDBcVWhFUgR82MB/6W0mO
         G8b7xQVy78zS5UYPhYudi2tirZyE71TWCLxmiMYpL0vs6PSfVNt1g3ST+Tvu6J6AHSHQ
         V4m8HL5pgPGdyfYdSax8FXj8QiLpDdmp9hYvUhqb7pxEU64Zo6tqee/p7PHjmPJG0TH5
         LMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526976; x=1749131776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfJ0naKbEnO8GYnzTkoPzMXaSvdLZfyDor40ZIboJOo=;
        b=Im6rYLEEMK+T3bSWdVJe5FFHSJwkGjZdPePyKhxn6ORAEHSYmlfrm3OlrqNFzA/IzH
         YE6v3MUqO29RZnuulMwHx/He+NtvpA3WOMOtfn3ZoqHe/ftZ7qydJYo/4KSjTat8XE5D
         Pqdh6wFllJ4A4ZanY6OrEpPy+CIJHrTTSf7O1YuzXJcLYKFNjpebYNU8jh68FzAprqj3
         sQbCfyTFj8eGc6s4d8FlDCdZlqEd5sO6fvpAaNGAjjzR8G4JQ7Ptl5bziIwPOTydamD/
         kSL+KRlkc1cDoTR6iY/WtYV+ooLP9fnzgvWg3AI2uTmNc5cy42pNZWxWxG3ZrYyMhN8V
         Wxzw==
X-Gm-Message-State: AOJu0Yy+r03Zk+lBE6r3BZVwla0y7mjGrUZoiCl5tXJvHZ9kyWWvEQUj
	903tvZaACTooswKLjJZWJhWjvcjnDFeP5oCaUGfM19gK/2+Fk6eCC4Ew0lNfIVQ+
X-Gm-Gg: ASbGncvNMBq0uwXeRQBfB1y4Ec+tXM1NNJJv5Z8gL4VEwYyZx/vszpg2NSqTmZO3Fyj
	JDiPCnNPjOORt3i6SVSVKQAB8UpblOncjLBOUAXRfvl8+fh+6J6iv0KkU1IzxEglnZDJnbfYBJB
	gVmCwcsC7Krve6Vh71sPofs5XJX5O1HYG/mP24X+qZ+PC+OC+jS+EIppqjqYo7MxUJwxN6poR0p
	Dw9O9WcMDEybjoJ+7UY8owybIJJMrULZoI45R5yYcjNRuzMwTZHXZpF4dTUGfB5hbKx5LPuNiHY
	IgOCZ/Ph0+4XEHRp/EzPJVaaHaHQWqAQ+jtd3qz3ElQWtxAp56dpo7sECbYuMkqt7XJk++WkHQ=
	=
X-Google-Smtp-Source: AGHT+IFnKZvxrY8Ftw0lqNNktsxRuEkAek5sw0LY1iRq54sDhcu51gpp+lSWH/pQPEjExDSIM00eSA==
X-Received: by 2002:a05:6122:8cf:b0:52a:79fd:34bd with SMTP id 71dfb90a1353d-52f2c4d8f4emr18018231e0c.4.1748526975515;
        Thu, 29 May 2025 06:56:15 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074bf8c1esm1200018e0c.30.2025.05.29.06.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:56:15 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] connman: Set connman resolv.conf as fallback when using systemd-resolved
Date: Thu, 29 May 2025 10:55:36 -0300
Message-Id: <20250529135536.254640-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 13:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217414

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Commit bec0cfc9b215 ("connman: Set dns-backend automatically") introduced
support for using systemd-resolved as the DNS backend. However,
connman's resolv.conf was assigned a higher update-alternatives
priority. This caused connman's configuration to override
systemd-resolved, resulting in a broken DNS setup.
/etc/resolv.conf -> /etc/resolv-conf.connman

This commit corrects the issue by lowering the priority for connman's
resolv.conf when systemd-resolved is enabled, ensuring it acts as
a fallback. The higher priority is now only applied when
systemd-resolved is not used.

Fixes: bec0cfc9b215 ("connman: Set dns-backend automatically")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 meta/recipes-connectivity/connman/connman_1.44.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index 02c5be929e0a..1b0fbe438c7a 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -92,7 +92,7 @@ SYSTEMD_SERVICE:${PN} = "connman.service"
 SYSTEMD_SERVICE:${PN}-vpn = "connman-vpn.service"
 SYSTEMD_SERVICE:${PN}-wait-online = "connman-wait-online.service"
 
-ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_PRIORITY = "${@bb.utils.contains('DISTRO_FEATURES','systemd-resolved','10','100',d)}"
 ALTERNATIVE:${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-conf','',d)}"
 ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.connman','',d)}"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
-- 
2.39.5


