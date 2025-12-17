Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A37D65C60
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:08:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16724.1765984113532354848
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=PDXc+7vn;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=e7SaflmF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKnWD2764392
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjbBKTFlIlirHVHbdLn3VKQxqyDoNR+amTz08AP+Xrk=; b=PDXc+7vnLkJF2n1n
	5vyisEFgqFNvTQ+2h4V4toc1nyv4+dG5DRNiiNd1cn9y+FA2LUXZZX1jZK78kt3g
	oKviRBGtSfJCLCH4ok7pfGYq9gQ7CcNZP5Jvhl9VfsGzzLRoB+HJwVt1Nf3YjqwT
	vzjhwKi8tNo9Wlnavjjsn9zoBSyWuVBotEDKi9GR6sYorGC7zGEgwz+4mpSPMTI/
	fQ+cW9OrutIUnF7vacdEUFY8fRKiptAILAswgLqRbfKJgNFQyqQcDLSrMZkl+m8I
	nHj/nGLTBd4ESjZrGVvlBlbQ05pP2ti6S/fjKhR1QrKICN9tLOHE0XhB0r7JFk+b
	WdEAhQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefjv0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:08:32 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-78aa57a8157so86195417b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765984112; x=1766588912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjbBKTFlIlirHVHbdLn3VKQxqyDoNR+amTz08AP+Xrk=;
        b=e7SaflmF0pM2YURzxiYRITA6qZqiQKaSgY9SOYts44fwB1MMMeeVHH/zqQ0rHWxe0q
         JDH1aq++u6PW+v6dKqsBhlPrIkAWyrCybRmZ/aao6buwaH6nHtygSr/6f6P5JG+oBXQu
         LSjxzFh3O1SrBw2eUf0zEa82uOA16wq43PZMOZF94yOCROvAQ1hviUzda1/1xfljKTfp
         v9cVtubniEKK1Re/XJjjLyfPeTMopHaztoR9dkinvv6Ug2m7saJ9KtkbP3L3JX7Bl/A4
         1f1kXV0rvsq0QU40cLScLun5Ak1OJuXME8g7bH6817QAb8DMdhcL/PH35oJsm4bQQYpZ
         de9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765984112; x=1766588912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yjbBKTFlIlirHVHbdLn3VKQxqyDoNR+amTz08AP+Xrk=;
        b=LyLvlOwCFo+i+w5937HkfgMMrLjZ8Qy0nrqrphgwk+VjGSQzteOIGxQXGTHXmLsdjX
         h2GJ/URPIoa0+Cxon179TvdwdcEnC8vsvA5EB9q0yuMan2qrJ0vEg/At6R6XCCNgZf2y
         H19VpDfePl7b/o/8oejOyBCtA87cDWQaU4q52buJdXLkqL0rbBMVmwQOnXqGtBcsShQ1
         5Y/lEwCJ9y93nuLVG1fd5h6pdok1egMTVDXZi8+Z5WuFsnsZ+R++nJRPyK1MTFavIHf9
         QNkPpG/JICbO8oeeb3iWU88X6fO8wWFye9RYndgJBB921DAtQXjyin37d18JdTprjaxu
         POAw==
X-Gm-Message-State: AOJu0Yx8MK3DjqmmiTTLxNYFov12DVwjpl6UEHEHCfo674aU6kJmt2qk
	pS+53QX78jJ1fIQE5ZSstoXygsUmhYlccjub/4Kgvb6Q8LeRdVIj4ouQKcyW/x/Ckbju/+JIKo9
	2qvcvFOw/9+W2xgU+UpU+LvDOR53/45o0VRjfcqrmghP4GxfU6ZilEZBptRnb0oMtLEIPGx1zHQ
	al1gW4B0DfrottVhdLYA==
X-Gm-Gg: AY/fxX72BselOmv2okqnbYtELy/jW4zx/E0AWBixg4EozvcW7mg+b4c8xvmUi5V/3cv
	jikCM/J4XPk/rwJ2u4Mhji1dFGIn4ouBEjfYarW+8UA7PZTQjVL8srLVYYJ8F73Gg2QeGkt7Tyy
	4KXbCQjmfEuvnH7d/OSD/HklGmefM1BKpnvG/OUXbsCJH8ofnl+yjZpnfp/9JeCv7M6SYHhORpJ
	byhZ2adZRazoaywj7mwijRato/SrBuEQ23EzCP4AyRISrcI0qxHkyiQG/MZKvXPe8Zn/HKNw245
	NspqKfU315o19nPVNcPp3BgidoClnPK5wU5YZ9rkCkpgSrNr/0K5vCqEXwa5K/vRxQGTxSnuUNe
	NWKelWe5NpDLzCj4wfEJSApxp9OrPx3qV
X-Received: by 2002:a05:690c:f95:b0:786:a0fb:fa8e with SMTP id 00721157ae682-78e66d7d17bmr139768107b3.15.1765984111697;
        Wed, 17 Dec 2025 07:08:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQBFTMTthyT9FaQjwDzr1ZhsgmDiOb0V07/OQtHKM9yDyGzC5VIIKheiw72uKI0F7VvJhuTQ==
X-Received: by 2002:a05:690c:f95:b0:786:a0fb:fa8e with SMTP id 00721157ae682-78e66d7d17bmr139767857b3.15.1765984111203;
        Wed, 17 Dec 2025 07:08:31 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b801cbac4c5sm52792066b.59.2025.12.17.07.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:08:30 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH v3 1/3] python3-pyzstd: import 0.17.0 from meta-python
Date: Wed, 17 Dec 2025 16:08:26 +0100
Message-Id: <20251217150828.1044438-2-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251217150828.1044438-1-koen.kooi@oss.qualcomm.com>
References: <20251217150828.1044438-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExOSBTYWx0ZWRfXy18mKweFRFHh
 aNx3b4UB1OO3n+fOwkXkv2fmgBIFqtxk1oti3x8i6Oyf1OvDdlNyxRc2+1h0QfG6XLi50YHVBAa
 fbFBMFpy6SCuKgWQX4pMe4JkuerqxQrtHjVTJd8B3YMr7qYa5dVwqzASOC21eBDCtX5INSqqF9E
 fyu81Rf0qycrnMbPUmgCGmgBtoEMUeSS/wgCtsoC/wamjWvsRiOlezstxIJ2fFfwYLfzX5akB/J
 HJ33HTJGhT8Q5R43JjuVOLAsQ3MdMy7Zl1IGtVcsVs5PxNBHNw4NQFzgxnW1jRF8OuvyfFgPbhY
 mm2hXE4wp5L78xLEdwAvRKcShRsxzMf9+gEQQBsQC4rEMm6TnqggI5tbqpRDobMeRCUDbw0vDis
 diWWi+/smmtZlnj+seWmGLRP61efHw==
X-Proofpoint-ORIG-GUID: qV6HSgtkIEbe7wAPc7WBhk1OEDkDL51o
X-Proofpoint-GUID: qV6HSgtkIEbe7wAPc7WBhk1OEDkDL51o
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=6942c770 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=LvthVqE70BM-Z8hTy2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170119
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5BHCKnWD2764392
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228051

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


