Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp23.services.sfr.fr (smtp23.services.sfr.fr [93.17.128.19])
	by mail.openembedded.org (Postfix) with ESMTP id 1F8F9731B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 14:17:23 +0000 (UTC)
Received: from filter.sfr.fr (localhost [111.250.196.5])
	by msfrf2303.sfr.fr (SMTP Server) with ESMTP id 907F070000FB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 15:17:23 +0100 (CET)
Authentication-Results: sfrmc.priv.atos.fr; dkim=none (no signature);
	dkim-adsp=none (no policy) header.from=herve.jourdain@neuf.fr
Received: from nb-hjo (111-250-196-5.dynamic.hinet.net [111.250.196.5])	(using
	TLSv1 with cipher AES128-SHA (128/128 bits))	(No client certificate
	requested)
	by msfrf2303.sfr.fr (SMTP Server) with ESMTP id B59DD7000097
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 15:17:22 +0100 (CET)
X-SFR-UUID: 20160307141722744.B59DD7000097@msfrf2303.sfr.fr
Received: from nbhjo
	by nb-hjo (PGP Universal service);  Mon, 07 Mar 2016 15:17:21 +0100
X-PGP-Universal: processed;	by nb-hjo on Mon, 07 Mar 2016 15:17:21 +0100
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
Date: Mon, 7 Mar 2016 15:17:16 +0100
Message-ID: <00ab01d1787c$106f4320$314dc960$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdF4e+f4HQvOqyvWTP+bmiFwI7jvsw==
Subject: [meta-oe][PATCH] systemd: binfmt should be added to SYSTEMD_PACKAGES
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
X-List-Received-Date: Mon, 07 Mar 2016 14:17:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
---
 meta/recipes-core/systemd/systemd_229.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb
b/meta/recipes-core/systemd/systemd_229.bb
index 16af0ac..a537dd3 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -298,8 +298,8 @@ PACKAGES =+ "\
     ${PN}-extra-utils \
 "
 
-SYSTEMD_PACKAGES = "${PN}-binfmt"
-SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
+SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt',
'${PN}-binfmt', '', d)}"
+SYSTEMD_SERVICE_${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG',
'binfmt', 'systemd-binfmt.service', '', d)}"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'microhttpd',
'--system -d / -M --shell /bin/nologin systemd-journal-gateway;', '', d)}"
-- 
1.9.1

