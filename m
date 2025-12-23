Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09455E6F062
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 07:20:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96544.1766474430296683052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 23:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZpwU5zBa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4452e63bdb=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN3xjqn1689770
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=m6YhjLJfV1D95C0TJfdb
	qaBlV3JQvtSbkrsOBh5Lh6Y=; b=ZpwU5zBar+HM4PKRwo/Avg52NpPzpvgoi51F
	8Y6oAXYWTqhUnXYHAthzrfRyArEHFl2TcOj8jqXRP681s+Mt8hoYDfZVvepG9UC/
	C6n2+MJNkyQEpRXFSrJZzS6fudd1ra6NLhfY1ShK7eBMow6S0J7Ce+sehLyBQTS7
	QsCXOInihDWrEdQrGmFa2wZlVezUDEvwP9xsUxU/UNmsWKoRmRq14BZxPW0+KdrU
	tq651SYfJiS55SCn6e1Jzx3opWrCRJHZ97L6SfYwtYF+tcjYiv4slXg8CXsMQxej
	0zAG4VIo90MCO0VsOFNot1yONmCZRfLM2++WJwpUc4/r6UNOzA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vjtwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:20:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 22 Dec 2025 23:20:28 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 22 Dec 2025 23:20:27 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] libsoup: fix CVE-2025-12105
Date: Tue, 23 Dec 2025 15:20:20 +0800
Message-ID: <20251223072020.270834-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: FA6lXVX63atx-R0rgMh2bOnRpKEHYi5-
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=694a42bd cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=6MyZ0KW2AAAA:8 a=eXHZBV4ZpkldoAy6WkEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FA6lXVX63atx-R0rgMh2bOnRpKEHYi5-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA2MCBTYWx0ZWRfX3DsXOBcjQBj/
 nN95hhLrZQ6yxQMBDdZjjVy8aPnXgnxfhI/gbES6lMES1Zo8LvEGTGtUrttdxe3k6CesaLGT5bs
 GNx1bsYHWNq/e+/GXQWeXjq3bo+aCM5qnqV7e37k1Dr64Vq6xwb05qyx3z6U0qyTn+ZaL4n9kLR
 UNaIKqdRef0f9xmHADnwW3IB9OWPMaCHBWXPtFZVJJAm/nrWt8IccPUVFjVXBrmWxwx8Z/iU6iM
 5/yPuHJjIKio6RHwWw2OC4IpEgzuG0NOlJalOJrlN0T14Tqqjsj0eWwE+l44A6pinlYSmwZIEk0
 Dt2DAwNj6Qc7v9hfSYLCAljXqfT/Jm/HSmx93dg1BS9zfe5Ooh01uhVeP8ovzOHXlYwz6PUkuRX
 BQPxv/VpeoJWfXOonJZ8yrqYyFo3qis7MmXE8MXzRvOsJEWbAK7N4SrEOForcRZ48DIDgEEy2S0
 0ChnxCyRl4rU9/AgG/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228455

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/481

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup/CVE-2025-12105.patch      | 34 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-12105.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-12105.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-12105.patch
new file mode 100644
index 0000000000..99b2937922
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-12105.patch
@@ -0,0 +1,34 @@
+From 465410f833e4288ad053b4e18d5fa6c3be3148e1 Mon Sep 17 00:00:00 2001
+From: Eugene Mutavchi <Ievgen_Mutavchi@comcast.com>
+Date: Fri, 10 Oct 2025 16:24:27 +0000
+Subject: [PATCH] fix 'heap-use-after-free' caused by 'finishing' queue item
+ twice
+
+CVE: CVE-2025-12105
+Upsteam-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9ba1243a24e442fa5ec44684617a4480027da960]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-session.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 5f2929f..b9f3e42 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -3093,8 +3093,10 @@ run_until_read_done (SoupMessage          *msg,
+ 		if (soup_message_io_in_progress (msg))
+ 			soup_message_io_finished (msg);
+ 		item->paused = FALSE;
+-		item->state = SOUP_MESSAGE_FINISHING;
+-		soup_session_process_queue_item (item->session, item, NULL, FALSE);
++		if (item->state != SOUP_MESSAGE_FINISHED) {
++			item->state = SOUP_MESSAGE_FINISHING;
++			soup_session_process_queue_item (item->session, item, NULL, FALSE);
++		}
+ 	}
+ 	async_send_request_return_result (item, NULL, error);
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index af8554aa78..0f82736727 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -45,6 +45,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2025-12105.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.34.1


