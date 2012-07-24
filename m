Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yao.zhao@windriver.com>) id 1StfgC-0004GP-5h
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 16:01:40 +0200
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.147.210])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6ODoAsY028405
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 06:50:10 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 09:49:59 -0400
Message-Id: <1343137799-12032-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] bzip2-native: fix problems when bzip2-native is installed in parallel
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
X-List-Received-Date: Tue, 24 Jul 2012 14:01:40 -0000

when bzip2-native is installed in parallel to sysroot, it is possible that
some packages are using bzip2 to unpack, there are chances that bzip2 is
installed to sysroot but libbz2.so.0 not installed yet because parallel
installation.
link bzip2 and bzip2recover statically to avoid this problem and don't lose
parallel installation. libbz2.so is still available.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 43b462a..4a0ad0c 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -25,6 +25,13 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "bunzip2 bzcat"
 
 do_configure_prepend () {
+	#link libbz2 statically to avoid problems when bzip2-native was
+	#installed parallel, libbz2.so.0 was not available but bzip2 is
+	if [ "${PN}" = "${BPN}-native" ]; then
+	  sed -i -e '/^bzip2_DEPENDENCIES/a bzip2_LDFLAGS = -static' \
+	    -e '/^bzip2recover_DEPENDENCIES/a bzip2recover_LDFLAGS = -static' \
+	    ${WORKDIR}/Makefile.am
+	fi
 	cp ${WORKDIR}/configure.ac ${S}/
 	cp ${WORKDIR}/Makefile.am ${S}/
 	cp ${STAGING_DATADIR_NATIVE}/automake*/install-sh ${S}/
-- 
1.7.9.5



