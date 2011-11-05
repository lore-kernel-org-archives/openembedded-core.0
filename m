Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3m-00065C-Po
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:39 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625145"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:58 -0700
Message-Id: <56913716c34a60f4a11f5365869baa4c74277153.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 28/28] lighttpd 1.4.29: rename index.html to avoid clashes with DL_DIR
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
X-List-Received-Date: Sat, 05 Nov 2011 17:32:03 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

As Martin Jansa pointed out before, bitbake will silently peek in DL_DIR before FILESPATH and use files from there if found.

The failure mode for lighttpd involves a 404 redirect placing index.html into DL_DIR, which will end up in the lighttpd packages. In my specific case iproute2 hit the linuxfoundation 404 redirect so lighttpd.ipk now serves the linuxfoundation frontpage :)

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../files/{index.html => index.html.lighttpd}      |    0
 meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb  |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lighttpd/files/{index.html => index.html.lighttpd} (100%)

diff --git a/meta/recipes-extended/lighttpd/files/index.html b/meta/recipes-extended/lighttpd/files/index.html.lighttpd
similarity index 100%
rename from meta/recipes-extended/lighttpd/files/index.html
rename to meta/recipes-extended/lighttpd/files/index.html.lighttpd
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
index c1d5f81..9fdb5f6 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.29.bb
@@ -16,10 +16,10 @@ RDEPENDS_${PN} += " \
                lighttpd-module-staticfile \
 "
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
-        file://index.html \
+        file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
 "
@@ -48,7 +48,7 @@ do_install_append() {
     install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/dav ${D}/www/var
     install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/index.html ${D}/www/pages/
+    install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
 }
 
 FILES_${PN} += "${sysconfdir} /www"
-- 
1.7.6.4



