Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AC5EE49B6
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 06:10:45 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.5729.1692771037715473578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 23:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qYh4d-004KWZ-2h;
	Wed, 23 Aug 2023 09:10:36 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1qYh4d-00Gaf5-JD; Wed, 23 Aug 2023 09:10:35 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 4/9] oeqa dnf_runtime.py: fix HTTP server IP address and port
Date: Wed, 23 Aug 2023 09:10:20 +0300
Message-Id: <20230823061025.3952909-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_DKIM_NA(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: ASN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Message-ID: 20230823061025.3952909-4-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186548

Use correct HTTPService parameters like apt.py when setting up the repo
server. These work with qemu tun and slirp networking. Fixes test
failure with slirp networking when executing testimage.bbclass
selftests "oe-selftest -r runtime_test.TestImage".

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
index 64a3502370..d2f0f88f7d 100644
--- a/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
+++ b/meta-selftest/lib/oeqa/runtime/cases/dnf_runtime.py
@@ -10,7 +10,8 @@ class DnfSelftest(DnfTest):
         import tempfile
         cls.temp_dir = tempfile.TemporaryDirectory(prefix="oeqa-remotefeeds-")
         cls.repo_server = HTTPService(os.path.join(cls.tc.td['WORKDIR'], 'oe-rootfs-repo'),
-                                      cls.tc.target.server_ip)
+                                      '0.0.0.0', port=cls.tc.target.server_port,
+                                      logger=cls.tc.logger)
         cls.repo_server.start()
 
     @classmethod
-- 
2.34.1


