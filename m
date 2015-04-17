Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7045673D6E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 13:52:26 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-05.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Yj6h1-0002Vx-KC from Dmitry_Eremin@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Apr 2015 06:52:27 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-05.mgc.mentorg.com (137.202.0.112) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Fri, 17 Apr 2015 14:52:26 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Apr 2015 16:52:24 +0300
Message-ID: <1429278744-4695-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] mdadm: add ptest
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
X-List-Received-Date: Fri, 17 Apr 2015 13:52:29 -0000
Content-Type: text/plain

Enable ptest for mdadm, by reusing internal testsuite.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta/recipes-extended/mdadm/files/run-ptest | 10 ++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.2.bb  | 29 +++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/run-ptest

diff --git a/meta/recipes-extended/mdadm/files/run-ptest b/meta/recipes-extended/mdadm/files/run-ptest
new file mode 100644
index 0000000..5b27609
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+./test &>./test.log
+if [ $? -eq 0 ]
+then
+	echo "PASS: mdadm"
+	rm test.log
+else
+	echo "FAIL: mdadm"
+fi
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
index c6a5635..0742d73 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://mdadm-3.2.2_fix_for_x32.patch \
            file://gcc-4.9.patch \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
+           file://run-ptest \
 	  "
 
 SRC_URI[md5sum] = "44698d351501cac6a89072dc877eb220"
@@ -45,3 +46,31 @@ do_install() {
 }
 
 FILES_${PN} += "${base_libdir}/udev/rules.d/*.rules"
+
+inherit ptest
+
+do_compile_ptest() {
+	oe_runmake test
+}
+
+do_install_ptest() {
+	cp -a ${S}/tests ${D}${PTEST_PATH}/tests
+	cp ${S}/test ${D}${PTEST_PATH}
+	sed -e 's!sleep 0.*!sleep 1!g; s!/var/tmp!/!g' -i ${D}${PTEST_PATH}/test
+	ln -s /sbin/mdadm ${D}${PTEST_PATH}/mdadm
+	for prg in test_stripe swap_super raid6check
+	do
+		install -D -m 755 $prg ${D}${PTEST_PATH}/
+	done
+}
+RDEPENDS_${PN}-ptest += "bash"
+RRECOMMENDS_${PN}-ptest += " \
+    coreutils \
+    util-linux \
+    kernel-module-loop \
+    kernel-module-linear \
+    kernel-module-raid0 \
+    kernel-module-raid1 \
+    kernel-module-raid10 \
+    kernel-module-raid456 \
+"
-- 
2.1.4


