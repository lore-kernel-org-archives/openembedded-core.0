Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABF5C54756
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:45:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.27417.1747763148650921702
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 10:45:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PdV/oBxm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGiCmD019033
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3K551ReRrrx
	/QmCbjesgc/+wMVNNJFNCeTsI4gY15vc=; b=PdV/oBxmjloh0t18SxJBcZouEKQ
	AjoEC5//qGXeD12/Yis/8UBUOiokD4SffHcxnM9yoqoP8kAeZiF1GPAQlF2vE2tz
	+WQ0sMCfNph/o1c+8D85HQxBt2zf0QPNFchBIY5bgR+oEsJYRC0nN1CQD2DFSsjy
	5CIJYqHR2/fWCn08PZZkP8tUWitoWgEdHAKZwb6oiwR4ZjEThpeobu5cmKJUpQXA
	u2plpuvJCRWKS7setRjAc0RXzbJi2/41Ae+49auUNN9Xw0dZ1By+Tr91LmUvqP8S
	U8fNtXj19rZkOWmXCZ9+9F4Wyq8lvjhUBZtMPkdzH+evBUsLz+/Td39gHjg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh586e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so6191168a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 10:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763147; x=1748367947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3K551ReRrrx/QmCbjesgc/+wMVNNJFNCeTsI4gY15vc=;
        b=ImYyk6813eMxE4wCSch4g6nRBIeEGgu1J5tO3tRrbfY3ezMI5kM+CkpXuJizzz3oZM
         boC43zrQ/ekV648Bz5/rG4A6C+ZPIPm/5Huf93V2l/jRHIqy0kBXnkinAy9zJSGMUZ5c
         q+cAC7dcUK/yIVyng8C8fdSIgPSVtHQLPe38/iG0INP1jxsg/jbAXtQ8P5pRjX17FeSS
         9diSzEx0DlUvfi/BDRrKJmZvoFpszqcIEdyEOgmL/th8PeRYSaapulVCJxPjjm5ZzeSj
         NSKhNAGdJN3mX9nNy2WQ3w8dzJUXMfwJFKvtIfCBxiXYFNWcvrixPEIoYDCZzRM0QFMs
         2M1Q==
X-Gm-Message-State: AOJu0Yz3mL7o5wKuaxF9ww5tafYPjasFjUKXs9iCcVoW8t7q7kwRj+r9
	jvNURdqoxSXovJZ2W5Ve7NTBFA60F4L7nLZiMgJPP/tUR87PWpIivEmHxqJrziIawIm5NAFY+3o
	piWoDs8909ntPmRfQhQQWDmOBN1jFtGTCdUrae6xYRv6ZLgBCYFrtnjT4kCXGQUzV7AHxbxC3s2
	AliCvXmmR083ykbNbpDw==
X-Gm-Gg: ASbGnctNj3ya2YutKA+oe4W9zMfGVqfQ9PxXvlxJChxer39awUUVTt5k+vfzgNZ2evB
	wXE/e36fomFh7sNQFO44/7IohRsFoBlEhE0rTL+p1Dgbq4gxAEP7q3LVQeztdwJ1OY8zssADdjd
	SR2/euXp6QuUy7O+JrXF/6qi9oJJB3uX5rUSdUUvWM50SgI+0V+kUTuc5Hz5U3JA4gmQolaAfOZ
	JXqJPjD5icEfOlopjBLop2LvuZkwjiDo+mZehAq13DC6sDyLFzNVAWjZkhCzp7cTw6JipZUnsEC
	TZBQxTgYefT74PRDGtTNXZZS6nanekvxeHY9kux2MMKKgkON0NKLKz2/I1LUkXdLh92jyDR5lpW
	U92opxmILqXUyfBYsA24RTlZ4
X-Received: by 2002:a05:6a20:728e:b0:1f5:7df9:f13c with SMTP id adf61e73a8af0-2170ce3aa79mr25270547637.41.1747763146861;
        Tue, 20 May 2025 10:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjYWb2XPCO8awEmyxf14yOhu+DD7BM3Rk57TX6//UMVk0RhO39Zsx9jhOmC4VvwV23Kd7Vew==
X-Received: by 2002:ad4:5ae3:0:b0:6f8:d76c:5885 with SMTP id 6a1803df08f44-6f8d76c5dadmr172095696d6.37.1747763135449;
        Tue, 20 May 2025 10:45:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fcb3sm2437225e87.86.2025.05.20.10.45.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:45:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] mesa: don't set RCONFLICTS / PROVIDES if glvnd is enabled
Date: Tue, 20 May 2025 20:45:28 +0300
Message-Id: <20250520174529.1173460-4-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520174529.1173460-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250520174529.1173460-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE0OCBTYWx0ZWRfX2yHj2iRrKmQh
 f7rXhTNNUaFJSGDz9apcCWVOesqcny1ctviTSin2i6iQygRiq1bg30KN6O4ldnVmde1jnj5I6G0
 i0Ypuqepl94laOWQudMEgmuAi/8uFLvd/MyB/eD4o9rUlkes+/qwvvIxYNudeOpaqbzzvRzqwwx
 FENZBIC6tR3jrxhI82TL+D0iIt3qCl3DTNPX2XzcTxlYwBu+bDQTBZtBUYYN1xWH5i5voh/xfq+
 4ucgjU0uDbrH4kb+VY4v7aEmF6mi7nAad9npg65N0LaYNOAJ9drYcX+xOIVmXiWCgWf1SgaPWeH
 BCGv0BV5JsMRsM5roeWZ/pWtAyEhgZQ0Qgd45R+5MJDfz3tTT+iCzXcWd7BFp9a8TSufjYFoNMr
 IufEfsD/TQjOjBWhgEjRAefgJ2KgxbmuhZdwfaA/cLa6K1Gu7NWJAm/UTdRxNBkrdn6zf/rN
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682cbfcc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=FoWhTOj7dWN7FlkGM-EA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: FpW0l4BJ0MtG2YGONr7cUBad8uNZEye0
X-Proofpoint-ORIG-GUID: FpW0l4BJ0MtG2YGONr7cUBad8uNZEye0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_08,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 17:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216929

If glvnd is enabled, mesa packages do not provide full library
implementations (instead it provides two ICDs, one for EGL, one for
GLX). This means that there is no more conflict between mesa packages
and other vendor packages. Stop setting those extra tags for mesa
packages.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 44 ++++++++++++++---------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index fdebae7977e4..53f77b98c898 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -289,28 +289,28 @@ python __anonymous() {
 
     d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" % (mlprefix, suffix), "1")
 
-    for p in (("egl", "libegl", "libegl1"),
-              ("opengl", "libgl", "libgl1"),
-              ("glvnd", "libglx",),
-              ("gles", "libgles1", "libglesv1-cm1"),
-              ("gles", "libgles2", "libglesv2-2"),
-              ("gles", "libgles3",)):
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
+                  ("gles", "libgles2", "libglesv2-2"),
+                  ("gles", "libgles3",)):
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


