Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90484C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 14:06:29 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.7998.1652969181145817727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 07:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=U+nI3ISt;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JE6Hou886703
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 16:06:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1652969178;
	bh=QdTBYqELFuGjeZGCXg2Ivoig0WOfbYeoJAl6CMgY9oc=; l=724;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U+nI3IStSAJZXE9zm4Yzd6LIXxxnzO0ehzqM77q52pjXIPOsffUggtCZl7+6YPy6k
	 kgs/N6MSFbqRcuO/GI+hwsFGEKUYSSwQl5f/tqvr1Qsd/WcTNEduAS7dsHHHq0MeXR
	 1aCjNYlzWfcwpfakWba/yeQ08ymz6/zs5c1kRMekKkiOv1Yxe/+Rt/l44/pw6/auzJ
	 579WUJ615B3RS14ZGaBsLTIb/jjpiv1wmW/nRPESbgEJrv+yM5h2OQ/OUUnOdYt9CL
	 lggvRdVmd7Lv2Yg3yPQiEgxTLvzvkIdVD4Z8gne52jNbx+yxtGW0Er1ZTOLdlEXcvv
	 afcj4XwYznU2w==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 24JE6Bmp794095
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Thu, 19 May 2022 16:06:12 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 1D0B9AFFBBB; Thu, 19 May 2022 16:06:10 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JE6AQd598507
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 19 May 2022 16:06:10 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nrgn4-00D9x3-HI;
	Thu, 19 May 2022 16:06:10 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 4/6, v2] npm: disable 'audit' + 'fund'
Date: Thu, 19 May 2022 16:06:09 +0200
Message-Id: <20220519140358.3034147-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: 
 <9dd04b7493db380bc08e0346df8083c716e505c3.1652954597.git.enrico.scholz@sigma-chemnitz.de>
References: 
 <9dd04b7493db380bc08e0346df8083c716e505c3.1652954597.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 14:06:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165889

'audit' can cause extra network traffic; 'fund' is not needed.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/npm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 11c80a738e..b613c8e8f5 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -53,6 +53,8 @@ def npm_global_configs(d):
     # Ensure no network access is done
     configs.append(("offline", "true"))
     configs.append(("proxy", "http://invalid"))
+    configs.append(("fund", False))
+    configs.append(("audit", False))
     # Configure the cache directory
     configs.append(("cache", d.getVar("NPM_CACHE")))
     return configs
-- 
2.36.1


