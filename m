Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88178C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 16:08:46 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.70.1668787717745915916
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 08:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ow3ut-00EcT2-4d; Fri, 18 Nov 2022 18:08:35 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ow3us-00GYYh-Rh; Fri, 18 Nov 2022 18:08:34 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 2/2] runqemu: limit slirp host port forwarding to localhost 127.0.0.1
Date: Fri, 18 Nov 2022 18:08:28 +0200
Message-Id: <20221118160828.3939869-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221118160828.3939869-1-mikko.rapeli@linaro.org>
References: <20221118160828.3939869-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(-0.00)
 Symbol: R_SPF_NA(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20221118160828.3939869-2-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 16:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173471

With default slirp port forwarding config qemu listens on TCP ports
2222 and 2323 on all IP addresses available on the build host. Most
use cases with runqemu only need it for localhost and it is not
safe to run qemu images with root login without password enabled
and listening on all available, possibly Internet reachable network
interfaces. Limit qemu port forwarding to localhost 127.0.0.1 IP
address. Now qemu machine SSH and telnet ports are only
reachable from the build host machine, not full Internet.

If qemu machine needs to be reachable from network, then it can
be enabled via local.conf or machine config variable QB_SLIRP_OPT:

QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp::2222-:22"

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index a6ea578564..7bd9465593 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1071,7 +1071,7 @@ class BaseConfig(object):
         logger.info("Network configuration:%s", netconf)
         self.kernel_cmdline_script += netconf
         # Port mapping
-        hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
+        hostfwd = ",hostfwd=tcp:127.0.0.1:2222-:22,hostfwd=tcp:127.0.0.1:2323-:23"
         qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" % (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
         qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
         # Figure out the port
-- 
2.34.1


