Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181CBC982EA
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:06 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1577.1789682885150250086
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2pEpQztX;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso498985e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682883; x=1790287683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v/I7oQDm02BS8pLXC2HfBgObX93p9V5NFryJGngLDso=;
        b=2pEpQztX9fpHyZ2SzQmfltdCWZRAgMjgCRsHSyX9Xw+U/8uv3VNrJEo60tVo1lozaY
         Xk7jOI29pcwlkKN1qoUkrvD3KYkj7bOkI73WFmkvCuuo1OndcsHZxB77HzHJdtlam1tU
         NaNACnFLd18dDxXjOp2Cbsw6OD1U9JBHHN+no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682883; x=1790287683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v/I7oQDm02BS8pLXC2HfBgObX93p9V5NFryJGngLDso=;
        b=a1pMyVlV69CdeiZ1KFu57fStguWqGPMH4Mx2T0De/otmQgGm/gqDsRv5HCylwPsUDx
         8X86Vt2un2X0PaiDjdZnHD4FvnSJ1N0a5qqRUYdx3iobWTz2uVBqyE6EjpuO4ufzKOGY
         ZpXBjsbT63JZ5Z6XmWh8eNHGMzARnQDPc7o3eRor+7pYVEfJ6aPW/3i4FNh28XXCBK0C
         8V+njyTcHmjygBKMD3cNH8ZA/veurc5alkB4GmhW0dC+Cj0BehVd3arJd7C7/Bs1p6Cx
         1Hja6/ebh+Es0KSbO/mYA21xN3ZxnTbS0l3+ozfPGiqBiKv+SbmJZ7ZHfkwTX/P3vn9v
         EMPg==
X-Gm-Message-State: AFuF++l2kXcph3xZg8wUvpnPcGK/3TPJrvZQbbbyyuOXelCcXHF7cklj
	omqrDSdaybg28zDcEEPhUg+oyiC9aTSXgzEtWbCUWDx3I8h/yGm7Y8NZ5Eop65OFlrMm+9Z7z1L
	QR5IFSXU=
X-Gm-Gg: AYBFou2FJOhMkGPYZmXe7m7ey1oreXwQQPFiYpYDGqQNipKI+1VzYVkiTNtJ20fpVrS
	95QsabbW4HlZY8EPWkWQs73nX5TMv/nPH6hB+RuAaVHT7DX2ws6wudjPCyPzBwEn3tJoUsc/MO/
	2I9aEBShPHTqm4A2+C6DpQACOYfhCR/MZ0Hikmx+YOBAHHRFGXibBFqW1tUv3L3H9BS+R5xhPNi
	ue5l3w94FHp55JDLRz6oV+wGz3qKEqvZ5DEzjHsbN3vXd7ntLWYwo64KP0eTNuVLZe52MIZQAHi
	ElymvdzJymJ0Tqexs9Smz+sqW8TnZJEBINxT/uV62jD33ZigN6t2oM2GR7xPxm3vsIc3kSw5lpH
	/ZN0fxCOhQlU0ftbcD7cGMURtRw7hdYoMEJkjq9ZCxDvlq7hkh5ml/FytcR3FOmLz3IrKrlUecL
	slyyupR6cLqUZm6k1AAJTKGxSUMt0+rIrtmoSv5kY6Acr9LAf+DeKIGF/kQF/dUK4J1AHeN+zMe
	su+uzwJ2plcLBp33DuaTloalMZ/i3to+txISejSkIy8JRTIiJi4wdC+seP9YD3yj1d0AZtDaFc=
X-Received: by 2002:a05:600c:8b61:b0:49d:e0c:e55e with SMTP id 5b1f17b1804b1-49fc574a635mr3448235e9.23.1789682883447;
        Thu, 17 Sep 2026 15:08:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 27/79] lib/oe/recipeutils: make stable_upgrade argument optional in get_recipe_upstream_version()
Date: Fri, 18 Sep 2026 00:06:12 +0200
Message-ID: <b1e7cbdce25f8a0f333f61e612bbefbd95bfbbe0.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246122

From: Ross Burton <ross.burton@arm.com>

The change[1] that added the stable_upgrade argument made it optional
for the high-level get_recipe_upgrade_status() function, but not
get_recipe_upstream_version().

This function is exposed API so be kind to users and also make it an
optional argument there.

[1] oe-core 1ed8fdda035 ("recipeutils: add optional stable_upgrade parameter to get_recipe_upgrade_status")

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6f8ae1ecf38d85fe4464bef2954a86b6dc4f059c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 7c1df518a8d..64bf2f950f8 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -1009,7 +1009,7 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
 
     return (pv, pfx, sfx)
 
-def get_recipe_upstream_version(rd, stable_upgrade):
+def get_recipe_upstream_version(rd, stable_upgrade=False):
     """
         Get upstream version of recipe using bb.fetch2 methods with support for
         http, https, ftp and git.

