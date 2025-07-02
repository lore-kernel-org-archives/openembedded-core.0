Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F352DC83F05
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 15:46:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27310.1751471188242868163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 08:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927893d721=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5621RS61026746
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 15:46:27 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1cmdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 15:46:27 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 2 Jul 2025 08:46:25 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 2 Jul 2025 08:46:24 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  3/6] xwayland: fix CVE-2025-49177
Date: Wed, 2 Jul 2025 21:16:16 +0530
Message-ID: <20250702154619.3765505-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250702154619.3765505-1-archana.polampalli@windriver.com>
References: <20250702154619.3765505-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEzMCBTYWx0ZWRfXz9sTPnp9wooU YXH0LXczLcIxKiWs6Xm25ToBHNYkOBxI7o1Bgpl5uBaB9oYYpAohIBTbFLJw+l6WDrdT2IugY2j b3pwNkPnYwjDXuvglnuDuSspUCeFSqP62gRQ4flgR0UQjPXMFSVfeXtty1k+aTsAPGn9rxgNCY+
 39q6qfH9DE7RsfQdzdmPcaR04lRRVUqEgwwBLndrc6Hgbd2kirE0Vc8Khmz+CJKGv83dmSpwhVz qwruWoaMIymhxkNHDLXXBflrWWSOAPkPkYtGAWDt96ubcpf7XQ2AwRZJfoi+9F+FYyhsAmsp+GX ySft9sKRywmVnNhmZnQALPcmz1Utwgecy4+PpKaFcQ9akcg+u7+1M+71o4Ez80Lfc+DQKf+QwGa
 +19Ra7+uag+FqzbeBae0blCZ5a1Az9GFK66Xjg0tdFwp5c23P4531X0znt0mB2JCzds2zdUT
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=68655453 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=aR16PxjQAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=D31QgfloAAAA:8
 a=dEv3LceFkJjfwSMbmsYA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=zbFvvTOBjyH4ze5LlUjX:22 a=FdTzh2GWekK77mhwV6Dw:22 a=I6paTPn9_Px6ARgSWtWf:22
X-Proofpoint-GUID: tcL7NM_pyCw46xc4JxCoYe2mPWatdHeC
X-Proofpoint-ORIG-GUID: tcL7NM_pyCw46xc4JxCoYe2mPWatdHeC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 15:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219845

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the XFIXES extension. The XFixesSetClientDisconnectMode handler
does not validate the request length, allowing a client to read unintended memory
from previous requests

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xwayland/xwayland/CVE-2025-49177.patch    | 55 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch
new file mode 100644
index 0000000000..56ae1de800
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch
@@ -0,0 +1,55 @@
+From ab02fb96b1c701c3bb47617d965522c34befa6af Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Mon, 28 Apr 2025 10:05:36 +0200
+Subject: [PATCH] xfixes: Check request length for SetClientDisconnectMode
+
+The handler of XFixesSetClientDisconnectMode does not check the client
+request length.
+
+A client could send a shorter request and read data from a former
+request.
+
+Fix the issue by checking the request size matches.
+
+CVE-2025-49177
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Fixes: e167299f6 - xfixes: Add ClientDisconnectMode
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2024>
+
+CVE: CVE-2025-49177
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/ab02fb96b1c701c3bb47617d965522c34befa6af]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ xfixes/disconnect.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xfixes/disconnect.c b/xfixes/disconnect.c
+index 28aac45..d6da1f9 100644
+--- a/xfixes/disconnect.c
++++ b/xfixes/disconnect.c
+@@ -67,6 +67,7 @@ ProcXFixesSetClientDisconnectMode(ClientPtr client)
+     ClientDisconnectPtr pDisconnect = GetClientDisconnect(client);
+
+     REQUEST(xXFixesSetClientDisconnectModeReq);
++    REQUEST_SIZE_MATCH(xXFixesSetClientDisconnectModeReq);
+
+     pDisconnect->disconnect_mode = stuff->disconnect_mode;
+
+@@ -80,7 +81,7 @@ SProcXFixesSetClientDisconnectMode(ClientPtr client)
+
+     swaps(&stuff->length);
+
+-    REQUEST_AT_LEAST_SIZE(xXFixesSetClientDisconnectModeReq);
++    REQUEST_SIZE_MATCH(xXFixesSetClientDisconnectModeReq);
+
+     swapl(&stuff->disconnect_mode);
+
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 72396dcd40..5ed8ca0365 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49175.patch \
            file://CVE-2025-49176-0001.patch \
            file://CVE-2025-49176-0002.patch \
+           file://CVE-2025-49177.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.40.0


