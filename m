Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A33CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 19:09:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2051.1778267383858414156
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 12:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=RRJ8vJwz;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ZADvkwfV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4mFU1116301
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 19:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YN15MdhOlOINsUr0inLEsRlU
	2rb9kuaNuI14COl4M/M=; b=RRJ8vJwzwK17uqkvQAf4jiGuWiv7b95g7JZcUYgE
	Ht+V3+3kh3RiZ0QCcA84b7fdshlz3AIByE3TBYKhq4MmeTaD7XjqqcyShGoX0THf
	99IOkC8dUJqo7A6b3VgPNVsYwTNMO16BfrRKyGDCIOs8r+ZETBVxB901l0U6pdjx
	38+MESMvi6iSbe7St9Q+KYkOYoKoY/R/pKSXHbsu9T+cZ2Qinv/Z9GIb22SXxPDB
	Qod5exniwcqqXvHf+/MaEX92SG07xmhcSSthv4EA7Vd5QxNFdYN6jZgJbRmhKLfT
	8gHFuCuf0/N0FmcmDAUoU9p0vS0CbQx6kySPOsOwIYM6Wg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1pgm7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 19:09:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-62f30279e90so2172346137.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778267382; x=1778872182; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YN15MdhOlOINsUr0inLEsRlU2rb9kuaNuI14COl4M/M=;
        b=ZADvkwfVtPGCK4RyenYoT/b8r/m36BFglxnR/f+NOAHpjICbEUclZc7beeSEwgE3W7
         f1DZYyba0f71KCdrK8NF0AFpl82Xy0np2rIFs97Aua8vijNo3pMxa8UGee4cAhOQXP3d
         4OEfDviAOdHs6dKnQtPWZUrl8Qv3KSvMSxSL8DRxhruJuuN16Iq0wnfowI5RhXEM3Twl
         3fq5IBNvYWkdWtoPELA18scRkRGl2d4hyjPu8Cv6EmE72Krp4Bdv1hidFNwwmpoRbwn0
         YQn7Yp7mR4id84ZIraDXnRMNA77/X5D5kC04riFpQyKpq4U4mW+GD0u0qP1Zgk9BhffY
         QbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778267382; x=1778872182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YN15MdhOlOINsUr0inLEsRlU2rb9kuaNuI14COl4M/M=;
        b=RJLtAVrj0nks5/lWP2w152nLK62KNsNlxr8osrljeZ57cea4l6y0Vg2dSHPeAEGNiB
         dltA9XpAW/LHklN7Sna20YPuJk6oxoBAgzUwR/3lUCsFrCKIFNIsbDE6lkJu/9sbWKS3
         LH5GUVFECIZTnmWKNEzZeyupR0olgY28xWr6domrw4041xd7Q1jFVTegKeLwiwLskrB9
         HCoKUO17Rxzu7gndl1Wkn+wXLs36JXy2jP9w/zQG7QRXeSM7sWq7OCjcHJVpNLcRwESj
         F4bTQi3m6w0vyQXX0PFch6cJ6RjJMX1ZwSX+Hr2RltQ6t8bjxK7dLtjEhB2b50qdlpPQ
         juRA==
X-Gm-Message-State: AOJu0Yw24bfoIakFRzJuEa03jtQB36XqWYQ9ps+Ms25K5qp7Y+Tmjkzh
	a6ilt4YsrLnfy6L+c9XAHuFwuSpM2iIl94qNs+q/0lk5PClcVXK0diJAWlEsPQu9ZDFOUlAP7Gy
	rronhp56k9w8pB/4qgzEPsRDkhemn/wSgHtBhwYPYmoEpQteWrG67c5WrPV3IAhdGvNMEILtCr0
	V40o8g+J//yCbLqzY=
X-Gm-Gg: Acq92OEADaKnaB/1fo10skOeJR9MKUErOZZq9bSsDDCCbZel9AVGtxpZEPFyoWdocdD
	dRQupAQk7kC0ZxJxuGZktCUIOMwHjj1ANnN0LTWAvS60SMsllAjuXPRVkBt7zBd/1qzoO32YRAr
	infpEi8+Y1a2NKbulae38nRbDEIuEl2RSYv8YTHiJkg+8avddcE2791Iysg9D1lB8VXijkBZtt6
	Py+XaNOI+ASKwM2xfif/USrG53tMpIXndIkdnzcygxLHV/nlfdFLqnGvDwRGz2GWVJGmdAqd0M+
	bz204zR3P3OpPoWJFkYGF7kGC9zaM97h1LMcuv6AE2jATXDE2qqi8jhSAP8nnoDtC1dv+MXYpKO
	4PFvWT5sLww5ocoffMAn0a6EVZpy5JITQuiZV6sWjZHmOKiJ/uPZ7fgeJvz1c0LVM6bBvLJ1gO4
	dTfI9DSwhTFFQf2+z2Fy3uhB5qq2tPS1+ThtiV9IOJs+gYxg==
X-Received: by 2002:a05:6102:4b19:b0:62f:4349:ce2b with SMTP id ada2fe7eead31-6313eb7fb77mr2350574137.30.1778267381879;
        Fri, 08 May 2026 12:09:41 -0700 (PDT)
X-Received: by 2002:a05:6102:4b19:b0:62f:4349:ce2b with SMTP id ada2fe7eead31-6313eb7fb77mr2350557137.30.1778267381352;
        Fri, 08 May 2026 12:09:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b1cfsm739780e87.73.2026.05.08.12.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:09:40 -0700 (PDT)
Date: Fri, 8 May 2026 22:09:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: move DT validation yaml removal patch to common
 SRC_URI
Message-ID: <gnsndbzzgdnp4q5bqmccwxy5njtkj22btgpedstktykczupbfk@chm5coxohwxo>
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
X-Proofpoint-GUID: neN8FheJk00zkagP2ALGFksgdxUke_DM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5MCBTYWx0ZWRfX8a5H/82bFKe8
 1OIlgo4BRRT2u02BpCMjShthnwDkOZkDC+yBmYAVWx2it1RJ3lhAn+rmgotXh8jmDZrs/VAZ7pW
 xJ8RLyVT80261foUg9zPMJvTJyLlZ6rjm+0z7UsMNERhpIpTVP72w5PtS73rDGDfqr+TmGKj3tO
 ebUyofBggJepzVOmRHePo3pXoJu7qa1VnN45JhVUgCnjv3JeEvrj/ZUN1YvD7ARB4xJ6Z+bceM8
 SNDNkDjxy+bN0+e6zvlh9Eks8jfq93abkKD6X3vt0r8jKsY6cAAr0Z6vNW4vkYKwwxHZI3nCMmI
 N2bQXdKog/4FEo2Iu+LujOV+J0sVJB9bDgn014x7VXK3Cm4iQWTFxocpe2+POsqWa6TVhwZv8oJ
 8AVX8fr+8u/u97h9Oru3tkORVRxToXfoLAE6Xf8G297gj3ArZIGzgrpWugj7gfAdo2pU6XAWw9a
 WdxeqBH2SgBjC1Weg8A==
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=69fe34f7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3v45nI1co4Jjx-_ePn4A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: neN8FheJk00zkagP2ALGFksgdxUke_DM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080190
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 19:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236733

On Thu, May 07, 2026 at 05:40:18PM -0300, Ricardo Salveti wrote:
> Commit 5e97f3c1e2cf ("u-boot-tools: drop yaml in DT validation") added the
> backport through SRC_URI_RISCV, so only RISC-V u-boot builds picked it up.
> 
> This issue is because the v1 of the patch was merged instead the v2 (which
> is also not fully correct as it is not patching u-boot-tools). Drop the
> patch from SRC_URI_RISCV and move it to u-boot-common.inc so it is applied
> consistently to both u-boot and u-boot-tools.
> 
> Fixes: 5e97f3c1e2cf ("u-boot-tools: drop yaml in DT validation")
> Signed-off-by: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-common.inc | 5 ++++-
>  meta/recipes-bsp/u-boot/u-boot_2026.04.bb | 1 -
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
> index 574768b9f8..15e94a4e37 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> @@ -14,7 +14,10 @@ PE = "1"
>  # repo during parse
>  SRCREV = "88dc2788777babfd6322fa655df549a019aa1e69"
>  
> -SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
> +SRC_URI = "\
> +    git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV} \
> +    file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch \

We are fetching the source basing on the PV. The patch might be
applicable or might not. I'd suggest listing the patch twice: in the
u-boot_2026.04.bb and u-boot-tools_2026.04.bb.

(in fact I did that in a local patch, it's good that I checked the ML
before sending it).

> +"
>  
>  B = "${WORKDIR}/build"
>  

-- 
With best wishes
Dmitry

