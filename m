Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71160F4198F
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 10:42:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15923.1776249731945871789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 03:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LQZ5CLKk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=QyFTZ7/d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F7tZQ5764370
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 10:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z68F1/By5W8XIxmSa5uCDoII
	LRwGGuj3ELzi9oY0+OI=; b=LQZ5CLKkqKv8YtAOrJ5uTY+sTI+7xNzg9Bp2Znrp
	6aRCmmwYbVFy7hXx1H2iClPoBS6AiXyhP82f+uYZTtIIUfMpfqNPxG2RYRh+9O8w
	NXHDdqdN04OAN9TQsv4vsPNnIC1XEQBzvRo++xODf3wxhnvYVwHJA5GBOCruVH6u
	lNWXvPKQqKM2XRVWT5MRevnlsGNK+ikR0aqm+YTIhvOtoiqkx5kE7p89eUOQEpaZ
	OBUfPKGs7I8nFXBiqu0F+P9+diadWcIaYfLRR9PX9hsohzFS9W1qcM3X08h5fX02
	hYoacW2RTCUvT84qvI8K5IQvYESYBQK37Qjg8cKNkT0EhQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj6q7rmua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 10:42:11 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-953bde1773cso8575029241.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 03:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776249730; x=1776854530; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z68F1/By5W8XIxmSa5uCDoIILRwGGuj3ELzi9oY0+OI=;
        b=QyFTZ7/dyoTSNMqOO1mnxMyjC/+ZL7eZzfZD6MFc3UtF6lhKC8UiNyit/moOrIMj5m
         KtWfLFO4TjudLj1haa5t5zBB0LmlgKenI3eXslBEuqunq7gNv6tEwjp12o39/Tphu8g2
         qUpKO+yhVgPKku4vY0dvuIA/nOtZqtvZQTqi2l5+jAhFGlx+FOeN7cNim/2mjFu9u7l0
         845tL7WCxxLlyvXj77X1jgwJHKbESeBblc1VtOKIwXM2kS/OTElhXdVSCBI+V4Ho8M7C
         o8r7dTCfX3OO1ZqzwzZL2sOIJgomEaflu8buu47apTYGHobRwD+MzR0kEnv9C9Nv/aBW
         BF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776249730; x=1776854530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z68F1/By5W8XIxmSa5uCDoIILRwGGuj3ELzi9oY0+OI=;
        b=PQmhPAuWxQ70BBCM6EzWsX3kVmNAt8tq3dmDR2EJbArs/sQgS1Nm0JFwrmP/xqB3un
         TevIj5YlumRHMGySiHj1MW8UCmTgaXf5tmywkrD4jmCN0w+6uXjxtEBSY9TF5BWEYJ9a
         9JBd3Ln1N9f1mT4ciZelQiy5hLgrPiS2eAOOceIxxFzpLjJjNV8yWt9kaxsx//30MO66
         SfJI0ubW+dcSIDKfAN6GO7HXH3UDmNFTH088EKE1VLWFIfXN9LzqJNHXLnt6KQKAzVK+
         rwpQiLs6aOZxpme0E8zn3q1aFCHQHCo7OR2xx34yATlpD1j4nood5PXT2Gciu1MSyYev
         Sw/w==
X-Gm-Message-State: AOJu0YzCz46kr0gzm6XT4+SHDbVHjoST467dzSbgJ6NcLFFR8P52YHC6
	RdP2zUBQ5wDe9E5hrRvvNV5RSZeNt2yCkuxlxN/qWmRbA3t2r7G0StRbBG7s1zEbdig2R5+P/3O
	JQ0F1tzkpG2pMfqoZmFyF70FJzyONdM5zycrVYeNAI5iIRxpa+53st3pi1qyqIM80xZgnTS3nH0
	1k0S8qRcs=
X-Gm-Gg: AeBDietxwQHoZOswp1fLaXM0IjI5OJ/c/v9G1kZMiBEr42h3YKV6Kl2aqurlgO3E572
	z1p24FUrfZ9GoqUZcXma/EksLkM7ipSFB42ncCEIMUMeechMu7DXahY+73ikuBrKgsQZZm3CNXm
	NA0D4Gj7eQSFDDArUWv6UUhX4xhcCVSdRNd9tRB8SrsINUTadIIWMD2BnX9gz4xoIeH1Iv2CKWS
	ww86QZvSrT77VnI5smLJOgGduB8O9GIGG0d8RXGILGv/bVVoJtlWK4SQkYP5NI5pSMsbiW49hYZ
	Joh4i1YX2vCcViVTGk+pC0pXVpG8Q5100/u0KcvrgoMAfGwKBFQGvlz1r/ujfaUoEHiUa+GAHvi
	0sSP4bE+mAzq492KQ8TQd+J9iWJ4j3ppd7e9jnpgtyKfjhNQ8sZtY2gf1W/D62rkJG6wsavMWhE
	TROVUMT9gc6ZdAVN6dBiw9TbE2Iz4XtaRZTq1gVv/rDHcNmg==
X-Received: by 2002:a05:6102:5107:b0:605:2a07:65e5 with SMTP id ada2fe7eead31-60a00f4954emr9796994137.18.1776249730382;
        Wed, 15 Apr 2026 03:42:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5107:b0:605:2a07:65e5 with SMTP id ada2fe7eead31-60a00f4954emr9796987137.18.1776249729940;
        Wed, 15 Apr 2026 03:42:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e9ec5bcdfsm3472131fa.36.2026.04.15.03.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 03:42:08 -0700 (PDT)
Date: Wed, 15 Apr 2026 13:42:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] linux-firmware: upgrade 20260309 -> 20260410
Message-ID: <dlyded27txuw5uk2peipyxcl5zwxyndzwnipiogjzdwjouubjg@sg544odafvyp>
References: <20260415045521.100528-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415045521.100528-1-vpuar@qti.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AvHeGu9P c=1 sm=1 tr=0 ts=69df6b83 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=B3J2EX8P4OzencRkeFsA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: c3EaYVaNC5wD0Qg2GC75G-DwdrpH0-vp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA5OCBTYWx0ZWRfXzplKgHVpAA+v
 jh4mrf4Q5f2G/nNsFIw1OlPR+Cw20qbAj7/QHO4iz2lpddAr7noqBrbjeFDGre3fxIFuKUzcxeM
 R3iF/1hp7vHogBAnYgAAkjbid5T1P2U6MrhQIrmNZKoPIwHVX/s/XBgCYc4Q1X8lXNkuwleButa
 lw7/+Qtf4G7SLq/iZyj+e7R39OdrizsDJkqGBwY/CR2SJ8k0JN6xgoibhGTpmT284mkQIweHyJH
 GaXYtmfTBaSRyq5ei4EX2YdoxWeelroTeqlVkI5kyr/rnYlrBEbVRCumQLRz337i2Wc8uf3iwu2
 psvbE4f6t2qCrUCxewuacYcDMtO/bYo9Q8+50gafh8hnpiYRZ/1jIDwwWOax00VFG+5fQ/YPGs6
 4rqZiEqcW6/bjCD3riOZgOCIJwTFl2xn1NokVJAQk/UK0upXB3LWwx/3a11NgUUhd832OeYjy8X
 +lfm9LZ0nDNjaF3vAKw==
X-Proofpoint-ORIG-GUID: c3EaYVaNC5wD0Qg2GC75G-DwdrpH0-vp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 10:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235192

On Wed, Apr 15, 2026 at 10:25:21AM +0530, Vivek Puar wrote:
> Upgrade the firmware package to latest release. Add qupv3fw
> firmware for qcs615 and shikra, add adreno, audio and compute
> package for DELL XPS13 9345, add audioreach firmware for Glymur
> and arduino monza, add ISH firmware for Intel Wildcat Lake platform,
> add lenovo ish firmware for X9-15 2025, X1 Carbon (Gen 14) and
> X1 2-in-1 (Gen 11).
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20260309.bb => linux-firmware_20260410.bb} | 66 +++++++++++++++----
>  1 file changed, 52 insertions(+), 14 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260309.bb => linux-firmware_20260410.bb} (98%)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

