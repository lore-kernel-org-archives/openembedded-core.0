Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0ATZ-0004Ah-96
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 12:35:13 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 12:26:45 +0100
Message-Id: <1329910007-8441-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 3/5] gconf.bbclass: don't add dependencies or hooks unless x11 is defined
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
X-List-Received-Date: Wed, 22 Feb 2012 11:35:13 -0000

* Drop dependency on GNOME if x11 is disabled.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/gconf.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index 7bfa871..5067abd 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -1,4 +1,4 @@
-DEPENDS += "gconf gconf-native"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', 'gconf gconf-native', '', d)}"
 
 # This is referenced by the gconf m4 macros and would default to the value hardcoded
 # into gconf at compile time otherwise
@@ -31,6 +31,9 @@ done
 }
 
 python populate_packages_append () {
+	if not oe.utils.contains('DISTRO_FEATURES', 'x11', True, False, d):
+		return
+
 	import re
 	packages = d.getVar('PACKAGES', 1).split()
 	pkgdest =  d.getVar('PKGDEST', 1)
-- 
1.7.5.4



