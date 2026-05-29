Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CFACD5BD2
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 05:54:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4291.1780033994052021444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 22:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PvRezhsQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkf761386644
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 05:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qHF4BEw4uyBDbiGl7wSNMIL+56tXrMS/via
	7iX6A3us=; b=PvRezhsQrJlCkWBNMTDyHzPl5/SkeLxu0RBIiYM/6S2QI0///N6
	aJdh2tPUxyUkxrsesoJc9kPMT5cKzq33DpV0jJhw7EXlTvI7RlBGDuWqA3A7MTi8
	NlVc5zofsDDotNB5NADSqKY089HgEwS0I+6kvwJ2vfBZRI0ni1hwvfOUvUyLvTnI
	2pSiseds1Cigei/5jhPuwC/SuWmVjMsClaCAHHQXtpb16rzV7x5oMF4i4HplzMc+
	Wuc8mtk9VTUHRR3BOTaH5oSEiQlrz5NRLu266EDvqgC+eIUSmDI7VRhMs52lM0XP
	Oo0X9vkqp5SbccB6vZXOyRLwzr8Z5MSh9GA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevumswkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 05:53:12 +0000 (GMT)
Received: from pps.filterd (nasanppmta02.qualcomm.com [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64T5rBXP002607;
	Fri, 29 May 2026 05:53:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTPS id 4edr1dnda6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 05:53:11 +0000 (GMT)
Received: from nasanppmta02.qualcomm.com (nasanppmta02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64T5r9rd002583
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 05:53:10 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (bt-iot-sh02-lnx.qualcomm.com [10.253.144.65])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTPS id 64T5r7JF002560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 05:53:09 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 3DA2F22882; Fri, 29 May 2026 13:53:01 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com
Subject: [PATCH v2] bluez5: fix set volume failure
Date: Fri, 29 May 2026 13:52:54 +0800
Message-Id: <20260529055254.1962739-1-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: d6UB9ba1hONJBGO7t9vVwzelcS1nOmiH
X-Proofpoint-ORIG-GUID: d6UB9ba1hONJBGO7t9vVwzelcS1nOmiH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA1NCBTYWx0ZWRfX2WSF8hGMllXt
 vNRraN07NAqSviSrYzdwHyYGAI7tfrDWPAUDFq/wK++IBZq0iSzy9Rd8TRYYQFwGDjbQ6W7VUjL
 dk3/NvgGIbxi5T10vmtN+kW5TxhtDCESZA7y9CZ8XAnhQSJC+OgAp1QpHFgKTpCu+KoVXBJYMD0
 S/MTBSPsnBxdKovU/+j9KjKs9SjXSDfd6ex5rh5xrnnZsO1WinFxaiaDyWo9u1sStAbsEcxp5Qk
 ccfb0D9kxsq8t9o0BTex9j/30DkDL/O7u8Yb6hqiRpmLuwIx9UuaogH08R3lEHgiLIdJTjzezbn
 3UohVwIn/kQq9M7k13EQRwNGKYwnRPJVUJ5LU3gvDalZcd90aeWHhi8n5dEs++MxhsnhqFpbH55
 koAlCFzzQsBqAG/9P4WioOlnSuPWTpJdlFemI4dPZIzO0T2wg7auLPN7uWzsqj0zp0QWAVFM6nJ
 VhQtwj0Az0TZLkDQhPw==
X-Authority-Analysis: v=2.4 cv=cObQdFeN c=1 sm=1 tr=0 ts=6a1929c8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=e8bRT_GSZmf0kOtY9XgA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290054
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 05:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237744

Backport upstream fix for AVRCP volume initialization failure when
AVRCP connects before AVDTP.

Upstream-Status: Backport [bluez/bluez@121e5ca]
Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
Changes in v2:
- Add Signed-off-by tag
- Link to V1: https://lists.openembedded.org/g/openembedded-core/topic/patch_bluez5_fix_set/119542720

 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...t-volume-failure-with-invalid-device.patch | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
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
index 0000000000..b5846dec47
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch
@@ -0,0 +1,46 @@
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
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
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


