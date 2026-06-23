Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6170FCD98F2
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 17:49:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27506.1782236968308956870
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 10:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=A57SPVNW;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=LdZ+ao7B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBY7TQ1156291
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 17:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AuJ7G3rDhLElZge6YVv/QuCs
	FcNgaiaKc27YXcQBGfk=; b=A57SPVNWJcOLxutc1re0zpo7vwKT5+IIhXMvWBtI
	MpY1dW2olXJeoih9bUHWYl+ohlks/nCtltjMNctYlosJ2h7YpHmpEwKx9HdRF94d
	s2kOhDTWkuk7WSd9RM6mtlQa2I6EJrglYIlNgLwpmIM4aYG3rJ5MFSAYB04bzdj2
	8L4QIwCnsgJQehPOm4ieHz4ZBpbP55vZuE3eE6T4bxbIEi3lgCmVkYIgUxTJH70x
	VwPBO/Z/vjukpCsl3LdGWywp2ByKrKjc5UMxN/LsEm314s5rCpy86fpx/6ZAwIRS
	+jDChdB4aouhzxARygUmyHvF9RkrEVGtmvr7cK1ny6hUWg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28swum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 17:49:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-730a85d6b1dso166180137.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 10:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782236966; x=1782841766; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AuJ7G3rDhLElZge6YVv/QuCsFcNgaiaKc27YXcQBGfk=;
        b=LdZ+ao7BjcyUnrU6AhL0w1NFLRiFPGqmFSx9FWkqqoSVtP/4qYvl32kMLrmOe9mbgq
         aEOKVm6jJBla44RgV2jc3Mk4qvhVmwtMErIMHdSYBBUKKAxe9E0WdRfAIWPwuSBOnfxh
         SB4eRQXNBEZsDQAiW3hAKZVD9avMtK6AYdj5ouVJ0t4xcAjjMA3Yh2FgCkku0gKEWwPE
         8DiQLLKmwvyUAmbwYGTTqXlbO7kFgeAqoSsZ6MQS5tKwcaho63RP7xcdD61UdCIVnJP7
         AQa+kuZiulBxFDecQsanx0UjXISyABTGWKCICMWs4viXFMrGurSI2/8vOExSBLfdugEb
         4xZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782236966; x=1782841766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuJ7G3rDhLElZge6YVv/QuCsFcNgaiaKc27YXcQBGfk=;
        b=jsw6ul23bfmjz2+xqa+TquNIqJlY5bKhsIC7EUC02Ra+d2g6+S/ph7AvV1Txw8BJsJ
         9vfkMVZmoxrAHl2PpKQQMQ6/AeFZvVxuPZk+ekRK/RM7jPRHJsRZPQHUKf/QrNERqvol
         XWTLinS9dd6vjsBayY82Yb+PVTAlHlJiMs2SvlFrmcGyrUPY3ZLoOwaZPYvxL/4g5hel
         rBQ4ub2+caeoPorFJJlao+8XYXYrKzCDOOsmW3oGPnHPh3cAW38B+5lpOvohFmKHyyQu
         97ixZ8c3dG83yWElj1H0lMioMvvTRewiotKvOGrVwm/zuoLePUBcLDx+W1Qhvhxyhajm
         J8zQ==
X-Gm-Message-State: AOJu0YzSDOsfapWiCq/WbyV3DxFHW40KVBUhoiD2ZKOmapdHs2P+fI3T
	iLh5MTqABTHHqTwKN2BgPdVXvb2meN/5ifp545r4tsImMMY8kK+dfTz5rV1YQZBtHdB3DFueTI1
	UDZZoX+SyuXmnDzwWOdbj2tf0LUSY1g1WFx9uiW3ri+UUot7vYpcyb3guWJ4kn2r1Ffu2TLosCN
	rNRxjztXc=
X-Gm-Gg: AfdE7clYXY+9RnVCu8Uv526M8mCrR4abeYQ/hTqiMQL5T5CK6cXK1Zx7xUhMiwD0Sqh
	3/lwOxrCsIySN0B8ud74PaK/OuqJTR9U3UhT+VtzEhwoRvzfFtW068SAamIVsGCYnu97E6MThCK
	GVcf9hou9/+EoCtiqTVtzsVeglFZHdfycMvUit6ge89tux6PyOik7hRs1g6rN6Zy95kwK4ZT1B3
	DfktlJZHBsdR/7jlzEec1LF5xrSL7NsWoNQ1r4FhOI7Yiu7SBQ+fpPATzUZJFg+t3VQfAdtjKSD
	mkTvESDxoK+uc1WAiiqgxZtVFWpzF03pAtBVLcBYeJadIAF2xFtDl87x4FnJsGgSCNMWKhrkr0j
	ypBDp/5N6pZzCx3K85JAhkawhmPZdpm05HheNDrpfHU3XV1slUxDEWeV+/leXbmBBVBHxRgR0hC
	1rFkO+u6fBPcEFPb3JpBP2QBqz
X-Received: by 2002:a05:6102:c8c:b0:631:26f6:7022 with SMTP id ada2fe7eead31-72a1fbebcd1mr13301317137.23.1782236966400;
        Tue, 23 Jun 2026 10:49:26 -0700 (PDT)
X-Received: by 2002:a05:6102:c8c:b0:631:26f6:7022 with SMTP id ada2fe7eead31-72a1fbebcd1mr13301302137.23.1782236965944;
        Tue, 23 Jun 2026 10:49:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a6a2sm978640e87.46.2026.06.23.10.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:49:24 -0700 (PDT)
Date: Tue, 23 Jun 2026 20:49:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: upgrade 20260519 -> 20260622
Message-ID: <lf3gxnthrsftrp3mtqjywqnc5barhfz77uw4l2xshld7gcyzuc@7hzndercqhvl>
References: <20260623171339.1489308-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623171339.1489308-1-vpuar@qti.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDE0NyBTYWx0ZWRfX58h7ktyC7OHg
 P+e5sYjNZgcgfTbR3dQmBJIp/XUZXlej8F6Ny/XUIyW9Gt+zWGIrhM760/bJhOxM1S0fu4d4evq
 0wAIzdsdGl2rsjVXXKlfRNmRIXUGDW4=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3ac727 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=hIw5p7hmqmWybHubaKcA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: pjNfCoQV5-X7koW06rjuHiJrCYRxqdzz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDE0NyBTYWx0ZWRfX3ZGX5MHd4qqc
 jhIBHzUe4FzBLDU6/oZMidZeAIdmJs0Pyi5Fmr8wEiqQ+bBrvfi/ntKqOQpsiHR6ydEghKI6G0S
 r8TfqMm8ohymeCKTQ0x3OjjHY+mF0r9mm9RH2Ym8goS57pDVu/KkWDEGt/QMWYo03vdj3Z7YdHN
 HMGu0L5gEYsZw5g0f1e89SXjNPWSZgHU3VRRB5QznFGAv+xvnqY4/T8ojIYota65tCqDkNWVZ6s
 bgH8/nGDcPq6HtXXumXrwNTITawM4fJEOhyFB/UBg8uwblGt/WW+8R5/OWqg/MNDJD5nu3UPbRh
 B3XgBqFlU2ht6hKu9S7r32+y+wI+6L3Ls4P5X+TXUTUm3dCoWpV1M+zgZs/U66Fjln+HB3CdxLe
 6b/OcK0BdaHgZbzybhlDecjxXkguTZbr2irR6H+f0GCBWZf4RtsFGnfF4ViLjJUYsx35+0kW2um
 exQ/rC80CoaYsFp19bg==
X-Proofpoint-ORIG-GUID: pjNfCoQV5-X7koW06rjuHiJrCYRxqdzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 17:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239417

On Tue, Jun 23, 2026 at 10:43:39PM +0530, Vivek Puar wrote:
> Upgrade the firmware package to latest release. Add RCA firmware for
> tas257x, add firmware for NXP IW61x SDIO WiFi device, bluetooth firmware
> for NFA725B (QCA2066), add BCS calibration firmware for QCC2072. Add gpu,
> LPAICP and modem packages for QCOM shikra board.
> 
> Firmware licenses and few that are not at the top level (qca/NOTICE.txt,
> qcom/NOTICE.txt, wfx/LICENCE.wf200) are moved to a LICENSES directory as
> per the REUSE specification. Update LIC_FILES_CHKSUM, NO_GENERIC_LICENSE
> and do_install accordingly. Remove REMOVE_UNLICENSED entries for firmware
> files that were deleted upstream.
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20260519.bb => linux-firmware_20260622.bb} | 574 +++++++++---------
>  1 file changed, 286 insertions(+), 288 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260519.bb => linux-firmware_20260622.bb} (87%)
> 
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260519.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb
> similarity index 87%
> rename from meta/recipes-kernel/linux-firmware/linux-firmware_20260519.bb
> rename to meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb
> index 7eb9bf35fb..36f8441961 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260519.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260622.bb
> @@ -7,54 +7,18 @@ SECTION = "kernel"
>  
>  REMOVE_UNLICENSED = ""
>  
> -# For acenic - Alteon AceNIC Gigabit Ethernet card
> -REMOVE_UNLICENSED += "acenic/tg1.bin acenic/tg2.bin"

You can also delete REMOVE_UNLICENSED and all special handling for it.

> -
> @@ -750,7 +716,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-qcom-sdm845-adreno ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute \
>               ${PN}-qcom-sdm845-thundercomm-db845c-sensors \
>               ${PN}-qcom-sdx35-foxconn-firehose ${PN}-qcom-sdx61-foxconn-firehose \
> -             ${PN}-qcom-shikra-compute ${PN}-qcom-shikra-qupv3fw \
> +             ${PN}-qcom-shikra-adreno ${PN}-qcom-shikra-compute ${PN}-qcom-shikra-lpaicp \

s/lpaicp/audio/

> +             ${PN}-qcom-shikra-modem ${PN}-qcom-shikra-qupv3fw \
>               ${PN}-qcom-sm8150-adreno \
>               ${PN}-qcom-sm8250-adreno ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
>               ${PN}-qcom-sm8250-thundercomm-rb5-sensors \

-- 
With best wishes
Dmitry

