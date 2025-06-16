Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0719AC7115B
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 16:10:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.1058.1750090247085031193
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 09:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pn961Scp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8SLBf010074
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oHbSXsBcxNY
	OvHpPD7Ca6jXZhvjS0OkEqjY5dD5gxQo=; b=pn961ScphgS7NwOUNuYbuRmOXXa
	26zHVj8lpCExuSd/AQ+2nZ8zf+NmCiC/0vJVGNwK4t4CoZCRnTr+hjtK77TG5JjP
	pyR9QRcgXnHiI1FLhpPHWma/0syco1akQWbnEr3keMdNAS0AobDzE1osfABt8OoK
	Hq4BdfTZqWYlEF2zOK8iyo29leMoWPOG0uiUxwAwLcDkPmG1TGq4L0Ix+EPwyN+M
	WVlR3bHO6uEiEXlJNWkeA5adxhTD63KFHPGCc0WjM4tRAc7JmjYjoHhaiZejcfrs
	xQkFaGuaIrRxuL9J1IP1Kz8VI1rdYfxm+spU3orVOlgt0fXaZPfaZGdSXgg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfd7xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0981315c8so434639285a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750090245; x=1750695045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHbSXsBcxNYOvHpPD7Ca6jXZhvjS0OkEqjY5dD5gxQo=;
        b=AAOUMK+Lt5DNMtCWo5HmOcyIsvclADh2kib1mCdEDg1cFBhMOEkCfo+QoDQ6os5FGa
         6iK9VafzZXardQcQj5HDLI7ak+lEwEYpTJNaL37qa9v9fs5mvHWgD+XXe3wnX1UJwymN
         oeOqdp1zYebjpmHOdwurHvHTO2B0kndo/sGFf2S/vI0mwwVyl+Y4T3hw7TKMN2FeZmHQ
         JbIFW1p72eH5z4qTXv+DNzb2IbESFGnmgbIMFWp/gLOl214r/9UwyKxcuy1MvW1cdKEZ
         c3HkuwE+HWsQmBFbkamZWMncFrYoIC5fshtjBiXXFNySqqIqf9YH+9Xjz6rD+2u7LyDP
         /MhA==
X-Gm-Message-State: AOJu0YwTg7i+bbZz9p2yZ6x9AfTmtOyLSpGtCQ13DLWx8yheGBTG+GJQ
	dTEreikeYZPJ0u/Oz9ud8X0+X/gn4/9qpxVgqe+/u74uSvO/r5gtJKN2Rw8awKKDWHCV8e3xwTk
	Q4yQbfK75PKuzNKqfLobD/48X8tsgi5/f+j4lIeTKtpyqaSJPrmsc9Y1yE0oE8BhC+GKe7k9ibr
	/FdEPzBFnig5dd4PT5aA==
X-Gm-Gg: ASbGncs7WnWnWZIGBTkOrQD+Swn3OmvbGIBZ2K5eoAKih5RUvHTs5EwcN7meeWG3dpl
	B7j9QUoFlOnmGM1dBurWi4MWxQhZ6/8Nj3NRyeO7OS/Vca1gbF18FKG3fmu1ZL/eTP4SToFkoDu
	ZClTbcQFwvX5ccsPS/l2p84/ERJf+J2iX83Yg4mvVEB8L2kzqbaSpNJmiKg9IUTgLLSbfXQdSFg
	Pa2zDCWVBS9gqvPwlXo/LHAp71f+NZYYuPj/VnoV+DojJQaUSt7PBqA8Xnv90DtpC7/CFNICrSQ
	wXcGeIp2uhGIjlV9gcI1FlkBZR5YjFUrov/XVl62c4yL+DOhIPlsB2W6CVcmAaY36Dj2E4HuWEj
	gKQj1w23QaELONNL/ZaFSMQQBogV7R87nhnw=
X-Received: by 2002:a05:620a:271c:b0:7cd:4dbf:3c49 with SMTP id af79cd13be357-7d3c6cf1c3bmr1771797485a.43.1750090245029;
        Mon, 16 Jun 2025 09:10:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHN9mIMF1gNOaxFTaYPaKMKfMGYunplkYfjpfNEYzGOTksFp1dF0pb8pn/Z4eYBJ4tYOE/gCw==
X-Received: by 2002:a05:620a:271c:b0:7cd:4dbf:3c49 with SMTP id af79cd13be357-7d3c6cf1c3bmr1771790785a.43.1750090244548;
        Mon, 16 Jun 2025 09:10:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f8151sm1590255e87.243.2025.06.16.09.10.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:10:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 6/8] mesa: enable glvnd if it is enabled in DISTRO_FEATURES
Date: Mon, 16 Jun 2025 19:10:35 +0300
Message-Id: <20250616161037.1518306-6-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEwNSBTYWx0ZWRfXy01J+1GL0wiR
 fpHfeD7HJytSXrY70LWPMk93O3zy6J6p2U6TTm+JYpWXwgY7ELxBc291BBvn80o8WMDrH76LMd2
 +iMZXDWL6CQ5QOCSM0HNTZGSfiVFB9ZbHyYrTRNBag3xajH9ufbD7jIFY238OPJbON2Veg8QAgx
 WxJATG2S2XaFF/5mw5OahWwX/cRaUyuyxRkU/Lxy6MGtTyNQ/mABjpaQQt8UT/C8FK9n+E4wMq6
 hFVR6NOhlNmpjAo1OR/Yg/rheNJtT1E5gvrm7oDo8FXyOZASlegKr7/JprgJiMwD47UWr4NZVaW
 vC3TajrYgMx6PoE05ug15zMNlj/W2dTcSjjVgCrODXR4QIqVjs6sQomJY75oyw8YB8gii6X/fM6
 d918rbXd2tzxv40FgwMWLq863GTY4xI29zTB83ei3W/QcheSwoHEkCFnmVgu+bYkGU8EKPMz
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68504206 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=-I7fbvGdFZ1fcUDrCcYA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: MpYK2lWfvLjORq9W8D2tBKsoisPxMn5Z
X-Proofpoint-ORIG-GUID: MpYK2lWfvLjORq9W8D2tBKsoisPxMn5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 16:10:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218840

Let the distro to be a central authority regarding GLVND feature.
Make mesa.inc enable glvnd PACKAGECONFIG if it is enabled in
DISTRO_FEATURES.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b13222b66b87..801807344316 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -85,7 +85,7 @@ def strip_comma(s):
 PACKAGECONFIG = " \
 	gallium \
 	video-codecs \
-	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland', d)} \
+	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 "
-- 
2.39.5


