Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E260CED63A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 12:21:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11280.1763468503619662476
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 04:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=WtFmyyC4;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ef/UVV23;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAQsk62926839
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 12:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dPh7p4BjEA5nIhygRDDdLQdT
	KndKTFBV0UJkqKWYZe4=; b=WtFmyyC4b3EWtZ9OQAWEgtso0sUWrU1ZzPI6UVGJ
	hFx1ODJ/H5aZsRrT3LGwJgrAssakdYkUMvkL/oKmmDwUncnn3cbXyKURZ2lnhiFy
	cexpDdr7NY0b/vF3zQZpG3f/UCYJS1+jZNjYY5Nz6v4iD0iI35U5XqBid7kydo8I
	31jyS3AvtGLBVbmzT88y62zAafACkcHQwzRUNiDuTlcE2ij2vf3S0ZqT09Vy9H1G
	srSMA+kxBJ4YL+WFahA2V+79RHhytYAxJTh+LT49CEsIHpRBBjzeSY4Lehsu4fOC
	qwrp7BRy4P6pSXDdtm/0MLcaLQKQxnGHBxq8UvH0j1eDig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq2909cq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 12:21:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74ab4172so160975001cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 04:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763468501; x=1764073301; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dPh7p4BjEA5nIhygRDDdLQdTKndKTFBV0UJkqKWYZe4=;
        b=ef/UVV2378o9A6469+QOzKrvu0nwl2q4hkmVnJMSm9ycZBPG7uowLvlbnlOP7X5hmN
         XiI4Wr816zBJLQ+Mo06ZMlJx1gFpi2HyOr/vFboQBzeyN1Ra8K+3jWxJs3V88u+6SHDw
         XesCHbKSWzhvlI6yUiBqH1bJnbfJIjPbWIpONUNVaoxK8x+pUn9alSyt/b87gQ1zQ3zT
         M7dX2KnmUOJ5HD/BA9WRDtJwaHpHKDGuW3O3tIHQr8OsyzThf9ZHC+XaS2UxjeQBaaqL
         OqvCtS48Opdec8o3uSqVjW62SVnP7cfCHrohDdK1cmQW8c2RjvZ7uN5ChwhxBO4k/G9w
         SKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763468501; x=1764073301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dPh7p4BjEA5nIhygRDDdLQdTKndKTFBV0UJkqKWYZe4=;
        b=RZczl9Txx7gmcHMpaaUScHr1k+7y3CmR6dMygztYHB5sxHczlJVTDUBy1zC4DBkm3+
         bOXLemQSb/GKlCoZoOUallHplvHkDIE2qsHpkN+KBYSP57eF5wFD81DMR2Lil/9+hnru
         Ihbxu66JbfzVBa610J1Mr2EK8zDHzc5vNSoRj5ARrduZkeLckw/NiHr25RyJrk0KNIZ4
         X/unjj2y4IqoZvcUFDaQMFO/9xOUOOElJ3ptYBRjNFYttG33UN6kA49oU/VFSlRiojdp
         PJLWzw/W6dzUcNgrHyDtzQQ6n9p1TD+EIy3wonGG7FoVTwl5WCP9138Oc35tWuSATRkp
         9Qag==
X-Gm-Message-State: AOJu0Yx5k0XuiBSDYIanLIRxvmlgGruoDH4mWzw81N1lVXLX10RVuHQE
	MBje5hpdkfwbdhYx9T6Zn4o6SJJnsV9TRuaY4EY+Twl73uSulE7cwI1ezFxOEKCBq31LX/Ap+Lx
	MNmtNxzBkjWfic7co7NuIjQKPDUPpaUhFmcWeRWxKcLaf7673KjWqSAPTeVsoLVZq79W0OTFuPQ
	7HoVETuMu5r7Vm4mo=
X-Gm-Gg: ASbGncuLFIs+Eu/EERlCrYRpGle0VNF2XauWYnnC1zLQEJqcte8Qfk1EUNF+JXvAvFk
	NajerIZKwsP0NZ3r3IUWh3ofWjioCcnMsFkJlwmdXvwYJdIT+KF4aFg08P1SUu0KX8AmUGNZb3p
	3HC6sPDwpo02j09acGPF6DCDhwS1dPZM8TbX+wi6U/WJvIzpqxZuP/F9X4EUmUojAMcPzoOh6cJ
	EHNmexGT7vhxBwS9N52AG3OYor+jJWZFAu5Wo8WJTdWSfPadYp3QDgtJskzvP7RCTR3/Dy5y8pU
	O+5xYRC8j3JBptkw8IhpJOfknDFcuzHBGVHT81j+WQaKRBl2TRbdJIik46VNp/6puh8Fj7e/Ruv
	l5+wvQpG1+nw7PljGX5Y64crsoiOP7/7YLizwacJNfJkIGCHik50ioduQbyIRUES8uBQAh45/+v
	0kcnOqaXSGIMRO
X-Received: by 2002:a05:622a:508:b0:4ee:2459:3d6c with SMTP id d75a77b69052e-4ee24594318mr67781431cf.58.1763468501275;
        Tue, 18 Nov 2025 04:21:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECTS5aMXoLHWiFunmanD/SKmVlrWmsnQYKdX1ny/rWao2EF8j5N9/ib2p03MksGk5zoYsZYA==
X-Received: by 2002:a05:622a:508:b0:4ee:2459:3d6c with SMTP id d75a77b69052e-4ee24594318mr67781141cf.58.1763468500698;
        Tue, 18 Nov 2025 04:21:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b80dcsm3878717e87.44.2025.11.18.04.21.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 04:21:38 -0800 (PST)
Date: Tue, 18 Nov 2025 14:21:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 1/2] libconfig: import recipe from meta-oe
Message-ID: <4mtzjkjozhpfksscbfjlq3jpuoftbtrerxxphplqb6q25hw7j2@coifj3stwtyu>
References: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691c64d6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=SKInB77xPOM5HHHgk1sA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: r1VKRYrBMHk8qhV3U-ptvgNvUUWtCUO4
X-Proofpoint-GUID: r1VKRYrBMHk8qhV3U-ptvgNvUUWtCUO4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA5OSBTYWx0ZWRfX5lSytSbD1dZQ
 K+kvWok2blKgVZ3BPqpXYmMck+icyB8lBHyxVxFHtlyBeRGKV4POahd8h1T0EIugSkUB+0952b2
 gnNr/VAt4tfyydVTDYfdpBobZM8RHpvGBEeSdLyOu7wase1Sc4ZfbuHOb6UmIDvnxGtr6mVJ2zb
 5jzhoYfv4biCyqifokx5bTbbdRZtOHqDKN7MqwtKxPrCCw8y6QjlbVOrlZZDfEc18DJrFVgm1yv
 MMnWHFJKucbnAr7CNw5hVHDv8r2xg/hPt8IQp4Tpec6RruopQhKv9LmuMzK/o9B2Zp+yqGBalYX
 +W1JK61Ura5Bb48RAzRpgbsLQgwUCB5TmrgfjURlrgzgz+URTvVBiaSGt0MP6ODUbAGDf0Byz2c
 6BgHpBiAxZOp8ASj/23hHm9mbT73YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 12:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226523

On Thu, Oct 30, 2025 at 01:54:14PM +0200, Dmitry Baryshkov wrote:
> One of the freedreno tools in the Mesa package depends on libconfig.
> Recipes from other layers also depend on libconfig. It makes sense to
> move libconfig to OE-Core in order to reduce inter-layer dependencies.
> 
> Changes between meta-oe and this recipe:
> - Upgraded to 1.8.1
> - Switched to UPSTREAM_CHECK_GITTAGREGEX
> - Switched from autotools-brokensep to autotools
> - Added a patch fixing reproducibility issues
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  ...Add-missing-dependency-for-scanner.h.patch | 33 +++++++++++++++++++
>  .../libconfig/libconfig_1.8.1.bb              | 30 +++++++++++++++++
>  3 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-extended/libconfig/libconfig/0001-Add-missing-dependency-for-scanner.h.patch
>  create mode 100644 meta/recipes-extended/libconfig/libconfig_1.8.1.bb
> 

I see that these patches were a part of master-next and then were
silently dropped. Could you please comment, why? Were there any
remaining issues with them?

-- 
With best wishes
Dmitry

