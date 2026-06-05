Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA06CD6E6B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 07:03:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2614.1780641922033407604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 23:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=HtDBaIoN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=U2mSsS+T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: xiuzhuo.shang@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654NNnaZ528938
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Jun 2026 06:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KfOKd52zDtFkTBvHfSCDsTqa3Bsh1erDJs6
	DyRZR+lM=; b=HtDBaIoN8T9WPZHdUqVgopMq72P2eVpq6ejry5eTDlGg5EjyL+x
	xzJ24ftuCLsTomfEITfBfTCa+2rDxq1myb579fKFJ+6iAQk5Rfic1MR1Oxo5X5Cn
	MbMbizREdnWDsaftDSje7x+PshXxW3UDr4qHObD/urkbpCOjK51VsauRQsxJWJl/
	oRAtcLAW2foAZwSreRZW6+MsW/l/jK5St6shUBoigbEClQ4OE33kL+hzCE62wrdo
	+UQn5X+pF662gmbXIuATNGVkXwhORmr87jWEjRNqc48RWPz2DOeJlbre3cSPe0E/
	XGkjQ8fBeovsTagZaQ76zHXlyppbrSh9Ydw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekbgdumgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 06:45:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8584e3fc96so897903a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 23:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780641920; x=1781246720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfOKd52zDtFkTBvHfSCDsTqa3Bsh1erDJs6DyRZR+lM=;
        b=U2mSsS+T+dwJJqd6mhE5XqhQ6j4PYFVsUBkdELzP+NE3FrDiVe6JSlRiRo/VNaEpSe
         aCRMmtVnooZmTnObBpQUdRgVdrV2rme5B8JAVX2rEFMa+5o6gW5DiyznaeN3EH+q/YgW
         YR9LM8v4rxLlaq2VQhdMhhCeWxPlZR9m09GbbreMLU+Y14QG+Yhj9qhy9pGpZ40NXjt4
         SJk+vLQxM1LlfvD6p0FFLfWfMB+IeTE106RDh/tPEBY1lzJINlR59JWWLx84/C17ghNp
         nhcuta19oiEmm+vfEcwv0JkknCgtXCPlpCAKvs+mdp4j2OLx9o+GY/nlVdQFxByXEfLg
         GZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780641920; x=1781246720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfOKd52zDtFkTBvHfSCDsTqa3Bsh1erDJs6DyRZR+lM=;
        b=rkwmZy8mDBFbcpjQXXWiI5WIOIzV1ydEX3vqqeW1uVAEkYXh2bvAjFP3pXWvhC6zIl
         9zpmA3Esmgv/lgT1gOTXJ/RuJvlNWf4JVLa9E0Lad6AHcoHZfn0x27cjEm9/YFnWO2Tb
         kYFmV4Ysv6RMrzGZjpZQzePAgd/aTaAMEZtA1PpjORwGNeGA9EAburFGSs1jCak6IH+T
         qzJXmuVxYuZ72CykQZYUJhypRjdMGfjzmvtAUsxdPkFM9dGJh4j9LR0BlQo9d1/ZpJIm
         elijYUDwzKdHfUlYThP6DJmfALfeB8vLKRjy5TkY3PKj16Uthu1UfgyTZ3auUo9bAr0n
         PujA==
X-Gm-Message-State: AOJu0YxGHkA5m5T3hsgEI6crhmN3XnWe0CxcbUS6shAJxgyT4PjOnHoY
	x4wJSg7YbtJJfU6Mm0cq3qOdCTY2NEc1cEeEWaD3shEAEgPhmFtRNhhCWYroOGGODlaOERXuX0h
	yztvxgje8/sVbIv3cfkIUYArg54g4Xf915WhZZKmTG1aAfD3sAX7mBANMK0Ef8DcBv/Ru3i43cC
	GFlgTvWYRjqg2PTpI=
X-Gm-Gg: Acq92OFcDuTATNTZP61EnqQUOeaTFXMk/U0QlRbY2h4lAw9gVP7iM1oJqwKlFpZMct3
	9SrfodfePd9ZSxngYyWdMmeWyDTpqoM4sP4Ksik+KwUwC+UbvmeJ3L0mDWAUe9zD6nftTZqnBQ0
	2G7sxcaE+3HNXS2rrsTVyrCC5WUo/W/J9YxpKneAe3XcutuKpeb5BoA9PTdVSTERqZclEIP8nRA
	9SpjigAtvS7Zp5FFC7Cs6xjZ3bJRTsqVel2RChBr1pxwbS2vbo4iNV+3htEGmkJ6Kc0Yx04p1HE
	6xyw/uUmm6vPCW6sM06bTK/1q7hO6RwE/RMfUzlFRX5q3t+cKOnOX4DwOQ+sWrI/w4ScyQ2ez6Y
	tAHQ/AJagCqF1l0jsOuLtKepVKcgZt9kFuPvopkhlZtgFRe2/69wWltzEmIMYV8p6
X-Received: by 2002:a05:6a21:4d07:b0:3b4:731e:6f95 with SMTP id adf61e73a8af0-3b4cd0423b3mr2867046637.39.1780641919583;
        Thu, 04 Jun 2026 23:45:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d07:b0:3b4:731e:6f95 with SMTP id adf61e73a8af0-3b4cd0423b3mr2867003637.39.1780641919088;
        Thu, 04 Jun 2026 23:45:19 -0700 (PDT)
Received: from bt-iot-sh03-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm6685628a12.26.2026.06.04.23.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:45:18 -0700 (PDT)
From: xiuzhuo.shang@oss.qualcomm.com
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH v1] bluez5: Fix sending extra bytes with MGMT_OP_ADD_EXT_ADV_DATA
Date: Fri,  5 Jun 2026 14:45:13 +0800
Message-ID: <20260605064513.3634780-1-xiuzhuo.shang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-GUID: cUAVK3HZplPW5_HQxsm1jvUEaXORMttt
X-Proofpoint-ORIG-GUID: cUAVK3HZplPW5_HQxsm1jvUEaXORMttt
X-Authority-Analysis: v=2.4 cv=a8cAM0SF c=1 sm=1 tr=0 ts=6a227080 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=Ea7PWexQ_xp5_is82UwA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA2MiBTYWx0ZWRfX2due7gcpw1PX
 S9ihPq/Wg3LMdUaRMXwZjipN6gb21WyUdAVH2XBMdl8Z+COGsja7rV4LU55a+6knp+flqDl9jnJ
 KxjJCMxOu2mHpnMTk9XcK6FwInnNR5MmxrzVb29o4pDkiXyTuaDR3+DjVRylc1t4k6ldTo0P8TU
 enZnJ6F0hdRT3H8yKEfuy3we8VEZ17lcLGVMRL40Rmy8Gvgvna1WvUn8L1mS2KuCIkvay24hZ1n
 h5Ko3ASVxuemMtUNP0ico26w+4M5bpeZxpq2cCEHFFHArnIg+DJ+iR6WobeNir/cDvEK01nS79T
 IhOK4XhE9YKFkUHLBJjwsY4Ai0XSJRFQRuV4DvB/dK55Uacop0/mZ752sii3BHFrVVnMhHaywrh
 kOGtolGp7JG2H8ZtyRS38/3Y+sJu6YEn7kcAWogB3+Ca49oiMIrQkrongyKN+nRnOwXPN4eCEyQ
 H9WOVcv/lzBUw4maQvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050062
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 07:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238146

MGMT_OP_ADD_EXT_ADV_DATA expects the command to be of struct mgmt_cp_add_ext_adv_data not mgmt_cp_add_advertising.

Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...sending-extra-bytes-with-MGMT_OP_ADD.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index e827d0a6d7..dfd368ef3f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -72,6 +72,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tools-Work-around-broken-stdin-handling-in-home-made.patch \
            file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
            file://0001-transport-Fix-set-volume-failure-with-invalid-device.patch \
+           file://0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch
new file mode 100644
index 0000000000..0a73741367
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch
@@ -0,0 +1,33 @@
+From b16441fbb7a24325f7c7d0c5ecedc88b46ddd439 Mon Sep 17 00:00:00 2001
+From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
+Date: Thu, 4 Jun 2026 17:32:27 +0800
+Subject: [PATCH] advertising: Fix sending extra bytes with
+ MGMT_OP_ADD_EXT_ADV_DATA
+
+MGMT_OP_ADD_EXT_ADV_DATA expects the command to be of size of
+struct mgmt_cp_add_ext_adv_data not mgmt_cp_add_advertising.
+
+Upstream-Status: Backport [2a6968b40378dca5650e18e03ad0407738c47be5]
+Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
+---
+ src/advertising.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/advertising.c b/src/advertising.c
+index 8970e65f7..0cb37d4ae 100644
+--- a/src/advertising.c
++++ b/src/advertising.c
+@@ -1487,8 +1487,7 @@ static void add_adv_params_callback(uint8_t status, uint16_t length,
+ 		}
+ 	}
+ 
+-	param_len = sizeof(struct mgmt_cp_add_advertising) + adv_data_len +
+-							scan_rsp_len;
++	param_len = sizeof(*cp) + adv_data_len + scan_rsp_len;
+ 
+ 	cp = malloc0(param_len);
+ 	if (!cp) {
+-- 
+2.43.0
+
-- 
2.43.0


