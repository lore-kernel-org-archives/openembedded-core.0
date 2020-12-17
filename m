Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web10.12659.1608226962328912875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 09:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: kory.maincent@bootlin.com)
Received: from localhost.localdomain (212.208.113.78.rev.sfr.net [78.113.208.212])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3C6D6200004;
	Thu, 17 Dec 2020 17:42:39 +0000 (UTC)
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
Subject: [PATCH v3] ltp: fix rpc build error
Date: Thu, 17 Dec 2020 18:42:39 +0100
Message-Id: <20201217174239.15811-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.17.1

Add support to tirpc tests build.
Export incdir and libdir to have the right path.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change since v1:
 - Use PACKAGECONFIG to enable rpc tests
 - Improve ${libdir} and ${incdir} export

Change since v2:
 - Improve ${libdir} and ${incdir} export

 meta/recipes-extended/ltp/ltp_20200930.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb b/meta/recipes-extended/ltp/ltp_20200930.bb
index 7acf15b360..711fce01f1 100644
--- a/meta/recipes-extended/ltp/ltp_20200930.bb
+++ b/meta/recipes-extended/ltp/ltp_20200930.bb
@@ -42,14 +42,14 @@ inherit autotools-brokensep pkgconfig
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+export libdir := "${libdir}"
+export incdir := "${incdir}"
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

