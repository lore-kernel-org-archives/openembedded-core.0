Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD35C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 09:37:37 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.3931.1682501850914434202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 02:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1prbab-00088c-1V; Wed, 26 Apr 2023 11:37:29 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prbaa-00DtUE-Cf; Wed, 26 Apr 2023 11:37:28 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1prbaZ-006FWW-Kb; Wed, 26 Apr 2023 11:37:27 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de
Subject: [PATCH] package_manager/ipk: fix config path generation in _create_custom_config()
Date: Wed, 26 Apr 2023 11:37:12 +0200
Message-Id: <20230426093712.1488695-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 09:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180418

"sysconfdir" contains "/" by definition and thus using os.path.join()
leads to self.target_rootfs being always ignored (and thus attempting to
generate paths in host's /etc).

Use oe.path.join() instead which was made for this purpose.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oe/package_manager/ipk/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index caca522fd6..e6f9c08e2b 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -247,7 +247,7 @@ class OpkgPM(OpkgDpkgPM):
             """
             if (self.d.getVar('FEED_DEPLOYDIR_BASE_URI') or "") != "":
                 for arch in self.pkg_archs.split():
-                    cfg_file_name = os.path.join(self.target_rootfs,
+                    cfg_file_name = oe.path.join(self.target_rootfs,
                                                  self.d.getVar("sysconfdir"),
                                                  "opkg",
                                                  "local-%s-feed.conf" % arch)
-- 
2.39.2


