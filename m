Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8051.1792577317021056388
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ZmmhtOTN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5jZf3015966;
	Wed, 21 Oct 2026 10:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wI8hq2Dwjee
	JC3vOtQ4KE9v6mNJhKr/n1AtpbNw3lWw=; b=ZmmhtOTNWs1P3IgCPNmRUz7/+l6
	RlbvJLLv8UoJUml/BN3pBTOG5Wf7gxK5ArRvervdEF22AEmjYcqkIzcbK9p21Z/D
	rw7AEcC4vNBlQlESCAQV6BtNaqmUGwCRONgB4s53rFfS+5IwtFJjERmUpD4yYBaX
	VL5vnOs9N9kI/bU9n0KaaIo1bGsVmFIFaDkcA9D5teBvfBtSpZqXDaUcqwXSrvxx
	ZPzSXrCOVw7dTG2lgGlJXvMunj7LTBjUL6zg1JLKMjtY0QLJe/ecQqigiwvfjQs7
	OYht0ngvMLP9OU0vygaKXneOfr7qEa6QOJ5/nyO/TJVc+LwWTSXyLEwmVOw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78h8q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:08:36 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA8XNK3533786;
	Wed, 21 Oct 2026 10:08:33 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69LA8XsD3533740
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:08:33 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 8A11923BF1; Wed, 21 Oct 2026 18:08:32 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH v2 3/5] bluez5: Return correct error when SEP is inuse
Date: Wed, 21 Oct 2026 18:08:27 +0800
Message-Id: <20261021100829.2460593-4-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021100829.2460593-1-jinwang.li@oss.qualcomm.com>
References: <20261021100829.2460593-1-jinwang.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: 415t584c2-gGkq9vrnQk_oBR4GjHyDWJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX+s/eeyMHM3Nm
 mShr1qswzo+OUuC2ja1VWM5dGY4kkZSKo59EX64qHOYsuQkH//nN7PAdpuJQLhnFA4ab4T4y6Uu
 k2VW3lW+BGzZ/WMKVKDgEma+lUF3ReGBn1QCQS1/s78eFczK0YaNjJVknpi8Ubl6gNgjE9P5ZzE
 j0GH7ui2ZTifkrEcnhT/yYQY8+8h8UCUHH6ZHsQufGI7uMbn0icbcTfXpLKMjcQmNcaOxOQL5M5
 Rb7X5apogwsG/Aj1gLPfAhLeiDs4+M+2kJCS2Owb6kvgx5bWvwSkXJaFdvRJEaC2cPGFOk4W5is
 3VaKEkjx62pR3EChWVehUvnLE1YRR8qVvPhHwbGHoM5CbQpS56cPPbL8j+OT8xn1wG1jhNM5lp3
 a+tX0VlCQn6njkCmZ1fQivtq1YPmCIc84/9zw892p4q9AdE/7T5OwubKPkgbJa0fOdZJnlvpW5k
 7picoXp9cHm1hWEcGLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfXzdDloA2meUH7
 o9F9ojzHRj6vn/Ncpi/F93vUDoK4Nm0LOMWnrFOYPT5m8YIrMH41fDIuCE62wi4VhjaBQi9n5I5
 4MJA8q/Pn2PpvXyUGdgUO/2xaM2S4Bg=
X-Proofpoint-ORIG-GUID: 415t584c2-gGkq9vrnQk_oBR4GjHyDWJ
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad88f24 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=jIbkme_7AAAA:8
 a=IccVTasTp-42yIGwOJcA:9 a=4Z6V1Uo88S3JekNeKaJk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 10:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248385
Content-Type: text/plain; charset="utf-8"

Reject AVDTP_SET_CONFIGURATION with SEP_IN_USE when the SEID is
already bound to an active stream.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...turn-correct-error-when-SEP-is-inuse.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7e05bda4f1..de9835e5a7 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -78,6 +78,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
            file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch \
            file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
+           file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch
new file mode 100644
index 0000000000..583e2c2e23
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch
@@ -0,0 +1,32 @@
+From f1bbe63447bcc69beb546bc1e26a4e99c529d70e Mon Sep 17 00:00:00 2001
+From: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Date: Tue, 9 Jun 2026 23:30:13 +0200
+Subject: [PATCH] avdtp: Return correct error when SEP is inuse
+
+This fixes AVDTP/SNK/ACP/SIG/SMG/BI-08-C
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/39ad431de60b896a03904887a0f1d0285b719edd]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ profiles/audio/avdtp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
+index 7cfc9a80d..b57ba609b 100644
+--- a/profiles/audio/avdtp.c
++++ b/profiles/audio/avdtp.c
+@@ -1556,6 +1556,12 @@ static gboolean avdtp_setconf_cmd(struct avdtp *session, uint8_t transaction,
+ 		goto failed;
+ 	}
+ 
++	/* check if SEID is in use */
++	if (find_stream_by_lsep(session, sep)) {
++		err = AVDTP_SEP_IN_USE;
++		goto failed;
++	}
++
+ 	switch (sep->info.type) {
+ 	case AVDTP_SEP_TYPE_SOURCE:
+ 		service = btd_device_get_service(session->device,
+-- 
+2.34.1
+
-- 
2.34.1

