Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F04FC433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 10:06:28 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web12.5795.1652954775972947727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 03:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=XucAH0D3;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JA6Ct3884852
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:06:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1652954772;
	bh=bEMiKxshjTrJvAX3jBlLulf4+9P2xSWMVLb/xoJy9WQ=; l=725;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XucAH0D3bTwH/U4QLBoBJIQbD7LYTKx4FGmVinGi7oMRbrZoucfm96sG/GgC7xxb2
	 rjWD0QqQr44TGqteaMEpRUZBD+rjY9c9bR1eUp7wNWHibF8IyEA/ERMTuvin+iRz7P
	 N5bTiJkkMTDQh/ACu/L4/RiaGif3MCJwM1rzZ+axwrWpL+TbOqZN0YFnGfArFRvULz
	 yhUytXniG5pQBhvujrEiSpbmAq7v/TUAunlf8jcvXSIDWC/1cOOOswhaxTcuVT5rim
	 hnjJqTHvhEJ/v2k286Jr59x4/6OxX9DLg+hhkJsMUYyyJyn+vgIsNSQJj/1qq4Q6IF
	 BceuvqUbYOH7w==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 24JA68XR791548
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Thu, 19 May 2022 12:06:10 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 14DF203DB70; Thu, 19 May 2022 12:06:07 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 24JA66MV856495
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 19 May 2022 12:06:06 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nrd2k-004ImY-Kj;
	Thu, 19 May 2022 12:06:06 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 4/6] npm: disable 'audit' + 'fund'
Date: Thu, 19 May 2022 12:05:54 +0200
Message-Id: 
 <9dd04b7493db380bc08e0346df8083c716e505c3.1652954597.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 10:06:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165872

'audit' can cause extra network traffic; 'fund' is not needed.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/npm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 11c80a738e..1e41072116 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -53,6 +53,8 @@ def npm_global_configs(d):
     # Ensure no network access is done
     configs.append(("offline", "true"))
     configs.append(("proxy", "http://invalid"))
+    configs.append(("funds", False))
+    configs.append(("audit", False))
     # Configure the cache directory
     configs.append(("cache", d.getVar("NPM_CACHE")))
     return configs
-- 
2.36.1


