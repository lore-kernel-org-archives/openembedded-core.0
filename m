Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjuZY-0001h1-9S
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:54:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161344559"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 08:43:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 08:43:20 -0700
Message-Id: <e72aba687a48b039f738bdb5db20f5a2dbedcf57.1340811559.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/20] gconf.bbclass: don't register schemas in the install stage
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
X-List-Received-Date: Wed, 27 Jun 2012 15:54:28 -0000

From: Ross Burton <ross.burton@intel.com>

Previously this was installing schemas in the sysroot, which is wrong for native
packages as nothing should touch the sysroot directly, and even more wrong for
non-native packages as the sysroot is irrelevant.

So, export the environment variable that stops the registration happening at
install time. The postinst script will handle the non-native case, and for the
sysroot I've opened #2648.  This isn't a massive problem as nothing to my
knowledge actually installs schemas to the sysroot.

[YOCTO #2245]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gconf.bbclass |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index a966c26..fb9f701 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -1,10 +1,18 @@
 DEPENDS += "gconf gconf-native"
 
-# This is referenced by the gconf m4 macros and would default to the value hardcoded
-# into gconf at compile time otherwise
+# These are for when gconftool is used natively and the prefix isn't necessarily
+# the sysroot.  TODO: replicate the postinst logic for -native packages going
+# into sysroot as they won't be running their own install-time schema
+# registration (disabled below) nor the postinst script (as they don't happen).
 export GCONF_SCHEMA_INSTALL_SOURCE = "xml:merged:${STAGING_DIR_NATIVE}${sysconfdir}/gconf/gconf.xml.defaults"
 export GCONF_BACKEND_DIR = "${STAGING_LIBDIR_NATIVE}/GConf/2"
 
+# Disable install-time schema registration as we're a packaging system so this
+# happens in the postinst script, not at install time.  Set both the configure
+# script option and the traditional envionment variable just to make sure.
+EXTRA_OECONF += "--disable-schemas-install"
+export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL = "1"
+
 gconf_postinst() {
 if [ "x$D" != "x" ]; then
 	exit 1
-- 
1.7.7.6



