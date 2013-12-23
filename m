Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 683406A35B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 08:36:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBN8aP9k012004
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 00:36:25 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 23 Dec 2013 00:36:25 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Dec 2013 16:36:21 +0800
Message-ID: <1b6029092c530e7feeee14d6314bcf3676ebaecf.1387787578.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1387787578.git.Qi.Chen@windriver.com>
References: <cover.1387787578.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] systemd: fix ptest to make it able to run on target
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
X-List-Received-Date: Mon, 23 Dec 2013 08:36:24 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This patch mainly involves four changes.
1. Ship the sys.tar.xz and extract it on target to avoid ELOOP error.
2. Make systemd-ptest rdepend on bash and perl as the test cases need them.
3. Fix paths in Makefile so that the test cases could run on target.
4. Install ${libdir}/udev/rules.d directory to make udev-test.pl work.

[YOCTO #5664]
[YOCTO #5673]
[YOCTO #5674]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd/run-ptest |    1 +
 meta/recipes-core/systemd/systemd_208.bb    |   12 ++++++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/run-ptest b/meta/recipes-core/systemd/systemd/run-ptest
index 0418bc9..2f6bd93 100644
--- a/meta/recipes-core/systemd/systemd/run-ptest
+++ b/meta/recipes-core/systemd/systemd/run-ptest
@@ -1,2 +1,3 @@
+tar -C test -xJf test/sys.tar.xz
 make test/rules-test.sh.log
 make test/udev-test.pl.log
diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core/systemd/systemd_208.bb
index 372e73d..248a898 100644
--- a/meta/recipes-core/systemd/systemd_208.bb
+++ b/meta/recipes-core/systemd/systemd_208.bb
@@ -120,11 +120,15 @@ do_install_ptest () {
        install ${S}/test/* ${D}${PTEST_PATH}/test
        install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
        install -d ${D}${PTEST_PATH}/build-aux
+       cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
        cp -rf ${B}/rules ${D}${PTEST_PATH}/
+       # This directory needs to be there for udev-test.pl to work.
+       install -d ${D}${libdir}/udev/rules.d
        cp ${B}/Makefile ${D}${PTEST_PATH}/
-       cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
-       tar -C ${D}${PTEST_PATH}/test -xJf ${S}/test/sys.tar.xz
+       cp ${S}/test/sys.tar.xz ${D}${PTEST_PATH}/test
        sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/test/udev-test.pl
+       sed -i 's#${S}#${PTEST_PATH}#g' ${D}${PTEST_PATH}/Makefile
+       sed -i 's#${B}#${PTEST_PATH}#g' ${D}${PTEST_PATH}/Makefile
 }
 
 python populate_packages_prepend (){
@@ -147,6 +151,10 @@ FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 FILES_${PN}-initramfs = "/init"
 RDEPENDS_${PN}-initramfs = "${PN}"
 
+# The test cases need perl and bash to run correctly.
+RDEPENDS_${PN}-ptest += "perl bash"
+FILES_${PN}-ptest += "${libdir}/udev/rules.d"
+
 FILES_${PN}-gui = "${bindir}/systemadm"
 
 FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
-- 
1.7.9.5


