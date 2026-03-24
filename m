Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2E8F532F5
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 08:45:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15178.1774341899661691002
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 01:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=H8tQdY2S;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=LooKWvuz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3WUs23903942
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 08:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PMSjdM7xCMR7bE3g6SzuyNM7LEycfjMXXyV
	6zk3sBxQ=; b=H8tQdY2SRVPyxHsk61DQ1r/F99D70TgluYcN/3sNCn7LUkew/CE
	kPXRkyFSHw4/GWOU9d2Ep79a+2uIOrUI9h4DIraHM+uXsX8mYG/qSWd27hPXulxs
	VYZhfXm9SSnucf8MakPmP2XhjquHtqvJ2NDLb5npHosrehhWFNuFSz/qeNpc3SSF
	Fb+V1fLjay6nhsdXxNY/7K/q2qsn7Aco1zKhIxulEpoYRrGj4YOG3hSV+ctMiwfz
	8wNQJCD+vpQumPYBJexsBUAWZO88CkuuOOQhn+Mf96Fp5BcD6K0JQsi5U3v46FVl
	mv5aKeUQ9pQgEaNGu9TGOSIyOgvsmllm+pg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0h1fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 08:44:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094741c1c1so67890951cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774341897; x=1774946697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PMSjdM7xCMR7bE3g6SzuyNM7LEycfjMXXyV6zk3sBxQ=;
        b=LooKWvuz24daskArhuyx5/At9zJNVXqQRjyu7OH2EHQABVL/ZzVB2jl96G28iuYyY4
         qzjbrbNr4knEQbvvCqhEZeTUKl6npQ5IYS6RJsdSjv1hpqullzzvPXK0mXZkvbiN2vYR
         bdk5T9fIjvExmhETL5Fx2d2OwLUZrzSIdEFMw/NO37hc0JtP25raXL5mByOYzdNnz8vg
         QpBXrYcB224KthsGdfKSg9528WBa1WxqfIFipKnCZRcu84aEiiEsCa89BRXS4fMNxldC
         0qAIy6LE3aWv7I2WSucuf+K2M8z1GStfJwQZrENmSGMPFWAHBjqHt/FRGwzYr6GaUMdc
         d2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774341897; x=1774946697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PMSjdM7xCMR7bE3g6SzuyNM7LEycfjMXXyV6zk3sBxQ=;
        b=nDFsTrPoyQFInOMqPkNU4aksOlGUj6S9Fak5k5cBfYh2S7LHIm5qvKUnEfgaIl23CT
         8yBZCTFRZ9idwAF3siV3fiz73jLqnTl+mSiExsUdEic7dKOWFGZIlnNqWaIzPiLvUica
         PiCHJ2HTt3XP568NEeg09PmuRIv6xZHP5m/GhGZKrG+3r+Ku/HTKbrNb5AC7dFQQo2kK
         wCOMk3hJ6A/yxbFXUKJE8Njpg2GSXdPtRcedfbTdfH+rLWrdioA2QBRUXMINaXS77QXo
         dpcaHCe3T+jGrbu+EjFpkZjoY1/zb+kYVVio8852l2WNKLg/nNFrLS8stkX2NPeem47g
         VSsg==
X-Gm-Message-State: AOJu0Yy5FEBJtmvfzcVsX9vHA6hSV/Z9q/S4+hA25mWONhsPjl2WDEJy
	rvfGHGRT4DXjsLjTEnR/GhrULY/tndmDKtaVgQJs586LFpwOaKRbFGepXM25IVv+dXx7ikRRORk
	BtwSx4I7jKdDoe3TEeRn11tGZo7ffclyXjeFQiiOiydJTPli241xh91DyGY6epoKMoeun00en88
	ILwyi6U1k+Tm5cNdQ=
X-Gm-Gg: ATEYQzxGBiKnVnO4UGSZc6uflDjHgLP+/y2stivWDS5kUSsvWx6pmoecXn0VphUmu5c
	LWMCiTW20RW+PwPwaDogEarMslm2muw8hYs2IS9FoW/hNKXZxEeL1yzkEMynLoQY2TOOS/fXmXy
	aZMiVG8vnk3GbeAgh9r97KahDqCtWIbYAHIOdS/gj174XnGdUkN/2GYA37hWWg9H3xyJwPL4VHp
	b3vhiIWDo05aN5RDrNyQxLYZdcn/y56u6q09PXkcV++lWxYoJRHs00uKEdJa01R9GEk91UP1e+u
	LsUDhESOS38I8KnfExGnUJRRL+WRaufIbV4lswDUxPV3PbvwZxivBDJ7x49eEGFJCMQs8qBuL87
	sQVRtgz6yl2Q9BM/ewJZW5xhxkXIC2naIgC9r40yxPLmszLEvsjugIp7QgB5j/sLuECn53gwFYB
	pRxxDCQFEgLOVFnEq4q4YZN8v3vTgF8RP3mDU=
X-Received: by 2002:a05:622a:a98d:20b0:509:5dd4:7192 with SMTP id d75a77b69052e-50b37565d93mr161462691cf.54.1774341897546;
        Tue, 24 Mar 2026 01:44:57 -0700 (PDT)
X-Received: by 2002:a05:622a:a98d:20b0:509:5dd4:7192 with SMTP id d75a77b69052e-50b37565d93mr161462531cf.54.1774341896897;
        Tue, 24 Mar 2026 01:44:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851a113csm3043849e87.23.2026.03.24.01.44.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:44:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] default-providers: fix GLX / EGL providers
Date: Tue, 24 Mar 2026 10:44:53 +0200
Message-ID: <20260324084454.2971108-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fFBOQkon4-NWHYFp3c8qZABe4fqp8DVA
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c24f0a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=brjhx8i7JhRHaz1ew48A:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: fFBOQkon4-NWHYFp3c8qZABe4fqp8DVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA2OCBTYWx0ZWRfX2lUD/cf7OJqI
 /G0GmgvREKknapX/76jwcV5eBGiSVQ3jTdHSOhe6KkYYMdxJh/50TOyTX4UOc9C2Y5hOF1ChVWg
 +dhXp4ecVOecwa+hhvaLFKolDSNESlaZGNxCWOEqKSNX49ZnGlkx+64yh+fp/z7GTnwvmtYRx9z
 wrhod7oXtip3aFSubCjsWf7jrV7C4nkYhf5/P5Xo3bB/4Pxey9MBenhbdBVoTRrAsJI/ZEYp3C4
 fpfqgOP7RbpTZ6FZDxVQNcsuLeuprOa0JgKZ0h8OwNjDLexDy4y8VU+3KF2kZ3r+4B3YDV1Mycu
 lCdbDS3yTZADFMIm6TL6YH5h6fjAslW4sf16/mSDsuq14DAD/5XSxwF94ATkPiWY2+DVsz563Ia
 0mlhip1L2HdOiauZn9MLh8m+du5v+eTn2hllfDM/Y/GGmUd7xdKmmfO6KAVDdmnRd5KmshDXO8o
 ZPgMrIIfGLkTa7YBiBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 08:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233777

DEFAULT_RPROVIDER is expected to list runtime package names rather than
recipes. Fix runtime providers for EGL and GLX ICD virtual packages.

Fixes: c2b4971e79ec ("default-providers: fix GLVND providers to be selected at runtime")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/conf/distro/include/default-providers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 5101ad78f880..883ea2f8af8c 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -64,6 +64,6 @@ PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
 PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
 PREFERRED_PROVIDER_virtual/nativesdk-libsdl2 ?= "nativesdk-libsdl2"
 
-PREFERRED_RPROVIDER_virtual-libegl-icd ?= "mesa"
-PREFERRED_RPROVIDER_virtual-libglx-icd ?= "mesa"
+PREFERRED_RPROVIDER_virtual-libegl-icd ?= "libegl-mesa"
+PREFERRED_RPROVIDER_virtual-libglx-icd ?= "libglx-mesa"
 PREFERRED_RPROVIDER_virtual-x-terminal-emulator ?= "rxvt-unicode"
-- 
2.47.3


