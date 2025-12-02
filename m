Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF74D116F3
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 00:50:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7151.1764636599129177008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 16:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QbZ+ckM1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=QkjwRgcU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1KXVmM1147219
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Dec 2025 00:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wSOLOb1r/qh
	ug1zu2g9oyrE8Mj1b9P8ycVR2jqD3vlU=; b=QbZ+ckM1M9BxIAxoBbL0eXvufO1
	J2HaF26NsoNd4rQ4bbpR3/79yyAVP2SmJ2Bgv3EeN/fw6D8qolAGDHst4L63kVvc
	nilrSZ/dt7jd60v3oT4HYhCxBS1pyq46asjzNGBPVDDluIuYKl+/mowQP17BtyiZ
	tInyG8oOQiPs0+sAQVHkf2s8aDDPlhkxESilOaVvwoEK3PDqNAZ2JjffHBop26GG
	SQd9yIgCAp85OjBc0f/bQwSEgRuWvodESvvJU9K0xWg8wE/wB/wH3sqqDnoZEN5h
	5iHe/VzSwUe+j7IqTNa+FmvEgBZ18NsKhvf/SXbJGVjd28kz0kVySaObOjQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asj5e8neh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 00:49:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b22ab98226so1436678785a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 16:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764636597; x=1765241397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wSOLOb1r/qhug1zu2g9oyrE8Mj1b9P8ycVR2jqD3vlU=;
        b=QkjwRgcUHxXbIpx7vAhzocqeubiPhFB94RJ5fcuWyvUVroKI+Zem0pCp1XcQBscsvC
         KB4NFqFdhF6EQIzeC+1XVmQCYVrYulQwnTl2AgoBIexmQmmRuXpNhgsYaJ+SNNyV6HbA
         vo+sOqfDyCd00EMdubbO4wLCZ2V6O3HgNWZqGDyQ0dcJ4RCpdvLcXNqbjz7OPDhXPP16
         HeE5vsKYW2BmlDiKjJAQv8y/qkYfJkDYZpmUzfhdFrdUQEfpJw4ws6Q71sL3w7lSv1O3
         2IRH0RMiK/BqlYl0w+vdy0Opri0iTD52J1otJ/+Lm7TT+iOabRgIyc2j0wqPXquEKQle
         uJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764636597; x=1765241397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wSOLOb1r/qhug1zu2g9oyrE8Mj1b9P8ycVR2jqD3vlU=;
        b=lmGtsnP42RhTSNeKu0YxQ4piGUOJTOiZHBOG6KF3qbGnKXq81ELRHsFxOrQGdawXOa
         pgpBtW4uqCbY7vvzYIphZld/0S2gSaSIO2h/jeRdy0+tJZwv5FnMKjoaelFsCNFDLMwR
         y6ib3Y2rdkbwUdonoAjRwqHGIfKlHyCW7IsIPfL+ue3GG1wGWfknEVQUxJKIsQvqDuUv
         rqYogYmsmWOJDxBDnEYMTVQf7qUlpUYnpR2W6eBZqLbkF5kaYqDD8rDfbwtbMH9ifPnJ
         Umx507umOIeU06BkRpZ8WRGg4zAa8v0J1/qkaE1Ynd/PC36i9c/eMN3LIBkcrHSVbD25
         BObQ==
X-Gm-Message-State: AOJu0YytjwxiurHIvjM0uuSc37sutR1zsezCWzKpRXTM2BjDcw7kSFit
	aA96sLLcTOQZ2JCSs/9vFgdjviEJsnb65CiVSH5FA5uo0JXNA7m7eQYyqzJjNbWu2saKfPTf9d+
	QbPYKlbuW9FlZzT5jjjS5YOI3D5+TDJ6A+kmyk6sk5lt57p2OZPJ4EveporqUoM5mYc+mdYl/yp
	iYeF1tCoM1tuybH6c=
X-Gm-Gg: ASbGncvgqRYXq4IY+qze5STT92LJou0PT2uriqBHERFCdh7siwk0CcWbpvSGFs3wPmo
	QqqfjWtlVUK15Xk2y7ykoG5vDIZ705L/inEmIIpYHa9JD1Z2RnE7sL1Z0iyfRqelYpcxXr2dnzM
	UQ0pxUl7zVko+in1g+nHkQ0+cvGyLtnUHwHLb6LrcafJbCYf+CSZnj0+yt/J/XOlXg2k2ztECB0
	xnmPOczKU1C6XW5qJZSJaR06DZSkDO/6EeYhiXtKlGm3L1DK8olzI6zD3ZluzF+2nQmMM7Cv+tO
	B3c5wjbXYooyUZUhqpYaXJ84iMGyOSG/2iDscYXyJTxGMH1m96fdwm1ubAC7KbLEzi08a7WpOkZ
	NaXOt5bP2eGmiMFkp2DJbQhFyTse1teXIBq30/Xgyp/zeWCJGq0HoCnABrO6EW509dNzBx0aGEF
	UB3r6jfPbLaFXXMMJYDle/YA0=
X-Received: by 2002:a05:620a:4613:b0:809:eb12:1ea0 with SMTP id af79cd13be357-8b33d4c71f8mr5385485385a.81.1764636597053;
        Mon, 01 Dec 2025 16:49:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhzfZ6jYe0xKSkiuYrfX1UQ2nvwrJTKR+83UlCpZqKf7Hix8MckZHGedPqKgau+mBYW2qOAQ==
X-Received: by 2002:a05:620a:4613:b0:809:eb12:1ea0 with SMTP id af79cd13be357-8b33d4c71f8mr5385481185a.81.1764636596410;
        Mon, 01 Dec 2025 16:49:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48d67sm4058173e87.74.2025.12.01.16.49.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 16:49:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] mesa: upgrade 25.2.5 -> 25.3.0
Date: Tue,  2 Dec 2025 02:49:51 +0200
Message-ID: <20251202004951.2358784-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MdsPRO36WAJEceDDfxqjfjMHFxIHMcgU
X-Authority-Analysis: v=2.4 cv=GMsF0+NK c=1 sm=1 tr=0 ts=692e37b6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8
 a=EUspDBNiAAAA:8 a=1xmfFOoC7-iHbHEoocMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAwMyBTYWx0ZWRfX8tZEcQnUle0D
 8nVaO8LQlJaa6ynejkTIC2ugX7IQ2B1bKQ6QMi2o+6g0EQseX05fVo2RNsqubG0wF3LUlcPc4v7
 lzz8uyZ9n765QlSlgRU8LNKbJFJu/CdHS8o09ZUT3t21MVPvH2XpEYxBXtKV+4pqnbaeS/C9VyK
 e6W2UE9JkVhCTzRcQ8iI90bqlyIzZDtxFFaAhdLU2mtQKQQjRRxQuk4bXJohtaBp+ecTgaxm0QX
 Wib1V7UlImqTVsAvXzBGMqxIySlEQDuwkrY6YBPKHP7aASwKgpYrApNBVcPPBC4ltE2dS7GFZTn
 tbBz66BDf7KYw/1/xo8Z551EvAVNVNQyn9mSu2QJ2PBdaT60V/trbFaJjjyq4/MW3qEyUri4I2r
 ePT5QpYvuBgvayYE1UMdzoUrDChRqA==
X-Proofpoint-ORIG-GUID: MdsPRO36WAJEceDDfxqjfjMHFxIHMcgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 00:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227144

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
index 000000000000..cc7262bc7e00
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
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38528]
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
index 000000000000..a76f967a0040
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
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38528]
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
index 420ba2032b67..106767476ccc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,10 +18,12 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
            file://0001-gfxstream-don-t-dump-genvk.py-args-to-generated-file.patch \
+           file://0001-ethosu-drop-file-names-from-the-generated-file.patch \
+           file://0002-rocket-drop-file-names-from-the-generated-file.patch \
 "
 
-SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
-PV = "25.2.5"
+SRC_URI[sha256sum] = "0fd54fea7dbbddb154df05ac752b18621f26d97e27863db3be951417c6abe8ae"
+PV = "25.3.0"
 
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
+PACKAGECONFIG[rockchip] = ""
 PACKAGECONFIG[svga] = ""
 PACKAGECONFIG[tegra] = ""
 PACKAGECONFIG[v3d] = ""
@@ -129,7 +133,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-l
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
-VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',intel_hasvk', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
@@ -171,6 +175,7 @@ GALLIUMDRIVERS = ""
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',crocus', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'ethosu', ',ethosu', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',iris', '', d)}"
@@ -181,6 +186,7 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',pa
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r300', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',radeonsi', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'rockchip', ',rocket', '', d)}"
 GALLIUMDRIVERS .= "${GALLIUMDRIVERS_SOFTPIPE}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',svga', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
@@ -201,7 +207,6 @@ MESA_NATIVE:class-native = ""
 
 PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
 PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
-PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
 
 PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
 
-- 
2.47.3


