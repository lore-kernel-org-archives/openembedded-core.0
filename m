Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43786C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 12:33:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.4090.1742378043613471679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 02:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hiLBP6a+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lxES019770
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GKCtwfke0p0ssKtC2cdrvboF
	OXtp1ruEm7rPWZDQK2s=; b=hiLBP6a+GpSko6QrxkL3tAZswChY6FOGAou7fKVL
	6B2m/gBqH9/PHUqcvs4eTSieImclJMKuD438/DBn9j43Qr3aqWkaemyx63DS1ABw
	jsDll1/Opqr3ym3ARzjI1GPpAJnc9CLJ49nnqekt1JHLE8ItuM4V/p1OiqJogbf9
	H8CLOFgQ2ujS5t6I/mlMVk5XovqzH/4xNm8VeagZEjsAetFOeQ5h4kb3GxQZxcJI
	Uv5gpS4lInbduGE9qj2WMjQz2AYdHd04B1yk8syL9AtVYVFv92CaUx74QJKtt03z
	f6MX2wfUP5swNhRqWuL6PbHeDO+3muiMgCsDUQ7BYVK4qA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uu34mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:54:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ffb630ffso110775246d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 02:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742378042; x=1742982842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKCtwfke0p0ssKtC2cdrvboFOXtp1ruEm7rPWZDQK2s=;
        b=eeLb/IirSMlSsoRZVCdFc/XduOILeJ6SQRtHzX1EgQNCnlBZBPc9UiM21X3IOQRwMu
         nDAN4AN8d2RogF7WrqWCd6FepSvU3gGTc5nHk+CUJ4p5MZUDV+o9T/04mJm2SofQdg6J
         +u4j0xCBj6fhhMtfeTC/q7jXZoLgmA8H9cGaSBIMHS1ywocXl6W7mdG0xu74203gUYj5
         XMJPUP9H6/SSsrPaFpbR6/K+Nhh2lO2DEp2ov31fXS7LJmCWk3gC0AcuL52yYbkWFmEz
         lnjRxyYsJRtKRNoMmrsRLvzRc4A1ZO9mFiAMGvOR1CNhry/78L7wfIjuopQv8pvRtEx9
         V3+g==
X-Gm-Message-State: AOJu0YwWxUs4xTWAZw3dWVCyZBgvywacMnRKalu8bV/11CzMGTa0GCBM
	gJebX9sfEncvg+4XgXiIMgFxoUjqg+zALCZ8GFBknJGrML6hd2WFRW3uVWMVSXZvnqnkBXwEHFL
	UwSRZYeO3NuS+XduM9YfjUysnASBALs6jAeJbgm/JbhKrDXxNeITLpTs3aHw5Kk657fFx0XL9WO
	xZgQY=
X-Gm-Gg: ASbGncsgY8iZtp7UmTUTr8EUGNIvUV21q5CHbH52Bjrt3hJcvLYOMDZHUxbAe3QqBkR
	IF+pjXaWRrnF/EDGLd+1AdSmRR8Hcm/Rbztm/YFgHDvYjTrlMbXZwanVdZc92cm5IzF3ZQR+MoZ
	FJRZt0GElweomAAKKiOyiARgMERZTST94agsiZSTf0qlPW3Ht8HTNHfY5qMqBpLBOx92QPN99VS
	DBKYL6DgEdA/lOUKlMPZyeGJehCRYt41W3S/oc1HZdV0zbt1Jl+6KUNVJSoX2aevuASEW5VFhJm
	wZYakJEWBOFoKG3HBYRXgpeVfxn/Wtpa2PTyT9UWKenVZnrxDT1Ya++ww78cy0e2k3GW+4UT/4/
	u+48=
X-Received: by 2002:a05:6214:19c2:b0:6e8:f945:ec5 with SMTP id 6a1803df08f44-6eb293be952mr25158746d6.24.1742378041822;
        Wed, 19 Mar 2025 02:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS80UNC3jA68lhDJf73lGNNau9J64F1KKxrukxcAJsO+Wz5FDOlcVWDYGLmHdQND1Phc89yQ==
X-Received: by 2002:a05:6214:19c2:b0:6e8:f945:ec5 with SMTP id 6a1803df08f44-6eb293be952mr25158616d6.24.1742378041453;
        Wed, 19 Mar 2025 02:54:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f117461sm22942711fa.61.2025.03.19.02.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:54:00 -0700 (PDT)
Date: Wed, 19 Mar 2025 11:53:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <quic_vpuar@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] linux-firmware: upgrade 20250211 -> 20250311
Message-ID: <rdo6kbungabjbtwipecsjooppsffxvkftx66tgp2rhsswtvblp@hceblx2nc4la>
References: <20250316130954.2719960-1-quic_vpuar@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20250316130954.2719960-1-quic_vpuar@quicinc.com>
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67da943a cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=U7S0-3dci94F58_gCmQA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ZSxpDF12qqQboyGNOpko39seIEkaUPyZ
X-Proofpoint-ORIG-GUID: ZSxpDF12qqQboyGNOpko39seIEkaUPyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=877
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190068
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 12:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213326

On Sun, Mar 16, 2025 at 06:39:54PM +0530, Vivek Puar wrote:
> Add gpu firmwares for qcs8300 chipset to
> ${PN}-qcom-adreno-a623 and
> ${PN}-qcom-qcs8300-adreno packages
> 
> Add bluetooth firmwares for QCA2066
> to ${PN}-qca-qca2066 package.
> 
> Add firmware files for Adreno A225
> to ${PN}-qcom-adreno-a2xx package
> 
> License-Update: additional files
> 
> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> ---
>  ...20250211.bb => linux-firmware_20250311.bb} | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250211.bb => linux-firmware_20250311.bb} (98%)
> 
> @@ -739,6 +741,9 @@ FILES:${PN}-qca-qca2066 = " \
>    ${nonarch_base_libdir}/firmware/qca/hpnv21g.bb8* \
>    ${nonarch_base_libdir}/firmware/qca/hpnv21g.b10c* \
>    ${nonarch_base_libdir}/firmware/qca/hpnv21g.b111* \
> +  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_030a.bin* \
> +  ${nonarch_base_libdir}/firmware/qca/QCA2066/nvm_usb_00130201_gf_030a.bin* \
> +  ${nonarch_base_libdir}/firmware/qca/QCA2066/rampatch_usb_00130201.bin* \

No, these are USB-related files. Please push them to qca-qca61x4-usb
instead.

The rest looks good to me

>  "
>  FILES:${PN}-qca-wcn7850 = " \
>    ${nonarch_base_libdir}/firmware/qca/hmtbtfw20.tlv* \

-- 
With best wishes
Dmitry

