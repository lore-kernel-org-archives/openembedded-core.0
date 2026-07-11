Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853D8C44509
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 05:24:43 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1281.1783747478425962518
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 22:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=gNsa1C1r;
 spf=pass (domain: underview.tech, ip: 74.125.224.42, mailfrom: vince@underview.tech)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-664c535f1a0so2787412d50.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 22:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783747477; x=1784352277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MeNURGUIoqy0zws7p58ZAqHPmxh7+qhDi7LJH/CksWQ=;
        b=gNsa1C1rq4g7dFRCH3v5DKW30IrDly10Z4jIOGvSALF5BH6GBECWkaCRLXyKQRkuxH
         zUkYsdXax74RaVAyuKc1F/9GdY8r5yLDoLlHMmKEcGsiss1Jl7/2qe/yuIOjcSmqSHBu
         44WU/Ep0Yz4hDSb/nJ42IuP+642Sq2ill3uQnRcn3GGbik2dlis8POs7XuTQLaBtIozl
         VXnoTVu9kjTk6Ls4GZ2qUSR+nrAYxM3EeL96rHLBKADPixH75XWosvBdevjw3iqDokNJ
         Zo9RquFNlsKypLwXxTQkpuqeVN8VZCzXiQ+EA8OX4yIQBERkSCmCMbggg55FSNyCpulM
         1hZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783747477; x=1784352277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MeNURGUIoqy0zws7p58ZAqHPmxh7+qhDi7LJH/CksWQ=;
        b=rqRALhy1yRK9V5KtfMOK+zYQvKxZzMehyscjwOm8AL9cNc0XT+bGrvXzq5t9m06NvS
         0z2nkQy7UZa33SlYdDJnGg5mzByzyLcw6nEAS+ugCwKZ5r3QyYy9u8j8TiWJzxAhPjd6
         nAxIRIXzdhESnYJOt70YdPB93WfwGfcFafxdehK9UzsreLol7lG1et+o+v5iMepUA619
         jqB68aqjUZ53XG3Tspzl7V5exFVQfJacNr6h6mvIjkET4PqioacmRikqmOp3qa7vCNbh
         6rr7uylP7srzUOKOL1shIS5XF3BnlzuqIDeUUJMKbL9WVV0NyK5dGk4UfeHhbE0ArYwW
         z09g==
X-Gm-Message-State: AOJu0YyubYySqIzBgwNcEx1SOWip4C9oe5ZxsmagTQRWOESGFn+E03If
	sJBRMU27HQI/8Ns+c0W+K2Ucorv99Fvrnjz9GHgx8zbdYyyyI8RgJkIjmjCaKSxZdw9t3CMTZL2
	/0kUFo9Q=
X-Gm-Gg: AfdE7cm3aOGQe7tB4SS4eLiuUbRaM4JF5YoBHXfkoncbAhJEVQ9bOoPuwmISQIDkATm
	EPwU/X68zKaBjDbVfnymA0s7t8UM+6rlnJWCW1EDGr0AtkhDenOR4xsS5+wjzcEefeEvuvwhmJ+
	7sPTuWmgvLk6ATkk0kLV/3HcguM4q63wxqf+xISYNZnrkCbCgYbbGQQrb5m1kkRqLprbOO3VJ5y
	JGTWF6T9gu4k3CKHh7hma6Hr+nrCCBtfg02YyFFj539jhDYRCEmtXGmSUibvnz2NRt2BjgPJndG
	i2HaVSUhY/dTh70L6c+CnRv95rShth6WzKySmCFXf1KB6Q18HXqbZL9nlMua+n2Ma1ZrTmgBZ5V
	Ds8QhlFlMkNO3f54Cg+4gJIazbOc3aMH9OHNuYv4udPOydNlSTLJ+KSc4CnOIAKtD8x+tg4i3EU
	qjcIwzTfKJQDaGfA==
X-Received: by 2002:a05:690e:12c4:b0:664:9d5f:c96f with SMTP id 956f58d0204a3-667d7b638bbmr1391329d50.32.1783747477446;
        Fri, 10 Jul 2026 22:24:37 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm8643784d50.16.2026.07.10.22.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 22:24:37 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH 08/19] watchdog: rename kernel prefix
Date: Sat, 11 Jul 2026 01:23:52 -0400
Message-ID: <20260711052403.1292286-8-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 05:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240688

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uninformative with builds if
KERNEL_PACKAGE_NAME variable were to change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-extended/watchdog/watchdog_5.16.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index c166ace665..72287aa2a0 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "b8e7c070e1b72aee2663bdc13b5cc39f76c9232669cfbb1ac0adc7275a
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/watchdog/files/watchdog/"
 UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
-inherit autotools update-rc.d systemd pkgconfig
+inherit autotools update-rc.d systemd pkgconfig kernel-vars
 
 EXTRA_OECONF += " --disable-nfs "
 CACHED_CONFIGUREVARS += "ac_cv_path_PATH_SENDMAIL=${sbindir}/sendmail"
@@ -65,8 +65,8 @@ FILES:${PN}-keepalive = " \
 "
 
 RDEPENDS:${PN} += "${PN}-config"
-RRECOMMENDS:${PN} += "kernel-module-softdog"
+RRECOMMENDS:${PN} += "${KERNEL_PACKAGE_NAME}-module-softdog"
 
 RDEPENDS:${PN}-keepalive += "${PN}-config"
 RCONFLICTS:${PN}-keepalive += "${PN}"
-RRECOMMENDS:${PN}-keepalive += "kernel-module-softdog"
+RRECOMMENDS:${PN}-keepalive += "${KERNEL_PACKAGE_NAME}-module-softdog"
-- 
2.43.0


