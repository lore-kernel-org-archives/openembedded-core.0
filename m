Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C83C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:19:27 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.699.1664990359105991639
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 10:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HZQq8DYh;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9085E100008;
	Wed,  5 Oct 2022 17:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664990356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Jg5ZkWRIQ7fgUxtteXROSeI9F/OKhzRWCX0dsBbCyhk=;
	b=HZQq8DYhXYUE4hyQ6Zoc2MZ85kZSK30DBGvNM2uC/mjARkmaEZbdL35YXt4/+yPRNcSGMv
	/gSyVFiXYdMvhD+G3+3+t+Mxy4URf7fkGSczVm8TqHfviWLrv5vHld1xAvO1S0YkG4YNT5
	B/zbqV6aYf/dHm5u5ZRf+sDylUFvrsmxubuZZet9nsOaeJL8fyfp7PY12sMxQFUxC8lHCb
	/vBLOGMeLGWsfbDlKVXqIa+46Us4jncPYGYfH29mlw6+ibz3bJWBRcIONEjpxgxkpMnO63
	niE7jSxBcKaQjHa4766GhFi1z5da2N7EFWWZ7c7fg5QJuLpR0e94OVmZzXsRqg==
From: thomas.perrot@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [OE-core][PATCH] psplash: add psplash-default in rdepends
Date: Wed,  5 Oct 2022 19:19:14 +0200
Message-Id: <20221005171914.2889050-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 17:19:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171472

From: Thomas Perrot <thomas.perrot@bootlin.com>

Otherwise when the installation of recommended packages is prevented
(NO_RECOMMENDATIONS = "1"), then splash screen will not be cast.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index edc0ac1d8961..9532ed1534a6 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -58,7 +58,7 @@ python __anonymous() {
         d.setVarFlag("ALTERNATIVE_TARGET_%s" % ep, 'psplash', '${bindir}/%s' % p)
         d.appendVar("RDEPENDS:%s" % ep, " %s" % pn)
         if p == "psplash-default":
-            d.appendVar("RRECOMMENDS:%s" % pn, " %s" % ep)
+            d.appendVar("RDEPENDS:%s" % pn, " %s" % ep)
 }
 
 S = "${WORKDIR}/git"
-- 
2.37.3


