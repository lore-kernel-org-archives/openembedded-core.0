Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TA76E-0007Ht-Vt
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 00:32:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Sep 2012 15:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,388,1344236400"; d="scan'208";a="190483368"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.76])
	by orsmga001.jf.intel.com with ESMTP; 07 Sep 2012 15:20:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2012 15:20:03 -0700
Message-Id: <1347056403-19501-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Cc: Marc Ferland <marc.ferland@gmail.com>
Subject: [PATCH] openssh: allow root login when debug-tweaks is enabled
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
X-List-Received-Date: Fri, 07 Sep 2012 22:32:31 -0000

This allows root to login over ssh with an empty password just like
dropbear when the debug-tweaks are enabled, it's important to disable
debug-tweaks for a production system as this will leave open a security
hole!

Thanks to Marc for the settings.
Cc: Marc Ferland <marc.ferland@gmail.com>

[Yocto #3078]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/openssh/openssh_6.0p1.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
index 31202d4..fcd082c 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
@@ -7,7 +7,7 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -75,6 +75,13 @@ do_install_append () {
 			install -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
 		fi
 	done
+	for i in ${IMAGE_FEATURES};
+	do
+		if [ ${i} = "debug-tweaks" ]; then
+			sed -i -e "s/^#PermitRootLogin/PermitRootLogin/" ${D}${sysconfdir}/ssh/sshd_config
+			sed -i -e "s/^#PermitEmptyPasswords no/PermitEmptyPasswords yes/" ${D}${sysconfdir}/ssh/sshd_config
+		fi
+	done
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/sshd
 	rm -f ${D}${bindir}/slogin ${D}${datadir}/Ssh.bin
-- 
1.7.7.6



