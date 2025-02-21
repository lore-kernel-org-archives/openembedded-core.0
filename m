Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B751AC021B6
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 13:58:54 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.23313.1740146328791781018
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Feb 2025 05:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=gbE6nwaQ;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 51LDwkBG2170487
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 14:58:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1740146326;
	bh=PrzQcyXzMVHIWUqJ2ROhs9VGStQglBgeuLWxS5gE+Sc=; l=1010;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gbE6nwaQKWsmBpcPlzt/0/IUL8HKb6Ltpo6LRSXncmnFarltvxSjNST34qLYdJPSW
	 5sj3EIqjPXo787e/Q35JdVO6YYkwVNXq82rmTKWG8G1J8oj0QZ934FEabGXTAs/83J
	 eaa31Qr2IGX1GPUzqTN2hPaRxkVyNs7bNfP0QeSPJ9uxbd9ZWPNYONJolkN7EVaZZT
	 r9uH/bOJiCDU15gKXr5keNQQO0lJSqat6+8SavSnRaHEsY8ZLOlDlZFWve0wb7rXcm
	 Wtqo4/njUwUa/NxvIylvL0kXcB6WSZti+94szRKFidUf9abqhXoOqNNRVMN31XHM3D
	 E3EXAtHsUmgMQ==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.18.1/8.18.1) with ESMTP id 51LDwisI2708167
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Fri, 21 Feb 2025 14:58:44 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id 14XY09IJIR; Fri, 21 Feb 2025 14:58:44 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 51LDwhCX2132579
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 21 Feb 2025 14:58:43 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.98)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1tlTYB-00000007L5V-3RkX;
	Fri, 21 Feb 2025 14:58:43 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 2/2] selftest:devtool: use 'config.toml' instead of plain 'config'
Date: Fri, 21 Feb 2025 14:58:39 +0100
Message-ID: <f471093e1c6ca25595f12548b79eabfb5fff2acc.1740146289.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20f200e881bf71d035de9823cc2270bbe9a8fe77.1740146289.git.enrico.scholz@sigma-chemnitz.de>
References: <20f200e881bf71d035de9823cc2270bbe9a8fe77.1740146289.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 67b886948c284250d7b4172f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Feb 2025 13:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211798

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

After changing naming of cargo config in cargo_common.bbclass, adapt
devtool to use the new name.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index e09e9755a3be..115dc24d87e1 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1027,7 +1027,7 @@ class DevtoolModifyTests(DevtoolBase):
         # Configure the recipe to check that the git dependencies are correctly patched in cargo config
         bitbake('-c configure %s' % testrecipe)
 
-        cargo_config_path = os.path.join(cargo_home, 'config')
+        cargo_config_path = os.path.join(cargo_home, 'config.toml')
         with open(cargo_config_path, "r") as f:
             cargo_config_contents = [line.strip('\n') for line in f.readlines()]
 
-- 
2.48.1


