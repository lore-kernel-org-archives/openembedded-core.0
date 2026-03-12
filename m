Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C7E106ACF4
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 23:18:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4097.1773357494813883305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 16:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Cv3jtwjV;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48538c5956bso15180955e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 16:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773357493; x=1773962293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+ef1E+3xC4b1QXrfthM/9t0OLMXVKondmszkbm0JQg=;
        b=Cv3jtwjVsyBzRR2jnDl530oBq65lt5JTyQu46HNBzwrrtCyB1o0DT4XSkw6su4NMaj
         27ydclY6Km/2wAO229BTVPV5WJQ3TlbY/WTFqThwYjsnarnr3EoaUcRhQFGaVS4AHPlx
         oJqdEAi1EdGYwCx6ZpcP38+eonwmROKhO/64o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773357493; x=1773962293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+ef1E+3xC4b1QXrfthM/9t0OLMXVKondmszkbm0JQg=;
        b=Tq9JQYLX8MQF9DdMnP1ceyPADWXBcaXVHMUHTtYj/mdc/HyInOvYmgjpsEuDVl4ATB
         5GBU3QGDn8QhnlPjwKrwCoRgQK4Ia3ajN0Rd7NcbdYlo6cPpsDEFoI3aJYqNMhOZI6pG
         Fn0k6BxxvQFxXkPsDbfVHaj3DPwVHGBBTEfWpWxNO9OjCAt/qFVcVPTtYi63HC1eKfAA
         39fNZcYTMMCsJBqkPpvAqOiF9c3Dd8vHI74VvHDouZgkw20VYMoG24LgJd3+WDsemaLB
         bg/XKaDVldNnA/czmQxbvOjuTnzTbxIjDEBQFPzJoEWqjEk6SBqO/st49ejbAH/sSj97
         c6jQ==
X-Gm-Message-State: AOJu0YxjHt6tfzBrATD2LEG0+kojrvY/Mra4EQbvUtEnT2EeyaF++urT
	igGkBnGd8K03uD9t2uUObtydLEbjPbtKIrXpNPvElPhvNdSWsuBVqdR89YBwDHYQMwvWKp0Uph+
	zmO4Q
X-Gm-Gg: ATEYQzxOVf5PXeLw2ZdcUYVUw1Es7SKZHKtg23PoO7b5XSs+xgL1twOeN3Qb4M97igD
	NH9YvvZD/oH36toR68ExO/jPQxGL09EMD4Ji9Qiu+72UNrTGfhlvms4VChkq+1PMXTBVfHbt4SO
	xIVbXnuV0A9Fjiz4GdGwtwwZ1wUWpomuEnuNz7Lbjjb36PqBsfX7vd9JrPwSHUakXK38OaSyjuD
	ZhwwBwL+SF4AY4YHfXAGJEHYoO+gBez21B2BG56jIOYMtqUWOUJ7vbo/inVa7dYXdUnCAB0IGex
	OKtOS0apQ9SbavHPIhsjyhQBk+5/W7qJm4iyMOvHePgTQ2VUgvmZsGvFjiFtIdhP7NK241ccXrE
	l/GeZ7JjlBnmnoAreruQPDpmTJV4x4ESbn1D6jXNY2gr6rBuEaKZ0k2J/k/tiPXWjiAEbZ8DxeU
	yyIh7NnEQV2EKrMghjxyfH4WsjfHIFzfr5cDfhJ89MiSHhIid+Fjl3HcLRu0Ovvc04Z0iJo/XMp
	fNbncNrlCpEu9oFkLRVUfgPj/0l
X-Received: by 2002:a05:600c:350e:b0:483:6d9e:e4f5 with SMTP id 5b1f17b1804b1-48555ac7160mr22568605e9.5.1773357492881;
        Thu, 12 Mar 2026 16:18:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a9a19e6457d4ef2f.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a9a1:9e64:57d4:ef2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a74228sm4945215e9.18.2026.03.12.16.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 16:18:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [whinlatter][PATCH] scripts/install-buildtools: Update to 5.3.2
Date: Fri, 13 Mar 2026 00:17:30 +0100
Message-ID: <20260312231730.751467-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 23:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233011

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 5.3.2 release of the 5.3 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index c3f257ff93..b9c008a2ec 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.3.1'
-DEFAULT_INSTALLER_VERSION = '5.3.1'
+DEFAULT_RELEASE = 'yocto-5.3.2'
+DEFAULT_INSTALLER_VERSION = '5.3.2'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

