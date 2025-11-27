Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89F5CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 21:16:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3699.1764278177584269936
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 13:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=a/ASFKaz;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Q1mLF+J2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARH2kNC1592195
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 21:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UMVld/rbTmLDC/QXguN/jDQx
	iiUCSHibqb7+onRv7HE=; b=a/ASFKazsRcerL24Q/Dv1e74zBn+C+Tgiv7ZLoqa
	0BVj+oOBeyhTwMYOWzSq6WuJ2CLv4SLy7lYKvupSgdSuzquJNcp4FpeSHk4Q1to4
	W9YSor3aX7mK8rHPHi7GgCSwsoOBNJArEwLSyrCeiKw5m1/fqHcRYY0nvmxZTOrX
	qlnp2ZK49FlFh8EoJtQxNF+R266z5mLxqEXVEWlaH+JtM1ET2J8y+FFjv9Kp812L
	nDhXq4hZmiK95wGEB3eZEWmsU7FtZEebnQ7NBlItnehCVgbi+az5qB7U6dfU177Y
	Ub3pmj4XF9FldK+eR5Z7Vm9IEon6HfaRyQ/rpmIE9uvODQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aptpu8du9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 21:16:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed7591799eso24021301cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 13:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764278176; x=1764882976; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UMVld/rbTmLDC/QXguN/jDQxiiUCSHibqb7+onRv7HE=;
        b=Q1mLF+J2xHluPVFw23RPTBZGlcYyQRb6ct/lD4Te+pJ2OuO0QSxZnO8nw5nRAOso7i
         RkaqCEZg/8QJsuPlNY78sA+wANAIBr6LO8w5boLX885E4xa2nYuZiJgiOfEWD8ehup1I
         pmScvSMhNOKanbXLXwZiJYjooBTXyTgy1tGTdBR9iowqwKBZ4xLmCeSz3p7fdQjKQWb2
         byvMw3gATrg0Llt7zdMYuPItbvXds3h8NrXbC1QOa8a/LKTgCABBiCqX+3ILzgjrq0rT
         4IU3NyNcjbuI3e4JBqjWtcbWGtTAikj+TP9ElUP+/JhjATzIBnF5DG8PEk4eGj3wySI+
         3rHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764278176; x=1764882976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMVld/rbTmLDC/QXguN/jDQxiiUCSHibqb7+onRv7HE=;
        b=lTyVSABZgXzoFo6B4g7yhN2gYp1gunK6tf+YzwrXnr+NgdT/MLB4p2aX3dptdct2TX
         xKoxSoYQLzo2s+YZbRFz/CJZ7y8g6Ar1ReLdd/08YQidFHAE8gwTikNqOgruZyWs/IK2
         07KqNHCQVXHTI3vII0Z0KhVIirFpu9CjUb5+EAKwt20Ndidpz2N4Ww8KihSHqQ306Owb
         T+7O4R1/cnLTiBHglERnuGJ2y1LB9bF/10g9D7HlkkC6xluhRNIW6vYMQqbkNhhrs14S
         n7sWdH9uY7LeCpspV3+hP6ONZsiOv9HnhrL/wP8Jzn39mOWolqOBrcaOH8xTHCdpN+kf
         f//w==
X-Gm-Message-State: AOJu0Yz/HAqV6fUHkyWey5HPNVYpRNX/iL2C7tMHpxBzpjq+I3fmZl6O
	LmtC2uZt+k1ceqLAUceo3jBz2p2j1k9Pard/eHN+peyouUk9+xKRp44YtwmfLLahp1FxJRwhysV
	qqpcF6cnV5ZnkUmk94edwELgp7AcMgIUGX278OcCjMhuXR77R/q1UN3YtgX8SykPVbM2QL+TNg/
	SQmV63Vfc=
X-Gm-Gg: ASbGncv/M0GBImRNRlLBn/Hybjge53ryKuOMsGKlCvNUG+bNkaR3woTDwX9gGxOhSgX
	b6AsDI3fpKBpLKmhs1OLQbLLqGhZpZH0YrzQpOtLcN908ZlgfUZDjfzcIk9x7ZwBtqYPK4JkGcv
	wH6iN0w+mogPZW3yK9si0ayQyWLzVKrsScqGDKGIKs6DmH+sIxCV9OFFpeNaCik7jZCi0o0Dnr2
	Y4usl9H0kLnQDzbLQJy+wkRLh8rgdfRHdVxHA5hH5NkNw5+qLXOFcCHVZtKJYM8PHYSsCfS8Bx7
	p9RaflU0Bdv7++OdXHc3PPJqTtD85CgMvIVUT+7BV7fcTj5WqkI4eerEalEIYzISEEGjtS/Wu4u
	3uLBGqw1hyeW+s6LEUMsz7pmum4E1GOG59SmXdHrNLAHAaQ+7iztEwCYroYkqtK5UHJwAYEp6je
	B6sTxr++QH1bH0iI1H4pEAmW8=
X-Received: by 2002:a05:622a:181b:b0:4ee:87a:56ad with SMTP id d75a77b69052e-4ee588e0a5dmr289236121cf.42.1764278175934;
        Thu, 27 Nov 2025 13:16:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/bTh5tkjCiAT/SYpdPknB09Z7xmr2qJOWCHNGkaQmDVhq/pcmSwbNqQBuDtZRGoKTgxMZ2w==
X-Received: by 2002:a05:622a:181b:b0:4ee:87a:56ad with SMTP id d75a77b69052e-4ee588e0a5dmr289235791cf.42.1764278175460;
        Thu, 27 Nov 2025 13:16:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48c9bsm655126e87.81.2025.11.27.13.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 13:16:14 -0800 (PST)
Date: Thu, 27 Nov 2025 23:16:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-firmware: upgrade 20251111 -> 20251125
Message-ID: <beeb5cjh7ourwd2nyk5czw4ayqbwndq3iujadzbcxy7ivt4vp7@apjj43zz5uzq>
References: <20251127135726.569337-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127135726.569337-1-vpuar@qti.qualcomm.com>
X-Proofpoint-GUID: O6ySsmzcj_b3NxwlAHTN44ULMi9_nOW5
X-Proofpoint-ORIG-GUID: O6ySsmzcj_b3NxwlAHTN44ULMi9_nOW5
X-Authority-Analysis: v=2.4 cv=WIZyn3sR c=1 sm=1 tr=0 ts=6928bfa1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Yx434MhmgRUfKvVGLBQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDE2MCBTYWx0ZWRfX+pi5cjMsHma0
 BZlC1BLYpJ1Wb1JnrWsG3TVRCrp3B8S+eFEYiGSupaO0jYyo5xaE63aLBOb1G/bKPE0vTgexCya
 3rZ/QC3NtClvC9phHiI68949A+PEXBlqwftQOniepuorRLgCo6QVJevD0LiSl30e6Bvuk0mhxmT
 BRISn22Gt+P6ravT+2jTUqDw8mlD/uEZklKZTAQZHinvsKZJmF9olsFsMV1IZlZ2eed1fneLwEf
 lpGALLl39H9WlvpHKmx7t5QtC1QTgXFEFyQTcIc4A4yHXe0PNp7w78S+krvyJShlorUxRYFy20P
 8m/U/6NSCNp7GbSxrmxZMnwE0xGN2IrvbQzcTAid5COPblGTpD2BDFwclWQ17V6uqFPVGCA1pO+
 AUymUSGbnr0AZKN5RqlpEOw9ZnPgZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 21:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226868

On Thu, Nov 27, 2025 at 07:27:26PM +0530, Vivek Puar wrote:
> Upgrade the firmware package to latest release. Add CS42L45 SDCA
> codec firmware for dell laptops, and several Qualcomm packages.
> Update license for Qualcomm kaanapali packages, update order of
> ${PN}-qcom-sm8350-adreno alphabetically.
> 
> License-Update: new and updated firmware
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20251111.bb => linux-firmware_20251125.bb} | 77 +++++++++++++++----
>  1 file changed, 62 insertions(+), 15 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20251111.bb => linux-firmware_20251125.bb} (97%)
> 
> @@ -1018,6 +1022,33 @@ FILES:${PN}-qca-wcn6750 = " \
>    ${nonarch_base_libdir}/firmware/qca/msnv11.b0a* \
>    ${nonarch_base_libdir}/firmware/qca/msnv11.b09* \
>  "
> +FILES:${PN}-qca-wcn685x = " \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpbtfw21.tlv* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.b10c* \

Instead of all the following lines, just:

 ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.b* \

> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.b111* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.b8c* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.b9f* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.ba0* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.ba1* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.ba2* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.ba3* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.ba4* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.baa* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.bb8* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21.bin* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.b10c* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.b111* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.b8c* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.b9f* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.ba0* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.ba1* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.ba2* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.ba3* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.ba4* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.baa* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.bb8* \
> +  ${nonarch_base_libdir}/firmware/qca/wcnhpnv21g.bin* \
> +"
>  FILES:${PN}-qca-qca2066 = " \
>    ${nonarch_base_libdir}/firmware/qca/hpbtfw21.tlv* \
>    ${nonarch_base_libdir}/firmware/qca/hpnv21.bin* \

-- 
With best wishes
Dmitry

