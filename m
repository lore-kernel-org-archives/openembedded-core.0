Return-Path: <wei.deng@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A553FCDE00E
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 06:42:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29689.1782456164827045270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 23:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NBCzP/L5;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jEFw8UqM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VP5k047786
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YvRVsCWApF2
	qRHFocMIOSn2W7rtQAXgVs9OKurXNVBE=; b=NBCzP/L5MTS9+qq4vRgfd4+u7jg
	C3HsT4xRnMRQPQs72u8uH//dwMJGRW/MX6uKtyydsZaM624P0fb2+NvCf8phoTob
	vfbhI8L6AT+ykc0dqQzSlV8lGgitjg8CvafqDoCJegf9yB+K9+dRWEV8OkXJTv2o
	khjchviaxV1cMvTYL043YH+lOkL1h7tJPDgde/R1pGgBARrXDBXa8K7mscCzLFom
	15aKexKF8Lp/1NJYt6C1T7NxSwalspqXMiTGRzNgwaFTLoAye1470ru2PizE/3Ne
	t4NlggFdh0pez+RSK11EWMhGR9t58R6IQgn8/IphJVKhGlNW+7XcbJgnhBA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f16ukbedt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c8aa3ca3eso69962eec.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 23:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782456164; x=1783060964; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YvRVsCWApF2qRHFocMIOSn2W7rtQAXgVs9OKurXNVBE=;
        b=jEFw8UqMXosfRmqmvJ92eDa0mwUbXk89cCqVqO3S1OOQHjLa1oAmSeFEj5HShMRrvm
         ImBunM4Q7C47Pxo+FvhaK7fEjkwMsIQpZDrMKTdqLiXu+Bf8g73vGLjqRNYABMflX0su
         ao7uHS0oDg5Ez6FOptRIDpAVEVuGgpaitNp8FmWjhB5b0rdZpwddA4wj+NinDeCykVNs
         n/au6DtoXbbshUxOJ9f6RxaknM0/JlCOU7RgZ9j5NrjPqdV9pQlBQpiiveSdN4cQ108D
         Qlcnayr3JUh3LxbFWmnctaAn3P6mSyTLIgjC6NPdtwgRn7MKsblS+guyPilEmUs+8tx5
         BoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782456164; x=1783060964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YvRVsCWApF2qRHFocMIOSn2W7rtQAXgVs9OKurXNVBE=;
        b=XJjHZ2YsQBx0v7nETUvfbILidKw9sld/nK8rJqWCv9P6DpwCS1nQxK/o+CcEA2W2PM
         Uls6WgL3bc7jCJmNVJkV15wIBaaYj6CxPVkSTpgLpGUUw71JZYTAwBSgVqUMHs5FYEDO
         TzBS39d10q/E7Ies58VT4Z/lRYQmd88VtsgeJ+uJvjKMyjtOHlNwftnOyN+q255HtA20
         Sb65eVSpNJI+5xQwVcecI8oYlZv3njSvSgzKtpY8aFyQ38ycZgj/0AleQ92Oxf35Tw5Q
         fZMXea36n+ahE2pGRGWYcmR6pQrSTdtT9SmfpyS400iyJxZ2eumeSX1Kp3ebEU1xd/0e
         3JKA==
X-Gm-Message-State: AOJu0YxlXNdFuNTul09ekf1g6GNdZrNzfQ3e9uA78uSo77KXVWwvPsnJ
	VhZLMqL3qUU1aYAtc+1/FXDBc6Q/8vjExXdSyrYlH9WgRjM0jYqpSLbmaSJdCmj4ODz7VfoM1cb
	fpF2Sk5FpuZCQlxijtJ+z9G5q5pa0wPD465R/izi1an9QGrCeQEolE3naTag0CYl8oxf9HRAGNB
	GCswMxH0iF63IgjGI/Ug==
X-Gm-Gg: AfdE7cmAQ4p9vjR1dyY/jCkqjZPbrIJ0YNuDJe/Yh/sEKaPcF6MgWIhx17LcjBoGAGf
	iaJoGWB9EbdJLs9DD97fsHwY2vxpr8ZVVldScHRkda2N7FeUZFNUcOsmLdVDmbrMo1boLEFMXzJ
	JuHnNHKZgfR1SRr4rAA3A6w4rhFpuraOvC9oejMACjT61g41TPMQIvw9BvDTKUGxNRljtwV1ir2
	nJapC+RWIIjf7msuhnmuKJ33glLB0IyTJ8i+23g3bwt+JQPaLSbqdCDsn9q5mlw+Ir+zPIAYCbB
	RsB085qm9i81LGAgCUf3lPKKYGx4IIrQw1RudKazjitBf6PUYzFcjkvTaAqbKNwzuw49t11oTr7
	QLf7aAYvACdSKwtoOOxsH5Cl/R6HBYfjQ3r3bP+LzMAUuoCJPLKeMYJ++SeYucA==
X-Received: by 2002:a05:7300:6406:b0:30c:6a54:3fe6 with SMTP id 5a478bee46e88-30c84d60744mr3138305eec.8.1782456163674;
        Thu, 25 Jun 2026 23:42:43 -0700 (PDT)
X-Received: by 2002:a05:7300:6406:b0:30c:6a54:3fe6 with SMTP id 5a478bee46e88-30c84d60744mr3138280eec.8.1782456163075;
        Thu, 25 Jun 2026 23:42:43 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7cac87dcsm16628270eec.31.2026.06.25.23.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:42:42 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH 2/4] bluez5: Fix sending extra bytes with MGMT_OP_ADD_EXT_ADV_DATA
Date: Fri, 26 Jun 2026 12:12:31 +0530
Message-Id: <20260626064233.704350-3-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626064233.704350-1-wei.deng@oss.qualcomm.com>
References: <20260626064233.704350-1-wei.deng@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VuMTxe2n c=1 sm=1 tr=0 ts=6a3e1f64 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=Ea7PWexQ_xp5_is82UwA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: ne_dbREppJusoqbflfUJSXyycIhMinI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA1MCBTYWx0ZWRfX7zWR6SZrjj8x
 MMnjMS7d3r7fip+FOTdNaT3VQzX/IGio7eVwppJfrxF353Ds005gKAFub8NQFhC9qHnQqpAoB0s
 N6xzc3b9meEBOfY4iRItC4jyAlwx/dy2U7fiRMz6Ta14bqL3l6+ZVlB7ViQayXlpK70DOnAMLz1
 ONKgEmun2JUD58igUMcOyDAointqIKpfNNXjcLeTItB9fx7XC9LOA52kXCAdUkKm8rgJETMkL1E
 +JqouuRIEdVtCuRDjh+TdmKolif8igwMB1XSiSKCkRQkKJnaXYDH6OMbiej5LpqmH6Ou/aZtZI6
 eCT56ukO+JETlPG4/+xC5klJpGbsg0aPxm0cBB5Lt6460DV85RPbt+KOkJde7nF4cTfUWJDS0To
 JyMIUxhk0PqzAgAyDqK5tsCx8+vT80lYGM9MQeLtug6UoU5PnPmbNzMddLTTj4BwXdsWhbHEja+
 Pa/zO7Pfn5jTl5kmNnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA1MCBTYWx0ZWRfX/J9Aq3fLDuA2
 xmPpAP99zzpu7Dwd0lB8Zi2SdWmTh6aBj+X7VY+cCW9w1Vt0qwe0m17vOC1UgAle8BHji3wY0cc
 duiwnQGwP8kDFzNfuTrj3Z4dbNyaE2w=
X-Proofpoint-ORIG-GUID: ne_dbREppJusoqbflfUJSXyycIhMinI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239605

From: "xiuzhuo.shang@oss.qualcomm.com" <xiuzhuo.shang@oss.qualcomm.com>

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


