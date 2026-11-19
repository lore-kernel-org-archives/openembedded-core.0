Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7058.1795057391399380731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 19:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=AXDjrqdb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1C1Qf2884403
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 03:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=aqQ+34pfiJSB7vmQiAsZKDbMo70wHGthKtM
	lj9yX0q8=; b=AXDjrqdbprT5Yw+j3RAsVJmJmP2Y8+S7A7MdzcJB48wGk5Bztua
	ibP/r+jyPSOxSf8Dq3fvPYEHSne/2LA31hfMvPYEKqkpY4OEGMpo7+luASelNbnR
	7DjKaBOqL3HzfO2nE0WZAyrB8OqWk5vyXyLwmn8C/sgSIEoSFdf3u6taXgwPFOSx
	lckllTP7jpE7OSUcEcytY6szMH11Z3HE5TnCzOnKFugJEWhG7xYaqv1vKlPIkpGY
	2G6UYQ/nJPO0reoAnWD8gAHE9CkTf3C3l3qCngfB1mAGSfQFcnnsNdTH+x57p2s+
	aP2lZhpA+/TCGu+ZC/R0dETKwuTatQ80qzA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnru3h0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 03:03:09 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ336TT3564726;
	Thu, 19 Nov 2026 03:03:06 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AJ335Nj3564719
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 03:03:06 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id CA48524469; Thu, 19 Nov 2026 11:03:04 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
Subject: [PATCH] bluez5: Fix use-after-free in connection_lost
Date: Thu, 19 Nov 2026 11:02:59 +0800
Message-Id: <20261119030259.3095766-1-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAxMSBTYWx0ZWRfX5S2zNjzisJJ7
 9HM0Fmb92Z6WJ2SXEwqJgyg7c8CRRjkS0LwiI16AmB53yxOFpzbCN8jndpt+gLTiDAU4mn7pgHz
 MShzuhirW73dtSUlFB0StZ8ChIoTZvsyvUV4Nf894RHVXYdSyJEkSE4RMR/M5OkKVofEyTfzEUW
 PiEFQukgZ8YCRR3xuV0nea1efEVV9mzru1L0SisBbL3QIGsJZczmKzLI1+4kIJAPh3b0saRyZxu
 OiAYw946oIQak2GVT13WMkY5cKjIL74cGhLsRN4nXHSb2uC1DuEUAizS3926D6EfDH8QFBCV4Ai
 ey9Xj4Cu5LHyP2ABOtNN39OxOILswuZBB0TQPItgNi4EtNmq2SwvDkRZzATdqwQIA9GgZSV8nKJ
 UaS9glWgRZa0861sLnv6RGbsRMJIzgB7GllE2w7KMY8L1rUdPZwCsUtwiB9jFNX4MjWaKHDRpjU
 1iofJ67rsmgExnlqU+g==
X-Proofpoint-GUID: oT-mKW_CF3EMTv8PQGHExFWuc33O2rDA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAxMSBTYWx0ZWRfXxTb7L6o8CUi4
 5DNjId1YGAVedhFEtMAXhQNW9yK9pooaH844rTkui/bWPOI8rgnHUCVoDxlaTXRlX0oOqcUfjCZ
 l9FNy6BH2pctMIQTCQY/t0DefQZqgeI=
X-Proofpoint-ORIG-GUID: oT-mKW_CF3EMTv8PQGHExFWuc33O2rDA
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afe66ed cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=2PHYnJuJ6uv5tJDAhSIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 03:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250606
Content-Type: text/plain; charset="utf-8"

A sink may start reverse discovery when processing a remote stream
configuration. If the signaling channel disconnects after the stream is
configured and discovery holds the last setup reference, stream cleanup
frees that setup before the pending discovery callback runs, causing a
use-after-free.

Complete discovery with the disconnect error before releasing streams
so the callback runs while its setup is still valid.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ix-use-after-free-in-connection_lost.patch | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-use-after-free-in-connection_lost.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 1eb4f20b52..5339ec753b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -64,6 +64,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
+           file://0001-avdtp-Fix-use-after-free-in-connection_lost.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-use-after-free-in-connection_lost.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-use-after-free-in-connection_lost.patch
new file mode 100644
index 0000000000..8bdd74ef83
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-use-after-free-in-connection_lost.patch
@@ -0,0 +1,44 @@
+From ac2cc2527bf20f516f22055c2844973ca0e0ec80 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Mon, 16 Nov 2026 17:07:19 +0800
+Subject: [PATCH] avdtp: Fix use-after-free in connection_lost
+
+A sink may start reverse discovery when processing a remote stream
+configuration. If the signaling channel disconnects after the stream is
+configured and discovery holds the last setup reference, stream cleanup
+frees that setup before the pending discovery callback runs, causing a
+use-after-free.
+
+Complete discovery with the disconnect error before releasing streams
+so the callback runs while its setup is still valid.
+
+Fixes: 02877c5e98b8 ("a2dp: Add reverse discovery")
+Assisted-by: Claude:claude-sonnet-5
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/43de1efcb453ec401c2f2ae09682486b4f3e1ff3]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ profiles/audio/avdtp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
+index 30f80a0c2..5ebc0c5cc 100644
+--- a/profiles/audio/avdtp.c
++++ b/profiles/audio/avdtp.c
+@@ -1159,11 +1159,11 @@ static void connection_lost(struct avdtp *session, int err)
+ 	ba2str(device_get_address(session->device), address);
+ 	DBG("Disconnected from %s", address);
+ 
++	finalize_discovery(session, err);
++
+ 	g_slist_foreach(session->streams, (GFunc) release_stream, session);
+ 	session->streams = NULL;
+ 
+-	finalize_discovery(session, err);
+-
+ 	avdtp_set_state(session, AVDTP_SESSION_STATE_DISCONNECTED);
+ 
+ 	avdtp_unref(session);
+-- 
+2.34.1
+
-- 
2.34.1

