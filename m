Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 301A865E27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 13:42:53 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s5CDYXw7028603
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 15:34:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1402580077;
	bh=BhzDOmvj3XV+zMPnaAs3acqNllnuMZ+q30b/V0TQkKY=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=VHUAqDj9bOOhEMC8TNIAdKeipbZnsAgHHUrD6KVhgEY7cECVFaYL9l6mwtcJh8Q1V
	/0SnLh0Xf0xf1T0FcL/2bcvglyPpLQZfAY2ETEkrCdnhvygPLhBjD6X9MH1yVa30hi
	3zLIZPYyC1NEFfezwoh1GKRLCocsSczrvo+Zj7D0=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s5CDYRjm027440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jun 2014 15:34:29 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1Wv599-0006yU-3W; Thu, 12 Jun 2014 15:34:27 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jun 2014 15:34:26 +0200
Message-Id: <1402580066-26778-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH] dbus: fixed mode if systemd service file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Jun 2014 13:42:54 -0000

systemd complains with

|  Configuration file /lib/systemd/system/dbus.socket is marked executable. Please remove executable permission bits. Proceeding anyway.
|  Configuration file /lib/systemd/system/dbus.service is marked executable. Please remove executable permission bits. Proceeding anyway.

else.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/recipes-core/dbus/dbus.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index b3d3834..b5c9159 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -107,7 +107,7 @@ do_install() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
 		for i in dbus.target.wants sockets.target.wants multi-user.target.wants; do \
 			install -d ${D}${systemd_unitdir}/system/$i; done
-		install ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_unitdir}/system/
+		install -m 0644 ${B}/bus/dbus.service ${B}/bus/dbus.socket ${D}${systemd_unitdir}/system/
 		cd ${D}${systemd_unitdir}/system/dbus.target.wants/
 		ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/dbus.target.wants/dbus.socket
 		ln -fs ../dbus.socket ${D}${systemd_unitdir}/system/sockets.target.wants/dbus.socket
-- 
1.9.3


