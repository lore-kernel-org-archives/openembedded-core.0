Return-Path: <betacentauri@arcor.de>
Received: from mx009.vodafonemail.xion.oxcs.net
	(mx009.vodafonemail.xion.oxcs.net [153.92.174.39])
	by mail.openembedded.org (Postfix) with ESMTP id B2B0665D48
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 17:26:35 +0000 (UTC)
Received: from vsmx002.vodafonemail.xion.oxcs.net (unknown [192.168.75.192])
	by mta-6-out.mta.xion.oxcs.net (Postfix) with ESMTP id AAD8CD9B3EF;
	Thu,  5 Jul 2018 17:26:35 +0000 (UTC)
Received: from fm1.fritz.box (unknown [89.1.136.222])
	by mta-6-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 72238199C3E;
	Thu,  5 Jul 2018 17:26:31 +0000 (UTC)
From: Betacentauri <betacentauri@arcor.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2018 19:26:29 +0200
Message-Id: <1530811589-29601-1-git-send-email-betacentauri@arcor.de>
X-Mailer: git-send-email 1.9.1
X-VADE-STATUS: LEGIT
Cc: Betacentauri <betacentauri@arcor.de>
Subject: [PATCH] libnss-mdns: Fix search path for avahi socket file
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
X-List-Received-Date: Thu, 05 Jul 2018 17:26:35 -0000

Since v0.7 avahi uses /run/avahi-daemon/socket.
libnss searches in $(localstatedir)/run/avahi-daemon/.
Set localstatedir to / to fix mdns resolving.
---
 meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index 5be5e4f..d0eb276 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -17,6 +17,8 @@ SRC_URI[sha256sum] = "1e683c2e7c3921814706d62fbbd3e9cbf493a75fa00255e0e715508d81
 
 S = "${WORKDIR}/nss-mdns-${PV}"
 
+localstatedir = "/"
+
 inherit autotools
 
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-lynx --enable-avahi"
-- 
1.9.1


