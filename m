Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C84E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 10:31:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17019.1733999465197889872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 02:31:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2076b0823f=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7ZD1F013049
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 10:31:03 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy3ndrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 10:31:03 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Dec 2024 02:31:00 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] xserver-xorg: fix CVE-2024-9632
Date: Thu, 12 Dec 2024 10:30:36 +0000
Message-ID: <20241212103036.980879-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: SQupVm6gDdi859GZFu6f89TuHMXHofAm
X-Proofpoint-ORIG-GUID: SQupVm6gDdi859GZFu6f89TuHMXHofAm
X-Authority-Analysis: v=2.4 cv=D7O9KuRj c=1 sm=1 tr=0 ts=675abb67 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8
 a=aR16PxjQAAAA:8 a=OCbkGfCjAAAA:8 a=D31QgfloAAAA:8 a=20KFwNOVAAAA:8 a=EJtntYSaRXMlSlE7y8sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=zbFvvTOBjyH4ze5LlUjX:22 a=Q54k6SzI3w2tyUrPwH3r:22
 a=I6paTPn9_Px6ARgSWtWf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_05,2024-12-12_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412120074
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BC7ZD1F013049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 10:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208629

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in the X.org server. Due to improperly
tracked allocation size in _XkbSetCompatMap, a local
attacker may be able to trigger a buffer overflow condition
via a specially crafted payload, leading to denial of service
or local privilege escalation in distributions where the
X.org server is run with root privileges.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-9632

Upstream patch:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/ba1d14f8eff2a123bd7f=
f4d48c02e1d5131358e0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../xserver-xorg/CVE-2024-9632.patch          | 58 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2=
024-9632.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-963=
2.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-9632.p=
atch
new file mode 100644
index 0000000000..387cdaa3c9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-9632.patch
@@ -0,0 +1,58 @@
+From ba1d14f8eff2a123bd7ff4d48c02e1d5131358e0 Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Thu, 10 Oct 2024 10:37:28 +0200
+Subject: [PATCH] xkb: Fix buffer overflow in _XkbSetCompatMap()
+
+The _XkbSetCompatMap() function attempts to resize the `sym_interpret`
+buffer.
+
+However, It didn't update its size properly. It updated `num_si` only,
+without updating `size_si`.
+
+This may lead to local privilege escalation if the server is run as root
+or remote code execution (e.g. x11 over ssh).
+
+CVE-2024-9632, ZDI-CAN-24756
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Tested-by: Peter Hutterer <peter.hutterer@who-t.net>
+Reviewed-by: Jos=C3=A9 Exp=C3=B3sito <jexposit@redhat.com>
+(cherry picked from commit 85b77657)
+
+Part-of: <!1734>
+
+CVE: CVE-2024-9632
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-=
/commit/ba1d14f8eff2a123bd7ff4d48c02e1d5131358e0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ xkb/xkb.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 276dc19..7da00a0 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -2992,13 +2992,13 @@ _XkbSetCompatMap(ClientPtr client, DeviceIntPtr =
dev,
+         XkbSymInterpretPtr sym;
+         unsigned int skipped =3D 0;
+
+-        if ((unsigned) (req->firstSI + req->nSI) > compat->num_si) {
+-            compat->num_si =3D req->firstSI + req->nSI;
++        if ((unsigned) (req->firstSI + req->nSI) > compat->size_si) {
++            compat->num_si =3D compat->size_si =3D req->firstSI + req->=
nSI;
+             compat->sym_interpret =3D reallocarray(compat->sym_interpre=
t,
+-                                                 compat->num_si,
++                                                 compat->size_si,
+                                                  sizeof(XkbSymInterpret=
Rec));
+             if (!compat->sym_interpret) {
+-                compat->num_si =3D 0;
++                compat->num_si =3D compat->size_si =3D 0;
+                 return BadAlloc;
+             }
+         }
+--
+2.40.0
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/=
meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index fe577050d9..a9cb1b5bde 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -21,6 +21,7 @@ SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-on=
ly-for-pre-gen4-hardwar.pat
            file://CVE-2024-31082.patch \
            file://CVE-2024-31083-0001.patch \
            file://CVE-2024-31083-0002.patch \
+           file://CVE-2024-9632.patch \
            "
 SRC_URI[sha256sum] =3D "38aadb735650c8024ee25211c190bf8aad844c5f59632761=
ab1ef4c4d5aeb152"
=20
--=20
2.40.0


