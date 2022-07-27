Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5E3C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 07:30:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.17114.1658907007233808211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 00:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=Ju1td2wP;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=42079097c3=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26R7NG2j032671;
	Wed, 27 Jul 2022 00:30:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=b1pQYSVEGILvPwRwXTR3ImZSu0OmwjycQE68Nox3x+Y=;
 b=Ju1td2wPN34I9qV+CKeQ6Dqv/n1l0hUcnpt9b8AJS4exZ6Svvhyqf1WcLZdiT9CQUQYg
 h4Nzo1rYYfIpxno9T7OHY/VHDx4jUidoplzvR4xgIFnuZ/1Re/xHpgtHWckcmGNPBCFf
 KYwFpAc04DCZmRVJ+F4bJ/K/FPvM0gvz6Ze+SxPP2KHniA9Dg4c1vu41Jg58COHNlOmH
 TMf3oO4dgVcIxVlQIX6V6m8bRefedvuXWCScDDq1EJJMh1708klDmvffcqm1Oo+H84bW
 iJYEKeqlKR/xeZDmEOD4/mONKrmZPmCYJlZGMt9YpdlG95XVRv4f+3+886Bc8kbhSqS6 fg==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hgc952xb3-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 Jul 2022 00:30:02 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 27 Jul 2022 00:30:02 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Jul 2022 00:30:01 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 27 Jul 2022 00:30:01 -0700
From: <kai.kang@windriver.com>
To: <Ross.Burton@arm.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] mesa: fix compile error when debug build enabled
Date: Wed, 27 Jul 2022 15:29:56 +0800
Message-ID: <20220727072956.15438-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: NAQLa3fjHQqIljSAW8YWBN2UTSSUdOFz
X-Proofpoint-ORIG-GUID: NAQLa3fjHQqIljSAW8YWBN2UTSSUdOFz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_07,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270028
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 26R7NG2j032671
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 07:30:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168545

From: Kai Kang <kai.kang@windriver.com>

It fails to compile mesa{,-native} when DEBUG_BUILD is enabled:

../mesa-22.1.3/src/compiler/nir/nir_inline_helpers.h: In function =E2=80=98=
nir_opt_move_block=E2=80=99:
../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error: inlining fail=
ed in call to
  always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function call with=
 a yet undetermined callee
 src_is_ssa(nir_src *src, void *state)
 ^~~~~~~~~~

Backport patch from mesa merge request to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v2:
* use patch from mesa merge request

 ...ove-fix-ALWAYS_INLINE-compiler-error.patch | 65 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-nir-nir_opt_mov=
e-fix-ALWAYS_INLINE-compiler-error.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-A=
LWAYS_INLINE-compiler-error.patch b/meta/recipes-graphics/mesa/files/0001=
-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch
new file mode 100644
index 0000000000..48fc1e37ff
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_I=
NLINE-compiler-error.patch
@@ -0,0 +1,65 @@
+Backport merge request to fix mesa compile error when debug build
+enabled.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/17439]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From c69c6e7a35205557de73734ad4a1f411c8f99926 Mon Sep 17 00:00:00 2001
+From: t bettler <thomas.bettler@gmail.com>
+Date: Sat, 9 Jul 2022 09:28:51 +0000
+Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE compiler error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+fix call to =E2=80=98always_inline=E2=80=99 =E2=80=98src_is_ssa=E2=80=99
+
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/6825
+Fixes: f1d20ec67c3f186886b97de94f74484650f8fda1 ("nir/nir_opt_move: hand=
le non-SSA defs ")
+---
+ src/compiler/nir/nir_inline_helpers.h | 10 ++++++++--
+ src/compiler/nir/nir_opt_move.c       |  2 +-
+ 2 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/compiler/nir/nir_inline_helpers.h b/src/compiler/nir/ni=
r_inline_helpers.h
+index 125dd8a537c..ec33f0509f7 100644
+--- a/src/compiler/nir/nir_inline_helpers.h
++++ b/src/compiler/nir/nir_inline_helpers.h
+@@ -73,8 +73,8 @@ nir_foreach_dest(nir_instr *instr, nir_foreach_dest_cb=
 cb, void *state)
+    return _nir_foreach_dest(instr, cb, state);
+ }
+=20
+-static inline bool
+-nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
++static ALWAYS_INLINE bool
++_nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
+ {
+    switch (instr->type) {
+    case nir_instr_type_alu: {
+@@ -162,3 +162,9 @@ nir_foreach_src(nir_instr *instr, nir_foreach_src_cb=
 cb, void *state)
+    dest_state.cb =3D cb;
+    return _nir_foreach_dest(instr, _nir_visit_dest_indirect, &dest_stat=
e);
+ }
++
++static inline bool
++nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
++{
++   return _nir_foreach_src(instr, cb, state);
++}
+diff --git a/src/compiler/nir/nir_opt_move.c b/src/compiler/nir/nir_opt_=
move.c
+index 81bcde5c436..051c3cc6295 100644
+--- a/src/compiler/nir/nir_opt_move.c
++++ b/src/compiler/nir/nir_opt_move.c
+@@ -60,7 +60,7 @@ src_is_ssa(nir_src *src, void *state)
+ static ALWAYS_INLINE bool
+ instr_reads_register(nir_instr *instr)
+ {
+-   return !nir_foreach_src(instr, src_is_ssa, NULL);
++   return !_nir_foreach_src(instr, src_is_ssa, NULL);
+ }
+=20
+ static bool
+--=20
+2.34.1
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 710cacb09d..f02ef2dc2b 100644
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
+           file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error=
.patch \
            "
=20
 SRC_URI[sha256sum] =3D "b98f32ba7aa2a1ff5725fb36eb999c693079f0ca16f70aa2=
f103e2b6c3f093e3"
--=20
2.17.1


