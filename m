Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 2132 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Oct 2017 15:07:18 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 24EC178254
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 15:07:18 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v9CEVlbE030863
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 16:31:47 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.76.113])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v9CEVlng016434;
	Thu, 12 Oct 2017 16:31:47 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Oct 2017 16:31:39 +0200
Message-Id: <1507818699-26302-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] ca-certificates: move update-ca-certificates into separate package
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
X-List-Received-Date: Thu, 12 Oct 2017 15:07:20 -0000

This allows using the script in with an other certificate bundle even if
the user doesn't need all the certificates.

The scripts are still installed when the ca-certificates is installed
as it RDEPENDS ca-certificates-scripts.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-support/ca-certificates/ca-certificates_20170717.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
index 59e7d51..0413762 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
@@ -79,6 +79,10 @@ do_install_append_class-native () {
     SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
 }
 
-RDEPENDS_${PN} += "openssl"
+# This contains only the update script to be used without custom certificates
+PACKAGES =+ "${PN}-scripts"
+FILES_${PN}-scripts = "${sbindir}/ ${sysconfdir}/ca-certificates"
+RDEPENDS_${PN}-scripts += "openssl"
+RDEPENDS_${PN} += "${PN}-scripts"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


