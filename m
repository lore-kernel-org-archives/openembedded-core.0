Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45737C54E66
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 17:19:12 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.667.1710177547400488275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 10:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=OuRi6aZ/;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BHJ30X107334
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 18:19:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710177543;
	bh=tgXBssyGW9CpmKGiKb1CgNAqUjcV+vM5BAA+0hhbaK0=; l=2163;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OuRi6aZ/+6U1ZzOPHa8gFekuqumFHPzbBkqlUC6q2hbad35mwNoS/Ls38Ewwf2zwq
	 DZX4BdglkAwhHarUP8rfiRs8nWV0u7NgpUk++HLrPP8YrMKUTgK4NrjFjPQc4i9Ppf
	 itRXACUC5NVmWB/R/tdDIeL8sCDcXAMRp2Xc2ECdPaV6cVvi/ZXrGQXmtEmVGObQQa
	 Dfinu9KleEhlQANC8Z3Mqy1C+i7IuMFJLqnVcXYL50w4WM75Yy1pNHf1IxrZ83hCfP
	 QxqEdb73nAsGdchucNs8H/EyjlKDwB9EZUvpbDIZM4AucSyy6rkTDK6jmQbMN8ZBrK
	 u9gHs5AdQCKNA==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42BHJ0qf279256
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 11 Mar 2024 18:19:00 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id 6NP30Y5Y47; Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 42BHIxok105399
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 11 Mar 2024 18:18:59 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rjjIh-00000008xuR-1AFX;
	Mon, 11 Mar 2024 18:18:59 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 3/7] openssh: move configuration tweaking in configuration recipe
Date: Mon, 11 Mar 2024 18:18:44 +0100
Message-ID: <f672c5599e23341b5e7efb48396798b6827064c1.1710177387.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1710177387.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65ef3d03b121c496daa8ef7c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 17:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196954

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Instead of applying DISTRO_FEATURE based setup directly to
sshd_config, add it to our configuration snippet.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-connectivity/openssh/openssh-config.bb | 10 ++++++++++
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb  |  8 --------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-config.bb b/meta/recipes-connectivity/openssh/openssh-config.bb
index 2ef6a770fcfe..312a1c903f63 100644
--- a/meta/recipes-connectivity/openssh/openssh-config.bb
+++ b/meta/recipes-connectivity/openssh/openssh-config.bb
@@ -13,6 +13,16 @@ do_install() {
     install -p -m 0644 \
         ${WORKDIR}/80-oe.conf \
         "$d"/
+
+    f=$d/80-oe.conf
+
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
+        echo "UsePAM yes" >> "$f"
+    fi
+
+    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
+        echo "X11Forwarding yes" >> "$f"
+    fi
 }
 
 python populate_packages:prepend() {
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 406b349f8283..e792b459d838 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -109,11 +109,6 @@ do_compile_ptest() {
 do_install:append () {
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
 		install -D -m 0644 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
-		sed -i -e 's:#UsePAM no:UsePAM yes:' ${D}${sysconfdir}/ssh/sshd_config
-	fi
-
-	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
-		sed -i -e 's:#X11Forwarding no:X11Forwarding yes:' ${D}${sysconfdir}/ssh/sshd_config
 	fi
 
 	install -d ${D}${sysconfdir}/init.d
@@ -188,9 +183,6 @@ RPROVIDES:${PN}-sshd = "sshd"
 RCONFLICTS:${PN} = "dropbear"
 RCONFLICTS:${PN}-sshd = "dropbear"
 
-CONFFILES:${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
-CONFFILES:${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
-
 RRECOMMENDS:${PN} += "openssh-config"
 
 ALTERNATIVE_PRIORITY = "90"
-- 
2.44.0


