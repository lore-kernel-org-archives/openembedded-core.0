Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BA2D65526
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 09:34:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10995.1765964058345066302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 01:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=oJ0ZlbgM;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=dGl2cIQc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3w80b1903403
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjbBKTFlIlirHVHbdLn3VKQxqyDoNR+amTz08AP+Xrk=; b=oJ0ZlbgMTR2sLFJo
	Z8C22aej4C5jmAqZe0MeDShhQWUkzI1xMj7/Q+jFekDZyQH9O3HHB0AyjqgVGNfF
	biNdxNHH5vS6azHkeZjQUXEEsSydi/cNv1RMH9oogVBBLfnx5SBvdLoQJEhuCCzz
	bPEGGZF4arPJdTH+7anfTs1JG9QYYZAfZ99gSZNaT/26492btDkNZJ/+uvgVDccZ
	vEbgUG0wJTDX1wWaqgeV6QrOIr8tvXi2qe4ZHmBwWafurmKdvvWYJZ4Ppfj3ny9l
	DAGc2bGUSm4o2UUi/AiFiiQ1cYVswKu5qgAP6d4ji+zbCjEVa7InSmvnj8KvTlyC
	bfHuWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n3311jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:34:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb6a94873so102438261cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 01:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765964056; x=1766568856; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjbBKTFlIlirHVHbdLn3VKQxqyDoNR+amTz08AP+Xrk=;
        b=dGl2cIQcQCWhyH+t6icBxnKZ4Kf1f+hfOQg3AVI3yIzTZT34Eid2XhpjizEk9AM3o8
         lMF0RXIHnTVRDeLM+ngE1L+8rhdxyrfnHQfGnJPODWXsSTDaHHv3tgFedk3ncNcGxa7A
         qqHYSfftkbl9ASH7LXfWhcAREhsBknBq38xSSFyGhLIEoywMu5EfmCKdisY2EFYtbKO0
         8CqGqzGiOCCnHSHr8rtU0DqR3eE2y8aW5j5Ay0tvlWhhcRqTXptAiUuL410b26/03GZH
         2ZsFsgE9RQZfXOv/fcupErC4biMXH7NJ8uIkLljTBd7whPgprh6lSKLdEJvs8aUEHmUq
         XQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765964056; x=1766568856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yjbBKTFlIlirHVHbdLn3VKQxqyDoNR+amTz08AP+Xrk=;
        b=H3m0+ZkvJXoZg37PJEES5UIbtu6EkdCUVRaaVOa/zkC9Zx/H81WH+eedZZgoQXDZ+L
         DLjHUS/1PuKZHI2z+mlyD4jEq2OfW2DR+lcbSgsdLqqw3ukr1vhPN0dt12YQW78AmLR9
         VsINR7mVlTyBbzB6Vq1hVHAcUuGrvFnSPf2eIQxl3t6llyvG4TaTqtYKOSzaz1CbBmjt
         AQ+hc5LzOPctMS9gwoUo2JWB+mRGKgnIyXkW7a7/yRtgVl4F/GpJ8i+gRMGVKYPFU61W
         s7iYaowL6KxVd7Q6ZvsqrpP/tvG5nAC+hqPd39ygoaKF6xZCTxiS2Tv8gJwswlVtQR8U
         q7Nw==
X-Gm-Message-State: AOJu0Yxe+VUjfmsc+3COWeflBoruXIGhz0KKXzbYXfODhEXIT8xGOvGB
	F2m5ZYX+LshAqdGOD9YuU2oZc3KlPSU48tDJXv2TNLIYJjO3gqoRD3zRSx/UKP71VffDksAa7Xp
	alBPUElGXSaqA7f3Vn7QWtJE9QIIGRcc/6dGuvAvjjtZGAlK430rVmZWTz9M6TP0Bpe8bUCCeCI
	AhttWBxIJRnmmX+FIZHA==
X-Gm-Gg: AY/fxX5GuZmUOmoge9+C1T82v9YVV7Qve12db3itD27m6LBYnftQKVhUdMtCq+irgHw
	/drrOlrwpNrQNkrV86GeouD5EJnryJEl3OuPCFowmWmx9wG/l30aHqb+yrPoaPHXpFGbOpQM/jC
	suUhICAg3NoH4GkxV4nYZv8fCIUDuOAEIs9uh04VFSF3ZiakYv1/FKOr2YcRTDdY+JPakh66ObZ
	whLJ1jVIQUXCQyv1I6gyqlV45ryQYacnLqLwp1BlJNiMb024rvcMLDNCBaK+K57+lBGCl2Z0iHh
	gkVHRGdnqeMp3Ytgg0XeUGO+nXklPAeS9jgIi9Ri4lUYibgUKlXd0u6aDAk2jQx46wg1YcOZbPx
	zRiLfaalVdYIF8q0eNbb6djPJxfwCeu9L
X-Received: by 2002:a05:622a:4293:b0:4f1:ca82:f1e8 with SMTP id d75a77b69052e-4f1d0466021mr207064701cf.7.1765964056405;
        Wed, 17 Dec 2025 01:34:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsrTJy6zEmsa/Cvenb0DIwDSATRxc7tXBVhtRcKtALtVsfQMRSwqUmDsDeiljSYf3MT6fbtA==
X-Received: by 2002:a05:622a:4293:b0:4f1:ca82:f1e8 with SMTP id d75a77b69052e-4f1d0466021mr207064461cf.7.1765964055804;
        Wed, 17 Dec 2025 01:34:15 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa29bea0sm1938143866b.8.2025.12.17.01.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:34:15 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH v2 1/2] python3-pyzstd: import 0.17.0 from meta-python
Date: Wed, 17 Dec 2025 10:34:08 +0100
Message-Id: <20251217093409.914045-2-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217093409.914045-1-koen.kooi@oss.qualcomm.com>
References: <20251217093409.914045-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NSBTYWx0ZWRfX775RHcGlUi//
 cENDuDUA5bX7zcetxuYVnZPCQpvmFnbnD8US5HHYXQDuA4R0Mzt/wppKIIYFbmdxod9YhwQgJFa
 J+VxyTxoAJZFOUO1ywtqxQ8TIl4KSivM3EPwmGNKJyXrtUG6UnOpn5/iKjQpfXU1s1t/DttrDqs
 3fa1hvahwozmd6728omWp5GzUdbhwt+fh0h99PBExW+Z9UmcE3xKSHVVzyyP8MtDPdUCkzFTx0r
 rLLHPT4jLWNz4l3HVwiXC5o2EUkOxxWIHei6w7usEdKGm45HCTJC6QkMs1eWT6Yh2r6LyZPIKKy
 BEUU8VPVh3pjhkaO4icS3hgRo3FXhGzTHYev4ZpQx9kG8LIs5cGamtB6V+yhjusgfbRSE7f99j7
 TiAx/CGUWjxTAclDGsUXuUATZpgshw==
X-Proofpoint-GUID: 2j4YvNPZqFpgOrrUb0H3ThShu5zFQ28_
X-Proofpoint-ORIG-GUID: 2j4YvNPZqFpgOrrUb0H3ThShu5zFQ28_
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=69427919 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=LvthVqE70BM-Z8hTy2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170075
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5BH3w80b1903403
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 09:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228012

From the upstream website:
	Pyzstd module provides classes and functions for compressing and
	decompressing data, using Facebook's Zstandard (or zstd as short name)
	algorithm.

This recipe is being moved over for systemd 258.x, the 'ukify' tool
depends on this.

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---

Changes since v1:
 * Adjusted pyzstd patch to not specify an upper limit to the setuptools
   version, as suggested by Alexander Kanavin.

 ...emove-setuptools-version-limit-of-74.patch | 27 +++++++++++++++++++
 .../python/python3-pyzstd_0.17.0.bb           | 19 +++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-Remo=
ve-setuptools-version-limit-of-74.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb

diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setu=
ptools-version-limit-of-74.patch b/meta/recipes-devtools/python/python3-p=
yzstd/0001-Remove-setuptools-version-limit-of-74.patch
new file mode 100644
index 0000000000..f2910322ff
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyzstd/0001-Remove-setuptools-=
version-limit-of-74.patch
@@ -0,0 +1,27 @@
+From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Apr 2025 14:38:31 -0700
+Subject: [PATCH] Remove setuptools version limit of '74'
+
+Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
+support beyond that which is needed for python 3.9 on windows. We
+do not have this problem on Linux
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index dd885e4..5d4d511 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ [build-system]
+ # setuptools 64+ support --build-option
+ # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 =
under Windows
+-requires =3D ["setuptools>=3D64,<74"]
++requires =3D ["setuptools>=3D64"]
+ backend-path =3D ["build_script"]
+ build-backend =3D "pyzstd_pep517"
diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb b/meta=
/recipes-devtools/python/python3-pyzstd_0.17.0.bb
new file mode 100644
index 0000000000..0ed6cd47c7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "Pyzstd module provides classes and functions for compre=
ssing and \
+decompressing data, using Facebook=E2=80=99s Zstandard (or zstd as short=
 name) algorithm."
+HOMEPAGE =3D "https://github.com/animalize/pyzstd"
+SECTION =3D "devel/python"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daedb5a2679cd1552fb61c181ef974=
b9e"
+
+PYPI_PACKAGE =3D "pyzstd"
+
+SRC_URI +=3D "file://0001-Remove-setuptools-version-limit-of-74.patch"
+SRC_URI[sha256sum] =3D "d84271f8baa66c419204c1dd115a4dec8b266f8a2921da21=
b81764fa208c1db6"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+# clang-16 with -flto segfaults on arm, therefore ignore flto for now
+do_configure:append:arm:toolchain-clang() {
+    sed -i -e "s|'-flto'|''|" ${S}/setup.py
+}
--=20
2.34.1


