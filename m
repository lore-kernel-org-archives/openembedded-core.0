Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FDAEE49BF
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 04:16:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.32476.1694146580528822039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 21:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=VNUU2ROg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7615c0968c=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3882VXUo007771
	for <openembedded-core@lists.openembedded.org>; Fri, 8 Sep 2023 04:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=Z0E95SdgtlrLGCX31V
	a/i6f9EKW77Ym1L+fTUoDbdSo=; b=VNUU2ROgF9Od41/1UUnEN+idNtS5KV3MJ1
	aFoQ23rxAdnMxSwwCe0GhNeeG6wQ8+RA0QyzRux1S3txRyDW8JnHNwpudVfAcxUV
	PfN+NeNtYPURaBbuVtvCXW/O2sm4TJsel6YG49cNnaC8BJSZ/GkeBtNriUOiQLFw
	I9vn3wulwPH1n/+Vso+7rgBLsi/QzYW1GJk/wjJs1t0c5lUPYa6njHErzpvk3XKs
	bnik6nq1y12zvZMq0vkfd9R8RjYxJLnsJAoV4fIc4vpyRx+EPaR5WUYEP9Tb/lV0
	euV1tlP6WD8N/RIxUJXyC7HGyINCLYBsX32uQAMBYRsNbNYKNpZQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k437s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 04:16:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 7 Sep 2023 21:16:15 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 7 Sep 2023 21:16:14 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH v2] fixup! python3-numpy: remove NPY_INLINE, use inline instead
Date: Fri, 8 Sep 2023 12:16:16 +0800
Message-ID: <20230908041616.3574595-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: Dri9xb_NYHz9m3ij4P4-cIJyLCvF8n09
X-Proofpoint-ORIG-GUID: Dri9xb_NYHz9m3ij4P4-cIJyLCvF8n09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_15,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=678
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309080037
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3882VXUo007771
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 04:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187402

From: Mingli Yu <mingli.yu@windriver.com>

 Fixes:
   /usr/lib/gcc/x86_64-redhat-linux/13/include/avx512fintrin.h:314:1: err=
or: inlining failed in call to 'always_inline' '_mm512_setzero_ps': targe=
t specific option mismatch
   314 | _mm512_setzero_ps (void)
       | ^~~~~~~~~~~~~~~~~
   numpy/core/src/umath/simd.inc.src:977:20: note: called from here
   977 |     @vtype@ zeros =3D _mm512_setzero_@vsuffix@();
       |                    ^~~~~~~~~~~~~~~~~~~
   numpy/core/src/umath/simd.inc.src:596:1: error: inlining failed in cal=
l to =E2=80=98always_inline=E2=80=99 =E2=80=98avx512_get_full_load_mask_p=
s=E2=80=99: target specific option mismatch
   596 | avx512_get_full_load_mask_ps(void)
       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
  numpy/core/src/umath/simd.inc.src:976:27: note: called from here
   976 |     @mask@ load_mask =3D avx512_get_full_load_mask_@vsuffix@();
       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src=
-Change-NPY_INLINE-to-inline.patch b/meta/recipes-devtools/python/python3=
-numpy/0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch
index d733dda333..73c9c79bdd 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src-Change=
-NPY_INLINE-to-inline.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src-Change=
-NPY_INLINE-to-inline.patch
@@ -117,7 +117,7 @@ index d6c9a7e..39aec9a 100644
 =20
  #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined NP=
Y_HAVE_SSE2_INTRINSICS
 -static NPY_GCC_OPT_3 NPY_INLINE NPY_GCC_TARGET_AVX512F void
-+static NPY_GCC_OPT_3 inline NPY_GCC_TARGET_AVX512F void
++static inline NPY_GCC_TARGET_AVX512F void
  AVX512F_@func@_@TYPE@(@type@ * op,
                        @type@ * ip,
                        const npy_intp array_size,
@@ -126,7 +126,7 @@ index d6c9a7e..39aec9a 100644
 =20
  #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined NP=
Y_HAVE_SSE2_INTRINSICS
 -static NPY_GCC_OPT_3 NPY_INLINE NPY_GCC_TARGET_AVX512F void
-+static NPY_GCC_OPT_3 inline NPY_GCC_TARGET_AVX512F void
++static inline NPY_GCC_TARGET_AVX512F void
  AVX512F_absolute_@TYPE@(@type@ * op,
                          @type@ * ip,
                          const npy_intp array_size,
--=20
2.25.1


