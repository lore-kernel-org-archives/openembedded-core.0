Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EACA27867C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:58:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 14:58:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="17433593"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2017 14:58:36 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:58:28 -0800
Message-Id: <20171219225831.22587-16-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: [PATCH RFC 15/18] systemd: add systemd-bootconf recipe
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
X-List-Received-Date: Tue, 19 Dec 2017 22:58:38 -0000

Reuses our systemd-boot-cfg bbclass to generate systemd-boot
configuration files.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/systemd/systemd-bootconf_1.00.bb | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-bootconf_1.00.bb

diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
new file mode 100644
index 00000000000..3ea7548f29a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
@@ -0,0 +1,31 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+RPROVIDES_${PN} += "virtual/systemd-bootconf"
+
+inherit allarch
+
+S = "${WORKDIR}"
+
+LABELS = "boot"
+
+APPEND_append = " root=PARTUUID=${DISK_SIGNATURE_UUID}"
+
+do_configure[vardeps] += "APPEND LABELS DISK_SIGNATURE_UUID"
+
+python do_configure() {
+    bb.build.exec_func('build_efi_cfg', d)
+}
+
+do_install() {
+	install -d ${D}/boot
+	install -d ${D}/boot/loader
+	install -d ${D}/boot/loader/entries
+	install -m 0744 loader.conf ${D}/boot/loader/
+        rm loader.conf
+        install -m 077 *.conf ${D}/boot/loader/entries/
+}
+
+FILES_${PN} = "/boot/loader/* /boot/loader/entries/*"
+
+inherit systemd-boot-cfg
-- 
2.14.3


