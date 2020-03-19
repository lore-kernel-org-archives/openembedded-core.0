Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4B909605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 02:15:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,569,1574092800"; d="scan'208";a="86569344"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Mar 2020 10:15:07 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id DB63E49DF12D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 10:04:59 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Thu, 19 Mar 2020 10:14:59 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Mar 2020 10:15:07 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Mar 2020 00:41:42 -0700
Message-ID: <1584603707-43423-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: DB63E49DF12D.A931E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] bluez5: upgrade 5.53 -> 5.54
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
X-List-Received-Date: Thu, 19 Mar 2020 02:15:11 -0000
Content-Type: text/plain

CVE-2020-0556-1.patch
CVE-2020-0556-2.patch
removed since they are included in 5.54

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   2 -
 .../bluez5/bluez5/CVE-2020-0556-1.patch       |  35 -----
 .../bluez5/bluez5/CVE-2020-0556-2.patch       | 143 ------------------
 .../bluez5/{bluez5_5.53.bb => bluez5_5.54.bb} |   4 +-
 4 files changed, 2 insertions(+), 182 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-1.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-2.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.53.bb => bluez5_5.54.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 708fa1ccec..150d909d73 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -52,8 +52,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
-           file://CVE-2020-0556-1.patch \
-           file://CVE-2020-0556-2.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-1.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-1.patch
deleted file mode 100644
index a6bf31e14b..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-1.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 8cdbd3b09f29da29374e2f83369df24228da0ad1 Mon Sep 17 00:00:00 2001
-From: Alain Michaud <alainm@chromium.org>
-Date: Tue, 10 Mar 2020 02:35:16 +0000
-Subject: [PATCH 1/2] HOGP must only accept data from bonded devices.
-
-HOGP 1.0 Section 6.1 establishes that the HOGP must require bonding.
-
-Reference:
-https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00352.htm
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=8cdbd3b09f29da29374e2f83369df24228da0ad1]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-CVE: CVE-2020-0556
----
- profiles/input/hog.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/profiles/input/hog.c b/profiles/input/hog.c
-index 83c017dcb..dfac68921 100644
---- a/profiles/input/hog.c
-+++ b/profiles/input/hog.c
-@@ -186,6 +186,10 @@ static int hog_accept(struct btd_service *service)
- 			return -EINVAL;
- 	}
- 
-+	/* HOGP 1.0 Section 6.1 requires bonding */
-+	if (!device_is_bonded(device, btd_device_get_bdaddr_type(device)))
-+		return -ECONNREFUSED;
-+
- 	/* TODO: Replace GAttrib with bt_gatt_client */
- 	bt_hog_attach(dev->hog, attrib);
- 
--- 
-2.24.1
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-2.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-2.patch
deleted file mode 100644
index 8acb2f15ec..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-2.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From 3cccdbab2324086588df4ccf5f892fb3ce1f1787 Mon Sep 17 00:00:00 2001
-From: Alain Michaud <alainm@chromium.org>
-Date: Tue, 10 Mar 2020 02:35:18 +0000
-Subject: [PATCH 2/2] HID accepts bonded device connections only.
-
-This change adds a configuration for platforms to choose a more secure
-posture for the HID profile.  While some older mice are known to not
-support pairing or encryption, some platform may choose a more secure
-posture by requiring the device to be bonded  and require the
-connection to be encrypted when bonding is required.
-
-Reference:
-https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00352.html
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=3cccdbab2324086588df4ccf5f892fb3ce1f1787]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-CVE: CVE-2020-0556
-
----
- profiles/input/device.c   | 23 ++++++++++++++++++++++-
- profiles/input/device.h   |  1 +
- profiles/input/input.conf |  8 ++++++++
- profiles/input/manager.c  | 13 ++++++++++++-
- 4 files changed, 43 insertions(+), 2 deletions(-)
-
-diff --git a/profiles/input/device.c b/profiles/input/device.c
-index 2cb3811c8..d89da2d7c 100644
---- a/profiles/input/device.c
-+++ b/profiles/input/device.c
-@@ -92,6 +92,7 @@ struct input_device {
- 
- static int idle_timeout = 0;
- static bool uhid_enabled = false;
-+static bool classic_bonded_only = false;
- 
- void input_set_idle_timeout(int timeout)
- {
-@@ -103,6 +104,11 @@ void input_enable_userspace_hid(bool state)
- 	uhid_enabled = state;
- }
- 
-+void input_set_classic_bonded_only(bool state)
-+{
-+	classic_bonded_only = state;
-+}
-+
- static void input_device_enter_reconnect_mode(struct input_device *idev);
- static int connection_disconnect(struct input_device *idev, uint32_t flags);
- 
-@@ -970,8 +976,18 @@ static int hidp_add_connection(struct input_device *idev)
- 	if (device_name_known(idev->device))
- 		device_get_name(idev->device, req->name, sizeof(req->name));
- 
-+	/* Make sure the device is bonded if required */
-+	if (classic_bonded_only && !device_is_bonded(idev->device,
-+				btd_device_get_bdaddr_type(idev->device))) {
-+		error("Rejected connection from !bonded device %s", dst_addr);
-+		goto cleanup;
-+	}
-+
- 	/* Encryption is mandatory for keyboards */
--	if (req->subclass & 0x40) {
-+	/* Some platforms may choose to require encryption for all devices */
-+	/* Note that this only matters for pre 2.1 devices as otherwise the */
-+	/* device is encrypted by default by the lower layers */
-+	if (classic_bonded_only || req->subclass & 0x40) {
- 		if (!bt_io_set(idev->intr_io, &gerr,
- 					BT_IO_OPT_SEC_LEVEL, BT_IO_SEC_MEDIUM,
- 					BT_IO_OPT_INVALID)) {
-@@ -1203,6 +1219,11 @@ static void input_device_enter_reconnect_mode(struct input_device *idev)
- 	DBG("path=%s reconnect_mode=%s", idev->path,
- 				reconnect_mode_to_string(idev->reconnect_mode));
- 
-+	/* Make sure the device is bonded if required */
-+	if (classic_bonded_only && !device_is_bonded(idev->device,
-+				btd_device_get_bdaddr_type(idev->device)))
-+		return;
-+
- 	/* Only attempt an auto-reconnect when the device is required to
- 	 * accept reconnections from the host.
- 	 */
-diff --git a/profiles/input/device.h b/profiles/input/device.h
-index 51a9aee18..3044db673 100644
---- a/profiles/input/device.h
-+++ b/profiles/input/device.h
-@@ -29,6 +29,7 @@ struct input_conn;
- 
- void input_set_idle_timeout(int timeout);
- void input_enable_userspace_hid(bool state);
-+void input_set_classic_bonded_only(bool state);
- 
- int input_device_register(struct btd_service *service);
- void input_device_unregister(struct btd_service *service);
-diff --git a/profiles/input/input.conf b/profiles/input/input.conf
-index 3e1d65aae..166aff4a4 100644
---- a/profiles/input/input.conf
-+++ b/profiles/input/input.conf
-@@ -11,3 +11,11 @@
- # Enable HID protocol handling in userspace input profile
- # Defaults to false (HIDP handled in HIDP kernel module)
- #UserspaceHID=true
-+
-+# Limit HID connections to bonded devices
-+# The HID Profile does not specify that devices must be bonded, however some
-+# platforms may want to make sure that input connections only come from bonded
-+# device connections. Several older mice have been known for not supporting
-+# pairing/encryption.
-+# Defaults to false to maximize device compatibility.
-+#ClassicBondedOnly=true
-diff --git a/profiles/input/manager.c b/profiles/input/manager.c
-index 1d31b0652..5cd27b839 100644
---- a/profiles/input/manager.c
-+++ b/profiles/input/manager.c
-@@ -96,7 +96,7 @@ static int input_init(void)
- 	config = load_config_file(CONFIGDIR "/input.conf");
- 	if (config) {
- 		int idle_timeout;
--		gboolean uhid_enabled;
-+		gboolean uhid_enabled, classic_bonded_only;
- 
- 		idle_timeout = g_key_file_get_integer(config, "General",
- 							"IdleTimeout", &err);
-@@ -114,6 +114,17 @@ static int input_init(void)
- 			input_enable_userspace_hid(uhid_enabled);
- 		} else
- 			g_clear_error(&err);
-+
-+		classic_bonded_only = g_key_file_get_boolean(config, "General",
-+						"ClassicBondedOnly", &err);
-+
-+		if (!err) {
-+			DBG("input.conf: ClassicBondedOnly=%s",
-+					classic_bonded_only ? "true" : "false");
-+			input_set_classic_bonded_only(classic_bonded_only);
-+		} else
-+			g_clear_error(&err);
-+
- 	}
- 
- 	btd_profile_register(&input_profile);
--- 
-2.24.1
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.53.bb b/meta/recipes-connectivity/bluez5/bluez5_5.54.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.53.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.54.bb
index 055e76bcf1..260eee1402 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.53.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.54.bb
@@ -1,7 +1,7 @@
 require bluez5.inc
 
-SRC_URI[md5sum] = "85b14abb138948f50b1650aa866cb019"
-SRC_URI[sha256sum] = "38aa2da8302fefad53116bb281a11968732a42eeb19c5fb3668342f39b7938bc"
+SRC_URI[md5sum] = "e637feb2dbb7582bbbff1708367a847c"
+SRC_URI[sha256sum] = "68cdab9e63e8832b130d5979dc8c96fdb087b31278f342874d992af3e56656dc"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.17.1




