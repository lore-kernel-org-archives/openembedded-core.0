Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2403C771A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 02:22:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3214838"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Feb 2016 10:22:44 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 55CBA41896F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 10:21:54 +0800 (CST)
Received: from localhost.localdomain (10.167.226.72) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 2 Feb 2016 10:22:41 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Feb 2016 05:22:35 +0300
Message-ID: <1454379755-1799-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.72]
X-yoursite-MailScanner-ID: 55CBA41896F1.AF86D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] mdadm: Add systemd support
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
X-List-Received-Date: Tue, 02 Feb 2016 02:22:51 -0000
Content-Type: text/plain

Add mdadm.service to support systemd systems and add configuration
file.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/mdadm/files/mdadm.service | 13 +++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.4.bb      | 12 +++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm.service

diff --git a/meta/recipes-extended/mdadm/files/mdadm.service b/meta/recipes-extended/mdadm/files/mdadm.service
new file mode 100644
index 0000000..3664ceb
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Software RAID monitoring and management
+After=syslog.target
+ConditionPathExists=@sysconfdir@/mdadm.conf
+
+[Service]
+Type=forking
+PIDFile=@localstatedir@/run/mdadm/mdadm.pid
+EnvironmentFile=-@sysconfdir@/sysconfig/mdmonitor
+ExecStart=@basesbindir@/mdadm --monitor --scan -f --pid-file=@localstatedir@/run/mdadm/mdadm.pid
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
index 1198167..e27f384 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.4.bb
@@ -14,13 +14,14 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://mdadm-3.3.2_x32_abi_time_t.patch \
            file://0001-Fix-typo-in-comparision.patch \
            file://run-ptest \
+           file://mdadm.service \
 	  "
 SRC_URI[md5sum] = "7ca8b114710f98f53f20c5787b674a09"
 SRC_URI[sha256sum] = "8ae5f45306b873190e91f410709b00e51997b633c072b33f8efd9f7df022ca68"
 
 CFLAGS += "-fno-strict-aliasing"
 
-inherit autotools-brokensep
+inherit autotools-brokensep systemd
 
 EXTRA_OEMAKE = "CHECK_RUN_DIR=0"
 # PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
@@ -38,8 +39,17 @@ do_compile() {
 do_install() {
 	export STRIP=""
 	autotools_do_install
+        install -d ${D}/${sysconfdir}/
+        install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/
+        install -d ${D}${systemd_unitdir}/system
+        install -m 644 ${WORKDIR}/mdadm.service ${D}${systemd_unitdir}/system/
+        sed -i -e 's,@basesbindir@,${base_sbindir},g' \
+               -e 's,@localstatedir@,${localstatedir},g' \
+               -e 's,@sysconfdir@,${sysconfdir},g' \
+               ${D}${systemd_unitdir}/system/mdadm.service
 }
 
+SYSTEMD_SERVICE_${PN} = "mdadm.service"
 FILES_${PN} += "${base_libdir}/udev/rules.d/*.rules"
 
 inherit ptest
-- 
1.8.4.2




