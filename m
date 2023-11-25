Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D999C61D9D
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 11:28:43 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.23580.1700911717739914014
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Nov 2023 03:28:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout05.t-online.de (Postfix) with SMTP id EEDAB17CB6
	for <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 12:28:34 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.202]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r6qpr-3yECBt0; Sat, 25 Nov 2023 12:28:31 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] bluez5: fix connection for ps5/dualshock controllers
Date: Sat, 25 Nov 2023 12:28:23 +0100
Message-ID: <20231125112823.3538-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700911711-87FFC968-AF999C6B/0/0 CLEAN NORMAL
X-TOI-MSGID: 7efea4f2-a247-4c49-977b-0b4db5e2a900
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 11:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191224

Bluez 5.69 added a regression. Bluetooth connection for playstation contr=
ollers
stopped working. This adds a backport patch for the issue

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...e-failing-if-SDP-record-is-not-found.patch | 307 ++++++++++++++++++
 2 files changed, 308 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/input-Fix-dev=
ice_probe-failing-if-SDP-record-is-not-found.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
index e10158a6e5..f739aadafe 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -55,6 +55,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-run=
nin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0004-src-shared-util.c-include-linux-limits.h.patch \
+           file://input-Fix-device_probe-failing-if-SDP-record-is-not-fo=
und.patch \
            "
 S =3D "${WORKDIR}/bluez-${PV}"
=20
diff --git a/meta/recipes-connectivity/bluez5/bluez5/input-Fix-device_pro=
be-failing-if-SDP-record-is-not-found.patch b/meta/recipes-connectivity/b=
luez5/bluez5/input-Fix-device_probe-failing-if-SDP-record-is-not-found.pa=
tch
new file mode 100644
index 0000000000..afadf623cb
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/input-Fix-device_probe-fail=
ing-if-SDP-record-is-not-found.patch
@@ -0,0 +1,307 @@
+From: Luiz Augusto von Dentz <luiz.von.dentz@xxxxxxxxx>
+
+Due to changes introduced by 67a26abe53bf
+("profile: Add probe_on_discover flag") profiles may get probed when
+their profile UUID are discovered, rather than resolved, which means
+the SDP record may not be available.
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/3a9c637=
010f8dc1ba3e8382abe01065761d4f5bb]
+
+---
+ profiles/input/device.c | 182 +++++++++++++++++++---------------------
+ 1 file changed, 84 insertions(+), 98 deletions(-)
+
+diff --git a/profiles/input/device.c b/profiles/input/device.c
+index e2ac6ea60352..4a50ea9921a9 100644
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
+@@ -754,7 +754,8 @@ static void epox_endian_quirk(unsigned char *data, i=
nt size)
+ 	}
+ }
+=20
+-static int create_hid_dev_name(sdp_record_t *rec, struct hidp_connadd_r=
eq *req)
++static int create_hid_dev_name(const sdp_record_t *rec,
++					struct hidp_connadd_req *req)
+ {
+ 	char sdesc[sizeof(req->name) / 2];
+=20
+@@ -776,7 +777,7 @@ static int create_hid_dev_name(sdp_record_t *rec, st=
ruct hidp_connadd_req *req)
+=20
+ /* See HID profile specification v1.0, "7.11.6 HIDDescriptorList" for d=
etails
+  * on the attribute format. */
+-static int extract_hid_desc_data(sdp_record_t *rec,
++static int extract_hid_desc_data(const sdp_record_t *rec,
+ 						struct hidp_connadd_req *req)
+ {
+ 	sdp_data_t *d;
+@@ -817,36 +818,40 @@ invalid_desc:
+ 	return -EINVAL;
+ }
+=20
+-static int extract_hid_record(sdp_record_t *rec, struct hidp_connadd_re=
q *req)
++static int extract_hid_record(struct input_device *idev,
++					struct hidp_connadd_req *req)
+ {
+ 	sdp_data_t *pdlist;
+ 	uint8_t attr_val;
+ 	int err;
+=20
+-	err =3D create_hid_dev_name(rec, req);
++	if (!idev->rec)
++		return -ENOENT;
++
++	err =3D create_hid_dev_name(idev->rec, req);
+ 	if (err < 0)
+ 		DBG("No valid Service Name or Service Description found");
+=20
+-	pdlist =3D sdp_data_get(rec, SDP_ATTR_HID_PARSER_VERSION);
++	pdlist =3D sdp_data_get(idev->rec, SDP_ATTR_HID_PARSER_VERSION);
+ 	req->parser =3D pdlist ? pdlist->val.uint16 : 0x0100;
+=20
+-	pdlist =3D sdp_data_get(rec, SDP_ATTR_HID_DEVICE_SUBCLASS);
++	pdlist =3D sdp_data_get(idev->rec, SDP_ATTR_HID_DEVICE_SUBCLASS);
+ 	req->subclass =3D pdlist ? pdlist->val.uint8 : 0;
+=20
+-	pdlist =3D sdp_data_get(rec, SDP_ATTR_HID_COUNTRY_CODE);
++	pdlist =3D sdp_data_get(idev->rec, SDP_ATTR_HID_COUNTRY_CODE);
+ 	req->country =3D pdlist ? pdlist->val.uint8 : 0;
+=20
+-	pdlist =3D sdp_data_get(rec, SDP_ATTR_HID_VIRTUAL_CABLE);
++	pdlist =3D sdp_data_get(idev->rec, SDP_ATTR_HID_VIRTUAL_CABLE);
+ 	attr_val =3D pdlist ? pdlist->val.uint8 : 0;
+ 	if (attr_val)
+ 		req->flags |=3D (1 << HIDP_VIRTUAL_CABLE_UNPLUG);
+=20
+-	pdlist =3D sdp_data_get(rec, SDP_ATTR_HID_BOOT_DEVICE);
++	pdlist =3D sdp_data_get(idev->rec, SDP_ATTR_HID_BOOT_DEVICE);
+ 	attr_val =3D pdlist ? pdlist->val.uint8 : 0;
+ 	if (attr_val)
+ 		req->flags |=3D (1 << HIDP_BOOT_PROTOCOL_MODE);
+=20
+-	err =3D extract_hid_desc_data(rec, req);
++	err =3D extract_hid_desc_data(idev->rec, req);
+ 	if (err < 0)
+ 		return err;
+=20
+@@ -1035,11 +1040,6 @@ static gboolean encrypt_notify(GIOChannel *io, GI=
OCondition condition,
+ static int hidp_add_connection(struct input_device *idev)
+ {
+ 	struct hidp_connadd_req *req;
+-	sdp_record_t *rec;
+-	char src_addr[18], dst_addr[18];
+-	char filename[PATH_MAX];
+-	GKeyFile *key_file;
+-	char handle[11], *str;
+ 	GError *gerr =3D NULL;
+ 	int err;
+=20
+@@ -1049,33 +1049,7 @@ static int hidp_add_connection(struct input_devic=
e *idev)
+ 	req->flags     =3D 0;
+ 	req->idle_to   =3D idle_timeout;
+=20
+-	ba2str(&idev->src, src_addr);
+-	ba2str(&idev->dst, dst_addr);
+-
+-	snprintf(filename, PATH_MAX, STORAGEDIR "/%s/cache/%s", src_addr,
+-								dst_addr);
+-	sprintf(handle, "0x%8.8X", idev->handle);
+-
+-	key_file =3D g_key_file_new();
+-	if (!g_key_file_load_from_file(key_file, filename, 0, &gerr)) {
+-		error("Unable to load key file from %s: (%s)", filename,
+-								gerr->message);
+-		g_clear_error(&gerr);
+-	}
+-	str =3D g_key_file_get_string(key_file, "ServiceRecords", handle, NULL=
);
+-	g_key_file_free(key_file);
+-
+-	if (!str) {
+-		error("Rejected connection from unknown device %s", dst_addr);
+-		err =3D -EPERM;
+-		goto cleanup;
+-	}
+-
+-	rec =3D record_from_string(str);
+-	g_free(str);
+-
+-	err =3D extract_hid_record(rec, req);
+-	sdp_record_free(rec);
++	err =3D extract_hid_record(idev, req);
+ 	if (err < 0) {
+ 		error("Could not parse HID SDP record: %s (%d)", strerror(-err),
+ 									-err);
+@@ -1091,7 +1065,7 @@ static int hidp_add_connection(struct input_device=
 *idev)
+=20
+ 	/* Make sure the device is bonded if required */
+ 	if (classic_bonded_only && !input_device_bonded(idev)) {
+-		error("Rejected connection from !bonded device %s", dst_addr);
++		error("Rejected connection from !bonded device %s", idev->path);
+ 		goto cleanup;
+ 	}
+=20
+@@ -1161,6 +1135,68 @@ static int connection_disconnect(struct input_dev=
ice *idev, uint32_t flags)
+ 		return ioctl_disconnect(idev, flags);
+ }
+=20
++static bool is_device_sdp_disable(const sdp_record_t *rec)
++{
++	sdp_data_t *data;
++
++	data =3D sdp_data_get(rec, SDP_ATTR_HID_SDP_DISABLE);
++
++	return data && data->val.uint8;
++}
++
++static enum reconnect_mode_t hid_reconnection_mode(bool reconnect_initi=
ate,
++						bool normally_connectable)
++{
++	if (!reconnect_initiate && !normally_connectable)
++		return RECONNECT_NONE;
++	else if (!reconnect_initiate && normally_connectable)
++		return RECONNECT_HOST;
++	else if (reconnect_initiate && !normally_connectable)
++		return RECONNECT_DEVICE;
++	else /* (reconnect_initiate && normally_connectable) */
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
++	pdlist =3D sdp_data_get(rec, SDP_ATTR_HID_RECONNECT_INITIATE);
++	reconnect_initiate =3D pdlist ? pdlist->val.uint8 : TRUE;
++
++	pdlist =3D sdp_data_get(rec, SDP_ATTR_HID_NORMALLY_CONNECTABLE);
++	normally_connectable =3D pdlist ? pdlist->val.uint8 : FALSE;
++
++	/* Update local values */
++	idev->reconnect_mode =3D
++		hid_reconnection_mode(reconnect_initiate, normally_connectable);
++}
++
++static void input_device_update_rec(struct input_device *idev)
++{
++	struct btd_profile *p =3D btd_service_get_profile(idev->service);
++	const sdp_record_t *rec;
++
++	rec =3D btd_device_get_record(idev->device, p->remote_uuid);
++	if (!rec || idev->rec =3D=3D rec)
++		return;
++
++	idev->rec =3D rec;
++	idev->disable_sdp =3D is_device_sdp_disable(rec);
++
++	/* Initialize device properties */
++	extract_hid_props(idev, rec);
++
++	if (idev->disable_sdp)
++		device_set_refresh_discovery(idev->device, false);
++}
++
+ static int input_device_connected(struct input_device *idev)
+ {
+ 	int err;
+@@ -1168,6 +1204,9 @@ static int input_device_connected(struct input_dev=
ice *idev)
+ 	if (idev->intr_io =3D=3D NULL || idev->ctrl_io =3D=3D NULL)
+ 		return -ENOTCONN;
+=20
++	/* Attempt to update SDP record if it had changed */
++	input_device_update_rec(idev);
++
+ 	err =3D hidp_add_connection(idev);
+ 	if (err < 0)
+ 		return err;
+@@ -1411,74 +1450,21 @@ int input_device_disconnect(struct btd_service *=
service)
+ 	return 0;
+ }
+=20
+-static bool is_device_sdp_disable(const sdp_record_t *rec)
+-{
+-	sdp_data_t *data;
+-
+-	data =3D sdp_data_get(rec, SDP_ATTR_HID_SDP_DISABLE);
+-
+-	return data && data->val.uint8;
+-}
+-
+-static enum reconnect_mode_t hid_reconnection_mode(bool reconnect_initi=
ate,
+-						bool normally_connectable)
+-{
+-	if (!reconnect_initiate && !normally_connectable)
+-		return RECONNECT_NONE;
+-	else if (!reconnect_initiate && normally_connectable)
+-		return RECONNECT_HOST;
+-	else if (reconnect_initiate && !normally_connectable)
+-		return RECONNECT_DEVICE;
+-	else /* (reconnect_initiate && normally_connectable) */
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
+-	pdlist =3D sdp_data_get(rec, SDP_ATTR_HID_RECONNECT_INITIATE);
+-	reconnect_initiate =3D pdlist ? pdlist->val.uint8 : TRUE;
+-
+-	pdlist =3D sdp_data_get(rec, SDP_ATTR_HID_NORMALLY_CONNECTABLE);
+-	normally_connectable =3D pdlist ? pdlist->val.uint8 : FALSE;
+-
+-	/* Update local values */
+-	idev->reconnect_mode =3D
+-		hid_reconnection_mode(reconnect_initiate, normally_connectable);
+-}
+-
+ static struct input_device *input_device_new(struct btd_service *servic=
e)
+ {
+ 	struct btd_device *device =3D btd_service_get_device(service);
+-	struct btd_profile *p =3D btd_service_get_profile(service);
+ 	const char *path =3D device_get_path(device);
+-	const sdp_record_t *rec =3D btd_device_get_record(device, p->remote_uu=
id);
+ 	struct btd_adapter *adapter =3D device_get_adapter(device);
+ 	struct input_device *idev;
+=20
+-	if (!rec)
+-		return NULL;
+-
+ 	idev =3D g_new0(struct input_device, 1);
+ 	bacpy(&idev->src, btd_adapter_get_address(adapter));
+ 	bacpy(&idev->dst, device_get_address(device));
+ 	idev->service =3D btd_service_ref(service);
+ 	idev->device =3D btd_device_ref(device);
+ 	idev->path =3D g_strdup(path);
+-	idev->handle =3D rec->handle;
+-	idev->disable_sdp =3D is_device_sdp_disable(rec);
+=20
+-	/* Initialize device properties */
+-	extract_hid_props(idev, rec);
+-
+-	if (idev->disable_sdp)
+-		device_set_refresh_discovery(device, false);
++	input_device_update_rec(idev);
+=20
+ 	return idev;
+ }
+--=20
+2.41.0
--=20
2.42.0


