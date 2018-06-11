Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id C7F5378BA2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 13:37:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jun 2018 06:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,502,1520924400"; d="scan'208";a="46241299"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga007.fm.intel.com with ESMTP; 11 Jun 2018 06:37:59 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 16:38:19 +0300
Message-Id: <20180611133822.32004-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180611133822.32004-1-alexander.kanavin@linux.intel.com>
References: <20180611133822.32004-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/6] udev: only run qemu from postinst scripts if qemu usermode is supported
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
X-List-Received-Date: Mon, 11 Jun 2018 13:37:58 -0000

Otherwise, there would be a failure at image creation time; avoid
that by postponing to first boot explicitly.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/systemd/systemd_237.bb | 10 +++++++---
 meta/recipes-core/udev/eudev_3.2.5.bb    |  8 ++++++--
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 2e6558ded13..22058e9bf6b 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -582,9 +582,13 @@ pkg_prerm_${PN} () {
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


