Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 511A8763DA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Aug 2015 09:00:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t73901dm007358
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Aug 2015 02:00:01 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 3 Aug 2015 02:00:00 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Aug 2015 16:52:45 +0800
Message-ID: <1438591965-24099-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] openssl: fix ptest issues
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
X-List-Received-Date: Mon, 03 Aug 2015 09:00:05 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* follow symbolic links while copying sources from test/*
* install required target files to remove Make errors:

  make[2]: *** No rule to make target 'xxx', needed by 'yyy'.

* fix hardcode pathes:
  /usr/lib -> ${libdir}, /usr/bin -> ${bindir}

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 53dcfd9..8d62915 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -191,12 +191,18 @@ do_install () {
 }
 
 do_install_ptest () {
-	cp -r Makefile test ${D}${PTEST_PATH}
+	cp -r -L Makefile.org Makefile test ${D}${PTEST_PATH}
+	cp Configure config e_os.h ${D}${PTEST_PATH}
+	cp -r -L include ${D}${PTEST_PATH}
+	ln -sf ${base_libdir}/libcrypto.a ${D}${PTEST_PATH}
+	ln -sf ${libdir}/libssl.a ${D}${PTEST_PATH}
+	mkdir -p ${D}${PTEST_PATH}/crypto
+	cp crypto/constant_time_locl.h ${D}${PTEST_PATH}/crypto
 	cp -r certs ${D}${PTEST_PATH}
 	mkdir -p ${D}${PTEST_PATH}/apps
-	ln -sf /usr/lib/ssl/misc/CA.sh  ${D}${PTEST_PATH}/apps
-	ln -sf /usr/lib/ssl/openssl.cnf ${D}${PTEST_PATH}/apps
-	ln -sf /usr/bin/openssl         ${D}${PTEST_PATH}/apps
+	ln -sf ${libdir}/ssl/misc/CA.sh  ${D}${PTEST_PATH}/apps
+	ln -sf ${libdir}/ssl/openssl.cnf ${D}${PTEST_PATH}/apps
+	ln -sf ${bindir}/openssl         ${D}${PTEST_PATH}/apps
 	cp apps/server2.pem             ${D}${PTEST_PATH}/apps
 	mkdir -p ${D}${PTEST_PATH}/util
 	install util/opensslwrap.sh    ${D}${PTEST_PATH}/util
-- 
1.9.1


