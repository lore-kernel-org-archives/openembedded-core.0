Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6D0D6BEE2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 02:50:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r832oB8V020497
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Sep 2013 19:50:11 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 2 Sep 2013 19:50:11 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2013 10:50:20 +0800
Message-ID: <1378176620-27415-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] systemd: add ptest
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
X-List-Received-Date: Tue, 03 Sep 2013 02:50:13 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-core/systemd/systemd/run-ptest |    2 ++
 meta/recipes-core/systemd/systemd_206.bb    |   16 +++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/run-ptest

diff --git a/meta/recipes-core/systemd/systemd/run-ptest b/meta/recipes-core/systemd/systemd/run-ptest
new file mode 100644
index 0000000..0418bc9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/run-ptest
@@ -0,0 +1,2 @@
+make test/rules-test.sh.log
+make test/udev-test.pl.log
diff --git a/meta/recipes-core/systemd/systemd_206.bb b/meta/recipes-core/systemd/systemd_206.bb
index 75bdc61..9944459 100644
--- a/meta/recipes-core/systemd/systemd_206.bb
+++ b/meta/recipes-core/systemd/systemd_206.bb
@@ -15,7 +15,7 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
 
-inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu ptest
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://0001-use-CAP_MKNOD-ConditionCapability.patch \
@@ -24,6 +24,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
            file://init \
+           file://run-ptest \
           "
 SRC_URI[md5sum] = "89e36f2d3ba963020b72738549954cbc"
 SRC_URI[sha256sum] = "4c993de071118ea1df7ffc4be26ef0b0d78354ef15b2743a2783d20edfcde9de"
@@ -113,6 +114,19 @@ do_install() {
 	fi
 }
 
+do_install_ptest () {
+       install -d ${D}${PTEST_PATH}/test
+       install -d ${D}${libdir}/udev/rules.d
+       install ${B}/test/* ${D}${PTEST_PATH}/test
+       install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
+       install -d ${D}${PTEST_PATH}/build-aux
+       cp -rf ${B}/rules ${D}${PTEST_PATH}/
+       cp ${B}/Makefile ${D}${PTEST_PATH}/
+       cp ${B}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
+       tar -C ${D}${PTEST_PATH}/test -xJf ${B}/test/sys.tar.xz
+       sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/test/udev-test.pl
+}
+
 python populate_packages_prepend (){
     systemdlibdir = d.getVar("rootlibdir", True)
     do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
-- 
1.7.10.4


