Return-Path: <jlu@pengutronix.de>
X-Greylist: delayed 1020 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Nov 2019 11:38:44 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 765347D0B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 11:38:44 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iXkWv-0000WC-AI; Thu, 21 Nov 2019 12:21:45 +0100
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iXkWv-0003gX-1A; Thu, 21 Nov 2019 12:21:45 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 12:12:48 +0100
Message-Id: <20191121111248.16992-6-jlu@pengutronix.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121111248.16992-1-jlu@pengutronix.de>
References: <20191121111248.16992-1-jlu@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 6/6] softhsm: add recipe
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
X-List-Received-Date: Thu, 21 Nov 2019 11:38:44 -0000
Content-Transfer-Encoding: 8bit

This is useful for consolidation of code-signing interfaces when
building an image with verified boot mechanisms or signed update
artifacts. It can also be used on the target as a backend for software
which uses the PKCS#11 API to access private key material.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 .../recipes-security/softhsm/softhsm_git.bb    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-security/softhsm/softhsm_git.bb

diff --git a/meta-oe/recipes-security/softhsm/softhsm_git.bb b/meta-oe/recipes-security/softhsm/softhsm_git.bb
new file mode 100644
index 000000000000..3236cb9a6097
--- /dev/null
+++ b/meta-oe/recipes-security/softhsm/softhsm_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "PKCS#11 HSM/Token Emulator"
+HOMEPAGE = "https://www.opendnssec.org/softhsm/"
+LICENSE = "BSD-2-Clause & ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
+DEPENDS = "openssl"
+PV = "2.5.0"
+
+SRC_URI = "git://github.com/opendnssec/SoftHSMv2.git;branch=master"
+SRCREV = "369df0383d101bc8952692c2a368ac8bc887d1b4"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+# EdDSA requires OpenSSL >= 1.1.1
+EXTRA_OECONF = "--enable-eddsa --disable-gost"
+
+BBCLASSEXTEND = "native"
-- 
2.24.0


