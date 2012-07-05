Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Smtoc-0006Zb-1v
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 23:42:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Jul 2012 14:31:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164524809"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.176])
	by azsmga001.ch.intel.com with ESMTP; 05 Jul 2012 14:31:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 14:31:15 -0700
Message-Id: <1341523875-4758-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] gnutls: make sure native is patched for gettext version
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
X-List-Received-Date: Thu, 05 Jul 2012 21:42:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnutls/gnutls_2.12.20.bb |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls_2.12.20.bb b/meta/recipes-support/gnutls/gnutls_2.12.20.bb
index 248c90f..010f179 100644
--- a/meta/recipes-support/gnutls/gnutls_2.12.20.bb
+++ b/meta/recipes-support/gnutls/gnutls_2.12.20.bb
@@ -5,15 +5,8 @@ PR = "${INC_PR}.0"
 SRC_URI += "file://gnutls-openssl.patch \
             file://correct_rpl_gettimeofday_signature.patch \
             file://configure-fix.patch \
+            ${@['', 'file://fix-gettext-version.patch'][bb.data.inherits_class('native', d) or (not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1))]} \
            "
 
 SRC_URI[md5sum] = "f1dea97da5d4dcdbc675720c9aad9ee3"
 SRC_URI[sha256sum] = "4884eafcc8383ed23209199bbc72ad04f4eb94955a50a594125ff34c6889c564"
-
-python() {
-    if not ((d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1):
-        # if GPLv3 add patch
-        src_uri = (d.getVar("SRC_URI", False) or "").split()
-        src_uri.append("file://fix-gettext-version.patch")
-        d.setVar("SRC_URI", " ".join(src_uri))
-}
-- 
1.7.7.6



