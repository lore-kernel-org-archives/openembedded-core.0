Return-Path: <jinwang.li@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B33C9830E
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 06:02:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7136.1790748154209650484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 23:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SQfb5iTd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNPwom2250338
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 06:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KdYjLawtTMIjuoz3iGyWkTmSI3NfKObdNuW
	Th4QT7C0=; b=SQfb5iTdgj1g9y8+du9VXIdgtocEf0oewN8eh/OfYnfPqbB6TGW
	YzYQkqID+BM9F99iq6JpW1Zw3HcP2H96kwoGJ5JjXvyYoTqCheSS/AmpF9ALKY1d
	1NUmofMu897024TQTVWqigVglwC8+1XKTULaq7/j9WH+B38sSkbAyZPWp0WkHpYX
	lC/rhmFczL+Mrgj00HWpJm9ynocAm5rgDs47bPFmpHdQufTDA6GxW0Ix0UDDB8ff
	Ox92eKl7XdBS1unvVNr8NMr/v48N00EEgOgh9Uata3FXJwqBOOHUlsXbvFby2nOr
	TwTeiixmJpT1ki028tU7IX13lZrp+M+mLJg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3hqm1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 06:02:32 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68U62TrU220760;
	Wed, 30 Sep 2026 06:02:29 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 68U62T5R220751
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 06:02:29 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 46B9223419; Wed, 30 Sep 2026 14:02:28 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
Subject: [PATCH] bluez5: fix obexd/pbap u128_to_string skipping data[4]
Date: Wed, 30 Sep 2026 14:02:00 +0800
Message-Id: <20260930060200.94625-1-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: wKbAV2bHknZA-EaFFrVjcQltUtg4NQi5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMyBTYWx0ZWRfX6ve4z83GXYxx
 8TA5NH8VCmR9PkXcokHcFPZkyuiroXro40Ctwvmo6rtHUy0TjH8f6EiHw7K3V/ShG2kqyYNTqIo
 o4rJtpbjWjAY0TCNRD3rroAM4x9He2G1rrKndKObESjCsd+FsU/xqqkQUmJH/ycfFBl/6GPoTfy
 Pne/vIZyV+sK2XKSGhx29CZk94MzTXMOUNK/i6/xI+7NDdfu23ZFv/51cDJnowCgP+X2dAGT7lV
 YyzUGenmpSrW0hSqZSlDkI2B1JezOsZhqZ40oPmZEZTCvwYaMSslvHjxHce+vaMMh6NfqnbzkQr
 0rRySdlgzhEkwkKlKvuvvGEWS1Rw7w2jebI0p/T3vU5RUs6ZZD/W+/gutI44nHDkDBpzinEkuGL
 f0IDD5TwvmmqNE8NFDs3GlLhCZctfPcJVvgJv99xayvMWtMrDxs5NSeysgjc8VevpFT2Jgm8ewl
 zDoByrIrT6vQ3U2ep7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMyBTYWx0ZWRfX4ulagPIX+tMA
 9NaiUSqNXl4Yn31ZWJVYMLjtAnHfscgUFHDBKcwaHr8I2101ul5g6WkSFh09m2oeuVz9z0zvmcW
 n4mod67yKc4TdOOV9Q1sqLp9vT72sts=
X-Proofpoint-GUID: wKbAV2bHknZA-EaFFrVjcQltUtg4NQi5
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abca5f8 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=1Y_XC99iyDOHohUGpnYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 06:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246918

u128_to_string() uses data[3] twice, causing data[4] to be skipped and
DatabaseIdentifier, PrimaryCounter and SecondaryCounter properties to
be printed with wrong values.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...p-Fix-u128_to_string-skipping-data-4.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 67bdb6017f..22d50bc23f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -68,6 +68,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
            file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
+           file://0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
new file mode 100644
index 0000000000..13adce3aa2
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
@@ -0,0 +1,33 @@
+From 8b4a4176063831476bc9244d20f43b552e4b5554 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Wed, 23 Sep 2026 11:29:57 +0800
+Subject: [PATCH] obexd/pbap: Fix u128_to_string skipping data[4]
+
+u128_to_string uses data[3] twice causing data[4] to be skipped and
+DatabaseIdentifier, PrimaryCounter and SecondaryCounter properties to
+be printed with wrong values.
+
+Fixes: 5ee26d43c65c ("obexd/client: Add DatabaseIdentifier property")
+Assisted-by: opencode:claude-sonnet-5
+Upstream-Status: Backport [commit 8b4a4176063831476bc9244d20f43b552e4b5554]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ obexd/client/pbap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/obexd/client/pbap.c b/obexd/client/pbap.c
+index ce5e6cd5d..1970d3357 100644
+--- a/obexd/client/pbap.c
++++ b/obexd/client/pbap.c
+@@ -1099,7 +1099,7 @@ static int u128_to_string(uint8_t *data, char *str, size_t len)
+ 	return snprintf(str, len, "%02X%02X%02X%02X%02X%02X%02X%02X"
+ 					"%02X%02X%02X%02X%02X%02X%02X%02X",
+ 					data[0], data[1], data[2], data[3],
+-					data[3], data[5], data[6], data[7],
++					data[4], data[5], data[6], data[7],
+ 					data[8], data[9], data[10], data[11],
+ 					data[12], data[13], data[14], data[15]);
+ }
+-- 
+2.34.1
+
-- 
2.34.1


