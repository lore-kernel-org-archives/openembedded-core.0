Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8049660777
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 12:58:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 05:58:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,436,1520924400"; d="scan'208";a="53510710"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 24 May 2018 05:58:43 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 15:58:50 +0300
Message-Id: <20180524125850.5942-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] udev: only run qemu from postinst scripts if qemu usermode is supported
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
X-List-Received-Date: Thu, 24 May 2018 12:58:44 -0000

Otherwise, there would be a failure at image creation time; avoid
that by postponing to first boot explicitly.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/systemd/systemd_237.bb | 10 +++++++---
 meta/recipes-core/udev/eudev_3.2.5.bb    |  8 ++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index b7c2113255f..91783f2ffbe 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -580,9 +580,13 @@ pkg_prerm_${PN} () {
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
-		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
-			--root $D
-		chown root:root $D${sysconfdir}/udev/hwdb.bin
+		if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
+			${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
+				--root $D
+			chown root:root $D${sysconfdir}/udev/hwdb.bin
+		else
+			$INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
+		fi
 	else
 		udevadm hwdb --update
 	fi
diff --git a/meta/recipes-core/udev/eudev_3.2.5.bb b/meta/recipes-core/udev/eudev_3.2.5.bb
index 88ad8f1b375..75617c8d4ec 100644
--- a/meta/recipes-core/udev/eudev_3.2.5.bb
+++ b/meta/recipes-core/udev/eudev_3.2.5.bb
@@ -80,8 +80,12 @@ RPROVIDES_eudev-hwdb += "udev-hwdb"
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst_eudev-hwdb () {
     if test -n "$D"; then
-        ${@qemu_run_binary(d, '$D', '${bindir}/udevadm')} hwdb --update --root $D
-        chown root:root $D${sysconfdir}/udev/hwdb.bin
+        if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
+            ${@qemu_run_binary(d, '$D', '${bindir}/udevadm')} hwdb --update --root $D
+            chown root:root $D${sysconfdir}/udev/hwdb.bin
+        else
+            $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
+        fi
     else
         udevadm hwdb --update
     fi
-- 
2.17.0


