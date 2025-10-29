Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FB1CCF9F5
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 23:32:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web01.16536.1761780759995017095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 16:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CsOWYLej;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Ma7/NlC1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TLGh951655543
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 23:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RBTkzc6dMov
	eJc4Uohclom/DQ48xNDRSN1PuvteiySg=; b=CsOWYLejyaDg7K6l1M/2nyIm6nl
	n05lQn2tF0iCJWciJU7UdWRevuQqW4tam9sD3AzQEzsAXiu+P7to4IRyby+K9NQa
	nWWpeB7MDbCNUv8o5UFozghPCr6p+4Ve3HOuwCaH4DuXQsKm9hcGBB31Gx+zA+uu
	75dWt4qtlnnIJ6MGJ7hOGI7lSS8xfklN7nRjC9Bj7dX7+yYsPkgPOw9y8jEJ2gd1
	Wdh/iK5S/A6in5qkkKwZaI/ICOQMzRtGlXwWaL4kXSv8KcEm4AblDG9v+HQEu0wT
	mNGbiDTbDVYGf51hsIyCJ92izq6oe4n8VQ7AL4ADodFkWGL8zuYXWUqnkRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tptrb3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 23:32:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed18b4c621so9284451cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 16:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761780758; x=1762385558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RBTkzc6dMoveJc4Uohclom/DQ48xNDRSN1PuvteiySg=;
        b=Ma7/NlC1IQqHVMrvhDX/ACgAr1zsovpAseUJ3ZG9p2JjeJkqYxNYwoe5W6/VJhgfRT
         xNAsRd64f7c8atnGodD40sYxoLh9TqsSx9uUtESV1lfZTBcS5rXzFPOvSzxGVr7UOcqU
         hXirQEuZIwpFVR9uRAAvysBcPSrnABuLqmn5x/wqEjVemIZl5ubS1oJNGXDD1DWhNEdo
         t6liknxOdPUhjkGh2kiYpApnUdfAqZWvKO0NV+BfDYPWBkcEF3sfpErHIjRGnW2dEhzZ
         dGOlv3udxclYMKuWfaaIj2Lis5+zGTTTyhf0JnlgItZIQt/xOFnpXMKIKk7XxxK6LM0f
         TFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761780758; x=1762385558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBTkzc6dMoveJc4Uohclom/DQ48xNDRSN1PuvteiySg=;
        b=o2P6cGcwqGPLcLn2iJO0RQSP6qcpmqT1YY72/bUxt1bEUOVLnsmDW/j3w2JXYw7Sw/
         y0eZg8w7dQGEEfHQ3obkrS1ghOJN6D8L0udq3bI8qKslS/VQ+CRY2dIGH+F3gE9VkzAV
         w1IDlwbfITyKP02ySF+ZC8SczQo0xCMlJ9nxak72YYCZisg6PfnzAPK2tc/YbxTaLsLv
         MiWrbbb6v1tYMwCzlSaUA8l70IoSOP7lAZ+OodpZyp0Sfz3IWl2RlYr6wgjG1U4mY2jZ
         YsV6QbkkCoI6Z37LU5STX7ynWCfW4QgzYqJVoA14bDqKW5QREIGxbWlT2fgylTW43WZR
         vCnw==
X-Gm-Message-State: AOJu0YyW3StXmkfmjowSFQvliGl9ShUCewnbv6rSBOflgXdWfb5gqaTN
	/wtbCthhkG1JIFdqGvwwGwuh9AyXEYZ28qme+Zt0qyc4XgFLAUxbrM6itiQkaeOlOVd2SqGDmrj
	lMmRbgSklM4DPw+yd90ylzohZL/sVshNJUqwlcAavxJ3CSJphrzPmiUo5DXRvxRrzdlClfuNATC
	LX2ei1mR9lMO+Db8Q=
X-Gm-Gg: ASbGncsVfdjZFqwz6Lo5n9aN0rGSvmMBIPdX2oJKutUVjgspgl/5ZVba8Of8x71Cq+m
	agwQ2kRR1FwSLUlfeI0Tdc2XSBsGFBdj4uCbtLnUzwQmHYeEcIxEh1W61+v3m5lNKTzmS/W0env
	9MDcUoCD4JawAR63Oy2pjQQgp3bCcR2ll0bEvHxZpucPzouu+14wIj8GEPkU6w+xtKGnueZcC8G
	wTcctkx+lsNcmUELZ2qD6aB4jv1m5zer6tBQ6frlLf7WvVVUK/cHURHCbg/6nCdNKTGvv1gFxav
	5LNdH6doXjzJhmU5ddXwSKNRHAxkE776DMVM2PnSqq8qy0tQLorhEvIxqobhS8rCuDAEP5b5hUv
	pi+ZehgRoXH6yFMfMEkpcdnkL1SJBCad+53z2EKjEW1aj5GPASieD9S/ojRTnp+LfbqQQbWMrg7
	3TSFVRAJfk4XL6
X-Received: by 2002:a05:622a:2d5:b0:4ec:5dcd:18bc with SMTP id d75a77b69052e-4ed21812c00mr21462051cf.14.1761780758044;
        Wed, 29 Oct 2025 16:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHItmB14bUM0rJ5JgVmTsALIkFT5xXhIqDBJdPwmmho4GxQ10tJLfKg9zj/jhU9hO9lVDkpw==
X-Received: by 2002:a05:622a:2d5:b0:4ec:5dcd:18bc with SMTP id d75a77b69052e-4ed21812c00mr21461801cf.14.1761780757516;
        Wed, 29 Oct 2025 16:32:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f5f98esm4151024e87.57.2025.10.29.16.32.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 16:32:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] mesa: drop freedreno-fdperf PACKAGECONFIG
Date: Thu, 30 Oct 2025 01:32:30 +0200
Message-ID: <20251029233230.2522401-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251029233230.2522401-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20251029233230.2522401-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE5MCBTYWx0ZWRfX+zqdVmNRcsPy
 CEcQePoHutvrqwmr9vC3bTbg1IZPutghmNoVtIoi7BR2BQJ7QdZZOzwaRFMIrzg2Yxpw8ESoT5x
 9GfGk6SwkgHBY4c0isZNGZWbCIPZjhs0CLTYzYRCa1px3kvNhy0qOrM6+kWa1He+uXyKDxdnj+m
 AFrdPpErXU+hWrQ6PBb30d69IidlYyG+vzBCtGKzzXVxzG+ZP74VJ3pBz4hZpk7MulGWEDbrJjQ
 O8BJYrmNNKDLrnCoHdDIxTp9f3mbOe3ey3YMegGRq9OinJBBXOY5T+U8CsjS/WYeHDJkdfGlWQS
 kjSoz8ERjJ78TBixcGwDIMUAXaXoEZrWPBjjACl8h/LSiJL/2HElVvBKb77Aiz0mny0632VzO7r
 IWQAgNPE4tBszNZBnjHMHMtSFY2CHA==
X-Proofpoint-GUID: VitfiDm9MDdVEiG2qY1J6FjoILmxq2D0
X-Authority-Analysis: v=2.4 cv=MuRfKmae c=1 sm=1 tr=0 ts=6902a417 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=WcHs0SwSEHyATT4nbykA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: VitfiDm9MDdVEiG2qY1J6FjoILmxq2D0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290190
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 23:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225476

With libconfig being a part of OE-Core, we can now drop separate
freedreno-fdperf config option and merge the dependency into other
freedreno tools dependencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6a36aea259f0..fe778e58ee4d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -148,11 +148,7 @@ TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 
 # dependencies for tools.
-TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
-
-# the fdperf tool requires libconfig (a part of meta-oe) so it needs special
-# treatment in addition to the usual 'freedreno tools'.
-PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
+TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libconfig libxml2 ', '', d)}"
 
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
 PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled, expat"
-- 
2.47.3


