Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54586CD6E74
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 07:38:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2984.1780644169461418856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 00:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Lec1C1c0;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=YMnli/lg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: xiuzhuo.shang@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65518GDe3603015
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Jun 2026 06:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KfOKd52zDtFkTBvHfSCDsTqa3Bsh1erDJs6
	DyRZR+lM=; b=Lec1C1c0wx2BD6PH0wIq3ZUpQ/tOAsmPY4IYKfsgD7KsZhgsyun
	tk4cAlPJWhhx0cYFsLWjqUYbj9Wrm8OtIfNkqCNekIRt7TeBKaxL7Lh2B1VD0UEf
	1zgvD/QUXAsiElsjXpZ+h0/m400fOgWEE31D9lI+kqsCMQ4zNE6VobyY6E5g4tX/
	pYSro4idyyaXf4EoQI3a5WfzsBHIFuSmrd42+23GMHPq5QJDkOWhBTuF/qGYTZ1j
	TgaVhMIVB3dHm8VRcwgqt1wRkPxyFuulmGvKHGmz5fqIogASys69WXVOdCd59ym7
	Uc+UEJoTGEmW18hCi/W2PAB3zJ4heiHl24A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekmhf90hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 06:33:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2befec3fd8fso11299205ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 23:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780641233; x=1781246033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfOKd52zDtFkTBvHfSCDsTqa3Bsh1erDJs6DyRZR+lM=;
        b=YMnli/lgWwnOlKU72eBAgt+21rYM36R5jGfYSeK46UuhqvkcUaNt4fzLS/cIC4MMqD
         HQtR0JrgXIPMPXHBTeLgZuljCyLPmfx/8TduHx9azVb3qV1ybQr1criL9UvjRejzve7l
         t+0CIQN5l6Tu69qkjPpB+IOAnxeuBk3OPt1toD1uglyX+FxVB7YgPg+4j/UR15RyTkMi
         ejuw/+fgEzt4HZAcxOl0RRsxBjiO6OdPfsqQdwIohw4UwWXKfs355jN55lahesGrMpxP
         ImprJjGdrqWCP71kGmS/1IStBlWdxgAKQp55fAJujeWnAPmXd1YP9QGU24U1dzgOLYS8
         miig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780641233; x=1781246033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfOKd52zDtFkTBvHfSCDsTqa3Bsh1erDJs6DyRZR+lM=;
        b=YTIhH5RBFoyHOvMEmUgloZNKUYNJtwGTq8XiCzxVMYR5CyQdB0yxcYj+qtfl+D8/rg
         EJ3GMteDKEmwn4UiJpARI26AFz8l2gbrP3XlTYy1+ui7ntdiILbv0vW+XJnRXzuH+Ufu
         1LYJDg+EsQUX5l80iVsCbPXJPjZoaqv7+IPTkZuaX6nTwMyilcE9+GiZPLIql1FD00vx
         7e+4hQv50t8ZnVTt6qRBJT+QR/KUeuDxdpAtHWs46lZHF5hvTKHPjkqJYfymSv9T3iuM
         o0lJ/JfaeHPJgwABPbP3+WwD2GprLNepXmWmvVT4kauUY/fbUb6/bdNRaWvT5KhRPHNh
         G0sw==
X-Gm-Message-State: AOJu0YyzIDoOOKamDzOK3S/FOgl8mx4D3bCmSMkZwYhNMOwWoo55KcmQ
	D12Oae5zt4mjoev2jFZBucBbEVHDldq8lcZb+pqu2x1Ec1Id9V6zlWHmA3qxdqe9X/A1q5jy9xZ
	Hoti7VSPP7epb+gG/10UeIvgU6AaZYjXKIqRzrQdcVo+3C4kBRhf9dvKgkwWJ6KlNzeJt7EaPyw
	JrxQicSENloab841s=
X-Gm-Gg: Acq92OEBqp3sT5ZlB/SLEe385/VFSjdDFv7wat7DpnoUXRiSCEy+DLhZYOTPF3mRnVP
	SHGywUeogoC42M2+UCIfzJKtcuXZeYOUs7lglUA8xYSDXgGkAZ9t+da3rBV9IWtwK5oIOsgA1kK
	pIKAaChXuVMHbv1MvaKwYROw9LTj5KEnNTDtUmAaNlsXrUNlW8pPi2O/MCvBOJiMRMHBcmghxQ0
	xOKPFTBSvDD0YeZJNKt28k539fr1VR2QtiKwzkJF/fLd2R4nuGOKqafyaw3wXbg6G6ACZ109oZa
	5vew3Uw8sfz8x0/zlP0CymhW7IMkCOxwTdeEU4ORIDo3NxgkkiXS+VNemNu92ZOoAdMz/8QkA0r
	3fKbItAidUBgg74w2nagtJp6x/Bv3DJEiPGUEmu55wsH9y5Mq63x9ojA8Glp45xlR
X-Received: by 2002:a17:903:2342:b0:2bf:1486:e6ca with SMTP id d9443c01a7336-2c1e7d41eb6mr21257145ad.12.1780641232907;
        Thu, 04 Jun 2026 23:33:52 -0700 (PDT)
X-Received: by 2002:a17:903:2342:b0:2bf:1486:e6ca with SMTP id d9443c01a7336-2c1e7d41eb6mr21256905ad.12.1780641232476;
        Thu, 04 Jun 2026 23:33:52 -0700 (PDT)
Received: from bt-iot-sh03-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm80126855ad.80.2026.06.04.23.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:33:52 -0700 (PDT)
From: "Xiuzhuo Shang" <xiuzhuo.shang@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH v1] bluez5: Fix sending extra bytes with MGMT_OP_ADD_EXT_ADV_DATA
Date: Fri,  5 Jun 2026 14:33:47 +0800
Message-ID: <20260605063347.3599631-1-xiuzhuo.shang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA2MSBTYWx0ZWRfX7ewNx0PhGtcq
 ASHk37WelKNUEI6uNwBiErl0qvtfPMMDShaegNb/mUcOxdyXSNlqIRZzj4+gwuOS4zIktFcEGMy
 1a14lLBaMjA/Qi3RJofAm77tl1Gp2IkTB4MhtiDXZ6dgzxUup1bvYqIJzEB6jvpxGiCiN9EojVt
 u02AKZjYQl2S5Y5ipjfuoVXVmvpBOQrDM7OZXvyrhzT5rmglT51j9DL5zTAOXsgbqoRxoTHzGHm
 60gIJ4uZjo/bpBlQ7/v/RuZkfvIIVJ+/Up19QxEZPXbkI8tUovm39i+63Y+bhu8DVWaO9x1/SEs
 PiTOgoh/6B3hhDcUMApJAGHG+36UDAiSgYfghjb5/wfC6ouN7QHY6U+6nghVcnr0P467YrsuKTB
 h3uwNF0XWKPAbpm31goyvyMJjMiYboHqoAqeG8PtV45DFG4yEU6UnmRvvKDLuL5HjNO3MARbIF6
 IdDYaNJKhi682K0/OvQ==
X-Proofpoint-ORIG-GUID: NHEsZDIY20tf0rvzF8lhJDAIQNFSdu2p
X-Authority-Analysis: v=2.4 cv=dfmwG3Xe c=1 sm=1 tr=0 ts=6a226dd1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=Ea7PWexQ_xp5_is82UwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: NHEsZDIY20tf0rvzF8lhJDAIQNFSdu2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050061
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 07:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238148

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


