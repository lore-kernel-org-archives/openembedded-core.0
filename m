Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277A8D767FC
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 12:01:19 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15344.1766145677782248381
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 04:01:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=Mt+KPlNf;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=ZwWBE3pl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBXZmX3991031
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+o0iX2FhkG0NaHjvs3AlYXqBzXqOpnE05lzz/ttJF4=; b=Mt+KPlNfZdOUXjaC
	qq+wG2Ug4KWU0izd48p8M3e/JCpIfRf65bFQYSwf1B3iJ4eHZSq6jTYdKW51VmRw
	AtF4xZmOblj+uY8ySdjDNK7S5umd/ptZuW5ONytfmzogunb3JUOTWJW+kDPOdSkO
	bBkyV3h+iwe5eBlW08KjxJOW6u/szrAnlj7KGFGmRJP0ekkBr+NpHkFt2H6DjWbu
	cxIs5lliQRb2haG91uknRW/QV1PXstDh+IUx9AbuwH+72QmyynRbAXl59HOqkuee
	dBxYzkAfeHTiDMZnj8N7gdWLgp9N9bXpr1DhvWNJEfLi/Kxa4xHODJ/+CQVE3BZF
	ec799Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dag7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:16 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5e9e12601d1so831118137.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 04:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766145676; x=1766750476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+o0iX2FhkG0NaHjvs3AlYXqBzXqOpnE05lzz/ttJF4=;
        b=ZwWBE3plTuydrQkAf7gEOqHBNaJAzk7yZ7YShYcMOwvEA4yoSjkRK3u9agIGnu5ZCl
         XU+YsUvpmcHrn+LxA1quLDbYlCzEXJX3X6icR2252ZOvzehnDtpKWxg35xVK+s9wI6bQ
         mPWPHZ97igkCp850wWlI+jyBO4GeT3IeqyRwOjaFDFYnAdkvpav09slhskKqVRQ+oIbD
         VzZlJ88bdlRcFtPcR3KRvs5Ekrq/YM28FFZACCHotJaho2U0JBqSdkoeEru3+1fdrL+j
         iPWDUhDEHuVvTLQg0vqSlJ7ySAmXzOftn/isqpJT3fFYtOHKzJ5sFQ4i7apXUoqV9ACy
         d3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766145676; x=1766750476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I+o0iX2FhkG0NaHjvs3AlYXqBzXqOpnE05lzz/ttJF4=;
        b=JZGqfsA9zrHoPbHJvawppnkGkk4/Yx34VrZz0yqdiwmyUTm6x2ggGPPQyYITn7yOKY
         qcpJawBnk8GpJqjP/3xKQ+Yfl9ZAlYrsRQOQg4dNC6EYC00dcKQG5CGD7tRMe+W+3GgH
         QNSvWkChjgeIljTmOIazGGDfqMBdR4rMYJQ91An6w4V5P+esgFZaiWo9w1WkRFL7V3AL
         LKmduCfDl6bmU7SGs7O2+x7mPYx9eMs2D9APCtNdJB2m8s5r5jnuBy0lXCjdjaMt4NPx
         orURZ+jxglpM8/CAzMfAQVvC+csQNQcWkLJ0k17Qlqi2eDrkhhEwFuK2kD3LZnsoIo8R
         fXSQ==
X-Gm-Message-State: AOJu0Yyv4Ez0IH+eBi/12GVhCxH/L1fMU3ROXPmJPRC6/BrIICUXFTHU
	I0CKOEF2oz9l5MPsNWe6VMxxooZCXGGwM+RapqO8b+C09ekPoz8GjkEqDnvjGjIZ9TSMRj4kqG7
	wf+6a6q9iiRupQzPiC9pGYMmUR+0DVDklcX4tgk0a+rNWxKxTR/zoU3YEwu/CrJ1VRx/BcUb8hY
	hr9YBMVnqWW9JOBPZtng==
X-Gm-Gg: AY/fxX7cG9kaa8OvGZw9/0a3/gEZ0ZvifmPVz1skOwnA3OGti42vaHMuZDkN7Eg6Wc1
	/9kl4zsMaL/gWGENF99xDDCSAqhIUJRZxOQgU+pNi4z+lD0jcpRNywkQ/JzoypauMDVeL8bUKhv
	zFczcWuVN2SJvN91T6hbHa2KqUEcicy7Qj4SVH1ZhB4PkfBTM3MififHTbd4XUuolTXMqPPIXCi
	+MI4/DnZI0fUWQTGVZ25rE5CGbN2eT0r5+Lwuc9TxLtRYR12Ms0870HsD8oTFWvrL71473xjBS8
	9NBZch7q1bhylwYesdIBzjSaEn1PR2BVLzLy3UHtSzIAOHJxGN4yqbAae59vj3Pth90jrR6q0rT
	pU/jXypuO2PozIrUEu9W3x+y9YQVnbcyY
X-Received: by 2002:a05:6102:5684:b0:5e5:6eee:8ae7 with SMTP id ada2fe7eead31-5eb1a60bf0dmr649772137.2.1766145675531;
        Fri, 19 Dec 2025 04:01:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwonHs+RzmNPvgVec+CBrapkNDZRh/N98gJLuKFdgNtau3lWWXTzpTCiV9TlSRZEU3OpnYAQ==
X-Received: by 2002:a05:6102:5684:b0:5e5:6eee:8ae7 with SMTP id ada2fe7eead31-5eb1a60bf0dmr649713137.2.1766145674929;
        Fri, 19 Dec 2025 04:01:14 -0800 (PST)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c03sm2002120a12.18.2025.12.19.04.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:01:13 -0800 (PST)
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [PATCH v4 1/4] python3-pyzstd: import 0.17.0 from meta-python
Date: Fri, 19 Dec 2025 13:01:06 +0100
Message-Id: <20251219120109.1967755-2-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com>
References: <20251219120109.1967755-1-koen.kooi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=69453e8c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=LvthVqE70BM-Z8hTy2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5OSBTYWx0ZWRfX3zN6CjQCpdhs
 22L9c7dkqM/jzIrw8DpmDts8fXd3ZMqzEaDOMUWddbUlJWnJFMMuRHPSnU2Wm517is0CkUBs4x4
 JPlVOEXQNFvqYVc2QAvfJgqCku3rb/Qse6fmU23dx5njjKhF37cIfxAg01tM50vhK9z4maNE4i3
 GoC32pyc2c4QLmrWN1LkbsMkiH2H3ibZzy3xfIe6GWc0lRT6G4TY6XyGhguACjbg4BLOGjlnGzG
 L+D3RCnva00NRkQvpJf9xxH/QjaRSfkRW9O/cBZxXIy7nF6SRktQ4WWus91E8a23xZr0R+LFdvq
 qeJLkCqy3PX6RruXW80Kw6eXbx7SlMDtRXBRlq5f5XW+W/4pRB0V/ciD3DtsVHgoFROMRD5mZyE
 shlwnA6GCSHv5c4JG0VMEQvTSn43gBZbH6es8uchSxOeE0XZcofEHvNwniSbC8ICZjc96FMoLgA
 rFjOWcIz8NONI0nzMeA==
X-Proofpoint-GUID: r9g8usVQsF9FXBhQcBHCNQWeh3sFfePm
X-Proofpoint-ORIG-GUID: r9g8usVQsF9FXBhQcBHCNQWeh3sFfePm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190099
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5BJBXZmX3991031
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 12:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228222

From the upstream website:
	Pyzstd module provides classes and functions for compressing and
	decompressing data, using Facebook's Zstandard (or zstd as short name)
	algorithm.

This recipe is being moved over for systemd 258.x, the 'ukify' tool
depends on this.

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
Changes since v3:
 * Added SUMMARY
Changes since v2:
 * No changes
Changes since v1:
 * Adjusted pyzstd patch to not specify an upper limit to the setuptools
   version, as suggested by Alexander Kanavin.

 ...emove-setuptools-version-limit-of-74.patch | 27 +++++++++++++++++++
 .../python/python3-pyzstd_0.17.0.bb           | 20 ++++++++++++++
 2 files changed, 47 insertions(+)
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
index 0000000000..af7069b6ed
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyzstd_0.17.0.bb
@@ -0,0 +1,20 @@
+DESCRIPTION =3D "Pyzstd module provides classes and functions for compre=
ssing and \
+decompressing data, using Facebook=E2=80=99s Zstandard (or zstd as short=
 name) algorithm."
+SUMMARY =3D "Python bindings to Zstandard (zstd) compression library"
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


