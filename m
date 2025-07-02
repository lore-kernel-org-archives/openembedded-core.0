Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169B8C77B7C
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 15:46:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.27286.1751471185350500369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 08:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927893d721=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5624sV8Y007944
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 15:46:24 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j5m1cmdf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 15:46:24 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 2 Jul 2025 08:46:21 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 2 Jul 2025 08:46:20 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  1/6] xwayland: fix CVE-2025-49175
Date: Wed, 2 Jul 2025 21:16:14 +0530
Message-ID: <20250702154619.3765505-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDEzMCBTYWx0ZWRfXzlfSRjw3GoLL xk/CUMFMN4JoJQlzIXteC6b0pktuKqT0SiMbJIk5E5XbXiqPEG3L1Vz1Wt6BuGcnUkUOmrCKHvR MWFGPkWMJ+6wgv2/oXMdyeft6131zUUL2N9FwXyrWDzL8Tio66y9ek+t6Py96p3Xz6dBGL9n9UH
 vIO8m+Fjn9dW+DMSJkHgL5jHOji+a2a2n1qKyE9hUiXMGn2TcxSXY1tz7hbpjZQ4XcWkTJQhLAE 29VqmsRugMpQ6l4VzLmJ2NGkeKJZFPcQ5bV69vTxieRKFbJyI+KTXt2kwUkWelDqVyFpjsDdpP9 5rCypdGdAWzsEy6b1VxdMiSNo68yG5kSKTxfE7Fgh6AcUgwoVeGU1VVjmwQeOpEkwIl5iQGfzvN
 Tcko6uBbQE3N886elP8iQ0JwUzaxuXFertmpMdXFlNKDf3spqG17WNgIXiQG5nq7wzZM3Oam
X-Authority-Analysis: v=2.4 cv=IOsCChvG c=1 sm=1 tr=0 ts=68655450 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=aR16PxjQAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=3tCwXSKOYEuI01B-BJ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=zbFvvTOBjyH4ze5LlUjX:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Sd-iaf4c3y1DejW7dU8ln4FhoDo3mX1p
X-Proofpoint-ORIG-GUID: Sd-iaf4c3y1DejW7dU8ln4FhoDo3mX1p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_02,2025-07-02_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=502 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020130
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5624sV8Y007944
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 15:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219843

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the X Rendering extension's handling of animated curs=
ors.
If a client provides no cursors, the server assumes at least one is prese=
nt,
leading to an out-of-bounds read and potential crash.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xwayland/xwayland/CVE-2025-49175.patch    | 92 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-4917=
5.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49175.patch=
 b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49175.patch
new file mode 100644
index 0000000000..bfb37fcea0
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-49175.patch
@@ -0,0 +1,92 @@
+From 0885e0b26225c90534642fe911632ec0779eebee Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Fri, 28 Mar 2025 09:43:52 +0100
+Subject: [PATCH] render: Avoid 0 or less animated cursors
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Animated cursors use a series of cursors that the client can set.
+
+By default, the Xserver assumes at least one cursor is specified
+while a client may actually pass no cursor at all.
+
+That causes an out-of-bound read creating the animated cursor and a
+crash of the Xserver:
+
+ | Invalid read of size 8
+ |    at 0x5323F4: AnimCursorCreate (animcur.c:325)
+ |    by 0x52D4C5: ProcRenderCreateAnimCursor (render.c:1817)
+ |    by 0x52DC80: ProcRenderDispatch (render.c:1999)
+ |    by 0x4A1E9D: Dispatch (dispatch.c:560)
+ |    by 0x4B0169: dix_main (main.c:284)
+ |    by 0x4287F5: main (stubmain.c:34)
+ |  Address 0x59aa010 is 0 bytes after a block of size 0 alloc'd
+ |    at 0x48468D3: reallocarray (vg_replace_malloc.c:1803)
+ |    by 0x52D3DA: ProcRenderCreateAnimCursor (render.c:1802)
+ |    by 0x52DC80: ProcRenderDispatch (render.c:1999)
+ |    by 0x4A1E9D: Dispatch (dispatch.c:560)
+ |    by 0x4B0169: dix_main (main.c:284)
+ |    by 0x4287F5: main (stubmain.c:34)
+ |
+ | Invalid read of size 2
+ |    at 0x5323F7: AnimCursorCreate (animcur.c:325)
+ |    by 0x52D4C5: ProcRenderCreateAnimCursor (render.c:1817)
+ |    by 0x52DC80: ProcRenderDispatch (render.c:1999)
+ |    by 0x4A1E9D: Dispatch (dispatch.c:560)
+ |    by 0x4B0169: dix_main (main.c:284)
+ |    by 0x4287F5: main (stubmain.c:34)
+ |  Address 0x8 is not stack'd, malloc'd or (recently) free'd
+
+To avoid the issue, check the number of cursors specified and return a
+BadValue error in both the proc handler (early) and the animated cursor
+creation (as this is a public function) if there is 0 or less cursor.
+
+CVE-2025-49175
+
+This issue was discovered by Nils Emmerich <nemmerich@ernw.de> and
+reported by Julian Suleder via ERNW Vulnerability Disclosure.
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Jos=C3=A9 Exp=C3=B3sito <jexposit@redhat.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2=
024>
+
+CVE: CVE-2025-49175
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/0885e0b26225c90534642fe911632ec0779eebee]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ render/animcur.c | 3 +++
+ render/render.c  | 2 ++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/render/animcur.c b/render/animcur.c
+index ef27bda..77942d8 100644
+--- a/render/animcur.c
++++ b/render/animcur.c
+@@ -304,6 +304,9 @@ AnimCursorCreate(CursorPtr *cursors, CARD32 *deltas,=
 int ncursor,
+     int rc =3D BadAlloc, i;
+     AnimCurPtr ac;
+
++    if (ncursor <=3D 0)
++        return BadValue;
++
+     for (i =3D 0; i < screenInfo.numScreens; i++)
+         if (!GetAnimCurScreen(screenInfo.screens[i]))
+             return BadImplementation;
+diff --git a/render/render.c b/render/render.c
+index 5bc2a20..a8c2da0 100644
+--- a/render/render.c
++++ b/render/render.c
+@@ -1795,6 +1795,8 @@ ProcRenderCreateAnimCursor(ClientPtr client)
+     ncursor =3D
+         (client->req_len -
+          (bytes_to_int32(sizeof(xRenderCreateAnimCursorReq)))) >> 1;
++    if (ncursor <=3D 0)
++        return BadValue;
+     cursors =3D xallocarray(ncursor, sizeof(CursorPtr) + sizeof(CARD32)=
);
+     if (!cursors)
+         return BadAlloc;
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/rec=
ipes-graphics/xwayland/xwayland_23.2.5.bb
index 0265366393..b9b4aa1a6a 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "https://www.x.org/archive/individual/xserv=
er/xwayland-${PV}.tar.xz \
            file://CVE-2025-26601-2.patch \
            file://CVE-2025-26601-3.patch \
            file://CVE-2025-26601-4.patch \
+           file://CVE-2025-49175.patch \
 "
 SRC_URI[sha256sum] =3D "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f=
526a625ff9f4bd90"
=20
--=20
2.40.0


