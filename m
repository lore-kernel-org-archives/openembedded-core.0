Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001A1F9D0E7
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 16:29:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.914.1776184151725842044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 09:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Tu6Q+g3i;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=R603Ltnl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBsJIe363130
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 16:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PGPlYaUH6TOSODAm/5m9TUjB
	oSoNk0YyreJCJNT+qr0=; b=Tu6Q+g3iDxk0Y635vcKDuSBPUWi45LvEw4YrWanJ
	piCj/ZrjjhILmQ3G27pklG/mGhEJYVJHs44DvFP/nB6Sm1oRFrKaapsfF6yODITs
	xo91B8Sy0fJdUhJUHlsUVdYW/EB+yIi2JO6TAGm78jclt759YKY/QD2D2M7xWhFu
	Ofn2G0NF4qcFl2N5ob2Ae+/PDSoH5tL7hvsnaHzbYIJY9Bx2LadOorHyqXBeLI2f
	Glj1G+M9R2C6Qtgwg1mXeEIdii9Dtwx3iUIv+EO5yG6TDxa6SHAu9VP6cPUZ+73Y
	+TKzqLB+uVw1lOlW/W+RaKv0ZaZqRvxuUDZwCTGd0jCmCQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870um5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 16:29:11 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffa1faa59dso5771830137.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 09:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776184150; x=1776788950; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PGPlYaUH6TOSODAm/5m9TUjBoSoNk0YyreJCJNT+qr0=;
        b=R603LtnlYfP1x94I+ujKtoDcEm8ofAVefR1HAX9D93BWt7djt29EkrmafRZ8rRVBVP
         VYPqHhr0/zI3Oq7O+8K8xbiPynafNgxH8bAjuBj+w+33wQHWCF8K+03CfXdnbO3grogX
         /yR3ixq1cQCSd+R8K27JMABIwx+uXS5k/IYFl1xrW6wD+o/0aI2DBwu8L9XV59xY3hgt
         voRtMXzYabljJqjOF/Qi5JY7b3SwO+WA6k1ocOT4QzrEeR0bTau2qmKY9J/+MVQ8CfWX
         KPzQ5jxgzxjB/kEenJ6kzlu7gmN64TbReZ8zq5FaKKeae6UMACIt1cjF4e02Ej9mMf3q
         fU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776184150; x=1776788950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGPlYaUH6TOSODAm/5m9TUjBoSoNk0YyreJCJNT+qr0=;
        b=LNPMtzRwxoBs8HUHCTSxZY5pid2h1/oPoVDkkr061QpVupw+0kqLrZofLxLc2J3Syd
         WaE+U2ccjqERDVhDgKFPI8kWIDWsWSG7e7vI93zvpcC5brgkhToHP9xrFmN04gZZr0tA
         S2dkPJySH8BAVqd9u7Cs+8sVOmZi0gxRoHSiFltXsvGmgs/tNIyaLYUOGb7v35CYTb3P
         5G8d18jB0TSURED8oJgzBOtpz9HDdnbZ7CYD9oHM4+neSTjV/a4XhBGaEPW+tjkrzGvZ
         aNdR+iYhgqeLAUylXSJSPD5PKLrKXhtUIdC7FHyMT+yo00fE/vtLEG5dPsEvCIFCOuuk
         eRXQ==
X-Gm-Message-State: AOJu0Yz1In/Zn1lAicmY2XwZe/t6oiP7y38ui9O2trgMYKL4iavCzn7M
	y0WGerffg2lPcdN5ZSJJPTDURcvkTNbff4kF8YEHpJtfqFjoBSDtftwTOI5mkOz5t02j2Dr0Fiy
	r5Xi1lquaQs879U/CKDSmcchmi+3MminIUdUXGWUA7vzIKJOf3FIzyHhTLKrtxhhxljqQK1SM+5
	lliwB6aa0=
X-Gm-Gg: AeBDiev0RFX9TDim+a0k1lznyp6D9dB3q+PPpGsDZCY9RSxFBaJe4gRa/IEm7hrdfod
	fJkf/M6NuTRt0wC7n3b589o5c4T4tCtVEJq7Kh+PRvMUrYfuY5OtlRe2YWi3vvsldbbpPDSaL4W
	UC8J8sP4Btrp2JSnz/3lnEyIZDIdEqwUKQmuhJpJQi3g1V4P7zq07m1AarCeigGhKNJ/faIoZvx
	bHeXfhQ/tZ+BIuEwA3rqpctRH7TePoymEAinj96cegF4XYeISGOLsnJaAon8upnhgeBiXmRDgNs
	6Gq3dfOYTrp9HFtxz1w9R+B9hLbuD5B9B9zsJy0/e55DqbeJ5ZvZL9maHO6ReDyal2n5SefzSv4
	0hdDkd22aaVY7YHZzdqirmNouBacstpP0nt4ujhcn4XZMN7aYPE35Kc+mDlu9h7WlzLfFWvQyCS
	FcN7Ryah6ZMw2Sg8sHmFjs5BMp+yAuhFn0KUNG46AElDk2Dw==
X-Received: by 2002:a05:6102:105b:b0:60f:7499:9b63 with SMTP id ada2fe7eead31-60f7499a134mr3077067137.17.1776184149640;
        Tue, 14 Apr 2026 09:29:09 -0700 (PDT)
X-Received: by 2002:a05:6102:105b:b0:60f:7499:9b63 with SMTP id ada2fe7eead31-60f7499a134mr3077047137.17.1776184148987;
        Tue, 14 Apr 2026 09:29:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3fd2c43f0sm1458774e87.42.2026.04.14.09.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 09:29:07 -0700 (PDT)
Date: Tue, 14 Apr 2026 19:29:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: upgrade 20260309 -> 20260410
Message-ID: <4n7yf7zlnvj5n7xgwqf5vyjjdviurgmvqqjwsmv5lgz7vq7r45@eaq7xrkrky33>
References: <20260413192730.3533490-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413192730.3533490-1-vpuar@qti.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de6b57 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=UYSZlAdnGeBjW_L5y5IA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE1NCBTYWx0ZWRfX0My0ZftcksmI
 pS0Pop5jYj+kyT2aByC3j4ipBxnzm7EmlbVIlWVL5Ce7wfaPrmq82xkjlbfEFB6EdffI1zFNHxW
 m/fs8K8B9bda1Tvv51oRvvAKZPfDTTQHWl6DGhzzfMODwFlmv0L9sXhVBV+tc3U2ERd9s2xMwgK
 qhox/eFCSiNYz0WPmrAUVsS1N+Iifk7FlbO39U9C40TpmPsCbVYwPYZpuFb7t7U2kJjMwDQ4Psg
 n2l92FzUWKcp3jE4w8juuI8xgQYt55qq/Qoz8jDrlrZKaZqUKjR/blrGZaPIYIMNUMV/LQSg/Ar
 Mq1z9c+rMV7ZylNdt+lOt61rHCkdlDjWV923XzdnGup7OQRdrrmfGOrZ9sG0u7hfRnQ3DRgpR0j
 H/ndzOspuT6iHeopzbkeGSzmcZx5DVCZbdFzXkoCbJxrvibbxXtcbyx6beFzsgboSv5ZSMVASUk
 PFcFWIq/HqzSRip4tAA==
X-Proofpoint-GUID: 5SK9xH9PzqvHR9AuvffCja_c4xmkzg6w
X-Proofpoint-ORIG-GUID: 5SK9xH9PzqvHR9AuvffCja_c4xmkzg6w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 16:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235171

On Tue, Apr 14, 2026 at 12:57:30AM +0530, Vivek Puar wrote:
> Upgrade the firmware package to latest release. Add qupv3fw
> firmware for qcs615 and shikra, add adreno, audio and compute
> package for DELL XPS13 9345, add audioreach firmware for Glymur
> and arduno monza, add ISH firmware for Intel Wildcat Lake platform,
> add lenovo ish firmware for X9-15 2025, X1 Carbon (Gen 14) and
> X1 2-in-1 (Gen 11).
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20260309.bb => linux-firmware_20260410.bb} | 59 ++++++++++++++++---
>  1 file changed, 50 insertions(+), 9 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260309.bb => linux-firmware_20260410.bb} (98%)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
> similarity index 98%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
> index 42681a879f..54c2c45261 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260309.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
> @@ -314,7 +314,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
>                      "
>  # WHENCE checksum is defined separately to ease overriding it if
>  # class-devupstream is selected.
> -WHENCE_CHKSUM  = "772c8667ff568e7de3a7794fd420f2f7"
> +WHENCE_CHKSUM  = "1468492365c9cec2e7ebf71c79d2e8f5"
>  
>  # These are not common licenses, set NO_GENERIC_LICENSE for them
>  # so that the license files will be copied from fetched source
> @@ -452,7 +452,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
>  # Pin this to the 20220509 release, override this in local.conf
>  SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
>  
> -SRC_URI[sha256sum] = "c74cc6f562b58ad5bc6b2b00a61abc29c9e49e06126e7ba34fbca9928e07a96c"
> +SRC_URI[sha256sum] = "b7812ed6d59f6b09ecceddaa0be842a7e82a79cc0e46ca60478a4ebf02f1e178"
>  
>  inherit allarch
>  
> @@ -720,8 +720,9 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
>               ${PN}-qcom-qcm6490-adreno ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute \
>               ${PN}-qcom-qcm6490-ipa ${PN}-qcom-qcm6490-wifi ${PN}-qcom-qcm6490-qupv3fw \
> -             ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs615-audio ${PN}-qcom-qcs615-compute \
> +             ${PN}-qcom-qcs615-adreno ${PN}-qcom-qcs615-audio ${PN}-qcom-qcs615-compute ${PN}-qcom-qcs615-qupv3fw \

Nit: the line becomes too long.

>               ${PN}-qcom-qcs6490-radxa-dragon-q6a-audio ${PN}-qcom-qcs6490-radxa-dragon-q6a-compute \
> +             ${PN}-qcom-shikra-qupv3fw \

shikra > qcs6490

>               ${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio \
>               ${PN}-qcom-qcs8300-adreno ${PN}-qcom-qcs8300-audio ${PN}-qcom-qcs8300-compute \
>               ${PN}-qcom-qcs8300-generalpurpose ${PN}-qcom-qcs8300-qupv3fw \
> @@ -751,7 +752,10 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg \
>               ${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg \
>               ${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg \
> +             ${PN}-qcom-x1e80100-dell-xps13-9345-adreno \
> +             ${PN}-qcom-x1e80100-dell-xps13-9345-audio \
>               ${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg \

Fold audio-tplg into audio, please. See how it was done for other
platforms.

> +             ${PN}-qcom-x1e80100-dell-xps13-9345-compute \
>               ${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg \
>               ${PN}-qcom-x1e80100-adreno ${PN}-qcom-x1e80100-audio ${PN}-qcom-x1e80100-compute \
>               ${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno ${PN}-qcom-x1e80100-lenovo-t14s-g6-audio \
> @@ -773,8 +777,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-intel-license ${PN}-ish-lnlm \
>               ${PN}-dell-license ${PN}-ish-lnlm-39ceeaf8 ${PN}-ish-ptl-39ceeaf8 \
>               ${PN}-hp-license ${PN}-ish-lnlm-12128606 \
> -             ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad \
> -             ${PN}-ish-ptl \
> +             ${PN}-lenovo-license ${PN}-ish-lnlm-53c4ffad  ${PN}-ish-ptl-53c4ffad \

unnecessary double whitespace

> +             ${PN}-ish-ptl ${PN}-ish-wcl \
>               ${PN}-advansys-license ${PN}-advansys \
>               ${PN}-aeonsemi-license ${PN}-as21xxx \
>               ${PN}-agere-license ${PN}-orinoco \
> @@ -2330,7 +2334,7 @@ LICENSE:${PN}-qcom-apq8096-audio = "Firmware-qcom"
>  LICENSE:${PN}-qcom-apq8096-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-apq8096-modem = "Firmware-qcom"
>  LICENSE:${PN}-qcom-glymur-adreno = "Firmware-qcom"
> -LICENSE:${PN}-qcom-glymur-audio = "Firmware-qcom-2"
> +LICENSE:${PN}-qcom-glymur-audio = "Firmware-qcom-2 & Firmware-linaro"
>  LICENSE:${PN}-qcom-glymur-compute = "Firmware-qcom-2"
>  LICENSE:${PN}-qcom-kaanapali-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-kaanapali-audio = "Firmware-qcom-2 & Firmware-linaro"
> @@ -2349,8 +2353,10 @@ LICENSE:${PN}-qcom-qcm6490-qupv3fw = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs615-audio = "Firmware-qcom & Firmware-linaro"
>  LICENSE:${PN}-qcom-qcs615-compute = "Firmware-qcom"
> +LICENSE:${PN}-qcom-qcs615-qupv3fw = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "Firmware-qcom & Firmware-linaro"
>  LICENSE:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute = "Firmware-qcom"
> +LICENSE:${PN}-qcom-shikra-qupv3fw = "Firmware-qcom"

shikra > qcs6490.

>  LICENSE:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "Firmware-qcom & Firmware-linaro"
>  LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2 & Firmware-linaro"
> @@ -2402,7 +2408,10 @@ LICENSE:${PN}-qcom-x1e80100-asus-vivobook-s15-audio-tplg = "Firmware-linaro"
>  LICENSE:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg = "Firmware-linaro"
>  LICENSE:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg = "Firmware-linaro"
>  LICENSE:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg = "Firmware-linaro"
> +LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-adreno = "Firmware-dell"
> +LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-audio = "Firmware-dell"

Fold -audio-tplg, add & Firmware-linaro

>  LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg = "Firmware-linaro"
> +LICENSE:${PN}-qcom-x1e80100-dell-xps13-9345-compute = "Firmware-dell"
>  LICENSE:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg = "Firmware-linaro"
>  LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "Firmware-qcom & Firmware-linaro"
> @@ -2458,7 +2467,10 @@ FILES:${PN}-qcom-apq8096-adreno = "${nonarch_base_libdir}/firmware/qcom/apq8096/
>  FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
>  FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn*"
>  FILES:${PN}-qcom-glymur-adreno = "${nonarch_base_libdir}/firmware/qcom/glymur/gen80100_zap.mbn*"
> -FILES:${PN}-qcom-glymur-audio = "${nonarch_base_libdir}/firmware/qcom/glymur/adsp*.*"
> +FILES:${PN}-qcom-glymur-audio = " \
> +    ${nonarch_base_libdir}/firmware/qcom/glymur/adsp*.* \
> +    ${nonarch_base_libdir}/firmware/qcom/glymur/GLYMUR-CRD-tplg.bin* \
> +"
>  FILES:${PN}-qcom-glymur-compute = "${nonarch_base_libdir}/firmware/qcom/glymur/cdsp*.*"
>  FILES:${PN}-qcom-kaanapali-adreno = "${nonarch_base_libdir}/firmware/qcom/kaanapali/gen80200_zap.mbn*"
>  FILES:${PN}-qcom-kaanapali-audio = " \
> @@ -2485,6 +2497,7 @@ FILES:${PN}-qcom-qcm6490-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qc[ms]6
>  FILES:${PN}-qcom-qcs615-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs615/a612_zap.mbn*"
>  FILES:${PN}-qcom-qcs615-audio = "${nonarch_base_libdir}/firmware/qcom/qcs615/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs615/TALOS-EVK-tplg.bin*"
>  FILES:${PN}-qcom-qcs615-compute = "${nonarch_base_libdir}/firmware/qcom/qcs615/cdsp*.*"
> +FILES:${PN}-qcom-qcs615-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qcs615/qupv3fw.elf*"
>  FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = " \
>      ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/adsp*.* \
>      ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/QCS6490-Radxa-Dragon-Q6A-tplg.bin*\
> @@ -2493,13 +2506,18 @@ FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = " \
>  FILES:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute = " \
>      ${nonarch_base_libdir}/firmware/qcom/qcs6490/radxa/dragon-q6a/cdsp*.* \
>  "
> +FILES:${PN}-qcom-shikra-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/shikra/qupv3fw.elf*"

The same

>  FILES:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = " \
>      ${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/adsp*.* \
>      ${nonarch_base_libdir}/firmware/qcom/qcs6490/Thundercomm/RubikPi3/QCS6490-Thundercomm-RubikPi3-tplg.bin* \
>      ${nonarch_base_libdir}/firmware/qcom/qcs6490/QCS6490-Thundercomm-RubikPi3-tplg.bin* \
>  "
>  FILES:${PN}-qcom-qcs8300-adreno = "${nonarch_base_libdir}/firmware/qcom/qcs8300/a623_zap.mbn*"
> -FILES:${PN}-qcom-qcs8300-audio = "${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin*"
> +FILES:${PN}-qcom-qcs8300-audio = " \
> +    ${nonarch_base_libdir}/firmware/qcom/qcs8300/adsp*.* \
> +    ${nonarch_base_libdir}/firmware/qcom/qcs8300/arduino-monza-tplg.bin* \
> +    ${nonarch_base_libdir}/firmware/qcom/qcs8300/MONACO-EVK-tplg.bin* \
> +"
>  FILES:${PN}-qcom-qcs8300-compute = "${nonarch_base_libdir}/firmware/qcom/qcs8300/cdsp*.*"
>  FILES:${PN}-qcom-qcs8300-generalpurpose = "${nonarch_base_libdir}/firmware/qcom/qcs8300/gpdsp*.*"
>  FILES:${PN}-qcom-qcs8300-qupv3fw = "${nonarch_base_libdir}/firmware/qcom/qcs8300/qupv3fw.elf*"
> @@ -2577,10 +2595,16 @@ FILES:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg = " \
>      ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/latitude-7455/X1E80100-Dell-Latitude-7455-tplg.bin* \
>      ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Dell-Latitude-7455-tplg.bin* \
>  "
> +FILES:${PN}-qcom-x1e80100-dell-xps13-9345-adreno = "${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/qcdxkmsuc8380.mbn*"
> +FILES:${PN}-qcom-x1e80100-dell-xps13-9345-audio = " \
> +    ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/*adsp*.* \
> +    ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/battmgr.jsn* \
> +"
>  FILES:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg = " \
>      ${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/X1E80100-Dell-XPS-13-9345-tplg.bin* \
>      ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-Dell-XPS-13-9345-tplg.bin* \
>  "
> +FILES:${PN}-qcom-x1e80100-dell-xps13-9345-compute = "${nonarch_base_libdir}/firmware/qcom/x1e80100/dell/xps13-9345/*cdsp*.*"
>  FILES:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg = " \
>      ${nonarch_base_libdir}/firmware/qcom/x1e80100/hp/omnibook-x14/X1E80100-HP-OMNIBOOK-X14-tplg.bin* \
>      ${nonarch_base_libdir}/firmware/qcom/x1e80100/X1E80100-HP-OMNIBOOK-X14-tplg.bin* \
> @@ -2631,7 +2655,7 @@ RDEPENDS:${PN}-qcom-apq8096-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-glymur-adreno = "${PN}-qcom-license"
> -RDEPENDS:${PN}-qcom-glymur-audio = "${PN}-qcom-2-license"
> +RDEPENDS:${PN}-qcom-glymur-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-glymur-compute = "${PN}-qcom-2-license"
>  RDEPENDS:${PN}-qcom-kaanapali-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-kaanapali-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
> @@ -2654,8 +2678,10 @@ RDEPENDS:${PN}-qcom-qcm6490-qupv3fw = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs615-audio = "${PN}-qcom-license ${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-qcs615-compute = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-qcs615-qupv3fw = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-audio = "${PN}-qcom-license ${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-qcs6490-radxa-dragon-q6a-compute = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-shikra-qupv3fw = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs6490-thundercomm-rubikpi3-audio = "${PN}-qcom-license ${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-qcs8300-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcs8300-audio = "${PN}-qcom-2-license ${PN}-linaro-license"
> @@ -2709,7 +2735,10 @@ RDEPENDS:${PN}-qcom-x1e80100-asus-vivobook-s15-audio-tplg = "${PN}-linaro-licens
>  RDEPENDS:${PN}-qcom-x1e80100-asus-zenbook-a14-audio-tplg = "${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-x1e80100-dell-inspiron-14-plus-7441-audio-tplg = "${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-x1e80100-dell-latitude-7455-audio-tplg = "${PN}-linaro-license"
> +RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-adreno = "${PN}-dell-license"
> +RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-audio = "${PN}-dell-license"
>  RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-audio-tplg = "${PN}-linaro-license"
> +RDEPENDS:${PN}-qcom-x1e80100-dell-xps13-9345-compute = "${PN}-dell-license"
>  RDEPENDS:${PN}-qcom-x1e80100-hp-omnibook-x14-audio-tplg = "${PN}-linaro-license"
>  RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "${PN}-qcom-license ${PN}-linaro-license"
> @@ -2801,14 +2830,26 @@ LICENSE:${PN}-ish-lnlm-53c4ffad = "Firmware-lenovo"
>  FILES:${PN}-ish-lnlm-53c4ffad = "\
>      ${nonarch_base_libdir}/firmware/intel/ish/ish_lnlm_53c4ffad_*.bin* \
>      ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_X1_2025_5.8.4.7720.bin* \
> +    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_x9-15_2025_5.8.0.7720.bin* \
>      ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_lnlm_lenovo_X9-14_2025_5.8.36.09092.bin* \
>  "
>  RDEPENDS:${PN}-ish-lnlm-53c4ffad = "${PN}-lenovo-license"
>  
> +LICENSE:${PN}-ish-ptl-53c4ffad = "Firmware-lenovo"
> +FILES:${PN}-ish-ptl-53c4ffad = "\
> +    ${nonarch_base_libdir}/firmware/intel/ish/ish_ptl_53c4ffad_*.bin* \
> +    ${nonarch_base_libdir}/firmware/LENOVO/ish/ish_ptl_lenovo_X1_2026_5.8.1.7782.bin* \
> +"
> +RDEPENDS:${PN}-ish-ptl-53c4ffad = "${PN}-lenovo-license"

After -ish-ptl, please.

> +
>  LICENSE:${PN}-ish-ptl = "Firmware-intel"
>  FILES:${PN}-ish-ptl = "${nonarch_base_libdir}/firmware/intel/ish/ish_ptl.bin*"
>  RDEPENDS:${PN}-ish-ptl = "${PN}-intel-license"
>  
> +LICENSE:${PN}-ish-wcl = "Firmware-intel"
> +FILES:${PN}-ish-wcl = "${nonarch_base_libdir}/firmware/intel/ish/ish_wcl.bin*"
> +RDEPENDS:${PN}-ish-wcl = "${PN}-intel-license"
> +
>  # For advansys - AdvanSys SCSI
>  LICENSE:${PN}-advansys-license = "Firmware-advansys"
>  FILES:${PN}-advansys-license = "${nonarch_base_libdir}/firmware/LICENCE.advansys"
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

