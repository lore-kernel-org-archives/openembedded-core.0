Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RsUnW-0005sH-3x
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 08:40:06 +0100
Received: by wgbdr13 with SMTP id dr13so807441wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 23:32:11 -0800 (PST)
Received: by 10.180.24.105 with SMTP id t9mr39619601wif.19.1328081531652;
	Tue, 31 Jan 2012 23:32:11 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id dw7sm28228064wib.4.2012.01.31.23.32.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 23:32:10 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2012 08:32:04 +0100
Message-Id: <1328081524-29957-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>, Peter Tworek <tworaz666@gmail.com>
Subject: [PATCH] gconf.bbclass: Add proper RDEPENDS to packages with gconf postinststep.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Feb 2012 07:40:06 -0000

From: Peter Tworek <tworaz666@gmail.com>

Right now gconf bbclass adds both postinst and prerm steps, but it does
not ensure that packages involved have gconf in RDEPENDS. This can lead
to a situation where postinst/prerm steps fail because gconftool-2 is
not installed.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/gconf.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index c1dbbe3..7bfa871 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -56,5 +56,8 @@ python populate_packages_append () {
 				prerm = '#!/bin/sh\n'
 			prerm += d.getVar('gconf_prerm', 1)
 			d.setVar('pkg_prerm_%s' % pkg, prerm)
+			rdepends = d.getVar("RDEPENDS_%s" % pkg, True) or ""
+			rdepends += " gconf"
+			d.setVar("RDEPENDS_%s" % pkg, rdepends)
 
 }
-- 
1.7.2.5



