Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id DFE227BD72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 02:22:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,308,1559491200"; d="scan'208";a="72226862"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jul 2019 10:22:57 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 9D9AC4CDCEBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 10:22:55 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 26 Jul 2019 10:22:56 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2019 10:22:10 +0800
Message-ID: <20190726022210.18415-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 9D9AC4CDCEBD.AD9CC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] mdadm:add mdmonitor.service
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
X-List-Received-Date: Fri, 26 Jul 2019 02:22:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

-The original mdmonitor.service is wrong, so append new
mdmonitor.service.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/mdadm/files/mdmonitor.service | 10 ++++++++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb            |  2 ++
 2 files changed, 12 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/mdmonitor.service

diff --git a/meta/recipes-extended/mdadm/files/mdmonitor.service b/meta/recipes-extended/mdadm/files/mdmonitor.service
new file mode 100644
index 0000000000..4f07c755ae
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdmonitor.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Software RAID monitoring and management
+ConditionPathExists=/etc/mdadm.conf
+[Service]
+Type=forking
+PIDFile=/var/run/mdadm/mdadm.pid
+EnvironmentFile=-/etc/sysconfig/mdmonitor
+ExecStart=/sbin/mdadm --monitor --scan -f --pid-file=/var/run/mdadm/mdadm.pid
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 74c94f6ecb..daa2ed8e2e 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://debian-no-Werror.patch \
            file://0001-Revert-tests-wait-for-complete-rebuild-in-integrity-.patch \
 	   file://mdadm.init \
+	   file://mdmonitor.service \
 	   file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            file://include_sysmacros.patch \
            "
@@ -65,6 +66,7 @@ do_install_append() {
 
 do_install_append() {
         oe_runmake install-systemd DESTDIR=${D}
+        install -m 644 ${WORKDIR}/mdmonitor.service ${D}/lib/systemd/system/mdmonitor.service
 }
 
 do_compile_ptest() {
-- 
2.20.1




