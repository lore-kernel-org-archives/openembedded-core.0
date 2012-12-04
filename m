Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw52-0008J9-I4
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:14:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0POl008433
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:25 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:25 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:44 -0600
Message-ID: <aa07bebf6709c035f16f505c4dd2863c43a52484.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 12/22] python-smartpm: style fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 17:15:09 -0000
Content-Type: text/plain

From: Paul Eggleton <paul.eggleton@linux.intel.com>

* Use ${PN} instead of python-smartpm
* Use multi-line strings instead of multiple single line += (also
  avoiding the confusing "_append +=")
* Use class-native instead of virtclass-native - no difference in
  behaviour, but this keeps things consistent if we have to add
  any target overrides in future.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python/python-smartpm_1.4.1.bb                 |   48 +++++++++----------
 1 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 9048bc8..ff153a7 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -28,13 +28,13 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 # Options - rpm, qt4, gtk
 PACKAGECONFIG ??= "rpm"
 
-RPM_RDEP = "python-smartpm-backend-rpm"
-QT_RDEP = "python-smartpm-interface-qt4"
-GTK_RDEP = "python-smartpm-interface-gtk"
+RPM_RDEP = "${PN}-backend-rpm"
+QT_RDEP = "${PN}-interface-qt4"
+GTK_RDEP = "${PN}-interface-gtk"
 
-RPM_RDEP_virtclass-native = ""
-QT_RDEP_virtclass-native = ""
-GTK_RDEP_virtclass-native = ""
+RPM_RDEP_class-native = ""
+QT_RDEP_class-native = ""
+GTK_RDEP_class-native = ""
 
 PACKAGECONFIG[rpm] = ",,rpm,${RPM_RDEP}"
 PACKAGECONFIG[qt4] = ",,qt4-x11,${QT_RDEP}"
@@ -85,35 +85,33 @@ do_install_append() {
    fi
 }
 
-PACKAGES  = "python-smartpm-dev python-smartpm-dbg python-smartpm-doc smartpm"
-PACKAGES += "${@base_contains('PACKAGECONFIG', 'rpm', 'python-smartpm-backend-rpm', '', d)}"
-PACKAGES += "${@base_contains('PACKAGECONFIG', 'qt4', 'python-smartpm-interface-qt4', '', d)}"
-PACKAGES += "${@base_contains('PACKAGECONFIG', 'gtk', 'python-smartpm-interface-gtk', '', d)}"
-PACKAGES += "python-smartpm-interface-images"
-PACKAGES += "python-smartpm"
+PACKAGES = "${PN}-dev ${PN}-dbg ${PN}-doc smartpm \
+            ${@base_contains('PACKAGECONFIG', 'rpm', '${PN}-backend-rpm', '', d)} \
+            ${@base_contains('PACKAGECONFIG', 'qt4', '${PN}-interface-qt4', '', d)} \
+            ${@base_contains('PACKAGECONFIG', 'gtk', '${PN}-interface-gtk', '', d)} \
+            ${PN}-interface-images ${PN}"
 
-RDEPENDS_smartpm = 'python-smartpm'
+RDEPENDS_smartpm = "${PN}"
 
-RDEPENDS_python-smartpm_append = " python-smartpm-backend-rpm python-codecs python-textutils python-xml"
-RDEPENDS_python-smartpm_append += " python-fcntl python-pickle python-crypt python-compression python-shell"
-RDEPENDS_python-smartpm_append += " python-resource python-netclient python-threading python-unixadmin"
+RDEPENDS_${PN} += "${PN}-backend-rpm python-codecs python-textutils python-xml python-fcntl \
+                   python-pickle python-crypt python-compression python-shell \
+                   python-resource python-netclient python-threading python-unixadmin"
+RDEPENDS_${PN}_class-native = ""
 
-#RDEPENDS_python-smartpm_append += " python-modules"
+RDEPENDS_${PN}-backend-rpm = "python-rpm"
 
-RDEPENDS_python-smartpm-backend-rpm = 'python-rpm'
-
-RDEPENDS_python-smartpm-interface-qt4 = 'qt4-x11 python-smartpm-interface-images'
-RDEPENDS_python-smartpm-interface-gtk = 'gtk+ python-smartpm-interface-images'
+RDEPENDS_${PN}-interface-qt4 = "qt4-x11 ${PN}-interface-images"
+RDEPENDS_${PN}-interface-gtk = "gtk+ ${PN}-interface-images"
 
 FILES_smartpm = "${bindir}/smart"
 
 FILES_${PN}-dbg += "${libdir}/python*/site-packages/smart/backends/rpm/.debug"
 
-FILES_python-smartpm-backend-rpm = "${libdir}/python*/site-packages/smart/backends/rpm"
+FILES_${PN}-backend-rpm = "${libdir}/python*/site-packages/smart/backends/rpm"
 
-FILES_python-smartpm-interface-qt4 = "${libdir}/python*/site-packages/smart/interfaces/qt4"
-FILES_python-smartpm-interface-gtk = "${libdir}/python*/site-packages/smart/interfaces/gtk"
-FILES_python-smartpm-interface-images = "${datadir}/${baselib}/python*/site-packages/smart/interfaces/images"
+FILES_${PN}-interface-qt4 = "${libdir}/python*/site-packages/smart/interfaces/qt4"
+FILES_${PN}-interface-gtk = "${libdir}/python*/site-packages/smart/interfaces/gtk"
+FILES_${PN}-interface-images = "${datadir}/${baselib}/python*/site-packages/smart/interfaces/images"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.3.4



