Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3A2CF3199
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 11:05:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4120.1763550313689282988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 03:05:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MaIoBnMh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3418d146ba=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7rvGo1456056
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 03:05:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=AJb7k4CmBkxIECsIkNaxmTrQbRAouiVQkcneIkUeXDo=; b=MaIoBnMhamwM
	dPf4+mCe44L28hDH3W740hYrHfirrmeMxF1mDgoM9XZFW8qt2Gs+57Vlvuj4pxpx
	K9Kgh1WIG7J+COOUbyUudkavimD7Eqg1udrMSbs4Vk93AFOng2M9dA0jMf10jvs6
	3USX396lx9RuMEXhN8q3CRMKhWvg1OGpuEudFQtTvRsUnLsMOBIHNWy6/+S/D4q+
	TIRMGAspZjbMmzSH00J4kHBrbmQ1hrcs001sPLWTplCAjMZACSlZEEP5V9ryKPrL
	1uN++/7v+oyXZeNZurrCNLvuV3kyf0AE6riD9O0rMAqjJLS2X6zmpazylI59kOu9
	FkA3AtyGqw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjcq9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 03:05:13 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 19 Nov 2025 03:05:11 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 5/5] xwayland: fix CVE-2025-62231
Date: Wed, 19 Nov 2025 16:34:41 +0530
Message-ID: <20251119110441.817793-5-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251119110441.817793-1-yogita.urade@windriver.com>
References: <20251119110441.817793-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691da469 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=aR16PxjQAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=3wiCy6-QTMpVeIMz6ZkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=zbFvvTOBjyH4ze5LlUjX:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: PgVUZMAsoMIekYNGjiEVG0q1hbgshQfD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA4NyBTYWx0ZWRfX97xrE7QRZLOh
 yYGRZfdzOCzJBqQmv9hR0HqaP4nEQUxcpizke4sBaGOulfsVztSYiYukBzHMHJYp2tdt0OSHY+Y
 chNXG3v2y3XDaxSJQ4hAeD09wtNWFzERot1seSV3fXfXfmor0Q9Xt2vlRxuttTHfnNt6+kQ5vYz
 wYzlyzUPguiPIPwGqBFDNCAdJeSWy+IUcILH/8F1+ksZR8ePwIMQOXSDbJdO85Wu9ouRzGjSv+6
 L9hQkQE2WQxDON6ApoIpPEn93xc/nxI8GEEDioUrXqkNAZOfGw8YG3U63LJJf/uhglcSZBnCktM
 6Za+Xtsp/steZicjUVkpbgPERd+cMJkvvQ+a/jETZ7/dTWyz8qDMCPJ1Mn26bSGPO2JB34R6evJ
 vk97i8qDoviBdKKJ/wPwZzfAHwxWnQ==
X-Proofpoint-ORIG-GUID: PgVUZMAsoMIekYNGjiEVG0q1hbgshQfD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190087
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AJ7rvGo1456056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 11:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226550

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was identified in the X.Org X server=C3=A2\x80\x99s X Keyboard
(Xkb) extension where improper bounds checking in the XkbSetCompatMap()
function can cause an unsigned short overflow. If an attacker sends
specially crafted input data, the value calculation may overflow,
leading to memory corruption or a crash.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-62231

Upstream patch:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/3baad99f9c15028ed8c3=
e3d8408e5ec35db155aa

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../xwayland/xwayland/CVE-2025-62231.patch    | 50 +++++++++++++++++++
 .../xwayland/xwayland_23.2.5.bb               |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-6223=
1.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch=
 b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch
new file mode 100644
index 0000000000..8095c3d82c
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-62231.patch
@@ -0,0 +1,50 @@
+From 3baad99f9c15028ed8c3e3d8408e5ec35db155aa Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 10 Sep 2025 16:30:29 +0200
+Subject: [PATCH] xkb: Prevent overflow in XkbSetCompatMap()
+
+The XkbCompatMap structure stores its "num_si" and "size_si" fields
+using an unsigned short.
+
+However, the function _XkbSetCompatMap() will store the sum of the
+input data "firstSI" and "nSI" in both XkbCompatMap's "num_si" and
+"size_si" without first checking if the sum overflows the maximum
+unsigned short value, leading to a possible overflow.
+
+To avoid the issue, check whether the sum does not exceed the maximum
+unsigned short value, or return a "BadValue" error otherwise.
+
+CVE-2025-62231, ZDI-CAN-27560
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
+(cherry picked from commit 475d9f49acd0e55bc0b089ed77f732ad18585470)
+
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/2=
087>
+
+CVE: CVE-2025-62231
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/3baad99f9c15028ed8c3e3d8408e5ec35db155aa]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ xkb/xkb.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index b7877f5..4e585d1 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -2992,6 +2992,8 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr de=
v,
+         XkbSymInterpretPtr sym;
+         unsigned int skipped =3D 0;
+
++        if ((unsigned) (req->firstSI + req->nSI) > USHRT_MAX)
++            return BadValue;
+         if ((unsigned) (req->firstSI + req->nSI) > compat->size_si) {
+             compat->num_si =3D compat->size_si =3D req->firstSI + req->=
nSI;
+             compat->sym_interpret =3D reallocarray(compat->sym_interpre=
t,
+--
+2.40.0
diff --git a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb b/meta/rec=
ipes-graphics/xwayland/xwayland_23.2.5.bb
index 9bc67f7761..362b110a0b 100644
--- a/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_23.2.5.bb
@@ -34,6 +34,7 @@ SRC_URI =3D "https://www.x.org/archive/individual/xserv=
er/xwayland-${PV}.tar.xz \
            file://CVE-2025-62229.patch \
            file://CVE-2025-62230-0001.patch \
            file://CVE-2025-62230-0002.patch \
+           file://CVE-2025-62231.patch \
 "
 SRC_URI[sha256sum] =3D "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f=
526a625ff9f4bd90"
=20
--=20
2.40.0


