Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0071EEB64D7
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 03:29:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.870.1688009353752302137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 20:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6544e6c4c4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35T2Y4mc011300
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 03:29:12 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb4g7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 03:29:12 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 20:29:11 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 20:29:10 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH] python3-numpy: remove NPY_INLINE, use inline instead
Date: Thu, 29 Jun 2023 11:29:09 +0800
Message-ID: <20230629032909.1983231-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: TWNamzrJv2_CkMEhPY4zD9VnrTc8S7Pi
X-Proofpoint-GUID: TWNamzrJv2_CkMEhPY4zD9VnrTc8S7Pi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_14,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 mlxlogscore=749 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306290029
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35T2Y4mc011300
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 03:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183605

From: Mingli Yu <mingli.yu@windriver.com>

The build fails when DEBUG_BUILD is enabled with GCC-13 as [1] and [2].

Fixes:
   | numpy/core/src/umath/simd.inc.src:977:20: note: called from here
   | 977 |     @vtype@ zeros =3D _mm512_setzero_@vsuffix@();
      |                    ^~~~~~~~~~~~~~~~~~~
   | numpy/core/src/umath/simd.inc.src:596:1: error: inlining failed in c=
all to =E2=80=98always_inline=E2=80=99 =E2=80=98avx512_get_full_load_mask=
_ps=E2=80=99: target specific option mismatch
  596 | avx512_get_full_load_mask_ps(void)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   | numpy/core/src/umath/simd.inc.src:976:27: note: called from here
  976 |     @mask@ load_mask =3D avx512_get_full_load_mask_@vsuffix@();
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   | /usr/lib/gcc/x86_64-redhat-linux/13/include/avx512fintrin.h:6499:1: =
error: inlining failed in call to =E2=80=98always_inline=E2=80=99 =E2=80=98=
_mm512_loadu_si512=E2=80=99: target specific option mismatch

Reference: https://github.com/numpy/numpy/pull/22674/commits/3947b1a023a0=
7a55522de65b4d302339bac2bad7

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D859667866=
7797971559aed962b1c204266032186
[2] http://errors.yoctoproject.org/Errors/Details/689841/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ....inc.src-Change-NPY_INLINE-to-inline.patch | 135 ++++++++++++++++++
 .../python/python3-numpy_1.24.2.bb            |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-simd.=
inc.src-Change-NPY_INLINE-to-inline.patch

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src=
-Change-NPY_INLINE-to-inline.patch b/meta/recipes-devtools/python/python3=
-numpy/0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch
new file mode 100644
index 0000000000..d733dda333
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src-Change=
-NPY_INLINE-to-inline.patch
@@ -0,0 +1,135 @@
+From f2a722aa30a29709bb9b5f60fc6d20a10fe6b4f5 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 28 Jun 2023 17:58:52 +0800
+Subject: [PATCH] simd.inc.src: Change NPY_INLINE to inline
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+  | numpy/core/src/umath/simd.inc.src:977:20: note: called from here
+  | 977 |     @vtype@ zeros =3D _mm512_setzero_@vsuffix@();
+      |                    ^~~~~~~~~~~~~~~~~~~
+  | numpy/core/src/umath/simd.inc.src:596:1: error: inlining failed in c=
all to =E2=80=98always_inline=E2=80=99 =E2=80=98avx512_get_full_load_mask=
_ps=E2=80=99: target specific option mismatch
+  596 | avx512_get_full_load_mask_ps(void)
+      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  | numpy/core/src/umath/simd.inc.src:976:27: note: called from here
+  976 |     @mask@ load_mask =3D avx512_get_full_load_mask_@vsuffix@();
+      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  | /usr/lib/gcc/x86_64-redhat-linux/13/include/avx512fintrin.h:6499:1: =
error: inlining failed in call to =E2=80=98always_inline=E2=80=99 =E2=80=98=
_mm512_loadu_si512=E2=80=99: target specific option mismatch
+
+Upstream-Status: Inappropriate [The file simd.inc.src have been removed =
in new version as
+                                https://github.com/numpy/numpy/commit/64=
0e85017aa8eac3e9be68b475acf27d623b16b7]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ numpy/core/src/umath/simd.inc.src | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/numpy/core/src/umath/simd.inc.src b/numpy/core/src/umath/si=
md.inc.src
+index d6c9a7e..39aec9a 100644
+--- a/numpy/core/src/umath/simd.inc.src
++++ b/numpy/core/src/umath/simd.inc.src
+@@ -61,11 +61,11 @@
+  */
+=20
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined NP=
Y_HAVE_SSE2_INTRINSICS
+-static NPY_INLINE NPY_GCC_TARGET_AVX512F void
++static inline NPY_GCC_TARGET_AVX512F void
+ AVX512F_@func@_@TYPE@(@type@*, @type@*, const npy_intp n, const npy_int=
p stride);
+ #endif
+=20
+-static NPY_INLINE int
++static inline int
+ run_unary_avx512f_@func@_@TYPE@(char **args, const npy_intp *dimensions=
, const npy_intp *steps)
+ {
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined NP=
Y_HAVE_SSE2_INTRINSICS
+@@ -99,11 +99,11 @@ run_unary_avx512f_@func@_@TYPE@(char **args, const n=
py_intp *dimensions, const n
+  */
+=20
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512_SKX_WITH_INTRINSICS && defined=
 NPY_HAVE_SSE2_INTRINSICS && @EXISTS@
+-static NPY_INLINE NPY_GCC_TARGET_AVX512_SKX void
++static inline NPY_GCC_TARGET_AVX512_SKX void
+ AVX512_SKX_@func@_@TYPE@(npy_bool*, @type@*, const npy_intp n, const np=
y_intp stride);
+ #endif
+=20
+-static NPY_INLINE int
++static inline int
+ run_@func@_avx512_skx_@TYPE@(char **args, npy_intp const *dimensions, n=
py_intp const *steps)
+ {
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512_SKX_WITH_INTRINSICS && defined=
 NPY_HAVE_SSE2_INTRINSICS && @EXISTS@
+@@ -144,7 +144,7 @@ sse2_@func@_@TYPE@(@type@ *, @type@ *, const npy_int=
p n);
+=20
+ #endif
+=20
+-static NPY_INLINE int
++static inline int
+ run_@name@_simd_@func@_@TYPE@(char **args, npy_intp const *dimensions, =
npy_intp const *steps)
+ {
+ #if @vector@ && defined NPY_HAVE_SSE2_INTRINSICS
+@@ -169,7 +169,7 @@ sse2_@kind@_@TYPE@(npy_bool * op, @type@ * ip1, npy_=
intp n);
+=20
+ #endif
+=20
+-static NPY_INLINE int
++static inline int
+ run_@kind@_simd_@TYPE@(char **args, npy_intp const *dimensions, npy_int=
p const *steps)
+ {
+ #if @vector@ && defined NPY_HAVE_SSE2_INTRINSICS
+@@ -205,7 +205,7 @@ static void
+ sse2_reduce_@kind@_BOOL(npy_bool * op, npy_bool * ip, npy_intp n);
+ #endif
+=20
+-static NPY_INLINE int
++static inline int
+ run_binary_simd_@kind@_BOOL(char **args, npy_intp const *dimensions, np=
y_intp const *steps)
+ {
+ #if defined NPY_HAVE_SSE2_INTRINSICS
+@@ -220,7 +220,7 @@ run_binary_simd_@kind@_BOOL(char **args, npy_intp co=
nst *dimensions, npy_intp co
+ }
+=20
+=20
+-static NPY_INLINE int
++static inline int
+ run_reduce_simd_@kind@_BOOL(char **args, npy_intp const *dimensions, np=
y_intp const *steps)
+ {
+ #if defined NPY_HAVE_SSE2_INTRINSICS
+@@ -245,7 +245,7 @@ static void
+ sse2_@kind@_BOOL(npy_bool *, npy_bool *, const npy_intp n);
+ #endif
+=20
+-static NPY_INLINE int
++static inline int
+ run_unary_simd_@kind@_BOOL(char **args, npy_intp const *dimensions, npy=
_intp const *steps)
+ {
+ #if defined NPY_HAVE_SSE2_INTRINSICS
+@@ -875,7 +875,7 @@ NPY_FINLINE NPY_GCC_OPT_3 NPY_GCC_TARGET_@ISA@ @vtyp=
e@d
+  */
+=20
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512_SKX_WITH_INTRINSICS && defined=
 NPY_HAVE_SSE2_INTRINSICS
+-static NPY_INLINE NPY_GCC_TARGET_AVX512_SKX void
++static inline NPY_GCC_TARGET_AVX512_SKX void
+ AVX512_SKX_@func@_@TYPE@(npy_bool* op, @type@* ip, const npy_intp array=
_size, const npy_intp steps)
+ {
+     const npy_intp stride_ip =3D steps/(npy_intp)sizeof(@type@);
+@@ -954,7 +954,7 @@ AVX512_SKX_@func@_@TYPE@(npy_bool* op, @type@* ip, c=
onst npy_intp array_size, co
+  */
+=20
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined NP=
Y_HAVE_SSE2_INTRINSICS
+-static NPY_GCC_OPT_3 NPY_INLINE NPY_GCC_TARGET_AVX512F void
++static NPY_GCC_OPT_3 inline NPY_GCC_TARGET_AVX512F void
+ AVX512F_@func@_@TYPE@(@type@ * op,
+                       @type@ * ip,
+                       const npy_intp array_size,
+@@ -1001,7 +1001,7 @@ AVX512F_@func@_@TYPE@(@type@ * op,
+ /**end repeat1**/
+=20
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined NP=
Y_HAVE_SSE2_INTRINSICS
+-static NPY_GCC_OPT_3 NPY_INLINE NPY_GCC_TARGET_AVX512F void
++static NPY_GCC_OPT_3 inline NPY_GCC_TARGET_AVX512F void
+ AVX512F_absolute_@TYPE@(@type@ * op,
+                         @type@ * ip,
+                         const npy_intp array_size,
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-numpy_1.24.2.bb b/meta/=
recipes-devtools/python/python3-numpy_1.24.2.bb
index bfcfc52729..5f88948de2 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.24.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.24.2.bb
@@ -10,6 +10,7 @@ SRCNAME =3D "numpy"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz =
\
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-defau=
lt-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
+           file://0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] =3D "003a9f530e880cb2cd177cba1af7220b9aa42def9c4afc2a=
2fc3ee6be7eb2b22"
--=20
2.25.1


