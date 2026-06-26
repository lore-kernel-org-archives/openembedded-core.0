Return-Path: <wei.deng@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E798CCDE012
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 09:39:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31535.1782466768202539081
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 02:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eCOQmS9K;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=WSqQ7fQb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q8bApN585803
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UlYBe/G+zR4DvDaW3ZMwqXBjn8UWVlInJe8
	aYfKt7vo=; b=eCOQmS9Kh/kjP+j33huB6GeSrWvYFAmqSCWZDY7eDXQvNfLHJSd
	tRDd9PiVAqAZamzEzRvUb9biXPTCgoMEJUg+cV2gH1AKoz4GU7PS9pvRx+caR/pu
	dCabNJkESBLDLqDgWVKArmPy5SnWsMED9gISE1T/yHLOtWDbfSrF4oAMscRU7UBm
	2b93fmdHWH4pb2Zej6CpdU4S94o5gpmjfwPq/m0CPeXimX9Xe8riI5OcAmo778L1
	se/tQt+77eTMqg/4TuhcTSRXBOkt2S1I3r0VJklwb/fjNuXCnplne24fVTARpP3P
	52qsiM17t8f/OefzvSd3/GBqggxV4VzL8zg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1p2tr7bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:39:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ca88a45dbso2913eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 02:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782466765; x=1783071565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UlYBe/G+zR4DvDaW3ZMwqXBjn8UWVlInJe8aYfKt7vo=;
        b=WSqQ7fQbUiSbf3m425sOCZUtI5nDD8TN2Su9DqQ2rZrUnp7kH/vDLkk4X5LXKO7fdy
         nWPgHaXMvU90yAwMTnbvCvj4I5IlCDLM0L1oFqBTAR2oYuloX7V9b9UAlHdWxNC2RMCb
         RKyqpLZe9oV1MivXe2VrJE1eTVFw+WwhCAteWNL5kdykajn4h2C66EW0PAEEop3BJU6/
         Yn5VDWkBWXx7YCPludWcvZW9TBwVoJvVAIArqW7r5zhQmKCb/e+SpRRIZftQ7Rq3JvBv
         mIIElvKrSePAprSTxcgacW/Mb31fDoNh6Nrm1ytGnlmOBpfXLBcSxOscUwV+LjRl8eoq
         jZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466765; x=1783071565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlYBe/G+zR4DvDaW3ZMwqXBjn8UWVlInJe8aYfKt7vo=;
        b=qVB4eHM43OqLubrRsTT1iWAUsqemdCodwvrCm6zG86Wh0ZskCLWcsd3+SHaKFuCb46
         yMNiwl8STY9ys2R6OMZodUphXznfQKmAlkC5FGFhGTxyLnn3MleseyMLSiNqSwsrOzc4
         K4+mENi3LJOl6hzUNSPUNMqtuGP9kvkzP+CiKQEwoNk3wXr9kgkQ2vEmOUTboSX15D/D
         n6aw6IJ7BhzdEd+HFQ/bB1uLDav3yaQHhDkVOyUQ8yKopUdm2E5g4LrySjQ84LAgcj2x
         uz+c3VhcMXzAOaK7llxB6/FrkhTw9uAgXsPVzx+leqSmvj77iadb+1+/iUj0OR8uBbNX
         6OHQ==
X-Gm-Message-State: AOJu0YxmopZhnWY0T99S5/QMjHOFn88XUw3GBqzN+7POTx3p+04W+q3D
	t2qoKmpeVnwyF0MJJhbziVPrUd4lsI49m04h1RkvRgQriSZPyHC26gUCXZiMnIq9E6BBRXCgjbf
	q20h/RW8Lk7RoOejBRB2ixY8JE2QxxTOQifZKcOls3hGqHxaQJS0PplkEtB8q3vbFae1tkkyqO5
	UNgpUejyGgFrYo5L32sg==
X-Gm-Gg: AfdE7cmGD8oNUE8lv3KMB+ijnvFn7XG3Wq/R9H+CC70YaLLfTgaTyZKPlK631rZ2kq4
	BritjzetF9qGNaFSzeIWBooecFhpRMoMJViUs1yNsH9wMbkGSCVi+fNTQNNW6Cj5PQJGkL2lKoW
	G2j2SwA0pcHAuxwpeeN5+hORzD8VRDA47GrjsvwrkwsvTnt+0igF+89I+kfMSntr7Hm1LyWJzjV
	r+MSMF3rWlYAHRTMmTdL0i8cLCF4sqtTZ057KIIGbNPcR6MTDyyINNQ4w/hpfqpcpPWCrwqBc4W
	NCW75sXojfm+SfSAuBLa2u58VuFzP77js3RkiAW0p1as8CT82Z+waEJfgeFUlgio2UUSHd1u61l
	tZ5aJ8w7uHsZpV+VfF+OEhDtIVHMyONnj1xyrhcsbl9qgXDG6nID/Jw2kzWjLOw==
X-Received: by 2002:a05:7300:2211:b0:30b:f3b8:3e7d with SMTP id 5a478bee46e88-30c84c9c952mr2603363eec.4.1782466765339;
        Fri, 26 Jun 2026 02:39:25 -0700 (PDT)
X-Received: by 2002:a05:7300:2211:b0:30b:f3b8:3e7d with SMTP id 5a478bee46e88-30c84c9c952mr2603351eec.4.1782466764761;
        Fri, 26 Jun 2026 02:39:24 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c9e9214sm16908725eec.20.2026.06.26.02.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:39:24 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        shuai.zhang@oss.qualcomm.com
Subject: [wrynose][PATCH 1/4] bluez5: fix set volume failure
Date: Fri, 26 Jun 2026 15:09:17 +0530
Message-Id: <20260626093920.1079859-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3NyBTYWx0ZWRfX2O929xWWZrrb
 90Tvb+Rf4oIIw7a9780XKyyYDDUS5P95U70WK/evbbmAY0WvGxEj0HWDp38msxEuo02YuxYlmue
 i4GvHKmAlr4Q+VPBw9c+Ipk7hE4uvM8=
X-Proofpoint-GUID: XFvaizxrc84I_USY3ScHD5iYuk7TKV6K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3NyBTYWx0ZWRfX1uZt8yBCEe6p
 30wLXqIBi3Q87EQvtSfsAHQ+cTfR5vCmxsSfoqhLuwdLDbpxyII2+6cSxD2qiCVLB7Yvpm9gTWr
 mFQdMk7tuCOuQDYrbDkzlfu8ZVOUpvhEZsAAW5Yc8iMDZOFCTrdhaOQPsdJMux28pvhqKKbiq1l
 G736gKZBNPolAPEowm1s26MtCiAjxXPHU/RNFIEEgg3z7dYnecl05z7Lqk8D90K3LIfkJwx0zFt
 oBmFphUL2GlyzhvyoZrurpaEaNMANy8U1SXsSWvrB/GmQVmDO1Uy99px0NrgRK1c6oo7ZtYVyb4
 YpTfrQhmM7SinFIT7vmVK/V5RH00aJfOztxiaXKMs7oZUg77DxtqLkpoDkWZG5sjnziWfhDSAlU
 7FEbeIy5FBF5LijcclWvntuuq8Wb9KTqXdmVQp/Vq7ubb/HUOHEnm20GodSJGTRHU7sqAnDhcaY
 m8R7TZe6NTOKuiOdOJA==
X-Proofpoint-ORIG-GUID: XFvaizxrc84I_USY3ScHD5iYuk7TKV6K
X-Authority-Analysis: v=2.4 cv=IM8yzAvG c=1 sm=1 tr=0 ts=6a3e48ce cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=e8bRT_GSZmf0kOtY9XgA:9
 a=PxkB5W3o20Ba91AHUih5:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239619

From: Jinwang Li <jinwang.li@oss.qualcomm.com>

Backport upstream fix for AVRCP volume initialization failure when
AVRCP connects before AVDTP.

Upstream-Status: Backport [bluez/bluez@121e5ca]
Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...t-volume-failure-with-invalid-device.patch | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index c792cc9c66c..c09a759244e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -71,6 +71,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch \
            file://0001-tools-Work-around-broken-stdin-handling-in-home-made.patch \
            file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
+           file://0001-transport-Fix-set-volume-failure-with-invalid-device.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch
new file mode 100644
index 00000000000..b5846dec47f
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch
@@ -0,0 +1,46 @@
+From 8a80f70c23ca5f93b1db7e3956cc7ee28c1fa767 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Mon, 9 Mar 2026 19:18:26 +0800
+Subject: [PATCH] transport: Fix set volume failure with invalid device volume
+
+When AVRCP is connected before AVDTP, an invalid device volume causes
+the target to reject registration for the EVENT_VOLUME_CHANGED
+notification, which breaks subsequent volume updates.
+
+Fix this by initializing the volume to the maximum value in the AVRCP
+target init path when it is invalid, allowing the controller to
+subscribe to AVRCP_EVENT_VOLUME_CHANGED.
+
+Fixes: fa7828bddd21 ("transport: Fix not being able to initialize volume properly")
+Suggested-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/121e5ca79be559c5374f8a54c6fb6e233e383379]
+---
+ profiles/audio/avrcp.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
+index 724b46c59..326dfdab7 100644
+--- a/profiles/audio/avrcp.c
++++ b/profiles/audio/avrcp.c
+@@ -4296,9 +4296,16 @@ static void target_init(struct avrcp *session)
+ 	if (target->version < 0x0104)
+ 		return;
+ 
+-	if (avrcp_volume_supported(target))
++	if (avrcp_volume_supported(target)) {
+ 		session->supported_events |=
+ 				(1 << AVRCP_EVENT_VOLUME_CHANGED);
++		/* Check if transport volume hasn't been initialized then set it
++		 * to max so it works properly if the controller attempts to
++		 * subscribe to AVRCP_EVENT_VOLUME_CHANGED.
++		 */
++		if (media_transport_get_a2dp_volume(session->dev) < 0)
++			media_transport_set_a2dp_volume(session->dev, 127);
++	}
+ 
+ 	session->supported_events |=
+ 				(1 << AVRCP_EVENT_ADDRESSED_PLAYER_CHANGED) |
+-- 
+2.34.1
+
-- 
2.34.1


