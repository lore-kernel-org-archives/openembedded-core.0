Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuQ-00028l-6s
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949318"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:04 -0700
Message-Id: <edc298bc9044cf6edc3fa3a91584a8e8008c23ba.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 14/35] cups: add pam support
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
X-List-Received-Date: Wed, 27 Jul 2011 07:52:03 -0000

From: Kang Kai <kai.kang@windriver.com>

According to distro_feature then add pam support for cups or not.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/cups/cups_1.4.6.bb |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/cups/cups_1.4.6.bb b/meta/recipes-extended/cups/cups_1.4.6.bb
index 86b5340..fd20dcc 100644
--- a/meta/recipes-extended/cups/cups_1.4.6.bb
+++ b/meta/recipes-extended/cups/cups_1.4.6.bb
@@ -1,7 +1,8 @@
 require cups14.inc
 
-PR = "r0"
-DEPENDS += "libusb"
+PR = "r1"
+DEPENDS += "libusb \
+       ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=956e7600195e6139f12de8c2a5bbefa9"
 SRC_URI += " \
@@ -12,6 +13,7 @@ SRC_URI += " \
 SRC_URI[md5sum] = "de8fb5a29c36554925c0c6a6e2c0dae1"
 SRC_URI[sha256sum] = "f08711702a77b52c7150f96fe1f45482f6151cb95ef601268c528607fe6ad514"
 
-EXTRA_OECONF += " --disable-gssapi --enable-debug --disable-relro --enable-libusb"
+EXTRA_OECONF += " --disable-gssapi --enable-debug --disable-relro --enable-libusb \
+       ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
 
 CONFFILES_${PN} += "${sysconfdir}/cups/cupsd.conf"
-- 
1.7.3.4



