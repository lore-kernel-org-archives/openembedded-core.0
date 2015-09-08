Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6411673232
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 09:38:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t889cKt7021637
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 02:38:20 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 02:38:20 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Sep 2015 17:33:02 +0800
Message-ID: <1441704782-23016-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] packagegroup-core-nfs: provide the nfs-client IMAGE_FEATURES
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
X-List-Received-Date: Tue, 08 Sep 2015 09:38:20 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

provide the nfs-client IMAGE_FEATURES, to ease a user to only
install nfs client related files to image

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/classes/core-image.bbclass                          | 2 ++
 meta/recipes-core/glibc/glibc-testing.inc                | 2 +-
 meta/recipes-core/packagegroups/packagegroup-core-nfs.bb | 6 +++++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 501456d..8e340d9 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -21,6 +21,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 # - tools-testapps      - tools usable to make some device tests
 # - tools-sdk           - SDK (C/C++ compiler, autotools, etc.)
 # - nfs-server          - NFS server
+# - nfs-client          - NFS client
 # - ssh-server-dropbear - SSH server (dropbear)
 # - ssh-server-openssh  - SSH server (openssh)
 # - qt4-pkgs            - Qt4/X11 and demo applications
@@ -42,6 +43,7 @@ FEATURE_PACKAGES_tools-profile = "packagegroup-core-tools-profile"
 FEATURE_PACKAGES_tools-testapps = "packagegroup-core-tools-testapps"
 FEATURE_PACKAGES_tools-sdk = "packagegroup-core-sdk packagegroup-core-standalone-sdk-target"
 FEATURE_PACKAGES_nfs-server = "packagegroup-core-nfs-server"
+FEATURE_PACKAGES_nfs-client = "packagegroup-core-nfs-client"
 FEATURE_PACKAGES_ssh-server-dropbear = "packagegroup-core-ssh-dropbear"
 FEATURE_PACKAGES_ssh-server-openssh = "packagegroup-core-ssh-openssh"
 FEATURE_PACKAGES_qt4-pkgs = "packagegroup-core-qt-demoapps"
diff --git a/meta/recipes-core/glibc/glibc-testing.inc b/meta/recipes-core/glibc/glibc-testing.inc
index fd1af39..a9bbf37 100644
--- a/meta/recipes-core/glibc/glibc-testing.inc
+++ b/meta/recipes-core/glibc/glibc-testing.inc
@@ -54,7 +54,7 @@ then
 	echo "1. You dont have passwordless ssh setup to access \$target"
 	echo "2. NFS share on \$target is not mounted or if mounted then not matching the build tree layout."
 	echo "   The tree should be accessible at same location on build host and target"
-	echo "   You can add nfs-server to IMAGE_FEATURES to get the nfs client on target"
+	echo "   You can add nfs-client to IMAGE_FEATURES to get the nfs client on target"
 	echo "3. nfs server on build host is not running."
 	echo "   Please make sure that you have 'no_root_squash' added in /etc/exports if you want"
 	echo "   to test as root user on target (usually its recommended to create a non"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 247a30e..1882d3a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -8,7 +8,11 @@ PR = "r2"
 
 inherit packagegroup
 
-PACKAGES = "${PN}-server"
+PROVIDES = "${PACKAGES}"
+PACKAGES = "${PN}-server ${PN}-client"
+
+SUMMARY_${PN}-client = "NFS client"
+RDEPENDS_${PN}-client = "nfs-utils-client"
 
 SUMMARY_${PN}-server = "NFS server"
 RDEPENDS_${PN}-server = "\
-- 
1.9.1


