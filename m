Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B815DC369B4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 12:53:13 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.19248.1744721583577548345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 05:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=D+gqj4LP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tCJ5022976
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 12:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xDR3WCS7Gz9RpjwChxpwqnNK
	vyBV/T6R/B4TbUG5CRw=; b=D+gqj4LP7G/RVC91ZQpedEKJxqMjRifwCH83pbdq
	clYuPyvUq9TvA7geGiFM4NIxIuqUSpirGL6b9JQrYwK/wOF0/2/cYkuDkAp7glBo
	Mys0bwUy4TqHprShqcWSQGBfc2k3x6NmyMF5cyd4tbaf8nckM7zM16RIuiz6oLKx
	btvNGnLyJcA8nBesgHV5HnIHLadreot9IshmgStYrwe/egkA+FrNeLwBIuj7upHU
	9xxenXr6JVhIKWoFlQDb8ykWcbruJPQHNoCpa/FhYnZb2VCIhUoaNrNaAw2CCD1W
	qG5pj6R5ZI+OBgO+798XR3C5cB9nEGgJD9H9d9kc4Fmz7A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj983nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 12:53:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so898251785a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 05:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721582; x=1745326382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDR3WCS7Gz9RpjwChxpwqnNKvyBV/T6R/B4TbUG5CRw=;
        b=S3Mjfhw9YEyFySmJOY0Nw5Nl60FlP/imBQ/T9j/JWQAeFRiLip0yX3hdtPU1Fmpxu3
         HuMOua441gWi5QhM1eoFNt9Il4SEHgQJNQSCbmTxMuepZOGjfa1zTFKg3oMl2Rhwy9vA
         FydPktJzMxBw+6hM7S90ChMEVhN/qZqKPNvnKRVA04zFbv+JmLj/Y8tnAdnfX5UfzzFi
         wE8RrTSFuUb3d9OnrxDG879R88JzHqNylquVLzqNZEKU+SjCZbQWPSyaPxTwykLO1l/s
         ioVF9lBHdadNvzDHoiQFVNzBbn3jVDE4OlQclLIjgTMZQx+zzuuv/izedTDBy2gopAOm
         TJ9g==
X-Gm-Message-State: AOJu0YwKZutiANlF6QZm8W5IVqyTV6kGkIBoZr432OSpC5/XY71DlnEo
	mq8XFjU0zTQpIauEMnGeUMzIjr12tbwj+s/tz+qHk4I2PI2OJXfQYHOkR50igu8xVXxiMcA+NvD
	MwplrcILsQe/1LmPVARFUabcwUf9lRrdqsc6IK8ZfhRAl4uFlVbHrr/NcGtb0UbiKDhATCvOuig
	BN7ns=
X-Gm-Gg: ASbGncti3AoCYki8xgeqMpTXZZKv2zGpaDpn7pxC01wyT7f3DrRHKmzpOWfRqU52Cn+
	dDCil2DNzxvo0r09IWB6mDW7VHBuAXIIcfrckCbhpF14TokYb3L+xs4GNXLUe43MuhRCKgkYhKy
	2p4/ybOh+Wnvw1pkI6CoCepL3OJdEFk0bqAIDUSMMd6I3MnLBrAN1BGTW75okLzrjqKy1Fl7xh/
	dTDUAnECKmuuzkYjnaDd01B7N9OawTZ14mAH089bU23pLPSb1yWmGW1Uw47bQpAT8bwHH73FYID
	psWNDBQHOQ+5pB0ClEsRKmjk+Ay1lPgfkVD31SQjt07ok79IvhhcTG1ZaQFXFWk+Hzz8W1nxiCQ
	=
X-Received: by 2002:a05:620a:1918:b0:7c5:48b8:b4ac with SMTP id af79cd13be357-7c7af0e2e87mr2299506885a.34.1744721581796;
        Tue, 15 Apr 2025 05:53:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVgp4CG8+kv0QdHrIR1oouawSZPwrsGYSqaGjq9UpbX/WY+oMPf4baLYwE+QDp60TNIZSusg==
X-Received: by 2002:a05:620a:1918:b0:7c5:48b8:b4ac with SMTP id af79cd13be357-7c7af0e2e87mr2299503485a.34.1744721581384;
        Tue, 15 Apr 2025 05:53:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f83afsm20275701fa.107.2025.04.15.05.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:53:00 -0700 (PDT)
Date: Tue, 15 Apr 2025 15:52:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org,
        Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] mesa: enable PanVK
Message-ID: <paj3defvlgkx7jdrbpeghryi6yu6v23tzbdkclcebnkfalqfcp@2spflej7b4rb>
References: <20250415-mesa-panvk-v1-1-39592671ef11@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-mesa-panvk-v1-1-39592671ef11@cherry.de>
X-Proofpoint-ORIG-GUID: qVxUOqHf3OpHftlSs0-wOGxzU_fwO7r5
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fe56ae cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=ZWrZEbI2ZMybAHUa-QoA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: qVxUOqHf3OpHftlSs0-wOGxzU_fwO7r5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 12:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214846

On Tue, Apr 15, 2025 at 02:41:51PM +0200, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> If panfrost is enabled, we currently build panfrost tools and the
> gallium driver. There's also a vulkan driver available for panfrost, so
> let's enable it as well whenever panfrost PACKAGECONFIG is enabled,
> similarly to how it's done for the gallium driver.
> 
> PanVK is the "commercial" name for the vulkan driver for panfrost but
> it's enabled under the panfrost name in meson.
> 
> This was "tested" with `vkgears -info` with mesa-demos from commit
> 11939e1697b894be3c68a89e3ea86fc51a320836 on an RK3588-based system.

Could you possibly try with vkcube from
https://github.com/lumag/vkcube/tree/kms ? This is the branch that I've
fixed to work without Xorg or Wayland.

> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Just stumbled upon PanVK yesterday[1] so wondered how to make this work.
> 
> Sadly, vkgears from mesa-demos 9.0.0 doesn't seem to work well:
> 
> root@jaguar:~# vkgears -info
> xkbcommon: ERROR: failed to add default include path /usr/share/X11/xkb
> Segmentation fault
> 
> But I've bumped it to the latest commit in main branch with the
> following:
> 

[...]

> ---
>  meta/recipes-graphics/mesa/mesa-demos_git.bb | 47 ++++++++++++++++++++++++++++

This should come as a separate patch and ideally just by bumping current
9.0 to _git.

>  meta/recipes-graphics/mesa/mesa.inc          |  1 +
>  2 files changed, 48 insertions(+)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_git.bb b/meta/recipes-graphics/mesa/mesa-demos_git.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..99dc298389f4d6c2a11a0df5cca484799f986bc5
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa-demos_git.bb


[skipped]

> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index aca34983e97ca684d662987d3a1d0b61ba44029a..0163d96a36a5e8eb016ddbe2b645d6bcaba71179 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -119,6 +119,7 @@ VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',fr
>  VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
>  VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '${VULKAN_DRIVERS_LLVM}', '', d)}"
>  VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination-experimental', '', d)}"
> +VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"

LGTM

>  PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
>  
>  # mesa development and testing tools support, per driver
> 
> ---
> base-commit: 122e9a49614b2ddedaae1d90c06004a7a4c43998
> change-id: 20250415-mesa-panvk-7039f4060425
> 
> Best regards,
> -- 
> Quentin Schulz <quentin.schulz@cherry.de>
> 
> 

-- 
With best wishes
Dmitry

