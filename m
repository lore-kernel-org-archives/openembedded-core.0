Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TYlYC-0000MD-IA
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 23:35:22 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Nov 2012 14:21:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,252,1352102400"; d="scan'208";a="168490590"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.71])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Nov 2012 14:21:07 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 14:21:02 -0800
Message-Id: <8bd2eee2dff901be6e3a2fdbf657acc4dd627fb0.1352931528.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
In-Reply-To: <cover.1352931528.git.sgw@linux.intel.com>
References: <cover.1352931528.git.sgw@linux.intel.com>
Subject: [PATCH 09/10] builder: Add password for user
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
X-List-Received-Date: Wed, 14 Nov 2012 22:35:29 -0000

This is needed to allow openssh to work correctly for the Eclipse
plugin to have access to the build appliance to view/modify recipes
and lauch builds

Default password is "builder"

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 5c12c14..41871d6 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "New user to do specific job"
 DESCRIPTION = "This recipe create a new user named ${PN}, who is used for specific jobs like building. The task can be auto started via mini X"
 SECTION = "x11"
-PR = "r4"
+PR = "r5"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://builder_hob_start.sh;endline=5;md5=84796c3c41785d86100fdabcbdade00e"
 
@@ -15,10 +15,13 @@ RDEPENDS_${PN} = "mini-x-session"
 
 inherit useradd
 
+# builder user password is "builder"
+BUILDER_PASSWORD ?= ".gLibiNXn0P12"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --create-home \
                        --groups video,tty,audio \
-                       --user-group ${PN}"
+                       --user-group ${PN} \
+                       --password ${BUILDER_PASSWORD}"
 
 do_install () {
 	install -d -m 755 ${D}${sysconfdir}/mini_x/session.d
-- 
1.7.7.6



