Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F657C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 15:18:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.11406.1743607111577763546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 08:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=birWgAHx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532D8g6E023766
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Apr 2025 15:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EnlX3QWUCYrIsL2ngorW5rdEdpjwxn2t0gbHgboQkRY=; b=birWgAHxYX6HyMi6
	Cv+KCfbyPS+iLpD4GlMd3p/79KL7tHkV0bh4QAkWtQ6GsSi+Sh/rLAxTcM3Y4AsR
	IrpEEaFzQBoXu18L3t1fHrRQf409GuDdKO8MjEG1nIc26EV7PTKZDsVV4NMxFAT8
	pD2PPSXITkdCG/eUnZBiM6476izbcMJOAI/olhVOcm/k2UCr7RHmV5eWHh1OCWqy
	Pobx/oXLvXqaTxDT2UT20MpCFNU44ZDN7J8ebgv3Qhe/AQUmaewOyJn++Kiys0Yx
	yCouS+tc8UfXgteZSlenzfXw95sBZUkeJzZf3D3o+461jPjGndzmzAsyYCSQ7tCB
	sBQIkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxapssjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5ba3b91b1so194867285a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607109; x=1744211909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnlX3QWUCYrIsL2ngorW5rdEdpjwxn2t0gbHgboQkRY=;
        b=rMhQp0jiYcXraTzmqajGfCx0Xvhv2IVrRQW+HHm+8SzSG53cpt3cOB82ep1rsmvqs8
         gAjBIvP2hLajgGgCyYQQ0mQtJ51QNgu9oyMg1OzHglz+VPaJzyjULXw6TvhnL4jgxFYD
         kdNUzEsbqYFcWjIBDoQMS9SjGKjBNPiRNk34jNipzEn9Q6E5XjZ6iWcgTxbUMX4agcGD
         MFiShGinV6102lwjgPBnynVmGIr5WoPAH2A3NyTmT8dIWq/NM1kbLrTSiZsniy1WoXo3
         GYofvS8zjdcXldQkqULE5mpkvENlD59pUPKBVRDxl1cVWHRPYYyXqpNq15t1tVp+N7Sj
         vciQ==
X-Gm-Message-State: AOJu0YyoDkCMMaDsGyet9NdhHa6dQpMgk1EeljQx9exmcpsa6frQzLMk
	vyCn+FVGz9M0u0h1zx9W94MOwTNIO/12Q3qh6WF7PQ5bCJf5k4kVKCsPnZlFve7eRRmFiWzLD9D
	SXkm6LVUTuX3ZGIZvQTuCq08rJk4zM3Y4w/jtuyfrz4GqOp6kxi6b1ijtXrA584zq/aNybRNKi7
	bzwJOgrlTv/7E=
X-Gm-Gg: ASbGncs5KU5Z/hahzxudcB0GgZ7KyiareASMa3we6iRyBCDlaMh1LrfY+IoUOWJ9a8E
	XBxeQAXXgNP0ctPFmNrPvpkKzGvD/IgfBpYYFiISCoXuSpa0Pk90mX5ymXfiU+iBQV95DGsuvIa
	YSaJg3yFeYAWtFFZtwHzluvn4T+sy4eup5/nqcNz6bBrSKgYmdPThJ4TH77uRBD3mRL1UqUQD5G
	L+Zei8OMYW4r8uni+Qe/iuhaYI1Tl7/PWpW9iwIAI4HzfZgilDXd7Zp8awqJs3erx8dRXq36Oyz
	Nsfspy/5DIojGtPjaWafroTnqiqiRmLUKNYyppL++h7ER5RfnLKGVSw2rGnoh8ZBzhFU2honbly
	U3j4VMHTe4Dx+a72GgxbHCwbnZ9rV
X-Received: by 2002:a05:620a:25cb:b0:7c0:a9ee:e6c1 with SMTP id af79cd13be357-7c768233580mr330677385a.7.1743607109320;
        Wed, 02 Apr 2025 08:18:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC79Ag5fA+OB66xEFIwUu5BrcT8Z1QEg9cRlW9fcei17NNnMr11Bjq/QUcaw2Ioohk8UJUFg==
X-Received: by 2002:a05:620a:25cb:b0:7c0:a9ee:e6c1 with SMTP id af79cd13be357-7c768233580mr330676285a.7.1743607108978;
        Wed, 02 Apr 2025 08:18:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd35925d7sm19946371fa.91.2025.04.02.08.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:18:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 18:18:23 +0300
Subject: [PATCH v5 01/11] runqemu: also set GBM_BACKENDS_PATH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-mesa-25-v5-1-ab35f021a83b@oss.qualcomm.com>
References: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
In-Reply-To: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2660;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tmoZR/PXF7m507OV2TN8Rfngn0pELOvLeNUojKEA+3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn7VVADWtRb3LmR9h2PUbvS0jGdjg5q08vGnLDZ
 F7uTtSVCoeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+1VQAAKCRCLPIo+Aiko
 1anLB/0Q92A5h65+o+cucaPILNWrHSpnyW7/XYnXmPKnyQ7J9cj1xAty5B/6DHTiN4kTyUgI1rz
 gNpKch4LJE5y/gPi4GHBBwo3XLeVHkOE4Cyv9D1gsbYLz2npo7AI8JgGBwWNNW3VWfXgVZlxhhM
 zbNAATaxsIhOEJZ9+5Dt1JmTb2fTRD/QYRyQ7DYvAfa7BiwOba3QzHiUFQZixgtbystArpa85L2
 Fs73ZKAcGMN4+qDp1Ti8UJFfHNzQzbMRsxI7aEJdylLgPBGUxEN65BLHJ68/uQQlqoWbx7ZTLdh
 J3yyruW2Qda9HEo3cSViiet9yn0KJ6BLUijj+/tByxYlF3LH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67ed5547 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=5p7H2duF2IrNtC3iPlkA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: UxqvMivEvIu-IIdNlBf512OYMvoY_TJu
X-Proofpoint-GUID: UxqvMivEvIu-IIdNlBf512OYMvoY_TJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=756
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 15:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214269

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


