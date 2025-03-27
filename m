Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB6CC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 15:04:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.52089.1743087854390315454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 08:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KuUMb7u0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFbp012437
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 15:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t0rnzGh5r2Pr2encjnxS4nhm
	xUXqruwszqkujNUJg5k=; b=KuUMb7u0hGbSbQu9FPBGxWvtkaOrSN+spM8e/9BQ
	0viStZ7a4nb3i8Wm2VCWXepRPRwa1inKiSGzofDtoXvFY1NrN65fd+s9+RzMtdEu
	luQ/li9kOuP0zUihxpWU32J4/cTMJ2eh3eExtkdzl+x6XT3e3EuaYAizt5paBThz
	9hhDZQK27o1n50XI6Gk0oeBQY39qAIqMuvn9BRbVamOzl1TMa/SR0e8vRKyVD/C4
	nxrVIm8vrejAwlyXRYL5WBFcd1Sbm6IoRJspogPHGeIw6eFCccoXftoDd6y645/o
	XFzSz2ZYOOLRPEHbcodiq79YRZO3NsL3KxYm9Y/KgEF+xw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mmutkbcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 15:04:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c548e16909so124796585a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 08:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743087852; x=1743692652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0rnzGh5r2Pr2encjnxS4nhmxUXqruwszqkujNUJg5k=;
        b=v7/IbncVe70TBgtpnOijSc06RmkZJYXmSCSNuVSQ9uA5N2ruVxApJbZe+Kogz8lXhs
         HRfW8WCiQGWZAOmX3YrRfvwPTJDGieaX609i4rbQnbWKRWfwDkUBl7dlGNr+qQfm4kCp
         tRkFH4M1SgwXF8hglXK9fES9WygQK7h0N4DTCzWI/K+Dr0CisK9P5oUWkpbGT+BShHQy
         iRO0XUEOUYTROiYqCAoEYkZut5vFR5uB5cBxpwK6zTQAr9Ro9exRLnMCktQ2r+bSj0sl
         KLdi1kmXUc4izrQ305oAgmPfda176lg1GjtFZOSf7YV7wMagtuwwNmFJJlJXEqUNQHd9
         0MQg==
X-Gm-Message-State: AOJu0YzKdn4Vydkbzg3ZmP2C2y/hAAs5UafLKKuaQABJkfIyFlSnZSpf
	THcC+3T6yV5u2cpVIyiijzbeLhSAAyxL3aA8g9Qv+yRVcHIW2omBXZh0+NguxCJM6wJ/KvEi3r5
	bDSbg9WaMdxspLrdgSj1ZZYGPZWUc+fCiSXqe+TX/btvKD4ilfRrR3sJrHzpR+eSk+xvNAsmG6S
	B7gKg=
X-Gm-Gg: ASbGncsXoyzbjlO7mtvE/04EKVGztRdQvhHaQqIloHslCQbP2jzBLbQ46AKd/1zxBa/
	67g0DSO2SlTlxoTXh5Zt/QzntNsp+7U2zcYGyHEvcBNzlPal/rl5GF13/1ue370ssNrOpFIBa6S
	zikdkd/R62B1+jle7oRuccrmE3QXWWHftNPq4o/j43KHDS35/B8aPFESRwXIRtR0mZzgteC/k88
	pQpBw2/1SsLPEVTxFatznrtsdI46EOTZtWM/Cyt/N+nyoV3NgKZjWqjKB1w0dkSxOk3l6SpRL1q
	j6+aolB5zfx0tpCS1sqjZEDWD46Yb+2plUodi6A498j1/HK9FQyylskzDhSOtW7XwYhMo0zyEcz
	w8eQ=
X-Received: by 2002:a05:620a:29c9:b0:7c5:9b93:8f64 with SMTP id af79cd13be357-7c5eda66228mr597066985a.37.1743087852220;
        Thu, 27 Mar 2025 08:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEt0ZzCYac0YXMyVurq/M5Kdcibjv7UMKcht4zpjgPbj2u3WU9ueTCAwIdfTqR9C+MfFCrfyw==
X-Received: by 2002:a05:620a:29c9:b0:7c5:9b93:8f64 with SMTP id af79cd13be357-7c5eda66228mr597056685a.37.1743087851264;
        Thu, 27 Mar 2025 08:04:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7c1d8esm24917661fa.13.2025.03.27.08.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:04:10 -0700 (PDT)
Date: Thu, 27 Mar 2025 17:04:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <quic_vpuar@quicinc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] linux-firmware: upgrade 20250211 -> 20250311
Message-ID: <v3eo57omyd2clmpgk2elv26bl3hgcwclowv6ynlnzmoyaufv73@iucs2lurdyb3>
References: <20250316130954.2719960-1-quic_vpuar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250316130954.2719960-1-quic_vpuar@quicinc.com>
X-Proofpoint-ORIG-GUID: X1I8Zet65AB-uMTf6kmyzAXFuI5vcTxL
X-Authority-Analysis: v=2.4 cv=MqlS63ae c=1 sm=1 tr=0 ts=67e568ed cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=axUEo0SHMk-DDYAl9WgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: X1I8Zet65AB-uMTf6kmyzAXFuI5vcTxL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=900 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503270103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 15:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213761

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

It seems that this patch has been dropped from master-next for some
reason. It might be worth reposting it with the BT USB firmware fix
being squashed into it.

-- 
With best wishes
Dmitry

