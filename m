Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48028C54FB3
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:46:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.25722.1747925179825502568
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:46:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KA2jMS5a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7kcFO031694
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zLOGEMHCAY2
	x5LpgdfRla/OEDCFqlorCe1VG7ahPS70=; b=KA2jMS5aNzWgWInJu4JXA4YioqD
	g4CSAGMzqq7dzDWtvcGcsVV01jPMp/I+gr22CvV8Lpqx1jzxCJo0UFyOKhCb/bLv
	ZwKB5u0osyW7pmutjcdnfUDWCcrRIW89E772mSao9L154PMqutRsokUWbhHGPLbS
	BjHNASy4VFBq7IZF4Hcqo40EtAn3AqrllfqUVo2zOd9lWFeUTifwFL5Fa1yZXZoL
	kTBILpZobkOOEQc6UIL9ljOWCx/iDyU9P9SMMqIDZzYzhHb0fiYjv3r0MqX6IJUi
	lAQ0t05a0nfVW3xTmnkV3JGOvGHgakqcUZoZCuBFqvtv29PlZDQ33ZA4RBQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c25an4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:19 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8e114ef64so72463616d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 07:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925178; x=1748529978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zLOGEMHCAY2x5LpgdfRla/OEDCFqlorCe1VG7ahPS70=;
        b=HstF401eVBL+ucIeyXTMgNSovfqh/IBeu1no0Xft8FMj1YMG+kGC5TWcJHShPTAKN6
         UTbjUUFdT34+yAkeiEHB0q4pSdlHb3cBWH7kJ4FTyJXgVw8KGuyEtOFTKIbFI3+V0TAc
         Ll4FnzGVqn5Ikq5ADHVlM5ocwHrF2Unk3m84/ALEut+J5DRwFAGnMF33iMhISoiuuhe+
         fxRrV/svN4I2DSwNXVzExfbiS1yx15UnViPg3u7ghKca0oFHfujNcmarp48t8+lh9KIO
         +6i8TLjm0Si2rWB188NSMTXdwN+YvhtRtFXcjEEz5BUZF2ChIWqBJTHblxCEsKpPh2aV
         kP8A==
X-Gm-Message-State: AOJu0YycAHAuCp673jHfYy/qAIa4Gt4ign71gx1sFZaixMK4nE9N7TNK
	AP5vhnosR/D0CQKM2KsVeDIOihHSiFhLGGATCIsWUwIfVUo008mj0LhxCc3J+TLVxKdQ78chYRM
	e2y6zJmKJR9K77WTZmZPv5wibQxtQIXwV68jgdNlHsFlLRDmpCDPxAmdxESRTApm1PvJKrwMmd4
	Q8Ud7nFxf52tPkcQ4=
X-Gm-Gg: ASbGncsL5i/+8haw1vTseBtMuxaytoqg2jGCfHB6ELyfI2Wwevjfw19ieL3ZAmSzfvP
	E3110kRGzzLHldu9AinfST5JNrKRBRBw3SVgsJ2x4R/06Y8HLF9oDLHwjmNSbCZpccdcE354J/6
	s4Nhg0ivdm+92xyKnxjiDayxlaI2GEA0WuyJ14flhuu5xisPl0asFuin8OD558x2zwQwQDhUzLI
	eyfy6sxq3PoUhP2Ifegpw/cYYlhJeBkDA1hjKg3DyY6cWp/t6mxIu+3zdQP1uIhvUg6ztY4kpKQ
	iZ/9FKynKr1bEHJV02CafZ4NP+pcVAmmTK4HCWABSoSyQvS1clvCxqzJAc3pF7JFCW5sradKYRP
	ig78aAgL8NpL77/i67y7W3dxc
X-Received: by 2002:ad4:5ec8:0:b0:6e8:f91a:c5a with SMTP id 6a1803df08f44-6f8b2d3f4ccmr411938916d6.22.1747925177581;
        Thu, 22 May 2025 07:46:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcrnIoJSq0BpHjPs/uAQMsv1SM4N1QnUjkl6ElHNGPlUvrznv8eK5IRoWVrAKDoh7gb81gvA==
X-Received: by 2002:ad4:5ec8:0:b0:6e8:f91a:c5a with SMTP id 6a1803df08f44-6f8b2d3f4ccmr411938406d6.22.1747925177110;
        Thu, 22 May 2025 07:46:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cabdasm33031551fa.44.2025.05.22.07.46.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:46:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 08/12] mesa: don't set RCONFLICTS / PROVIDES if glvnd is enabled
Date: Thu, 22 May 2025 17:46:01 +0300
Message-Id: <20250522144605.2876771-8-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1MCBTYWx0ZWRfX4QFFG/eBYpag
 oegKLoq5K6Mhgs2rkDSDLqaRJ58vmRfSQKIFT7SWAqocCgQGhhDJMma6dv1MY2cB9nXxYjjVzIC
 8WfjjJI3mkA2M84oO5xOpUeh3y/tYBhwe9al25vS+XapyZ5+yaXXII6wrmGYLX3J+HZ1n44r3+o
 W/2wnWUF183oD5xWVQAh8X7PTzlL1HpIuVRBx05pzdzvdmF6bDbOK/l+AplmoyxTDIc9joMLOzK
 0rXKJtciv2MlsClI/otBdme0fWm6dnFDfLy3YPE45bzfuAPUID7AmXVMh2+fmIOwQ3RSIDGzef9
 V4K0ZHdE3JRROu3EFUyZOiiPBBj84Tk3JlthqGtaaNeTw4OnWh4ZRSHO0mc6hkeK1YZJe/i+7tZ
 wkkvWlTlBcwrqHk1X+DmFuNCVr6apRXIAGDU+IWX0JyENedR59qxAGov6yhxMHSSbCks+nfX
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f38bb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=3twMZPdHqkYPyOBvze0A:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 0Rys2xR-VV4hOLUUJRY78fmFlscLkOSd
X-Proofpoint-GUID: 0Rys2xR-VV4hOLUUJRY78fmFlscLkOSd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217119

If glvnd is enabled, mesa packages do not provide full library
implementations (instead it provides two ICDs, one for EGL, one for
GLX). This means that there is no more conflict between mesa packages
and other vendor packages. Stop setting those extra tags for mesa
packages.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 42 ++++++++++++++---------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c97df9471505..f5d5539a1f99 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -275,27 +275,27 @@ python __anonymous() {
 
     d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" % (mlprefix, suffix), "1")
 
-    for p in (("egl", "libegl", "libegl1"),
-              ("opengl", "libgl", "libgl1"),
-              ("glvnd", "libglx",),
-              ("gles", "libgles1", "libglesv1-cm1"),
-              ("gles", "libgles2", "libglesv2-2", "libgles3")):
-        if not p[0] in pkgconfig:
-            continue
-        fullp = mlprefix + p[1] + "-mesa" + suffix
-        pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
-        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
-        d.appendVar("RREPLACES:" + fullp, pkgs)
-        d.appendVar("RPROVIDES:" + fullp, pkgs)
-        d.appendVar("RCONFLICTS:" + fullp, pkgs)
-
-        # For -dev, the first element is both the Debian and original name
-        fullp = mlprefix + p[1] + "-mesa-dev" + suffix
-        pkgs = " " + mlprefix + p[1] + "-dev" + suffix
-        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
-        d.appendVar("RREPLACES:" + fullp, pkgs)
-        d.appendVar("RPROVIDES:" + fullp, pkgs)
-        d.appendVar("RCONFLICTS:" + fullp, pkgs)
+    if 'glvnd' not in pkgconfig:
+        for p in (("egl", "libegl", "libegl1"),
+                  ("opengl", "libgl", "libgl1"),
+                  ("gles", "libgles1", "libglesv1-cm1"),
+                  ("gles", "libgles2", "libglesv2-2", "libgles3")):
+            if not p[0] in pkgconfig:
+                continue
+            fullp = mlprefix + p[1] + "-mesa" + suffix
+            pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
+            d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+            d.appendVar("RREPLACES:" + fullp, pkgs)
+            d.appendVar("RPROVIDES:" + fullp, pkgs)
+            d.appendVar("RCONFLICTS:" + fullp, pkgs)
+
+            # For -dev, the first element is both the Debian and original name
+            fullp = mlprefix + p[1] + "-mesa-dev" + suffix
+            pkgs = " " + mlprefix + p[1] + "-dev" + suffix
+            d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+            d.appendVar("RREPLACES:" + fullp, pkgs)
+            d.appendVar("RPROVIDES:" + fullp, pkgs)
+            d.appendVar("RCONFLICTS:" + fullp, pkgs)
 }
 
 python mesa_populate_packages() {
-- 
2.39.5


