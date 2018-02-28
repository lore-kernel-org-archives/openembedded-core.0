Return-Path: <california.l.sullivan@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5CB788B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 03:09:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 19:09:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,403,1515484800"; d="scan'208";a="21325753"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga008.jf.intel.com with ESMTP; 27 Feb 2018 19:09:26 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 19:09:12 -0800
Message-Id: <20180228030918.35934-13-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180228030918.35934-1-california.l.sullivan@intel.com>
References: <20180228030918.35934-1-california.l.sullivan@intel.com>
Subject: [PATCH v2 12/18] systemd: add systemd-bootconf recipe
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
X-List-Received-Date: Wed, 28 Feb 2018 03:09:26 -0000

Reuses our systemd-boot-cfg bbclass to generate systemd-boot
configuration files.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/systemd/systemd-bootconf_1.00.bb | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-bootconf_1.00.bb

diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
new file mode 100644
index 00000000000..e9c2466456c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
@@ -0,0 +1,31 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+SUMMARY = "Basic systemd-boot configuration files"
+
+RPROVIDES_${PN} += "virtual/systemd-bootconf"
+
+inherit systemd-boot-cfg
+
+S = "${WORKDIR}"
+
+LABELS = "boot"
+
+ROOT ?= "root=/dev/sda2"
+APPEND_append = " ${ROOT}"
+
+python do_configure() {
+    bb.build.exec_func('build_efi_cfg', d)
+}
+
+do_configure[vardeps] += "APPEND"
+
+do_install() {
+	install -d ${D}/boot
+	install -d ${D}/boot/loader
+	install -d ${D}/boot/loader/entries
+	install loader.conf ${D}/boot/loader/
+	rm loader.conf
+	install *.conf ${D}/boot/loader/entries/
+}
+
+FILES_${PN} = "/boot/loader/* /boot/loader/entries/*"
-- 
2.14.3


