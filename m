Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 5151C60C70
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 16:31:36 +0000 (UTC)
IronPort-SDR: khu2xPxT1qLquxG4KoIajjy+CjxTne/mL66+LyKXkLYzigaOt031N/5WIbUswFkWabVqgjukNY
	sKqZ/mRe+paw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	16 Mar 2020 09:31:37 -0700
IronPort-SDR: 8XPjavd0wgGdgJEu7rCcSMuE/69hgieQDo9FBvn18RnWwzJFkBOYe8rDY4abRYdNHws8k5nmPi
	0deg08zh1TaA==
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; d="scan'208";a="390745680"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.148.157])
	by orsmga004-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2020 09:31:36 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 00:31:05 +0800
Message-Id: <c940e4b858d6be28b198770768117ecc098fa0d3.1584375668.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1584375668.git.anuj.mittal@intel.com>
References: <cover.1584375668.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH][zeus 7/7] bluez: fix CVE-2020-0556
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
X-List-Received-Date: Mon, 16 Mar 2020 16:31:36 -0000
Content-Transfer-Encoding: 8bit

It was discovered that BlueZ's HID and HOGP profiles implementations
don't specifically require bonding between the device and the host.

This creates an opportunity for an malicious device to connect to a
target host to either impersonate an existing HID device without
security or to cause an SDP or GATT service discovery to take place
which would allow HID reports to be injected to the input subsystem from
a non-bonded source.

(From OE-Core rev: d598f8eee0741148416e8660e10c716654205cb5)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bed169a07b04a7dc003958fa309e6ff761f85a72)
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   2 +
 .../bluez5/bluez5/CVE-2020-0556-1.patch       |  35 +++++
 .../bluez5/bluez5/CVE-2020-0556-2.patch       | 143 ++++++++++++++++++
 3 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-1.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-2.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index f582a07e22..75fc2dbf4c 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -58,6 +58,8 @@ SRC_URI = "\
     file://CVE-2018-10910.patch \
     file://gcc9-fixes.patch \
     file://0001-tools-Fix-build-after-y2038-changes-in-glibc.patch \
+    file://CVE-2020-0556-1.patch \
+    file://CVE-2020-0556-2.patch \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-1.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-1.patch
new file mode 100644
index 0000000000..a6bf31e14b
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-1.patch
@@ -0,0 +1,35 @@
+From 8cdbd3b09f29da29374e2f83369df24228da0ad1 Mon Sep 17 00:00:00 2001
+From: Alain Michaud <alainm@chromium.org>
+Date: Tue, 10 Mar 2020 02:35:16 +0000
+Subject: [PATCH 1/2] HOGP must only accept data from bonded devices.
+
+HOGP 1.0 Section 6.1 establishes that the HOGP must require bonding.
+
+Reference:
+https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00352.htm
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=8cdbd3b09f29da29374e2f83369df24228da0ad1]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+CVE: CVE-2020-0556
+---
+ profiles/input/hog.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/profiles/input/hog.c b/profiles/input/hog.c
+index 83c017dcb..dfac68921 100644
+--- a/profiles/input/hog.c
++++ b/profiles/input/hog.c
+@@ -186,6 +186,10 @@ static int hog_accept(struct btd_service *service)
+ 			return -EINVAL;
+ 	}
+ 
++	/* HOGP 1.0 Section 6.1 requires bonding */
++	if (!device_is_bonded(device, btd_device_get_bdaddr_type(device)))
++		return -ECONNREFUSED;
++
+ 	/* TODO: Replace GAttrib with bt_gatt_client */
+ 	bt_hog_attach(dev->hog, attrib);
+ 
+-- 
+2.24.1
+
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-2.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-2.patch
new file mode 100644
index 0000000000..8acb2f15ec
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-0556-2.patch
@@ -0,0 +1,143 @@
+From 3cccdbab2324086588df4ccf5f892fb3ce1f1787 Mon Sep 17 00:00:00 2001
+From: Alain Michaud <alainm@chromium.org>
+Date: Tue, 10 Mar 2020 02:35:18 +0000
+Subject: [PATCH 2/2] HID accepts bonded device connections only.
+
+This change adds a configuration for platforms to choose a more secure
+posture for the HID profile.  While some older mice are known to not
+support pairing or encryption, some platform may choose a more secure
+posture by requiring the device to be bonded  and require the
+connection to be encrypted when bonding is required.
+
+Reference:
+https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00352.html
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=3cccdbab2324086588df4ccf5f892fb3ce1f1787]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+CVE: CVE-2020-0556
+
+---
+ profiles/input/device.c   | 23 ++++++++++++++++++++++-
+ profiles/input/device.h   |  1 +
+ profiles/input/input.conf |  8 ++++++++
+ profiles/input/manager.c  | 13 ++++++++++++-
+ 4 files changed, 43 insertions(+), 2 deletions(-)
+
+diff --git a/profiles/input/device.c b/profiles/input/device.c
+index 2cb3811c8..d89da2d7c 100644
+--- a/profiles/input/device.c
++++ b/profiles/input/device.c
+@@ -92,6 +92,7 @@ struct input_device {
+ 
+ static int idle_timeout = 0;
+ static bool uhid_enabled = false;
++static bool classic_bonded_only = false;
+ 
+ void input_set_idle_timeout(int timeout)
+ {
+@@ -103,6 +104,11 @@ void input_enable_userspace_hid(bool state)
+ 	uhid_enabled = state;
+ }
+ 
++void input_set_classic_bonded_only(bool state)
++{
++	classic_bonded_only = state;
++}
++
+ static void input_device_enter_reconnect_mode(struct input_device *idev);
+ static int connection_disconnect(struct input_device *idev, uint32_t flags);
+ 
+@@ -970,8 +976,18 @@ static int hidp_add_connection(struct input_device *idev)
+ 	if (device_name_known(idev->device))
+ 		device_get_name(idev->device, req->name, sizeof(req->name));
+ 
++	/* Make sure the device is bonded if required */
++	if (classic_bonded_only && !device_is_bonded(idev->device,
++				btd_device_get_bdaddr_type(idev->device))) {
++		error("Rejected connection from !bonded device %s", dst_addr);
++		goto cleanup;
++	}
++
+ 	/* Encryption is mandatory for keyboards */
+-	if (req->subclass & 0x40) {
++	/* Some platforms may choose to require encryption for all devices */
++	/* Note that this only matters for pre 2.1 devices as otherwise the */
++	/* device is encrypted by default by the lower layers */
++	if (classic_bonded_only || req->subclass & 0x40) {
+ 		if (!bt_io_set(idev->intr_io, &gerr,
+ 					BT_IO_OPT_SEC_LEVEL, BT_IO_SEC_MEDIUM,
+ 					BT_IO_OPT_INVALID)) {
+@@ -1203,6 +1219,11 @@ static void input_device_enter_reconnect_mode(struct input_device *idev)
+ 	DBG("path=%s reconnect_mode=%s", idev->path,
+ 				reconnect_mode_to_string(idev->reconnect_mode));
+ 
++	/* Make sure the device is bonded if required */
++	if (classic_bonded_only && !device_is_bonded(idev->device,
++				btd_device_get_bdaddr_type(idev->device)))
++		return;
++
+ 	/* Only attempt an auto-reconnect when the device is required to
+ 	 * accept reconnections from the host.
+ 	 */
+diff --git a/profiles/input/device.h b/profiles/input/device.h
+index 51a9aee18..3044db673 100644
+--- a/profiles/input/device.h
++++ b/profiles/input/device.h
+@@ -29,6 +29,7 @@ struct input_conn;
+ 
+ void input_set_idle_timeout(int timeout);
+ void input_enable_userspace_hid(bool state);
++void input_set_classic_bonded_only(bool state);
+ 
+ int input_device_register(struct btd_service *service);
+ void input_device_unregister(struct btd_service *service);
+diff --git a/profiles/input/input.conf b/profiles/input/input.conf
+index 3e1d65aae..166aff4a4 100644
+--- a/profiles/input/input.conf
++++ b/profiles/input/input.conf
+@@ -11,3 +11,11 @@
+ # Enable HID protocol handling in userspace input profile
+ # Defaults to false (HIDP handled in HIDP kernel module)
+ #UserspaceHID=true
++
++# Limit HID connections to bonded devices
++# The HID Profile does not specify that devices must be bonded, however some
++# platforms may want to make sure that input connections only come from bonded
++# device connections. Several older mice have been known for not supporting
++# pairing/encryption.
++# Defaults to false to maximize device compatibility.
++#ClassicBondedOnly=true
+diff --git a/profiles/input/manager.c b/profiles/input/manager.c
+index 1d31b0652..5cd27b839 100644
+--- a/profiles/input/manager.c
++++ b/profiles/input/manager.c
+@@ -96,7 +96,7 @@ static int input_init(void)
+ 	config = load_config_file(CONFIGDIR "/input.conf");
+ 	if (config) {
+ 		int idle_timeout;
+-		gboolean uhid_enabled;
++		gboolean uhid_enabled, classic_bonded_only;
+ 
+ 		idle_timeout = g_key_file_get_integer(config, "General",
+ 							"IdleTimeout", &err);
+@@ -114,6 +114,17 @@ static int input_init(void)
+ 			input_enable_userspace_hid(uhid_enabled);
+ 		} else
+ 			g_clear_error(&err);
++
++		classic_bonded_only = g_key_file_get_boolean(config, "General",
++						"ClassicBondedOnly", &err);
++
++		if (!err) {
++			DBG("input.conf: ClassicBondedOnly=%s",
++					classic_bonded_only ? "true" : "false");
++			input_set_classic_bonded_only(classic_bonded_only);
++		} else
++			g_clear_error(&err);
++
+ 	}
+ 
+ 	btd_profile_register(&input_profile);
+-- 
+2.24.1
+
-- 
2.24.1


