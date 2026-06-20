Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5236CDB475
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5962.1781960425978908946
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cUIyQufp;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so29794175e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960424; x=1782565224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pN71l8NyF2VeP95/Sxj8Vi130FJXr3aZUwkh4GDYf10=;
        b=cUIyQufptO/yAcS+p8spHkVO90+gtsROKyRAu6Ll/65q/HJCZ6W9iHNOoR8m9uksNS
         XYql66/N7PgPT3GZPsReWHh0PYSsaB1c79+xVAj49okj87nW/TtUT9rebVyaqAsvWxYM
         NbHbYqA/gBfKMDOTauyo8h9GSaObBRg/t4j7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960424; x=1782565224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pN71l8NyF2VeP95/Sxj8Vi130FJXr3aZUwkh4GDYf10=;
        b=nVeTkI7c4XvRzUZV2AegbLAoVZctKWH8iVxGXtx3NeKpnVBS2PRTILUpK4tNHE5YHj
         wmVgLlNtvjdqAPaf+BWYmbnF2aoFotvaXvrtf6cICGGuVWmnTTLITiof1UTfmz7STWSk
         vYFm4EW9rJa68MdWyJkiSpFgkpmnO/VSghQf1tiS5snlCqlWdJhREQLT6DaN+2EHF4er
         naQ5elgzfVataOFudGZZF5NZXuCl50CE/Zw3D22bgDsePT4YkwMxNNTiBQN3C7TDbTiN
         3nilE2l1Nl55OehBcxEAnoLQLq0EhMFPfRRhWQbN6TGuQ+682BZy2txyNiamKVqet16H
         15XA==
X-Gm-Message-State: AOJu0Yw31Hey0tKeNGz3YS4awxgMgSPQrbM5NvEZPP85YYYaZqjQMJuH
	KI8mW/lEqJedmRHKbMqgaxMDheEBpPRC4P41/gZLSY5JKdDLtpeiBCOem3epQ5QmhLmEj84WbL/
	cywX9
X-Gm-Gg: AfdE7ck+oi+v1CH1ljsu3dEZRCJ/kjaHrEaqdCMg/8PkWQTsr/JFvY/qFZNOGSufZea
	V20MphmE/0yHyJK8J8u/I/K71yIcUs4r6vmF9+iLfpu041QzYb4wQxYK+01XhvxR/YYIqpUY9Cf
	pkJzFj5iaimh/myRIxr+gXZ3m3YzXIscmyv3vfypVNdDf3HdUCK1wr6A2U0TwzQ4Of6/0a3Kjcr
	g4dbak/rIhdKaWCmZ39wzYUYscJw5W4707+DnN4bfNa2XEjO0c2QB5+6UCkAkDW35LB8EYGbvGR
	fhHW9iFXW4O7Gh0CotJes4cw9KNXzsQw7DYQRwFUurDhE9Va/AopntFKg0nBOaczNkKPVWzYW/z
	jLxGDnAyeNLGoRza6JbUAxHD1J95mvB2vVxGee81cCsjNX3i2LYTf5nP3xbj3eqm1VJDdgdSUHq
	evz3t8GByxPMToGyC9H8GyXzKhkjDo01xjl928EU9ufYgS4sGK+d1bowFPv6TJV7FF9B9ERMjWH
	yTZZl72sy3DYJwV
X-Received: by 2002:a05:600c:434b:b0:492:346a:98df with SMTP id 5b1f17b1804b1-49240a09ba9mr64788105e9.5.1781960423022;
        Sat, 20 Jun 2026 06:00:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:22 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 21/36] net-tools: Handle binmerge
Date: Sat, 20 Jun 2026 14:59:36 +0200
Message-ID: <19dd958320de1027d924deb70c4edef39f1a6b6b.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239232

From: Jörg Sommer <joerg.sommer@navimatix.de>

If $base_sbindir = $base_bindir the sbindir already exists.

Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit a94c7ecf8988a186b5bf7b77c9e685c98e22ed31)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/net-tools/net-tools_2.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/recipes-extended/net-tools/net-tools_2.10.bb
index 6c8297ba399..a21916fb263 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -73,7 +73,7 @@ do_install() {
 		rmdir ${D}/bin
 	fi
 	if [ "${base_sbindir}" != "/sbin" ]; then
-		mkdir ${D}/${base_sbindir}
+		mkdir -p ${D}${base_sbindir}
 		mv ${D}/sbin/* ${D}/${base_sbindir}/
 		rmdir ${D}/sbin
 	fi

