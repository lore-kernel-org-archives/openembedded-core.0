Return-Path: <m.felsch@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62541E77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 18:03:55 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.1360.1733940234090246383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 10:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: mfe@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tLR3v-0005du-Vl; Wed, 11 Dec 2024 19:03:51 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tLR3v-002u07-04;
	Wed, 11 Dec 2024 19:03:51 +0100
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tLR3v-008vko-2M;
	Wed, 11 Dec 2024 19:03:51 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org,
	yocto@pengutronix.de
Subject: [PATCH] icecc: don't use KERNEL_CC during set_icecc_env
Date: Wed, 11 Dec 2024 19:03:48 +0100
Message-Id: <20241211180348.2128102-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211180348.2128102-1-m.felsch@pengutronix.de>
References: <20241211180348.2128102-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 18:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208602

The KERNEL_CC variable usage was introduced by commit d2fcaeb153fd
("icecc: Don't generate recipe-sysroot symlinks at recipe-parsing time,
2018-12-20") and is set once a recipe pulls the kernel-arch.bbclass.
There are a few packages, e.g. u-boot, barebox, devicetree, perf which
pull this class and for such packages the get_cross_kernel_cc() return
None because icecc_is_kernel() fail.

Fix this for now by replacing the KERNEL_CC check with the
icecc_is_kernel() helper, which is also used by the
get_cross_kernel_cc().

That said it's still not very robust to determine a compiler based on
a variable or inherited class but at least it fixes the issue for now.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 8fe9739f870d..8a48f2ad63dc 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -358,7 +358,7 @@ python set_icecc_env() {
     symlink_path = os.path.join(ICE_PATH, "symlinks")
     bb.utils.mkdirhier(symlink_path)
     compilers = []
-    if d.getVar('KERNEL_CC'):
+    if icecc_is_kernel(bb, d):
         compilers.append(get_cross_kernel_cc(bb,d))
     else:
         host_prefix = d.getVar('HOST_PREFIX')
-- 
2.39.5


