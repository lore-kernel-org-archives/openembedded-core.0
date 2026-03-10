Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427EDEB1070
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 15:22:40 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42655.1773156151789842571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 08:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=lyBqDoQg;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NEaW7Ok7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACnZKP3892945
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 15:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s3traPDYKCq5D3DGeaoLUUcf
	0qh4R07IXvhHrja80T8=; b=lyBqDoQg2S1h5m2gTcONWWNbAVoWOKFs100NOjdO
	U1IQwchQoRWLB1O2D3dREZGjqWk2/jjeS6IQsPahSNRJWsxUc/VAlzDGH3s1WHtn
	+KYnyJz3MCMWyk2WFWZsemR2OCrSGL3NEZrfw5HTmw2fnCuJisCnOfmbCr3QxZw6
	rEl1ZK4EzOQjFo9yNfeQr+IExA5Jj7KpkP08jxGG2jAwHZMSpgCIv0H3KQwCNPlW
	z4XkFqkvAzIVxEBxNWMpNQf/YLHkGe4LNNskEIF+6neQS60UbrshRHSkoEOUjN3X
	0UUdQ+pxRrq7Xmv9ew38FRQXo1CP8aKbUBGCTpQcDHR6bA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmyrks5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 15:22:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ea1a86410so2281465241.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 08:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773156150; x=1773760950; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s3traPDYKCq5D3DGeaoLUUcf0qh4R07IXvhHrja80T8=;
        b=NEaW7Ok7E355QBtIVjW2cFLdtsduQs7aEnnnoWQD9GEF6Z2wa9RJs6Y1CHqFewhTUu
         Yl/t3RdTK0lYhsCHO7F6NVPgDMcLh+sHlggASSI+uSRd9vWova1kh06ujI7WBfAqzP1Z
         ytsyK+OCJNnXb3WKj11oYe/V0wnXGgveIyMTeniXMOEh8UH4z6e3WkRlOptIzWfFkMFd
         svYzOAXRZNY1Mqspd9oxNmYs3z3JN9ZcbLnYSBuUV/gQZtF4Vnzd0CjgAfH+sa1tIboH
         CI3u766ZEjk1mDnWvV1S/6GDkNsZr60xgDd0TTo7WiG9RSNjwY9MDjcdHjOm7p3INNEL
         y+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156150; x=1773760950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3traPDYKCq5D3DGeaoLUUcf0qh4R07IXvhHrja80T8=;
        b=PYFR13nGMKE2cMdUd5TbfDs/2qfevZ2c1utaEKHUNxqL6aN6/BgSRoBv1gx2KZMUKG
         qxPONzfm/oyrTS8BROnYoAb+bdLJoYQjMQVV+2OHQkl2ligVbImBwXyqed9XQWdKEAgx
         o6ggj8CpUVpIXR6WXEFIoTp1UwrC/9PgQk/nAFd3LNz/Ph8UOevryvuNFqIX3oB7A5jx
         1QWfibchxkA6t5HqW+Bv7NF+Nkllwkn1hrFvEqJYO1fqo94t216Ua2kDunOLFFVByIg9
         5720IWdHxhLrQgNOWf+V0nMt6oPRQ3MdbESHHfs8JlJ8WoBESaKCVKtU+lFl5gNI0sxR
         ktjQ==
X-Gm-Message-State: AOJu0YzfuXjSaeUGXYQ3M1YIKMVI7Aq3SHyFgxfDWkUaunGjPR2XyXHy
	z23buv1k154RFYcRTLY+B77NZqxgtlXpARG36uyCvi/ceXUymwx6Jiz37HUV5AC7XxOjdPSp/Ow
	YMX8V2gFeh5F6GAXw8UN+Qx06IEAjmltLat6lkxdWu6mtfFs3Dj6w//Uj7VMeXmC8VGDyoKTEKD
	8MToDjobo=
X-Gm-Gg: ATEYQzzFWtJMxG5BM1n7GF39ZonHxqUd4fJkXv9YHtT4rsA6lQZg3wxajL56g51SkUm
	puK2TrEkJQBYm/M3oNd6lRXdV/t4meWqSQlUna8ZglMy6cN0wyUoUqr0ABKo7xyVTd4c5njAEPq
	eTv8WMgJwQtbalPzsYgub/k+5+N+5fznM2KBKPOIs3RYUymV/y11hpZz5ZxNCZA73/ktOLOz2wj
	iR1Kcr6p2HwC9hEcTGX+8UJ6B26dztlGHjPH+8W1TSbjzYkFCD6l7sfZS7jkayqhhCbWPMT+TZc
	FNUWeYz1FVg38OWoBLm+3htJrcwZ9hhrwT3ShUdzPTfOJ7Jy3BBEESiVwTpCMeyg5/G93opoqjr
	PZefUR4NsRH/jhXM2CtCTQ0sj1JVAmr/7DJSxmaOifiry37Syvf7VvU8WVhiTrQ8OxpMpy9xwAh
	yqDIdyZVIzItFsJ4hR3r8mNhN1HG11YVIBIYc=
X-Received: by 2002:a05:6102:3f0b:b0:5ef:a644:ca4 with SMTP id ada2fe7eead31-5ffe6134835mr5242465137.23.1773156150053;
        Tue, 10 Mar 2026 08:22:30 -0700 (PDT)
X-Received: by 2002:a05:6102:3f0b:b0:5ef:a644:ca4 with SMTP id ada2fe7eead31-5ffe6134835mr5242453137.23.1773156149590;
        Tue, 10 Mar 2026 08:22:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a5cfc545bsm5514251fa.13.2026.03.10.08.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:22:28 -0700 (PDT)
Date: Tue, 10 Mar 2026 17:22:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] linux-firmware: upgrade 20260221 -> 20260309
Message-ID: <xpxxfzue4a3pthtxgcdqrg3th56hs5cp3tgrcqd6mumnzk56s5@vsbwdl7g2ytg>
References: <20260310142206.3713140-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310142206.3713140-1-vpuar@qti.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b03737 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=xax980A8BmGidevOf80A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: gc92rF89WHy_-wlZOolBhmuQarf0EMIa
X-Proofpoint-ORIG-GUID: gc92rF89WHy_-wlZOolBhmuQarf0EMIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNCBTYWx0ZWRfX9b7NtBKsYkHg
 0zkbr1VAXiur897v1W2/9GuilHaHtkKddyA797v/RUTA8WkirBDjvucWHBVObnkVL6OzwdZFlhz
 fDE2M61uBNC4ps9+3FaPPbg8AyODLxP8zHT82a9EwvWRWGSM18gnTneELR+or4qkykJKsHWFiel
 Zq3nCGvudDyy6Q3dAEZwv+oWrol3eX77FPB3U9V3GfgW+3XfF0cKK5juDbx/XABr2IAH4C80Ds4
 hn6+IYYwtwf4XBiuwJSPGTAPjx4O/xshe1iPt0MOYdc7GhDn2RZPwgdcBHzShnyTWq7x1tNLf8L
 pgljaFj+ywskYOA5J7ZJ+XpmWSCiPG3RBZp/zMGG02Oz11789zFysSK49vfv260UBmtTBKPRSVh
 gkwhn6NpmRIfqbD+awgyTmzSwut1NLZ5+yn8zdb+q4oKbDqF/sEnSGn0cLlNYzOjTaCpHSLO4pY
 136LeBZqf5vpEk2SI8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 15:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232796

On Tue, Mar 10, 2026 at 07:52:06PM +0530, Vivek Puar wrote:
> Upgrade the firmware package to latest release. Add package
> ${PN}-lt8713sx for Lontium LT8713SX DP hub, add audioreach
> firmware and license for Kaanapali, Lenovo ISH LNLM firmware
> was renamed so add those files in ${PN}-ish-lnlm-53c4ffad
> package, and modify FILES:${PN} for package ${PN}-ish-lnlm-12128606
> to pack firmwares properly.
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  ...20260221.bb => linux-firmware_20260309.bb} | 22 ++++++++++++-------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>  rename meta/recipes-kernel/linux-firmware/{linux-firmware_20260221.bb => linux-firmware_20260309.bb} (99%)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

