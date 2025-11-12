Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34127CD3440
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:02:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5499.1762974166799810179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=euA0tKUY;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=IVBt0d/S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACIEFG31109256
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 19:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XPeG+EWjujmpKz+JC3C6l6YA
	thyeFMPX0FtXtAUmd5w=; b=euA0tKUYUk5GEt+VjnlCId6Nmv/yTBFErq1iqtYn
	ok8pyKpZjOfgGlQ6WRfMlkm6TI9H3xNSgArB4o5AQ8RgaoOQ5TyK6/I90H2Zhrbs
	hjtreeNLM1V++gYrobZ/E07weywSDtOHW2yhKVpIMz/efK+rFhs8fuqk1j++THJH
	3pF8vagEbvQmOhjwdCUhp1huLj7aNxEKaBmhuBsRksi5l8DAR8tOUy9SnY5JsfGT
	kJ1hWB35YWX3hn5wFUoQ3YbpVS2IjJXdTMccyryft113F/ANs0T41JVr/JupwaIB
	TqOtr1XbirZQKgHQL2mvYUk558RUOQr1lc12FvMBaDLZaQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum1q35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 19:02:44 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55959f13235so11045e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 11:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762974164; x=1763578964; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XPeG+EWjujmpKz+JC3C6l6YAthyeFMPX0FtXtAUmd5w=;
        b=IVBt0d/SFZrgmlyIl7iSQOj2AAWNhP/6b+ZDlBD5F5fSRguIO5UFX2MYUxKxJnB5Dy
         rGv5SV6VtBasrLhvwd7x0kEF7Rr1pk6yw7XKC2JqN7Ueyy5FoeCIHsO4AGDIHAyTZXWA
         BiupgggVhAvQZGTWsQyWdcielDNL10X3cwp2xBiWusfSYqISxSzIFQFZa+cCO381EPWj
         6TW2JyE5GkOC6h1zKf/Icr/Tk8MLQNhBwPPnd0fDUHpxS9l4E6NRJZJOPyyooCuCMGnc
         WGw+XaeXHRaZXCHEoXjYXh9S4h+Z2LOFcXN+GRgLI7tpF53lenIOqEJmjcTEX7fJrZA+
         WIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762974164; x=1763578964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPeG+EWjujmpKz+JC3C6l6YAthyeFMPX0FtXtAUmd5w=;
        b=JyEPDXVdTLXBLWlcdjp757svw0CPla/nMbB3gw6bZY08+381RBta+9ZPhBH7UWHsGW
         jmubVmVxoBzb7JpfW0LFOTKyS09mWFUliD5jgxxM/Xc0k9E8jbqT8sbBRFYc+S2uyH1y
         9rQ3X4GU1GUS4tUZREwUGCBaUbD1X4PHMGhTHaRgx9t9yFcMM+Q7NkKbSZZodJu+rcB3
         Ux48UOF7p3aK3AJ+gcXEp6srl7MVFBGLR6f7AP8bjP4qTwGONYszMK1XRpMohCDlwRh2
         4wptps4JahJf+dNVfZJJNRoz6s9gaXpgoQubqXbIxkcMEvXjvv+yurAF7Ls+Xt/OIwRc
         pU9Q==
X-Gm-Message-State: AOJu0YxM9DUtcbqTrIQ5WS+24yZZOrNfwwCVeR8saJevMnPHGqpiAuSp
	bnXfJwwFfOiaur4ETTG2Bjdp08N4nkHL47EBe7SpbfpdGzIVIP8HhcTGfyLNjF6kWXL+3djqd9v
	tyX2gMn6gErtcRWXUen4IIavNzAGI2EbRkBdi9E1v27TQiJ22MjXaptqrCqBQ1rR8xTlW+5awk2
	5PlKF61U4=
X-Gm-Gg: ASbGncsyyXStutsX8E5jB+2xtHkiPSpeGJysr1FWTICIt6l9gYNqESBPXmyCFX3O8nr
	VV0drqxBQE4a4c3rDATC5hFbSjsxIX+gXRnklONj9USciaPjJH+6oZS5AZPV2FqdLoD+BOsbeMD
	tKlSlBZNJb0Hx2H24IY0o2rZSulzblBqdZiG/Uf4Az9JbgCrqqgr2D1i5M5/MXQjbHUObA1URHQ
	ISXP+sTi5QePMv512sZzMKAr1oCjow4TV5w+6ahofKeeWgVotoBQBYwITsj1+AoAiNS89s1gFKx
	FmEtzHhzdW78Jes6UJKcvgzrTnWskGeP8HlNv7gx+/8bknoM5jWGtOe4cmFaUsCpt45Sm3a1i0V
	DOdjMm2x4kza61CBTR2oQjsR0aPoFvbZlO6kM8nL8YlNmf+TReq8TmoPMB1IQSvCXW7glMgCqfD
	OnXUG/m8Pql+5p
X-Received: by 2002:a05:6122:168c:b0:54c:da0:f709 with SMTP id 71dfb90a1353d-559e7d7bd3fmr1675571e0c.13.1762974163769;
        Wed, 12 Nov 2025 11:02:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGucSc/01wnoLVIFj1fxKUGO5iSif4pAopwpQ/xJbp0fRwrBw2MFrbEVbu06jbR+rUlzItE0Q==
X-Received: by 2002:a05:6122:168c:b0:54c:da0:f709 with SMTP id 71dfb90a1353d-559e7d7bd3fmr1675503e0c.13.1762974163098;
        Wed, 12 Nov 2025 11:02:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f078f13sm54933251fa.21.2025.11.12.11.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:02:42 -0800 (PST)
Date: Wed, 12 Nov 2025 21:02:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: upgrade 20251021 -> 20251111
Message-ID: <lfwunannpvskcey2xjhsgo3v7ztvvlgrmxijrsk7dpafu5qr6v@4v4rtp5ochpv>
References: <20251112181218.3301302-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112181218.3301302-1-vpuar@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE1NCBTYWx0ZWRfX10UCJdW7/0HZ
 yYEFX5Qkv5IllxtDMQ0NAxxLaCHQhfIpovVrNRkmLVUNOIB7ubMlRFBcYqyfbkmK1Q1/aoMfdLc
 7964Xf+SJhTApsSaAkSsgMpmDx4Ct6IXJKFJZsjnS/u5lFszD8NyJGI4BK6aVseBQhOWxFd2kpf
 rczYM2VN4EIuY62Or7q68HoBNOljHtzkWwG51n9fT4B27EGIIyk579C3P+dW4Rtjh+qD5kQ5WVs
 eed1tc25mVhhdCFVD7OI9/mZvu1z25ZShpPH6kMGLbNLaMpEhIdfYJ9CL2+DJtK7IpUfAvKweM8
 vyGxPt217Iukpo0MERkcWhO5aDU1nrvbjiIxpce6zMmAysZAul/9AyAtoluP97BrqnIDf6DFLs6
 njR8gR5tUQzQc1lshVialS/GIdVmUA==
X-Proofpoint-GUID: 3AHHNGMhMPYkm1n8EO8jPwKhFLTmnJZK
X-Proofpoint-ORIG-GUID: 3AHHNGMhMPYkm1n8EO8jPwKhFLTmnJZK
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=6914d9d5 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=z-QSNh-ow5uosPlSD2sA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Nov 2025 19:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226217

On Wed, Nov 12, 2025 at 11:42:18PM +0530, Vivek Puar wrote:
> Upgrade the firmware package to latest release. Add new
> Qualcomm firmware packages, rename HP package, and update
> FILES path for packages ${PN}-ti-{tas2563, tas2781}.
> 
> License-Update: new and updated firmware
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20251021.bb => linux-firmware_20251111.bb} | 28 +++++++++++--------
>  1 file changed, 17 insertions(+), 11 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20251021.bb => linux-firmware_20251111.bb} (99%)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

