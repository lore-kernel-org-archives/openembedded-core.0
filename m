Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480CCCF319D
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 11:05:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4118.1763550313136589230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 03:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=GyaoB7si;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3418d146ba=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7vTqE4100545
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=0Ml1Dv3i6ZwmSXy/1c2MZdPZtWLKSk50zpTFlN4pNwo=; b=GyaoB7sixcvX
	g1j419Mer8rFrGMV+RY4cTui1awQxSBvwySGGE/bF6kvhPMsOL1zOXWABVmZzf6o
	23DGJ2/XKG5kYeUNpGnlyNnN+mB8dExd5v29oZ5WLs0cEMszq7oan+ekJWouSjFM
	5bMlTr3eYm3wzlTzlBFY9u3yWO7Mz9EWVKFXiOkiBILQINraEuCzfM+rJoNC2rCG
	cmis+h1eFZJuRo4h5o6h1OlAmkHHim8NLFdyVeTZdQWu/xyUx3xYeQwpmjV9fv9y
	H9bwvXf4kLKQcrAfBL0vPeUNg/dUSpdog0Py9un/pUxUaCP/olSsd5M2wwLnZnM4
	UwFi6RJOHA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwmyr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:05:12 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 19 Nov 2025 03:05:09 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 4/5] xwayland: fix CVE-2025-62230
Date: Wed, 19 Nov 2025 16:34:40 +0530
Message-ID: <20251119110441.817793-4-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251119110441.817793-1-yogita.urade@windriver.com>
References: <20251119110441.817793-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA4NyBTYWx0ZWRfX/SYxTv07pAXA
 SaqGsulpSOKY6fEdg67yMBeU926U9jBAaJQBNoptOLv+pUHPHLKNTBu4knwckgN3WAkj1+7IHjs
 XpqMQE8Hvs6DajFJESB3t3YcAFEA0/2u7Kld7LMSb+dmUYAaydmxQ9TO5a8iS44rB6pAipTGOsA
 00utk6wuaeTTAP7GTHZ3GgZkQ7LiMdTFEP3tqvaJd+/IAA9vFTAVffgP/HlO+FWyDmVrhn1XZ9I
 suRlUcu5eAN+g78OuqURwDS6FkWcW4qzVWD6xmE2QNKXI4ewThx5y7jfBhKy0Y/tC69X7sgrpF1
 N3CqTtvWeeKWXrNeDEFFeWmxG3Cn8WHuNyRY4IA1sOhUc1ZNZ8JZSXAUR0dNnbBZFDEwmi58FVP
 7CUOsVPAPEB3azfP1QKZQ1GZj7Gzog==
X-Proofpoint-GUID: nufTXEMzWjkgkJDebKOnrwRVZL73ln_h
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691da468 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=aR16PxjQAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=VnL-hwfQD56XgfcI8rkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=zbFvvTOBjyH4ze5LlUjX:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: nufTXEMzWjkgkJDebKOnrwRVZL73ln_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190087
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AJ7vTqE4100545
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226549

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was discovered in the X.Org X server=C3=A2\x80\x99s X Keyboard
(Xkb) extension when handling client resource cleanup. The software
frees certain data structures without properly detaching related
resources, leading to a use-after-free condition. This can cause
memory corruption or a crash when affected clients disconnect.

Reference:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/3baad99f9c15028ed8c3=
e3d8408e5ec35db155aa

Upstream patches:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/865089ca70840c0f13a6=
1df135f7b44a9782a175
https://gitlab.freedesktop.org/xorg/xserver/-/commit/87fe2553937a99fd914a=
d0cde999376a3adc3839

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../xwayland/CVE-2025-62230-0001.patch        | 60 +++++++++++++
 .../xwayland/CVE-2025-62230-0002.patch        | 89 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-6223=
0-0001.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-6223=
0-0002.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0001.=
patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0001.patch
new file mode 100644
index 0000000000..a26d13e712
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0001.patch
@@ -0,0 +1,60 @@
+From 865089ca70840c0f13a61df135f7b44a9782a175 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 15:55:06 +0200
+Subject: [PATCH] xkb: Make the RT_XKBCLIENT resource private
+
+Currently, the resource in only available to the xkb.c source file.
+
+In preparation for the next commit, to be able to free the resources
+from XkbRemoveResourceClient(), make that variable private instead.
+
+This is related to:
+
+CVE-2025-62230, ZDI-CAN-27545
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
+(cherry picked from commit 99790a2c9205a52fbbec01f21a92c9b7f4ed1d8f)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2=
087>
+
+CVE: CVE-2025-62230
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/865089ca70840c0f13a61df135f7b44a9782a175]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ include/xkbsrv.h | 2 ++
+ xkb/xkb.c        | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/include/xkbsrv.h b/include/xkbsrv.h
+index 21cd876..24fdfb4 100644
+--- a/include/xkbsrv.h
++++ b/include/xkbsrv.h
+@@ -58,6 +58,8 @@ THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ #include "inputstr.h"
+ #include "events.h"
+
++extern RESTYPE RT_XKBCLIENT;
++
+ typedef struct _XkbInterest {
+     DeviceIntPtr dev;
+     ClientPtr client;
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 3210ff9..b7877f5 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -51,7 +51,7 @@ int XkbKeyboardErrorCode;
+ CARD32 xkbDebugFlags =3D 0;
+ static CARD32 xkbDebugCtrls =3D 0;
+
+-static RESTYPE RT_XKBCLIENT;
++RESTYPE RT_XKBCLIENT =3D 0;
+
+ /***=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D***/
+
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0002.=
patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0002.patch
new file mode 100644
index 0000000000..b5230359ba
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62230-0002.patch
@@ -0,0 +1,89 @@
+From 87fe2553937a99fd914ad0cde999376a3adc3839 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 15:58:57 +0200
+Subject: [PATCH] xkb: Free the XKB resource when freeing XkbInterest
+
+XkbRemoveResourceClient() would free the XkbInterest data associated
+with the device, but not the resource associated with it.
+
+As a result, when the client terminates, the resource delete function
+gets called and accesses already freed memory:
+
+ | Invalid read of size 8
+ |   at 0x5BC0C0: XkbRemoveResourceClient (xkbEvents.c:1047)
+ |   by 0x5B3391: XkbClientGone (xkb.c:7094)
+ |   by 0x4DF138: doFreeResource (resource.c:890)
+ |   by 0x4DFB50: FreeClientResources (resource.c:1156)
+ |   by 0x4A9A59: CloseDownClient (dispatch.c:3550)
+ |   by 0x5E0A53: ClientReady (connection.c:601)
+ |   by 0x5E4FEF: ospoll_wait (ospoll.c:657)
+ |   by 0x5DC834: WaitForSomething (WaitFor.c:206)
+ |   by 0x4A1BA5: Dispatch (dispatch.c:491)
+ |   by 0x4B0070: dix_main (main.c:277)
+ |   by 0x4285E7: main (stubmain.c:34)
+ | Address 0x1893e278 is 184 bytes inside a block of size 928 free'd
+ |   at 0x4842E43: free (vg_replace_malloc.c:989)
+ |   by 0x49C1A6: CloseDevice (devices.c:1067)
+ |   by 0x49C522: CloseOneDevice (devices.c:1193)
+ |   by 0x49C6E4: RemoveDevice (devices.c:1244)
+ |   by 0x5873D4: remove_master (xichangehierarchy.c:348)
+ |   by 0x587921: ProcXIChangeHierarchy (xichangehierarchy.c:504)
+ |   by 0x579BF1: ProcIDispatch (extinit.c:390)
+ |   by 0x4A1D85: Dispatch (dispatch.c:551)
+ |   by 0x4B0070: dix_main (main.c:277)
+ |   by 0x4285E7: main (stubmain.c:34)
+ | Block was alloc'd at
+ |   at 0x48473F3: calloc (vg_replace_malloc.c:1675)
+ |   by 0x49A118: AddInputDevice (devices.c:262)
+ |   by 0x4A0E58: AllocDevicePair (devices.c:2846)
+ |   by 0x5866EE: add_master (xichangehierarchy.c:153)
+ |   by 0x5878C2: ProcXIChangeHierarchy (xichangehierarchy.c:493)
+ |   by 0x579BF1: ProcIDispatch (extinit.c:390)
+ |   by 0x4A1D85: Dispatch (dispatch.c:551)
+ |   by 0x4B0070: dix_main (main.c:277)
+ |   by 0x4285E7: main (stubmain.c:34)
+
+To avoid that issue, make sure to free the resources when freeing the
+device XkbInterest data.
+
+CVE-2025-62230, ZDI-CAN-27545
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
+(cherry picked from commit 10c94238bdad17c11707e0bdaaa3a9cd54c504be)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2=
087>
+
+CVE: CVE-2025-62230
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/87fe2553937a99fd914ad0cde999376a3adc3839]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ xkb/xkbEvents.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xkb/xkbEvents.c b/xkb/xkbEvents.c
+index f8f65d4..7c669c9 100644
+--- a/xkb/xkbEvents.c
++++ b/xkb/xkbEvents.c
+@@ -1055,6 +1055,7 @@ XkbRemoveResourceClient(DevicePtr inDev, XID id)
+             autoCtrls =3D interest->autoCtrls;
+             autoValues =3D interest->autoCtrlValues;
+             client =3D interest->client;
++            FreeResource(interest->resource, RT_XKBCLIENT);
+             free(interest);
+             found =3D TRUE;
+         }
+@@ -1066,6 +1067,7 @@ XkbRemoveResourceClient(DevicePtr inDev, XID id)
+                 autoCtrls =3D victim->autoCtrls;
+                 autoValues =3D victim->autoCtrlValues;
+                 client =3D victim->client;
++                FreeResource(victim->resource, RT_XKBCLIENT);
+                 free(victim);
+                 found =3D TRUE;
+             }
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/rec=
ipes-graphics/xwayland/xwayland_23.2.5.bb
index 1ed5df8a2e..9bc67f7761 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -32,6 +32,8 @@ SRC_URI =3D "https://www.x.org/archive/individual/xserv=
er/xwayland-${PV}.tar.xz \
            file://CVE-2025-49179.patch \
            file://CVE-2025-49180.patch \
            file://CVE-2025-62229.patch \
+           file://CVE-2025-62230-0001.patch \
+           file://CVE-2025-62230-0002.patch \
 "
 SRC_URI[sha256sum] =3D "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f=
526a625ff9f4bd90"
=20
--=20
2.40.0


