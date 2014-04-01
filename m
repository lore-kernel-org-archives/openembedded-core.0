Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1110A6F8A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:09:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s31A9Drx024163
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Apr 2014 03:09:13 -0700 (PDT)
Received: from otp-fsarbu-l1.corp.ad.wrs.com (128.224.170.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Tue, 1 Apr 2014 03:09:12 -0700
From: Florin Sarbu <florin.sarbu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Apr 2014 13:09:05 +0300
Message-ID: <1396346945-3782-1-git-send-email-florin.sarbu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.170.220]
Subject: [PATCH] connman.inc: Add PACKAGECONFIG support for bluez5
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
X-List-Received-Date: Tue, 01 Apr 2014 10:09:13 -0000
Content-Type: text/plain

Currently connman can only RDEPEND on bluez4.
This patch adds support for having bluez5 in PACKAGECONFIG
and get connman RDEPEND on bluez5 if desired.

Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
---
 meta/recipes-connectivity/connman/connman.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index b3147c9..53a6a4f 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -32,7 +32,7 @@ EXTRA_OECONF += "\
 
 PACKAGECONFIG ??= "wispr \
                    ${@base_contains('DISTRO_FEATURES', 'wifi','wifi', '', d)} \
-                   ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluetooth', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', '3g','3g', '', d)} \
 "
 
@@ -42,6 +42,7 @@ PACKAGECONFIG ??= "wispr \
 
 PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
 PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
+PACKAGECONFIG[bluez5] = "--enable-bluetooth, --disable-bluetooth, bluez5"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
 PACKAGECONFIG[tist] = "--enable-tist,--disable-tist,"
 PACKAGECONFIG[openvpn] = "--enable-openvpn --with-openvpn=${sbindir}/openvpn,--disable-openvpn,,openvpn"
@@ -114,6 +115,7 @@ RPROVIDES_${PN} = "\
 RDEPENDS_${PN} = "\
 	dbus \
 	${@base_contains('PACKAGECONFIG', 'bluetooth', 'bluez4', '', d)} \
+	${@base_contains('PACKAGECONFIG', 'bluez5', 'bluez5', '', d)} \
 	${@base_contains('PACKAGECONFIG', 'wifi','wpa-supplicant', '', d)} \
 	${@base_contains('PACKAGECONFIG', '3g','ofono', '', d)} \
 	xuser-account \
-- 
1.9.1


