Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB2EC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 02:22:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.22682.1658110924606851945
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 19:22:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=pZro+kpI;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=41981c58c2=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26I1xD20028268
	for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 19:22:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=un5Rd5Akk1g1djJIjqoZvBqDDC/BMYYb5Fz5uJ6+mZo=;
 b=pZro+kpIgJH8itTKGr3dFt2N/bnuGSbGFm4PNoBM7T6H82t/UOTgcvdx0JpUUW//wuOk
 r1KLhqmr5zy5jB1A00GNN2MRlge2OGLpuhl5kIzi+HTGv36DDd2SDEL8R3jkTCe3T9ua
 iub0CSRuVGFA8rodcbmt8UrpZqhkdzGgs0ttjUX0lU+zB3Xsun3nM4ZgHgWke9/+RI3O
 BFzjqE5jvWmNh70UAu18XL9snzd8Y/iBwDYVji4JSZ0eniM0hRlYmpUzphoFZt2xbfQG
 Egz8ULUuymOfEmOL8He61q6GRwvRRaQOIvOMbB2qg7evF9jW4yNgzFFsR5IpCmKZJc2d oQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbvukrub5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 19:22:03 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 17 Jul 2022 19:22:03 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Jul 2022 19:22:03 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 17 Jul 2022 19:22:02 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] mesa: fix with DEBUG_BUILD enabled
Date: Mon, 18 Jul 2022 10:21:59 +0800
Message-ID: <20220718022159.39781-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: z06J-xahp4daxs8Vb1QpbVaF0u1HpWxy
X-Proofpoint-ORIG-GUID: z06J-xahp4daxs8Vb1QpbVaF0u1HpWxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_01,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180009
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 26I1xD20028268
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 02:22:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168189

From: Kai Kang <kai.kang@windriver.com>

It fails to compile mesa-native when DEBUG_BUILD is enabled:

../mesa-22.1.3/src/compiler/nir/nir_inline_helpers.h: In function =E2=80=98=
nir_opt_move_block=E2=80=99:
../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error: inlining fail=
ed in call to
  always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function call with=
 a yet undetermined callee
 src_is_ssa(nir_src *src, void *state)
 ^~~~~~~~~~

Remove 'ALWAYS_INLINE' for function src_is_ssa.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../mesa/files/0001-nir-fix-build-at-Og.patch | 31 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-nir-fix-build-a=
t-Og.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-nir-fix-build-at-Og.pa=
tch b/meta/recipes-graphics/mesa/files/0001-nir-fix-build-at-Og.patch
new file mode 100644
index 0000000000..5b4a5c7231
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-nir-fix-build-at-Og.patch
@@ -0,0 +1,31 @@
+At -Og with gcc 12.1, it fails to compile:
+
+../mesa-22.1.3/src/compiler/nir/nir_inline_helpers.h: In function =E2=80=
=98nir_opt_move_block=E2=80=99:
+../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error: inlining fai=
led in call to always_inline =E2=80=98src_is_ssa=E2=80=99: indirect funct=
ion call with a yet undetermined callee     src_is_ssa(nir_src *src, void=
 *state)
+ ^~~~~~~~~~
+
+Remove 'ALWAYS_INLINE' for function src_is_ssa.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/17589]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/compiler/nir/nir_opt_move.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/compiler/nir/nir_opt_move.c b/src/compiler/nir/nir_opt_=
move.c
+index 81bcde5c436..09db6717002 100644
+--- a/src/compiler/nir/nir_opt_move.c
++++ b/src/compiler/nir/nir_opt_move.c
+@@ -51,7 +51,7 @@
+  * lower register pressure.
+  */
+=20
+-static ALWAYS_INLINE bool
++static bool
+ src_is_ssa(nir_src *src, void *state)
+ {
+    return src->is_ssa;
+--=20
+2.34.1
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 710cacb09d..58e662efd4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,6 +22,7 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-=
${PV}.tar.xz \
            file://0001-util-format-Check-for-NEON-before-using-it.patch =
\
            file://0001-Revert-egl-wayland-deprecate-drm_handle_format-an=
d-d.patch \
            file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driD=
RI2.patch \
+           file://0001-nir-fix-build-at-Og.patch \
            "
=20
 SRC_URI[sha256sum] =3D "b98f32ba7aa2a1ff5725fb36eb999c693079f0ca16f70aa2=
f103e2b6c3f093e3"
--=20
2.17.1


