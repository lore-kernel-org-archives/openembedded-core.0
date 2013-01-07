Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TsGOq-0002Si-1Z
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 18:22:13 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 714A5CA8AD9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2013 18:07:03 +0100 (CET)
Received: from e6520eb.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id DD9034B0178
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2013 18:06:58 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 18:06:57 +0100
Message-Id: <1357578417-3158-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH] qt4: blacklist untrusted SSL certificates
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
X-List-Received-Date: Mon, 07 Jan 2013 17:22:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- this blacklist wrong certificates
https://bugreports.qt-project.org/browse/QTBUG-24654
https://bugreports.qt-project.org/browse/QTBUG-28937
- these patches will be in the next 4.8.5 release

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/recipes-qt/qt4/qt4-4.8.4.inc                  |   2 +
 ...acklist-mis-issued-turktrust-certificates.patch | 108 +++++++++++++++=
++++++
 ...qtnetwork-blacklist-two-more-certificates.patch |  41 ++++++++
 meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb          |   2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb          |   2 +-
 5 files changed, 153 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0022-ssl-certificates-b=
lacklist-mis-issued-turktrust-certificates.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0023-qtnetwork-blacklis=
t-two-more-certificates.patch

diff --git a/meta/recipes-qt/qt4/qt4-4.8.4.inc b/meta/recipes-qt/qt4/qt4-=
4.8.4.inc
index 08173a1..0bc1062 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.4.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.4.inc
@@ -21,6 +21,8 @@ SRC_URI =3D "http://releases.qt-project.org/qt4/source/=
qt-everywhere-opensource-sr
            file://0018-configure-make-pulseaudio-a-configurable-option.p=
atch \
            file://0019-Fixes-for-gcc-4.7.0-particularly-on-qemux86.patch=
 \
            file://0020-webkit-disable-the-fuse-ld-gold-flag.patch \
+           file://0022-ssl-certificates-blacklist-mis-issued-turktrust-c=
ertificates.patch \
+           file://0023-qtnetwork-blacklist-two-more-certificates.patch \
            file://g++.conf \
            file://linux.conf \
            "
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0022-ssl-certificates-blacklis=
t-mis-issued-turktrust-certificates.patch b/meta/recipes-qt/qt4/qt4-4.8.4=
/0022-ssl-certificates-blacklist-mis-issued-turktrust-certificates.patch
new file mode 100644
index 0000000..8caef97
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0022-ssl-certificates-blacklist-mis-i=
ssued-turktrust-certificates.patch
@@ -0,0 +1,108 @@
+From 451462b1e0304e0cb6c2872e4f5688bc2e556dca Mon Sep 17 00:00:00 2001
+From: Peter Hartmann <phartmann@rim.com>
+Date: Fri, 4 Jan 2013 11:06:14 +0100
+Subject: [PATCH] SSL certificates: blacklist mis-issued Turktrust certif=
icates
+
+Those certificates have erroneously set the CA attribute to true,
+meaning everybody in possesion of their keys can issue certificates on
+their own.
+
+backport of bf5e7fb2652669599a508e049b46ebd5cd3206e5 from qtbase
+
+Task-number: QTBUG-28937
+Change-Id: Iee57c6f983fee61c13c3b66ed874300ef8e80c23
+Reviewed-by: Richard J. Moore <rich@kde.org>
+
+Upstream-Status: Accepted https://codereview.qt-project.org/#change,4396=
8
+---
+ src/network/ssl/qsslcertificate.cpp                |    3 ++
+ ...ted-turktrust-e-islem.kktcmerkezbankasi.org.pem |   24 +++++++++++++=
++
+ .../blacklisted-turktrust-ego.gov.tr.pem           |   31 +++++++++++++=
+++++++
+ 3 files changed, 58 insertions(+), 0 deletions(-)
+ create mode 100644 tests/auto/qsslcertificate/more-certificates/blackli=
sted-turktrust-e-islem.kktcmerkezbankasi.org.pem
+ create mode 100644 tests/auto/qsslcertificate/more-certificates/blackli=
sted-turktrust-ego.gov.tr.pem
+
+diff --git a/src/network/ssl/qsslcertificate.cpp b/src/network/ssl/qsslc=
ertificate.cpp
+index 038187f..37799d1 100644
+--- a/src/network/ssl/qsslcertificate.cpp
++++ b/src/network/ssl/qsslcertificate.cpp
+@@ -825,6 +825,9 @@ static const char *certificate_blacklist[] =3D {
+=20
+     "120001705", "Digisign Server ID (Enrich)", // (Malaysian) Digicert=
 Sdn. Bhd. cross-signed by Verizon CyberTrust
+     "1276011370", "Digisign Server ID - (Enrich)", // (Malaysian) Digic=
ert Sdn. Bhd. cross-signed by Entrust
++
++    "2087",                                            "*.EGO.GOV.TR", =
// Turktrust mis-issued intermediate certificate
++    "2148",                                            "e-islem.kktcmer=
kezbankasi.org", // Turktrust mis-issued intermediate certificate
+     0
+ };
+=20
+diff --git a/tests/auto/qsslcertificate/more-certificates/blacklisted-tu=
rktrust-e-islem.kktcmerkezbankasi.org.pem b/tests/auto/qsslcertificate/mo=
re-certificates/blacklisted-turktrust-e-islem.kktcmerkezbankasi.org.pem
+new file mode 100644
+index 0000000..33f2ef4
+--- /dev/null
++++ b/tests/auto/qsslcertificate/more-certificates/blacklisted-turktrust=
-e-islem.kktcmerkezbankasi.org.pem
+@@ -0,0 +1,24 @@
++-----BEGIN CERTIFICATE-----
++MIID8DCCAtigAwIBAgICCGQwDQYJKoZIhvcNAQEFBQAwgawxPTA7BgNVBAMMNFTD
++nFJLVFJVU1QgRWxla3Ryb25payBTdW51Y3UgU2VydGlmaWthc8SxIEhpem1ldGxl
++cmkxCzAJBgNVBAYTAlRSMV4wXAYDVQQKDFVUw5xSS1RSVVNUIEJpbGdpIMSwbGV0
++acWfaW0gdmUgQmlsacWfaW0gR8O8dmVubGnEn2kgSGl6bWV0bGVyaSBBLsWeLiAo
++YykgS2FzxLFtICAyMDA1MB4XDTExMDgwODA3MDc1MVoXDTIxMDgwNTA3MDc1MVow
++gaMxCzAJBgNVBAYTAlRSMRAwDgYDVQQIEwdMZWZrb3NhMRAwDgYDVQQHEwdMZWZr
++b3NhMRwwGgYDVQQKExNLS1RDIE1lcmtleiBCYW5rYXNpMSYwJAYDVQQDEx1lLWlz
++bGVtLmtrdGNtZXJrZXpiYW5rYXNpLm9yZzEqMCgGCSqGSIb3DQEJARYbaWxldGlA
++a2t0Y21lcmtlemJhbmthc2kub3JnMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
++CgKCAQEAw1hUpuRFY67NsZ6C9rzRAPCb9RVpi4nZzJIA1TvIfr4hMPM0X5jseMf5
++GvgJQ+cBMZtooDd7BbZNy2z7O5A+8PYFaMDdokCENx2ePIqAVuO6C5UAqM7J3n6R
++rhjOvqiw6dTQMbtXhjFao+YMuBVvRuuhGHBDK3Je64T/KLzcmAUlRJEuy+ZMe7Aa
++tUaSDr/jy5DMA5xEYOdsnS5Zo30lRG+9vqbxb8CQi+E97sNjY+W4lEgJKQWMNh5r
++Cxo4Hinkm3CKyKX3PAS+DDVI3LQiCiIQUOMA2+1P5aTPTkpqlbjqhbWTWAPWOKCF
++9d83p3RMXOYt5GahS8rg5u6+toEC1QIDAQABoyMwITAOBgNVHQ8BAf8EBAMCAQYw
++DwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQUFAAOCAQEAwjWz5tsUvYORVW8K
++JSK/biHFrAnFotMtoTKEewRmnYaYjwXIr1IPaBqhjkGGviLN2eOH/v97Uli6HC4l
++zhKHfMQUS9KF/f5nGcH8iQBy/gmFsfJQ1KDC6GNM4CfMGIzyxjYhP0VzdUtKX3PA
++l5EqgMUcdqRDy6Ruz55+JkdvCL1nAC7xH+czJcZVwysTdGfLTCh6VtYPgIkeL6U8
++3xQAyMuOHm72exJljYFqIsiNvGE0KufCqCuH1PD97IXMrLlwGmKKg5jP349lySBp
++Jjm6RDqCTT+6dUl2jkVbeNmco99Y7AOdtLsOdXBMCo5x8lK8zwQWFrzEms0joHXC
++pWfGWA=3D=3D
++-----END CERTIFICATE-----
+diff --git a/tests/auto/qsslcertificate/more-certificates/blacklisted-tu=
rktrust-ego.gov.tr.pem b/tests/auto/qsslcertificate/more-certificates/bla=
cklisted-turktrust-ego.gov.tr.pem
+new file mode 100644
+index 0000000..e9d048f
+--- /dev/null
++++ b/tests/auto/qsslcertificate/more-certificates/blacklisted-turktrust=
-ego.gov.tr.pem
+@@ -0,0 +1,31 @@
++-----BEGIN CERTIFICATE-----
++MIIFPTCCBCWgAwIBAgICCCcwDQYJKoZIhvcNAQEFBQAwgawxPTA7BgNVBAMMNFTD
++nFJLVFJVU1QgRWxla3Ryb25payBTdW51Y3UgU2VydGlmaWthc8SxIEhpem1ldGxl
++cmkxCzAJBgNVBAYTAlRSMV4wXAYDVQQKDFVUw5xSS1RSVVNUIEJpbGdpIMSwbGV0
++acWfaW0gdmUgQmlsacWfaW0gR8O8dmVubGnEn2kgSGl6bWV0bGVyaSBBLsWeLiAo
++YykgS2FzxLFtICAyMDA1MB4XDTExMDgwODA3MDc1MVoXDTIxMDcwNjA3MDc1MVow
++bjELMAkGA1UEBhMCVFIxDzANBgNVBAgMBkFOS0FSQTEPMA0GA1UEBwwGQU5LQVJB
++MQwwCgYDVQQKDANFR08xGDAWBgNVBAsMD0VHTyBCSUxHSSBJU0xFTTEVMBMGA1UE
++AwwMKi5FR08uR09WLlRSMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
++v5zoj2Bpdl7R1M/zF6Qf4su2F8vDqISKvuTuyJhNAHhFGHCsHjaixGMHspuz0l3V
++50kq/ECWbN8kKaeTrB112QOrWTU276iup1Gh+OlEOiR9vlQ4VAP00dWUjD6z9HQF
++Ci8W3EsEtiiHiYOU9BcPpPkaUbECwP4nGVwR8aPwhB5PGBJc98romdvciYkUpSOO
++wkuSRtooA7tRlLFu72QaNpXN1NueB36I3aajPk0YyiXy2w8XlgK7QI4PSSBnSq+Q
++blFocWVmLhF94je7py6lCnllrIFXpR3FWZLD5GcI6HKlBS78AQ+IMBLFHhsEVw5N
++Qj90chSZClfBWBZzIaV9RwIDAQABo4IBpDCCAaAwHwYDVR0jBBgwFoAUq042AzDS
++29UKaL6HpVBs/PZwpSUwHQYDVR0OBBYEFGT7G4Y9uEryRIL5Vj3qJsD047M0MA4G
++A1UdDwEB/wQEAwIBBjBFBgNVHSAEPjA8MDoGCWCGGAMAAwEBATAtMCsGCCsGAQUF
++BwIBFh9odHRwOi8vd3d3LnR1cmt0cnVzdC5jb20udHIvc3VlMA8GA1UdEwEB/wQF
++MAMBAf8wSQYDVR0fBEIwQDA+oDygOoY4aHR0cDovL3d3dy50dXJrdHJ1c3QuY29t
++LnRyL3NpbC9UVVJLVFJVU1RfU1NMX1NJTF9zMi5jcmwwgaoGCCsGAQUFBwEBBIGd
++MIGaMG4GCCsGAQUFBzAChmJodHRwOi8vd3d3LnR1cmt0cnVzdC5jb20udHIvc2Vy
++dGlmaWthbGFyL1RVUktUUlVTVF9FbGVrdHJvbmlrX1N1bnVjdV9TZXJ0aWZpa2Fz
++aV9IaXptZXRsZXJpX3MyLmNydDAoBggrBgEFBQcwAYYcaHR0cDovL29jc3AudHVy
++a3RydXN0LmNvbS50cjANBgkqhkiG9w0BAQUFAAOCAQEAj89QCCyoW0S20EcYDZAn
++vFLFmougK97Bt68iV1OM622+Cyeyf4Sz+1LBk1f9ni3fGT0Q+RWZJYWq5YuSBiLV
++gk3NLcxnwe3wmnvErUgq1QDtAaNlBWMEMklOlWGfJ0eWaillUskJbDd4KwgZHDEj
++7g/jYEQqU1t0zoJdwM/zNsnLHkhwcWZ5PQnnbpff1Ct/1LH/8pdy2eRDmRmqniLU
++h8r2lZfJeudVZG6yIbxsqP3t2JCq5c2P1jDhAGF3g9DiskH0CzsRdbVpoWdr+PY1
++Xz/19G8XEpX9r+IBJhLdbkpVo0Qh0A10mzFP/GUk5f/8nho2HvLaVMhWv1qKcF8I
++hQ=3D=3D
++-----END CERTIFICATE-----
+--=20
+1.7.1
+
diff --git a/meta/recipes-qt/qt4/qt4-4.8.4/0023-qtnetwork-blacklist-two-m=
ore-certificates.patch b/meta/recipes-qt/qt4/qt4-4.8.4/0023-qtnetwork-bla=
cklist-two-more-certificates.patch
new file mode 100644
index 0000000..54171f7
--- /dev/null
+++ b/meta/recipes-qt/qt4/qt4-4.8.4/0023-qtnetwork-blacklist-two-more-cer=
tificates.patch
@@ -0,0 +1,41 @@
+From 180bf94c241728dd6d6f100437914d3cb11cbc30 Mon Sep 17 00:00:00 2001
+From: Martin Petersson <Martin.Petersson@nokia.com>
+Date: Wed, 7 Mar 2012 12:05:59 +0100
+Subject: [PATCH] QtNetwork: blacklist two more certificates
+
+The comodogate 72:03:21:05:c5:0c:08:57:3d:8e:a5:30:4e:fe:e8:b0
+certificate is a test certificate and the MD5 Collisions was created
+as a proof of concept deliberately made to be expired at the time
+of it's creation.
+
+Task-number: QTBUG-24654
+(cherry picked from commit 4c0df9feb2b44d0c4fcaa5076f00aa08fbc1dda5)
+
+Signed-off-by: Peter Hartmann <phartmann@rim.com>
+
+Apparently this commit was forgotten to cherry-pick to Qt 4.
+
+Change-Id: I86949eaa3c02483b0b66b4a620bfa88aaa9aa99b
+Reviewed-by: Richard J. Moore <rich@kde.org>
+
+Upstream-Status: Accepted https://codereview.qt-project.org/#change,4399=
2
+---
+ src/network/ssl/qsslcertificate.cpp |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/src/network/ssl/qsslcertificate.cpp b/src/network/ssl/qsslc=
ertificate.cpp
+index 37799d1..300a261 100644
+--- a/src/network/ssl/qsslcertificate.cpp
++++ b/src/network/ssl/qsslcertificate.cpp
+@@ -825,6 +825,8 @@ static const char *certificate_blacklist[] =3D {
+=20
+     "120001705", "Digisign Server ID (Enrich)", // (Malaysian) Digicert=
 Sdn. Bhd. cross-signed by Verizon CyberTrust
+     "1276011370", "Digisign Server ID - (Enrich)", // (Malaysian) Digic=
ert Sdn. Bhd. cross-signed by Entrust
++    "72:03:21:05:c5:0c:08:57:3d:8e:a5:30:4e:fe:e8:b0", "UTN-USERFirst-H=
ardware", // comodogate test certificate
++    "41",                                              "MD5 Collisions =
Inc. (http://www.phreedom.org/md5)", // http://www.phreedom.org/research/=
rogue-ca/
+=20
+     "2087",                                            "*.EGO.GOV.TR", =
// Turktrust mis-issued intermediate certificate
+     "2148",                                            "e-islem.kktcmer=
kezbankasi.org", // Turktrust mis-issued intermediate certificate
+--=20
+1.7.1
+
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb b/meta/recipes-qt/=
qt4/qt4-embedded_4.8.4.bb
index 187de73..5a3dc65 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb
@@ -1,7 +1,7 @@
 require qt4-${PV}.inc
 require qt4-embedded.inc
=20
-PR =3D "${INC_PR}.0"
+PR =3D "${INC_PR}.1"
=20
 QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
=20
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb b/meta/recipes-qt/=
qt4/qt4-x11-free_4.8.4.bb
index bedd201..9b03ff2 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt4-${PV}.inc
=20
-PR =3D "${INC_PR}.0"
+PR =3D "${INC_PR}.1"
=20
 QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
=20
--=20
1.7.11.7



