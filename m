Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TOcIZ-0000Wx-7V
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 00:41:11 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TOc5i-00023H-O2
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 00:27:54 +0200
Message-ID: <1350512717.4470.171.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2012 23:25:17 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH] gconf: Avoid error when trying to delete files that don't exist
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
X-List-Received-Date: Wed, 17 Oct 2012 22:41:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Use "rm -f" in do_install_append() so we don't fail if the files we're
trying to delete have already been removed.  This can happen if the
distro policy suppresses both static libs and .la files.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index dc3520f..4d77a14 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -33,8 +33,8 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/gconf/gconf.xml.system
 
 	# this stuff is unusable
-	rm ${D}${libdir}/GConf/*/*.*a
-	rm ${D}${libdir}/gio/*/*.*a
+	rm -f ${D}${libdir}/GConf/*/*.*a
+	rm -f ${D}${libdir}/gio/*/*.*a
 }
 
 # disable dbus-x11 when x11 isn't in DISTRO_FEATURES
-- 
1.7.10.4





