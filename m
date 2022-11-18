Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87480C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 16:08:46 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web10.67.1668787717327770749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 08:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ow3ur-00EcSe-PA; Fri, 18 Nov 2022 18:08:34 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1ow3ur-00GYCI-FF; Fri, 18 Nov 2022 18:08:33 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH v3 1/2] qemurunner.py: support setting slirp host IP address
Date: Fri, 18 Nov 2022 18:08:27 +0200
Message-Id: <20221118160828.3939869-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.2 (-)
X-Rspam-Report: Action: no action
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: ARC_NA(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: FROM_HAS_DN(0.00)
 Symbol: RCPT_COUNT_THREE(0.00)
 Symbol: R_MISSING_CHARSET(0.50)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: TAGGED_RCPT(0.00)
 Symbol: MIME_GOOD(-0.10)
 Symbol: TO_DN_SOME(0.00)
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
 Message-ID: 20221118160828.3939869-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 16:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173470

By default host side IP address is not set and qemu listens
on all IP addresses on the host machine which is not a good
idea when images have root login enabled without password.
It make sense to listen only on localhost IP address 127.0.0.1 using
config change like:

QB_SLIRP_OPT = "-netdev user,id=net0,hostfwd=tcp:127.0.0.1:2222-:22"

This config works for qemu itself, but breaks runqemu which tries to
parse the host side port number from qemu process command line arguments.
So change the runqemu side hostfwd parsing for port number to ignore
the host IP address field.

Reviewed-by: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

v3: use IP address from command line too

v2: improved commit message, https://lists.openembedded.org/g/openembedded-core/message/173250

v1: https://lists.openembedded.org/g/openembedded-core/topic/95016024#173234

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index e602399232..c285f30c0a 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -401,9 +401,10 @@ class QemuRunner:
                 cmdline = re_control_char.sub(' ', cmdline)
             try:
                 if self.use_slirp:
-                    tcp_ports = cmdline.split("hostfwd=tcp::")[1]
+                    tcp_ports = cmdline.split("hostfwd=tcp:")[1]
+                    ip, tcp_ports = tcp_ports.split(":")[:2]
                     host_port = tcp_ports[:tcp_ports.find('-')]
-                    self.ip = "localhost:%s" % host_port
+                    self.ip = "%s:%s" % (ip, host_port)
                 else:
                     ips = re.findall(r"((?:[0-9]{1,3}\.){3}[0-9]{1,3})", cmdline.split("ip=")[1])
                     self.ip = ips[0]
-- 
2.34.1


