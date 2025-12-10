Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6093D3E76B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:59:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2292.1765389538053324134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jkuxMdjP;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Yp3/V2Ef;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAFSQqo3360829
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N1NtmeZ1uFz
	NyPwYP6ywn+8fWmCI4y8CoD1+C39IUGc=; b=jkuxMdjPvEZlbF/zi9hvNLUpKKw
	F8KvW0oe/kR2vgBlArAXW8A7E4/ttJrGdFtNkobUcCM3qvubjfyXMafE4OdLdJ15
	Uw53/PsjlxqBkqMFS6HnQ4vD5A4MbQO0ktSCwTHaRqohY7VYUxWwrqtt6MeeKcHQ
	sQY3WjUhWqBy305T35H+8J6RzZMm17UKyUovSpkItglQ9NxTVrh91qJDzijBjNrq
	RGE42BWG+KEO+2rCM4nRCZ28cR3Ya9GXnZYqRd636iTz+36viCyl59eXtB0rx6gg
	TrLW2/GbtbvpHm/APNBT6wVcr4HqvbBfK3UZqU3jaEMv7jXlnmVVvFAcL3w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aybhp8kd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:58:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55ad466ad2eso89097e0c.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 09:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765389536; x=1765994336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1NtmeZ1uFzNyPwYP6ywn+8fWmCI4y8CoD1+C39IUGc=;
        b=Yp3/V2Efe3X7ESMHJMR5FXjwG+aow/TpS6XPscBs7iPH6AkUB5Xpn1Y6QQqhNjUhQ9
         Rj2bt9N3ANsrsFM3GZdqykWgkRr3H0if4k8We7Jz3F1Nr9ci73goFYlMKrrAx91Oo28j
         SgIS6dj2vQUVruHnoCz5fB480P6d3qyS3DVpCh1fqhQEPcjmp0gcEEEBpYFHzbV03/vE
         Dzcz53UtF4ECVdLr5l6QdSUPQQdlRErr/mSQtuY4m75e7xlTNxsOA8Feoz6lliHWpAes
         cHryTFeDbIjno17wLGpOn77un50Gi3SQZPMzVyd0LC/l9s+JOT8VoIO6/+d8vqDJXxS5
         XOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765389536; x=1765994336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N1NtmeZ1uFzNyPwYP6ywn+8fWmCI4y8CoD1+C39IUGc=;
        b=TWcdGsUuDOS/IBr/Jcacke7xX5Wf/iO1fKSq5I8bqU3RR54N5HHuUWQaUZfJopM6Ca
         QtczZ2xVZuVO8PzAjq8Dm+nqWbRwqunsOH6i+WeS7ccQcQvubciVms4ujHG/goXuwGqQ
         ERv786PoI2aqshbspCWDdjIb/0ttO7ej3LcBh+GtVoxYV37SqB0WfOJ83X/wnOist1kp
         SLa8HkrrVzj03dMpfWiD6RDewx1SntfCjigH4EzaOqFoxUpsauJTc7du2kc10ERS2KJH
         8bvLQEsR6d2TUdyt75azoC2w2oy3o3v5M9wv1A/n7VvuB+ECff1Dr+/BENUaXYSk2W1l
         gB8Q==
X-Gm-Message-State: AOJu0YyNxEPDWvbq8wHLJuh2hh2nQIrcZTypSjJ8Eq4T5e1JlTAl8DOT
	R/tlCfTeuWo3w6QW9KGhBbtbw456kP6wWhX1DvbQa3ud63DjYWPvRjZ9nf9J/IFAVzHipXIsNCD
	nhhpEcC16njPmUUyOS81SVh3RrEZ/HHk027NwFUmCQ1yx9XyWDXOU6Rl5G0S/QetbhhMuXWYhzG
	fGr83zTkFibF4Jlu8=
X-Gm-Gg: AY/fxX4Zk4pLhR1pWtMEDsokyG27Ot+giYOpWYsq4Ob/O8r2b3TvFVUeAJJL86OcSSU
	5jzTEanBVTr/eyjw7P1Lme4DSqiWLn7UtZcfBk+/yL3+LJsmXzg9zxZUiaqDdFaFFCMfhifqe19
	gbqhGczAbFKjjQYSOyfxdEk26a5+5+tHo6UYHAbwYGgEfyHCXU8IG04sF0qJtfT9k3AAEd3Tz2V
	qw0wbnDRZ98x/Vut3XWcy2b/zzHB1H+ECZlnK4ajxBJrwH2dsGuGnxJmh7O+taozJeaIhveGag9
	43oyT2XjHQSZ/45rbqQU4Hcb457rVcFHOlX0psUE6XttKtfnMtc9njSCMtyfzWH1CXTLF5rjLIJ
	lDdKHbhVxk4xXfzZgbxdfKMirGddrkPSnqqlBJLPD1ppgNrGaH1f8oTEhgjoGDpdNiil5EMfWPM
	UXN8lnapuuX0uOGjAnUWW7dks=
X-Received: by 2002:a05:6122:3a0c:b0:559:eef7:3a1 with SMTP id 71dfb90a1353d-55fcf944c65mr1050556e0c.0.1765389535861;
        Wed, 10 Dec 2025 09:58:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHseny/vO1u6FMrgqAHwD+5tcjEtfbstsABDCbx2ihLjkkwIu5wUxnFyc/wwZ7zE/4pWF73Xw==
X-Received: by 2002:a05:6122:3a0c:b0:559:eef7:3a1 with SMTP id 71dfb90a1353d-55fcf944c65mr1050546e0c.0.1765389535294;
        Wed, 10 Dec 2025 09:58:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca98bccsm221771fa.50.2025.12.10.09.58.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:58:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 4/4] mesa: upgrade 25.2.5 -> 25.3.1
Date: Wed, 10 Dec 2025 19:58:49 +0200
Message-ID: <20251210175849.1989610-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210175849.1989610-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251210175849.1989610-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE0NiBTYWx0ZWRfX45yd7WQ4TqsX
 njkKncEzHDh9z/2/BOTsx538rqT3k8UyqVaUGzH2opq7+vwxfPRgz7LJ2AdlVwuHAtf30CsoZ5v
 D2faRgcl5wb5eQW/GUselZLg1MEPTlvxzvVki/AzHLMcYL74FjEuA9XuxD+pc+nvkf5Efh2mz5H
 BqqCcl/EKmM1VMKruiEG8ebER8fRAZcDbL+FlpzHx4F9MsYfneBm/3lcnBMbDZSTtZA3v5Bmejr
 RlfiVWr2ZMNY93pn0lmhgsKuNCJwI337qkMppBlE8R9cbQ0ssU/b+iwAheurDjEnFAtQERa1WVQ
 m3rppqz3YJFVYvcB51Czx0Yv0zfFXAXB33T1KKZ1/yv23PQC7PnE8Mb/4dvcdELDpLzu4QdjdPV
 SPWdXE9hhFNAg5ksaqz+ZwxiOIR2og==
X-Proofpoint-ORIG-GUID: rlN84b4uiBciUr8OmpMof2dpYL8EVbkT
X-Proofpoint-GUID: rlN84b4uiBciUr8OmpMof2dpYL8EVbkT
X-Authority-Analysis: v=2.4 cv=LJ9rgZW9 c=1 sm=1 tr=0 ts=6939b4e0 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8
 a=EUspDBNiAAAA:8 a=1xmfFOoC7-iHbHEoocMA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100146
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 17:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227492

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
index 6edbcb7da5ce..835e4d46ead6 100644
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
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'ethosu', ',ethosu', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',iris', '', d)}"
@@ -182,6 +187,7 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',pa
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r300', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',radeonsi', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'rocket', ',rocket', '', d)}"
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


