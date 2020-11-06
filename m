Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8284.1604644110706190146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 22:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: OSi1gA7WHheTkdctbtjQ7/XKMfDFKiL6HryM5TWWGIzo3O+qMfo1wWbFW1vzSAH8YO7O0D2bIn
 j0cW6bGaqYoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="187428871"
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="187428871"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:47 -0800
IronPort-SDR: DBrqIj003b9SIQu1jCCSk3T+7PK4bNePmj4cCYuVE37djJsNG3I2gJFUGZj5lKUhSOKPvTSEGP
 3zpp9to2nmQw==
X-IronPort-AV: E=Sophos;i="5.77,455,1596524400"; 
   d="scan'208";a="321490063"
Received: from gcquah-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.239])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2020 22:28:46 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 13/22] bluez5: fix CVE-2020-27153
Date: Fri,  6 Nov 2020 14:28:11 +0800
Message-Id: <4b50d20e15bb0fb9ff83730931ee35cf772f93d7.1604643684.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1604643684.git.anuj.mittal@intel.com>
References: <cover.1604643684.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chee Yang Lee <chee.yang.lee@intel.com>

(From OE-Core rev: 4b0688bb8abb2fb8a620541207d40e90e4bf16f9)

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../bluez5/bluez5/CVE-2020-27153.patch        | 146 ++++++++++++++++++
 .../bluez5/bluez5_5.54.bb                     |   2 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2020-27153.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-27153.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-27153.patch
new file mode 100644
index 0000000000..7b06dd2071
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2020-27153.patch
@@ -0,0 +1,146 @@
+From 1cd644db8c23a2f530ddb93cebed7dacc5f5721a Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Wed, 15 Jul 2020 18:25:37 -0700
+Subject: [PATCH] shared/att: Fix possible crash on disconnect
+
+If there are pending request while disconnecting they would be notified
+but clients may endup being freed in the proccess which will then be
+calling bt_att_cancel to cancal its requests causing the following
+trace:
+
+Invalid read of size 4
+   at 0x1D894C: enable_ccc_callback (gatt-client.c:1627)
+   by 0x1D247B: disc_att_send_op (att.c:417)
+   by 0x1CCC17: queue_remove_all (queue.c:354)
+   by 0x1D47B7: disconnect_cb (att.c:635)
+   by 0x1E0707: watch_callback (io-glib.c:170)
+   by 0x48E963B: g_main_context_dispatch (in /usr/lib/libglib-2.0.so.0.6400.4)
+   by 0x48E9AC7: ??? (in /usr/lib/libglib-2.0.so.0.6400.4)
+   by 0x48E9ECF: g_main_loop_run (in /usr/lib/libglib-2.0.so.0.6400.4)
+   by 0x1E0E97: mainloop_run (mainloop-glib.c:79)
+   by 0x1E13B3: mainloop_run_with_signal (mainloop-notify.c:201)
+   by 0x12BC3B: main (main.c:770)
+ Address 0x7d40a28 is 24 bytes inside a block of size 32 free'd
+   at 0x484A2E0: free (vg_replace_malloc.c:540)
+   by 0x1CCC17: queue_remove_all (queue.c:354)
+   by 0x1CCC83: queue_destroy (queue.c:73)
+   by 0x1D7DD7: bt_gatt_client_free (gatt-client.c:2209)
+   by 0x16497B: batt_free (battery.c:77)
+   by 0x16497B: batt_remove (battery.c:286)
+   by 0x1A0013: service_remove (service.c:176)
+   by 0x1A9B7B: device_remove_gatt_service (device.c:3691)
+   by 0x1A9B7B: gatt_service_removed (device.c:3805)
+   by 0x1CC90B: queue_foreach (queue.c:220)
+   by 0x1DE27B: notify_service_changed.isra.0.part.0 (gatt-db.c:369)
+   by 0x1DE387: notify_service_changed (gatt-db.c:361)
+   by 0x1DE387: gatt_db_service_destroy (gatt-db.c:385)
+   by 0x1DE3EF: gatt_db_remove_service (gatt-db.c:519)
+   by 0x1D674F: discovery_op_complete (gatt-client.c:388)
+   by 0x1D6877: discover_primary_cb (gatt-client.c:1260)
+   by 0x1E220B: discovery_op_complete (gatt-helpers.c:628)
+   by 0x1E249B: read_by_grp_type_cb (gatt-helpers.c:730)
+   by 0x1D247B: disc_att_send_op (att.c:417)
+   by 0x1CCC17: queue_remove_all (queue.c:354)
+   by 0x1D47B7: disconnect_cb (att.c:635)
+
+Upstream-Status: Backport
+[https://github.com/bluez/bluez/commit/1cd644db8c23a2f530ddb93cebed7dacc5f5721a]
+CVE: CVE-2020-27153
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/shared/att.c | 46 ++++++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 40 insertions(+), 6 deletions(-)
+
+diff --git a/src/shared/att.c b/src/shared/att.c
+index ed3af2920..58f23dfcb 100644
+--- a/src/shared/att.c
++++ b/src/shared/att.c
+@@ -84,6 +84,7 @@ struct bt_att {
+ 	struct queue *req_queue;	/* Queued ATT protocol requests */
+ 	struct queue *ind_queue;	/* Queued ATT protocol indications */
+ 	struct queue *write_queue;	/* Queue of PDUs ready to send */
++	bool in_disc;			/* Cleanup queues on disconnect_cb */
+ 
+ 	bt_att_timeout_func_t timeout_callback;
+ 	bt_att_destroy_func_t timeout_destroy;
+@@ -222,8 +223,10 @@ static void destroy_att_send_op(void *data)
+ 	free(op);
+ }
+ 
+-static void cancel_att_send_op(struct att_send_op *op)
++static void cancel_att_send_op(void *data)
+ {
++	struct att_send_op *op = data;
++
+ 	if (op->destroy)
+ 		op->destroy(op->user_data);
+ 
+@@ -631,11 +634,6 @@ static bool disconnect_cb(struct io *io, void *user_data)
+ 	/* Dettach channel */
+ 	queue_remove(att->chans, chan);
+ 
+-	/* Notify request callbacks */
+-	queue_remove_all(att->req_queue, NULL, NULL, disc_att_send_op);
+-	queue_remove_all(att->ind_queue, NULL, NULL, disc_att_send_op);
+-	queue_remove_all(att->write_queue, NULL, NULL, disc_att_send_op);
+-
+ 	if (chan->pending_req) {
+ 		disc_att_send_op(chan->pending_req);
+ 		chan->pending_req = NULL;
+@@ -654,6 +652,15 @@ static bool disconnect_cb(struct io *io, void *user_data)
+ 
+ 	bt_att_ref(att);
+ 
++	att->in_disc = true;
++
++	/* Notify request callbacks */
++	queue_remove_all(att->req_queue, NULL, NULL, disc_att_send_op);
++	queue_remove_all(att->ind_queue, NULL, NULL, disc_att_send_op);
++	queue_remove_all(att->write_queue, NULL, NULL, disc_att_send_op);
++
++	att->in_disc = false;
++
+ 	queue_foreach(att->disconn_list, disconn_handler, INT_TO_PTR(err));
+ 
+ 	bt_att_unregister_all(att);
+@@ -1574,6 +1581,30 @@ bool bt_att_chan_cancel(struct bt_att_chan *chan, unsigned int id)
+ 	return true;
+ }
+ 
++static bool bt_att_disc_cancel(struct bt_att *att, unsigned int id)
++{
++	struct att_send_op *op;
++
++	op = queue_find(att->req_queue, match_op_id, UINT_TO_PTR(id));
++	if (op)
++		goto done;
++
++	op = queue_find(att->ind_queue, match_op_id, UINT_TO_PTR(id));
++	if (op)
++		goto done;
++
++	op = queue_find(att->write_queue, match_op_id, UINT_TO_PTR(id));
++
++done:
++	if (!op)
++		return false;
++
++	/* Just cancel since disconnect_cb will be cleaning up */
++	cancel_att_send_op(op);
++
++	return true;
++}
++
+ bool bt_att_cancel(struct bt_att *att, unsigned int id)
+ {
+ 	const struct queue_entry *entry;
+@@ -1591,6 +1622,9 @@ bool bt_att_cancel(struct bt_att *att, unsigned int id)
+ 			return true;
+ 	}
+ 
++	if (att->in_disc)
++		return bt_att_disc_cancel(att, id);
++
+ 	op = queue_remove_if(att->req_queue, match_op_id, UINT_TO_PTR(id));
+ 	if (op)
+ 		goto done;
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.54.bb b/meta/recipes-connectivity/bluez5/bluez5_5.54.bb
index 260eee1402..9a21f14fae 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.54.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.54.bb
@@ -1,5 +1,7 @@
 require bluez5.inc
 
+SRC_URI += " file://CVE-2020-27153.patch"
+
 SRC_URI[md5sum] = "e637feb2dbb7582bbbff1708367a847c"
 SRC_URI[sha256sum] = "68cdab9e63e8832b130d5979dc8c96fdb087b31278f342874d992af3e56656dc"
 
-- 
2.28.0

