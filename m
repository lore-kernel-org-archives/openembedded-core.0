Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3B0D5CCAC
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:55:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18741.1765878915564183724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=D132Da46;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=H89lYoE9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG85CJX2869698
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bNmNnX608rmBzwGHjkMkuPaYSeYANQnrbhcqem+v2UQ=; b=D132Da46rXcymURR
	dQRc/kgWstJljs6EV29Buq7Ks7N817u7iXJozjcxsKDoPCAVNE/NnyeTtbL6CKkf
	kKPrm4oF6d9SxtWGtkAwO0CP+IhNA1P7KmZv21fzZZKUhmb5IsIn8fcquVXs3WCs
	CrxtBvs8qSQoKHAD6wxZbtbIc8Q3gZycm+0obdyucEjBgoYHTYKsA9EFXlV1K5f7
	NkhIhyiGlIUqIXhdnKn472HYKLUTcN1yCF36ecBscKRxUQV4zyhRQTFrLY1jMSyW
	28Tfzs4B9lvLtm3eQGTx9yeS1ewZFHAZvgc6K8Ij4YcOclQxhvvYFI7mqMdO/ZMt
	7c2McQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33kw8h5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:55:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so146443591cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 01:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765878914; x=1766483714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNmNnX608rmBzwGHjkMkuPaYSeYANQnrbhcqem+v2UQ=;
        b=H89lYoE9w/W6kosvq2ThIn3hA0QFW60s6sYuA2rUQjcC2WXtmckqzkFol+Udb1ovrr
         R6/n+loOLujliLWFNf6JRfNrnjE16eVjtb4hxdncxK4FahFPEEa0Ru4iECjIv/kj/cN1
         61IQqtLbrFxRnhOqRxHvlcsfxEQ278vew7vZQWoeXURiCFievE93QbRm89FBwj38EjHY
         bA6mMR4LfFI2nZj1JofBNo/rPTUicTV7FXuXYKKc0fG6XS0oBxTRKfib+3qhxgz7848Q
         vv/6IPX+qUaUk5f4RH83C88yY2HUYCrraxdTV3mOsmmAjyLcQkv2C2FDaUayOb8vHmeg
         cVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765878914; x=1766483714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bNmNnX608rmBzwGHjkMkuPaYSeYANQnrbhcqem+v2UQ=;
        b=HXutoIB0rDceqd90eRcTmux0+jDOrv3pooR9pLa/Z3BBDVZK0sgyuFoRugNnREYb5c
         5xG56eCAPa4Ubi1bl+HxqpZxsHFotbCQuEBDiBKsa8J6OOYkzwmSwdGJO/++Zd+4BSto
         Y0Qg3EVfaqy5mM2FcPm/gaV71YtT2d7i+Bi3Ehem11beRqCruSzUzaTjMOSL2PqDSY2E
         +DUF/tIWLvM3ni/dEfNqHWXs7F7oJiW5uoqDumG3R9AH/7tGlPDk6Y10QMw5H0pO6OPJ
         pAtmgAw95f7HhQhC1XjkAX8GYdt7BGftggRELeZL0g/CsThwAAIpu/+se0lv+fNUOXAE
         hcXQ==
X-Gm-Message-State: AOJu0YyS5WMCYs2GKcvLvSGu5NvTb/0U5rJA38wbeuf0tVLDvC87NAfz
	SaXj9JEuXxi4FqzSV4o778iTvzVmV4GUZaE+vu+Jjv7wPGYjbyf+9RCwh/LAunO4BOo589GwhWl
	z1I/ChhQai0KMqHE2FYUo0gN/8mG/4dvnLuHEB0rr/kdAuDfexHr0Zplyr1Rpv5VZaXZ2GnJEjF
	u5BaaC78rsEKid9f3zdQ==
X-Gm-Gg: AY/fxX61ufHedjBwsueKqJCsS7ym9fGqPy8lYD+YPCJdqxz9BrhOLHG0mkCZsQqHiWr
	tJu8MFeGc1Tml20hGGQYQLGRUlp1QGH/UAxTzJn4pu1N92xF6txx9yG2F2zOu5pM+ox1siKWfMF
	0QZE3XptQAaEzlfSH1XGI9QAFROP7ygoAEnvWL783qLKOFfilK8/I6I3gdKo+KdC67JS0bppd/k
	JdHsbYgaRZ1i645gGVrJna3FZERbY5fj+N+Q8F5po3UZm63jZlCax2kk8hhpyBeLIpN2F73OceR
	loqTz2A0v0uvOpYBZbpD4FVNYAklhij6nQTjmnKyCKr/ORTlRlar8kzqg27hs4K2khm2yBKONQO
	jagui092f54dS+5utvCCpm2ly01JkevUW
X-Received: by 2002:ac8:5895:0:b0:4ee:256c:2654 with SMTP id d75a77b69052e-4f1d04c2debmr199407601cf.22.1765878913744;
        Tue, 16 Dec 2025 01:55:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHY3orz9PUmBe2sDGz+46+grL/YpJWD7r/mIVxOt7nhHMFUOiNKBWeM5ykiBAQFm/bIvW3SAg==
X-Received: by 2002:ac8:5895:0:b0:4ee:256c:2654 with SMTP id d75a77b69052e-4f1d04c2debmr199407321cf.22.1765878913259;
        Tue, 16 Dec 2025 01:55:13 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa5d0b0dsm1645389866b.67.2025.12.16.01.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 01:55:12 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH 1/2] python3-pyzstd: import 0.17.0 from meta-python
Date: Tue, 16 Dec 2025 10:54:58 +0100
Message-Id: <20251216095459.3551985-2-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216095459.3551985-1-koen.kooi@oss.qualcomm.com>
References: <20251216095459.3551985-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Authority-Analysis: v=2.4 cv=TLpIilla c=1 sm=1 tr=0 ts=69412c82 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=LvthVqE70BM-Z8hTy2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 8Ap-P7v1uNakan7rHDLgqQgsrdTnSXZq
X-Proofpoint-ORIG-GUID: 8Ap-P7v1uNakan7rHDLgqQgsrdTnSXZq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA4MiBTYWx0ZWRfX23za1DleIU/w
 /EIg/r+v57S3BQymI+IDvOYkxtBysxuI/a8u1q23qft5aluvUZWEx/cLuYnvo3OO6sh2XjqD6Ok
 P9AOCcVWmu84XXqb+AHwVcA8eIbnZElObVSCrOYPKxG8FPt+Rn3AnBU8vhxghNbV+VcbUU2g0eU
 fz+95k+BPGwSa8VqvvT42LUjX2xTwYmN8hxNSH5LOqlLfhhd2HV42snkPv9jCRgWVIaPUeVTSMP
 2AAl7gFiqoloxlGP3HfUtKkhGltAJ5fEvM3uniVFm9NAsKZvqMTvwmtJbNueFb9MVTa35ObuOSl
 2OentBPJkEBee58Cz6g0YzBK9JN4UB6esglXbMJ3tD+CA1s3YkiCIsQYw0TLmSX7O9O63A2PWrs
 p2YE607v92cV4QTOo9WGLPbXSsCTlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1011 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160082
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5BG85CJX2869698
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:55:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227936

From the upstream website:
	Pyzstd module provides classes and functions for compressing and
	decompressing data, using Facebook's Zstandard (or zstd as short name)
	algorithm.

This recipe is being moved over for systemd 258.x, the 'ukify' tool
depends on this.

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 ...-setuptools-dependency-from-74-to-89.patch | 27 +++++++++++++++++++
 .../python/python3-pyzstd_0.17.0.bb           | 19 +++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyzstd/0001-Bump=
-setuptools-dependency-from-74-to-89.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb

diff --git a/meta/recipes-devtools/python/python3-pyzstd/0001-Bump-setupt=
ools-dependency-from-74-to-89.patch b/meta/recipes-devtools/python/python=
3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-89.patch
new file mode 100644
index 0000000000..f7b43b12a7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-de=
pendency-from-74-to-89.patch
@@ -0,0 +1,27 @@
+From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Apr 2025 14:38:31 -0700
+Subject: [PATCH] Bump setuptools dependency from 74 to 89
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
++requires =3D ["setuptools>=3D64,<89"]
+ backend-path =3D ["build_script"]
+ build-backend =3D "pyzstd_pep517"
diff --git a/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb b/meta=
/recipes-devtools/python/python3-pyzstd_0.17.0.bb
new file mode 100644
index 0000000000..d93411beba
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
+SRC_URI +=3D "file://0001-Bump-setuptools-dependency-from-74-to-89.patch=
"
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


