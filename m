Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1707CBE7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 22:32:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 May 2019 15:32:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,520,1549958400"; d="scan'208";a="179022085"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.65.10])
	by fmsmga002.fm.intel.com with ESMTP; 27 May 2019 15:32:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2019 06:32:10 +0800
Message-Id: <20190527223210.22253-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527134419.14223-1-anuj.mittal@intel.com>
References: <20190527134419.14223-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH v2] Revert "pigz: pigz is not gzip"
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
X-List-Received-Date: Mon, 27 May 2019 22:32:14 -0000
Content-Transfer-Encoding: 8bit

This reverts commit a54c59f2a24904daffe51582b6863eebd071db0d.

The compatibility issues have since been resolved [1][2] and pigz 2.4
annoucement also states that this can be considered as a drop-in
replacemment [3] now.

[1] https://github.com/madler/pigz/commit/33c140e5fdc5cd639d1e7cc3c5e52ec016aa8a65
[2] https://github.com/madler/pigz/commit/6fda8570f633ec582ba72ea00dad2bbac825bc17
[3] https://zlib.net/pipermail/pigz-announce_zlib.net/2017-December/000028.html

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../conf/distro/include/default-providers.inc |  1 +
 meta/recipes-extended/pigz/pigz_2.4.bb        | 21 ++++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 21419038f0..2be3378773 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -42,6 +42,7 @@ PREFERRED_PROVIDER_opkg ?= "opkg"
 PREFERRED_PROVIDER_opkg-native ?= "opkg-native"
 PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
+PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
 PREFERRED_RPROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez-hcidump',d)}"
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
diff --git a/meta/recipes-extended/pigz/pigz_2.4.bb b/meta/recipes-extended/pigz/pigz_2.4.bb
index 6e6da9c3c5..974c035147 100644
--- a/meta/recipes-extended/pigz/pigz_2.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.4.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline
 SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
 SRC_URI[md5sum] = "def2f6e19d9d8231445adc1349d346df"
 SRC_URI[sha256sum] = "a4f816222a7b4269bd232680590b579ccc72591f1bb5adafcd7208ca77e14f73"
+PROVIDES_class-native += "gzip-native"
+
 # Point this at the homepage in case /fossils/ isn't updated
 UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
 UPSTREAM_CHECK_REGEX = "pigz-(?P<pver>.*)\.tar"
@@ -19,7 +21,9 @@ DEPENDS = "zlib"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-do_install() {
+inherit update-alternatives
+
+do_install_class-target() {
 	# Install files into /bin (FHS), which is typical place for gzip
 	install -d ${D}${base_bindir}
 	install ${B}/pigz ${D}${base_bindir}/pigz
@@ -27,4 +31,19 @@ do_install() {
 	ln -nsf pigz ${D}${base_bindir}/pigzcat
 }
 
+do_install() {
+	install -d ${D}${bindir}
+	install ${B}/pigz ${D}${bindir}/gzip
+	ln -nsf gzip ${D}${bindir}/gunzip
+	ln -nsf gzip ${D}${bindir}/zcat
+}
+
+ALTERNATIVE_PRIORITY = "80"
+ALTERNATIVE_${PN} = "gunzip gzip zcat"
+ALTERNATIVE_${PN}_class-nativesdk = ""
+ALTERNATIVE_LINK_NAME[gunzip] = "${base_bindir}/gunzip"
+ALTERNATIVE_LINK_NAME[gzip] = "${base_bindir}/gzip"
+ALTERNATIVE_LINK_NAME[zcat] = "${base_bindir}/zcat"
+ALTERNATIVE_TARGET = "${base_bindir}/pigz"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


