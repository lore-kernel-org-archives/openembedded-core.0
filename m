Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9923.1795486643333100016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 18:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gBIQDXq7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO0KXJN1893363;
	Tue, 24 Nov 2026 02:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gya/que6rXOQGE/6fUdlB0lJfrDZUqCpLyp
	5d0WSSV8=; b=gBIQDXq7sv2rM+ZhmnUmLMvn0bVt4CmAeNBczVGjZsFyo0flk5D
	AvK52wHL95G/PtCds11+3oIy+Wr76rV7yYt95Lue6duXVEUPlfI7S25otNAHgLR4
	bLs8ACJH5HjPB3j1nTHF9hohRYbF2QAu1zBmFdmbOsphwToZzDkabkFdkBdSV7LE
	YFtybNmP5m3NInk02wZufhSVWKZ5E2SDm617V38mkpxWNe/Xd7LRJj+BKVyeb4eW
	xJiHGeFkE6yWE4SqBucP8q75HvLStShuL0/vdoDnQtcowxrQ9TZdyZC8C71ky57h
	HqmIf21HUhP1g1BIp/G7AXd/6YDJ+fN5Afw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy10a8c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 02:17:21 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2HICW3917291;
	Tue, 24 Nov 2026 02:17:18 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 6AO2HHeJ3917260
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 02:17:17 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 9EEEF23C14; Tue, 24 Nov 2026 10:17:16 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH] bluez5: Fix use-after-free in connection_lost
Date: Tue, 24 Nov 2026 10:17:09 +0800
Message-Id: <20261124021709.3368726-1-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 2z-3geOEiPw6oZvxskqAVxcjm7_q1gn6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfX8dlN5k+VrbUU
 i1TKBMl7Z4B2yIHarh2ebPExnsOr+D1ir8GDAQIb/H8m9pmqyV/7SgrO7Uo94nWt8MvUKd7UrXu
 jeT2rNSeX+W62/94JbWErmuZug0yZKk=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b04f3b1 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=2PHYnJuJ6uv5tJDAhSIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAwNyBTYWx0ZWRfX2E9z22az0mL4
 6Em2ofvJzxPxtzWdNAgRgXOSu7ozzCJSXQtCpJq6Is+EMcpWj2W0BkuhlZeFvm3Ut4XBhwjgJ+y
 NfLJ42+42n4c8U+bpLAC3gpR81j+xgEWDcq9FeRiwopqe+U6yLKVxwCH7/8nZDwASQcQ1hQac5w
 5oK2npGMnPR4iPcQX1owO4NbY/l6GZJBR5wGMcTs6Gy2ayw9Ft5wQp6OoBmewPWI8MXT+7JGt9s
 xYy9nB8fpqlhswAwqjftnQOFBWmwPM/PDVaub9vy/b+xKD7X/6sMslCzsC7MfibH5sfxQhzmePN
 1tX2UZ/nanNbMjMgK+lsov0ojM9RmSrtru/l/7TJIttFv1waocZf4SzlW/zDOVOMxLTlQnXWZl0
 5qtb3lIomQ4YjRWPaypXwrQx/IFl7Q2KHiZt8uAvoVZEgoLXlR7A+3UulF2PHu6za/O2QPFnL6Y
 LXnFqSdYS9brjgu3Gcw==
X-Proofpoint-GUID: 2z-3geOEiPw6oZvxskqAVxcjm7_q1gn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240007
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 02:17:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250939
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
 ...ix-use-after-free-in-connection_lost.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-use-after-free-in-connection_lost.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7583b34fa6..8d44193fa2 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -84,6 +84,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://CVE-2026-19774_p1.patch \
            file://CVE-2026-19774_p2.patch \
            file://0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch \
+           file://0001-avdtp-Fix-use-after-free-in-connection_lost.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-use-after-free-in-connection_lost.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-use-after-free-in-connection_lost.patch
new file mode 100644
index 0000000000..1b1c0adc1b
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-use-after-free-in-connection_lost.patch
@@ -0,0 +1,43 @@
+From 7f097a4c0867a0dc2a8e8a2e3d567c09f0cbd98d Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/43de1efcb453ec401c2f2ae09682486b4f3e1ff3]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ profiles/audio/avdtp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
+index 56d27b973..b8d9b8e94 100644
+--- a/profiles/audio/avdtp.c
++++ b/profiles/audio/avdtp.c
+@@ -1158,11 +1158,11 @@ static void connection_lost(struct avdtp *session, int err)
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

