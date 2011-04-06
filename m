Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Q7UCV-0004xh-6V
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 16:59:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Apr 2011 07:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,310,1299484800"; d="scan'208";a="675962176"
Received: from unknown (HELO helios) ([10.255.12.249])
	by fmsmga002.fm.intel.com with SMTP; 06 Apr 2011 07:57:12 -0700
Received: by helios (sSMTP sendmail emulation); Wed, 06 Apr 2011 15:57:10 +0100
Message-Id: <0e3f5affda50377cbf32bc168a0e6217bf4cb323.1302101718.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1302101718.git.paul.eggleton@linux.intel.com>
References: <cover.1302101718.git.paul.eggleton@linux.intel.com>
Old-Date: Wed, 30 Mar 2011 17:19:55 -0400
Date: Wed, 06 Apr 2011 15:57:10 +0100
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] qt4: security advisory - blacklist fraudulent comodo certificates
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
X-List-Received-Date: Wed, 06 Apr 2011 14:59:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Security advisory: Blacklist fraudulent certificates. More info is in the
patch and at the following links:
http://www.comodo.com/Comodo-Fraud-Incident-2011-03-23.html
http://qt.nokia.com/files/qt-patches/blacklist-fraudulent-comodo-certificates-patch.diff/view

(Imported from OE rev 61eeeec1224c4f974f9185c2b93eeb19d13938af)

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...klist-fraudulent-comodo-certificates-patch.diff |  134 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt-4.6.3.inc                   |    1 +
 meta/recipes-qt/qt4/qt-4.7.2.inc                   |    1 +
 meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb          |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb          |    2 +-
 7 files changed, 140 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/files/blacklist-fraudulent-comodo-certificates-patch.diff

diff --git a/meta/recipes-qt/qt4/files/blacklist-fraudulent-comodo-certificates-patch.diff b/meta/recipes-qt/qt4/files/blacklist-fraudulent-comodo-certificates-patch.diff
new file mode 100644
index 0000000..00faf75
--- /dev/null
+++ b/meta/recipes-qt/qt4/files/blacklist-fraudulent-comodo-certificates-patch.diff
@@ -0,0 +1,134 @@
+Security advisory: Fraudulent certificates
+
+Background:
+
+Recently a group of people managed to get fraudulent SSL certificates signed
+by a Certificate Authority (CA).
+
+These certificates potentially enable their owners to pretend to be other
+entities on the Web; the attackers can present valid certificates for e.g.
+mail.google.com, login.yahoo.com and login.live.com, among others.
+
+The patch below solves this problem by blacklisting those fake certificates
+and aborting an SSL handshake with entities that present these certificates.
+The patch applies to all 4.6 and 4.7 versions, and should be applied to all Qt
+4.6.x and 4.7.x versions; upcoming Qt releases will contain a fix for this
+problem.
+
+More technical background:
+
+In order to trick a user into establishing an SSL connection to a site using
+one of those fake certificates, in addition to controlling the certificate, an
+attacker would need to either control the DNS server used by the victim, or
+have control over a proxy that the victim uses. That way, the attacker could
+trick the victim to connect to the attacker?s site and then present the user
+with a valid certificate.
+
+One obvious question now is: Should those certificates not just be revoked,
+which would solve the problem?
+
+First, they have been revoked by the affected Certificate Authority (see above
+link).
+
+However, the problem in this case, and probably part of the reason why most
+browser vendors release new versions blacklisting those certificates, is that
+by default browsers do not treat invalid responses from an OCSP server (a
+server used for checking the revocation status of a certificate) as fatal, and
+will allow the SSL connection to proceed anyway. Qt itself does not support
+OCSP yet, which makes blacklisting the certificates the only valid option (now
+would be a good moment to vote on the task for implementing OCSP in Qt); since
+Qt is relying on the system root certificates since version 4.7, it cannot
+control the root certificates that Qt trusts automatically anymore.
+
+http://www.comodo.com/Comodo-Fraud-Incident-2011-03-23.html
+http://qt.nokia.com/files/qt-patches/blacklist-fraudulent-comodo-certificates-patch.diff/view
+
+diff --git a/src/network/ssl/qsslcertificate.cpp b/src/network/ssl/qsslcertificate.cpp
+index 618ac79..a5cdf01 100644
+--- a/src/network/ssl/qsslcertificate.cpp
++++ b/src/network/ssl/qsslcertificate.cpp
+@@ -219,17 +219,19 @@ bool QSslCertificate::isNull() const
+     Returns true if this certificate is valid; otherwise returns
+     false.
+ 
+-    Note: Currently, this function only checks that the current
++    Note: Currently, this function checks that the current
+     data-time is within the date-time range during which the
+-    certificate is considered valid. No other checks are
+-    currently performed.
++    certificate is considered valid, and checks that the
++    certificate is not in a blacklist of fraudulent certificates.
+ 
+     \sa isNull()
+ */
+ bool QSslCertificate::isValid() const
+ {
+     const QDateTime currentTime = QDateTime::currentDateTime();
+-    return currentTime >= d->notValidBefore && currentTime <= d->notValidAfter;
++    return currentTime >= d->notValidBefore &&
++            currentTime <= d->notValidAfter &&
++            ! QSslCertificatePrivate::isBlacklisted(*this);
+ }
+ 
+ /*!
+@@ -798,6 +800,30 @@ QList<QSslCertificate> QSslCertificatePrivate::certificatesFromDer(const QByteAr
+     return certificates;
+ }
+ 
++// These certificates are known to be fraudulent and were created during the comodo
++// compromise. See http://www.comodo.com/Comodo-Fraud-Incident-2011-03-23.html
++static const char *certificate_blacklist[] = {
++    "04:7e:cb:e9:fc:a5:5f:7b:d0:9e:ae:36:e1:0c:ae:1e",
++    "f5:c8:6a:f3:61:62:f1:3a:64:f5:4f:6d:c9:58:7c:06",
++    "d7:55:8f:da:f5:f1:10:5b:b2:13:28:2b:70:77:29:a3",
++    "39:2a:43:4f:0e:07:df:1f:8a:a3:05:de:34:e0:c2:29",
++    "3e:75:ce:d4:6b:69:30:21:21:88:30:ae:86:a8:2a:71",
++    "e9:02:8b:95:78:e4:15:dc:1a:71:0a:2b:88:15:44:47",
++    "92:39:d5:34:8f:40:d1:69:5a:74:54:70:e1:f2:3f:43",
++    "b0:b7:13:3e:d0:96:f9:b5:6f:ae:91:c8:74:bd:3a:c0",
++    "d8:f3:5f:4e:b7:87:2b:2d:ab:06:92:e3:15:38:2f:b0",
++    0
++};
++
++bool QSslCertificatePrivate::isBlacklisted(const QSslCertificate &certificate)
++{
++    for (int a = 0; certificate_blacklist[a] != 0; a++) {
++        if (certificate.serialNumber() == certificate_blacklist[a])
++            return true;
++    }
++    return false;
++}
++
+ #ifndef QT_NO_DEBUG_STREAM
+ QDebug operator<<(QDebug debug, const QSslCertificate &certificate)
+ {
+diff --git a/src/network/ssl/qsslcertificate_p.h b/src/network/ssl/qsslcertificate_p.h
+index cdceb0f..1ce33d3 100644
+--- a/src/network/ssl/qsslcertificate_p.h
++++ b/src/network/ssl/qsslcertificate_p.h
+@@ -96,6 +96,7 @@ public:
+     static QSslCertificate QSslCertificate_from_X509(X509 *x509);
+     static QList<QSslCertificate> certificatesFromPem(const QByteArray &pem, int count = -1);
+     static QList<QSslCertificate> certificatesFromDer(const QByteArray &der, int count = -1);
++    static bool isBlacklisted(const QSslCertificate &certificate);
+ 
+     friend class QSslSocketBackendPrivate;
+ 
+diff --git a/src/network/ssl/qsslsocket_openssl.cpp b/src/network/ssl/qsslsocket_openssl.cpp
+index 0866534..2427193 100644
+--- a/src/network/ssl/qsslsocket_openssl.cpp
++++ b/src/network/ssl/qsslsocket_openssl.cpp
+@@ -1193,6 +1193,13 @@ bool QSslSocketBackendPrivate::startHandshake()
+     X509 *x509 = q_SSL_get_peer_certificate(ssl);
+     configuration.peerCertificate = QSslCertificatePrivate::QSslCertificate_from_X509(x509);
+     q_X509_free(x509);
++    if (QSslCertificatePrivate::isBlacklisted(configuration.peerCertificate)) {
++        q->setErrorString(QSslSocket::tr("The peer certificate is blacklisted"));
++        q->setSocketError(QAbstractSocket::SslHandshakeFailedError);
++        emit q->error(QAbstractSocket::SslHandshakeFailedError);
++        plainSocket->disconnectFromHost();
++        return false;
++    }
+ 
+     // Start translating errors.
+     QList<QSslError> errors;
diff --git a/meta/recipes-qt/qt4/qt-4.6.3.inc b/meta/recipes-qt/qt4/qt-4.6.3.inc
index ec2c920..37a15f1 100644
--- a/meta/recipes-qt/qt4/qt-4.6.3.inc
+++ b/meta/recipes-qt/qt4/qt-4.6.3.inc
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
 SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+           file://blacklist-fraudulent-comodo-certificates-patch.diff \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0004-no-qmake.patch \
diff --git a/meta/recipes-qt/qt4/qt-4.7.2.inc b/meta/recipes-qt/qt4/qt-4.7.2.inc
index ed62bd3..0f75a46 100644
--- a/meta/recipes-qt/qt4/qt-4.7.2.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.2.inc
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
 FILESPATH =. "${FILE_DIRNAME}/qt-${PV}:"
 
 SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+           file://blacklist-fraudulent-comodo-certificates-patch.diff \
            file://0004-no-qmake.patch \
            file://hack-out-pg2-4.7.0.patch \
            file://0006-freetype-host-includes.patch \
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb b/meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb
index dd662aa..5e289d2 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb
@@ -3,7 +3,7 @@ require qt4-embedded.inc
 
 SRC_URI += "file://qthelp-lib-qtclucene.patch"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb
index b88b1e9..c3f6713 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb
@@ -1,7 +1,7 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb
index 8cf5449..9126284 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb
@@ -1,6 +1,6 @@
 require qt-${PV}.inc
 require qt4-x11-free.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 QT_CONFIG_FLAGS += " -xrandr "
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
index 359a756..75c6314 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
-- 
1.7.1



