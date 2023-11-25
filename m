Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77981C61D9D
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 12:11:23 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.23974.1700914280820492060
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Nov 2023 04:11:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 10AF3101BF
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 13:11:19 +0100 (CET)
Received: from [192.168.178.67] ([84.163.40.202]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r6rVG-13fwDg0; Sat, 25 Nov 2023 13:11:18 +0100
Date: Sat, 25 Nov 2023 13:11:54 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCHv2] bluez5: fix connection for ps5/dualshock
 controllers
To: openembedded-core@lists.openembedded.org
Message-Id: <UVHO4S.WDCJGGHDXA0B@t-online.de>
In-Reply-To: <179ADC7AF8073FA9.32091@lists.openembedded.org>
References: <179ADC7AF8073FA9.32091@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-5cKTzs4xyplAnOfzF/fB"
X-TOI-EXPURGATEID: 150726::1700914278-5101D95D-D33C41BF/0/0 CLEAN NORMAL
X-TOI-MSGID: 2748dbb8-68e7-481f-9fcb-a315c171ae13
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 12:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191229

--=-5cKTzs4xyplAnOfzF/fB
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 use git formatted patch

On Sat, Nov 25 2023 at 01:10:27 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Bluez 5.69 added a regression. Bluetooth connection for playstation 
> controllers
> stopped working. This adds a backport patch for the issue
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
>  ...e_probe-failing-if-SDP-record-is-not.patch | 313 
> ++++++++++++++++++
>  2 files changed, 314 insertions(+)
>  create mode 100644 
> meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch
> 
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc 
> b/meta/recipes-connectivity/bluez5/bluez5.inc
> index e10158a6e5..a23e4e58a6 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -55,6 +55,7 @@ SRC_URI = 
> "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
>             
> file://0001-tests-add-a-target-for-building-tests-without-runnin.patch 
> <file://0001-tests-add-a-target-for-building-tests-without-runnin.patch/> 
> \
>             file://0001-test-gatt-Fix-hung-issue.patch 
> <file://0001-test-gatt-fix-hung-issue.patch/> \
>             
> file://0004-src-shared-util.c-include-linux-limits.h.patch 
> <file://0004-src-shared-util.c-include-linux-limits.h.patch/> \
> +           
> file://0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch 
> <file://0002-input-fix-.device_probe-failing-if-sdp-record-is-not.patch/> 
> \
>             "
>  S = "${WORKDIR}/bluez-${PV}"
> 
> diff --git 
> a/meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch 
> b/meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch
> new file mode 100644
> index 0000000000..d0884338db
> --- /dev/null
> +++ 
> b/meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch
> @@ -0,0 +1,313 @@
> +From 3a9c637010f8dc1ba3e8382abe01065761d4f5bb Mon Sep 17 00:00:00 
> 2001
> +From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com 
> <mailto:luiz.von.dentz@intel.com>>
> +Date: Tue, 10 Oct 2023 12:38:29 -0700
> +Subject: [PATCH 02/40] input: Fix .device_probe failing if SDP 
> record is not
> + found
> +
> +Due to changes introduced by 67a26abe53bf
> +("profile: Add probe_on_discover flag") profiles may get probed when
> +their profile UUID are discovered, rather than resolved, which means
> +the SDP record may not be available.
> +
> +Fixes: <https://github.com/bluez/bluez/issues/614>
> +
> +Upstream-Status: Backport 
> [<https://github.com/bluez/bluez/commit/3a9c637010f8dc1ba3e8382abe01065761d4f5bb>]
> +---
> + profiles/input/device.c | 182 
> +++++++++++++++++++---------------------
> + 1 file changed, 84 insertions(+), 98 deletions(-)
> +
> +diff --git a/profiles/input/device.c b/profiles/input/device.c
> +index e2ac6ea60..4a50ea992 100644
> +--- a/profiles/input/device.c
> ++++ b/profiles/input/device.c
> +@@ -60,7 +60,7 @@ struct input_device {
> + 	char			*path;
> + 	bdaddr_t		src;
> + 	bdaddr_t		dst;
> +-	uint32_t		handle;
> ++	const sdp_record_t	*rec;
> + 	GIOChannel		*ctrl_io;
> + 	GIOChannel		*intr_io;
> + 	guint			ctrl_watch;
> +@@ -754,7 +754,8 @@ static void epox_endian_quirk(unsigned char 
> *data, int size)
> + 	}
> + }
> +
> +-static int create_hid_dev_name(sdp_record_t *rec, struct 
> hidp_connadd_req *req)
> ++static int create_hid_dev_name(const sdp_record_t *rec,
> ++					struct hidp_connadd_req *req)
> + {
> + 	char sdesc[sizeof(req->name) / 2];
> +
> +@@ -776,7 +777,7 @@ static int create_hid_dev_name(sdp_record_t 
> *rec, struct hidp_connadd_req *req)
> +
> + /* See HID profile specification v1.0, "7.11.6 HIDDescriptorList" 
> for details
> +  * on the attribute format. */
> +-static int extract_hid_desc_data(sdp_record_t *rec,
> ++static int extract_hid_desc_data(const sdp_record_t *rec,
> + 						struct hidp_connadd_req *req)
> + {
> + 	sdp_data_t *d;
> +@@ -817,36 +818,40 @@ invalid_desc:
> + 	return -EINVAL;
> + }
> +
> +-static int extract_hid_record(sdp_record_t *rec, struct 
> hidp_connadd_req *req)
> ++static int extract_hid_record(struct input_device *idev,
> ++					struct hidp_connadd_req *req)
> + {
> + 	sdp_data_t *pdlist;
> + 	uint8_t attr_val;
> + 	int err;
> +
> +-	err = create_hid_dev_name(rec, req);
> ++	if (!idev->rec)
> ++		return -ENOENT;
> ++
> ++	err = create_hid_dev_name(idev->rec, req);
> + 	if (err < 0)
> + 		DBG("No valid Service Name or Service Description found");
> +
> +-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_PARSER_VERSION);
> ++	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_PARSER_VERSION);
> + 	req->parser = pdlist ? pdlist->val.uint16 : 0x0100;
> +
> +-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_DEVICE_SUBCLASS);
> ++	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_DEVICE_SUBCLASS);
> + 	req->subclass = pdlist ? pdlist->val.uint8 : 0;
> +
> +-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_COUNTRY_CODE);
> ++	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_COUNTRY_CODE);
> + 	req->country = pdlist ? pdlist->val.uint8 : 0;
> +
> +-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_VIRTUAL_CABLE);
> ++	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_VIRTUAL_CABLE);
> + 	attr_val = pdlist ? pdlist->val.uint8 : 0;
> + 	if (attr_val)
> + 		req->flags |= (1 << HIDP_VIRTUAL_CABLE_UNPLUG);
> +
> +-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_BOOT_DEVICE);
> ++	pdlist = sdp_data_get(idev->rec, SDP_ATTR_HID_BOOT_DEVICE);
> + 	attr_val = pdlist ? pdlist->val.uint8 : 0;
> + 	if (attr_val)
> + 		req->flags |= (1 << HIDP_BOOT_PROTOCOL_MODE);
> +
> +-	err = extract_hid_desc_data(rec, req);
> ++	err = extract_hid_desc_data(idev->rec, req);
> + 	if (err < 0)
> + 		return err;
> +
> +@@ -1035,11 +1040,6 @@ static gboolean encrypt_notify(GIOChannel 
> *io, GIOCondition condition,
> + static int hidp_add_connection(struct input_device *idev)
> + {
> + 	struct hidp_connadd_req *req;
> +-	sdp_record_t *rec;
> +-	char src_addr[18], dst_addr[18];
> +-	char filename[PATH_MAX];
> +-	GKeyFile *key_file;
> +-	char handle[11], *str;
> + 	GError *gerr = NULL;
> + 	int err;
> +
> +@@ -1049,33 +1049,7 @@ static int hidp_add_connection(struct 
> input_device *idev)
> + 	req->flags     = 0;
> + 	req->idle_to   = idle_timeout;
> +
> +-	ba2str(&idev->src, src_addr);
> +-	ba2str(&idev->dst, dst_addr);
> +-
> +-	snprintf(filename, PATH_MAX, STORAGEDIR "/%s/cache/%s", src_addr,
> +-								dst_addr);
> +-	sprintf(handle, "0x%8.8X", idev->handle);
> +-
> +-	key_file = g_key_file_new();
> +-	if (!g_key_file_load_from_file(key_file, filename, 0, &gerr)) {
> +-		error("Unable to load key file from %s: (%s)", filename,
> +-								gerr->message);
> +-		g_clear_error(&gerr);
> +-	}
> +-	str = g_key_file_get_string(key_file, "ServiceRecords", handle, 
> NULL);
> +-	g_key_file_free(key_file);
> +-
> +-	if (!str) {
> +-		error("Rejected connection from unknown device %s", dst_addr);
> +-		err = -EPERM;
> +-		goto cleanup;
> +-	}
> +-
> +-	rec = record_from_string(str);
> +-	g_free(str);
> +-
> +-	err = extract_hid_record(rec, req);
> +-	sdp_record_free(rec);
> ++	err = extract_hid_record(idev, req);
> + 	if (err < 0) {
> + 		error("Could not parse HID SDP record: %s (%d)", strerror(-err),
> + 									-err);
> +@@ -1091,7 +1065,7 @@ static int hidp_add_connection(struct 
> input_device *idev)
> +
> + 	/* Make sure the device is bonded if required */
> + 	if (classic_bonded_only && !input_device_bonded(idev)) {
> +-		error("Rejected connection from !bonded device %s", dst_addr);
> ++		error("Rejected connection from !bonded device %s", idev->path);
> + 		goto cleanup;
> + 	}
> +
> +@@ -1161,6 +1135,68 @@ static int connection_disconnect(struct 
> input_device *idev, uint32_t flags)
> + 		return ioctl_disconnect(idev, flags);
> + }
> +
> ++static bool is_device_sdp_disable(const sdp_record_t *rec)
> ++{
> ++	sdp_data_t *data;
> ++
> ++	data = sdp_data_get(rec, SDP_ATTR_HID_SDP_DISABLE);
> ++
> ++	return data && data->val.uint8;
> ++}
> ++
> ++static enum reconnect_mode_t hid_reconnection_mode(bool 
> reconnect_initiate,
> ++						bool normally_connectable)
> ++{
> ++	if (!reconnect_initiate && !normally_connectable)
> ++		return RECONNECT_NONE;
> ++	else if (!reconnect_initiate && normally_connectable)
> ++		return RECONNECT_HOST;
> ++	else if (reconnect_initiate && !normally_connectable)
> ++		return RECONNECT_DEVICE;
> ++	else /* (reconnect_initiate && normally_connectable) */
> ++		return RECONNECT_ANY;
> ++}
> ++
> ++static void extract_hid_props(struct input_device *idev,
> ++					const sdp_record_t *rec)
> ++{
> ++	/* Extract HID connectability */
> ++	bool reconnect_initiate, normally_connectable;
> ++	sdp_data_t *pdlist;
> ++
> ++	/* HIDNormallyConnectable is optional and assumed FALSE if not
> ++	 * present.
> ++	 */
> ++	pdlist = sdp_data_get(rec, SDP_ATTR_HID_RECONNECT_INITIATE);
> ++	reconnect_initiate = pdlist ? pdlist->val.uint8 : TRUE;
> ++
> ++	pdlist = sdp_data_get(rec, SDP_ATTR_HID_NORMALLY_CONNECTABLE);
> ++	normally_connectable = pdlist ? pdlist->val.uint8 : FALSE;
> ++
> ++	/* Update local values */
> ++	idev->reconnect_mode =
> ++		hid_reconnection_mode(reconnect_initiate, normally_connectable);
> ++}
> ++
> ++static void input_device_update_rec(struct input_device *idev)
> ++{
> ++	struct btd_profile *p = btd_service_get_profile(idev->service);
> ++	const sdp_record_t *rec;
> ++
> ++	rec = btd_device_get_record(idev->device, p->remote_uuid);
> ++	if (!rec || idev->rec == rec)
> ++		return;
> ++
> ++	idev->rec = rec;
> ++	idev->disable_sdp = is_device_sdp_disable(rec);
> ++
> ++	/* Initialize device properties */
> ++	extract_hid_props(idev, rec);
> ++
> ++	if (idev->disable_sdp)
> ++		device_set_refresh_discovery(idev->device, false);
> ++}
> ++
> + static int input_device_connected(struct input_device *idev)
> + {
> + 	int err;
> +@@ -1168,6 +1204,9 @@ static int input_device_connected(struct 
> input_device *idev)
> + 	if (idev->intr_io == NULL || idev->ctrl_io == NULL)
> + 		return -ENOTCONN;
> +
> ++	/* Attempt to update SDP record if it had changed */
> ++	input_device_update_rec(idev);
> ++
> + 	err = hidp_add_connection(idev);
> + 	if (err < 0)
> + 		return err;
> +@@ -1411,74 +1450,21 @@ int input_device_disconnect(struct 
> btd_service *service)
> + 	return 0;
> + }
> +
> +-static bool is_device_sdp_disable(const sdp_record_t *rec)
> +-{
> +-	sdp_data_t *data;
> +-
> +-	data = sdp_data_get(rec, SDP_ATTR_HID_SDP_DISABLE);
> +-
> +-	return data && data->val.uint8;
> +-}
> +-
> +-static enum reconnect_mode_t hid_reconnection_mode(bool 
> reconnect_initiate,
> +-						bool normally_connectable)
> +-{
> +-	if (!reconnect_initiate && !normally_connectable)
> +-		return RECONNECT_NONE;
> +-	else if (!reconnect_initiate && normally_connectable)
> +-		return RECONNECT_HOST;
> +-	else if (reconnect_initiate && !normally_connectable)
> +-		return RECONNECT_DEVICE;
> +-	else /* (reconnect_initiate && normally_connectable) */
> +-		return RECONNECT_ANY;
> +-}
> +-
> +-static void extract_hid_props(struct input_device *idev,
> +-					const sdp_record_t *rec)
> +-{
> +-	/* Extract HID connectability */
> +-	bool reconnect_initiate, normally_connectable;
> +-	sdp_data_t *pdlist;
> +-
> +-	/* HIDNormallyConnectable is optional and assumed FALSE
> +-	* if not present. */
> +-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_RECONNECT_INITIATE);
> +-	reconnect_initiate = pdlist ? pdlist->val.uint8 : TRUE;
> +-
> +-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_NORMALLY_CONNECTABLE);
> +-	normally_connectable = pdlist ? pdlist->val.uint8 : FALSE;
> +-
> +-	/* Update local values */
> +-	idev->reconnect_mode =
> +-		hid_reconnection_mode(reconnect_initiate, normally_connectable);
> +-}
> +-
> + static struct input_device *input_device_new(struct btd_service 
> *service)
> + {
> + 	struct btd_device *device = btd_service_get_device(service);
> +-	struct btd_profile *p = btd_service_get_profile(service);
> + 	const char *path = device_get_path(device);
> +-	const sdp_record_t *rec = btd_device_get_record(device, 
> p->remote_uuid);
> + 	struct btd_adapter *adapter = device_get_adapter(device);
> + 	struct input_device *idev;
> +
> +-	if (!rec)
> +-		return NULL;
> +-
> + 	idev = g_new0(struct input_device, 1);
> + 	bacpy(&idev->src, btd_adapter_get_address(adapter));
> + 	bacpy(&idev->dst, device_get_address(device));
> + 	idev->service = btd_service_ref(service);
> + 	idev->device = btd_device_ref(device);
> + 	idev->path = g_strdup(path);
> +-	idev->handle = rec->handle;
> +-	idev->disable_sdp = is_device_sdp_disable(rec);
> +-
> +-	/* Initialize device properties */
> +-	extract_hid_props(idev, rec);
> +
> +-	if (idev->disable_sdp)
> +-		device_set_refresh_discovery(device, false);
> ++	input_device_update_rec(idev);
> +
> + 	return idev;
> + }
> +--
> +2.42.0
> +
> --
> 2.42.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191228): 
> <https://lists.openembedded.org/g/openembedded-core/message/191228>
> Mute This Topic: <https://lists.openembedded.org/mt/102795054/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-5cKTzs4xyplAnOfzF/fB
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 use git formatted patch</div></div><div id="geary-quote" dir="auto"><br>On Sat, Nov 25 2023 at 01:10:27 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Bluez 5.69 added a regression. Bluetooth connection for playstation controllers
stopped working. This adds a backport patch for the issue

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...e_probe-failing-if-SDP-record-is-not.patch | 313 ++++++++++++++++++
 2 files changed, 314 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index e10158a6e5..a23e4e58a6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -55,6 +55,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            <a href="file://0001-tests-add-a-target-for-building-tests-without-runnin.patch">file://0001-tests-add-a-target-for-building-tests-without-runnin.patch</a> \
            <a href="file://0001-test-gatt-Fix-hung-issue.patch">file://0001-test-gatt-Fix-hung-issue.patch</a> \
            <a href="file://0004-src-shared-util.c-include-linux-limits.h.patch">file://0004-src-shared-util.c-include-linux-limits.h.patch</a> \
+           <a href="file://0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch">file://0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch</a> \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch b/meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch
new file mode 100644
index 0000000000..d0884338db
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0002-input-Fix-.device_probe-failing-if-SDP-record-is-not.patch
@@ -0,0 +1,313 @@
+From 3a9c637010f8dc1ba3e8382abe01065761d4f5bb Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz &lt;<a href="mailto:luiz.von.dentz@intel.com">luiz.von.dentz@intel.com</a>&gt;
+Date: Tue, 10 Oct 2023 12:38:29 -0700
+Subject: [PATCH 02/40] input: Fix .device_probe failing if SDP record is not
+ found
+
+Due to changes introduced by 67a26abe53bf
+("profile: Add probe_on_discover flag") profiles may get probed when
+their profile UUID are discovered, rather than resolved, which means
+the SDP record may not be available.
+
+Fixes: <a href="https://github.com/bluez/bluez/issues/614">https://github.com/bluez/bluez/issues/614</a>
+
+Upstream-Status: Backport [<a href="https://github.com/bluez/bluez/commit/3a9c637010f8dc1ba3e8382abe01065761d4f5bb">https://github.com/bluez/bluez/commit/3a9c637010f8dc1ba3e8382abe01065761d4f5bb</a>]
+---
+ profiles/input/device.c | 182 +++++++++++++++++++---------------------
+ 1 file changed, 84 insertions(+), 98 deletions(-)
+
+diff --git a/profiles/input/device.c b/profiles/input/device.c
+index e2ac6ea60..4a50ea992 100644
+--- a/profiles/input/device.c
++++ b/profiles/input/device.c
+@@ -60,7 +60,7 @@ struct input_device {
+ 	char			*path;
+ 	bdaddr_t		src;
+ 	bdaddr_t		dst;
+-	uint32_t		handle;
++	const sdp_record_t	*rec;
+ 	GIOChannel		*ctrl_io;
+ 	GIOChannel		*intr_io;
+ 	guint			ctrl_watch;
+@@ -754,7 +754,8 @@ static void epox_endian_quirk(unsigned char *data, int size)
+ 	}
+ }
+ 
+-static int create_hid_dev_name(sdp_record_t *rec, struct hidp_connadd_req *req)
++static int create_hid_dev_name(const sdp_record_t *rec,
++					struct hidp_connadd_req *req)
+ {
+ 	char sdesc[sizeof(req-&gt;name) / 2];
+ 
+@@ -776,7 +777,7 @@ static int create_hid_dev_name(sdp_record_t *rec, struct hidp_connadd_req *req)
+ 
+ /* See HID profile specification v1.0, "7.11.6 HIDDescriptorList" for details
+  * on the attribute format. */
+-static int extract_hid_desc_data(sdp_record_t *rec,
++static int extract_hid_desc_data(const sdp_record_t *rec,
+ 						struct hidp_connadd_req *req)
+ {
+ 	sdp_data_t *d;
+@@ -817,36 +818,40 @@ invalid_desc:
+ 	return -EINVAL;
+ }
+ 
+-static int extract_hid_record(sdp_record_t *rec, struct hidp_connadd_req *req)
++static int extract_hid_record(struct input_device *idev,
++					struct hidp_connadd_req *req)
+ {
+ 	sdp_data_t *pdlist;
+ 	uint8_t attr_val;
+ 	int err;
+ 
+-	err = create_hid_dev_name(rec, req);
++	if (!idev-&gt;rec)
++		return -ENOENT;
++
++	err = create_hid_dev_name(idev-&gt;rec, req);
+ 	if (err &lt; 0)
+ 		DBG("No valid Service Name or Service Description found");
+ 
+-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_PARSER_VERSION);
++	pdlist = sdp_data_get(idev-&gt;rec, SDP_ATTR_HID_PARSER_VERSION);
+ 	req-&gt;parser = pdlist ? pdlist-&gt;val.uint16 : 0x0100;
+ 
+-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_DEVICE_SUBCLASS);
++	pdlist = sdp_data_get(idev-&gt;rec, SDP_ATTR_HID_DEVICE_SUBCLASS);
+ 	req-&gt;subclass = pdlist ? pdlist-&gt;val.uint8 : 0;
+ 
+-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_COUNTRY_CODE);
++	pdlist = sdp_data_get(idev-&gt;rec, SDP_ATTR_HID_COUNTRY_CODE);
+ 	req-&gt;country = pdlist ? pdlist-&gt;val.uint8 : 0;
+ 
+-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_VIRTUAL_CABLE);
++	pdlist = sdp_data_get(idev-&gt;rec, SDP_ATTR_HID_VIRTUAL_CABLE);
+ 	attr_val = pdlist ? pdlist-&gt;val.uint8 : 0;
+ 	if (attr_val)
+ 		req-&gt;flags |= (1 &lt;&lt; HIDP_VIRTUAL_CABLE_UNPLUG);
+ 
+-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_BOOT_DEVICE);
++	pdlist = sdp_data_get(idev-&gt;rec, SDP_ATTR_HID_BOOT_DEVICE);
+ 	attr_val = pdlist ? pdlist-&gt;val.uint8 : 0;
+ 	if (attr_val)
+ 		req-&gt;flags |= (1 &lt;&lt; HIDP_BOOT_PROTOCOL_MODE);
+ 
+-	err = extract_hid_desc_data(rec, req);
++	err = extract_hid_desc_data(idev-&gt;rec, req);
+ 	if (err &lt; 0)
+ 		return err;
+ 
+@@ -1035,11 +1040,6 @@ static gboolean encrypt_notify(GIOChannel *io, GIOCondition condition,
+ static int hidp_add_connection(struct input_device *idev)
+ {
+ 	struct hidp_connadd_req *req;
+-	sdp_record_t *rec;
+-	char src_addr[18], dst_addr[18];
+-	char filename[PATH_MAX];
+-	GKeyFile *key_file;
+-	char handle[11], *str;
+ 	GError *gerr = NULL;
+ 	int err;
+ 
+@@ -1049,33 +1049,7 @@ static int hidp_add_connection(struct input_device *idev)
+ 	req-&gt;flags     = 0;
+ 	req-&gt;idle_to   = idle_timeout;
+ 
+-	ba2str(&amp;idev-&gt;src, src_addr);
+-	ba2str(&amp;idev-&gt;dst, dst_addr);
+-
+-	snprintf(filename, PATH_MAX, STORAGEDIR "/%s/cache/%s", src_addr,
+-								dst_addr);
+-	sprintf(handle, "0x%8.8X", idev-&gt;handle);
+-
+-	key_file = g_key_file_new();
+-	if (!g_key_file_load_from_file(key_file, filename, 0, &amp;gerr)) {
+-		error("Unable to load key file from %s: (%s)", filename,
+-								gerr-&gt;message);
+-		g_clear_error(&amp;gerr);
+-	}
+-	str = g_key_file_get_string(key_file, "ServiceRecords", handle, NULL);
+-	g_key_file_free(key_file);
+-
+-	if (!str) {
+-		error("Rejected connection from unknown device %s", dst_addr);
+-		err = -EPERM;
+-		goto cleanup;
+-	}
+-
+-	rec = record_from_string(str);
+-	g_free(str);
+-
+-	err = extract_hid_record(rec, req);
+-	sdp_record_free(rec);
++	err = extract_hid_record(idev, req);
+ 	if (err &lt; 0) {
+ 		error("Could not parse HID SDP record: %s (%d)", strerror(-err),
+ 									-err);
+@@ -1091,7 +1065,7 @@ static int hidp_add_connection(struct input_device *idev)
+ 
+ 	/* Make sure the device is bonded if required */
+ 	if (classic_bonded_only &amp;&amp; !input_device_bonded(idev)) {
+-		error("Rejected connection from !bonded device %s", dst_addr);
++		error("Rejected connection from !bonded device %s", idev-&gt;path);
+ 		goto cleanup;
+ 	}
+ 
+@@ -1161,6 +1135,68 @@ static int connection_disconnect(struct input_device *idev, uint32_t flags)
+ 		return ioctl_disconnect(idev, flags);
+ }
+ 
++static bool is_device_sdp_disable(const sdp_record_t *rec)
++{
++	sdp_data_t *data;
++
++	data = sdp_data_get(rec, SDP_ATTR_HID_SDP_DISABLE);
++
++	return data &amp;&amp; data-&gt;val.uint8;
++}
++
++static enum reconnect_mode_t hid_reconnection_mode(bool reconnect_initiate,
++						bool normally_connectable)
++{
++	if (!reconnect_initiate &amp;&amp; !normally_connectable)
++		return RECONNECT_NONE;
++	else if (!reconnect_initiate &amp;&amp; normally_connectable)
++		return RECONNECT_HOST;
++	else if (reconnect_initiate &amp;&amp; !normally_connectable)
++		return RECONNECT_DEVICE;
++	else /* (reconnect_initiate &amp;&amp; normally_connectable) */
++		return RECONNECT_ANY;
++}
++
++static void extract_hid_props(struct input_device *idev,
++					const sdp_record_t *rec)
++{
++	/* Extract HID connectability */
++	bool reconnect_initiate, normally_connectable;
++	sdp_data_t *pdlist;
++
++	/* HIDNormallyConnectable is optional and assumed FALSE if not
++	 * present.
++	 */
++	pdlist = sdp_data_get(rec, SDP_ATTR_HID_RECONNECT_INITIATE);
++	reconnect_initiate = pdlist ? pdlist-&gt;val.uint8 : TRUE;
++
++	pdlist = sdp_data_get(rec, SDP_ATTR_HID_NORMALLY_CONNECTABLE);
++	normally_connectable = pdlist ? pdlist-&gt;val.uint8 : FALSE;
++
++	/* Update local values */
++	idev-&gt;reconnect_mode =
++		hid_reconnection_mode(reconnect_initiate, normally_connectable);
++}
++
++static void input_device_update_rec(struct input_device *idev)
++{
++	struct btd_profile *p = btd_service_get_profile(idev-&gt;service);
++	const sdp_record_t *rec;
++
++	rec = btd_device_get_record(idev-&gt;device, p-&gt;remote_uuid);
++	if (!rec || idev-&gt;rec == rec)
++		return;
++
++	idev-&gt;rec = rec;
++	idev-&gt;disable_sdp = is_device_sdp_disable(rec);
++
++	/* Initialize device properties */
++	extract_hid_props(idev, rec);
++
++	if (idev-&gt;disable_sdp)
++		device_set_refresh_discovery(idev-&gt;device, false);
++}
++
+ static int input_device_connected(struct input_device *idev)
+ {
+ 	int err;
+@@ -1168,6 +1204,9 @@ static int input_device_connected(struct input_device *idev)
+ 	if (idev-&gt;intr_io == NULL || idev-&gt;ctrl_io == NULL)
+ 		return -ENOTCONN;
+ 
++	/* Attempt to update SDP record if it had changed */
++	input_device_update_rec(idev);
++
+ 	err = hidp_add_connection(idev);
+ 	if (err &lt; 0)
+ 		return err;
+@@ -1411,74 +1450,21 @@ int input_device_disconnect(struct btd_service *service)
+ 	return 0;
+ }
+ 
+-static bool is_device_sdp_disable(const sdp_record_t *rec)
+-{
+-	sdp_data_t *data;
+-
+-	data = sdp_data_get(rec, SDP_ATTR_HID_SDP_DISABLE);
+-
+-	return data &amp;&amp; data-&gt;val.uint8;
+-}
+-
+-static enum reconnect_mode_t hid_reconnection_mode(bool reconnect_initiate,
+-						bool normally_connectable)
+-{
+-	if (!reconnect_initiate &amp;&amp; !normally_connectable)
+-		return RECONNECT_NONE;
+-	else if (!reconnect_initiate &amp;&amp; normally_connectable)
+-		return RECONNECT_HOST;
+-	else if (reconnect_initiate &amp;&amp; !normally_connectable)
+-		return RECONNECT_DEVICE;
+-	else /* (reconnect_initiate &amp;&amp; normally_connectable) */
+-		return RECONNECT_ANY;
+-}
+-
+-static void extract_hid_props(struct input_device *idev,
+-					const sdp_record_t *rec)
+-{
+-	/* Extract HID connectability */
+-	bool reconnect_initiate, normally_connectable;
+-	sdp_data_t *pdlist;
+-
+-	/* HIDNormallyConnectable is optional and assumed FALSE
+-	* if not present. */
+-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_RECONNECT_INITIATE);
+-	reconnect_initiate = pdlist ? pdlist-&gt;val.uint8 : TRUE;
+-
+-	pdlist = sdp_data_get(rec, SDP_ATTR_HID_NORMALLY_CONNECTABLE);
+-	normally_connectable = pdlist ? pdlist-&gt;val.uint8 : FALSE;
+-
+-	/* Update local values */
+-	idev-&gt;reconnect_mode =
+-		hid_reconnection_mode(reconnect_initiate, normally_connectable);
+-}
+-
+ static struct input_device *input_device_new(struct btd_service *service)
+ {
+ 	struct btd_device *device = btd_service_get_device(service);
+-	struct btd_profile *p = btd_service_get_profile(service);
+ 	const char *path = device_get_path(device);
+-	const sdp_record_t *rec = btd_device_get_record(device, p-&gt;remote_uuid);
+ 	struct btd_adapter *adapter = device_get_adapter(device);
+ 	struct input_device *idev;
+ 
+-	if (!rec)
+-		return NULL;
+-
+ 	idev = g_new0(struct input_device, 1);
+ 	bacpy(&amp;idev-&gt;src, btd_adapter_get_address(adapter));
+ 	bacpy(&amp;idev-&gt;dst, device_get_address(device));
+ 	idev-&gt;service = btd_service_ref(service);
+ 	idev-&gt;device = btd_device_ref(device);
+ 	idev-&gt;path = g_strdup(path);
+-	idev-&gt;handle = rec-&gt;handle;
+-	idev-&gt;disable_sdp = is_device_sdp_disable(rec);
+-
+-	/* Initialize device properties */
+-	extract_hid_props(idev, rec);
+ 
+-	if (idev-&gt;disable_sdp)
+-		device_set_refresh_discovery(device, false);
++	input_device_update_rec(idev);
+ 
+ 	return idev;
+ }
+-- 
+2.42.0
+
<div>-- 
</div>2.42.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#191228): <a href="https://lists.openembedded.org/g/openembedded-core/message/191228">https://lists.openembedded.org/g/openembedded-core/message/191228</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/102795054/3618223">https://lists.openembedded.org/mt/102795054/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-5cKTzs4xyplAnOfzF/fB--


