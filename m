Return-Path: <jan.siegmund0@hm.edu>
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [129.187.255.137])
	by mail.openembedded.org (Postfix) with ESMTP id 859397864F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 11:14:11 +0000 (UTC)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 3zM4Gs188bzyq1;
	Wed, 17 Jan 2018 12:14:13 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.894
X-Spam-Level: 
X-Spam-Status: No, score=-2.894 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_TO_SHORT=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new,
	port 20024)
	with LMTP id OC9gnrg9NEZK; Wed, 17 Jan 2018 12:14:12 +0100 (CET)
Received: from build-platform.arri.de (unknown [217.111.95.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 3zM4Gr2ZpLzyZ7;
	Wed, 17 Jan 2018 12:14:12 +0100 (CET)
From: Jan Siegmund <jan.siegmund0@hm.edu>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 12:14:00 +0100
Message-Id: <1516187640-54936-2-git-send-email-jsiegmun@hm.edu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1516187640-54936-1-git-send-email-jsiegmun@hm.edu>
References: <1516187640-54936-1-git-send-email-jsiegmun@hm.edu>
Subject: [rocko][PATCH 2/2] lz4: remove ptest changes
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
X-List-Received-Date: Wed, 17 Jan 2018 11:14:11 -0000

From: Ross Burton <ross.burton@intel.com>

This recipe installs the test suite by copying the entire build tree into
/usr/share/ptest, which is both wasteful and breaks packaging as lz4-ptest then
gets renamed by debian.bbclass to liblz4.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/lz4/lz4_1.7.4.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-support/lz4/lz4_1.7.4.bb b/meta/recipes-support/lz4/lz4_1.7.4.bb
index 9e86985..86a1ab9 100644
--- a/meta/recipes-support/lz4/lz4_1.7.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.7.4.bb
@@ -17,19 +17,11 @@ SRC_URI = "git://github.com/lz4/lz4.git \
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"
-inherit ptest
 
-EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}" 
+EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
 
 do_install() {
 	oe_runmake install
 }
 
-do_install_ptest () {
-	install -d ${D}${PTEST_PATH}/testsuite
-	cp -rf ${S}/* ${D}${PTEST_PATH}/testsuite
-}
-
-RDEPENDS_${PN}-ptest += "make python3"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


