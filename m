Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21726C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 11:02:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.4293.1753786950003770450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 04:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=E6CPbOgy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9fRbF017653
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 11:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rbQ2m7EXBwa2aAQVt+y1vFng
	TE1cERgKgLWa4U+4OVk=; b=E6CPbOgyxA1FU5FLchKVPeEbRcXe0ifIZnkxTpvO
	1Po5L0EagCmuROPDBiIhlD5qxjbJqIf75VnGw0v6jBDoKUUNpLQ1A1qwBMaYt6JH
	nJRu/faJ99vrAbEuOFRgHG5fjPHZl/oot2iYaCWD3dHBX0FqIOrNXBkhLTrE2/xx
	qbT4ldWE+78055HSXiP/b65nW6DrNXgR95PCYXizPewLOxmtt+2+pF9wjNbiyRpl
	3o7OwyhbywLzlDsbueCiywSLG5WF2tLDaWN5Ts+dXcGYSgH9zq7hiLJ3ER4NIR15
	i+sLw2AsRzSzfMMTaTX4/QPHxeC+TlxlyK17f1JnZV8Jeg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2frj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 11:02:28 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4211b99b7c7so2087193b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 04:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753786948; x=1754391748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbQ2m7EXBwa2aAQVt+y1vFngTE1cERgKgLWa4U+4OVk=;
        b=qbZv4dkgnJsEHuC3k4speZGvs7tp4wN2NcGY8s5TmG4Od5pKfqGkrcT5Gfw3VAGEo8
         Er96/eM8Pk6QJ1JSNXiR7H0p1K7saXm2IC7YkWKI8H03kUK0ziiCmkEcDpVOsZz7ZBOj
         31XViUUD+aoX+0lWVQsHAe9AxhChnEYf/4tt6qSgYGte7e6M06OUeu4Tkw1ikeW7XdCD
         rpjUaXsXFz8++Lj4Oc9rIeWJglRdaeUEJIlvvSQkobeQ0C31eDYX5KohAJRQNlLpi/22
         JY5uwf5utfCLbElU3vAYtF24ap06WPPkCwciCfMduiR1sQ1HwHu+ETN9lbOJwWLYbEqK
         iDRQ==
X-Gm-Message-State: AOJu0Yy+ePLeky/+XD3wQ0Teofpld7PYhnpRYLmfOP+/gzDNiFAdeFvn
	Oew7PJe3X0WMT+DDCIaNZVbM3xb7ZS7yY/xqJ9M4qM3BUXdK0ynGz8evJ17VeYMbu+Zx+9FS0vO
	7cYP5saUBdQRhDZLp9cbPy0R49+JYoHdAwTtof53LGn6Xiv3AoSwF24pAhnoBHdFvwB7N3BdMmn
	GAwnr8uh4=
X-Gm-Gg: ASbGncvHzdFLcA/FlI+RCKuulEwWMltyqbPgGfO7/jSN4uynQyzR1mtSo8A1uSaeRjn
	1jgiiiRpkdbOyzk+aMapbiAKjyZY4XwXiu9CSvczKbRHoHi6hafcG8lGrFMd5FlLbvG9mOJENp2
	rLJpK2sr+VJ5AxgNI+5bxLHAMHqVSMmYP2jZrLc/EVpjkZgGx6bMPiOdCHGT1SmS6ZfV6sSx9Xe
	BPhRzJufzdD9x53vSOYlirVhMrq5AVA2PKooHqMmX0rqY/oOsvOKU8LncjJ8RXLV7N3OLI3nqFi
	WCkde9TKhKkhFrGKmy5WmJxRuzPHdNAO8T2UjYhx90XknrVIB42ywX36O2v1I4ovgkjtTuOmYJY
	epeCCL3nQdmW5hosprPL74G+dlNRHEQOGtxYFMO0cmOLDSk2gH64s
X-Received: by 2002:a05:6808:2199:b0:408:fbb6:f4cb with SMTP id 5614622812f47-42bb74ec87dmr8636293b6e.6.1753786947787;
        Tue, 29 Jul 2025 04:02:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtWWlXUqx3K22l7U3fgyZcY56h7VRaWufPk7cPriupnkjHecjJaAz5w42Hi9t5d+B8lDSPrg==
X-Received: by 2002:a05:6808:2199:b0:408:fbb6:f4cb with SMTP id 5614622812f47-42bb74ec87dmr8636255b6e.6.1753786947243;
        Tue, 29 Jul 2025 04:02:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b73a42fa1sm357170e87.125.2025.07.29.04.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 04:02:26 -0700 (PDT)
Date: Tue, 29 Jul 2025 14:02:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>,
        Trevor Woerner <twoerner@gmail.com>, Ross Burton <ross.burton@arm.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH RFC v3 6/9] mesa-gl: drop egl/gles from default
 PACKAGECONFIG
Message-ID: <t7yu2iynfa5vewdnzliamq7u3b5ufppjpanm53n46m7pqhtop2@a2y2gfbu2lud>
References: <20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de>
 <20250729-mesa-libclc-panfrost-v3-6-42559ddc93ef@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-mesa-libclc-panfrost-v3-6-42559ddc93ef@cherry.de>
X-Proofpoint-GUID: ay8CwcIEybS9N4whVuY-qchyq9UG6qBB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4NSBTYWx0ZWRfX9QeR06RTNVfF
 t2/zmWm5M87l2FJMACxMV5g6spAiC4ZkNbWG3eJVsFkAGMi+zHchazjAVvTsUxg9yX1D4uO1qHh
 0g/YAos+rwXV/FtSHuUMOIDcGFNgvZc3F33RcPhtR0lMqz2UzFoMmbvhMaUIzU4ZjMApwRW4G9r
 U7Hk7GyJP3aYjgN2waQ0/F5e7w6ojZrZRdxjaM/mvEtauOjw5Txqag9pDunNehAd0FYrkLZESFz
 KskFTn/3IEALLsUw5Fm/BbIaVyehGvsG8Zr1WZNddj98glxCsMjOQ/woFqdWqAkAw85zwvySynT
 rAScz8lWsoHuFpZ9LvSwbW6R12YXfVMmglqujqwP9pn8Kf8zE0Y6oUWyVzk1+rJeLX4rDPBrY4K
 Qp17kpCtaKRR3iBNc4v1194U3srZi6wdyiybvetdkfHHKQfUf1uvBSXrvjLh7J0whNR14HRw
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6888aa44 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jgUDVmK_3tg_-XbcUP8A:9 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: ay8CwcIEybS9N4whVuY-qchyq9UG6qBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 11:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221059

On Tue, Jul 29, 2025 at 11:36:27AM +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> According to the introducing commit log[1] and Dmitry's recollection[2],
> the whole point of mesa-gl recipe is to provide GL library in case there
> are vendor-provided GLES libraries.
> 
> Therefore, let's remove EGL and GLES default PACKAGECONFIG as if people
> really need them, they likely should be using the full mesa target
> recipe and not mesa-gl.
> 
> [1] https://git.yoctoproject.org/poky/commit/?id=015cb13a67c672de30f5384dab5ab4b8db305281
> [2] https://lore.kernel.org/openembedded-core/5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn/
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

Please squash this into patch 1, otherwise you are fixing an error that
you've just introduced.

> ---
>  meta/recipes-graphics/mesa/mesa-gl.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
> index 865b032fb0865ad0e76c3b3690eeec3d96def921..530a0c508c6868e8867ab6e60eca692610136864 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl.bb
> @@ -10,7 +10,7 @@ PACKAGECONFIG = " \
>  	gallium \
>  	video-codecs \
>  	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
> -	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl gbm virgl', '', d)} \
>  	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
>  "
>  
> 
> -- 
> 2.50.1
> 
> 

-- 
With best wishes
Dmitry

