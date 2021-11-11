Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291F6C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 01:36:42 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.4729.1636594600001022541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 17:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=OXOGfXiN;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636594600;
  x=1668130600;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bLUgXDmwEHkIEQ2i41v5+Q13xjJgmq3tKvj+P5V2p8g=;
  b=OXOGfXiNDTHzbQAgNbRFbQMkeWCaFRPuNsQWrSoezeEJIb9NGARxYloS
   vN2+tWawwETwa3ItshRSaydNWnfMI133AvKCpK8GLP8pMukVCilZ60xEs
   r9wSC81jjC1huHBGIzb7XfE6dt21D1dnzaQ21Ca50tDLwXI3s9vzpGTK8
   Jgs6k/TgIb34p7ND1c31uHaoLv8El9zLnW4SLBw45AoFCT6VMgHhgLhPn
   quzX0yS0qP8AxYx3A2KKx9TkG2LP9jz5g2Nunb/I3Q+91wBHmmaWv+7mq
   0T4X5edjLFXqPFuJXMY3GCQKbtVll8bbdgKMnUYJuLONc30QVUzk8s5hE
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] systemd: Revert inappropriate use of
 ${systemd_system_unitdir}
Date: Thu, 11 Nov 2021 02:36:30 +0100
Message-ID: <20211111013632.16009-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 01:36:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158123

This is a partial revert of commit 5ace3ada (systemd:
'${systemd_unitdir}/system' => '${systemd_system_unitdir}') where
the string '${systemd_unitdir}/system' matched something other than the
intended directory.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/systemd/systemd_249.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index c0c1f9bcfc..8bdc0ca028 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -267,7 +267,7 @@ do_install() {
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
-		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_system_unitdir}d-sysv-install
+		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 	fi
 
 	if "${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'false'}"; then
@@ -341,7 +341,7 @@ do_install() {
 
 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
-	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_system_unitdir}-preset/99-default.preset
+	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
 
 	# add a profile fragment to disable systemd pager with busybox less
 	install -Dm 0644 ${WORKDIR}/systemd-pager.sh ${D}${sysconfdir}/profile.d/systemd-pager.sh

