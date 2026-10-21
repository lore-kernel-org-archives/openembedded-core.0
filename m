Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8082.1792577317045515450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Nzkj8aGz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5kPv3015991;
	Wed, 21 Oct 2026 10:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8hVTaLr+ZcX
	e+ZApqZF/B/id3qOHjUtGhEVgOZPEZF8=; b=Nzkj8aGzYK8Tnj7zb6l4kT1MDpk
	UpzxTK4nvO+HgDzwE9V8CviwlH8OfSwbPtXhm8uhh/5++hyuGCdZ5vD19SYA3XIg
	takN7A44SE+up/fMghC8oB0ynFvEcrgNslCVaQidqEiG8zz6SaTsliXllZRJc2SC
	m6jH8MYhrjw0na06PS9t2y/yr3HHFVOuCTESaw3T6u6ZvZYlWRQpNS3Ewl6I4sID
	1+D8s8oYB7BRgdWIo+P1joBNmir19ginvzTxGUnMkvsvz+kSSnXlpKPSAfqLzUfm
	3duz+3TNe4Dl2UAeN6x21/K5mpSYxcI1NJkizXygJRC3F9foUP+ckzLGOoQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78h8r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:08:36 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA8XNL3533786;
	Wed, 21 Oct 2026 10:08:34 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69LA8YYu3533814
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:08:34 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 932D023C69; Wed, 21 Oct 2026 18:08:32 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH v2 5/5] bluez5: Fix u128_to_string skipping data[4]
Date: Wed, 21 Oct 2026 18:08:29 +0800
Message-Id: <20261021100829.2460593-6-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021100829.2460593-1-jinwang.li@oss.qualcomm.com>
References: <20261021100829.2460593-1-jinwang.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: _kx8OZNFY9685AjdUEdsrwZmIJILTFcr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX7FzuLI7TNhgQ
 rUoXNobV2JmtYYtU31m/kvXefPArtXL0YddZmoOjblwfBe3UIf1EFkgwI0WJSBaxisBFWTN59EW
 uZGhLOd5xvmGWfnymCxWe97wuzP/7Rdk//AefBdBkigfMx4J2ZGiwsewd4wXwm+ZQD4NrUL1IGE
 C57/355JCWwBWkNQHw6WUtrGQqHUHvzkxthGNXU+VmlNFcAM878wCVNIDZPTB1VA7HwIWEV3jWi
 8jBEzdz4rGxkTLR5CjAk4ukBaL/HOC4D9WoaT56I6lBEwy+eM0oOkEpDFVGUi4F4kMM5hNrNBbg
 xo2JAFbHNgid/i8QAIcguUoxd44UC77Vq9QHjA54HlcdanrBv3dgKoXqq8IZcr6oYbLZVonYhaA
 Ir/d9oJhJVgEoIioi7ZAwsGLJi8/w/GTQKy0WhTbcUW0ngs0oyc46lTKsc0HIxFcmAobkdka6GK
 Looi7R+gAMOtUZofBSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX6rw/u+pSzNtw
 AFhdDAJFZ7/gF8c50ivsPf000avEX8hcFcrm2WPyWQKMaBKhlfVSVgOt/gr5isoh+x7FD+mgp16
 w5PgLKyJxBg353ueDDSdmHYUaXk6RVE=
X-Proofpoint-ORIG-GUID: _kx8OZNFY9685AjdUEdsrwZmIJILTFcr
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad88f24 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=Ce38G63GkGelMzpPKy8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 10:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248386
Content-Type: text/plain; charset="utf-8"

data[3] was used twice, skipping data[4] in the output string.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...p-Fix-u128_to_string-skipping-data-4.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index db650acdd0..75d76cf96d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -80,6 +80,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
            file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch \
            file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
+           file://0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
new file mode 100644
index 0000000000..338bc228c1
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
@@ -0,0 +1,33 @@
+From 198f4e0785644cea2b2154b383fc4ad354707947 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Wed, 23 Sep 2026 11:29:57 +0800
+Subject: [PATCH] obexd/pbap: Fix u128_to_string skipping data[4]
+
+u128_to_string uses data[3] twice causing data[4] to be skipped and
+DatabaseIdentifier, PrimaryCounter and SecondaryCounter properties to
+be printed with wrong values.
+
+Fixes: 5ee26d43c65c ("obexd/client: Add DatabaseIdentifier property")
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/8b4a4176063831476bc9244d20f43b552e4b5554]
+Assisted-by: opencode:claude-sonnet-5
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ obexd/client/pbap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/obexd/client/pbap.c b/obexd/client/pbap.c
+index 0f575e61e..d89b6aafa 100644
+--- a/obexd/client/pbap.c
++++ b/obexd/client/pbap.c
+@@ -1098,7 +1098,7 @@ static int u128_to_string(uint8_t *data, char *str, size_t len)
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

