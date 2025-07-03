Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58965C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 10:24:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19210.1751538246490204277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 03:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9279857999=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563AFbP0024376
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jul 2025 03:24:06 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jbp4db5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 03:24:05 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 3 Jul 2025 03:24:09 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 3 Jul 2025 03:24:07 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  4/6] xwayland: fix CVE-2025-49178
Date: Thu, 3 Jul 2025 15:53:52 +0530
Message-ID: <20250703102354.1810188-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250703102354.1810188-1-archana.polampalli@windriver.com>
References: <20250703102354.1810188-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: NtfuhvyDGtKRBarGyzxTxF1TT-_o1BUt
X-Proofpoint-ORIG-GUID: NtfuhvyDGtKRBarGyzxTxF1TT-_o1BUt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA4NSBTYWx0ZWRfX/7S/gCCc154s g6ktUpECH//IXAVj/L2D4fmqIuSfPmxBp+tjJhQ2mGnYmTjCjHe65KGifyHsEfBn9Df5b2mLmK9 vzkbuL2Juj/ozkS8G4ZuFM8/pmBgs0LhI0RqO46shMNiV/3LJA4fZ03hTbJgGUe8eoqGdOXtkjk
 fXpRVfc149XQCFgAgHPC0/HgXmXopEcdQWOGHtF/gvxM4jA+8zdD9HOsZLY31Z1lo5pZnvWoJ8m alWGXaNL4kKMbvFmzv4E0fFhmMRcIFOe28Ln/UAsA/gSQXHSDrdC7vQzC6kgKy02dD91O5hLf14 HTeHLdIO/XP4KSdS0PUeJyC3RT302LuDZT2jbgy9CuhdRpsJPoEAxPqVrv8sqbcS6IDACF9PrUg
 JSdMPcodInCjgSCNSbN9nECTh1QNjjA4g/x1S8Vx95pEkeirUI+oaSfCWgo/zfEkenT3td3R
X-Authority-Analysis: v=2.4 cv=JMg7s9Kb c=1 sm=1 tr=0 ts=68665a45 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=aR16PxjQAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=D31QgfloAAAA:8
 a=3wiCy6-QTMpVeIMz6ZkA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=zbFvvTOBjyH4ze5LlUjX:22 a=FdTzh2GWekK77mhwV6Dw:22 a=I6paTPn9_Px6ARgSWtWf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 10:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219871

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the X server's request handling. Non-zero 'bytes to ignore'
in a client's request can cause the server to skip processing another client's
request, potentially leading to a denial of service.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xwayland/xwayland/CVE-2025-49178.patch    | 50 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch
new file mode 100644
index 0000000000..5ef2fea1c9
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch
@@ -0,0 +1,50 @@
+From d55c54cecb5e83eaa2d56bed5cc4461f9ba318c2 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 10:46:03 +0200
+Subject: [PATCH] os: Account for bytes to ignore when sharing input buffer
+
+When reading requests from the clients, the input buffer might be shared
+and used between different clients.
+
+If a given client sends a full request with non-zero bytes to ignore,
+the bytes to ignore may still be non-zero even though the request is
+full, in which case the buffer could be shared with another client who's
+request will not be processed because of those bytes to ignore, leading
+to a possible hang of the other client request.
+
+To avoid the issue, make sure we have zero bytes to ignore left in the
+input request when sharing the input buffer with another client.
+
+CVE-2025-49178
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+CVE: CVE-2025-49178
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/d55c54cecb5e83eaa2d56bed5cc4461f9ba318c2]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ os/io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/os/io.c b/os/io.c
+index 67465f9..f92a40e 100644
+--- a/os/io.c
++++ b/os/io.c
+@@ -444,7 +444,7 @@ ReadRequestFromClient(ClientPtr client)
+      */
+
+     gotnow -= needed;
+-    if (!gotnow)
++    if (!gotnow && !oci->ignoreBytes)
+         AvailableInput = oc;
+     if (move_header) {
+         if (client->req_len < bytes_to_int32(sizeof(xBigReq) - sizeof(xReq))) {
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index fefc0d4e3a..caca8ab0f6 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -47,6 +47,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49176-0001.patch \
            file://CVE-2025-49176-0002.patch \
            file://CVE-2025-49177.patch \
+           file://CVE-2025-49178.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.40.0


