Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE480C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 09:21:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.96882.1680600090576143387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 02:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=K7FLWubF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34587a342a=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3349GdIg007436
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Apr 2023 02:21:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=2gpDGb2A7NFrdXDpOkvrxtSD+1xKdpzAT1nPaSdSfHA=;
 b=K7FLWubFNcwPgq2DxhkREDCaIGNJqyTrhKHboZxfRhmFQnTHUP0O4xnVz/sGRv4jy8UC
 ewvdooxKjhIMTiG0KVWnfLVF9AhcjdcbVHNL6wNwFvHgSXxMmCbt63EjLhvwokqWNAp7
 7cCOMsycQ16FI3y+a+RJjcmbOY2CAM/rSpyA56/Nf0qv1Mx0epw+HXnRfv1kJUUkS7Dw
 nMOBKNvfNr1MNgUR+c8aUWegw4Kr0UK/VMjpLDW+lZC4reWS3cw2O2wDRGE0F445bjtn
 MHw8ZxLrWZK8Bb3C4LKmHBYX8vQaUjMm/fc0ZE4Mlj6l1mX+BpBIHOu/VfB2B76qACPI YA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppfw6tvst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:21:29 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 4 Apr 2023 02:21:29 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Tue, 4 Apr 2023 02:21:28 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] mesa: fix non-trivial designated initializers issue
Date: Tue, 4 Apr 2023 17:21:24 +0800
Message-ID: <20230404092124.27242-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: rSs7Nbg6y7QcN2zIVLQNXAVY-pZgKXnx
X-Proofpoint-GUID: rSs7Nbg6y7QcN2zIVLQNXAVY-pZgKXnx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_02,2023-04-03_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040086
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3349GdIg007436
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 09:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179678

From: Kai Kang <kai.kang@windriver.com>

It fails to compile intel/compiler/brw_simd_selection.cpp with g++ 7.5.0:

| mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp: In function =E2=80=
=98int
  brw_simd_select_for_workgroup_size(const intel_device_info*,
  const brw_cs_prog_data*, const unsigned int*)=E2=80=99:
| mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp:205:7: sorry,
  unimplemented: non-trivial designated initializers not supported
|        };
|        ^

Initialize the leading 2 members to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...on.cpp-fix-non-trivial-designated-in.patch | 59 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-brw_simd_select=
ion.cpp-fix-non-trivial-designated-in.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-brw_simd_selection.cpp=
-fix-non-trivial-designated-in.patch b/meta/recipes-graphics/mesa/files/0=
001-brw_simd_selection.cpp-fix-non-trivial-designated-in.patch
new file mode 100644
index 0000000000..9db738cdc0
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-brw_simd_selection.cpp-fix-no=
n-trivial-designated-in.patch
@@ -0,0 +1,59 @@
+From 6fd92cfc8a52a1884b8bc45b9ac0c7ceaf492a58 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Mon, 27 Mar 2023 21:19:36 +0800
+Subject: [PATCH] brw_simd_selection.cpp: fix non-trivial designated
+ initializers issue
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+It fails to compile intel/compiler/brw_simd_selection.cpp with g++ 7.5.0=
:
+
+| mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp: In function =E2=
=80=98int
+  brw_simd_select_for_workgroup_size(const intel_device_info*,
+  const brw_cs_prog_data*, const unsigned int*)=E2=80=99:
+| mesa-23.0.0/src/intel/compiler/brw_simd_selection.cpp:205:7: sorry,
+  unimplemented: non-trivial designated initializers not supported
+|        };
+|        ^
+
+Initialize the leading 2 members to fix the issue.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/22138]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/intel/compiler/brw_simd_selection.cpp | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/intel/compiler/brw_simd_selection.cpp b/src/intel/compi=
ler/brw_simd_selection.cpp
+index 1515e538b74..4c065f9884a 100644
+--- a/src/intel/compiler/brw_simd_selection.cpp
++++ b/src/intel/compiler/brw_simd_selection.cpp
+@@ -232,10 +232,14 @@ brw_simd_select_for_workgroup_size(const struct in=
tel_device_info *devinfo,
+                                    const struct brw_cs_prog_data *prog_=
data,
+                                    const unsigned *sizes)
+ {
++   void *mem_ctx =3D ralloc_context(NULL);
++
+    if (!sizes || (prog_data->local_size[0] =3D=3D sizes[0] &&
+                   prog_data->local_size[1] =3D=3D sizes[1] &&
+                   prog_data->local_size[2] =3D=3D sizes[2])) {
+       brw_simd_selection_state simd_state{
++         .mem_ctx =3D mem_ctx,
++         .devinfo =3D devinfo,
+          .prog_data =3D const_cast<struct brw_cs_prog_data *>(prog_data=
),
+       };
+=20
+@@ -257,8 +261,6 @@ brw_simd_select_for_workgroup_size(const struct inte=
l_device_info *devinfo,
+    cloned.prog_mask =3D 0;
+    cloned.prog_spilled =3D 0;
+=20
+-   void *mem_ctx =3D ralloc_context(NULL);
+-
+    brw_simd_selection_state simd_state{
+       .mem_ctx =3D mem_ctx,
+       .devinfo =3D devinfo,
+--=20
+2.34.1
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 8f72f25c17..caab1eff6d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE =3D "2"
 SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinati=
ons.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patc=
h \
+           file://0001-brw_simd_selection.cpp-fix-non-trivial-designated=
-in.patch \
            "
=20
 SRC_URI[sha256sum] =3D "01f3cff3763f09e0adabcb8011e4aebc6ad48f6a4dd4bae9=
04fe918707d253e4"
--=20
2.17.1


