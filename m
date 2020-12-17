Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.5681.1608198909164397320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 01:55:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: kory.maincent@bootlin.com)
X-Originating-IP: 78.113.208.212
Received: from localhost.localdomain (212.208.113.78.rev.sfr.net [78.113.208.212])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id DC0FB60009;
	Thu, 17 Dec 2020 09:55:06 +0000 (UTC)
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
Subject: [PATCH] ltp: fix rpc build error
Date: Thu, 17 Dec 2020 10:55:06 +0100
Message-Id: <20201217095506.28531-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.17.1

Add support to tirpc tests build.
Export incdir and libdir to have the right path.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 meta/recipes-extended/ltp/ltp_20200930.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb b/meta/recipes-extended/ltp/ltp_20200930.bb
index 7acf15b360..9b17d68f67 100644
--- a/meta/recipes-extended/ltp/ltp_20200930.bb
+++ b/meta/recipes-extended/ltp/ltp_20200930.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "\
     file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 "
 
-DEPENDS = "attr libaio libcap acl openssl zip-native"
+DEPENDS = "attr libaio libcap acl openssl zip-native libtirpc"
 DEPENDS_append_libc-musl = " fts "
 EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
 EXTRA_OECONF_append_libc-musl = " LIBS=-lfts "
@@ -44,12 +44,12 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 export prefix = "/opt/${PN}"
 export exec_prefix = "/opt/${PN}"
+export libdir = "/usr/lib"
+export incdir = "/usr/include"
 
 PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
 EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
 EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
-# ltp network/rpc test cases ftbfs when libtirpc is found
-EXTRA_OECONF += " --without-tirpc "
 
 do_install(){
     install -d ${D}${prefix}/
-- 
2.17.1

