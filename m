Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DC0C87FDB
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 14:16:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.48824.1754921798667839077
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 07:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=keU1MKNL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dFkZ021869
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 14:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eXuD6kW7UHlgp3sAo9G0ZRiVCmJiNevAf8peo8Jqn7k=; b=keU1MKNLuryIOlG0
	2zSPuqWPOBcrFzDet8G0D2Fw055R01yfLnuKHuDC7ZA8tjR2R/gs+x8xwRgWoWSc
	/Cyt9+F65/X7Yb1bepWF4Lcx+ooHLdkkJmnjH93J/fl98uzde90SlWpTilti/01y
	3DB7ZwahTbobljJbogeAZZ/raRiVJPcv9IESVNJJapSw5LV8PyEa3yWfxe3lCqi4
	KfDallaRzPwTROPgTPKYuLv+kmB+rPP5jErAklkaR4toIs79jqvca/fm2tidcr5n
	S6CXPLBS9SEaJ+AJmA4vaTyF29Vymsw2S3PKrZKZTmHsJCwiDlRPUKncHRdT2+Yn
	UthqDA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxj44px7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 14:16:38 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-741a44c92c9so5026871a34.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 07:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921797; x=1755526597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eXuD6kW7UHlgp3sAo9G0ZRiVCmJiNevAf8peo8Jqn7k=;
        b=Pup4VfRVfncRaakcW/9eUWljaelz0TlmwRS5+Wf9zVj8XnvLRAYMczl5X1LsQ/G3vm
         CwNSsOttbld0XN8gnWKMwYCohhO1Ykwt8mCCnZnmKTZRAMCUvZJGEcp00g/t/i1J0XYs
         l4MK6dgTzE8kyBNx6OO+C/aK/B5fWHzqm7PKGKBV5+v2uE0E/xSxo7+oY5mBQcftKoqA
         NTizyitcjnj5ZENut6bl0lhrRDmVRdlNZupH6qaTuBUBKQtuYuKJrFTSP0r0qjR/Wh6q
         2PP3pkEdJRy3lwSqvufwJSOIfMkYPyZ5Ed8FkCyTaEPYshMdAugu0zfE+ND9QI9W2jt/
         nCcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwPkaVVJqN2cs/GP2p4k2W/9cNwcIlQGt6L5ocM5HYAhmdUoOm1UBR5zHfXqiNX0fpcTEcG/Ig9Z7BRBVHYvzoTw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyYgfX7R0U4XJsHEYRmTmeLDi2vF09NJ2cdl9IAqYlCL0rGPHGw
	xJsb550yOA+uobXH2+XM7LRbig0MsQcPB6UA61Lep13qCBziCwDHwjHxCdj20m5GTJfHd86cJ+A
	utGgR4vQ1bW8t5XHLkIgplt5fmTj+QpzMZbOzU/i/WnFijzCb7P8pVX9MRYCQWFzESqgzIlmvEb
	Lwhw0ly8U=
X-Gm-Gg: ASbGncvKCo+6ywsRjx1VOIaIOUgANEK1klmsrGr4DjUV/sn0sNRgxWd8G4S5Ug0J1N2
	k09xGoA3z6Zwtg2GToZ1R9MFeprtVmEsRaJsbcWT9dlButcq9n1zX33pf4iygXi0LTdl9y6A+Eb
	7VvOrrkWFQOLLlJrR5jdLQa3RD5CIEgCKYJh4PPUQoqlk8MBoyWlcoaNGU/LHaRJzs9+BGtfZN1
	8weJhNZ9VTmQkVLdc4iWNIk9CARW2AZkSBraNbzSRLHNMQu1YxoNlfxgbVfUj/PDszdbqxolIVC
	WuBmXCBSSqP6QfoYWZVgBXDWkA2HROI1h3R/5QkoHiIwpxvYAYeO4qFRDXq1yb+6Rl92rXjwNW1
	UIX1Ib/rzBcjeR5AH2MFJUsjwtCWb+r2K6Oe6q6RAiagQtJqW2pYW1aiIsR1reHcJvPGvjUS+N6
	EhIuqrXF3y7h6tIX10eA==
X-Received: by 2002:a05:6830:6b0a:b0:743:48c:5b1 with SMTP id 46e09a7af769-7432c8af911mr9438722a34.20.1754921797002;
        Mon, 11 Aug 2025 07:16:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFPl/kX4bR6voo8irYtug4kAwMfFKbYx+kn1+gm/m0moJVTThbRxkgTaQ4hfJhbOZFKeRPPw==
X-Received: by 2002:a05:6830:6b0a:b0:743:48c:5b1 with SMTP id 46e09a7af769-7432c8af911mr9438646a34.20.1754921796537;
        Mon, 11 Aug 2025 07:16:36 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a6:7379:b509:19c4:3cf6:ffcc? (2001-14bb-a6-7379-b509-19c4-3cf6-ffcc.rev.dnainternet.fi. [2001:14bb:a6:7379:b509:19c4:3cf6:ffcc])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55ba00b78c0sm3269698e87.68.2025.08.11.07.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 07:16:35 -0700 (PDT)
Message-ID: <06954af7-8ee0-491e-bd09-5e88351ea903@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 17:16:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-firmware: upgrade 20250708 -> 20250808
To: Vivek Puar <vpuar@qti.qualcomm.com>,
        openembedded-core@lists.openembedded.org
References: <20250811112420.2834013-1-vpuar@qti.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250811112420.2834013-1-vpuar@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNyBTYWx0ZWRfXxiLgwaPBmZcz
 xd8/mZYtk7jLp9cjfcGGWlcXLbNrK8haXuI383hZfEsYURJLNHpT8KB7B5HUGEqpv8z84vOqv6q
 z3BnerfyOnSvRyGC2x5EC5zqisn+LuX+ViiNaLN91wXk5DtjVYGwA3Piwiwyaqh0VtGgSVhGgjG
 OLiyt54UVJkt5UXGGS/WKSQL+hmT7CBUYrpfYKSRnDRpXmHz3V3a73SrrjnSHVlACX3uA53/Pwo
 e+g5ZRgx+3Eq0A7zJQyshusiNLre870ABMxQGycmrTadSTN+WOGB3p7Br5rE2xZ2oinquEDfMa4
 JQn08vOUImr2/9S5HiBn1GAIclC385nKYrUdLDuvQNQSJNTNtcj5MywT7jCm911roMyEMBzhfAw
 5phkge13
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=6899fb46 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=PmY__gv4EUx863-49-IA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: x8N1PPvRw2cDXUWJfhOtaTa7PkkxABzg
X-Proofpoint-GUID: x8N1PPvRw2cDXUWJfhOtaTa7PkkxABzg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 14:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221743

On 11/08/2025 14:24, Vivek Puar wrote:
> Add package ${PN}-qcom-adreno-a612 to include RGMU firmware for QCS615
> chipset. Extend QCS6490 RB3Gen2 firmware to include audio topology.

LGTM. If you have to resend it for whatever reason, please mention that 
a612 package depends on a630, because it provides the main firmware file 
for that platform.

> 
> Add new LICENSE files.
> 
> License-Update: additional files
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   ...20250708.bb => linux-firmware_20250808.bb} | 84 +++++++++++++++++--
>   1 file changed, 78 insertions(+), 6 deletions(-)
>   rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250708.bb => linux-firmware_20250808.bb} (96%)

-- 
With best wishes
Dmitry

