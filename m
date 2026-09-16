Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84470C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 03:09:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6487.1789526766927163369
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 19:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VSh2VBv6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: xshang@qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYc5L3680381
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 02:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yBq8KzGMHGNyq5b8ovulAFZa4S6Qd3RpIuz
	eretN9i0=; b=VSh2VBv6kdpScua2vEoQCaKqr3MdDQ0CfbcTmIb5t9E2qEUjXw3
	CCYX00CE0M+Brf7lrLLTJrtEaV55Qa+Q8VJA+UJPEAHLfpk/dq5vNpZbPRAmZo1w
	IODYxApTLimo8AZENSFy0oyAmGkNR4hMZTZcG4ymReCNKOpG2pN9nCpWuHNirjmk
	1mYFBS7+zy0GdTsnu3G1Wz7TyxBLQz3n3KOS2fksSmKlY8lIflaOsxzNPGMNhNWy
	6ieXrcrJsVUvcixbrFWOn5HwZ2s4wrNxhaKbf/smtCuvlllb4ouroarXr7BIUL7/
	NIVwGp+WovBmZUo1CyRLKNEUhdbjhbE6IVA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqe1r8wtn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 02:46:05 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68G2k450606552;
	Wed, 16 Sep 2026 02:46:04 GMT
Received: from bt-iot-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 68G2k3jc606536
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 02:46:03 +0000 (GMT)
Received: by bt-iot-sh03-lnx.qualcomm.com (Postfix, from userid 2385805)
	id BB2D44C8E1; Wed, 16 Sep 2026 10:46:02 +0800 (CST)
From: "Xiuzhuo Shang" <xiuzhuo.shang@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH] bluez5: restrict delta=0 RSSI to proximity filters
Date: Wed, 16 Sep 2026 10:45:47 +0800
Message-ID: <20260916024547.806958-1-xiuzhuo.shang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAzNSBTYWx0ZWRfX+Gww2FIWtkhL
 PCTJiiidyDXRDhjo6fho0Is9psVDAitgR/+Nt3MqmsDD0GBLWj8cN4jRi+XqkR7AeNoSZvPIYU+
 iHPBkLjtWt5b6m0oIw76XYibqj+WiOE=
X-Proofpoint-GUID: 9sYs9CVs5NBMiq123WU5uddr7HD1jzeA
X-Proofpoint-ORIG-GUID: 9sYs9CVs5NBMiq123WU5uddr7HD1jzeA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAzNSBTYWx0ZWRfX/iGg7A1U6XGt
 YrA3SL77t6I4AWV0e1VyoWzq5lrpHnIH9ZNm24edhKflgAPM3QUzGrB70DFao9cyPcE91npZHCY
 cuDtxCF9YGP4VyCT/3PgpYOQL0al4NXW61x1QgvMhg2hFnh93A8owfxWz6Fett1rBBdrxLsyzGs
 DvmimDxHT+5EuEDHVokPn5EHViV4/cXvPY7ZwdrkzFjJ58O7cn+PqLZnJf4FQMg5Nje4osFHYB4
 t+xINML8Bdip+huL2npdo4CnW63BHXRTC3jKjHvwlhDsBRsja2lqAyiHKyrd7Of0jqRv7F0ByTN
 FXhtBeruMqS+ErDCDpL+rKERJgk0+Kr54lBCkk6wbNG9/ydUmupMGMMSrtAJcW3AJJ2nS1EzEDG
 LTudWpxejzuedNAV6D+cOyyNOkF/pcD79a+PfKsIyDOiKM8t1FaSCWX10lZ2Jgfcu16VA3IbwdH
 PBOjiR07kgUlgoTtD6Q==
X-Authority-Analysis: v=2.4 cv=ZIhCCn7b c=1 sm=1 tr=0 ts=6aaa02ee cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=Q3d3CrAPWoBhLKqdOAQA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1011 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160035
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 03:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245913

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
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ct-delta-0-RSSI-to-proximity-filters.patch | 86 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index ad07e0d3c4..d857c23a57 100644
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
index 0000000000..1bf35ed393
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
-- 
2.43.0


