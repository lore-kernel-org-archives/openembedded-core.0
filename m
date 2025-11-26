Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F68D11193
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 18:43:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1457.1764182608058535551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 10:43:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=I/Sb05Rk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NgBOUWSy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQG2h5Z1234822
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:43:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JKRDtOLX4FhwDlL4ptg8kHFE
	l+ctCElfWmNINX0ENkI=; b=I/Sb05RkKNykgqOOi2QHBK6bH5h/sVEsD7f3OZJg
	fm33h+ywaDmPbGTpQJeFT28nwgqSLQiDp0/IgPeFK6gVv2tUzxXPQmk5x3mVpddA
	WnwWJukM+Qhl8lvKcx4w9wKkN8HrDzmk3nYOzrOOFi+BmUe7DbUEuqMLHVlfkRjl
	iYbiCITNNftFwzV+qxbntoX6OmY6wyCsMaTQXmN4k8/Uf/b1nwdQS6p0ESPN8wBg
	bANwe6Va1kdfdGLj/irMYgONZCK6cOrb219RE7Xoe+XmHO8NFIzOaPBct7pP1CdH
	KheaU2VECwFzwBGm9lWv03cCPMPKBu9dOnpObB7zaSJvrw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd41wvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:43:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297dabf9fd0so953625ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 10:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764182606; x=1764787406; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JKRDtOLX4FhwDlL4ptg8kHFEl+ctCElfWmNINX0ENkI=;
        b=NgBOUWSy/rTGtnRJ9shzsYFkv59N/P69IkXhweoE0ZVrawjg90W7/GeiscCqM8SRJu
         K8YskgiESaq00zpgJ9rDWm1tfUFST9J+QfgarqFBHKq9/C3ITUebswx7vYTPHuTszKk1
         5rkpZTqyR4UePUynMudkDdrU6u4C1lzQ/pK1OCZ5miR6URg4OdCte0Hzj7s/L0j02TKN
         mhpUIBo7jndG1BUDeSEuqc536ecrmdu2dSGiLaVjfe8DO9jeNN6nr2clQziNv+bKahtH
         +xXUKnXNJq53JILguPdZSuYwsiczE2Bh5KnInnwIMYoYVSZRHUevQR32Y+yzSd0tAK4w
         GpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764182606; x=1764787406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKRDtOLX4FhwDlL4ptg8kHFEl+ctCElfWmNINX0ENkI=;
        b=P4WKdjjX5lAymur1nd/2x+PyN3+SkdcakcXjCaNopVFfGn6Ucy97UGs1orHLxm+2pU
         euNiLeexpMMoMp0HY+DL54pxhwJr5x1cXULE+ayih1wQ40+kq2gxBMGmXQs4VLEgND4A
         bLqngcr4s1OBb8wnZP96y0BJlfO0lu+C/ZCzW0KaIB9lqAw2KuuS0GZJDtKjZvHhtbC7
         H7W8yIs+4XsVtlP11nB+n0B9OQsrI5x3jm6rSubpNw5551yJeC0LXEQfwcpKLOlHuuuE
         dzeVOUJHM/wShfpmRK1T5lbVU5rR9UhlIsgEm6/6UgLjtJ4dc3jkes7wrin7JIML8JBZ
         UaDw==
X-Gm-Message-State: AOJu0YwcVd1iIOLRo+bcLTjgQQERYLpmaz2kVaNASiJABz1Br+VMB8gP
	2dpfV+MLIOpi9ptSPSoUffMHiO1y/elRUr8iNXtC0itqP1PmRTO3saQJppBs6JiwAzGsw6lM1os
	D/N9rKon6WBE6nJAyA+hHxfSJJj+JFtM3eiJ29G4a27jANdUn1qLoXbzXUotpNhSiV/0FE6iCFI
	zPLgzu+Vf2p3Bv9NdfTGPdWEWTXTAWEmPKfST3aZ5brzIBIRtsV47cQeNYTWHpHbaKaA==
X-Gm-Gg: ASbGnctQ4+fx4jWGZONxKXgjB6TY7t5LVUBab2xXkqjUcxhFsmsG9XH7UhmWHnXWngn
	qTX2xO7vcMmxnj7gupUmHcEx9d9xogTBAXwlOWJrDhDYVAagnQ+qgvOQLZUmgFI2lKCJL2xguaM
	cR36hXUnP24AbcOiHYKJhfsaJMNkIVr/vm3RXem6DqC8A23AOuFSHp1Zgouz5OLSVmhaa2DFyaC
	nFP+NbW
X-Received: by 2002:a17:902:f70b:b0:297:d6c2:d06 with SMTP id d9443c01a7336-29b6c3e4c7bmr232628295ad.20.1764182606455;
        Wed, 26 Nov 2025 10:43:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfu9BBXyiLbvNbTsznvIpz/CER8T67LTJ0LdWDYgN5UU4aa2Yw4/IGq3QMzOeSixfFCyhgbFV7n56IKjqW6Sw=
X-Received: by 2002:a17:902:f70b:b0:297:d6c2:d06 with SMTP id
 d9443c01a7336-29b6c3e4c7bmr232627955ad.20.1764182605862; Wed, 26 Nov 2025
 10:43:25 -0800 (PST)
MIME-Version: 1.0
References: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com> <20251126140713.1414484-5-miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <20251126140713.1414484-5-miaoqing.pan@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 20:43:14 +0200
X-Gm-Features: AWmQ_bnwtvsmS22jGvm2kXI6e4Vf6pZR3CqdGx7qXkAuSV3iCW8x1wgNtXpawiY
Message-ID: <CAO9ioeVU7jKd9mKy_XCGGyfp-uwuqJWgM4OyDxfB02ApGw2k5w@mail.gmail.com>
Subject: Re: [PATCH 4/4] wpa-supplicant: enable OWE support
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 8i42WC74ICllciDiPJe70RhYysZcjdN3
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=69274a4f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=4qhpSsLw4rMaHShbg-MA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 8i42WC74ICllciDiPJe70RhYysZcjdN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MiBTYWx0ZWRfX9b3wZofSTjyJ
 bLAcfK9ziJr0sdilK4t3VxLuEv7+NRphovzeOhR+VFaD9YZtxIdgl7uI6W6TSiWpHr/SSEtcGpR
 voCXwqopI4VjNXzcfd0xJknMFhdkz/Pv5pvPcvZjA6F4ISSycKJIMpQFpDArBiWJf0bwwN/kGF2
 Xcsxo2U/X2Y0CP3jTwlIacE4WLzQiZrGLMde7xNRuKyQuaEzwd/YY4eD2FnYfG9T/1dtYdwz/EA
 Sc1x+rvA+uB7RqrPOurPKaNOezEx9bNUM4UJ7Pd0Jfhi8rLE9+uHQ6Nx1pf5tLuJ13Vqzx+kkeU
 6b7jnWgG6+JOdP0ao5kYkR4dftaUPwURwJ8UvUYwmvADfOOrniunAOcWm4nhDebjamkPhXTYm4F
 Pc+fhsKMZERarzxa3T2BWPnMm7pYfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:43:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226812

On Wed, 26 Nov 2025 at 16:07, Miaoqing Pan
<miaoqing.pan@oss.qualcomm.com> wrote:
>
> OWE is now standardized under IEEE 802.11-2024 (RFC 8110, RFC 9672).
> Enable CONFIG_OWE=y in defconfig for easier testing and examples.
>
> Disable OWE when PACKAGECONFIG selects gnutls to prevent build
> failures.
>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  .../wpa-supplicant/wpa-supplicant/defconfig                     | 2 +-
>  meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> index e313894ecd..8a68d56ffd 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> @@ -639,7 +639,7 @@ CONFIG_BGSCAN_SIMPLE=y
>
>  # Opportunistic Wireless Encryption (OWE)
>  # Experimental implementation of draft-harkins-owe-07.txt

Again, this mentions an outdated draft. Does it (supposedly) conform
to the final standard?

> -#CONFIG_OWE=y
> +CONFIG_OWE=y
>
>  # Device Provisioning Protocol (DPP) (also known as Wi-Fi Easy Connect)
>  CONFIG_DPP=y
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> index 4a8ee1423f..971e55150d 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
> @@ -48,6 +48,7 @@ do_configure () {
>                 echo 'CONFIG_TLS=gnutls' >>wpa_supplicant/.config
>                 sed -i -e 's/\(^CONFIG_DPP=\)/#\1/' \
>                     -e 's/\(^CONFIG_EAP_PWD=\)/#\1/' \
> +                   -e 's/\(^CONFIG_OWE=\)/#\1/' \
>                     -e 's/\(^CONFIG_SAE=\)/#\1/' wpa_supplicant/.config
>         fi
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

