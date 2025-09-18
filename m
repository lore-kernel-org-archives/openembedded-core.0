Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204D6CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 17:15:05 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.20740.1758215702655646065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 10:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TqysF9hj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBHhfI010750
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 17:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Et2LBV0hoDkXPHguzYWpJS2
	2gcAI9OA9N51Js1jJkc=; b=TqysF9hjJfqNMqbuImPm+3eq4z8fAGhzO8ZO98QP
	CJJS8JbK7adXEIEGrRBzumCXiZVN8UHfLgGsFCvm7Gt0fVCB0khLgZ/R50httdP4
	u+ZNgbsE+rdqS31cxue7FPW4gZG8gfsu+8maeG5IktUsA1hzhgfmIubvGeqljwd0
	rjzkRvhxLrFjj/+cP50NtMwqTHILtzkGOzUNzEr3NET0CNZ/j8ZUXoVDyQFrV9PT
	mH2UIkWXU4mT2iaEoUsh66OvkFvuD5Zz0XYLtX25dGT7MO9jGu7dP/p6wLadfeLK
	8IUIRdYhied5t6/Vq5vWFcOuWvP6FKq6jnvCiBhvqtPHRw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxy8eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 17:15:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-770c2440225so27700006d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 10:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758215700; x=1758820500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Et2LBV0hoDkXPHguzYWpJS22gcAI9OA9N51Js1jJkc=;
        b=O9h5SH0uBaONiWkte7zGs5ybkVLyLGHdpRWzt+gdLgeTX3iLJpGcUflj+Zznx13z1k
         Ho/T1yXCtVoTpAjT1GsuvIjm/OGBD4213r62n4+BFx7ozcXji4yqhP30rtrZ9aZrgFfR
         1CgxFMaAqYZP22YpgfGXGxKwP9sPP9qrLDc3MOtcwzZfR7JAd16G3JDpbib+ei5RGN6h
         zbvULsZl8hviYcFtAjYhzPDSJJzmb6hOtXWCwFjbxGw0/tCHQiB3geO3nnXypBT4wRc6
         Zx+OlVescq/1UIN1CNyzZMGWD2MKKTPvVeWicWazLNC4+6LkJtZu+sAmS9i5SAriDkfL
         nKbw==
X-Gm-Message-State: AOJu0YzAw3YcEsBnZ5FKTU+CdT9Ddwxy3Jc4izDnhewGcp4prgORiEcg
	TiRJUE24B81b1wreP1Hn5KwW8f46RnovQlff+ozg1QGxy8UPiGbzSwsTKvm2zHXB6+DFaYCx5QO
	CzvoDF6tJh16MFX7w6FnS/ZKYLgN0bDqnjWbqT8DQ7ezScXU58OhivhjRQ5HolCPwYvGokFtlB5
	CJfZGLsEhtwsOM134=
X-Gm-Gg: ASbGnctjZjtCtvljKyVKSLT7MsWZUtu64uYq8szQaa1UuNoQhyY3D8HZPFcWyCskO0M
	aCS1SnwlErDw65cz7NArFxdMeeVLx+Ti9HN07pOTLXVC02Yck6YpxwY7koNkH4N3jvcfQ+rCAd0
	yfMHkYgsok+bgIOKbrhhWOkvUsY0dBqDBiDoZa8lGyEUP82fCNXA7mVWNAcCvnWqEPBnOkMEkxG
	vR7FeijViBEx0ZAXhl8zcxfwCZZd8JFLlpX2BvcDKDy2vQsgsgphC2MUFNvSTOdVZd+2gOwOzQc
	5QA5tfWl+OGbMZiqtBydJXI93et/PCyYj3+V+PkfNiPaE5PYUMLKt3d0HZZ7n+bOvhlIs09XgvN
	D8524UEszbdIHs3268VuI3qyMJWhXzJvdi/JyrdxL+IbhHpm821ta
X-Received: by 2002:a05:6214:2626:b0:782:1086:f68c with SMTP id 6a1803df08f44-7991d54f9f8mr2093446d6.58.1758215700251;
        Thu, 18 Sep 2025 10:15:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtDrh3wOSN2rTNHGqpIsCVWYWRzLUQbghF4gRViT+Zt9gSxEPcBYEg+17swi+Nkc3Pq1XmRw==
X-Received: by 2002:a05:6214:2626:b0:782:1086:f68c with SMTP id 6a1803df08f44-7991d54f9f8mr2093096d6.58.1758215699583;
        Thu, 18 Sep 2025 10:14:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a99517a2sm807543e87.120.2025.09.18.10.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 10:14:58 -0700 (PDT)
Date: Thu, 18 Sep 2025 20:14:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 1/2] mesa: add opencl DISTRO_FEATURE
Message-ID: <ynyqsuah2htlduvk374ssf4gz26qnlikklok6tdydiizd63zb3@rchzndwtmzfr>
References: <20250915232557.536762-1-dmitry.baryshkov@oss.qualcomm.com>
 <aace897a-b003-4929-995e-479740c109f3@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aace897a-b003-4929-995e-479740c109f3@cherry.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXw+eojygD8aBk
 jpuyyTew7OZFt2NLmwNCfvUUIA9vC6GkfKjGaqYdjpIVgBQFVm6tquVSjoGZaHUSHQF/ja1RkK4
 fEo+VyxwJ0oRd6nPBlVMO8agd2NOiXddmBr5DtiSIgCqlAWhnFkoDVNL6QUY3YHKEYPGaYW1EVO
 3ZQCn4hwwRvs5vkhRFxxIKhWyUIjt540QcTR4Ns0F/e9YwkkTNPBI79DDCp2Y/149B8vBRZb8OR
 dfLFB1rOB1o1wfkqglWGFU9kr0wGKhT3Pk5HESPcgxjpHVkF66UJdxqblSwPnZqJoLkrkAdPliq
 8arvnQv1dGmidLhtnYn5D+q4xFO0GDhD0SSwDkQDv00sz1jFoYgQmR2oj8OucvJIfst/IvHm1Zn
 WjrOVj/S
X-Proofpoint-ORIG-GUID: B9jBacQ2URLfCIQ5P4lwY-f6uI5Odhg7
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cc3e16 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=AtMbiI4VLeQ8CfGJtfEA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: B9jBacQ2URLfCIQ5P4lwY-f6uI5Odhg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 17:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223652

On Thu, Sep 18, 2025 at 02:16:07PM +0200, Quentin Schulz wrote:
> Hi Dmitry,
> 
> On 9/16/25 1:25 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> > OpenCL is an important part of the GPU-related world. It makes sense to
> > be able to provide headless environment (without OpenGL and Vulkan), but
> > having just OpenCL as a GPU user. Currently it is not possible since
> > mesa requires either of those to be enabled for the DISTRO.
> > 
> > Add new 'opencl' DISTRO_FEATURE, controlling enablement of OpenCL.
> > 
> > Note: Mesa, if built with the libclc packageconfig (which is required
> > for OpenCL driver) depends on the mesa-clc tool from the mesa-native
> > package. It is required to propagate opencl DISTRO_FEATURE to the native
> > set in order to be able to fulfill mesa -> mesa-native dependency as
> > otherwise mesa-native package will be skipped.
> > 
> 
> Ah, I think I see now.
> 
> Wouldn't that be handled by removing the dependency of mesa on mesa-native
> for libclc if we switch to depending on mesa-tools-native instead? Something
> I attempted to do here: https://lore.kernel.org/openembedded-core/20250822-mesa-libclc-panfrost-v6-12-393cf47e2fa2@cherry.de/
> 
> What's preventing me from doing this right now is that we have expat and
> zlib in DEPENDS in mesa.inc and mesa-tools-native is including it but as a
> native-only package. In that scenario, DEPENDS content is NOT automatically
> replaced with -native recipes, but only through PACKAGECONFIG dependency
> mechanism. Therefore, we would need to migrate expat and zlib to a
> PACKAGECONFIG option (which can be enabled by default!) so that
> mesa-tools-native can be merged and thus remove the need for a mesa's libclc
> config to require mesa-native's config to contain libclc. Which means we
> don't need to have opencl in the native/nativesdk filter?

Yes, we can drop it as soon as that patch lands. If you don't mind, I
will take a look if I can fix the dependencies in your patch in a nicer
way.

> 
> What do you think?
> 
> Cheers,
> Quentin
> 

-- 
With best wishes
Dmitry

