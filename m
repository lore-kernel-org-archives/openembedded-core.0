Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136B6C46CD4
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 14:47:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.45511.1702910852353229137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 06:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Y8SSthSt;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702910856; x=1734446856;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=nYfg2WwXQUdZH+9RgIGBbEgxk/fFUdrvPmBZqunWsOM=;
  b=Y8SSthStU2Ejr6eyzCcLMO0xNjwdhh3+LjE98b/Nk7391phlfDtnc3iO
   6dkeFiAG9/x6akB8JVzPOfwcLZ30TMqjuMyu6+0pkNTExmHQD0s8rY/+E
   T29pV9MakHHI+YsXd88h+lFNTQyzLT/pj/9uSOfJu3xAZowzmXPHBscD2
   cPi5l+iKD+gJN7SgPm0P0NdRNWmwM6cOnXGgvpqPOSzAMpbtkjtxt+Shw
   NvODNdKcQ+zmzgWz9vgTGsZ8OqZLoftmmByTic4d0TEFybh+Biez+DrKC
   kGI70k9quQpkaJwj/BZJ79tzdek5Cz7J5hF9ABnKsWyfMld5wkdWeDjCi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2350875"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2350875"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="23802884"
Received: from jsuah-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.240.31])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:34 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] bluez5: upgrade 5.70 -> 5.71
Date: Mon, 18 Dec 2023 22:47:18 +0800
Message-ID: <20231218144724.7794-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218144724.7794-1-anuj.mittal@intel.com>
References: <20231218144724.7794-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192648

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   2 -
 .../0001-test-gatt-Fix-hung-issue.patch       |   2 +-
 ...et-for-building-tests-without-runnin.patch |   6 +-
 ...e_probe-failing-if-SDP-record-is-not.patch | 313 ------------------
 ...shared-util.c-include-linux-limits.h.patch |   7 +-
 .../bluez5/bluez5/CVE-2023-45866.patch        |  56 ----
 .../bluez5/{bluez5_5.70.bb => bluez5_5.71.bb} |   2 +-
 7 files changed, 9 insertions(+), 379 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.70.bb => bluez5_5.71.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 0bb157e2024..e10158a6e5e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -55,8 +55,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0004-src-shared-util.c-include-linux-limits.h.patch \
-           file://0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch \
-	   file://CVE-2023-45866.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
index 06ebf1cde69..3546c7c305b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -1,4 +1,4 @@
-From 7dcc5f46a31ac4eaa67c0ab3aaae38005db7458f Mon Sep 17 00:00:00 2001
+From e8808a2f5e17d375411c7409eaffb17e72f65022 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <Mingli.Yu@windriver.com>
 Date: Fri, 24 Aug 2018 12:04:03 +0800
 Subject: [PATCH] test-gatt: Fix hung issue
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
index 7c47cc1a1ec..be050935515 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -1,4 +1,4 @@
-From a657fddd13a2e756b0af315301f1c44081e2f668 Mon Sep 17 00:00:00 2001
+From 3724958858b0ee430f37fb83388c3737d2039a3a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 1 Apr 2016 17:07:34 +0300
 Subject: [PATCH] tests: add a target for building tests without running them
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 7041f8e..25966cd 100644
+index e7221bd..9595fd1 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -594,6 +594,9 @@ endif
+@@ -710,6 +710,9 @@ endif
  TESTS = $(unit_tests)
  AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
  
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch b/meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch
deleted file mode 100644
index d0884338db0..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch
+++ /dev/null
@@ -1,313 +0,0 @@
-From 3a9c637010f8dc1ba3e8382abe01065761d4f5bb Mon Sep 17 00:00:00 2001
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-Date: Tue, 10 Oct 2023 12:38:29 -0700
-Subject: [PATCH 02/40] input: Fix .device_probe failing if SDP record is not
- found
-
-Due to changes introduced by 67a26abe53bf
-("profile: Add probe_on_discover flag") profiles may get probed when
-their profile UUID are discovered, rather than resolved, which means
-the SDP record may not be available.
-
-Fixes: https://github.com/bluez/bluez/issues/614
-
-Upstream-Status: Backport [https://github.com/bluez/bluez/commit/3a9c637010f8dc1ba3e8382abe01065761d4f5bb]
----
- profiles/input/device.c | 182 +++++++++++++++++++---------------------
- 1 file changed, 84 insertions(+), 98 deletions(-)
-
-diff --git a/profiles/input/device.c b/profiles/input/device.c
-index e2ac6ea60..4a50ea992 100644
---- a/profiles/input/device.c
-+++ b/profiles/input/device.c
-@@ -60,7 +60,7 @@ struct input_device {
- 	char			*path;
- 	bdaddr_t		src;
- 	bdaddr_t		dst;
--	uint32_t		handle;
-+	const sdp_record_t	*rec;
- 	GIOChannel		*ctrl_io;
- 	GIOChannel		*intr_io;
- 	guint			ctrl_watch;
-@@ -754,7 +754,8 @@ static void epox_endian_quirk(unsigned char *data, int size)
- 	}
- }
- 
--static int create_hid_dev_name(sdp_record_t *rec, struct hidp_connadd_req *req)
-+static int create_hid_dev_name(const sdp_record_t *rec,
-+					struct hidp_connadd_req *req)
- {
- 	char sdesc[sizeof(req->name) / 2];
- 
-@@ -776,7 +777,7 @@ static int create_hid_dev_name(sdp_record_t *rec, struct hidp_connadd_req *req)
- 
- /* See HID profile specification v1.0, "7.11.6 HIDDescriptorList" for details
-  * on the attribute format. */
--static int extract_hid_desc_data(sdp_record_t *rec,
-+static int extract_hid_desc_data(const sdp_record_t *rec,
- 						struct hidp_connadd_req *req)
- {
- 	sdp_data_t *d;
-@@ -817,36 +818,40 @@ invalid_desc:
- 	return -EINVAL;
- }
- 
--static int extract_hid_record(sdp_record_t *rec, struct hidp_connadd_req *req)
-+static int extract_hid_record(struct input_device *idev,
-+					struct hidp_connadd_req *req)
- {
- 	sdp_data_t *pdlist;
- 	uint8_t attr_val;
- 	int err;
- 
--	err = create_hid_dev_name(rec, req);
-+	if (!idev->rec)
-+		return -ENOENT;
-+
-+	err = create_hid_dev_name(idev->rec, req);
- 	if (err < 0)
- 		DBG("No valid Service Name or Service Description found");
- 
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_PARSER_VERSION);
-+	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_PARSER_VERSION);
- 	req->parser = pdlist ? pdlist->val.uint16 : 0x0100;
- 
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_DEVICE_SUBCLASS);
-+	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_DEVICE_SUBCLASS);
- 	req->subclass = pdlist ? pdlist->val.uint8 : 0;
- 
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_COUNTRY_CODE);
-+	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_COUNTRY_CODE);
- 	req->country = pdlist ? pdlist->val.uint8 : 0;
- 
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_VIRTUAL_CABLE);
-+	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_VIRTUAL_CABLE);
- 	attr_val = pdlist ? pdlist->val.uint8 : 0;
- 	if (attr_val)
- 		req->flags |= (1 << HIDP_VIRTUAL_CABLE_UNPLUG);
- 
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_BOOT_DEVICE);
-+	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_BOOT_DEVICE);
- 	attr_val = pdlist ? pdlist->val.uint8 : 0;
- 	if (attr_val)
- 		req->flags |= (1 << HIDP_BOOT_PROTOCOL_MODE);
- 
--	err = extract_hid_desc_data(rec, req);
-+	err = extract_hid_desc_data(idev->rec, req);
- 	if (err < 0)
- 		return err;
- 
-@@ -1035,11 +1040,6 @@ static gboolean encrypt_notify(GIOChannel *io, GIOCondition condition,
- static int hidp_add_connection(struct input_device *idev)
- {
- 	struct hidp_connadd_req *req;
--	sdp_record_t *rec;
--	char src_addr[18], dst_addr[18];
--	char filename[PATH_MAX];
--	GKeyFile *key_file;
--	char handle[11], *str;
- 	GError *gerr = NULL;
- 	int err;
- 
-@@ -1049,33 +1049,7 @@ static int hidp_add_connection(struct input_device *idev)
- 	req->flags     = 0;
- 	req->idle_to   = idle_timeout;
- 
--	ba2str(&idev->src, src_addr);
--	ba2str(&idev->dst, dst_addr);
--
--	snprintf(filename, PATH_MAX, STORAGEDIR "/%s/cache/%s", src_addr,
--								dst_addr);
--	sprintf(handle, "0x%8.8X", idev->handle);
--
--	key_file = g_key_file_new();
--	if (!g_key_file_load_from_file(key_file, filename, 0, &gerr)) {
--		error("Unable to load key file from %s: (%s)", filename,
--								gerr->message);
--		g_clear_error(&gerr);
--	}
--	str = g_key_file_get_string(key_file, "ServiceRecords", handle, NULL);
--	g_key_file_free(key_file);
--
--	if (!str) {
--		error("Rejected connection from unknown device %s", dst_addr);
--		err = -EPERM;
--		goto cleanup;
--	}
--
--	rec = record_from_string(str);
--	g_free(str);
--
--	err = extract_hid_record(rec, req);
--	sdp_record_free(rec);
-+	err = extract_hid_record(idev, req);
- 	if (err < 0) {
- 		error("Could not parse HID SDP record: %s (%d)", strerror(-err),
- 									-err);
-@@ -1091,7 +1065,7 @@ static int hidp_add_connection(struct input_device *idev)
- 
- 	/* Make sure the device is bonded if required */
- 	if (classic_bonded_only && !input_device_bonded(idev)) {
--		error("Rejected connection from !bonded device %s", dst_addr);
-+		error("Rejected connection from !bonded device %s", idev->path);
- 		goto cleanup;
- 	}
- 
-@@ -1161,6 +1135,68 @@ static int connection_disconnect(struct input_device *idev, uint32_t flags)
- 		return ioctl_disconnect(idev, flags);
- }
- 
-+static bool is_device_sdp_disable(const sdp_record_t *rec)
-+{
-+	sdp_data_t *data;
-+
-+	data = sdp_data_get(rec, SDP_ATTR_HID_SDP_DISABLE);
-+
-+	return data && data->val.uint8;
-+}
-+
-+static enum reconnect_mode_t hid_reconnection_mode(bool reconnect_initiate,
-+						bool normally_connectable)
-+{
-+	if (!reconnect_initiate && !normally_connectable)
-+		return RECONNECT_NONE;
-+	else if (!reconnect_initiate && normally_connectable)
-+		return RECONNECT_HOST;
-+	else if (reconnect_initiate && !normally_connectable)
-+		return RECONNECT_DEVICE;
-+	else /* (reconnect_initiate && normally_connectable) */
-+		return RECONNECT_ANY;
-+}
-+
-+static void extract_hid_props(struct input_device *idev,
-+					const sdp_record_t *rec)
-+{
-+	/* Extract HID connectability */
-+	bool reconnect_initiate, normally_connectable;
-+	sdp_data_t *pdlist;
-+
-+	/* HIDNormallyConnectable is optional and assumed FALSE if not
-+	 * present.
-+	 */
-+	pdlist = sdp_data_get(rec, SDP_ATTR_HID_RECONNECT_INITIATE);
-+	reconnect_initiate = pdlist ? pdlist->val.uint8 : TRUE;
-+
-+	pdlist = sdp_data_get(rec, SDP_ATTR_HID_NORMALLY_CONNECTABLE);
-+	normally_connectable = pdlist ? pdlist->val.uint8 : FALSE;
-+
-+	/* Update local values */
-+	idev->reconnect_mode =
-+		hid_reconnection_mode(reconnect_initiate, normally_connectable);
-+}
-+
-+static void input_device_update_rec(struct input_device *idev)
-+{
-+	struct btd_profile *p = btd_service_get_profile(idev->service);
-+	const sdp_record_t *rec;
-+
-+	rec = btd_device_get_record(idev->device, p->remote_uuid);
-+	if (!rec || idev->rec == rec)
-+		return;
-+
-+	idev->rec = rec;
-+	idev->disable_sdp = is_device_sdp_disable(rec);
-+
-+	/* Initialize device properties */
-+	extract_hid_props(idev, rec);
-+
-+	if (idev->disable_sdp)
-+		device_set_refresh_discovery(idev->device, false);
-+}
-+
- static int input_device_connected(struct input_device *idev)
- {
- 	int err;
-@@ -1168,6 +1204,9 @@ static int input_device_connected(struct input_device *idev)
- 	if (idev->intr_io == NULL || idev->ctrl_io == NULL)
- 		return -ENOTCONN;
- 
-+	/* Attempt to update SDP record if it had changed */
-+	input_device_update_rec(idev);
-+
- 	err = hidp_add_connection(idev);
- 	if (err < 0)
- 		return err;
-@@ -1411,74 +1450,21 @@ int input_device_disconnect(struct btd_service *service)
- 	return 0;
- }
- 
--static bool is_device_sdp_disable(const sdp_record_t *rec)
--{
--	sdp_data_t *data;
--
--	data = sdp_data_get(rec, SDP_ATTR_HID_SDP_DISABLE);
--
--	return data && data->val.uint8;
--}
--
--static enum reconnect_mode_t hid_reconnection_mode(bool reconnect_initiate,
--						bool normally_connectable)
--{
--	if (!reconnect_initiate && !normally_connectable)
--		return RECONNECT_NONE;
--	else if (!reconnect_initiate && normally_connectable)
--		return RECONNECT_HOST;
--	else if (reconnect_initiate && !normally_connectable)
--		return RECONNECT_DEVICE;
--	else /* (reconnect_initiate && normally_connectable) */
--		return RECONNECT_ANY;
--}
--
--static void extract_hid_props(struct input_device *idev,
--					const sdp_record_t *rec)
--{
--	/* Extract HID connectability */
--	bool reconnect_initiate, normally_connectable;
--	sdp_data_t *pdlist;
--
--	/* HIDNormallyConnectable is optional and assumed FALSE
--	* if not present. */
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_RECONNECT_INITIATE);
--	reconnect_initiate = pdlist ? pdlist->val.uint8 : TRUE;
--
--	pdlist = sdp_data_get(rec, SDP_ATTR_HID_NORMALLY_CONNECTABLE);
--	normally_connectable = pdlist ? pdlist->val.uint8 : FALSE;
--
--	/* Update local values */
--	idev->reconnect_mode =
--		hid_reconnection_mode(reconnect_initiate, normally_connectable);
--}
--
- static struct input_device *input_device_new(struct btd_service *service)
- {
- 	struct btd_device *device = btd_service_get_device(service);
--	struct btd_profile *p = btd_service_get_profile(service);
- 	const char *path = device_get_path(device);
--	const sdp_record_t *rec = btd_device_get_record(device, p->remote_uuid);
- 	struct btd_adapter *adapter = device_get_adapter(device);
- 	struct input_device *idev;
- 
--	if (!rec)
--		return NULL;
--
- 	idev = g_new0(struct input_device, 1);
- 	bacpy(&idev->src, btd_adapter_get_address(adapter));
- 	bacpy(&idev->dst, device_get_address(device));
- 	idev->service = btd_service_ref(service);
- 	idev->device = btd_device_ref(device);
- 	idev->path = g_strdup(path);
--	idev->handle = rec->handle;
--	idev->disable_sdp = is_device_sdp_disable(rec);
--
--	/* Initialize device properties */
--	extract_hid_props(idev, rec);
- 
--	if (idev->disable_sdp)
--		device_set_refresh_discovery(device, false);
-+	input_device_update_rec(idev);
- 
- 	return idev;
- }
--- 
-2.42.0
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
index f954f6dab2d..6ef135327d0 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/0004-src-shared-util.c-include-linux-limits.h.patch
@@ -1,4 +1,4 @@
-From 51584158b9a2e58f3790f8a7387b5cf167eca88b Mon Sep 17 00:00:00 2001
+From ad069fadfcce2cf70f45b1c4a42665448675297e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 12 Dec 2022 13:10:19 +0100
 Subject: [PATCH] src/shared/util.c: include linux/limits.h
@@ -8,15 +8,16 @@ systems such as those using musl.
 
 Upstream-Status: Submitted [to linux-bluetooth@vger.kernel.org,luiz.von.dentz@intel.com,frederic.danis@collabora.com]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  src/shared/util.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/shared/util.c b/src/shared/util.c
-index 0a0308c..1f61314 100644
+index 34491f4..412f3ad 100644
 --- a/src/shared/util.c
 +++ b/src/shared/util.c
-@@ -22,6 +22,7 @@
+@@ -23,6 +23,7 @@
  #include <unistd.h>
  #include <dirent.h>
  #include <limits.h>
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
deleted file mode 100644
index 5bb31d866aa..00000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-45866.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 25a471a83e02e1effb15d5a488b3f0085eaeb675 Mon Sep 17 00:00:00 2001
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-Date: Tue, 10 Oct 2023 13:03:12 -0700
-Subject: [PATCH] input.conf: Change default of ClassicBondedOnly
-
-This changes the default of ClassicBondedOnly since defaulting to false
-is not inline with HID specification which mandates the of Security Mode
-4:
-
-BLUETOOTH SPECIFICATION Page 84 of 123
-Human Interface Device (HID) Profile:
-
-  5.4.3.4.2 Security Modes
-  Bluetooth HID Hosts shall use Security Mode 4 when interoperating with
-  Bluetooth HID devices that are compliant to the Bluetooth Core
-  Specification v2.1+EDR[6].
-
-Upstream-Status: Backport
-[https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/profiles/input?id=25a471a83e02e1effb15d5a488b3f0085eaeb675]
-
-CVE: CVE-2023-45866
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- profiles/input/device.c   | 2 +-
- profiles/input/input.conf | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/profiles/input/device.c b/profiles/input/device.c
-index 4a50ea9..4310dd1 100644
---- a/profiles/input/device.c
-+++ b/profiles/input/device.c
-@@ -81,7 +81,7 @@ struct input_device {
-
- static int idle_timeout = 0;
- static bool uhid_enabled = false;
--static bool classic_bonded_only = false;
-+static bool classic_bonded_only = true;
-
- void input_set_idle_timeout(int timeout)
- {
-diff --git a/profiles/input/input.conf b/profiles/input/input.conf
-index 4c70bc5..d8645f3 100644
---- a/profiles/input/input.conf
-+++ b/profiles/input/input.conf
-@@ -17,7 +17,7 @@
- # platforms may want to make sure that input connections only come from bonded
- # device connections. Several older mice have been known for not supporting
- # pairing/encryption.
--# Defaults to false to maximize device compatibility.
-+# Defaults to true for security.
- #ClassicBondedOnly=true
-
- # LE upgrade security
---
-2.40.0
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.70.bb b/meta/recipes-connectivity/bluez5/bluez5_5.71.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.70.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.71.bb
index 2e3b782e6e7..b9bc3dd1b67 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.70.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.71.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "37e372e916955e144cb882f888e4be40898f10ae3b7c213ddcdd55ee9c009278"
+SRC_URI[sha256sum] = "b828d418c93ced1f55b616fb5482cf01537440bfb34fbda1a564f3ece94735d8"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.43.0


