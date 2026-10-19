Return-Path: <jinwang.li@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04EBCCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 08:24:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29871.1792398237501148498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 01:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=m0Bh29Dl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J7nJjq1089874
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6+DQprWnQGx
	YkqOIgTnWFUb/eZiCFyKzn43PYX65U1U=; b=m0Bh29Dldz5KbyEKuPkw5ZxvTeZ
	Hfu8lk/vnnoEoVHVj5Ab4dzM+u8SHqpeNFLdyc1qsW5MZ7fin6tZeNNTGCPLRV/x
	ozldPJHqeQXs5Y3c/DHv7xLAGgY6LVixuh8nE4ddzkGaxi2bakYQPJn+D0yeNp/2
	0rE23Ordhbk8HmZU9COb8+AE2akl3yNdw7L761fgsAROHiGS6hwiTSLB2zKh1C/3
	oKvIieprLB0qQPY8Vbw/R5Qs/CWR64g79ZUZ7PVWs2KCXivpesRyt0NAAlPAsBU2
	L+XYpl6GFSkNffHssml4UbOtROH2+fnj+uqDet9MqR/cHjbiG0KGZwA+vtg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8490-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:56 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Nrqv4111158;
	Mon, 19 Oct 2026 08:23:53 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69J8Nr1r4111141
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 08:23:53 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 8A88823C59; Mon, 19 Oct 2026 16:23:52 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH 2/5] bluez5: Fix GET_CONFIGURATION cmd
Date: Mon, 19 Oct 2026 16:23:43 +0800
Message-Id: <20261019082346.3287363-3-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfXyHznAapGdGCL
 CzcPZ2ybKN5w6lM1fuOaqGqouniKPel+jFcqULqzXXk3QUe/sWurFnRNxg6Zindvki2lFkWYJRs
 rc6BCzLU4xwDvXOXJKgGkMXR0HfnM9c=
X-Proofpoint-ORIG-GUID: JweShCyXZ5ZSlRguMy6jTcKEsAWuIWYV
X-Proofpoint-GUID: JweShCyXZ5ZSlRguMy6jTcKEsAWuIWYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfX0yHfc/IF2rS0
 mF3OBLtHeZOvxME+hW2fwdYwXsCQswMmuU6h08PZ0dF26wz9tobLA8CAFk5KrQJLvhoD73tE3ei
 vP0dWmmDJQGUA0uUZLjre87gktcqZSNXgbr/VmeE1ydx4hvXQQkfCr4//5NFNd+Er+jy7Ey6/dx
 5Gesur057OU4ArYMgpnmPXPCLolOkVbAPNfuiQJawd/H+fVQde+caR9GP4mg75PThL4g/h6M9OR
 f5L3h8+Nkql9O9bviwEpDT8X/W88+czS5Cbn3PnrQx8Q7v/FDZ2plYdp0VXodzvJVA9sECuFmKC
 KHfqtuI62sRIbN9+2TQJF9nodb7yi27fIN2n5QkLWaZoVZIwX3Via9DLwBHWBoq5hqhPazFw1h+
 Hj/ZH8fj/9iVNW1RgMj6+s9hrtuMENxyS/Z3cnyfc+R9D6lWw6Dmf5nfO6ZyTqAMs+zuwMXz2aY
 B+fzCNQRGXp3K9/dHIQ==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5d39c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=jIbkme_7AAAA:8
 a=4HOn1LdvDNRzZusI_zYA:9 a=4Z6V1Uo88S3JekNeKaJk:22
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248143

Check the resolved stream instead of an always-NULL sep pointer
when testing for BAD_ACP_SEID.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 169269d377..7e05bda4f1 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -77,6 +77,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
            file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch \
+           file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch
new file mode 100644
index 0000000000..eb1738f75c
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch
@@ -0,0 +1,37 @@
+From 8e5ca68aeee22970e3ccf3bbb30c050938ba09a2 Mon Sep 17 00:00:00 2001
+From: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Date: Mon, 8 Jun 2026 13:29:22 +0200
+Subject: [PATCH] avdtp: Fix GET_CONFIGURATION cmd
+
+This fixes AVDTP/SNK/ACP/SIG/SMG/BV-12-C
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/60437c06560e46d211aaf99620cc9510dfd8081f]
+Signed-off-by: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ profiles/audio/avdtp.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
+index d475a545e..7cfc9a80d 100644
+--- a/profiles/audio/avdtp.c
++++ b/profiles/audio/avdtp.c
+@@ -1641,7 +1641,6 @@ static gboolean avdtp_getconf_cmd(struct avdtp *session, uint8_t transaction,
+ 					struct seid_req *req, int size)
+ {
+ 	GSList *l;
+-	struct avdtp_local_sep *sep = NULL;
+ 	struct avdtp_stream *stream;
+ 	int rsp_size;
+ 	uint8_t err;
+@@ -1656,7 +1655,7 @@ static gboolean avdtp_getconf_cmd(struct avdtp *session, uint8_t transaction,
+ 	memset(buf, 0, sizeof(buf));
+ 
+ 	stream = find_stream_by_lseid(session, req->acp_seid);
+-	if (!sep) {
++	if (!stream) {
+ 		err = AVDTP_BAD_ACP_SEID;
+ 		goto failed;
+ 	}
+-- 
+2.34.1
+
-- 
2.34.1


