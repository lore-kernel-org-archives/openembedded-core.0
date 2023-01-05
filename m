Return-Path: <felix.moessbauer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B60C53210
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 12:52:51 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.12024.1672923167119253449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 04:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=felix.moessbauer@siemens.com header.s=fm1 header.b=aYU+AieF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-72506-202301051252480b2d356d98d6ab5cd4-jxqawv@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202301051252480b2d356d98d6ab5cd4
        for <openembedded-core@lists.openembedded.org>;
        Thu, 05 Jan 2023 13:52:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=felix.moessbauer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=HKhNmrr8CjZe0t1d4Krh2zdcKC7B7DI5pJPN7f5f9aY=;
 b=aYU+AieFIHQUJBTVJn1LQhrjjg/Riso49Fe7lBPaHA9h8siHN7559XMeER2woLRnogQrFA
 UPEb2rbF4ZTzqc4mVTLMLBcTfPGu501tFyShsRLBdXQHjknAZWJi1hZovnfbNkfOYsAqQzn+
 6WoIAasC3Men3esCVbIx4HdJaSGrM=;
From: Felix Moessbauer <felix.moessbauer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	alexandre.belloni@bootlin.com,
	richard.purdie@linuxfoundation.org,
	henning.schild@siemens.com,
	tobiasschmidl@siemens.com,
	luca.ceresoli@bootlin.com,
	Felix Moessbauer <felix.moessbauer@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>
Subject: [OE-core][PATCH 2/2] Revert "Revert "wic/plugins/images/direct: Allow changes in fstab on rootfs""
Date: Thu,  5 Jan 2023 12:52:23 +0000
Message-Id: <20230105125223.398216-3-felix.moessbauer@siemens.com>
In-Reply-To: <20230105125223.398216-1-felix.moessbauer@siemens.com>
References: <20230105125223.398216-1-felix.moessbauer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-72506:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 12:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175520

This re-introduces commit 20d43a2, which was reverted because it led to
duplicated entries in the fstab (from the rootfs and WIC). As the
deduplication logic is now added to WIC, the commit can be introduced
again.

By that, the / mountpoint can be defined using WIC scripts.

Reviewed-by: Florian Bezdeka <florian.bezdeka@siemens.com>
Signed-off-by: Felix Moessbauer <felix.moessbauer@siemens.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 085bf8b463..ae871e8795 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -125,7 +125,7 @@ class DirectPlugin(ImagerPlugin):
         updated = False
         for part in self.parts:
             if not part.realnum or not part.mountpoint \
-               or part.mountpoint == "/" or not (part.mountpoint.startswith('/') or part.mountpoint == "swap"):
+               or not (part.mountpoint.startswith('/') or part.mountpoint == "swap"):
                 continue
 
             if part.use_uuid:
-- 
2.34.1


