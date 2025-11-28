Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F055D116F3
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 13:37:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16070.1764337035044569352
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 05:37:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Pn5JAqBW;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CdjiqlGA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8rj2Y3989803
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 13:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FHNZcgTd2mX/qrrSuyVamqOr
	lcufyb9sOLvwg2fKBRE=; b=Pn5JAqBWozkPG6Y2iI8izzMAwK1bW8ac2pcXunjm
	v6HiHypgOH69pC+MhGkL9J6ljwhObOt/y8oUixurssBYx7wGsUaR2ki7y7EgrncS
	OYNKSpe3tcw9uWG4OwIbPULv6d0UcXD5EHybs/fM574e8j7qU1y8j7SSjgxEe1ZP
	JfLJEw8iHtNrO8Va+hRjUlhNwCwA+KAsEn3kvwhDKn9VXehvFfvdFiG8S2/JBTEu
	77N4U2Uw7ykI7FZp8h2Fr0wT4DNDjeFpNw8Zwwh7cl0bI0QNtktS/6+G7gAs3H+O
	bzGJP1JvtX2Yoxu6dj51Sm6/PGwYs1sxDi88+EhGxfIGhA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aq8mm8rrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 13:37:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8804b9afe30so50483426d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 05:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764337033; x=1764941833; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FHNZcgTd2mX/qrrSuyVamqOrlcufyb9sOLvwg2fKBRE=;
        b=CdjiqlGAING0ENOBc/TyO2ArP/2g1TM69Kc2hUYmZ3zmMqWy8w76nhp+zv3yZUi5aN
         EdpaJd9lsFJXvLLY/fEiNLJFjhiSwNNPPNDMrTtwM4uJ5Viwp7OFjmvPIYbVCmXyJk3/
         zimBFWY54OYo/7f7MLrETJW6dmBMSKDd7ObAFgax6xOXPk3r/ypzEUa3F5bJ1wz1D/0h
         z73ewe/9SZkzeXFd/tnr74TxRpBENW5froAyI9rc3NGZV1og61/7nzJPl+wpQac1VVeT
         uQdRO1/iId5CZ3GRJ6crbvxNQh/GKTknJQRUf9PNlk5RYXVtxCBy7yXwCgVpaB3qBg+6
         Ubdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764337033; x=1764941833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHNZcgTd2mX/qrrSuyVamqOrlcufyb9sOLvwg2fKBRE=;
        b=tyeybEF9njN3ATReM+jOYEa1UXHHdql6GOyAkpkpFsnyUyC7/LSsXE/gVRRp5yk+pT
         TjCNMZ/A7U5E2sjxHNY+4DxvzqmQRl4EubPvTO7qA5R4RbLI4OKmA7g+BS3b4hMhiWwe
         hjDvKm/CsPyYge3OSn2oCQ/BV3+PJJIzZ6FMtc2WjXmqnRUunP1/5acE4uYTziSi0E0N
         m8y1zDEtqDbY+FzJDAn4OGhF+ZCK9knyNJI7E03CBkqyNvomsd9c6mEUNk6xc03z7cfv
         2ndbln/eWjUBNsADFLpiqMIJMI1bMgKsYT7NrRsre+dwnEFhsVaUkhm9in+7v3xHt8Qs
         lhOg==
X-Gm-Message-State: AOJu0YywjBxY9O4PAB36GqXdhuA7F+UVLDW6LBPldbk8MzImxLRWe+X1
	RYiUIij0bUoNY3a3bnq2tuVjblyJqGPlZD3APZP6Sz9l2+ep4wQOnGmRRnmuKV9WsabWECXT1zi
	8GfQAkJQ0Q4FgMBBOVY6ZbVlTw71L3I5OxbybuXM81SJZ6k6ZXull0XQ6ePeAMSTgcyclc3cm3j
	XB7wXvqkc=
X-Gm-Gg: ASbGncsJvW45aib5C8I1rhy98AGfRf71IHm/xfUdSHatr283ZujeX+BVjnQyCezJYwk
	j8jAtePthl6E9/3daZcd+K85otDNRWuJmPlcnEK6tZ56lAg9HeIw2B67zA1C73sbWtEdutZ72vl
	It4K707kvwclU0JFHm7RGOt1WqdP/7BUr+MwtchCX6xvdn+Gj+EN3Trl1eQtkDeyzLkwZUS1Jex
	8mAfTtrjb5D3QPXyymkiTKQtyhtcn7FJNQdK5JzvJCGRVNXySb6g9B/gw02nWYDAXpFyPPNuDDu
	DPJNWDGyJtE46Xvr/1ABYft37R1vimNqZ/a7/PArYRZJrHhlM0obS0oPAeUlIfPizypQiupQ0gw
	2giXKW/mxo6FgeJy1k90h7bWgAXJmFdHWwQEJqTIKzYhzBs7BVbOPVtUujvHJlpzjcSdPZlbNN7
	ipGOezBjkFm0m8zSmTetlaBA0=
X-Received: by 2002:a05:6214:5192:b0:882:489e:a7a4 with SMTP id 6a1803df08f44-8847c546256mr393115516d6.67.1764337033303;
        Fri, 28 Nov 2025 05:37:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiSWa0k4NNz+4vDNd0UQ0RZkb6jtMdX1e6vqz/3od51Ae/RU79ljJX3c6J3uq8p2GWAZaWjg==
X-Received: by 2002:a05:6214:5192:b0:882:489e:a7a4 with SMTP id 6a1803df08f44-8847c546256mr393114696d6.67.1764337032788;
        Fri, 28 Nov 2025 05:37:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa48d67sm1195875e87.74.2025.11.28.05.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 05:37:11 -0800 (PST)
Date: Fri, 28 Nov 2025 15:37:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 0/4] wpa_supplicant: restore defconfig and enable new
 features
Message-ID: <jearwy44bbbxmrghethvqc4z55vvaiajoc3e2r7fyccl4aci5a@jnrh6dtepgcq>
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DV4XJHAOLb4ef0uiW3gP2aLVFGW-8Nfb
X-Proofpoint-GUID: DV4XJHAOLb4ef0uiW3gP2aLVFGW-8Nfb
X-Authority-Analysis: v=2.4 cv=Cvqys34D c=1 sm=1 tr=0 ts=6929a589 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=BpxJFrDDRfxiCVMP-o4A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDEwMCBTYWx0ZWRfXzAxBxri14ufS
 vT3g29LxT5dutrmKrwZHM54kghm1eLmlTBH1ErZfuHLjjkzNJj55UO7C260HbMdyWwxhQIKwe33
 YNJk1I5Up1IRBT+O0Y01dXRZ4PajvZFaqkq4/8eC673TaAXcMir+SSuU5BIhV22jp6oBRD5MRzW
 iJDp42j/axMPLolKeIgt21QGmM/DFxxBShY3j50G1EZrptXt5g5je/d0PVFrK40mxAIs2/BrMzD
 DpDI/dofq+fnxh35iYgu/xWHzr7dIyBD+knIb6rrIRHodyTOJdB0k8sQgvXAZNlHZ9s6OAzWxrQ
 MoPfjiDEKNiP2aQHuA2heMgDkaO1CwzKRLKZK9PIW9rfiDmnKoxg/NjxgcCkbFDRMQgqAwBqCtl
 cYv4hY0YRbvt6Hx3QL+i8Q/z6up7YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 13:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226908

On Fri, Nov 28, 2025 at 09:36:24AM +0800, Miaoqing Pan wrote:
> This series includes:
> 
> 1. Restore use of packaged defconfig.
> 2. Fix sed indentation in build scripts.
> 3. Enable 802.11be (Wi-Fi 7) support.
> 4. Enable OWE (Opportunistic Wireless Encryption) support.
> 
> --
> v2: updated commit messages.
> v3: remove outdated comments in defconfig.
> --
> Miaoqing Pan (4):
>   wpa-supplicant: restore use of packaged defconfig
>   wpa-supplicant: fix sed indentation
>   wpa-supplicant: enable 802.11be support
>   wpa-supplicant: enable OWE support

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

