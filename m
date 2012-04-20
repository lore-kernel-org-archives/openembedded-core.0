Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7M-0005xk-T1
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2012 09:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167846"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:03 -0700
Message-Id: <84638f350dd458683ebbf4d4c23fddf566468c4f.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/43] openssh: Use update-alternatives
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:34 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Use the MANUAL_ALTERNATIVE_LINKS to ensure the update-alternative
references are properly added to the packages provides.

Also fix the RPROVIDES, as they are package split specific!

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh_5.9p1.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_5.9p1.bb b/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
index 749f89e..6ed1276 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
@@ -7,12 +7,13 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=bae9a689be41581503bcf95d8fb42c4e"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-RPROVIDES = "ssh sshd"
+RPROVIDES_${PN}-ssh = "ssh"
+RPROVIDES_${PN}-sshd = "sshd"
 
 CONFLICTS_${PN} = "dropbear"
 RCONFLICTS_${PN}-sshd = "dropbear"
@@ -29,7 +30,7 @@ PAM_SRC_URI = "file://sshd"
 SRC_URI[md5sum] = "afe17eee7e98d3b8550cc349834a85d0"
 SRC_URI[sha256sum] = "8d3e8b6b6ff04b525a6dfa6fdeb6a99043ccf6c3310cc32eba84c939b07777d5"
 
-inherit useradd update-rc.d
+inherit useradd update-rc.d update-alternatives
 
 USERADD_PACKAGES = "${PN}-sshd"
 USERADD_PARAM_${PN}-sshd = "--system --no-create-home --home-dir /var/run/sshd --shell /bin/false --user-group sshd"
@@ -99,6 +100,8 @@ RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 DEPENDS_${PN}-sshd += "update-rc.d"
 RDEPENDS_${PN}-sshd += "update-rc.d ${PN}-keygen"
 
+MANUAL_ALTERNATIVE_LINKS = "${bindir}/scp ${bindir}/ssh"
+
 pkg_postinst_${PN}-scp () {
 	update-alternatives --install ${bindir}/scp scp scp.${PN} 90
 }
-- 
1.7.7.6



