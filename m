Return-Path: <wei.deng@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C85CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 09:39:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31856.1782466772151334998
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 02:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=k/RKYsuH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bDkKM3Y+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q7vvOQ692752
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uvUdmD+G3UY
	Pn1dJjeko1k4f/4Tg3lUN74P2Tvy0JNA=; b=k/RKYsuHD/J/edOsL1DMVIYzxH4
	xduWRIeJNWzHVAAtcivQUWM0LCVrEFc20T7TxKE8PBy9ieuc1s4dudK2uDJaLogd
	qY7t/TlD3izeP7IyUu6RYTDdHejz+tN4PYNbrcE0miMH7zCxMTu0nP3mQJQvaMvm
	1+9cGOgHV/Fu0RYoYU/7UXqEgVlU9eh69aCms1AtqoR3DULLSK0W5CdVPgLTx9iV
	GmoS0x4TdFnk1L9+0Rgj99o9vkxvrcgElP8N4krzMKxqbRUdm2TpANB/mJZPJD/Z
	S3BVLFHkkSob9s9dzGMVveI5VZguaV8J4cA4BvwOjFHDzEf37LHpNHQMz8g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ngggbha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:39:30 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137dd558ac5so49713c88.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782466768; x=1783071568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvUdmD+G3UYPn1dJjeko1k4f/4Tg3lUN74P2Tvy0JNA=;
        b=bDkKM3Y+9nDdS/Cd2hc6bsvpae6A/CNj3kbSMlxU6gP/nG3CM/XOwxWuIEf93sD5+/
         PAkaPwIwV430J9scQzmp1zvKSMUdHGEht4co0TxZ91c8dpnaSDIopJzRtOIt2jT2FDL7
         w55occHRJw293QSfZb9MzEiXRqAdJKVo8d9Rji49Bblh+kGiwrEPzmnEgOdzvQ2uiUbg
         7vVeoPf0Ar+9Z2+Pd1hzauAPEZC1vazLvzKhuET7HYUp5RSI2OD2ij+zc8PIw6mjFP8Z
         ZOjXsek8IwYKFY8nK9dMMVJLnqsWkbKfX9M+3FM8WIwggH1i3W4D85hPuIB4wq4kffBT
         yy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466768; x=1783071568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvUdmD+G3UYPn1dJjeko1k4f/4Tg3lUN74P2Tvy0JNA=;
        b=SNfCOCmeyZXgFCIzXJagdKdyNHeDdi3rK+OMeYi1B8W/uRO+k+/679ijMmvJrtZ7M8
         dlI0dkrgpjupL8lNRISSQv23Ylzo//vtvN4mMpuOlqscOeBZXWLXLIz1smqX28HUtz4l
         IkvQX4VvfHPxZFi+K6H8fr1c/Q73bOnMm2nSUrs22d2CNHqgzJ+Q7qTatZq8WkGpa7Qf
         7UT67Si0ElpRvxc7K+F5IYOoTZRpXecNiKdmmSVrjWrV1BHrpKBkFwlEyNpVZxV/ayyZ
         7jQ5uujCYvCLjJKbDptaqWinxD54v7I0HLSOhTjbwSh62NdTD48KNdf4sFdo2KRoJG0n
         CmgA==
X-Gm-Message-State: AOJu0YxE+EjQZJf2qajGvqvxgio1outRgTJ38StWAYs16IYRvVAhtSFn
	qLka42QtuuTqM3dJmib3u00MVN4M5Wzl7by793bZ6NOR3IgBW98Qq/OFGThb+py9Zmx6cqM+UGg
	B8TIc82vtwgqTG8wiSQbYuUxPbdG8hmCFZU6H9hlFmYKuMOf/j73SK3qQWQTTCkYC7hOmphiNGY
	/uofONApB39o52ZPUHuw==
X-Gm-Gg: AfdE7cmR0SmpeiIdWBJvyi88B+Pplkijs8mNrH0eJwKxAZbSCMoxzt1VdJh8jqA10lv
	c+6umE7nlQ5Z9t1gkrdeyO59WMyDQqsC2MNPkdxEoSBSGRZtjhDAC8l0BLqDJDGdl/bBbUvSgTL
	x9utTmtJHSVsLD/qYgLjSqXWhZe5T7Gp6sKvtM4Bqj4xnhYCc67zKLj5dbqDxV2n+svPkQPZ7Ch
	amK/zILX6cnce1gokjsBlFOTD7mPqHCoaXRRIB1zgdBkMRhshuJOLucOyrQwz8gFXzUA9xUST8G
	jkdxFy2qSNZHfi8eiCLKD/0cDOx/JHKxkG2+luPyQsLboEIVY4YSObCk7vQNumJxfM3kZ+T16GS
	VJ4FXLyyKEXiLt8ZqUR/Eea1YAvUYWvX9ycbJ/Ylm7dUo589Byj32EpeD1iNiGA==
X-Received: by 2002:a05:7300:d517:b0:30b:6192:5b9 with SMTP id 5a478bee46e88-30c84def54emr2625543eec.8.1782466768103;
        Fri, 26 Jun 2026 02:39:28 -0700 (PDT)
X-Received: by 2002:a05:7300:d517:b0:30b:6192:5b9 with SMTP id 5a478bee46e88-30c84def54emr2625526eec.8.1782466767495;
        Fri, 26 Jun 2026 02:39:27 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c9e9214sm16908725eec.20.2026.06.26.02.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:39:27 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        shuai.zhang@oss.qualcomm.com
Subject: [wrynose][PATCH 2/4] bluez5: Fix sending extra bytes with MGMT_OP_ADD_EXT_ADV_DATA
Date: Fri, 26 Jun 2026 15:09:18 +0530
Message-Id: <20260626093920.1079859-2-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626093920.1079859-1-wei.deng@oss.qualcomm.com>
References: <20260626093920.1079859-1-wei.deng@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3NyBTYWx0ZWRfX8K0mi8r7dKZg
 byhUNpBoxt2fhGOW9O11HCk6dWGfp6f3onej52YtuPl6A9eczFDFSdogl8f5anYG6chwf9YcFLx
 xPVQF/vZgGC4aqBzSiIAQWuChqotRQssVC6wmqb+A2aVWrndUYUxmhaaRH3BeF/rPcroT+qfiYE
 9XBTEPi9ceP5DOlfyLo4z8Zp2Ip9ntbf85XmUJBOUBaTZWODWk2aiOSkb5d1GM3bHbYv8yRBwjo
 jn8dVDMhl8gg0EbVekUdQ+O5X/xFu8+BQoZMeMrbVMy0HgaXyxdwyx+hnXf0NUyXOBPLsEC3jz4
 tJU8YDH6z8VKYTeLxxeh3s1tq+YFq9Qhihu7DriyqSGQvV7/S65XMe1Yvx/swk6E1f+OxNrFeNl
 izBDDp7ZyLkg1Lji2RghYT659wSPMo3cpHEM66hbk9EuZa0vBhPOmhFxc/qMFWdIqka6doy19Qz
 /degpzmsvz9S9EhT1hg==
X-Authority-Analysis: v=2.4 cv=KNlqylFo c=1 sm=1 tr=0 ts=6a3e48d2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=Ea7PWexQ_xp5_is82UwA:9
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3NyBTYWx0ZWRfXzVr+eFe9omsN
 vna0FaI/UoWxqo2E3y8nJNwNhNdRqoNtBeohbnqGjrpm+lWBIBMjrsGGB3VfeMWa/gBRBtS+tf4
 JqJq/fMKPwZMadxad1JP8otajoGJgu4=
X-Proofpoint-ORIG-GUID: 6oZQT5gzcymnGe65oVfhvAeKGCtGVH_F
X-Proofpoint-GUID: 6oZQT5gzcymnGe65oVfhvAeKGCtGVH_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239620

From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>

MGMT_OP_ADD_EXT_ADV_DATA expects the command to be of struct mgmt_cp_add_ext_adv_data not mgmt_cp_add_advertising.

Signed-off-by: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...sending-extra-bytes-with-MGMT_OP_ADD.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index c09a759244e..1600107b878 100644
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
index 00000000000..0a737413679
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
2.34.1


