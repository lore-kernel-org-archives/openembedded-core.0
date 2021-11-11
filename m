Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC011C433FE
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 01:36:42 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.4729.1636594600001022541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 17:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=huUMPmPF;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636594601;
  x=1668130601;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cGVs1Y5taE+dGdEkD3V26omgqzlivI2ps5od5SFglYQ=;
  b=huUMPmPFIzObLJB1LZz/gjDm9rO5u/BVXfp5n0+t+F8/aK6XSxYHe/mF
   BaTLk96t8LVu6i7kVnFeFuxsl4oFE3dkCu6DfAYW5kyUojNrLIvUdHlvQ
   2x4Ni60K/EE8BMah9d6AiPEOV76d8fvAK/jY1FLyQPlZg6S2tV3Ailpcq
   Gk4z2V+ejCtFk3SwXlXhZoJkLk++TAgvBbiBAJBBeIAAk6iz19VJ2XlWg
   UOU2pFPMwlXjh9ZA9p/QNdFQNYQcjNAnLzv8LYtfcB+7JkvsHgJLFB7za
   Dmnd+kv3t1SSzZTmF4IzxWmGaagrvTyzFYCCwEAEM2L3P2sXC7c8uOUy3
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] systemd-conf: Revert inappropriate use of
 ${systemd_system_unitdir}
Date: Thu, 11 Nov 2021 02:36:31 +0100
Message-ID: <20211111013632.16009-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211111013632.16009-1-pkj@axis.com>
References: <20211111013632.16009-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 01:36:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158124

This is a partial revert of commit 5ace3ada (systemd:
'${systemd_unitdir}/system' => '${systemd_system_unitdir}') where
the string '${systemd_unitdir}/system' matched something other than the
intended directory.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/systemd/systemd-conf_1.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes-core/systemd/systemd-conf_1.0.bb
index 53af7c616a..61ce7939d3 100644
--- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
+++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
@@ -21,7 +21,7 @@ SRC_URI = "\
 do_install() {
 	install -D -m0644 ${WORKDIR}/journald.conf ${D}${systemd_unitdir}/journald.conf.d/00-${PN}.conf
 	install -D -m0644 ${WORKDIR}/logind.conf ${D}${systemd_unitdir}/logind.conf.d/00-${PN}.conf
-	install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_system_unitdir}.conf.d/00-${PN}.conf
+	install -D -m0644 ${WORKDIR}/system.conf ${D}${systemd_unitdir}/system.conf.d/00-${PN}.conf
 
         if ${@bb.utils.contains('PACKAGECONFIG', 'dhcp-ethernet', 'true', 'false', d)}; then
 		install -D -m0644 ${WORKDIR}/wired.network ${D}${systemd_unitdir}/network/80-wired.network
@@ -30,7 +30,7 @@ do_install() {
 
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
 do_install:append:qemuall() {
-	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_system_unitdir}.conf.d/01-${PN}.conf
+	install -D -m0644 ${WORKDIR}/system.conf-qemuall ${D}${systemd_unitdir}/system.conf.d/01-${PN}.conf
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -38,6 +38,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 FILES:${PN} = "\
     ${systemd_unitdir}/journald.conf.d/ \
     ${systemd_unitdir}/logind.conf.d/ \
-    ${systemd_system_unitdir}.conf.d/ \
+    ${systemd_unitdir}/system.conf.d/ \
     ${systemd_unitdir}/network/ \
 "

