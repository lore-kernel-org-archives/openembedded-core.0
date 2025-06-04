Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EAEC61CE7
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 22:29:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.29930.1749076141436818174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 15:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LU5C4NxM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554H3i2o004229
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 22:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H2sIvg73vDMMyuF2YBwJdwy5mLpMmVR+U/d
	6AbRPUGE=; b=LU5C4NxMtPMA3eaexlUC0/9+70Odop+ZG9008CHpuwA6lG1Lf33
	Xvxg/l1VY/bG7xtq6JqLvs/kenTymdCLEEQumKRpFVeamS5jMOlJsb7O7k/ktHVP
	dDcf1qUnyspww0Xle1+AVx+bX4t0gYCCKJDeVGzYAJoRik9FsDMYzCMB52f0PS0q
	tZ1waF4GL/dDMeDr9/PKHQop87GA1oGKb/bWCfDDUz+qdKs9hLhl9TkRIaSG+qqN
	kkGARweDWN3SFb7qHP63iF6Y8htJArpx5X8phfSM7B5ak2BLVHprrO3GYxNG/tec
	LtZPdwjGTbk4kfJU5hkIsbTcH0HgeifFZNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ryfv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 22:29:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09ed509aaso80153485a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 15:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749076139; x=1749680939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2sIvg73vDMMyuF2YBwJdwy5mLpMmVR+U/d6AbRPUGE=;
        b=V2xGJLjoBOlX08BMf2E4Rzby6AZj9Rt/qH7WYM75ZQFyPvda5gVbaZ8LnwFtZHSMNx
         BBPo0QDbPBodUXvAsnumxJgBxaRPYShyVq4tc2UO8MS3x9DHxwLh4+bSr3rqewMqHXdM
         5FpFWbqFsjOIiktSQjP2jBMvS45i9VTDqyLVIsXkPUUnW/2ccpcx0xsOhsEZJ1DIqRDA
         x6nzHsv9Oo+2anfhCmQzNVode6gz3DeiK+6JnNjfVTL0QnGM2SLd78ABA+89chg8O2KF
         xgW+5YcGjq/qaql2ILf4sDTccpKb/Mb9RHiIhgaLHdawujZH2r7mJNSn4f3d9hRkl31C
         xdWw==
X-Gm-Message-State: AOJu0Ywyb6qtzqWiinxwblbqaVzqRTin2b4X/P79tESwJl+b2XBrTqJh
	4fZ7z3DXo5D+TH7KxSMO0eirkC3B1a5sTw5DUPlodW7Z0pAUIyWGVemiNIAQwryftZtko2pneJm
	WwBKMlsTNUniu7rZJljeRZe7CBTG+vCRHCoqp8QAuJctOqIrvSm58ytA92By82i3rZlVPtz/e6K
	20Jrey+X57NAzzvhdTTg==
X-Gm-Gg: ASbGncvN4J0rnSijO5KbbG0niE44ZJlWycjyJx8IH0yva0jKA605E+I2sp/l4Od6VLJ
	ddow/zh/OzYCOHmiMN3x66H9V1zPWqhO/bcfJlVCHtrCB0iXQFAwt+VszxJQkTuxbroSxs44t/X
	yY1Hq2D3kUIeHcOlhlpnOo/+/qhIguY0LxjpwstcWxjHkRr3H/RrTJ8YI+3CJrpKrdVcBlMll7J
	IQfoe3NDff++0IcYG1NMT2c+o3oIIJvwNHkiDf8l+nJxnLnpvswvLUbql/R3ozacQQt0LLGquFO
	Ja9Dg/EQVB2EoEK0FNPOgxXd2AfR0zr6MELJkyAPTioLrh6jgJeYvjbg6tj01Qwtfp912lzMqCi
	RfmP3zWUbc9QYho8pzhu3bb/r
X-Received: by 2002:a05:620a:6009:b0:7cd:cd:44f9 with SMTP id af79cd13be357-7d2199a6cafmr940194185a.36.1749076139283;
        Wed, 04 Jun 2025 15:28:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVu4gkbJIgwMZIr+z6JTeMaHLuYqDgFI1pAKvN8+cTy/655niHderCaCk2phGcat1UEwHh/A==
X-Received: by 2002:a05:620a:6009:b0:7cd:cd:44f9 with SMTP id af79cd13be357-7d2199a6cafmr940190885a.36.1749076138774;
        Wed, 04 Jun 2025 15:28:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337910e38sm2430327e87.131.2025.06.04.15.28.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 15:28:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] mesa-gl: drop obsolete comment
Date: Thu,  5 Jun 2025 01:28:56 +0300
Message-Id: <20250604222857.689289-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zEENPG3hp1ChsNsW-ZqFSy2xfCoJzaYU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDE4NSBTYWx0ZWRfX2HuiKUHFmOeW
 lZDumFYqBAuG/3af675JDXP0mWZtdl3fS8BjrjmKO017XvK93Lw2kURn+FEfHXAYEEO/KxQsY1F
 boD5bU9MtlQT3SsyrrM0pcatVmFrOQHqla1AEjqjUwFwXbauilHsLDrW7CrsSvj2JYf72zsaW6E
 lLBruTzSQdkPsSyoJpt+y+dTaDl9JT8f+mwgJwFs8b56g483uxEyI9s+MpCJb8wN5CBUHS+R6Ow
 LD81CdzRbjavLazWmPlv/qj/ipxfw3dajM6/Q8xxfDEM+hxRWaVO1bBEUh9p7c44PrOeFTSSD/E
 XPn2emkby6w7CXU/MaT1hr4bszLYDf0644LxnCX/IxUHTajktnVfT+Kuw2F5BTBEShdvKJAEBTU
 uoGMzEr/k/8PqP56D/PxUyRu2j6rHcgkFtWtIEaGs0hfwM2yzqdo7QFvcHIS8IFin8Z+gjN4
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=6840c8ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=SUagrmFAZWmp-dCTvIIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: zEENPG3hp1ChsNsW-ZqFSy2xfCoJzaYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=847 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040185
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 22:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217968

Drop comment mentioning OSMesa (which was removed from mesa).

Fixes: 7ee8e99a5204 ("mesa-gl: Remove osmesa dependency")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 680fda1be5c9..2bdabddc287d 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -9,7 +9,6 @@ S = "${WORKDIR}/mesa-${PV}"
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
 # At least one DRI rendering engine is required to build mesa.
-# When no X11 is available, use osmesa for the rendering engine.
 PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG:class-target = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
-- 
2.39.5


