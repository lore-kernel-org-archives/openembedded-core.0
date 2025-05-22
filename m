Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E65C54FC6
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:46:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.25575.1747925173862123918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=RaJ/ccXQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M9FqVk004048
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UB2pvuuH/OpgDeOjGaS/PfvbG+PXqbZyKZicP6HY34Y=; b=RaJ/ccXQgAHH85R9
	L4nNE2DryiFURPiE4p4/0QL3yawMqlN4O+J4O/RoCPcuhGgXDkJyZyt8KGndBDWs
	8t+H8IOOAxN6ZkZoTYf8s93iL7B1tGLIs80ajotT87DaK6bePe78pI5W8TyefMSi
	AY9vOz3r3qAhpoI9wgX62uv9+d4ibdgnkMSbmTSXhEBqcI7pmdk78SLdUtZNDd0C
	oVZsHE5eDS5Wth7/hWZtZlxl9o0ZfLDf9JfY6Z2MD2x4pLkZ0RgA1Ny2UtR0N172
	7+eSaNOvo0d6bd+PpTvWnCzEU8QNoQflMLiFJnxY/a0qdQxV84n688AWTHBuXDNU
	liu7+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4xmmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caef20a527so1198668285a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925172; x=1748529972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UB2pvuuH/OpgDeOjGaS/PfvbG+PXqbZyKZicP6HY34Y=;
        b=AIrasRJQWhTn41AoaDPTc7wClHX+3k7DDmBLlrA+1OcwVsV8tBcsAsdrSI6icuHpwT
         AK9zQZBGnVQ4s8spugmXp9nXBJIaqrgZZmb814FJeQDP0Zg2tR29aWkSmdsAMpKZ8sM0
         ccsHQpAUnqDEz2vMjeiQuQkg0t7oEIYzIb1rJXAd7S38Qjje7vZ99/bW2XUm5/owfOUY
         r5F97hZVTKL06cROLzi4BIKF64VgNKIHRCHTfNsefVPZco5doR0ngSp2/fFrdmVQ36TS
         ShJZzfWSMsJg3QzzoRP/cOaibmjDnswD2h78kdSRucoH2cXtF4gtwdqRcDjTnWxnRC8+
         O2Fg==
X-Gm-Message-State: AOJu0Yw5+Cu6mUz9Oc+qGQiVOrVHvFlX9tCvE+WUblA9t+jISBG68vmp
	kUqRcDXV7YjtE83Q9WuodScewOzRUVHd/VLwiWcB32JJtPkzcQ5KWdZbhZMnL2FnLYXL+3khOsu
	AIaKWmTTrPkCnVzspBBQA47MZSHwiPg63L7oQTRlJ5hcFKVOZL1MJ8Yj4rHe8+fka1DoBl8veXs
	7j6+Wmqqjb4S2o5a4=
X-Gm-Gg: ASbGncsceURiz+CVogCe0EJFwr5jH+seQDsND4J/6c2FsBe+ysuiKtO+bDXCyl+1xez
	mBhK2TAEUo5GNq+gqiDE/xCi87Axi1KPZcPk44kxyvCewMItYJwuxuZN26GYxXTjBQ2WmdGqjxt
	eL2uI5x9C1dnAFlYpoOl5wFLKX2bhtGlkedyzjLcWozOAFA4GJe7xO9dQafbEQib/yzrfhmHIgf
	eKN2sOpp+ANEOXKy7FaJPK78v1hKMqjhLE8dMPe8xSfkb5r9NwlBLT7ASFobWBqF0zjTIIcE56f
	QFWCs+mhvvuBpPk5tj1hMAoKcrvtBvLZjKesyggKuz4n0e0mJ7hm/nzeLX3JypSSUnibHIMuMPO
	Ag1aOR1niv5ODYryGTGBB1uW5
X-Received: by 2002:a05:620a:d87:b0:7c5:3d60:7f91 with SMTP id af79cd13be357-7cd47f11736mr3138282685a.15.1747925171733;
        Thu, 22 May 2025 07:46:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECvROoLVxuU86D9THiw71B9xxTWprNSUwgjMxN3F2RbTQThQ4NNnd9XAKqaKTnWDBzTnqbkg==
X-Received: by 2002:a05:620a:d87:b0:7c5:3d60:7f91 with SMTP id af79cd13be357-7cd47f11736mr3138279785a.15.1747925171371;
        Thu, 22 May 2025 07:46:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm33031551fa.44.2025.05.22.07.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:46:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@gmail.com>
Subject: [PATCH v2 04/12] mesa: fold GL ES 3 packages into GL ES 2 ones
Date: Thu, 22 May 2025 17:45:57 +0300
Message-Id: <20250522144605.2876771-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-GUID: WSo2-T9QRerwcFt-FMDaDB_Nj_DNUZpt
X-Proofpoint-ORIG-GUID: WSo2-T9QRerwcFt-FMDaDB_Nj_DNUZpt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MCBTYWx0ZWRfX33LtMzLPhY1g
 8YAOiVusJtK7F2kjXCKoQAbOl5dHZlQ1CEYlrJ+qRt9VMzXGdFyI8owZyq2Ry9narmTdEmWbEE6
 iPSxnhnaDQSwS4no9LDyC+6Oif2AewsYqzVHlc2hrz0wziLwRacSUwASY6Mdi4buO4ZR/Cf2koI
 8vFBgRuTRMvpPw5UnTNeFq0r512Y0mIJr6PmZ0NVwz7LWjquEEaz49xnj+1SOJEzQ30emdFAwjk
 AOGHWjm5QKiaKlfWe60ypyVIDjB3QZL8CBzRSTx9U8/vHsUnRH4NvdkDnOgYeemx+kzSzv+aRXu
 dz53G3e6EsVip3BiAjm58K4EwXzxjlgrMHQRPSfDtqvaMUVeXcQbze3bpLqNUJEcXGmxkSJ2YCV
 UxZNyLDey/HGfXX+iIhbIhUzOEsKb+p6TwvXC9vBKHvvEmxB+S5AwdreBdNSflf16xZDuXiA
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682f38b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Wm-pHqCzE9DZxLNbtkMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=765 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220150
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 54M9FqVk004048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217115

OpenGL ES 3 is closely tied to the OpenGL ES 2: there is no separate
library, one can use GL ES 2 headers for GL ES 3 app, etc. Instead of
having separate packages, merge GL ES 3 packages into GL ES 2 ones.

Suggested-by: B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszor@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
index 89fa19a5668f..a856d11e0734 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -232,17 +232,10 @@ CFLAGS:append:armv6 =3D " -DMISSING_64BIT_ATOMICS"
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 DEV_PKG_DEPENDENCY =3D ""
=20
-# Khronos documentation says that include/GLES2/gl2ext.h can be used for
-# OpenGL ES 3 specification as well as for OpenGL ES 2.
-# There can be applications including GLES2/gl2ext.h instead of GLES3/gl=
3ext.h
-# meaning we should probably bring in GLES2/gl2ext.h if someone asks for
-# development package of libgles3.
-RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
-
 # GLES2 and GLES3 implementations are packaged in a single library in li=
bgles2-mesa.
 # Add a dependency so the GLES3 dev package is associated with its imple=
mentation.
-RDEPENDS:libgles2-mesa +=3D "libgles3-mesa"
-ALLOW_EMPTY:libgles3-mesa =3D "1"
+RPROVIDES:libgles2-mesa +=3D "libgles3-mesa"
+RPROVIDES:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
=20
 RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'ope=
ncl', 'libclc spirv-tools spirv-llvm-translator', '', d)}"
=20
@@ -254,7 +247,6 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
-             libgles3-mesa libgles3-mesa-dev \
              libopencl-mesa libopencl-mesa-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
@@ -279,8 +271,7 @@ python __anonymous() {
               ("opengl", "libgl", "libgl1"),
               ("glvnd", "libglx",),
               ("gles", "libgles1", "libglesv1-cm1"),
-              ("gles", "libgles2", "libglesv2-2"),
-              ("gles", "libgles3",),
+              ("gles", "libgles2", "libglesv2-2", "libgles3"),
               ("opencl", "libopencl",)):
         if not p[0] in pkgconfig:
             continue
@@ -354,8 +345,7 @@ FILES:libgl-mesa-dev =3D "${libdir}/libGL.* ${include=
dir}/GL ${libdir}/pkgconfig/g
 FILES:libglx-mesa-dev =3D "${libdir}/libGLX*.*"
 FILES:libglapi-dev =3D "${libdir}/libglapi.*"
 FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.* ${includedir}/GLES $=
{libdir}/pkgconfig/glesv1*.pc"
-FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 $=
{libdir}/pkgconfig/glesv2.pc"
-FILES:libgles3-mesa-dev =3D "${includedir}/GLES3"
+FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.* ${includedir}/GLES2 $=
{includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
 FILES:libopencl-mesa-dev =3D "${libdir}/lib*OpenCL.so"
 FILES:libxatracker-dev =3D "${libdir}/libxatracker.so ${libdir}/libxatra=
cker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_co=
mposite.h ${includedir}/xa_context.h \
--=20
2.39.5


