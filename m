Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F423C369A1
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:55:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.25473.1744253692831451670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=epaKIix1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HDiEZ026713
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EnlX3QWUCYrIsL2ngorW5rdEdpjwxn2t0gbHgboQkRY=; b=epaKIix1Zj+e/Cxi
	UWmMvHTwXINwoZl6gBgPt3O49Kom7HC6MYEhRlpnRZjJqdwdJNam5ILaisUEnSb5
	Ry5bbElmhCcvkBQjaH8Wda6vVLyWvqqlXvb5M7+nbIUN0bzGvgS55X5UTraUwmrm
	VEqgUL1TeEKSp0drN3guoZOFi9oE12/SJ6Q/hrEsBqmOJK8YJm+nj4lrZr2IiMKI
	j7K1/sHkaIrQlK4ZaMLu3E7El1nXwUbMl9Sim9HXXWRv7qtv+thwwN6jVt4PBBID
	kZCFSooG+qEk7RCqFt4IttxnmFG8Z8f4NLidddYOuggSimUQsJo51lgXT6qogoV7
	eRUdHw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twdgng2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:54:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff55so91622485a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 19:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744253690; x=1744858490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnlX3QWUCYrIsL2ngorW5rdEdpjwxn2t0gbHgboQkRY=;
        b=qEvOC4H3mnLNxkiIvIpst+/6F6d5XUf4I+tyJxoFBIuFh8LuoE92wGgrXVygjuBetf
         xyxxZqL5uuvnKy+0R4JAKdJVgMeF4LQgb4P8jDGYhIenjZWq/W6dwhNDsfBVE25E2wZn
         WNVa6qRN5FnvUMokmv8dqAmBNuIwqqSMim6gah+eUMJcv7Icdwr0JsOUoh3B2LBHLWas
         Fsic0OCsDnYDdz1TuSwe8Azi7HhI0ta9dPeu+4mksIdSlqGvnIaeKtBDh9W/dketMHsz
         Es9hw3mjETWJ9wv+RByZTUUxUzmcTma7fdtkhU++nYqWAaUrW3ZBgiJAHc1ZH/TiaKgS
         VbpA==
X-Gm-Message-State: AOJu0Yy+1EVKN6gPaT/jaBhAkc5Y5Mu1WfavXOKeIhzsRgLZVdc1c6e+
	TYsxOxM0XUWVcamqkPaYupR/3pPwPefZvY32OWLysTCT6psSQaweZnTsB+6NQCRZ3uSDcqTw0c2
	7m7MMELBEMvJ8xoQKWTRLgb4b8bdUSVAQ4jw7f4c5BdTn7IV8KxfTK9XpXLPXpo5shrtUih4ucJ
	qResBlBUh/grQ=
X-Gm-Gg: ASbGncs9Fxaz46aXMbaxUeZGwetz0f8/WDiYfwQQd0pXGi/yLOWLlGmJV29cPvdr7FQ
	0h7NXgAOnnhP30m913VneJp8TjRK+fM/1kWvqDKqMtkvoXeAOBSOZMXXSb9gmubmQ42mmjuQv4W
	5cgZ3vhWeau0LxsUyL0aRUCc6f8bjqupXFmv1fj67oodShnJJB21opLgHXew4cUNlvSaL6gmmwS
	9YD6NGyIpOsl/+J9ughGENl20BTDJLeZmVMmOkq3TYPFKJq+Pdn9neJUYgHmH9BISFOjQG2XvP6
	Dn0bTPDJL+TDXmyYZqdnAqahGq6okOgehbfrLSRu+Szi08AjDr+jyVTgkObMNk4iubbD52BWkA+
	523YqUFM+wTFbvRXZzA+7vPeZ
X-Received: by 2002:a05:620a:2943:b0:7c7:a555:4a11 with SMTP id af79cd13be357-7c7a76c22dcmr187488285a.44.1744253690425;
        Wed, 09 Apr 2025 19:54:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+bYH1TUBN5Oda5YoVIAtgxLKr0EpSDK487i4DsAgZRfThJ16ToBukUItfrJxU/q4KejdJNA==
X-Received: by 2002:a05:620a:2943:b0:7c7:a555:4a11 with SMTP id af79cd13be357-7c7a76c22dcmr187486585a.44.1744253690016;
        Wed, 09 Apr 2025 19:54:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123197sm24032e87.44.2025.04.09.19.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 19:54:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 05:54:40 +0300
Subject: [PATCH v7 01/12] runqemu: also set GBM_BACKENDS_PATH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-mesa-25-v7-1-59d715c66e19@oss.qualcomm.com>
References: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
In-Reply-To: <20250410-mesa-25-v7-0-59d715c66e19@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2660;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tmoZR/PXF7m507OV2TN8Rfngn0pELOvLeNUojKEA+3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9zLwiR4hB+gJYFvINh22uUTll5Cl78yuWmzKh
 l08nWPxupiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/cy8AAKCRCLPIo+Aiko
 1UkyB/wKsgi6yJmAWkjx/4NW89LS0Q3rIEzt6YK5E3HBvqyceWg6K6fS8mNXIVxNeYJF42mDWV3
 8VZ8nobX4lvhKKl4hxoLV0PiTte71A3EVN2+RSn7jyorz/szHun7TVdG+p2Tgm10ylY1+FxdkOw
 t+orpxbkOaoTz58/WgUV0KgR5g8je0YpXZOVNukfrcN4oMPowXyAHRImGsyR61iMg20RD2qQxC0
 ZaTlu59mYewEwU/qy07vkRd6LovxFLsVImh8uC1YvhqBQHSH3q7c2upL0xSI+AbwMi0ImCdBVF3
 yjvHAmlJzkN8hJU7UGhHsHQO0YSqPPpdPFjXTdzPS0d6+0uc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PJgP+eqC c=1 sm=1 tr=0 ts=67f732fc cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=5p7H2duF2IrNtC3iPlkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: q7gxUuiMuZWech3mkkmslQ3RezcCDlrD
X-Proofpoint-GUID: q7gxUuiMuZWech3mkkmslQ3RezcCDlrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=811 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 02:55:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214603

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


