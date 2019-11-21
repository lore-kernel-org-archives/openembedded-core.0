Return-Path: <jlu@pengutronix.de>
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 68C1B7D0B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 11:38:45 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iXkWv-0000W9-9p; Thu, 21 Nov 2019 12:21:45 +0100
Received: from jlu by dude.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1iXkWu-0003ff-V0; Thu, 21 Nov 2019 12:21:44 +0100
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 12:12:45 +0100
Message-Id: <20191121111248.16992-3-jlu@pengutronix.de>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121111248.16992-1-jlu@pengutronix.de>
References: <20191121111248.16992-1-jlu@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 3/6] opensc: use pcsc-lite instead of openct by default
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
X-List-Received-Date: Thu, 21 Nov 2019 11:38:45 -0000
Content-Transfer-Encoding: 8bit

OpenCT upstream maintenance seems to have stopped and OpenSC upstream
uses pcsc-lite by default in their configure script. Add PACKAGECONFIGs
for each and select pcsc by default.

As the openct package depends on pcsc-lite by itself, this avoids an
unnecessary package in the default case.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-oe/recipes-support/opensc/opensc_0.19.0.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
index bc1722e394f6..440859a37a93 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.19.0.bb
@@ -16,20 +16,23 @@ SRCREV = "f1691fc91fc113191c3a8aaf5facd6983334ec47"
 SRC_URI = "git://github.com/OpenSC/OpenSC \
            file://0001-Remove-redundant-logging.patch \
           "
-DEPENDS = "openct pcsc-lite virtual/libiconv openssl"
+DEPENDS = "virtual/libiconv openssl"
 
 S = "${WORKDIR}/git"
 inherit autotools pkgconfig bash-completion
 
 EXTRA_OECONF = " \
     --disable-static \
-    --enable-openct \
-    --disable-pcsc \
     --disable-ctapi \
     --disable-doc \
 "
 EXTRA_OEMAKE = "DESTDIR=${D}"
 
+PACKAGECONFIG ??= "pcsc"
+
+PACKAGECONFIG[openct] = "--enable-openct,--disable-openct,openct"
+PACKAGECONFIG[pcsc] = "--enable-pcsc,--disable-pcsc,pcsc-lite"
+
 RDEPENDS_${PN} = "readline"
 
 FILES_${PN} += "\
-- 
2.24.0


