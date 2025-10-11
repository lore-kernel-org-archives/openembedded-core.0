Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B612CCCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 20:07:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.6984.1760213255238854021
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Oct 2025 13:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aLLL2KYo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59BJeN3t018129
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 20:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zpKImXDTJrbkeRXHMPb/pVFT
	ChetUFJFIqk4wbIvbH0=; b=aLLL2KYovnOptjEvb9ge5yAUO6GQBZ9MxhDUfxlI
	hXRROhkAYu5zBTM6X1A625qR0ZGedcdL9p/SkVVpZ7DQvJz0lEQ+kQkfXPJUpdrJ
	x5Zr/aTloDVV/EtQWuLuuNghnGX/AWirbMmLZf321V4cZrJjBZw6T2VSrTDxKyYE
	sCzkKg2WTuRhkIyPeNme/mf7QoP3E5+LmcZ47wA4IokBttOtEwYpXceOIvEHdhNy
	XBzVemYe/URu0PablRK2n9ahtypoNLr/Pnw1cM3NNBvwy+wakifbgA9VA57VEPfl
	D6fkupDzPlB/aCizBSw9ZCbyKG4KcdNlXVhXZI9TqcoljQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm594jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 20:07:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8217df6d44cso1559798185a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 13:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760213253; x=1760818053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpKImXDTJrbkeRXHMPb/pVFTChetUFJFIqk4wbIvbH0=;
        b=gRZUzN1E/dNFw13OaYkI1oaPiopDozm+kWV0yKAISRoFo4geOlSqRGEo5q1orDSzRm
         1PxVHmd0olLIt6B4kEBCuVRy2J93807PyhRaSWhr1U7HQDt1fGuRoUazqFl6H52TBM35
         oH0S3sfOZCACK3Q87qpnA+EgxIfGyJYjPbWG4svkZ52uFgR+aEapu8n5kJJTAqmIOMxL
         vUOVk+d27WTN6yPPGPKFTkesRa8XrWZMx4K0d8ZRZTgIMWZopX+fStOlGHnFBP/5QXv3
         QNhUepM0cH85XWJeqv8FNQ/KsElyqH4MIZG268EoKJBpdP/YuuKnX9khlNp/e7t4lcbM
         ChtA==
X-Gm-Message-State: AOJu0YyWMouZc8PMFyMr7zXGhHvbcxHiHctoc3PSJUlR+qJrCnyrAVPA
	0WtBMYA1r9QfzO8SCNW45ry18zjdA43IrTKtoMUzlz5S0PEZwEOEoiU7EI7c2ZjsLBd6ZswDq5P
	c8bwSvcAT+M9s5pAgMth805BS75ljvcJdNtC706YsIPjtgMDiaZuHy4oU6waindeCkT3xO4Q8Ep
	oVkpEhwAc=
X-Gm-Gg: ASbGncsHUAjuoemVx76SsAU019vIRlbI+y1kgRZ4Qgis7YwbP6jtMea42FVAXhCDMRL
	hBJwT6WodCSDT1obAHn0K5b+wCVVghfqY454EQehbj4xltb4oFmLUiExlgdv9l/d1OJi1MH50XE
	F3S4/LWZe0EtR7qHMUlqueqW+Z2ifWMR7kRR01huDXZxQyaDJDJP0uq4g6jhsSDFoNZxCGybVxN
	t0DmsSOZryFEZqAAjhMFgrM+LDbpcDfY3F8GfGKQZASM2PkgXEmueb3hAEvfDO9mwmSnPx1r/rm
	CNcE0GrW1sF72LY7RNDGoe+YgSBhfrF50WnQgCy+qQwRkATskwW9GiZLA1TmEo1UmjZrpZmm7eb
	oXhszWZufZvsLp6SgtSybF00rPJglyEqWsy9C1s+P25Xxf/zTu8vQ
X-Received: by 2002:ac8:5d4d:0:b0:4cf:ce43:5603 with SMTP id d75a77b69052e-4e6eacc67d6mr205252461cf.10.1760213253330;
        Sat, 11 Oct 2025 13:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhY0VrfnwRsxjyXnIjbAk3bNuAEfQNd2qk1+E4Ias5x3c07H4JkjyZ7upiOJG649GD0DktOw==
X-Received: by 2002:ac8:5d4d:0:b0:4cf:ce43:5603 with SMTP id d75a77b69052e-4e6eacc67d6mr205252271cf.10.1760213252884;
        Sat, 11 Oct 2025 13:07:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e77b884sm16897631fa.11.2025.10.11.13.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 13:07:30 -0700 (PDT)
Date: Sat, 11 Oct 2025 23:07:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kavinaya S <kavinaya@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org,
        Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [PATCH v5] kernel-fit-image: allow extending compatible string
 property for DTBs
Message-ID: <4zwfavcdo2ukd2cwpk33jvnsmtd5agufejpwwacozm4owjuqws@6rpar627gd2z>
References: <20251011094815.950261-1-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011094815.950261-1-kavinaya@qti.qualcomm.com>
X-Proofpoint-GUID: uTd_7Gl9_vwBvwGuuCwcbl0rTJaUhZLW
X-Proofpoint-ORIG-GUID: uTd_7Gl9_vwBvwGuuCwcbl0rTJaUhZLW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX6FMw8v4q0oMt
 GDzn+CaCfIOwczBLMU+kdgF44mdUiRWfc7XyUUwZV0L6r8FA/Whbbl/+EMEeBjCmatSLkNKpH9r
 Cx4IatYhDWgi0xFC6yxzKJSK2UxmbvHhjJyiVUU0pOPDCzbF/+NnLj/M1eYv+8bBBUveT63dm3L
 GqmBMnp4hjPHpLZKkI+Tr9iUfbQqgLpVaRC5Q0nPsbrxyBpWxDzS93DeXw+ubJJn7pxV/+0WZz2
 8FgC4PKgWeZZSpa7GU6YT9hhJb5OhfK25U3BM8fM21qFMaKl5ylS0I68cUc0qNNPvRR882UAN73
 ga22qM42WrnGpRhb1DCTesCvZCb+wDupX/KMrM1TuIu7XBYR7jBx2GIQq71OoyBOIZc1WSQKX5m
 AVL6nAOrbFjUuNwPlu5iR0imOmCWNQ==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68eab906 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=5Xs9IzLqiJ4qPD5JCeUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 20:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224722

On Sat, Oct 11, 2025 at 03:18:15PM +0530, Kavinaya S wrote:
> The Linux kernel allows multiple DTBs to share the same compatible string.
> For example:
> qcs6490-rb3gen2.dtb
> qcs6490-rb3gen2-vision-mezzanine.dtb
> qcs6490-rb3gen2-industrial-mezzanine.dtb
> 
> All of these use the same base compatible string:
> compatible = "qcom,qcs6490-rb3gen2", "qcom,qcm6490";
> 
> Since the latter two DTBs are overlays on top of the base DTB and do not
> modify platform properties, they retain the same compatible string.
> 
> When these DTBs are bundled into a single fitImage, the bootloader cannot
> distinguish between them due to identical compatible strings.
> 
> To address this, introduce a mechanism to extend the compatible string
> using a OE build variable:
> FIT_DTB_COMPATIBLE_EXTENTION[dtb_name] = "extension"
> 

[...]

> +FIT_DTB_COMPATIBLE_EXTENTION ?= ""
> diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
> index f303799155..98af4aad14 100644
> --- a/meta/lib/oe/fitimage.py
> +++ b/meta/lib/oe/fitimage.py
> @@ -289,7 +289,7 @@ class ItsNodeRootKernel(ItsNode):
>          self._kernel = kernel_node
>  
>      def fitimage_emit_section_dtb(self, dtb_id, dtb_path, dtb_loadaddress=None,
> -                                  dtbo_loadaddress=None, add_compatible=False):
> +                                  dtbo_loadaddress=None, add_compatible=False, compatible_extention=""):

I don't think this completely fulfills our needs. We have a usecase,
where we want to supply a complete compatible string (in order to build
the DTB fitImage. It would be much nicer to be able to specify the whole
compatible string here rather than just specifying an extension (and
still having to hack the function later).

>          """Emit the fitImage ITS DTB section"""
>          load=None
>          dtb_ext = os.path.splitext(dtb_path)[1]

-- 
With best wishes
Dmitry

