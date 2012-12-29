Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tp2fH-0002C9-64
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Dec 2012 21:05:54 +0100
Received: by mail-ea0-f182.google.com with SMTP id a14so4828877eaa.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Dec 2012 11:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=lyuyMKajhIf2GsE4e0vXKJloi1LbNnrDboluml4Vhn4=;
	b=Ekj3V6hUyYxKKdFSz5KQJSBgyHs/OS63XXdXhyxWkQ1OmLIWQwOkx3qXxca0nyczZK
	o+dS2RC18Fr0/jJJzXu5S/FGwgyZg+fyuOy9fiNd+j7YCyyc5eQdV3F0SI73+3tSVfUY
	csASGPVcpYU0ipzBdELkBLIPTnUOdbkGE9lmzUCBytYxtA27nzH2/N0S5JC/HvXqVwM7
	gi9yl4tRWhJkDI0dQuWgbY0Cbvc4X9gyXubAOVd8ViC9XmEFkV36wgXlhF6Vp54uNwfv
	II4RiBXMzFXY4JKniiMoOrJC+PckATlIjU44MV8tKSNfda32pC3N3ha7TPklRoYzN0QE
	yZ5Q==
X-Received: by 10.14.219.72 with SMTP id l48mr97346557eep.37.1356810653967;
	Sat, 29 Dec 2012 11:50:53 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id e2sm74140825eeo.8.2012.12.29.11.50.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Dec 2012 11:50:53 -0800 (PST)
From: koen@dominion.thruhere.net
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Dec 2012 20:50:45 +0100
Message-Id: <50df499d.02cb0e0a.2047.4ecf@mx.google.com>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQkySvxH9HR70301gV/g32DZCYxyatcA5Kyvk8p26pg5kisjTUx9BNi7MAkcohMQwpE4pfmn
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC][PATCH] libnss-mdns: enable IPv6 as well as IPv4 mnds resolving
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Dec 2012 20:06:01 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

From the docs: "libnss_mdns.so.2 resolves both IPv6 and IPv4 addresses, libnss_mdns4.so.2 only IPv4 addresses and libnss_mdns6.so.2 only IPv6 addresses."

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../libnss-mdns/libnss-mdns_0.10.bb                |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index a1f2f9a..ae11487 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
 RDEPENDS_${PN} = "avahi-daemon"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz"
 
@@ -24,13 +24,13 @@ DEBIANNAME_${PN} = "libnss-mdns"
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-lynx --enable-avahi"
 
 pkg_postinst_${PN} () {
-if ! grep -q '^hosts:.*\<mdns4\>' $D/etc/nsswitch.conf; then
-	sed -e 's/^hosts:.*/& mdns4/' -i $D/etc/nsswitch.conf
+if ! grep -q '^hosts:.*\<mdns\>' $D/etc/nsswitch.conf; then
+	sed -e 's/^hosts:.*/& mdns/' -i $D/etc/nsswitch.conf
 fi
 }
 
 pkg_prerm_${PN} () {
-if grep -q '^hosts:.*\<mdns4\>' /etc/nsswitch.conf; then
-	sed -e '/^hosts:/s/\s\<mdns4\>//' -i /etc/nsswitch.conf
+if grep -q '^hosts:.*\<mdns\>' /etc/nsswitch.conf; then
+	sed -e '/^hosts:/s/\s\<mdns\>//' -i /etc/nsswitch.conf
 fi
 }
-- 
1.7.7.6



