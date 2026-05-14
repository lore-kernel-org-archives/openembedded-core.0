Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD491CD4F25
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 14:13:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9623.1778761551012750347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 05:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lrul6PAY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBecvg1718027
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yOM93y9wxkcPuPSc//RfS366JgnpldB3qTl
	xGtHVQsY=; b=lrul6PAYPhSY9weCHfankQhwcZ/+iO2xfXYoMAFK9b4v/MT5FoH
	YIZLocVDhjE6EXF0klZVAS9ceELLhsO21uXda9hFzpyjrgxB/T/5EO+ZvoOBFmUn
	erk/KixoSMxbRHpCUAl2Oe93dm3XwoeTa8Kx1vjstpUNqn5ch9BvQFJSe6WxZfQc
	da/gg5ifHeKkZ7xh2Pg5XG058CtGQ28oy6ayU6x/JA2ix0TCaWYHapREq5S+AhX3
	M5obMt9tgmf/EdZyDLCF0qI6lr0pYIVtZVzptsuEFG0REruBSZ/30ghlfAzBBF7j
	RC9CvAdJIfUIZyZYjqpgfFqGs6GRLsOEe1g==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hbu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:00:35 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64EC0Wdd019428;
	Thu, 14 May 2026 12:00:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e1x0jrt0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:00:32 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64EC0W4H019378
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 12:00:32 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 64EC0WGK019280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 May 2026 12:00:32 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id A7C7823783; Thu, 14 May 2026 20:00:31 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com
Subject: [PATCH] bluez5: add patches to fix 8.56 gatt issue
Date: Thu, 14 May 2026 20:00:28 +0800
Message-Id: <20260514120028.1765275-1-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: eB7ouHz_PEFZwF6OxoheDx5WDDzfKh-I
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05b963 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=-cnGRqGqsem3yIPggdYA:9
X-Proofpoint-GUID: eB7ouHz_PEFZwF6OxoheDx5WDDzfKh-I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDExOCBTYWx0ZWRfX97khbqlfEsrQ
 BUeNLjq/LOT8Mv8CHaRbDPAjAiemkDSKIx9Rjhwt2PSUetjOJwQh/vLtgEwHwgkufGN3otmWczT
 EkKjBOvQh6vuK1CdOuZXkN35bPJJKCTgCQyjhDq8OfUV5FQwJt2Ab4tAvOx2gDq4NyMbX3RC0xd
 GXr7MEav4sl7VZ8qCWglZBTnBrxUtQwtuPDDeF4dRT+f2bLnX633fbSwUxPeZBbEfgL8uo2aVui
 xywOMsbr/GMw3YFkgTjd4Eu7ClmxXgxYqxtzKHywZsNLaPSZxfzD0aRc5TuKs9UaLh29plS0ssk
 sc6d5CQepaPjU3VWChQ74vinBvZPIo1U3VJt4mo7BwRmaYlhfp0e766Rvr/78rTAdxAoJxD09eT
 puUoDCX3UVACb/Qn/K5I040UC76FBzCC6l9pEdPw7DR5u4B+UKAMQl1tsI1TrHCdOBpzj4xOAM/
 7PxP/ieVHKM4R0HAeNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140118
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 14:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237039

btd_gatt_client_service_removed() can be called reentrantly via
bt_gatt_client_unref() after the services queue has already been freed,
resulting in a use-after-free.

Reset client->ready to false before destroying the services queue to
prevent reentrant calls from dereferencing freed memory.

Upstream-Status: Backport [bluez/bluez@d01616f]
Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...use-after-free-caused-by-reentrant-c.patch | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 843e36b..c792cc9 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -70,6 +70,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch \
            file://0001-tools-Work-around-broken-stdin-handling-in-home-made.patch \
+           file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch
new file mode 100644
index 0000000..0fcbc08
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch
@@ -0,0 +1,59 @@
+From 45c167591d04e2dfecf5b4642168e54c23abbd40 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Sun, 26 Apr 2026 21:25:15 +0800
+Subject: [PATCH 2/2] gatt-client: Fix use-after-free caused by reentrant
+ client teardown
+
+btd_gatt_client_service_removed() can be called reentrantly via
+bt_gatt_client_unref() after the services queue has already been freed,
+resulting in a use-after-free.
+
+Reset client->ready to false before destroying the services queue to
+prevent reentrant calls from dereferencing freed memory.
+
+This was found with the following backtrace:
+
+    #0  match_service_handle ()
+    #1  queue_remove_if ()
+    #2  queue_remove_all ()
+    #3  btd_gatt_client_service_removed ()
+    #4  gatt_service_removed ()
+    #5  handle_notify ()
+    #6  queue_foreach ()
+    #7  notify_service_changed ()
+    #8  gatt_db_service_destroy ()
+    #9  queue_remove_all ()
+    #10 gatt_db_clear_range ()
+    #11 service_changed_failure ()
+    #12 discovery_op_unref ()
+    #13 bt_gatt_request_unref ()
+    #14 bt_gatt_client_cancel_all ()
+    #15 bt_gatt_client_free ()
+    #16 bt_gatt_client_unref ()
+    #17 bt_gatt_client_free ()
+    #18 bt_gatt_client_unref ()
+    #19 btd_gatt_client_destroy ()
+    #20 device_free ()
+
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Upstream-Status: Backport [commit d01616f0c276a441dad8afe4e8f7bb261b26ba0a]
+---
+ src/gatt-client.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/gatt-client.c b/src/gatt-client.c
+index 374e67c..3baf95c 100644
+--- a/src/gatt-client.c
++++ b/src/gatt-client.c
+@@ -2261,6 +2261,8 @@ void btd_gatt_client_destroy(struct btd_gatt_client *client)
+ 	if (!client)
+ 		return;
+ 
++	client->ready = false;
++
+ 	queue_destroy(client->services, unregister_service);
+ 	queue_destroy(client->all_notify_clients, NULL);
+ 	queue_destroy(client->ios, NULL);
+-- 
+2.34.1
+
-- 
2.34.1


