Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 59DEA7C5F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 06:11:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45Sd4x6YnZz3H
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 08:11:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560838290;
	bh=a1SjlvYQ67/Z7X4R8II7Gjg6SegEO6uJf7GNjBsVg/s=;
	h=From:To:Subject:Date:From;
	b=KlD5PM7Mc1uZC0q0YdTlMdQbIZ2nYsRezF9lJuD4VHdudkIeEFLEGkodVpW4wiGCn
	tSuyIOXnykaa8PXVyXXyPppsmA137jpgYHiQUnSneLnOVKc/jNrmQw0Qiuvv+jho4X
	nLjGaj5pQQ8ioRBOBidGmmhk6zTSaZW6QppBF9udVkPiBM+fOF1SQE58AvfSnJs6l+
	5d0iqNEuoRQTST4yNus/CLd/mBbvAg3yRiMcwo8Wj6sfQ+IrC/i3Xw2YKk27eUToyJ
	X3BXQkEjmAg3QFAb7KVCXRSJvghrsQVUl15ljlqXsr6EkM25Q4uyZU58KpINQ57rSQ
	tUzXrZXKOlLs8IJQNBZqBsfu1QxUD20vCLdM+msxC3+jtt7uaqZSbDWSYF2dAHEg23
	ietIJ0bgucgiDOg3YvXuWqu0/OkFlOPJJMlgxPYYfYmhbRVzH+Z1DLeGVlKFxsV3UQ
	ztf6+heMlPBWYiL+96ILLTr4PluyaBFok09zmeB5wx1H7NcOdBTlXhbbjgidBa5WnG
	tFgdj7hH11QVb3LJALz1t9EEpdEwjWYSF5hDXGemVNpYTJA4H6mIYggVrzM+UKi8P5
	URbJFPNRF+m9iYayMofwrq6TXLozbbIwMEQi/PJB1X+LMtIoMNb5MYyjq1xWvrD5v4
	dmE+IDUAYxTHnjFu8RHN7X5k=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 09:11:28 +0300
Message-Id: <20190618061128.17422-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] wireless-regdb: Add recipe
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
X-List-Received-Date: Tue, 18 Jun 2019 06:11:30 -0000

Since wpa-supplicant is provided,
the database of permitted frequencies should also be provided.

wireless-regdb-static should be used with kernel >= 4.15.
wireless-regdb can be used with older kernels and is mostly
irrelevant here, but keeping it in meta-networking would
create needless recipe duplication.

This package was previously in meta-networking.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../packagegroups/packagegroup-base.bb        |  1 +
 .../wireless-regdb_2019.06.03.bb              | 44 +++++++++++++++++++
 3 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 38fc711f5c..26851d66e0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -726,6 +726,7 @@ RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-which = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-wic-tools = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-wireless-regdb = "Adrian Bunk <bunk@kernel.org>"
 RECIPE_MAINTAINER_pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER_pn-x11perf = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-x264 = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index cae704aa24..d05403635c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -271,6 +271,7 @@ RRECOMMENDS_packagegroup-base-ipsec = "\
 SUMMARY_packagegroup-base-wifi = "WiFi support"
 RDEPENDS_packagegroup-base-wifi = "\
     iw \
+    wireless-regdb-static \
     wpa-supplicant"
 
 RRECOMMENDS_packagegroup-base-wifi = "\
diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb
new file mode 100644
index 0000000000..df50938a1a
--- /dev/null
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2019.06.03.bb
@@ -0,0 +1,44 @@
+SUMMARY = "Wireless Central Regulatory Domain Database"
+HOMEPAGE = "http://wireless.kernel.org/en/developers/Regulatory/CRDA"
+SECTION = "net"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
+
+SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
+SRC_URI[md5sum] = "4b5ba3f089db7fdb7b9daae6a7c1f2cb"
+SRC_URI[sha256sum] = "cd917ed86b63ce8d93947979f1f18948f03a4ac0ad89ec25227b36ac00dc54bf"
+
+inherit bin_package allarch
+
+do_install() {
+    install -d -m0755 ${D}${nonarch_libdir}/crda
+    install -d -m0755 ${D}${sysconfdir}/wireless-regdb/pubkeys
+    install -m 0644 regulatory.bin ${D}${nonarch_libdir}/crda/regulatory.bin
+    install -m 0644 sforshee.key.pub.pem ${D}${sysconfdir}/wireless-regdb/pubkeys/sforshee.key.pub.pem
+
+    install -m 0644 -D regulatory.db ${D}${nonarch_base_libdir}/firmware/regulatory.db
+    install -m 0644 regulatory.db.p7s ${D}${nonarch_base_libdir}/firmware/regulatory.db.p7s
+}
+
+# Install static regulatory DB in /lib/firmware for kernel to load.
+# This requires Linux kernel >= v4.15.
+# For kernel <= v4.14, inherit the kernel_wireless_regdb.bbclass
+# (in meta-networking) in kernel's recipe.
+PACKAGES =+ "${PN}-static"
+RCONFLICTS_${PN} = "${PN}-static"
+
+FILES_${PN}-static = " \
+    ${nonarch_base_libdir}/firmware/regulatory.db \
+    ${nonarch_base_libdir}/firmware/regulatory.db.p7s \
+"
+
+# Native users might want to use the source of regulatory DB.
+# This is for example used by Linux kernel <= v4.14 and
+# kernel_wireless_regdb.bbclass in meta-networking.
+do_install_append_class-native() {
+    install -m 0644 -D db.txt ${D}${libdir}/crda/db.txt
+}
+
+RSUGGESTS_${PN} = "crda"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


