Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B117C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 17:14:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.29585.1747934039247366705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 10:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FGO4BAct;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFekcI031754
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GjRqES3fPZx
	bWN6eYrVipMMzcx5DHVff2NN2N6Rfp1U=; b=FGO4BActwddB4OeEpvz5D5nle/L
	XYL+Kghf8t8fKvk/6zEBDn4EtvpL9JmaPX9k8QBQ/wlUPrUk8tvIcOctsATXBzCL
	0bwj95wwPJap/2n6gXTxBMom9Xy7mbLv/Mqh2ajQDdYnhLHOwZ3GAlQBfonGrulb
	o0A1mruEKxcdVxgR+thwe4QtRyuW46jlxKiZzkqGKLOM8Wkr2imcnHA+T+SwS+7A
	w3xx8aut3gLedvHQL8YzmOsVqoePXUuTid6xmrZ1auR3D/3dh8fvMhQAQOOlGCoX
	47kgZiIij6gpopjTaZ0876CmjKzasoX2Kka9oH8cL9hBW0sDiRt6NVTwCQQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c25sa5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:13:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8e7b78eebso72713206d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934037; x=1748538837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GjRqES3fPZxbWN6eYrVipMMzcx5DHVff2NN2N6Rfp1U=;
        b=PovpbKMzSyEzAxcXmpQ2szryhYoOyLAnkWVVXbQ6I6/HLlAu+Hd8B9dLN2vEk0mrzD
         HXyNb5qta5rZphsM8PBdQEHC8CQaLtQkmaLLZiwB4Y121ACasblIeuETgq1QgF0ZbgMz
         JrUEalYQoh7DjvVt8i/4Wf2thCSpb3J9sPLQ/oy/6n3fm51zX1q03IpMmc2fUXrnbxf9
         HYp4SvYSJ4oQGn3fLa2m9ObBIyXpImZ+t5zLC0uwbIKI7bkZEdKKkVxVn+xOS7LS8du1
         OJypjwuKHVmqfXVX84mLPgfCyciSKh9Sjo1Jw3d/Gsx9IZwMbQXaCKpm3D3i6ZRQ6oyi
         ssDQ==
X-Gm-Message-State: AOJu0YwyS7lLdxpeBSeXoIkdRmZ5fCpz1d1dMDSGVQ4YhLGwOXQLDJMr
	B7ar8xFXjoWF+Bj0QGdas7FUNsCmp8p/FFjMAs6gCsrgai86tGZoTocU5aFsNXBYLEJQ3uMKytZ
	EiHnMSCCl9mQe2yy81V73BFwKIfWmZmBQkGN6PMeCKIfTt9rd9KtapXWAItO9tG7jYu+HGeFPrE
	LghrgUUGp5kUpfuLs=
X-Gm-Gg: ASbGncubNFybIQ1eBsh7TJjMN2VEvP9l+pUsYAVKvlbbivHyxmnOy8hzwSI9NHDoNVA
	zbkiai1tl1j8c8awdGJhhu6jkS0A5Br4h2XYKOjLV6hsMcd/8j5oGaUrxf9hrK25aJf5Jg3DGOa
	scp5FudFwiy26INuG5apejd3OzVRm4/f1Fe5vXBAq8caEy9kKYLm0eYe7CPCJlrHT4LYc/H7MbI
	Tr0Ehmz65sunffzfAMiZDILCqha4Ek+6ep5BcjqZFx5Y+YbFQqZ+hBlE6BWH237aTfGItliAHH3
	TWcSdXw+wtqccilKilCJe2Gxbh8KpqlpIOFdQkcyUg32xFBOWOiozVP+UjCvgltG4xJkIF3fnqn
	ibOHO3DkYMlEVSjMudKnnUh6l
X-Received: by 2002:ac8:5ccd:0:b0:476:739a:5cf3 with SMTP id d75a77b69052e-494b074d0c6mr451634211cf.1.1747934037036;
        Thu, 22 May 2025 10:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqNZ+9pHu1p3z0IUVlWbTANE+UFgBVQQYFdC2uQAIrmAEWCEW5dACu3Ccpo9Ojli7j3lRUOA==
X-Received: by 2002:ad4:5943:0:b0:6f8:d76c:5869 with SMTP id 6a1803df08f44-6f8d76c6114mr254147116d6.0.1747934025677;
        Thu, 22 May 2025 10:13:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f165c7sm3501438e87.32.2025.05.22.10.13.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:13:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 08/11] mesa: don't set RCONFLICTS / PROVIDES if glvnd is enabled
Date: Thu, 22 May 2025 20:13:31 +0300
Message-Id: <20250522171334.3040820-8-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE3NCBTYWx0ZWRfX3F/Xqi1zNgss
 2HI+fSiVIk4F5DaEYd9lL4FPBeCsx135AgLqPeggaLL1YZW1jbp6RkOL8DlDAUb1y98yAz7yRnI
 LmEp6Z9P3j+lL6dsqmgyOZH8/kzVHGQUXqKrV+a2I0l1v+G+UdiID26i4iIHuako4lHmwUfYWx7
 xs3SbB9g1hjL/0C1yYshkQjiHkV/PLUagft0KUG8o/SNB5O5MxLIilAIq6O6opVtBNJwv/oQNDV
 S83Rpj26gn/wXAU9xFM+fyf3SgbVZOIz3cl8puxsd92+Lm0hfIthoMCvAw20Bbgpn175mDjAK7x
 MiAKAdAxEKcd10FxGlGo1GjJQC+5Cejch81zDD2AUd3fGqW+wLrbkaloMW9oWOt8Ozk5nIsgnpg
 rIOkDuS7GDUC1UdtVlL3wXSMloAwl9NyN5EWweNjdNRi9bU/gDg/wpSlRJQoQP2ZbQGaAQkU
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f5b56 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=3twMZPdHqkYPyOBvze0A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: UR11e0tE33jq6dBa9AjmAsfS3TXoHrDm
X-Proofpoint-GUID: UR11e0tE33jq6dBa9AjmAsfS3TXoHrDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220174
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 17:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217142

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
index 78747c8e6cf5..4c61447031e3 100644
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


