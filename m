Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C64CF31A2
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 11:05:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4108.1763550309841361567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 03:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bvGe7vJ3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3418d146ba=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7rvGk1456056
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 03:05:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=8oxb3H01rqET6i9GCL0hoWAFW9lpAwTD5t9iUP+YqRg=; b=bvGe7vJ3LuZg
	W2kmqx8xGFN3KMLad+F+eaxSp/KgIDU7CFmA4O/SBTCdXyNGb6EtgXnpRRcl7s9z
	0IjQ0vORZR471VprCm8g5bOvkMdMlprqsdHG+2tgyKQB00/H4js4D4f8RAI+a5ER
	7Oy4C3GgH3sazoN/5Elq6CaCbagH3BJlvv+ywg+mXkww/8Af8fo+0UaPUM8/WXU7
	Pd0R0gywTQ614lhTusqXoT1STczN0yH2TsiUxv2cFvnUK50lP7GZcSQgYjThGhSm
	Cs0Hrmqm4Ga+vVvMhRhuaBsSPfF/Ws6HwRR3SFSmLl2Zc0ftRBrI0ayfW2gCciEM
	d6Qf6N1SoQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjcq99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 03:05:09 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 19 Nov 2025 03:05:07 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 3/5] xwayland: fix CVE-2025-62229
Date: Wed, 19 Nov 2025 16:34:39 +0530
Message-ID: <20251119110441.817793-3-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251119110441.817793-1-yogita.urade@windriver.com>
References: <20251119110441.817793-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691da465 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=aR16PxjQAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=1CSxPyHHGpsGW3RuwdMA:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=zbFvvTOBjyH4ze5LlUjX:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pWTxoiwcJBaRX-cCuCFIpCfQWBOQMIdY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA4NyBTYWx0ZWRfX7XmjokzMLrBh
 ilvq2bFm6Z+6Ym6hxKxsfxiVJhZvegf8ND1i6+RVDWlZU7d6hbRGcF3PU5yhpb8ENYpsJ3Votzp
 pq7j10fOXNHmIUXispDRMfri+emG09Qu3a2KFS86vIj4s8TQ+FBSta1x7lhF9d4UpwwPuA8xwOZ
 hDWWApalHua9pD9JgQTv3jPFSIyXmdOrK0WduRHIEihe5UFJH78FiLBDhRTRfWIiKrRF2d7OuUu
 8606OjQUDtxXXeNfcidtGqHqRMd4eh7Md7p36DHVJj5GZsVFR2ihrLq4Tv5N3RD+52FiCKvfgxI
 0cpSm65LTaz2g+ZB7mgOUZbcPU7RLpfSPVt4wBfoNUEPxpRbCZqPSiQ+3plxSoSpo9/w8hj7egi
 rvo2vemwoRzev5jg9aPWw+c9DgQu/g==
X-Proofpoint-ORIG-GUID: pWTxoiwcJBaRX-cCuCFIpCfQWBOQMIdY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226548

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in the X.Org X server and Xwayland when processing
X11 Present extension notifications. Improper error handling during
notification creation can leave dangling pointers that lead to a
use-after-free condition. This can cause memory corruption or a crash,
potentially allowing an attacker to execute arbitrary code or cause a
denial of service.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-62229

Upstream patch:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/5a4286b13f631b66c20f5bc8db7b68211dcbd1d0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../xwayland/xwayland/CVE-2025-62229.patch    | 89 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch
new file mode 100644
index 0000000000..f27bd00434
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62229.patch
@@ -0,0 +1,89 @@
+From 5a4286b13f631b66c20f5bc8db7b68211dcbd1d0 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 2 Jul 2025 09:46:22 +0200
+Subject: [PATCH] present: Fix use-after-free in present_create_notifies()
+
+Using the Present extension, if an error occurs while processing and
+adding the notifications after presenting a pixmap, the function
+present_create_notifies() will clean up and remove the notifications
+it added.
+
+However, there are two different code paths that can lead to an error
+creating the notify, one being before the notify is being added to the
+list, and another one after the notify is added.
+
+When the error occurs before it's been added, it removes the elements up
+to the last added element, instead of the actual number of elements
+which were added.
+
+As a result, in case of error, as with an invalid window for example, it
+leaves a dangling pointer to the last element, leading to a use after
+free case later:
+
+ |  Invalid write of size 8
+ |     at 0x5361D5: present_clear_window_notifies (present_notify.c:42)
+ |     by 0x534A56: present_destroy_window (present_screen.c:107)
+ |     by 0x41E441: xwl_destroy_window (xwayland-window.c:1959)
+ |     by 0x4F9EC9: compDestroyWindow (compwindow.c:622)
+ |     by 0x51EAC4: damageDestroyWindow (damage.c:1592)
+ |     by 0x4FDC29: DbeDestroyWindow (dbe.c:1291)
+ |     by 0x4EAC55: FreeWindowResources (window.c:1023)
+ |     by 0x4EAF59: DeleteWindow (window.c:1091)
+ |     by 0x4DE59A: doFreeResource (resource.c:890)
+ |     by 0x4DEFB2: FreeClientResources (resource.c:1156)
+ |     by 0x4A9AFB: CloseDownClient (dispatch.c:3567)
+ |     by 0x5DCC78: ClientReady (connection.c:603)
+ |   Address 0x16126200 is 16 bytes inside a block of size 2,048 free'd
+ |     at 0x4841E43: free (vg_replace_malloc.c:989)
+ |     by 0x5363DD: present_destroy_notifies (present_notify.c:111)
+ |     by 0x53638D: present_create_notifies (present_notify.c:100)
+ |     by 0x5368E9: proc_present_pixmap_common (present_request.c:164)
+ |     by 0x536A7D: proc_present_pixmap (present_request.c:189)
+ |     by 0x536FA9: proc_present_dispatch (present_request.c:337)
+ |     by 0x4A1E4E: Dispatch (dispatch.c:561)
+ |     by 0x4B00F1: dix_main (main.c:284)
+ |     by 0x42879D: main (stubmain.c:34)
+ |   Block was alloc'd at
+ |     at 0x48463F3: calloc (vg_replace_malloc.c:1675)
+ |     by 0x5362A1: present_create_notifies (present_notify.c:81)
+ |     by 0x5368E9: proc_present_pixmap_common (present_request.c:164)
+ |     by 0x536A7D: proc_present_pixmap (present_request.c:189)
+ |     by 0x536FA9: proc_present_dispatch (present_request.c:337)
+ |     by 0x4A1E4E: Dispatch (dispatch.c:561)
+ |     by 0x4B00F1: dix_main (main.c:284)
+ |     by 0x42879D: main (stubmain.c:34)
+
+To fix the issue, count and remove the actual number of notify elements
+added in case of error.
+
+CVE-2025-62229, ZDI-CAN-27238
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2086>
+
+CVE: CVE-2025-62229
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/5a4286b13f631b66c20f5bc8db7b68211dcbd1d0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ present/present_notify.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/present/present_notify.c b/present/present_notify.c
+index 4459549..00b3b68 100644
+--- a/present/present_notify.c
++++ b/present/present_notify.c
+@@ -90,7 +90,7 @@ present_create_notifies(ClientPtr client, int num_notifies, xPresentNotify *x_no
+         if (status != Success)
+             goto bail;
+
+-        added = i;
++        added++;
+     }
+     return Success;
+
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
index 49e35ca442..1ed5df8a2e 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-49178.patch \
            file://CVE-2025-49179.patch \
            file://CVE-2025-49180.patch \
+           file://CVE-2025-62229.patch \
 "
 SRC_URI[sha256sum] = "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90"
 
-- 
2.40.0


