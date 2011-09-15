Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R42Uv-0001UX-1g
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 05:20:21 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 20:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,384,1312182000"; d="scan'208";a="17264347"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2011 20:15:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 20:14:52 -0700
Message-Id: <30ac4e6f9f11d34462d37996e7f9f688e2933c69.1316056194.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [RC2 PULL 03/13] qt4: add blacklist-diginotar-certs patch
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
X-List-Received-Date: Thu, 15 Sep 2011 03:20:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Eric Bénard <eric@eukrea.com>

- this patch comes from Nokia and blacklist all DigiNotar intermediates
and root certificates, more details are available here :
http://labs.qt.nokia.com/2011/09/07/what-the-diginotar-security-breach-means-for-qt-users-continued/

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 .../qt4/files/blacklist-diginotar-certs.diff       |   95 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.3.inc                   |    1 +
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-native.inc                 |    2 +-
 meta/recipes-qt/qt4/qt4-native_4.7.3.bb            |    2 +
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |    2 +-
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb   |    2 +
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 8 files changed, 104 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/blacklist-diginotar-certs.diff

diff --git a/meta/recipes-qt/qt4/files/blacklist-diginotar-certs.diff b/meta/recipes-qt/qt4/files/blacklist-diginotar-certs.diff
new file mode 100644
index 0000000..4d88ae2
--- /dev/null
+++ b/meta/recipes-qt/qt4/files/blacklist-diginotar-certs.diff
@@ -0,0 +1,95 @@
+http://labs.qt.nokia.com/2011/09/02/what-the-diginotar-security-breach-means-for-qt-users/
+http://labs.qt.nokia.com/2011/09/07/what-the-diginotar-security-breach-means-for-qt-users-continued/
+
+Original Author:Nokia
+Upstream-Status: Integrated in upcoming versions
+
+diff --git a/src/network/ssl/qsslcertificate.cpp b/src/network/ssl/qsslcertificate.cpp
+index 328c5c2..1ae98f4 100644
+--- a/src/network/ssl/qsslcertificate.cpp
++++ b/src/network/ssl/qsslcertificate.cpp
+@@ -803,22 +803,47 @@ QList<QSslCertificate> QSslCertificatePrivate::certificatesFromDer(const QByteAr
+ // These certificates are known to be fraudulent and were created during the comodo
+ // compromise. See http://www.comodo.com/Comodo-Fraud-Incident-2011-03-23.html
+ static const char *certificate_blacklist[] = {
+-    "04:7e:cb:e9:fc:a5:5f:7b:d0:9e:ae:36:e1:0c:ae:1e",
+-    "f5:c8:6a:f3:61:62:f1:3a:64:f5:4f:6d:c9:58:7c:06",
+-    "d7:55:8f:da:f5:f1:10:5b:b2:13:28:2b:70:77:29:a3",
+-    "39:2a:43:4f:0e:07:df:1f:8a:a3:05:de:34:e0:c2:29",
+-    "3e:75:ce:d4:6b:69:30:21:21:88:30:ae:86:a8:2a:71",
+-    "e9:02:8b:95:78:e4:15:dc:1a:71:0a:2b:88:15:44:47",
+-    "92:39:d5:34:8f:40:d1:69:5a:74:54:70:e1:f2:3f:43",
+-    "b0:b7:13:3e:d0:96:f9:b5:6f:ae:91:c8:74:bd:3a:c0",
+-    "d8:f3:5f:4e:b7:87:2b:2d:ab:06:92:e3:15:38:2f:b0",
++    "04:7e:cb:e9:fc:a5:5f:7b:d0:9e:ae:36:e1:0c:ae:1e", "mail.google.com", // Comodo
++    "f5:c8:6a:f3:61:62:f1:3a:64:f5:4f:6d:c9:58:7c:06", "www.google.com", // Comodo
++    "d7:55:8f:da:f5:f1:10:5b:b2:13:28:2b:70:77:29:a3", "login.yahoo.com", // Comodo
++    "39:2a:43:4f:0e:07:df:1f:8a:a3:05:de:34:e0:c2:29", "login.yahoo.com", // Comodo
++    "3e:75:ce:d4:6b:69:30:21:21:88:30:ae:86:a8:2a:71", "login.yahoo.com", // Comodo
++    "e9:02:8b:95:78:e4:15:dc:1a:71:0a:2b:88:15:44:47", "login.skype.com", // Comodo
++    "92:39:d5:34:8f:40:d1:69:5a:74:54:70:e1:f2:3f:43", "addons.mozilla.org", // Comodo
++    "b0:b7:13:3e:d0:96:f9:b5:6f:ae:91:c8:74:bd:3a:c0", "login.live.com", // Comodo
++    "d8:f3:5f:4e:b7:87:2b:2d:ab:06:92:e3:15:38:2f:b0", "global trustee", // Comodo
++
++    "05:e2:e6:a4:cd:09:ea:54:d6:65:b0:75:fe:22:a2:56", "*.google.com", // leaf certificate issued by DigiNotar
++    "0c:76:da:9c:91:0c:4e:2c:9e:fe:15:d0:58:93:3c:4c", "DigiNotar Root CA", // DigiNotar root
++    "f1:4a:13:f4:87:2b:56:dc:39:df:84:ca:7a:a1:06:49", "DigiNotar Services CA", // DigiNotar intermediate signed by DigiNotar Root
++    "36:16:71:55:43:42:1b:9d:e6:cb:a3:64:41:df:24:38", "DigiNotar Services 1024 CA", // DigiNotar intermediate signed by DigiNotar Root
++    "0a:82:bd:1e:14:4e:88:14:d7:5b:1a:55:27:be:bf:3e", "DigiNotar Root CA G2", // other DigiNotar Root CA
++    "a4:b6:ce:e3:2e:d3:35:46:26:3c:b3:55:3a:a8:92:21", "CertiID Enterprise Certificate Authority", // DigiNotar intermediate signed by "DigiNotar Root CA G2"
++    "5b:d5:60:9c:64:17:68:cf:21:0e:35:fd:fb:05:ad:41", "DigiNotar Qualified CA", // DigiNotar intermediate signed by DigiNotar Root
++
++    "1184640176",                                      "DigiNotar Services 1024 CA", // DigiNotar intermediate cross-signed by Entrust
++    "120000525",                                       "DigiNotar Cyber CA", // DigiNotar intermediate cross-signed by CyberTrust
++    "120000505",                                       "DigiNotar Cyber CA", // DigiNotar intermediate cross-signed by CyberTrust
++    "120000515",                                       "DigiNotar Cyber CA", // DigiNotar intermediate cross-signed by CyberTrust
++    "20015536",                                        "DigiNotar PKIoverheid CA Overheid en Bedrijven", // DigiNotar intermediate cross-signed by the Dutch government
++    "20001983",                                        "DigiNotar PKIoverheid CA Organisatie - G2", // DigiNotar intermediate cross-signed by the Dutch government
++    "d6:d0:29:77:f1:49:fd:1a:83:f2:b9:ea:94:8c:5c:b4", "DigiNotar Extended Validation CA", // DigiNotar intermediate signed by DigiNotar EV Root
++    "1e:7d:7a:53:3d:45:30:41:96:40:0f:71:48:1f:45:04", "DigiNotar Public CA 2025", // DigiNotar intermediate
++//    "(has not been seen in the wild so far)", "DigiNotar Public CA - G2", // DigiNotar intermediate
++//    "(has not been seen in the wild so far)", "Koninklijke Notariele Beroepsorganisatie CA", // compromised during DigiNotar breach
++//    "(has not been seen in the wild so far)", "Stichting TTP Infos CA," // compromised during DigiNotar breach
++    "1184640175", "DigiNotar Root CA", // DigiNotar intermediate cross-signed by Entrust
++    "1184644297", "DigiNotar Root CA", // DigiNotar intermediate cross-signed by Entrust
+     0
+ };
+ 
+ bool QSslCertificatePrivate::isBlacklisted(const QSslCertificate &certificate)
+ {
+     for (int a = 0; certificate_blacklist[a] != 0; a++) {
+-        if (certificate.serialNumber() == certificate_blacklist[a])
++        QString blacklistedCommonName = QString::fromUtf8(certificate_blacklist[(a+1)]);
++        if (certificate.serialNumber() == certificate_blacklist[a++] &&
++            (certificate.subjectInfo(QSslCertificate::CommonName) == blacklistedCommonName ||
++             certificate.issuerInfo(QSslCertificate::CommonName) == blacklistedCommonName))
+             return true;
+     }
+     return false;
+diff --git a/src/network/ssl/qsslsocket_openssl.cpp b/src/network/ssl/qsslsocket_openssl.cpp
+index 141d80a..b8e6c4c 100644
+--- a/src/network/ssl/qsslsocket_openssl.cpp
++++ b/src/network/ssl/qsslsocket_openssl.cpp
+@@ -1193,12 +1193,16 @@ bool QSslSocketBackendPrivate::startHandshake()
+     X509 *x509 = q_SSL_get_peer_certificate(ssl);
+     configuration.peerCertificate = QSslCertificatePrivate::QSslCertificate_from_X509(x509);
+     q_X509_free(x509);
+-    if (QSslCertificatePrivate::isBlacklisted(configuration.peerCertificate)) {
+-        q->setErrorString(QSslSocket::tr("The peer certificate is blacklisted"));
+-        q->setSocketError(QAbstractSocket::SslHandshakeFailedError);
+-        emit q->error(QAbstractSocket::SslHandshakeFailedError);
+-        plainSocket->disconnectFromHost();
+-        return false;
++
++    // check the whole chain for blacklisting (including root, as we check for subjectInfo and issuer)
++    foreach (const QSslCertificate &cert, configuration.peerCertificateChain) {
++        if (QSslCertificatePrivate::isBlacklisted(cert)) {
++            q->setErrorString(QSslSocket::tr("The peer certificate is blacklisted"));
++            q->setSocketError(QAbstractSocket::SslHandshakeFailedError);
++            emit q->error(QAbstractSocket::SslHandshakeFailedError);
++            plainSocket->disconnectFromHost();
++            return false;
++        }
+     }
+ 
+     // Start translating errors.
diff --git a/meta/recipes-qt/qt4/qt-4.7.3.inc b/meta/recipes-qt/qt4/qt-4.7.3.inc
index c58679f..a5b8b05 100644
--- a/meta/recipes-qt/qt4/qt-4.7.3.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.3.inc
@@ -12,6 +12,7 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://0008-qt-lib-infix.patch \
            file://0009-support-2bpp.patch \
            file://0001-Added-Openembedded-crossarch-option.patch \
+           file://blacklist-diginotar-certs.diff \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index d464a1d..9914c61 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1 | GPLv3"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r29"
+INC_PR = "r30"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 7ed6a63..59c0059 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
-INC_PR = "r11"
+INC_PR = "r12"
 
 inherit native
 
diff --git a/meta/recipes-qt/qt4/qt4-native_4.7.3.bb b/meta/recipes-qt/qt4/qt4-native_4.7.3.bb
index 5c84d4d..e90a7ba 100644
--- a/meta/recipes-qt/qt4/qt4-native_4.7.3.bb
+++ b/meta/recipes-qt/qt4/qt4-native_4.7.3.bb
@@ -2,6 +2,8 @@ require qt4-native.inc
 
 PR = "${INC_PR}.1"
 
+SRC_URI += "file://blacklist-diginotar-certs.diff"
+
 # Find the g++.conf/linux.conf in the right directory.
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index 068528e..6c396a5 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
index d61f312..e2a4539 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
@@ -2,5 +2,7 @@ require qt4-tools-nativesdk.inc
 
 PR = "${INC_PR}.0"
 
+SRC_URI += "file://blacklist-diginotar-certs.diff"
+
 SRC_URI[md5sum] = "49b96eefb1224cc529af6fe5608654fe"
 SRC_URI[sha256sum] = "d02b6fd69d089c01f4a787aa18175d074ccaecf8980a5956e328c2991905937e"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 234cb89..0a714be 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r26"
+INC_PR = "r27"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
-- 
1.7.6



