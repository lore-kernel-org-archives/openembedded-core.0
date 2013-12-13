Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A8F286E40F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 18:10:16 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VrXBn-0005hO-Cb from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Dec 2013 10:10:15 -0800
Received: from ykhan.pkl.mentorg.com ([137.202.157.53]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 13 Dec 2013 10:10:14 -0800
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2013 23:08:54 +0500
Message-Id: <1386958134-20626-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.10.4
X-OriginalArrivalTime: 13 Dec 2013 18:10:15.0173 (UTC)
	FILETIME=[9294C350:01CEF82E]
Subject: [PATCH] openssl_1.0.1e: Install c_rehash utility with openssl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Dec 2013 18:10:18 -0000

From: mykhani <yasir_khan@mentor.com>

c_rehash utility is not being installed with openssl. It conveniently
generates hash and symbolic links based on it for CA certificates
stored locally for SSL based server authentication

Signed-off-by: mykhani <yasir_khan@mentor.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.1e.bb |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index ac27dba..f52877c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -4,6 +4,9 @@ require openssl.inc
 # if they are available.
 DEPENDS += "ocf-linux"
 
+# Perl is needed for the c_rehash script
+RDEPENDS_${PN} += "perl"
+
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
 PR = "${INC_PR}.0"
@@ -53,3 +56,10 @@ PARALLEL_MAKEINST = ""
 do_configure_prepend() {
   cp ${WORKDIR}/find.pl ${S}/util/find.pl
 }
+
+do_install_append() {
+    # The c_rehash utility isn't being installed by the normal installation process. 
+    # It conveniently generates both hash and symbolic links based on hash for CA certificates.
+    install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
+}
+
-- 
1.7.10.4


