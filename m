Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 88CC473176
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 01:21:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6270539"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 May 2016 09:21:16 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0010842B4AF3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 09:21:15 +0800 (CST)
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 6 May 2016 09:21:15 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 May 2016 04:20:56 +0300
Message-ID: <1462497656-1813-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <CAEGpDuaj29ciwevzMPUwHkzeEgRyheE8rB=JQ_Ft67Fr9gAeWg@mail.gmail.com>
References: <CAEGpDuaj29ciwevzMPUwHkzeEgRyheE8rB=JQ_Ft67Fr9gAeWg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
X-yoursite-MailScanner-ID: 0010842B4AF3.AF2A0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v3] mdadm: add systemd support
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
X-List-Received-Date: Fri, 06 May 2016 01:21:24 -0000
Content-Type: text/plain

Add mdadm.service to support systemd systems and add
configuration file.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/mdadm/files/mdadm.service | 13 +++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.4.bb        | 14 +++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-extended/mdadm/mdadm_3.4.bb b/meta/recipes-extended/mdadm/mdadm_3.4.bb
index 142dfdd..2e7b155 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.4.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.4.bb
@@ -19,12 +19,13 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Fix-some-type-comparison-problems.patch \
            file://0001-Fix-the-path-of-corosync-and-dlm-header-files-check.patch \
            file://run-ptest \
+           file://mdadm.service \
 	  "
 SRC_URI[md5sum] = "04b8b21f637540350f8517c7e68d3c63"
 SRC_URI[sha256sum] = "27d0be4627d38a12ddcd1c1c3721d649d4e89e1093914497e22b57245cda8808"
 
 CFLAGS += "-fno-strict-aliasing"
-inherit autotools-brokensep
+inherit autotools-brokensep systemd
 
 EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}"'
 # PPC64 and MIPS64 uses long long for u64 in the kernel, but powerpc's asm/types.h
@@ -42,8 +43,19 @@ do_compile() {
 do_install() {
 	export STRIP=""
 	autotools_do_install
+	install -d ${D}/${sysconfdir}/
+	install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/
+	install -d ${D}${systemd_unitdir}/system
+	install -m 644 ${WORKDIR}/mdadm.service ${D}${systemd_system_unitdir}
+	sed -i -e 's,@basesbindir@,${base_sbindir},g' \
+		-e 's,@localstatedir@,${localstatedir},g' \
+		-e 's,@sysconfdir@,${sysconfdir},g' \
+		${D}${systemd_system_unitdir}/mdadm.service
+
 }
 
+SYSTEMD_SERVICE_${PN} = "mdadm.service"
+
 FILES_${PN} += "${base_libdir}/udev/rules.d/*.rules"
 
 inherit ptest
-- 
1.8.4.2




