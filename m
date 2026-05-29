Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 704FDCD5BD2
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 04:44:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2928.1780025129293054654
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 20:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=B95ooTMB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKl2R9148986
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 02:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YdbbYPVquK//0O9OyGCXaDjJkyr/riQfwQM
	4STqg6W4=; b=B95ooTMBRi7JTlIcqDx7Y6H5Xd6kJPIa63INf3ugA2ckwCwWll+
	gyhbRWSW2U3I5mIMbiGixLOn6T7P/pUiWRJoCgAE0yh2jH3Z7rTL78Vn06ioUi64
	jwS8DofaApuERtHe26D15l+cvtUWUh2jbrzxDd0/HCJGBnkVLVAkcuqW8JmG9WhW
	y5yKtrqoVlQidno1SLtjLUMfbM79N6CqOWfJOSMv131/H2qg1Aa64Vlbv7iwNVYh
	iLiQJUNxATdUF8dYU+Yc1wxIbpqJzgDWV3XgK9GJz2j/+x04UYT54njVkvSrfINe
	VL4h8MLuN12C7bZHXQbYJPkTguEPQgReQQw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y1x20u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 02:44:30 +0000 (GMT)
Received: from pps.filterd (nasanppmta04.qualcomm.com [127.0.0.1])
	by NASANPPMTA04.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64T2iTf0022597;
	Fri, 29 May 2026 02:44:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA04.qualcomm.com (PPS) with ESMTPS id 4eb5amkq6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 02:44:29 +0000 (GMT)
Received: from nasanppmta04.qualcomm.com (nasanppmta04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64T2iScY022591
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 02:44:29 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by NASANPPMTA04.qualcomm.com (PPS) with ESMTPS id 64T2iRQM022576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 02:44:28 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 19AFC2287F; Fri, 29 May 2026 10:44:26 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com
Subject: [PATCH] bluez5: fix set volume failure
Date: Fri, 29 May 2026 10:44:23 +0800
Message-Id: <20260529024423.1818084-1-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=DsNmPm/+ c=1 sm=1 tr=0 ts=6a18fd8e cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=e8bRT_GSZmf0kOtY9XgA:9
X-Proofpoint-ORIG-GUID: aZELM9yh5kjQTu0VdomNl2ukctW7rV22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAyNSBTYWx0ZWRfX5GXbTBzAFXSQ
 7OhCT6JggOouDplhqqMNtRRDZXGeHETgyPimbgFE8dRqSM9p6Z1o3w9T695PqpXg27aZgMfnmPR
 GLzm5o1ID0M0Qb8xpE1MsgjY5iaNPg0k8T/nZZNzJTRvIT9GprxU0I14H4ybL9SnS8ergLEmC96
 RdqrOpgBxnmJJh6VTbygTXEfhU0sAwuR91qhE4+VFmw5hM2XDveR6RwKWfktUzn4zmbXNjIt4sm
 14JIDu0ACqH6QJRYtkD/aK8sUYZ9XxxjGiNyPEw4/5DZON1pUKHyJCAdjU2ytLu1+/ybpyExzyc
 4riQdwtkxe8NtZIrmBeXGyoc7kFqNPikXEbvKaCKOhs88gLEXQYqLwXg6mUGLvqol6AkdRzRaEC
 okSTMzcGFu3XWldA2c7pfQnbwh1RXojQOdVaqiDhZeVtwEMdDZPhYfIaYfF5z73qEQzKhMkC4Rn
 wJha9z32O86fRZ1pkmA==
X-Proofpoint-GUID: aZELM9yh5kjQTu0VdomNl2ukctW7rV22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290025
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 04:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237740

Backport upstream fix for AVRCP volume initialization failure when
AVRCP connects before AVDTP.

Upstream-Status: Backport [bluez/bluez@121e5ca]
Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...t-volume-failure-with-invalid-device.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 87252b990c..e827d0a6d7 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -71,6 +71,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch \
            file://0001-tools-Work-around-broken-stdin-handling-in-home-made.patch \
            file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
+           file://0001-transport-Fix-set-volume-failure-with-invalid-device.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch
new file mode 100644
index 0000000000..6990099972
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch
@@ -0,0 +1,45 @@
+From 8a80f70c23ca5f93b1db7e3956cc7ee28c1fa767 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Mon, 9 Mar 2026 19:18:26 +0800
+Subject: [PATCH] transport: Fix set volume failure with invalid device volume
+
+When AVRCP is connected before AVDTP, an invalid device volume causes
+the target to reject registration for the EVENT_VOLUME_CHANGED
+notification, which breaks subsequent volume updates.
+
+Fix this by initializing the volume to the maximum value in the AVRCP
+target init path when it is invalid, allowing the controller to
+subscribe to AVRCP_EVENT_VOLUME_CHANGED.
+
+Fixes: fa7828bddd21 ("transport: Fix not being able to initialize volume properly")
+Suggested-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/121e5ca79be559c5374f8a54c6fb6e233e383379]
+---
+ profiles/audio/avrcp.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
+index 724b46c59..326dfdab7 100644
+--- a/profiles/audio/avrcp.c
++++ b/profiles/audio/avrcp.c
+@@ -4296,9 +4296,16 @@ static void target_init(struct avrcp *session)
+ 	if (target->version < 0x0104)
+ 		return;
+ 
+-	if (avrcp_volume_supported(target))
++	if (avrcp_volume_supported(target)) {
+ 		session->supported_events |=
+ 				(1 << AVRCP_EVENT_VOLUME_CHANGED);
++		/* Check if transport volume hasn't been initialized then set it
++		 * to max so it works properly if the controller attempts to
++		 * subscribe to AVRCP_EVENT_VOLUME_CHANGED.
++		 */
++		if (media_transport_get_a2dp_volume(session->dev) < 0)
++			media_transport_set_a2dp_volume(session->dev, 127);
++	}
+ 
+ 	session->supported_events |=
+ 				(1 << AVRCP_EVENT_ADDRESSED_PLAYER_CHANGED) |
+-- 
+2.34.1
+
-- 
2.34.1


