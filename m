Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53884606D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 08:32:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6K8Wd7J021582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 01:32:42 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jul 2016 01:32:38 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2016 04:32:35 -0400
Message-ID: <ab51c283d03e9c021477f0a90d5604e7de1e83ae.1468998858.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1468998858.git.dengke.du@windriver.com>
References: <cover.1468998858.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] LSB: 4.1.0 -> 5.0
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
X-List-Received-Date: Wed, 20 Jul 2016 08:32:43 -0000
Content-Type: text/plain

According to the LSB 5.0 Release Notes, FHS Released, Qt3 removed
and evoloved its module strategy which you can access from the
site:
	https://wiki.linuxfoundation.org/en/ReleaseNotes50

So we make two changes to comply with the LSB 5.0:
1. Remove the lsb-test-qt3-azov-*.rpm test package and delete the
   test session.
2. Update the test packages.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh      |  3 +-
 meta/recipes-extended/lsb/lsbtest/packages_list    | 57 +++++++++++-----------
 meta/recipes-extended/lsb/lsbtest/session          |  9 ----
 .../packagegroups/packagegroup-core-lsb.bb         | 11 -----
 4 files changed, 29 insertions(+), 51 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
index b9971a1..c31a3eb 100644
--- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
+++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
@@ -113,7 +113,7 @@ fi
 #fi
 
 SERVER1="\
-	http://${SERVER_NAME}/pub/lsb/base/${LSB_RELEASE}/binary"
+	http://${SERVER_NAME}/pub/lsb/base/released-all/binary"	
 SERVER2="\
 	http://${SERVER_NAME}/pub/lsb/test_suites/released-all/binary/runtime"
 SERVER3="\
@@ -429,7 +429,6 @@ cat > /etc/rpm/sysinfo/Dirnames << EOF
 /opt/lsb/test/desktop/freetype
 /opt/lsb/test/desktop/gtkvts
 /opt/lsb/test/desktop/libpng
-/opt/lsb/test/desktop/qt3
 /opt/lsb/test/desktop/xft
 /opt/lsb/test/desktop/xml
 /opt/lsb/test/desktop/xrender
diff --git a/meta/recipes-extended/lsb/lsbtest/packages_list b/meta/recipes-extended/lsb/lsbtest/packages_list
index 27d8352..959f931 100644
--- a/meta/recipes-extended/lsb/lsbtest/packages_list
+++ b/meta/recipes-extended/lsb/lsbtest/packages_list
@@ -1,4 +1,4 @@
-LSB_RELEASE="released-4.1.0"
+LSB_RELEASE="released-5.0"
 LSB_ARCH="lsbarch"
 
 BASE_PACKAGES_LIST="lsb-setup-4.1.0-1.noarch.rpm"
@@ -9,36 +9,35 @@ RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-5.0.0.1-1.targetarch.rpm \
 	lsb-xvfb-1.2.0-22.targetarch.rpm \
 	"
 
-RUNTIME_PACKAGES_LIST="lsb-cmdchk-4.1.4-5.targetarch.rpm \
-	lsb-libchk-4.1.4-5.targetarch.rpm \
-	lsb-qm-2.2-12.lsb4.targetarch.rpm \
-	lsb-task-dist-testkit-4.1.9-1.noarch.rpm \
-	lsb-test-core-4.1.15-1.targetarch.rpm \
-	lsb-test-cpp-t2c-4.1.0-1.targetarch.rpm \
-	lsb-test-desktop-4.1.9-1.targetarch.rpm \
-	lsb-test-desktop-t2c-4.1.3-3.targetarch.rpm \
-	lsb-test-libstdcpp-4.1.0-18.lsb4.targetarch.rpm \
-	lsb-test-olver-core-4.1.4-1.targetarch.rpm \
-	lsb-test-perl-4.1.8-1.noarch.rpm \
-	lsb-test-printing-4.1.2-1.targetarch.rpm \
-	lsb-test-python-4.1.5-1.targetarch.rpm \
-	lsb-test-qt3-azov-4.1.1-3.targetarch.rpm \
-	lsb-test-qt4-azov-4.1.3-1.targetarch.rpm \
-	lsb-test-xts5-5.1.5-45.lsb4.targetarch.rpm \
-	lsb-test-alsa-t2c-4.1.0-1.targetarch.rpm \
-	lsb-test-core-t2c-4.1.2-3.targetarch.rpm \
-	lsb-test-xml2-azov-4.1.0-1.targetarch.rpm \
+RUNTIME_PACKAGES_LIST="lsb-cmdchk-5.0.3-1.targetarch.rpm \
+	lsb-libchk-5.0.3-1.targetarch.rpm \
+	lsb-qm-2.2-1.lsb5.targetarch.rpm \
+	lsb-task-dist-testkit-5.0.0-2.noarch.rpm \
+	lsb-test-core-5.0.1-1.targetarch.rpm \
+	lsb-test-cpp-t2c-5.0.0-1.targetarch.rpm \
+	lsb-test-desktop-5.0.0-1.targetarch.rpm \
+	lsb-test-desktop-t2c-5.0.0-1.targetarch.rpm \
+	lsb-test-libstdcpp-4.1.0-22.lsb1.targetarch.rpm \
+	lsb-test-olver-core-5.0.0-1.targetarch.rpm \
+	lsb-test-perl-5.0.2-1.noarch.rpm \
+	lsb-test-printing-5.0.1-1.targetarch.rpm \
+	lsb-test-python-5.0.0-1.targetarch.rpm \
+	lsb-test-qt4-azov-5.0.0-1.targetarch.rpm \
+	lsb-test-xts5-5.1.5-47.lsb5.targetarch.rpm \
+	lsb-test-alsa-t2c-5.1.91-4.targetarch.rpm \
+	lsb-test-core-t2c-5.0.1-1.targetarch.rpm \
+	lsb-test-xml2-azov-5.0.0-1.targetarch.rpm \
 	"
 
-APP_PACKAGES_LIST="lsb-python-2.4.6-7.lsb4.targetarch.rpm \
-	lsb-apache-2.2.14-8.lsb4.targetarch.rpm \
-	lsb-tcl-8.5.7-8.lsb4.targetarch.rpm \
-	lsb-expect-5.43.0-13.lsb4.targetarch.rpm \
-	lsb-groff-1.20.1-7.lsb4.targetarch.rpm \
-	lsb-raptor-1.4.19-5.lsb4.targetarch.rpm \
-	lsb-xpdf-1.01-14.lsb4.targetarch.rpm \
-	lsb-samba-3.4.3-9.lsb4.targetarch.rpm \
-	lsb-rsync-3.0.6-6.lsb4.targetarch.rpm \
+APP_PACKAGES_LIST="lsb-python-2.4.6-10.lsb5.targetarch.rpm \
+	lsb-apache-2.2.19-5.lsb5.targetarch.rpm \
+	lsb-tcl-8.5.9-21.lsb5.targetarch.rpm \
+	lsb-expect-5.43.0-21.lsb5.targetarch.rpm \
+	lsb-groff-1.20.1-9.lsb5.targetarch.rpm \
+	lsb-raptor-1.4.21-4.lsb5.targetarch.rpm \
+	lsb-xpdf-1.01-17.lsb5.targetarch.rpm \
+	lsb-samba-3.5.9-5.lsb5.targetarch.rpm \
+	lsb-rsync-3.0.8-3.lsb5.targetarch.rpm \
 	"
 
 APP_TESTFILES_LIST="expect-tests.tar \
diff --git a/meta/recipes-extended/lsb/lsbtest/session b/meta/recipes-extended/lsb/lsbtest/session
index 85ca2ef..3abcca7 100644
--- a/meta/recipes-extended/lsb/lsbtest/session
+++ b/meta/recipes-extended/lsb/lsbtest/session
@@ -126,15 +126,6 @@ VERSION: local|*
 AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/python
 AUTOREPLY_RESULTS_DIR: /opt/lsb/test/python/results
 
-[qt3-azov]
-RUN: 1
-VERSION: local|*
-
-[qt3-azov|local|*]
-AUTOREPLY_TESTSUITE_DIR: /opt/lsb/test/qt3-azov
-AUTOREPLY_X11_FONT_PATH: [default]
-AUTOREPLY_RESULTS_DIR: /opt/lsb/test/qt3-azov/results
-
 [qt4-azov]
 RUN: 1
 VERSION: local|*
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 5a32c52..29564e0 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -200,16 +200,6 @@ RDEPENDS_packagegroup-core-lsb-python = "\
     python-misc \
 "
 
-def get_libqt3(d):
-    if 'linuxstdbase' in d.getVar('DISTROOVERRIDES', False) or "":
-        if 'qt3' in d.getVar('BBFILE_COLLECTIONS', False) or "":
-            return 'libqt-mt3'
-
-        bb.warn('The meta-qt3 layer should be added, this layer provides Qt 3.x ' \
-                'libraries. Its intended use is for passing LSB tests as Qt3 is ' \
-                'a requirement for LSB.')
-    return ''
-
 QT4PKGS = " \
     libqtcore4 \
     libqtgui4 \
@@ -254,7 +244,6 @@ RDEPENDS_packagegroup-core-lsb-desktop = "\
     atk \
     libasound \
     ${@get_libqt4(d)} \
-    ${@get_libqt3(d)} \
 "
 
 RDEPENDS_packagegroup-core-lsb-runtime-add = "\
-- 
2.8.1


