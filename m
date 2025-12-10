Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9EFD2CE17
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 04:37:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7441.1765341463403899992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 20:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CJ9uOhou;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=KVM1xt+w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LdXY1253820
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 04:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EUjUGIdOAsW
	MrA1fAYitMto/qgtxGf+ypNKHXTdI9oA=; b=CJ9uOhourKdESNJoBrDIY2rAJq+
	V3NmA5EJOC5r/HpeOZQXeaAvdtt8Ab2kdKrnTwg5m5chKLcFfiGCcxauRgUwS5fB
	o/J0vcfkdcLamRr+dwRBVc8MlKOE1LFwHzCV3RM3lRETzq5eTJPQvxyS5iLDo/yR
	KTi3V2LfbciE0Mva8pwgFSv+Ac7kKUaHAS72Qam4RQ++qBbKrh5wgs7vDiOmxaQl
	+zy6H5IhqG3dy6PIdcbTprMB/PKaSND2EoD1nG76xRGfBUQguSn71kQuguWFFFZA
	ciwLhGgfVxzPvx570Oug8+iIKdDOWPWpg7irhw4tnmnlieBhUt5rtamc4gg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqqn22eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 04:37:42 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93744ac9003so3287653241.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 20:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765341461; x=1765946261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUjUGIdOAsWMrA1fAYitMto/qgtxGf+ypNKHXTdI9oA=;
        b=KVM1xt+wiPfeZ52P0Lnkkf0OWF9dk3Z96awstAcS5cIcSIdDUJ592gphhqA7XP68/T
         ORpx8PI7Rh1z77jcBYRVMu4nttdWFycKrYqFa3viZwNM9n8nNuAtd1NY6DBtKYVQDvO/
         7xqcRkS7QvqVkJGUalOG+hinXoclMQinHE8HrybuiKSKA2P+uv0FRrhJwuZ4fuKev9cq
         /OfPjduFo6nCoEzeFXovJafua7C2zhR3etwNX36O5nQxqAZ+Z3JefEuMrwKrBL5TVrH+
         3MbvifkJQupLKTAKou7ULuhST9uEXeiuq0UAcjylr77+ZFuLyqgZybYq/mnwCGMiN+L2
         R1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765341461; x=1765946261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EUjUGIdOAsWMrA1fAYitMto/qgtxGf+ypNKHXTdI9oA=;
        b=deB8xlnHAE0iBTaNir3ZrU3lopbD+Ld4TuAm0Cd0eFnyaJFjsoov9NkMaJHri/+o3X
         kqpxTXk9HJlbr4dIynTfYkNZFVx+SqxowDpM6sWtjRBb6nMlyc9IXuybzNc7By1oR8pd
         rNlWYeWIYlTwo4OHShswBzVMSOddf4wvot8xgP86dbaXCNpJNbxsK06l3ixuLKP/mBmb
         VwXNx78vomDokO/SugYM7BMS7KDjdsXCXw3koJkPwpLAZP6Rwnk8Ithtdv1AIApeJPMu
         3+l3QInjLG8KhXijgzxuzWrfYi7sLOoHniLjIG201y2cuiipODJpgLROf/T5gNnHjoKZ
         JFmg==
X-Gm-Message-State: AOJu0YyHqvxIB2sEqF81d0lFaDPEVG+C9VMC3GB8lgABicV7V8J7PnZa
	3KX4B1Ir02Wxz0KNcmJmGJLgc463AHOWls2T6LkkSvQCg09d2joQlW4uj9DdjH4HwaD1/W4m/+p
	clxY7k0yyMpxZ4jlOi5P+wYl9LGu0pN7yCTjIZ+4vj4ZjfU/zb7zrxyBKXLVbiD1TJ4GKy/BTTY
	92MBXubKqIq44Yyf8=
X-Gm-Gg: AY/fxX5tO1YTZS+FWN+R2+P+owBSoTAKf6hdxlxy89ATdVdvRqhQzdHB0p5i433gsYZ
	mXR2ErCis6lrfuQZTfGfnjXO9duLK3+lPaAd0ri1Qc3HvKoyiR06mF66MEjVrCx2e3uBGcKqpWe
	xrabmgIuuC6QZP6ep5HBVErhmTkx7cRCsZUJ/68re+9597jIOhxJZOd1nUPC+5BUKmxCYI39qDQ
	vQWS7pHXeEA+8VjA0hyAHYUw3vvQ6OrlJgbGW6nAMsuXkFVFMtlI6OJKTfwu1AyW7r8UdvLzolh
	ZLKR4hdD+IfnFyiEbejd6q8XYvxMy/2QP+hzB1vc0aqjoIEOLTj0MZZ4p/azLLlGge4lX0JI3Ds
	oPvtejmbrVu3oqVMK9QjJgFlDeRIIc83YsWNJriEXjD+HdDMZdOP06f1O/GkuMyc03qBI2kJnOl
	YbYJBVlKPqWdpoH5i5KYiHpx4=
X-Received: by 2002:a05:6122:3bd3:b0:55b:aab:95e8 with SMTP id 71dfb90a1353d-55fcfb45be1mr394444e0c.9.1765341461390;
        Tue, 09 Dec 2025 20:37:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoj6DSFmjktcfxiI2idn+v246ZKWb+UlSH634i4cxjoHaXpimK7Z3LQBJq8wvSPjjwVuDUpA==
X-Received: by 2002:a05:6122:3bd3:b0:55b:aab:95e8 with SMTP id 71dfb90a1353d-55fcfb45be1mr394441e0c.9.1765341460793;
        Tue, 09 Dec 2025 20:37:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fb5442cf7sm1287461fa.37.2025.12.09.20.37.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:37:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/4] mesa: upgrade 25.2.5 -> 25.3.1
Date: Wed, 10 Dec 2025 06:37:28 +0200
Message-ID: <20251210043728.847548-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210043728.847548-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251210043728.847548-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2CgIPbGUQH30bjagjHgO5JLZeejVi535
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAzNyBTYWx0ZWRfX7N8/W2a2qVTp
 sRA4wol9fnqw07kAuAP3rtxAQtMmqLFc906x5sCMJGlqkLzFJoU++qmPDjN3qpYkimJEtb3hKeZ
 HongRS2qkqoGKSILn3cEE0DV9/tVNJq3arDnr1xy3zQD7csQIrtWZe/Y7JeiO+4Nh6ECthDbKnm
 2MTY+IUC3JkpVsMU8g87xezqXx9RKpu4MAPUkHfiytFlpPix9JZS+kNzB/brtNiS21d2rMJTLZc
 uowo8mxE1qgIEmYHr2N/qlsKdfM9TqjzqJEyNrTMXmKqSSoBTK+dDg4wju3SQJy9TXUxWQaH2Hk
 gkhkoivNqvb0wlqKqwBO+MW/SagxApr23+zclUpYO7JPYvCdqg2xYkk4W2NRZY7f65+ZF8mNcDa
 qS7Xa2mRoYcpnkKc3Lrfaf2nQdaVfQ==
X-Authority-Analysis: v=2.4 cv=A5Jh/qWG c=1 sm=1 tr=0 ts=6938f916 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=ZpVaWaFtAAAA:8
 a=EUspDBNiAAAA:8 a=1xmfFOoC7-iHbHEoocMA:9 a=TOPH6uDL9cOC6tEoww4z:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=5tn4MO8azEBWFjlAA-rn:22
X-Proofpoint-GUID: 2CgIPbGUQH30bjagjHgO5JLZeejVi535
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 04:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227457

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
index c52e61f1ca01..a67abfda808c 100644
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
@@ -129,7 +133,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-l
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
-VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
+VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',intel_hasvk', '', d)}"
 VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
@@ -167,6 +171,7 @@ GALLIUMDRIVERS = ""
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-llvm', ',asahi', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',crocus', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'ethosu', ',ethosu', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',iris', '', d)}"
@@ -177,6 +182,7 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',pa
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',r300', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'amd gallium-llvm', ',radeonsi', '', d)}"
+GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'rocket', ',rocket', '', d)}"
 GALLIUMDRIVERS .= "${GALLIUMDRIVERS_SOFTPIPE}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'svga gallium-llvm', ',svga', '', d)}"
 GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'tegra', ',tegra', '', d)}"
@@ -197,7 +203,6 @@ MESA_NATIVE:class-native = ""
 
 PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
 PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
-PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
 
 PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"
 
-- 
2.47.3


