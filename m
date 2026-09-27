Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A03F2CA5FA5
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:55 +0000 (UTC)
Received: from mail-wr2-f36.google.com (mail-wr2-f36.google.com [74.125.225.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33584.1790495026192413252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rMBe9NqO;
 spf=pass (domain: smile.fr, ip: 74.125.225.100, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f36.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso945431f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495024; x=1791099824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e/4uUKZU3YSXbJYb8+trpXBNoskde5b0Pl1tQxHutyg=;
        b=rMBe9NqOtnEufb14QgFEDpGs0fxp1bdrTzm144ZOq5tmZnHw/s+2Rj02DTkkSbFCjd
         koGWb3ILGknvPySlGMTz8scU+n1g5hMuuCNSbI+go/e5ffre5TbvyKl27sxkpd7j6Mf/
         IY+JsdqjUFeSj7ZB9/ZmRrbX+lFYdDF0SuaZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495024; x=1791099824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e/4uUKZU3YSXbJYb8+trpXBNoskde5b0Pl1tQxHutyg=;
        b=cDP4H/c7woMj4mSI4G1fucalHp/WO5WXfdueL0KHJQPHM2h6BbI4bg/cSdWqRa1cbA
         U6X7r3pWJajuPdBKi/qC+sZFpDFZjwjiC7OTilybCL1pZDg7Q24W+WmHr6wwWgcfBVTi
         llN1LFA8s214tt6NTtGojAEht9RI4wV+N2Hei9gO/wbuwvHbRuoBfO0hU77Zqoc3npYC
         fzlnY3CX20+rLcNlWlZ0WiS3MNj71pzTSU1wHRovAAaT+sdZkUCAGUZUig7OfVpc2Tdd
         rE1k+qWVBLWlSbB0tULARoxjVIUwI4WhJyCT0lbgsE+u/+el7OnF4nmbskjkIrxXb54C
         FmPw==
X-Gm-Message-State: AFq9FYLVQtiN+cdoWfkhPNmwkHdSWt1UD4ryXw03axPOYtbwLMC+SP88
	Vc4QKvPBRYYhgjYa0sHJReqzHUhlPDj34PdEu4Eyx3YqMbGQ/ESRjMdFO/UqS6ZoVbNY8p9JLfV
	pxt9Kf8U=
X-Gm-Gg: AYBFou05lqBnSoMaMwZvjUMIK6pk+XbH56VXYxn8da/39e9GSn65W7fFbYbfWTkRXfs
	q04pJlLdhxazf8lHhNOLaDoEhZtUFJjMhDCuOGXBS+YzHGTBQ9lDo79t5CTWjg/7WbfZb2focAH
	BtSxxGvZ+4RQhV3XssIp4ucOJAxV7nF84QKxXlFeeVKQ7AfTESdMVEIUTYAAXU/WLRktRugUh5J
	pT0n/CrEOL9PdbQSar+tvIuEPb488Zuh8UMvsXVESSby7qRPtYK+NZ/EJ0qF2dkcVs6BOGxapsl
	NBk+XZU9NBFmERPzARaBxueZb5UFWulYbKDnHoGWIVL+NYqOADkPgPYxqGlmwFPjiGonw2+SjDi
	6e2gMezbSe70ufoSAOf24ZFenJteq2XoKXxFFFR2Y7oNl38BFA2/U2ETywLVTaCD3JJT6y32BnZ
	qQXWWkeTshvMOWNaCDxm63Bh4xImU8JG5Xchv2VA8sz5w0cnVdZDS/N9aHAHMYCFYwdkqKo28fG
	cBbvOQl5chT5g2vEj7uwAr6FrfxVnMuyJR0YOMjRA+eVB6Q3UiaXKs32Q/t2lnlEku97HeVNA==
X-Received: by 2002:a05:6000:4910:b0:488:8b16:ab33 with SMTP id ffacd0b85a97d-4888b16ae2amr3426563f8f.10.1790495024221;
        Sun, 27 Sep 2026 00:43:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/28] bluez5: restrict delta=0 RSSI to proximity filters
Date: Sun, 27 Sep 2026 09:42:59 +0200
Message-ID: <9c8556d59cb8a5d4fa78f617782b8daf3b2b22fa.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246658

From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>

When a discovery filter is active (filtered_discovery=true), BlueZ
unconditionally calls device_set_rssi_with_delta(..., delta=0),
causing every BLE advertisement to emit a PropertiesChanged(RSSI)
signal regardless of whether the RSSI value changed.

delta=0 is only needed when a client has expressed explicit proximity
interest by setting an RSSI or pathloss threshold in its discovery
filter. Filters that specify only transport type or UUIDs do not
require per-packet RSSI precision; for those, the standard
RSSI_THRESHOLD=8 rate-limiting is both correct and desirable.

Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed patch format]
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ct-delta-0-RSSI-to-proximity-filters.patch | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index ad07e0d3c4f..d857c23a577 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -75,6 +75,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch \
            file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch    \
            file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
+           file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch
new file mode 100644
index 00000000000..8dd9e318feb
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch
@@ -0,0 +1,86 @@
+From d00dd99229bc9ce78b0e8bb3bb523a3cd504473c Mon Sep 17 00:00:00 2001
+From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
+Date: Wed, 15 Jul 2026 17:06:35 +0800
+Subject: [PATCH] adapter: restrict delta=0 RSSI to proximity filters
+
+When a discovery filter is active (filtered_discovery=true), BlueZ
+unconditionally calls device_set_rssi_with_delta(..., delta=0),
+causing every BLE advertisement to emit a PropertiesChanged(RSSI)
+signal regardless of whether the RSSI value changed.
+
+delta=0 is only needed when a client has expressed explicit proximity
+interest by setting an RSSI or pathloss threshold in its discovery
+filter. Filters that specify only transport type or UUIDs do not
+require per-packet RSSI precision; for those, the standard
+RSSI_THRESHOLD=8 rate-limiting is both correct and desirable.
+
+The problem is triggered on dual-mode adapters by a transport-only
+filter (e.g. Transport=le). In merge_discovery_filters(), the
+transport-specific scan type (SCAN_TYPE_LE=6) does not equal the
+adapter scan type (SCAN_TYPE_DUAL=7), so has_filtered_discovery is
+set, filtered_discovery becomes true, and delta=0 is applied even
+though no proximity condition was requested. With hundreds of BLE
+devices advertising simultaneously this generates hundreds of
+unnecessary PropertiesChanged(RSSI) signals per second.
+
+Confirmed on QCS6490 (BlueZ 5.72) with Transport=le filter:
+
+  adapter.c: filtered_discovery=1 (current_discovery_filter=set)
+  device.c:  device_set_rssi_with_delta() rssi=-86 delta_threshold=0
+  device.c:  device_set_rssi_with_delta() rssi=-79 delta_threshold=0
+
+Add discovery_filter_has_proximity() which walks discovery_list and
+returns true only when at least one active filter carries a real
+proximity condition (rssi != DISTANCE_VAL_INVALID or pathloss !=
+DISTANCE_VAL_INVALID). Use this to gate the delta=0 path.
+
+Other filter fields (transport, uuids, duplicate, discoverable)
+express capability or content criteria and carry no proximity
+implication, so they are intentionally excluded from the check.
+
+Upstream-Status: Backport [e004414a1751d29216ccab976d6c7174ec48d11c]
+Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
+---
+ src/adapter.c | 19 ++++++++++++++++++-
+ 1 file changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/src/adapter.c b/src/adapter.c
+index fb95e8553..1023e43a2 100644
+--- a/src/adapter.c
++++ b/src/adapter.c
+@@ -7255,6 +7255,22 @@ static void filter_duplicate_data(void *data, void *user_data)
+ 	*duplicate = client->discovery_filter->duplicate;
+ }
+ 
++static bool discovery_filter_has_proximity(struct btd_adapter *adapter)
++{
++	GSList *l;
++
++	for (l = adapter->discovery_list; l; l = g_slist_next(l)) {
++		struct discovery_client *client = l->data;
++		struct discovery_filter *filter = client->discovery_filter;
++
++		if (filter && (filter->rssi != DISTANCE_VAL_INVALID ||
++				filter->pathloss != DISTANCE_VAL_INVALID))
++			return true;
++	}
++
++	return false;
++}
++
+ static bool device_is_discoverable(struct btd_adapter *adapter,
+ 					struct eir_data *eir, const char *addr,
+ 					uint8_t bdaddr_type, bool *auto_connect)
+@@ -7451,7 +7467,8 @@ void btd_adapter_device_found(struct btd_adapter *adapter,
+ 	if (name_resolve_failed)
+ 		device_name_resolve_fail(dev);
+ 
+-	if (adapter->filtered_discovery)
++	if (adapter->filtered_discovery &&
++				discovery_filter_has_proximity(adapter))
+ 		device_set_rssi_with_delta(dev, rssi, 0);
+ 	else
+ 		device_set_rssi(dev, rssi);
+--
+2.43.0
+

