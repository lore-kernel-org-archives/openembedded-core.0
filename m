Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7234AC54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 10:46:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3590.1785493955699881549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 03:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gUwZXD3R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: xshang@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VAC2Xu3560089
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 10:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RQURT3MkmDSz+MLAp1ncNiw4OIzVzX0gS+5
	pyqE6mKo=; b=gUwZXD3RIlPgUcAD2xNX+zszsPKXKO8+bNUH9Gr/7CKNG1A6QEj
	fkJwhaxyEkA/xNSq0PYgFUvGPQS856nGsFE9zyOe7+Oe4XQNz07hwfXRzf/7PKiS
	bXmugJGTqNCl/m7C4h7MNRzj8ns5rmB66UaTp1Klgpceazn6Ycrb7gXDcsaQ+ABI
	ZnLsCchNkQHjWoW8Pib2R9ePwK4yQtJ0x3TxalnmXdhcXYP67HWssI/BhTgOstCp
	L+RsvvyAvsvr3ZpW1qZSSSY1RPZ29jV0lPLISXxB6HkElQZexLxiJekrw6sCXYly
	FLP6OJTY99sQwK38VzgTt8qs8bDj/srapDQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frse404pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 10:32:33 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66VAWVxD028838;
	Fri, 31 Jul 2026 10:32:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4fmp7jwp6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 10:32:31 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66VAWUZD028829
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 10:32:30 GMT
Received: from bt-iot-sh03-lnx.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 66VAWUcO028827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 10:32:30 +0000 (GMT)
Received: by bt-iot-sh03-lnx.qualcomm.com (Postfix, from userid 2385805)
	id 6BE0343DFD; Fri, 31 Jul 2026 18:32:29 +0800 (CST)
From: "Xiuzhuo Shang" <xiuzhuo.shang@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH v1] bluez5: restrict delta=0 RSSI to proximity filters
Date: Fri, 31 Jul 2026 18:32:26 +0800
Message-ID: <20260731103226.3651558-1-xiuzhuo.shang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=HslG3UTS c=1 sm=1 tr=0 ts=6a6c79c2 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=Q3d3CrAPWoBhLKqdOAQA:9
X-Proofpoint-ORIG-GUID: ebMyHP2hwcizI-VRjpQs-cLX1g0QOOX4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX8tCWxZiHqpKa
 xHZcojowgwDGdmVmzXEpW/oorKyvwGc4dzZp6JLNxOfOHcn6qBp3dtNIc9z4TrO2CzdNZZ8OZji
 e5FtpTHuO1PFGOMWjmm9HVUYf+WaQtVRh611nCxJRfbP4XsiV7LJYplcWuZZ3F8y3sW5HgmqCve
 CuZHPc5QUOLvwrLZsQDLWsmv9/RJg96w7/sPEP34kucJsaJ/1A47z3jMGalGr1RVjtaCz1qTATy
 Nss+5RDVL+Rfy3fqmUfBnT3Kmqcvhxr3upRluurcg9uyvvej1SUY7pf3DDgvW+qHXTV1blw5Mtf
 qyyxNUdOrzcAZXoxoWUl1pbyTMBVa+X7l7Ekk7cQi+YT/mqziUZqrrsRmUAtUSxlXhgLr295HnX
 CiGcD8rzEbphooatXNqXO9BkjarQacpmqrbxChanRJhIbALil9hnIlsNgDGUiZTGryiaXd4Ctj4
 8SzJenFJy4BUA7DChrg==
X-Proofpoint-GUID: ebMyHP2hwcizI-VRjpQs-cLX1g0QOOX4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA3OSBTYWx0ZWRfX0CircYiYc5V6
 b252iiP5CPgx2gVUli1n+V1sU0/dkerk53Ng2dTXg4DTIRfjiphw8uBt+6TtTtjtzdNIDfGLGU7
 jBt8lsfEpw8EcmXsXdXq0rmtnXKWX90=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310079
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 10:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242428

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
 ...ct-delta-0-RSSI-to-proximity-filters.patch | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index dfd368ef3f..b7a1615a02 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -73,6 +73,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
            file://0001-transport-Fix-set-volume-failure-with-invalid-device.patch \
            file://0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch \
+           file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch
new file mode 100644
index 0000000000..fdb1afdab4
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch
@@ -0,0 +1,87 @@
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
+Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
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


