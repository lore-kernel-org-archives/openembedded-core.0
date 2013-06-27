Return-Path: <rewitt@declaratino.com>
Received: from p3plsmtpa08-04.prod.phx3.secureserver.net
	(p3plsmtpa08-04.prod.phx3.secureserver.net [173.201.193.105])
	by mail.openembedded.org (Postfix) with ESMTP id 6A43A6AE37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 18:13:23 +0000 (UTC)
Received: from localhost.localdomain ([74.131.113.133])
	by p3plsmtpa08-04.prod.phx3.secureserver.net with 
	id tWDB1l00d2skrMm01WDPBV; Thu, 27 Jun 2013 11:13:23 -0700
From: Randy Witt <rewitt@declaratino.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2013 14:13:11 -0400
Message-Id: <1372356791-11390-1-git-send-email-rewitt@declaratino.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] image-systemd: Support enabling/disabling units at image creation time.
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
X-List-Received-Date: Thu, 27 Jun 2013 18:13:23 -0000

Sometimes it is useful to have a set of units that get enabled or
disabled for an image, but that aren't enabled by default during package
installation.

The image-systemd.bbclass allows for adding a list of whitespace
separated units to the SYSTEMD_UNITS_ENABLE, SYSTEMD_UNITS_DISABLE, or
SYSTEMD_UNITS_MASK variables, in order to run the corresponding systemctl
command only as a rootfs postprocess.

Signed-off-by: Randy Witt <rewitt@declaratino.com>
---
 meta/classes/image-systemd.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta/classes/image-systemd.bbclass

diff --git a/meta/classes/image-systemd.bbclass b/meta/classes/image-systemd.bbclass
new file mode 100644
index 0000000..f268a5c
--- /dev/null
+++ b/meta/classes/image-systemd.bbclass
@@ -0,0 +1,26 @@
+# Runs systemctl commands on the units in the SYSTEMD_UNITS_ENABLE,
+# SYSTEMD_UNITS_DISABLE, and SYSTEMD_UNITS_MASK variables. This bbclass
+# is intended to be inherited by image generation recipes.
+
+SYSTEMD_UNITS_ENABLE ??= ""
+SYSTEMD_UNITS_DISABLE ??= ""
+SYSTEMD_UNITS_MASK ??= ""
+
+run_systemctl_commands() {
+if type systemctl > /dev/null 2>&1; then
+	for unit in ${SYSTEMD_UNITS_ENABLE}; do
+		systemctl --root=${IMAGE_ROOTFS} enable ${unit} && continue
+		echo "WARNING: Could not enable unit ${unit}"
+	done
+	for unit in ${SYSTEMD_UNITS_DISABLE}; do
+		systemctl --root=${IMAGE_ROOTFS} disable ${unit} && continue
+		echo "WARNING: Could not disable unit ${unit}"
+	done
+	for unit in ${SYSTEMD_UNITS_MASK}; do
+		systemctl --root=${IMAGE_ROOTFS} mask ${unit} && continue
+		echo "WARNING: Could not mask unit ${unit}"
+	done
+fi
+}
+
+ROOTFS_POSTPROCESS_COMMAND += "run_systemctl_commands; "
-- 
1.8.1.4


