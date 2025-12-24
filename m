Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207B6E74913
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 05:00:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.115453.1766552422197765943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 21:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iM5C4Hpz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44536a1b88=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO1Uw601205716
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:00:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=04aB41G56rtLTrQzaInW
	91ZTk5p1Yu94c4PEkswbR98=; b=iM5C4HpzWWf66UPqIzics0HcJAzB5RR2myng
	ohYk4afaUMmUMFci3jFyx9jyhXAtoYlx1BJUKl5mzfMdetlTaN0uTICrINFxyojA
	oi7S4smDiZVt2S7pYj/oFRpntJJJmuG8qN9gw3K+HEA/i89gQi+YJAEnPjZG2PuD
	bjznWsVf6M3lc+LqGb0oAeeWQpuDqLxwBaFjCyi37+PEoHyGdmkVz4LW2G/Znyt/
	cyCu2qUAXPg3IOk3pd6/5Y0kNRr4/MnsFD/gXdN7tCHGOo3FXQ/uQvlbmpbAY8Qm
	SBmUYw+c4ZhxoN1TaHSDPNQvmW8c7RXSJlw3P6Br7IDLRJv1xQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4upyu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 21:00:21 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 23 Dec 2025 21:00:21 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 23 Dec 2025 21:00:20 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] libsoup: fix CVE-2025-12105
Date: Wed, 24 Dec 2025 13:00:12 +0800
Message-ID: <20251224050012.694516-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: __9M56gqK3A2oU_UCvzPSKZmSWAIg5dM
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=694b7365 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=6MyZ0KW2AAAA:8 a=eXHZBV4ZpkldoAy6WkEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAzOCBTYWx0ZWRfX6GsFbh1OOo1j
 ngsT3/P1MbpJ6xZe32URQ72HPNfc4Fb0UyY1Jbz70q/kVmX/Wi1lCjQDg0hj5X7+cBuaD2jxgcW
 lV7BxZkElbrWnmD1LHou/deGTw4G1f31gs+TJulqYT70MDrDgouvjX3ALiPl5WVdaWxSveldQRA
 Et3+5U4iXIgZRhy9Ux932s8pElGjdVR2KduRYQc3Mtg7bJubLLnGQXllStws0NubUG2RjKzp3c3
 /X6pMT3Oyjj2KgCbpzZL0Up3u0Iq/UQSnGHSG/2clWoJJoKRL+EgatZOMKsS1y/sdG+IrvI2pv6
 y/ojTG/tdI1krFK/fwMDw7MWKGMV7aZNsleuGmnGPGiAFqEtK972CP5UMKJiJ/EYox1YFhvs11u
 cTArMqI0LYoLA12MjdGayAV4wLWbRvcUtjbvNjVL37UpW+ntVj8epir1xAgfxBZcunjbPyk0VrD
 TIOMfwdTZa6FWjLquLg==
X-Proofpoint-ORIG-GUID: __9M56gqK3A2oU_UCvzPSKZmSWAIg5dM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 05:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228522

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/481

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup-3.4.4/CVE-2025-12105.patch        | 34 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-12105.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-12105.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-12105.patch
new file mode 100644
index 0000000000..a460554d6f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-12105.patch
@@ -0,0 +1,34 @@
+From 4cbb31f5bf083442325692ff16559fed73f3a6cf Mon Sep 17 00:00:00 2001
+From: Eugene Mutavchi <Ievgen_Mutavchi@comcast.com>
+Date: Fri, 10 Oct 2025 16:24:27 +0000
+Subject: [PATCH] fix 'heap-use-after-free' caused by 'finishing' queue item
+ twice
+
+CVE: CVE-2025-12105
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9ba1243a24e442fa5ec44684617a4480027da960]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-session.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 9f00b05..649902f 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -2822,8 +2822,10 @@ run_until_read_done (SoupMessage          *msg,
+ 		if (soup_message_io_in_progress (msg))
+ 			soup_message_io_finished (msg);
+ 		item->paused = FALSE;
+-		item->state = SOUP_MESSAGE_FINISHING;
+-		soup_session_process_queue_item (item->session, item, FALSE);
++		if (item->state != SOUP_MESSAGE_FINISHED) {
++			item->state = SOUP_MESSAGE_FINISHING;
++			soup_session_process_queue_item (item->session, item, FALSE);
++		}
+ 	}
+ 	async_send_request_return_result (item, NULL, error);
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index f64d0d6745..c09b06fec2 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -45,6 +45,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4948.patch \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
+           file://CVE-2025-12105.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.34.1


