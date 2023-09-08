Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C12EE49AD
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 04:13:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.32435.1694146385379646756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 21:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=s9rNOfiy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7615c0968c=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3883ZiVt018347
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Sep 2023 21:13:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=r+vqrP+da/z6LJj15M
	mGBwWvpjQFfN4Y+5NvVK3XpHg=; b=s9rNOfiydf9Sb/UuhwJsFUY1oF1T6OaYJc
	ueRkgcdlGARe49WyuyxLejLYt5gn+wne8q6zUuO0Gv71fJUvvuczpzYAjnqjntDC
	fI5JvQ/3l0pmmijndL78QvGv4NslRpZHoDSrjUzQMHY0WEHPlw8pg2Wn0+7OdSaB
	OORI76po6cStN0glB5XPFnNdUaIdVSaDxYFjmzz8Mr8LOiqhwcKSJlwpGMzvGHVM
	FLNj+HIkk6dACRubzpXSK6dGpMOb2KuH+AEAtL5Tsh9KMir2N1CwrBdKVQur+NVF
	rjGnLc+zZkppRNOUfF444QceRBv5p35WW0RPKhjAg1VZL/whAF1Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv0b054r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 21:13:04 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 7 Sep 2023 21:13:01 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 7 Sep 2023 21:13:00 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH] fixup! python3-numpy: remove NPY_INLINE, use inline instead
Date: Fri, 8 Sep 2023 12:13:02 +0800
Message-ID: <20230908041302.3117228-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 4_qiJiR1Y8FogmX-4BNgj4axCCEA_Qj-
X-Proofpoint-GUID: 4_qiJiR1Y8FogmX-4BNgj4axCCEA_Qj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=679
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309080038
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3883ZiVt018347
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 04:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187401

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


