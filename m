Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.7535.1608376085239364673
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 03:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: kory.maincent@bootlin.com)
X-Originating-IP: 78.113.208.212
Received: from localhost.localdomain (212.208.113.78.rev.sfr.net [78.113.208.212])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 8079AE0005
	for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 11:08:02 +0000 (UTC)
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4] ltp: add support for tirpc and fix build issue
Date: Sat, 19 Dec 2020 12:08:00 +0100
Message-Id: <20201219110800.5207-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.17.1

Add support to tirpc tests build.
The export of ${prefix} updates all other paths variable and
in particular PKG_CONFIG_PATH. This variable beeing updated it could
not find the pkgconfig file for tirpc.
Use immediate expansion to avoid ${prefix} export overflows on
PKG_CONFIG_PATH.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change since v1:
 - Use PACKAGECONFIG to enable rpc tests
 - Improve ${libdir} and ${incdir} export

Change since v2:
 - Improve ${libdir} and ${incdir} export

Change since v3:
 - Use PKG_CONFIG_PATH in place of the ${libdir} ${incdir} variable export

 meta/recipes-extended/ltp/ltp_20200930.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb b/meta/recipes-extended/ltp/ltp_20200930.bb
index 7acf15b360..1a9c05a7e4 100644
--- a/meta/recipes-extended/ltp/ltp_20200930.bb
+++ b/meta/recipes-extended/ltp/ltp_20200930.bb
@@ -42,14 +42,13 @@ inherit autotools-brokensep pkgconfig
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+PKG_CONFIG_PATH := "${PKG_CONFIG_PATH}"
 export prefix = "/opt/${PN}"
-export exec_prefix = "/opt/${PN}"
 
 PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
+PACKAGECONFIG[rpc] = "--with-tirpc, --without-tirpc, virtual/librpc,"
 EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
 EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
-# ltp network/rpc test cases ftbfs when libtirpc is found
-EXTRA_OECONF += " --without-tirpc "
 
 do_install(){
     install -d ${D}${prefix}/
-- 
2.17.1

