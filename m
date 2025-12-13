Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A27ED59F69
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 03:12:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1959.1765595539507836127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 19:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XP6iCYek;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=TjEKRiwv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD2q4Li2562356
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C1+IRmO48Rs
	Jp/QkENAcdmfZCh620HuDVBQLgJ5rgEA=; b=XP6iCYek+E98qx8ZEcq1megKyBm
	dZcJQH0w/5i9C0C1Uiq24oEiZG86+rj8cPC2/ePM1zmpUCnvHwbjaq1tNIhlwZci
	/UyD2yvpshaMcMtmD0LzKpHuqVeRQGtg+ATSp1SF/MYa0rw8pWXXRukxJLrn+Zwq
	HY+MlGhmafiu6oCt1apWc9Cb2XHTLgoyqYm0ndpWqwYJXpIXZTrUE/E7byR1kBu4
	nEuv+6gk5A5FbFCuT/f61jgsuYiqxnlnyVde3i8wrhxQ7TN7Emp5Q1s4sL0N51lj
	bwztXzEPq55DCaULw48Esss+n/NO/luWqkxmzuJvdtuvs4e20P1TW01x0WQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b0yqxg0we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:12:18 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-559966a5b32so2957969e0c.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 19:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765595537; x=1766200337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C1+IRmO48RsJp/QkENAcdmfZCh620HuDVBQLgJ5rgEA=;
        b=TjEKRiwvvIwDhn2vXxQfghAHkUCQ9Kh+L8RNRGUVvU9nfuZNNJ3RZbH+wGFEJrZxM6
         qTsMJnvPrFNp3VJvGN3Ml3d+XH8yLueW2urhjAUQTHdxSU87+hRKDppu/lJeiegHtHhB
         c4qi6SJScbdifjopFpsxNVNJ1I2lCJNOeJfqTbm6eQN01leLz16H9MIiVoXo4OMs21+r
         cNDLx7nZpVrWbQjg5QjDFfAGJhl1yAlpRRodMzVKYaLLMFu/INUeG7RKlBTWRyqzp/qc
         kIDFzqSbiLJ3os1KBVWj06qyG7SxLgwcUkm3EVOBx3JkkZiwaTSZa/vhkM1IEzx6HbjP
         3rLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765595537; x=1766200337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C1+IRmO48RsJp/QkENAcdmfZCh620HuDVBQLgJ5rgEA=;
        b=ENcjy5b1YP6pE89sbAlBLW6xN9/rVADdPvqS2EeK5BWgRNGiTLNUig7m/Kw92CtkQb
         tJHB8iZgvKfhZj5TPGrjqc/qeEnwAJtDVDI3bCd6nj7fMMs1O1BSzRLl0X8hy1Ac/Ogh
         0BbvoJ0qvHpWGKIZj1Uwcx7JVQvYGemK7hGj8gfsTYs88CfO+TapAjqL9q048I8MWDeo
         qNdZbPxndckJFdpyttcs1p0ahkY53PenqwI2a0LDfY87/jnOcnI+LPp1WFT8sCt5QYAR
         HpuXHQ3P3I2MFYTtbSQDTG70hvGSFWZiC9e2CLaucTd3qYNAjM173P7qRJguH0siCEAg
         VbKw==
X-Gm-Message-State: AOJu0Yxfj0VnE6Y9MeQL4ZaUCFODW+aIqxFdkqf7AMNiAkVmmdgpVq8H
	ntoC4lKJsxy7cQnvCVUQhVCpNq96LYlSHK9GI/a/0jrOYxUSV20Xwq5PMCI7mUu92lcHnzdL26W
	la7L8s6e/cu44VOAFne2YUkYADOIaxye+nPbMaQXJax/F71cAMDawDrrRFhG6w92iZBN0UhqbLT
	ar1wsepBNH8/B3nWM=
X-Gm-Gg: AY/fxX7Ueife8vc2vuIROkTri4J0G3QBkQkqFGCRYC+DdmIqoHIuRdQpCNfq78wX89Q
	8ono8u/oAegAFmqmL9VnXDMokbWjvZKVgD0d1Pr4/gxmyD6849l4iqQhV2jqj96XbADK+ZKHSwt
	RsavKc/5RIPh/ECVThtKjCujt4wXsOqmOPP+ElwADVDTEOF8fUzA1SRe/FzUcozH3KezWdNmwQL
	ZBi4NMH5/gdnV6ZQHG0mAd1RXTQ2+DhJFEVY7H1W5woLCmJSp5hBbZ4TwifC5mKIG06VHVUoLmw
	asO3YVMXhqSYVVkSbuvYyWaKZr3K6sPQ000afFnS8YeM/x44eYiAX0c1tQwTPK92m9sz5vlKknG
	nsWgpZLJHiXbKsIQCNTlmt1ZiVh90N63h+Tt2RqryUuTEoIoQQxDe3+uHggcazv+RXfvAmCjqZ3
	PLPWJh534bG18WehgAwm5Sgi4=
X-Received: by 2002:a05:6122:1d0d:b0:55e:8569:4dd1 with SMTP id 71dfb90a1353d-55fdd7d14bemr2923771e0c.1.1765595537161;
        Fri, 12 Dec 2025 19:12:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfawNeF00AU3Qt//XFHqD/RaX+LpwgF2ro7kM5N751somE9l8f5kCSq9K8VKyjEErjdfo1fw==
X-Received: by 2002:a05:6122:1d0d:b0:55e:8569:4dd1 with SMTP id 71dfb90a1353d-55fdd7d14bemr2923768e0c.1.1765595536538;
        Fri, 12 Dec 2025 19:12:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdebe5401sm2814921fa.4.2025.12.12.19.12.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 19:12:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 4/4] mesa: upgrade 25.2.5 -> 25.3.1
Date: Sat, 13 Dec 2025 05:11:59 +0200
Message-ID: <20251213031200.2619204-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213031200.2619204-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251213031200.2619204-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O400fR9W c=1 sm=1 tr=0 ts=693cd992 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8
 a=EUspDBNiAAAA:8 a=1xmfFOoC7-iHbHEoocMA:9 a=hhpmQAJR8DioWGSBphRh:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-GUID: aGxSnJ6kjo7NzTYBH8zFIqzmEPO94w4Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyNSBTYWx0ZWRfXykp48sg21gsJ
 KaMetAqj9ZY0VMmaUvTmjWWm9v6S2BuFc0f3p9ozv4KUpU1U9jyII490WBqQUkCX+lioMoPGrU7
 znSuQYPUNVG0p2/5ORMHiXQqNoV8RiqLNn+WjNGq+dW5XWNuv1enVQ35a0jE+5Dkqp47a9/G2I3
 sZ6lNSU4B3YBVSheJrkxWOsttMdKo94aIzJP4FuSqJFnZHvoizkaoTqjsXfcoqnNib78d2uqzQc
 O2yzY2s+FMnG6c1vC78xHsmoHsbZJVbSp8k0WLKxARmqKO7C6w7oly4jLHPABsem7KpQcaF9cI1
 hcrGIUYime/Ko2zb3c3k5cexdjK7dNzkg1yVVfUzMICYiq4IKC4GwBbfBnFRsUUNVPSuLHpNKYx
 7CgGm0kFDCjuUXeNysU8c1gUi8thWw==
X-Proofpoint-ORIG-GUID: aGxSnJ6kjo7NzTYBH8zFIqzmEPO94w4Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 03:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227614

Upgrade Mesa to the latest release. Drop VDPAU tracker (dropped
upstream). Add support for ethosu and rocket Gallium drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 ...p-file-names-from-the-generated-file.patch | 45 +++++++++++++++++++
 ...on-t-encode-build-path-into-binaries.patch | 21 ---------
 ...p-file-names-from-the-generated-file.patch | 45 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           | 13 ++++--
 4 files changed, 99 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch b/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch
new file mode 100644
index 000000000000..aab17384d2bc
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-ethosu-drop-file-names-from-the-generated-file.patch
@@ -0,0 +1,45 @@
+From 4c3fad710c5bc702e28ae2bcc3c73b0547c4954d Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 19 Nov 2025 14:19:36 +0200
+Subject: [PATCH 1/2] ethosu: drop file names from the generated file
+
+Having file names and dates in the generated file affects
+reproducibility. Build systems (like OE) error out on the gen_header.py
+output, because it can contain full paths. Drop file list from the
+generated file.
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/cdb6468c53ef486f237f3d3276013febbbabba14]
+---
+ src/gallium/drivers/ethosu/gen_header.py | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/src/gallium/drivers/ethosu/gen_header.py b/src/gallium/drivers/ethosu/gen_header.py
+index b54516a812c7..44471893594b 100644
+--- a/src/gallium/drivers/ethosu/gen_header.py
++++ b/src/gallium/drivers/ethosu/gen_header.py
+@@ -29,21 +29,9 @@ def dump_c(args, guard, func):
+ This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
+ http://gitlab.freedesktop.org/mesa/mesa/
+ git clone https://gitlab.freedesktop.org/mesa/mesa.git
+-
+-The rules-ng-ng source files this header was generated from are:
+ """)
+-	maxlen = 0
+-	for filepath in p.xml_files:
+-		maxlen = max(maxlen, len(filepath))
+-	for filepath in p.xml_files:
+-		pad = " " * (maxlen - len(filepath))
+-		filesize = str(os.path.getsize(filepath))
+-		filesize = " " * (7 - len(filesize)) + filesize
+-		filetime = time.ctime(os.path.getmtime(filepath))
+-		print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
+ 	if p.copyright_year:
+ 		current_year = str(datetime.date.today().year)
+-		print()
+ 		print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
+ 		for author in p.authors:
+ 			print("- " + author)
+-- 
+2.51.0
+
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 136ed8623bcb..6948abe43952 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -84,27 +84,6 @@ index 98e49b8fcf0e..145e72597eb9 100644
  
  dep_libarchive = dependency('libarchive', allow_fallback: true, required: false)
  dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
-diff --git a/src/freedreno/registers/gen_header.py b/src/freedreno/registers/gen_header.py
---- a/src/freedreno/registers/gen_header.py
-+++ b/src/freedreno/registers/gen_header.py
-@@ -885,13 +885,14 @@ The rules-ng-ng source files this header
- """)
- 	maxlen = 0
- 	for filepath in p.xml_files:
--		maxlen = max(maxlen, len(filepath))
-+		maxlen = max(maxlen, len(os.path.basename(filepath)))
- 	for filepath in p.xml_files:
--		pad = " " * (maxlen - len(filepath))
-+		filename = os.path.basename(filepath)
-+		pad = " " * (maxlen - len(filename))
- 		filesize = str(os.path.getsize(filepath))
- 		filesize = " " * (7 - len(filesize)) + filesize
- 		filetime = time.ctime(os.path.getmtime(filepath))
--		print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
-+		print("- " + filename + pad + " (" + filesize + " bytes, from " + filetime + ")")
- 	if p.copyright_year:
- 		current_year = str(datetime.date.today().year)
- 		print()
 ---
 2.39.2
 
diff --git a/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch b/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch
new file mode 100644
index 000000000000..3e9edc411f51
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0002-rocket-drop-file-names-from-the-generated-file.patch
@@ -0,0 +1,45 @@
+From d5462c852d30fc41a223730848550db4f9675517 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 19 Nov 2025 14:19:36 +0200
+Subject: [PATCH 2/2] rocket: drop file names from the generated file
+
+Having file names and dates in the generated file affects
+reproducibility. Build systems (like OE) error out on the gen_header.py
+output, because it can contain full paths. Drop file list from the
+generated file.
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/7a3bfd1f7913819db315e6db8b42520a2d862690]
+---
+ src/gallium/drivers/rocket/gen_header.py | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/src/gallium/drivers/rocket/gen_header.py b/src/gallium/drivers/rocket/gen_header.py
+index f3c6615dcb42..5457ef71d595 100644
+--- a/src/gallium/drivers/rocket/gen_header.py
++++ b/src/gallium/drivers/rocket/gen_header.py
+@@ -29,21 +29,9 @@ def dump_c(args, guard, func):
+ This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
+ http://gitlab.freedesktop.org/mesa/mesa/
+ git clone https://gitlab.freedesktop.org/mesa/mesa.git
+-
+-The rules-ng-ng source files this header was generated from are:
+ """)
+-	maxlen = 0
+-	for filepath in p.xml_files:
+-		maxlen = max(maxlen, len(filepath))
+-	for filepath in p.xml_files:
+-		pad = " " * (maxlen - len(filepath))
+-		filesize = str(os.path.getsize(filepath))
+-		filesize = " " * (7 - len(filesize)) + filesize
+-		filetime = time.ctime(os.path.getmtime(filepath))
+-		print("- " + filepath + pad + " (" + filesize + " bytes, from " + filetime + ")")
+ 	if p.copyright_year:
+ 		current_year = str(datetime.date.today().year)
+-		print()
+ 		print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
+ 		for author in p.authors:
+ 			print("- " + author)
+-- 
+2.51.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6edbcb7da5ce..c222bb87647b 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,10 +18,12 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
            file://0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch \
+           file://0001-ethosu-drop-file-names-from-the-generated-file.patch \
+           file://0002-rocket-drop-file-names-from-the-generated-file.patch \
 "
 
-SRC_URI[sha256sum] = "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
-PV = "25.2.8"
+SRC_URI[sha256sum] = "059d0d985622f49588f01aa29152804f4da8ffe6add046e00a52923379c2d8da"
+PV = "25.3.1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
@@ -104,12 +106,14 @@ PACKAGECONFIG[amd] = ""
 PACKAGECONFIG[asahi] = ""
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
+PACKAGECONFIG[ethosu] = ""
 PACKAGECONFIG[freedreno] = ""
 PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
 PACKAGECONFIG[intel] = ""
 PACKAGECONFIG[lima] = ""
 PACKAGECONFIG[nouveau] = ""
 PACKAGECONFIG[panfrost] = ""
+PACKAGECONFIG[rocket] = ""
 PACKAGECONFIG[svga] = ""
 PACKAGECONFIG[tegra] = ""
 PACKAGECONFIG[v3d] = ""
@@ -134,7 +138,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-l
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
-VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',intel_hasvk', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
@@ -172,6 +176,7 @@ GALLIUMDRIVERS = ""
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',crocus', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'ethosu teflon', ',ethosu', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',iris', '', d)}"
@@ -182,6 +187,7 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',pa
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r300', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',radeonsi', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'rocket teflon', ',rocket', '', d)}"
 GALLIUMDRIVERS .= "${GALLIUMDRIVERS_SOFTPIPE}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',svga', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
@@ -202,7 +208,6 @@ MESA_NATIVE:class-native = ""
 
 PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
 PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
-PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
 
 PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
 
-- 
2.47.3


