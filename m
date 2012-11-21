Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TbGas-0005y0-Fp
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 21:08:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Nov 2012 11:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,294,1352102400"; d="scan'208";a="220785965"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.157])
	by azsmga001.ch.intel.com with ESMTP; 21 Nov 2012 11:54:14 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2012 21:54:24 +0200
Message-Id: <1353527664-4464-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1353527664-4464-1-git-send-email-cristian.iorga@intel.com>
References: <1353527664-4464-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 2/2] builder: fix adduser breakage with password
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
X-List-Received-Date: Wed, 21 Nov 2012 20:08:28 -0000

Build Appliance needs to have for the builder
user a password set. However, the useradd.bbclass
requires the last parameter to be the user's group
name. Previously, the password was the last
parameter to useradd command.
Fixed using the right order for parameters.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 41871d6..78d41e5 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "New user to do specific job"
 DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specific jobs like building. The task can be auto started via mini X"
 SECTION = "x11"
-PR = "r5"
+PR = "r6"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://builder_hob_start.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
 
@@ -20,8 +20,8 @@ BUILDER_PASSWORD ?= ".gLibiNXn0P12"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --create-home \
                        --groups video,tty,audio \
-                       --user-group ${PN} \
-                       --password ${BUILDER_PASSWORD}"
+                       --password ${BUILDER_PASSWORD} \
+                       --user-group ${PN}"
 
 do_install () {
 	install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
-- 
1.7.10.4



