Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86F1C43217
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 08:34:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3400.1664526882648429689
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 01:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=HEsYr0Y9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=72725421ac=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28U8O005024394;
	Fri, 30 Sep 2022 01:34:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=vkySNyjqgnI2HJbLkeHvNJsE828sVYchmZpMNTcUivc=;
 b=HEsYr0Y9O7HhRKGyalVi9knG4NC7NxO8GbZ6CxT7ucV+kfsQOB81fWqghccgRee+WFD9
 mtSUXDH95YV0n7Tl5xL/3/1r4WlXBnpEyLXU6SNA89mcJxmccZkUQnf+/p0uSHiHJFYS
 x6OZyzWZrU9e7LeD5K8S5W7b+bFukvwgcwjPRIQ5VfxuWvhqPPH4GV/wH89xDMTDdVIV
 wI7GzfOwkmZjR4kkkWm6yZWMeyvfGGLt8X7ktkK5uQAkdGzWrORQnnGxCH4+TQYOBOyw
 SNvUTUoS6BCrQdwvCWXqYoHI/fUB4IrIpKAVaYzQrKeYO7wQDjvO1tYL0KYOoS/DUGQR hg==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jt1dkd331-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 30 Sep 2022 01:34:38 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 30 Sep 2022 01:34:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 30 Sep 2022 01:34:36 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 30 Sep 2022 01:34:35 -0700
From: <kai.kang@windriver.com>
To: <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] mesa: only apply patch to fix ALWAYS_INLINE for native
Date: Fri, 30 Sep 2022 16:34:33 +0800
Message-ID: <20220930083433.2277-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: EDPHAWwDm1iCP3QRYpqLu9_7Whk9iPvU
X-Proofpoint-ORIG-GUID: EDPHAWwDm1iCP3QRYpqLu9_7Whk9iPvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=950 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300052
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 28U8O005024394
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 08:34:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171214

From: Kai Kang <kai.kang@windriver.com>

0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not
needed by target mesa any more. But it still fails to compile
mesa-native without this patch when DEBUG_BUILD is enabled on Ubuntu
18.04 with gcc 7.5.0:

| ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In function =E2=80=
=98nir_opt_move_block=E2=80=99:
| ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1: error: inlining fa=
iled in call to
    always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function call wi=
th a yet undetermined callee
|  src_is_ssa(nir_src *src, void *state)
|  ^~~~~~~~~~

So only apply it for mesa-native.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v3:
* rebase

 meta/recipes-graphics/mesa/mesa.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 8a74e0a80a..c94e439363 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,9 +19,11 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa=
-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.pa=
tch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch =
\
-           file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error=
.patch \
            "
=20
+# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD =
enabled
+SRC_URI:append:class-native =3D " file://0001-nir-nir_opt_move-fix-ALWAY=
S_INLINE-compiler-error.patch"
+
 SRC_URI[sha256sum] =3D "b1f9c8fd08f2cae3adf83355bef4d2398e8025f449473328=
80f2d0066bdafa8c"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
--=20
2.17.1


