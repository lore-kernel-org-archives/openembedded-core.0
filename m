Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D95C7EE39
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 23:06:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.26959.1751238359762188115
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jun 2025 16:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UQEhfeUu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TLueIE028382
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 23:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bKmvnXRHF3BHtZxfq2cqDfNq
	CDub4I+mb53x6VSAcjM=; b=UQEhfeUuH/vlemWUxQvKObAAFUZsy0kQIF6gQDUO
	rGWHxfgf3vsM0cTgGkgQ+7jBQ4Y6aGhqy2FgVn3dgKcA9OxBuw2hrW5FoelnDwH2
	m6adXAwba06w2YaXZ9F+J1VFGAMQQ2Zhvbly/aHS0P9Yidczt9k7t7HnaN8msIhl
	FbEsIZytTg6sINrlhVESJ/xEUZH2u7bgAibPqiZMJRDN9ycrWzNlcomOSj7qYbHu
	PkZyiVCBpqwu2Cj1csuxMnUK2E4Bmh7N2mmi5Bo5ONoiMA6G6CbQYE92zm00hCIj
	+3Vx+Uy5t+uHKJKMuzQgTAxxP3zdZkd4RgR+e6LFCV0RJA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8m62t48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 23:05:58 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6facf4cf5e1so34657136d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 16:05:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751238357; x=1751843157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKmvnXRHF3BHtZxfq2cqDfNqCDub4I+mb53x6VSAcjM=;
        b=He+XC0T8GdQMCe7FOgi/fDvdcOQvbrBphiG6uoli28qgvFxE5reiNCR8U6FRvZg1/D
         aGoMtNii7fbnfBv43kcvG+f6XTgmriE092sb7+TWC4/VRUGeaH9bMmWDpBb6VZ3tWXCP
         TvhRxcdfi6pESF546Mo4g8pBtsjjanm9fTFpWKNrVqlBlTMplWTEmTcGv1J+vJI5wp8M
         gFsKcJ3f/1kAkftLQuKe/nDfS1cPsXgi4vgsG3BsTqct3F37/CWCcxdgNHcRBqaVUFQq
         4BGxj+OICtvarzad2nVtBvxx8chHe8wj0XWYx8PamyV/TqsVFZ0uM3/gGPlNaMgw97Kt
         0NRQ==
X-Gm-Message-State: AOJu0YxwKMPIoOQOJI2NKN+kIN07DtEdX/FhZVP6YWj8jBkVya3SiXeq
	caP9QWX4NJlb7eUHwQOE5ud83kz0Ng5qA85tpUvVLbfpJ7+HVsH2rXWR3UeARnerWwbqOErA5tu
	twwyCq9+YFEhiWw2KW+/4bKsGnc4iVWQ3+zNRVNZULVJayxoAdqTfYTGeGWqKOhU+FJZqBMTUWo
	ffUFwaxXI=
X-Gm-Gg: ASbGncsQE9XxaRGXE9FDAi8A/cnVNP5elgO77p9n7ki5EIABhATNSGMg82+BymQJyiv
	uO5BYp3eV9M7nPDIxFYE2U83dXFJgXNxbtdr30t3EtkC/Bzy6hUJ5KkVncBCSlbtOROOyR4xNtR
	d621ftO04b6DB76R370+XpzGnaWjO1LTsbWHToBcLzz/pFnz5PezfYXxcrINpINMpfaqpSp0VZy
	kj9RGg1CtSsTGQDeQlg4dAyT1XRpvy4LjT6bwAG34WF9xoRTz6F/a9isWHshPqD1F8SjjniVJTM
	Pkis/6cJWv5dVhgxUEKru1LWCLibNvRp3xUM+892wChm7vDF4YO5p6dCodkO9+yU4t1aQQrctzf
	yCMwt3TfHFA5XuqTlu3JYwCnO6DTXQzWaobg=
X-Received: by 2002:a05:6214:2e85:b0:700:bdbd:397 with SMTP id 6a1803df08f44-700bdbd039cmr100770636d6.13.1751238357526;
        Sun, 29 Jun 2025 16:05:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvMagUNEPcTUhDR5elyUm7UePaMWa6+VTMr+wH2o3/kikhifiVYaata5ieVzjKRKqu+Kd5bA==
X-Received: by 2002:a05:6214:2e85:b0:700:bdbd:397 with SMTP id 6a1803df08f44-700bdbd039cmr100770406d6.13.1751238357086;
        Sun, 29 Jun 2025 16:05:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e27c4fsm11155961fa.41.2025.06.29.16.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 16:05:55 -0700 (PDT)
Date: Mon, 30 Jun 2025 02:05:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] linux-firmware: add missing license
Message-ID: <uressxdmv5rawqv4k2y5neh2slymzvrsefrxip5p7tflyfcqpi@g72iqzkwvi3h>
References: <20250628112123.404103-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628112123.404103-1-vpuar@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE5NiBTYWx0ZWRfX59+UDd0kqblB
 x9GLRfYhXaIk6MPgdO0KMY+zIIYuGZiZhYodTx2J5PYAyUQdMwCbyvr+MW93m86Qd3bGfBn5DOu
 1Ebo5t7d0r4YKjctTU72s6g9tH7X8deQRwJPB9rcTHQsEnTw+T72Uzbjni9e7jlJwkcbbjr0n2N
 ksgTzC7AvAC3wWXI10oO1yPQ6OyvWuB3n0nDb8D6qqpoW4wOVBnNQ1247IwBFY54eymdC9l7mPf
 Ospz5En65WsxiButi00A0RqQrmo8L1SqKtU4APQoubJw2la1TZ51QVXOVGZJ53woHJo1K8YtRHj
 IxYDM9IJLYcZRel01lCNxINiyaC1olRad5mArnKEIMmd+oButTZddYKw4xTdU80GcF4v0/fKjDz
 WCJfSlE9FNMyv7N5Z6Dcp1WfHuTwld8oKDQ2qTYUE+9TnaksEJ0vCjw6BT8F2x/g9z1Yec2r
X-Authority-Analysis: v=2.4 cv=Fq0F/3rq c=1 sm=1 tr=0 ts=6861c6d7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gaQuA3MTgQeEB2SpCccA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: VVJJLpiXFM-gXj8zjFe488yXmRbrxZPH
X-Proofpoint-ORIG-GUID: VVJJLpiXFM-gXj8zjFe488yXmRbrxZPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290196
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 23:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219454

On Sat, Jun 28, 2025 at 04:51:23PM +0530, Vivek Puar wrote:
> Some license were part of the linux-firmware but were
> not added to the recipe, so adding those missing
> license

- Please fix wrapping of the commit message. It should be around 72-75
  chars per line
- Please reorder the patches. Fixes should come before actual changes
- Please use a single `git send-email` invocation in order to make your
  patches threaded.

> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../linux-firmware/linux-firmware_20250613.bb | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 

-- 
With best wishes
Dmitry

