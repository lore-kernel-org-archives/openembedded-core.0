Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDC9C54EBF
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9374.1672830397768050219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J9zQkmB6;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id bk16so19362439wrb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hagg90WzKlz/zUQ8CSWbrqWRbkz9BGYpG6J1m/xrVHk=;
        b=J9zQkmB64/cpJM2pkwMhcuX9K6IvLX5S5lZMr9uFikLjIF0FA1VnolQTIoZZeChbXJ
         BgdPshmoyHJZeHIiY9IGpTi/LfqDsGsagpXA9QhFuPz8C+gz8KEgadqqMjozhmgPYh3Z
         yebriQ5Ag71J12SKeQOda/Hqm2fekqh9hrv5PZtf1Y8p3qRHqlDRlt6ZBClR8yI3FSKW
         /d4FBIrOU6KeTvfy2Chyscdey6aF63gpo3BUWFhQKHC7/hqVc5Cp6UICvMeRfq0XDO+E
         vgD6YXC7osti5tpPRrKJv1qtq9NdzUvlvjD0C49xPIeE6SaB2XdMK8TT7+DB9HIujHNk
         dT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hagg90WzKlz/zUQ8CSWbrqWRbkz9BGYpG6J1m/xrVHk=;
        b=jZQTfz/OBjttzO0iQDQCrp3uaQgHmGUpgecMdM5bFZcv7/kvFieq/iTafQvvNov1PF
         RudGqR1SL82JhgSAzadRX35yPQpYEj/ZEC3dDwoa/6u6oOYYqxUD5qNt9qT7P3k2Bu4N
         YiB5VeNU4354BtTWZTeKQ7DH4PcN5dDRofJ5kHlcPlCj/VO/Zry7E5Nk6rSfHtp1/CYb
         b+okp+lmd+aUtv3kc6agP6e45Z3XxrehLiTFQE69KWDKyU4L7ncIti1NYY1Wo+M7RLqz
         EDoIxwruX1NZ9HsV8MuDl313xYBZH0xqnk+y0VNb6dBdts3VktPXtaDjcBDBFPnQEET9
         Zn3Q==
X-Gm-Message-State: AFqh2koilCZ3vdEacAQVXoKQ4/pjLe4CYv3C12OZb5uTpyf9/r013Xjv
	E9s8M1JOxKC11NeBFcrqA0/63mMLtkI=
X-Google-Smtp-Source: AMrXdXtTyHVOXvWVY5Ojm1iK/AgnpnBxbD2HsF4aCxQSBbJ2zMhMxfOGZyI/jVyQ9DxzJe5gbZA4lQ==
X-Received: by 2002:a5d:4a41:0:b0:24f:5890:616b with SMTP id v1-20020a5d4a41000000b0024f5890616bmr30090612wrs.56.1672830399051;
        Wed, 04 Jan 2023 03:06:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 61/77] python3-dtschema: upgrade 2022.11 -> 2022.12
Date: Wed,  4 Jan 2023 12:05:32 +0100
Message-Id: <20230104110548.2537259-61-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175446

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-dtschema_2022.11.bb => python3-dtschema_2022.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.11.bb => python3-dtschema_2022.12.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.11.bb b/meta/recipes-devtools/python/python3-dtschema_2022.12.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.11.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.12.bb
index fd87db2c2b..9d860111c1 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.11.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.12.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "825e51b8bb82a2d4833d15c25ff2b9a3f5a53b36a490d7c4b6b136037e823320"
+SRC_URI[sha256sum] = "f532d433a915e507d4b426b7ef57a6730d23c0938b682fb4866f9dfa80a58ec6"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.30.2


