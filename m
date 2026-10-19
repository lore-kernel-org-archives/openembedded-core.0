Return-Path: <jinwang.li@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71600CCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 08:24:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30013.1792398238716290627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 01:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HveV20yE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J7n7ja1089224
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8hVTaLr+ZcX
	e+ZApqZF/B/id3qOHjUtGhEVgOZPEZF8=; b=HveV20yEMkjWiKZ/Gh2x466djdF
	eft33/sF8GbHjxaKe65b4kFXmdW/ZxeziWXrHP6ZkvHAE8Ya+DZL3844baUTsQ6P
	eIDzsw+ztmWYG+BctF7JE+v7oIfJoC/PsN2shoyl3TSrTBWOhxSCRCL1/u1HPSSz
	lXZFaHIo79HI8kysG4jPdjhHijYVo2kaB3zp3vrI+FmLy8c72MgyIHk/FRkJJ5+I
	WiKpoaIzHYhwTqvHhrZ9RwgXub8ZIItfsnTr6S/hkRizYOAEQvDn230GzAgUrQVk
	e6JYjnK0uIX4qjaO5agMI98DUP+l3rCkTY614lZIy6Mly/g2/C9JrVKPXiw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8492-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:57 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8NrSc4111219
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:55 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 69J8Ns5E4111265
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 08:23:54 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 993A224343; Mon, 19 Oct 2026 16:23:52 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH 5/5] bluez5: Fix u128_to_string skipping data[4]
Date: Mon, 19 Oct 2026 16:23:46 +0800
Message-Id: <20261019082346.3287363-6-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfX3Df84Ufh+rtA
 AQQoVq8cXQOUiXLmTeJQ1w0JDdCV0JvJDjT7EeALMfHX9uW0kS08748oPA5g6t7VmedK4u43CCF
 Pdj4asZdQGjxxTNGai4sR8e7ooGIWSY=
X-Proofpoint-ORIG-GUID: bmUYpdWmpr075O3xfhgXyjSc2ct3qCfM
X-Proofpoint-GUID: bmUYpdWmpr075O3xfhgXyjSc2ct3qCfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfX/7KhcF8JzNE4
 5JL34AotA8E+gbyOCbdCB1bGw5utLWmZQMeqG89J2JRftI/fs0Yv5wXQEm75VHM111/7iaxqWSh
 h30wxD2Z6BjOGIWFNRfqAqHNJb4hEnG9MV6uRQ9erY5LEGH+gBWiWoeSvS6I6FBWD8EzAq/iEJh
 JCt8g3+UZNifJCi6V+5t2IzuJC2j+g4FF75u/sRJ6zK5A07ZQNIMSfLWIb3NE1qhGaWniEVhq38
 iZSU2J2fdmbAU1+PdimgXWZoLnFEXbYgnWVhw9g8cRjC2oBxyeS2CMme2rLFFwTNszdtm/kBMko
 7U2SgayNtIk1noSFL/iV5+vuv8VamASn7RhVC6ImALaBQtmv/N8McO7LcMk+lrUmFV9KgsuZnC8
 gw2V5SfEBLYZr9IGUk3l8KEtbGk+EouFFXzedGyAJlbcl5iYvyjjJ3p7ZU4c7NS1Ni6fNlrHbzT
 dOpJRQ6ZSBAL4fkd1Pg==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5d39d cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=Ce38G63GkGelMzpPKy8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248147

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


