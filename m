Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1A3C88E4A
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 10:52:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36686.1789123947487207128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 03:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NVMBa5/h;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=VnwWl9rS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAqCAW074223
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 10:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3kGiC0pyaU9T9iWMG/891gbg
	OJkUuYxnkcmW2v+QBJI=; b=NVMBa5/h59ynlcGzwq6/cZrdtocGdnBDBb2jfM4x
	GJfQfvvb0hBSJYJ37CV1ffRoekAYlPHB0+ibhR4El7TkRo62sVyAftAzUbw8pwZ9
	eAro3PoRyx3ZHrYnkkNRhVhTX+Q38uoYMSV2rZ6UP+WAZc2Z9lCLjHpgBpvyd1Th
	O2UX2eqvQKbG8OyIZJ7Gz27aJP0HUZ7xEOKTE8ucWM4H8CiDt9rPQZcPTBfJJmAn
	c+Fro22NI8hYn3EeFcaRpvUChBcFqfVNk4tgjJ/EvFAgEJpvfPgWH7GlByEsO6RR
	3rlhRBjlTlUgbBIOHzgXVHZFKsaboeHmT0EIKdZahQs0MQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q42g7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 10:52:26 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cb18cfa04so651063241.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 03:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789123945; x=1789728745; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3kGiC0pyaU9T9iWMG/891gbgOJkUuYxnkcmW2v+QBJI=;
        b=VnwWl9rSTiPV+BynoE0xGALb496LpF9dQWSGo8kaFqJDDKkDciV+2P4oh9bsg6ORHe
         mlfsfkhIQQc1hXZatxSAWy9SwV/KrcLK6Mc+9zstXUShtOoqo3TQne+AD+abloHG8tOi
         hsPu+F3a132C32LkPWEsRvEIDVBBuWKbygbMxMME9oMK4BmebetliUlGMKgeZJWilZ45
         eUjw7vsPPUxidiiAIyvK5EDzXf4g9Zz0iT72x9XcLK/t2TJ21d4N4oUR/Xu1Uoor1Llw
         zPnE7EN1yV7ANXsFcE/Z5G2ecH+XQEHWjn/GwwJWRwxFs8E5U08ghcE75gamEMEovasQ
         nr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789123945; x=1789728745;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kGiC0pyaU9T9iWMG/891gbgOJkUuYxnkcmW2v+QBJI=;
        b=ankB5YVlH2iMrDCzCN08md1F92Q4GnW9jRKisVlSznl+wTC4ggYGUcXcxnQFm+hVP6
         9lyKXq1MvVRu68opI6rZOSuPXsGEHC3iUvvgyZccmRxQ/g8aw4lNd9yENxSDfwzKWhQw
         v/JmL2+p0pDSIeBZR+XCFbBrGhnTylthxco1W86cs2esQvmRq0OeVcnyXj+phlX5upKb
         6xmQaZEyzUwymuD9XFhlHD3HK6zpeYIp2FFu4MecDD5+MBhjSn++zALx/wOGvRviy7/F
         Vj33BoQaij3GXoltDv6HMccBOEFvaqzPLKUS8MJxR2XdaU/NmXLPZp6nfOmZa6e8fCfH
         gtJQ==
X-Gm-Message-State: AFuF++nF3aaAj3F4/nm3aQP2Q75ALefc/12YzAHOdqei/Lb/8eFgkPBq
	/Qu/faYO4eKeTFrc6R2keYNE7fdeVNfrsOjPQuS13kcH3gSQfyfqQ2ZTzuhhG80neX5Oeen4dll
	Llp0xYPQ0Qf/C1YvixMN+1EKv9a4j6LGsumhOinRbn51Zwb8q7sFAyAOoZioRLVfmvG6mfymh6v
	iQtBdIBUo7O52fBuo=
X-Gm-Gg: AYBFou0wIBmLsXUit2Iy5zMJj+cuHiP0sALYej8ymQrAg6R5HH0CyNxbj5wrfmYO/i9
	lDlrVCPD5AHMDmQzRCqYuVA/qii2wcsvcQZ5/LEiWPldwD8OP75MIVZGuBBWInRyVDoE0UTy5wD
	/EqfYIr64oQQXGTQnEMidVUeCQ80/FveVcaBZxme0Eb9/wkCVpmNxeTbUmwK7h9NBCaUDb6A33W
	4W8N5YAMFeAFBV60KAmtE6Ci8eiS1cCFTsRQfIwzg1OhdIjLvxJmzPsChus+CLRNR/2qkbhEDM3
	3rMFXflKBK3xB0JZwlNatDEXS+Ql7KwHGVpl63pJROuQ+ie/m1LVeJbg+3lQTIYxZeVcLpp0SJp
	qD0yfugWFb78m68t1y3W/hw0pFHHKJwAiK+ye8v+1LCb+fA1eH5jG8QLqTAU/jfBW5ueI3ffMYe
	2PqBW8rMA/Kx9z
X-Received: by 2002:a05:6102:26cb:b0:77b:28c1:210e with SMTP id ada2fe7eead31-792a7721002mr2576352137.1.1789123945331;
        Fri, 11 Sep 2026 03:52:25 -0700 (PDT)
X-Received: by 2002:a05:6102:26cb:b0:77b:28c1:210e with SMTP id ada2fe7eead31-792a7721002mr2576342137.1.1789123944791;
        Fri, 11 Sep 2026 03:52:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3326aecsm5482871fa.19.2026.09.11.03.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:52:23 -0700 (PDT)
Date: Fri, 11 Sep 2026 13:52:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: upgrade 20260810 -> 20260910
Message-ID: <lfhx32jyuejefkhzgnxtniuf6pie2aakd6lqu6trqjti27sg74@yxhshrwncnim>
References: <20260911080335.1114208-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911080335.1114208-1-vpuar@qti.qualcomm.com>
X-Proofpoint-GUID: UIZvLZ0ooqOEZ1G58Y89WL3YreeEYIl2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE1MSBTYWx0ZWRfX6DzyIa9eV+6X
 5sc5P+PrOo/Rzy+e9LimhImCA+V5+svQ8MhxdZONycTeuqg+PuCW1XzO7cI3J8VW0qDYsBhbHZL
 FIb21CIAt3797krxZYD2i10x4y97w5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE1MSBTYWx0ZWRfX//GO0ix4X622
 ZQUA2QCXIGChCJkseYT+JMcz74qJkm7gI58pCPZVfi+GIUaDEL5IzcwM4gLI8OGoroMZLLmIC6R
 PKF0QhHbzZJlUEn2uod590P20JjjANX1t0jAqAsGlykYUNC4ZOqNeH1EBzyqqxyDvMnD4UBfb+z
 KY6Z6LVrTYUyO0z+o5tIbH3Dx11ZWzwvh+iMl1UOwvmuIyG8aaQgWgWnH1CV0ny/nm7hQKSDEDi
 T7h7EbR4Trj6AX7L8UFKcPaKe5/BN1WxgdtbwG11/fTef+Pfwj7jQuNdjabQpDLg+o7ML43cq5M
 KDG39hUjJrr9jSGDnsXgy+NfdUZYazx/bk3kqlx1wMA9c0JAo9P1weL81NFWYVGLGJwYmrTmy4+
 NKnpldHiczDIlEmY7YvP3IfYEJa4um5FdhHxwVRU+hMXB7zMSnAFzCCGBMX2ISrySmW35OCs0Tv
 09B5F+IS6OByMJuIIHw==
X-Proofpoint-ORIG-GUID: UIZvLZ0ooqOEZ1G58Y89WL3YreeEYIl2
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3dd6a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=fF9ntPbkvbKQzzdMwX0A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110151
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 10:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245632

On Fri, Sep 11, 2026 at 01:33:35PM +0530, Vivek Puar wrote:
> Upgrade the firmware package to latest release. Add firmware
> for tas2573 stereo, add Bluetooth firmware for WCN7850 and WCN7750,
> add CS42L45 SDCA codec firmware for Samsung laptops. Add audio,
> compute and qupv3 firmware for Qualcomm Nord Platform, add compute
> firmware for Qualcomm Eliza Platform. Add ADSP firmware for Radxa
> Dragon Q8B and add GPU firmware for SHIFT6mq. Add 'primer' files to
> cirrus CS42L45 as they are common to all SKUs.
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20260810.bb => linux-firmware_20260910.bb} | 38 +++++++++++++++++--
>  1 file changed, 34 insertions(+), 4 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260810.bb => linux-firmware_20260910.bb} (98%)
> 
> @@ -1078,10 +1082,17 @@ FILES:${PN}-qca-wcn685x = " \
>    ${firmwaredir}/qca/wcnhpnv21.b* \
>    ${firmwaredir}/qca/wcnhpnv21g.b* \
>  "
> +FILES:${PN}-qca-wcn7750 = " \
> +  ${firmwaredir}/qca/ornbcscal10.bin* \
> +  ${firmwaredir}/qca/ornbtfw10.tlv* \
> +  ${firmwaredir}/qca/ornnv10.bin* \

Typically we don't split firmware for different ROM versions. Could you
please add it next to other ornbtfw and ornnv firmware.

> +"
> @@ -2599,7 +2623,8 @@ FILES:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${firmwaredir}/qcom/sc8280xp/LEN
>  FILES:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${firmwaredir}/qcom/sc8280xp/LENOVO/21BX/*cdsp*.*"
>  FILES:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${firmwaredir}/qcom/sc8280xp/LENOVO/21BX/*slpi*.*"
>  FILES:${PN}-qcom-sc8280xp-lenovo-x13s-vpu = "${firmwaredir}/qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn*"
> -FILES:${PN}-qcom-sdm845-adreno = "${firmwaredir}/qcom/sdm845/a630*.*"
> +FILES:${PN}-qcom-sc8280xp-radxa-dragon-q8b-audio = "${firmwaredir}/qcom/sc8280xp/radxa/dragon-q8b/qcadsp8280.mbn*"
> +FILES:${PN}-qcom-sdm845-adreno = "${firmwaredir}/qcom/sdm845/a630*.* ${firmwaredir}/qcom/sdm845/SHIFT/axolotl/a630_zap.mbn*"

It's firmware for SHIFT6mq.

>  FILES:${PN}-qcom-sdm845-audio = "${firmwaredir}/qcom/sdm845/adsp*.*"
>  FILES:${PN}-qcom-sdm845-compute = "${firmwaredir}/qcom/sdm845/cdsp*.*"
>  FILES:${PN}-qcom-sdm845-modem = "${firmwaredir}/qcom/sdm845/mba.mbn* ${firmwaredir}/qcom/sdm845/modem*.* ${firmwaredir}/qcom/sdm845/wlanmdsp.mbn* ${firmwaredir}/qcom/sdm845/notice.txt_wlanmdsp* \

-- 
With best wishes
Dmitry

