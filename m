Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5322C369A3
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:48:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.43384.1744019294671543600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=T0lT4X3l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dooT009987
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 09:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EnlX3QWUCYrIsL2ngorW5rdEdpjwxn2t0gbHgboQkRY=; b=T0lT4X3l4m25s90M
	8EmiacUpunO7ncIhSjAZwX6na+2apJwot2V9VXTknuAWcK0mA2uJUmc8FTe95XKw
	wucXla0X4RrCZaOvKahCyxMkr/zZXSrZhGaoqjzDedob2EVIPurymTzJku0YRbrj
	awpk4xuOMOmzheVWEeisolisn7u8ummsAHd81djNojfsPxnJRDfrNnq6EUptgsaj
	roz6dYcCCSsNnd3L4ABRecLHMS6TqnHz3YRZH/+HzXvn7XkLwkQub+DabL91A09o
	j1ihlimuVm5aoewGtwYKxuZAQ0cilRx7Zks7KFrZXDBo5e+o3I65w3u4mLgsQlYe
	mDWK3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm3rga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c77aff55so1056071385a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019292; x=1744624092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnlX3QWUCYrIsL2ngorW5rdEdpjwxn2t0gbHgboQkRY=;
        b=VL0c9tdUWGuQS2TN+//usb9nNY/7UHSmRd/brbi0fq+sQhnZ+EpGjymERBMUBT3Hyg
         pZM0Nt9yOcFJaybYjKIN9TsiSc89FdBs53RoDCiWmO8iMY8IXB7QPHZT5a96+9jFZIE3
         STPOMnfNKzrBcNrLh9I1djy+7M2uGc6G6zWPPy4m5D2f1Ka4+aMwsjYBjw5D6YNlw7QR
         Tpd58mfdNxn9r1y8ZbSnQf3LKnX+WU56c/NfwEbJYYDDDXkQpq+H+7I3B6hcmyWn6fLV
         um343Vi6rj4X/g59nw1yLDJL14U2r+zFkan+qGnfq9DuFaelqaC/HdEfuJEQZu1EnU+r
         xHog==
X-Gm-Message-State: AOJu0YzVd3+aFD5oMCfBTrfTI07ZquSecb2vMwjwjKOvI66WKqxRv0Pl
	OaTzANGtmj+oPdpU8LXg/kkGSfFTeilBOCLlFGJ5yeEBM7r+uE9vM5u+CA3uEpTNysD3hItguYt
	lgMMaZPFvXnCDVdjMvQ71tnaP33QMjO6qOi5nquTfDtjEwfu441VJKg+SS02Wa73Hs6oEMSUe/T
	XluJiVPaIgQ0Y=
X-Gm-Gg: ASbGncsJEtFGKMVN9SnpRDSAYsK2amAwgUQkDTGr5oyNEN9Y64eGroyk4mU0LPuhCDe
	6yL/FTENbbKY+MeYM66QAR4jrnfIXx1r1mX9sfVREAHHOa5DpguQK2go3nZKcvqxHzOKRaILLz1
	FlQ48xtU4xCG5PZNIATywzZBGmR6qAbo0F5JkLtCKt1SSlujsyMiS7kyls7GVO/HHgLEyrgmOFV
	KLJclh/wO8xeY6hO9piYcsDw3f6q2ZCfsWDtgHpzK9e6cDmOQb4MtxiYuvFjnYji35sqJ+Yz0Xt
	b8M+mKRi1TQ+tcHrp0Ul5meHUToAR9zj3L8f1RQWHKHfHVOVaYFdgMjE1qFyn5tZDFmFH4/Ye7G
	ovpdKJ/rq2/Pj6+RY0ppX+ObGmRdA
X-Received: by 2002:a05:620a:258e:b0:7c5:4b91:6a39 with SMTP id af79cd13be357-7c774d71801mr1550131285a.33.1744019292312;
        Mon, 07 Apr 2025 02:48:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG/Q2tFdz2hHxdiooGR2gPvOv8EDGr3JHtna45zexTwWPK+StU2jWs7XESoCkQDFAZZNqH5Q==
X-Received: by 2002:a05:620a:258e:b0:7c5:4b91:6a39 with SMTP id af79cd13be357-7c774d71801mr1550129085a.33.1744019291971;
        Mon, 07 Apr 2025 02:48:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e5ab53fsm1216985e87.52.2025.04.07.02.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:48:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 12:48:06 +0300
Subject: [PATCH v6 01/13] runqemu: also set GBM_BACKENDS_PATH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-mesa-25-v6-1-29bf4cae8d28@oss.qualcomm.com>
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2660;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tmoZR/PXF7m507OV2TN8Rfngn0pELOvLeNUojKEA+3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn859WWwh++hn7cwqypsJgLRSQIJJNEva/HT6TB
 JQqoQUXTUmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/OfVgAKCRCLPIo+Aiko
 1aXLB/9uE2X5o3LNk8QpacSIDgMWVD6TCHoseIlOA04aNFjsfCqoCVqVz7nwYo/LmCMM7EnuQCr
 Qc5r7YIIAF9lCYh879erYaxU+Ls3aAWgNcaPhZ50a7xS8Fya0+2KDf10Td07r/RSIC1i6Roi5Oq
 X6av4osmyVTATUepTjkw4D8OabC/ytdK5DJEKi/OAtjCd8S3N/W1jm/xfE1/C6HZWQ4FnJyJ02l
 yniYAYqqjpMJN7vQOfp7fYVtnHp0YuJjw/gRzGi0YFzw0E9jsQe7Yod4GSU8bbJdl/w4Juuy4AF
 H52DF6t1pEsCNJ6GQxVAaJdP3wZ7sJoVFNqYHiR4XW8ogPzG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: blQPdxOobpZfpsefbC0KXs_bS8vqgnzp
X-Proofpoint-ORIG-GUID: blQPdxOobpZfpsefbC0KXs_bS8vqgnzp
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f39f5e cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=5p7H2duF2IrNtC3iPlkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=752 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214430

Newer Mesa dynamically loads GBM backends from the libdir. This is going
to cause issues with running native QEMU as the libdir
(mesa-native/recipes-sysroot-native) will not exist when it's executed.
Follow the LIBGL_DRIVERS_PATH approach and specify a path to GBM
backends via GBM_BACKENDS_PATH environment variable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 scripts/runqemu | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 86124a4a6a327e8c522944fd2ff9fe645c200722..3d7704697285ff9a5da45644eef4b7b3fce93dbf 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -468,9 +468,11 @@ class BaseConfig(object):
                 self.set("IMAGE_LINK_NAME", image_link_name)
                 logger.debug('Using IMAGE_LINK_NAME = "%s"' % image_link_name)
 
-    def set_dri_path(self):
+    def set_mesa_paths(self):
         drivers_path = os.path.join(self.bindir_native, '../lib/dri')
-        if not os.path.exists(drivers_path) or not os.listdir(drivers_path):
+        gbm_path = os.path.join(self.bindir_native, '../lib/gbm')
+        if not os.path.exists(drivers_path) or not os.listdir(drivers_path) \
+                or not os.path.exists(gbm_path) or not os.listdir(gbm_path):
             raise RunQemuError("""
 qemu has been built without opengl support and accelerated graphics support is not available.
 To enable it, add:
@@ -479,6 +481,7 @@ DISTRO_FEATURES_NATIVESDK:append = " opengl"
 to your build configuration.
 """)
         self.qemu_environ['LIBGL_DRIVERS_PATH'] = drivers_path
+        self.qemu_environ['GBM_BACKENDS_PATH'] = gbm_path
 
     def check_args(self):
         for debug in ("-d", "--debug"):
@@ -1461,7 +1464,7 @@ to your build configuration.
             self.qemu_opt += ' -display '
             if self.egl_headless == True:
                 self.check_render_nodes()
-                self.set_dri_path()
+                self.set_mesa_paths()
                 self.qemu_opt += 'egl-headless,'
             else:
                 if self.sdl == True:
@@ -1471,10 +1474,10 @@ to your build configuration.
                     self.qemu_opt += 'gtk,'
 
                 if self.gl == True:
-                    self.set_dri_path()
+                    self.set_mesa_paths()
                     self.qemu_opt += 'gl=on,'
                 elif self.gl_es == True:
-                    self.set_dri_path()
+                    self.set_mesa_paths()
                     self.qemu_opt += 'gl=es,'
             self.qemu_opt += 'show-cursor=on'
 

-- 
2.39.5


