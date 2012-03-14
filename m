Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7qbA-0007Q0-Q2
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:58:49 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 08:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128937198"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2012 08:50:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 08:50:02 -0700
Message-Id: <1331740202-14767-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] gpgme: fix packaging warnings
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
X-List-Received-Date: Wed, 14 Mar 2012 15:58:49 -0000

Use rmdir since it is currently empty, and we can catch if
it gets used later

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gpgme/gpgme_1.3.1.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.3.1.bb b/meta/recipes-support/gpgme/gpgme_1.3.1.bb
index 9ffedba..4bcb57a 100644
--- a/meta/recipes-support/gpgme/gpgme_1.3.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.3.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "90afa8436ce2b2683c001c824bd22601"
 SRC_URI[sha256sum] = "15ef27a875ae0d79d7446fd931deda11438e724ffbeac74449ed19cba23df4d4"
 DEPENDS = "libgpg-error libassuan pth"
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
                 --with-gpg=${bindir}/gpg --without-gpgsm"
@@ -26,3 +26,7 @@ FILES_${PN}-pth = "${libdir}/libgpgme-pth.so.*"
 FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
 FILES_${PN} = "${libdir}/libgpgme.so.*"
 FILES_${PN}-dev += "${bindir}/gpgme-config ${datadir}/common-lisp/source/gpgme/*"
+
+do_install_append() {
+	rmdir ${D}/usr/libexec
+}
-- 
1.7.7.6



