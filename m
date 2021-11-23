Return-Path: <adriaan.schmidt@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D7FC433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 08:33:35 +0000 (UTC)
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
 by mx.groups.io with SMTP id smtpd.web11.8583.1637656413987079325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 00:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: siemens.com, ip: 194.138.37.40, mailfrom: adriaan.schmidt@siemens.com)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 1AN8XVUr001085
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 09:33:31 +0100
Received: from ccp-new.vm7.ccp.siemens.com (random.ppmd.siemens.net
 [139.25.68.25])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 1AN8XUlk007835;
	Tue, 23 Nov 2021 09:33:31 +0100
From: Adriaan Schmidt <adriaan.schmidt@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adriaan Schmidt <adriaan.schmidt@siemens.com>
Subject: [PATCH] wic: support rootdev identified by partition label
Date: Tue, 23 Nov 2021 08:33:29 +0000
Message-Id: <20211123083329.2903686-1-adriaan.schmidt@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 08:33:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158597

We already support specifying the rootfs by PARTUUID. This adds general
support for letting the kernel find the rootfs by PARTLABEL.

Signed-off-by: Adriaan Schmidt <adriaan.schmidt@siemens.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index c7bc2469ab..35fff7c102 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -259,6 +259,8 @@ class DirectPlugin(ImagerPlugin):
             if part.mountpoint == "/":
                 if part.uuid:
                     return "PARTUUID=%s" % part.uuid
+                elif part.label:
+                    return "PARTLABEL=%s" % part.label
                 else:
                     suffix = 'p' if part.disk.startswith('mmcblk') else ''
                     return "/dev/%s%s%-d" % (part.disk, suffix, part.realnum)
-- 
2.20.1


