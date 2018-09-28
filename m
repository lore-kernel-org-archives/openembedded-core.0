Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCE4F78E49
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 03:18:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8S3Iabl010504
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 20:18:47 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 27 Sep 2018 20:18:26 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Sep 2018 11:18:24 +0800
Message-ID: <1538104704-210895-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] nativesdk-bison: Add to nativesdk-packagegroup-sdk-host and set BISON_PKGDATADIR
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
X-List-Received-Date: Fri, 28 Sep 2018 03:18:57 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

bison is needed when building kernel. Add it to nativesdk-packagegroup-sdk-host
and set BISON_PKGDATADIR for bison to use its components.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 meta/recipes-devtools/bison/bison_3.0.4.bb                         | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index e2f6169..448c2f6 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -25,6 +25,7 @@ RDEPENDS_${PN} = "\
     nativesdk-cmake \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
     nativesdk-sdk-provides-dummy \
+    nativesdk-bison \
     "
 
 RDEPENDS_${PN}_darwin = "\
diff --git a/meta/recipes-devtools/bison/bison_3.0.4.bb b/meta/recipes-devtools/bison/bison_3.0.4.bb
index cc155f0..f1b05da 100644
--- a/meta/recipes-devtools/bison/bison_3.0.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.0.4.bb
@@ -36,4 +36,8 @@ do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/bison \
 		BISON_PKGDATADIR=${STAGING_DATADIR_NATIVE}/bison
 }
+do_install_append_class-nativesdk() {
+	create_wrapper ${D}/${bindir}/bison \
+		BISON_PKGDATADIR=${datadir}/bison
+}
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


