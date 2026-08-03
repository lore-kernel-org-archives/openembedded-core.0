Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4CDC5516F
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 06:00:47 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35572.1785726315805316554
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 20:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=L1z6DVRn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: xshang@qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LW0Zc2877803
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Aug 2026 03:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=c9ZpQ76Q06hm94hhVpl7DWVGPA1Z5WhIRs0
	rvRRS9Ac=; b=L1z6DVRn/LehygcUcxoKwGj6hd15wtztuWaxbcsDb6v/Hpp4ott
	A6sItCbyzQKNnfhd1WkvrShZbot8zUK34od3SBI9tHhu/HkIAN5sQ5u1TUpjj368
	zU3RCbeTqIpB+I/uQ2Ik5yhoQ9sojIEt2aDbrAqIgPMoESrZcV5W6RwtOKhY4WYI
	+Z5QrxFSdlwGaIoJwKnjNR3o7YWqkrFK3ISXJWRj35oUXW49A+ev6+wlAzbDc8Va
	ysNmJ6Lp7P3EIjTXGoRged++U5Vtm9KKB9q0KnhnQeZ7LTQP0PMKQinJp8HVNL/D
	Gsi05LmFTpmXjfEIulgTX7XbGEZc2xS5IUw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8vtcb1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 03:05:14 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67335Btm008789;
	Mon, 3 Aug 2026 03:05:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fs9vhsnyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 03:05:11 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67335BNl008781
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Aug 2026 03:05:11 GMT
Received: from bt-iot-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 67335AQd008780
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 03:05:11 +0000 (GMT)
Received: by bt-iot-sh03-lnx.qualcomm.com (Postfix, from userid 2385805)
	id 388A943C5A; Mon,  3 Aug 2026 11:05:10 +0800 (CST)
From: "Xiuzhuo Shang" <xiuzhuo.shang@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH v2] bluez5: restrict delta=0 RSSI to proximity filters
Date: Mon,  3 Aug 2026 11:05:07 +0800
Message-ID: <20260803030507.444319-1-xiuzhuo.shang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyMyBTYWx0ZWRfX4fcwRXeqtCKT
 bJcCSJbuXwvA2jXky/TCHXkwpZZJw3o4qchju/oaj/+LulE+f/AZq8M9bvfbe+DqTUuFnjKk3tH
 u0XKMQqqrpAEjDkjtTtlUqj5Pr00kl8=
X-Proofpoint-ORIG-GUID: 7Jq0lGPQCR13mOnGQslb7SvnXDw2MzbE
X-Proofpoint-GUID: 7Jq0lGPQCR13mOnGQslb7SvnXDw2MzbE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyMyBTYWx0ZWRfX9SjQwiOHzKGg
 A3pmQSjUDidTT6Cu1GNuq62jm6LrLR4yo1mkez2S7K2GQJhLPn2xvV/cZWkMfxDyRJis4DWQidR
 TgwHjvwNTgvNRWER9QuvwE+Q5CS3TPUsdG0XUv8p2C8Hf5DMqSLeYfYtUka/B4yioAgGV22+KdK
 MiMbAjgGBTiErGpUaVAv5Io9NiIi2W83VPMomwnnDCzRMZs0xGGeyE7W+rtKDbjlgML71OXov0h
 Ld4k6ugyx7YXDTHjoAtDeTHVZ++zJoKBg+Rij5GXyLGURyOjs303HAheuL9xa90+docRGqN+1Qy
 TX384Omup4nNGKJD/inrJ9m+PXVzxMlaxYDQF4IT6mKYzzi2X4nWPFM5wFEArUlwDTn+STUAdSf
 AEI1FbcHpbJJXstEgfeB1woZAASfAjrx+pk/s3bf43JNX+7vvRjMI/ZOQ5OWTWPR55nTpFPcONk
 cCEdUzwXhUePqs1BZOw==
X-Authority-Analysis: v=2.4 cv=fKMJG5ae c=1 sm=1 tr=0 ts=6a70056a cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=Q3d3CrAPWoBhLKqdOAQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030023
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 06:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242606

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
---
Changes in v2:
- Rebase patch onto bluez 5.87 (was based on 5.86 in v1)

 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ct-delta-0-RSSI-to-proximity-filters.patch | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a1f20f4432..88d8568629 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -66,6 +66,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
+           file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch
new file mode 100644
index 0000000000..a92d3896fa
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch
@@ -0,0 +1,86 @@
+From 7789da9b8d9a488e06fc7dbd33167228692de676 Mon Sep 17 00:00:00 2001
+From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
+Date: Wed, 15 Jul 2026 17:19:36 +0800
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
+index 538f63e0a..6cdc27e80 100644
+--- a/src/adapter.c
++++ b/src/adapter.c
+@@ -7249,6 +7249,22 @@ static void filter_duplicate_data(void *data, void *user_data)
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
+@@ -7445,7 +7461,8 @@ void btd_adapter_device_found(struct btd_adapter *adapter,
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
-- 
2.43.0


