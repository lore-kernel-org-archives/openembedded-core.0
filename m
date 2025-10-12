Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7FACCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 15:06:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.20376.1760281554310195475
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 08:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hX7GGBla;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CBcmFZ018380
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 15:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w3AhQgka5OGLV8yozNLIZjbE
	LR83p3GCeW97sMYzwD8=; b=hX7GGBla5QMe0V4g2FQQ5Id0VUYDA43Yf0NswBDn
	0hzxdKPGkmNToc4M0hUbTGmU5uUC9A1wvyqdnv+TdQh5aEWYcI41GEZN6Rmz7z5O
	y6emCiaXUNQzYvEi7fc6eOe3W5KK8CIOOWO5TRmw8G6+XCXAQsiXJEA+NRrIIYgu
	hRDtbBrZOexpQ3Ap/SIJL+aBxSE9OOWHrRbbVV4QhYfjPX4CWI5h6nkmJKRVtcS5
	/nmtTGa+fznIEUYqoTDIVkBn3A2haI8pIIDiyGJfdDep1jt7Yv3qNO/Xy2G7rTy9
	V86V4R4IrKbWuu5IkIymV7WyEZhkYVrXTdOeHI5lI3dEKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5a6ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 15:05:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8645d39787bso2687453585a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 08:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760281552; x=1760886352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3AhQgka5OGLV8yozNLIZjbELR83p3GCeW97sMYzwD8=;
        b=G/SVyKelAqfxE1BbjWSKy2715ZdkCPRJIY34PpWOyFgaHeTWcbowm8VlXtTGz2bf/7
         ZEu5u0twcdaxVryrwUKMSC8mDaUIGPINz6n9fHuZKj9Vw2IOivWgFiUtGGR+TRBY/Fol
         9g1ejRmLO4VVrklZ/Qu8faoBsv98Am1cVBak5QdBb418sT7uy7RbR4XsuUZ5lFx7PtPS
         2qxp4Wagi8lCbpV/MwvFzscpR0IvjecqoOhfxEM2qxVdOEVrK2Fi14/7+4zASSdf9fGj
         yrVPl1f5pQuznC5XXaS0bRdLdm/pUzldFhGStIom7awzYesCyCAA5sM8Zeg+WnEwsU5Z
         LUrQ==
X-Gm-Message-State: AOJu0YyRfysF7oePSpHvHVCygiqyIpsHSCn93VmS1Z513dduQJpf6EKI
	7yhmY32Eu+vy0Yne+BYVxKDICXzVsNJQ3a1msSII6xlsyF4PtacltE0E9ADTIx8INPM7VhfOWkj
	Wb4x+RGzR5OSyd9B1vEpWq1lrnrFHtjHjEretL4nQWjU+yDxLNnK0szu6y/mV51hirzh6oYkUae
	8QMudlHT4=
X-Gm-Gg: ASbGncsrwTsLqYj38ETzC7MhZm6yYqrrXgBmo/Gw/5S3xuqHj3AvgPm94nj5/yRs/L4
	GIJoNbFLA++9+994uZe7nDo9kB+jAef4GJ4+NlthSfakBHN7jF21y2gaFI5vMWhjBUgh6v8T7IR
	j/lnnDP3Q20uKAF8t7PGpuy3WEYjaaEWxE7HQSBU0IbW3Fa7IP/HUtOqoOOpsfNVSxAj++xKy36
	wsIVCqzui/mrmKbFfZrZN6A2LA5uDzs11qMmCtKIbWtwN53AvZ8QZ1k3wgXk+mCq8HGXjuIgshX
	wOLrJVCaoELwEG2Q+g4Qab9v/VJETFAG3yG+rMql+23jK6Qp1EyzdFafjFCnh9PaBmc1QlipTic
	pZFi09GrAwyhgYCr+KXOmj0Jv5YCfT/ffb1e5VJUGpCZDLX77ivTy
X-Received: by 2002:a05:620a:1914:b0:828:e3d4:36cd with SMTP id af79cd13be357-883550994d0mr2449592385a.77.1760281552421;
        Sun, 12 Oct 2025 08:05:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMJSD+fx3KzVx7gQPsCKitYQx8cQePcYHoek2Xiihyz6Y3qg+WqqIqSJui6lrvCjez9sgqyQ==
X-Received: by 2002:a05:620a:1914:b0:828:e3d4:36cd with SMTP id af79cd13be357-883550994d0mr2449587185a.77.1760281551841;
        Sun, 12 Oct 2025 08:05:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762e7b4483sm23274791fa.14.2025.10.12.08.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 08:05:51 -0700 (PDT)
Date: Sun, 12 Oct 2025 18:05:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kavinaya S <kavinaya@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org,
        Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [PATCH v5.1] kernel-fit-image: allow extending compatible string
 property for DTBs
Message-ID: <vzzwxaynrlrdoelpohl4mcvpwdcsufm6yqfzqyilofpl7yhtyu@kegewyrdy6xg>
References: <20251012095644.1935404-1-kavinaya@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012095644.1935404-1-kavinaya@qti.qualcomm.com>
X-Proofpoint-GUID: s4VRShBhlyS62pj4B98lO6v9OYcEclJa
X-Proofpoint-ORIG-GUID: s4VRShBhlyS62pj4B98lO6v9OYcEclJa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXzyLDDLINrrOn
 28YILf0JA2ojuG+oTeaToPe5A9s7acyDz0fIvbydFmw4pbXKjXyIq2JxfdBPQ6pshfp8B6/yAMX
 WIvHBrX8+rubRalOa/OB2ppDOtTlMfO7l7LS32B9LAuWckQJPzW2cCbU0/8+nDdUBGe3s+/ihfT
 h7eeiVBwGCRbtLmWk1YlF9y2c4jmu06sUwgvFuo11HQY7OaV+78XGe7xtA2ZNmDXJ2bzMFbReJW
 yfLBN3znUAlgDY3oFj1WpwWxaupXQAuQFkH6Y5GzQMoZgQ6fCA44FmW+vOGvyTrdnUI8VY5BcPz
 FR3FfE4JkrxI7FryLA+7mx3Xwl4yOU843ev7mWedohnbkZFFr4jPWeS38AkUWG6l35PCPARtXhA
 dLWB+JT0e1/Tn2wvvLSKXuFc4h+L2g==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ebc3d1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=Ug4YaibI2yhf2cq8q1gA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 15:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224736

On Sun, Oct 12, 2025 at 03:26:44PM +0530, Kavinaya S wrote:
> The Linux kernel allows multiple DTBs to share the same compatible string.
> For example:
> qcs6490-rb3gen2.dtb
> qcs6490-rb3gen2-vision-mezzanine.dtb
> qcs6490-rb3gen2-industrial-mezzanine.dtb
> 

Please, don't be fancy or creative. Patch versions usually don't have
semantice versions. There is no such thing as v5.1. It's v6.

-- 
With best wishes
Dmitry

