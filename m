Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E986C83029
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 14:03:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.41508.1751292181468174082
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 07:03:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QBxwBW0H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DGql029335
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 14:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	znJzDaxvVUB8wTQMPqku7w8m3lGyni3h4yYIAafpv40=; b=QBxwBW0HzFhvBE/j
	HLBVhZcJf9aHA/FedLbP4eyf4jUTOl1zwPD8+YE8Z7/bfjPbT9CvRtDjEWMnH4GO
	SkWONbIjMx0fYGt1gEvaHZjfDW8F9j3Ik9tFukEBaePgn/zkFcJTz/WA9Qtnd3cR
	81aGexPTWGT9e3+9ddXBoWLV/XBiIhDrrHZzgupkP6w98qeBBtQI+Qk6icx9UGzZ
	tQqP37z9wbVf1IwUScs6SpvzvSJdIuT1sOXC72gfknAqpfiQgmprTJ6l3a/jP4yg
	GKWt/nZHn/eSIfrN219cD8FSCFUfziKldH7xIA1t3XzYfSyWcj69QQQK1R1U3Ph8
	DQ3wdg==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95hvwj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 14:03:00 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3df33f39384so22468565ab.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 07:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292179; x=1751896979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=znJzDaxvVUB8wTQMPqku7w8m3lGyni3h4yYIAafpv40=;
        b=X3vvK11IMKXe2cpGVj4Cb+fR1IYNAYAilvxYSjJoHJ5yEIEstT7AUNCNHOy8ANCfQf
         p6vdZjEnDohzPT0mRVmliiFYewXXLfYpKghIqMDzT1u2h9u5FEssx4Y42Jgegx1Gity+
         RaCE2tGmBb2xx2WDIlGOjBSrg8eMRxste/0zA66Y3okx/tAMHwjaDmr6ByRrAFIfphaj
         iTxkHGyD2Rq/XsdejFQT4JxUBAqor+OLVLSKtOww3FrnCUjt8YM4mVcuOnKbAOZ/rx8l
         7dKESZExA/YfdkRSLH1cE8mgPKA9u6he2N6CVnNczFVdapgc3/SGADsvkQAnvaYBNOyQ
         omaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw8iHpnG9nz0MC++O7enswS97/byPu69sI6SnkUZx/UHHe0+gpeI+UF8g1rrnBtSywEaAzpJjRPbhT/yJpRCON5w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzbGz37CO9WwArc3cHp2YLIUwNYs/cQcxsttH/anXT5W+Bvdidt
	SXq3oXEQtGpD3SE4ZJg+MapQVOMlOG/5J6jnKpQxczdqdIsuKos0poqHq+X+duDZj341ZCrqFF0
	Ac2v8Sr6Fr56zgxpkFFfe36ufUyHAWjjrdJvZyXQidd2/n/OqQ5JzBEqSKjAmLbNG/rFxH4W5Z4
	VE2AX98hTkjD49ufI=
X-Gm-Gg: ASbGncvD/pK3Wbfh6IPrc4EOHPn3KuCgRDYV+D0f4nGdoAUn6wDL6JFnU2gFcoJJiqj
	q55nok7GLUnuQ8NNcUIt2bE5pnYGGTk/si/aEsgYlrcwJkmLKnEwncPS7d0P+AukgdwY1Mubwmm
	gsy7mmHxl3aEDPZgA8kjbfkZ6E5+Q8+1SlfsOmjC2ut8Hq9klTLMqsTM3DNc35DQulmUDIyeq35
	m7zgj4BjJBYnsYYWhD/EVKxAdtC0jOAvELMGN0//TxY9I9Wte9thfB9jcAIRe//aoK//FmjaRQ1
	5SuBYLx1vw+wnrUTEqzGFDeC5co+NbmrhcPS3M7keXUpZvhQ1zoTqZQeWp1oeTn/B04wgNyuefe
	PzEU2r3rPDCmBTfUCmyM41qvaOpRLQqPGyX32aWCttcnskSwHClssybkw3qCFKdSLZi0Cj0CqFf
	S6
X-Received: by 2002:a05:6e02:1c23:b0:3dd:d1bc:f08c with SMTP id e9e14a558f8ab-3df4acb3dd3mr145365035ab.20.1751292179198;
        Mon, 30 Jun 2025 07:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ9LaYH6AyKYXq7y0XFjoH+d/FWEq/VzAVpeeklK6uFkYyX0LG7u1TiEvHUN5GpOq2vj+Mig==
X-Received: by 2002:a05:6e02:1c23:b0:3dd:d1bc:f08c with SMTP id e9e14a558f8ab-3df4acb3dd3mr145364535ab.20.1751292178613;
        Mon, 30 Jun 2025 07:02:58 -0700 (PDT)
Received: from ?IPV6:2001:14bb:674:3232:2162:314:6ef5:c60a? (2001-14bb-674-3232-2162-314-6ef5-c60a.rev.dnainternet.fi. [2001:14bb:674:3232:2162:314:6ef5:c60a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24e4dasm1436152e87.73.2025.06.30.07.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 07:02:57 -0700 (PDT)
Message-ID: <2e45e38c-a98b-4a8d-ac9c-db0a4f57c0bf@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 17:02:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] linux-firmware: upgrade 20250613 -> 20250627
To: Vivek Puar <vpuar@qti.qualcomm.com>,
        openembedded-core@lists.openembedded.org
References: <20250630083915.4023652-1-vpuar@qti.qualcomm.com>
 <20250630083915.4023652-3-vpuar@qti.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250630083915.4023652-3-vpuar@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDExNSBTYWx0ZWRfX8INnNoOoSZaR
 2BGGLVl+0A9o2P6C8j1uPz887rp380MJli5+SeH5itIXqH/RG74SXBPAsRwbqo4uk2Lc+BeUgsB
 KLcfgC5q9ZBLvW0yQmh0qdKG/zvGVVThh2snVo0wdEb8NgfhaI4GqaRExoqOznt5HH6d3EVv1KN
 q/vvQdI0EJjjYIHn/O5RpComt804cSzQk2SqZiyFbStox6sh8YK0g2663fsjhgUZdi8gTyxe7FG
 vg1vGjoNUuL0IEZ9ElnM2p2QGrnRvrNseej5JstntNA4yhveuFZN3SLHVVFxJyJ5q1UhSi9QAy1
 PpVH4zA/Xe5AlAeSK/oJ914s3/VkSGHxIUSjPPy/ZTnvASmQSaABkyKd4rRiULtxIG7/+3U4r2M
 /kdQ8jvMK0DKudB8PAhv2tKDyY3AvEqTNkTgefaSm9TdRuoin8BBHD83qah82w3yhXuBuKV0
X-Proofpoint-ORIG-GUID: UETp88bk2QgCChiq1tFRoRJH8agSzhDS
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68629914 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xpH9lPZExsXX3Ypfjx8A:9 a=QEXdDO2ut3YA:10
 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-GUID: UETp88bk2QgCChiq1tFRoRJH8agSzhDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 14:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219518

On 30/06/2025 11:39, Vivek Puar wrote:
> Add packages ${PN}-qcom-x1p42100-adreno and ${PN}-qcom-adreno-g715 for
> Snapdragon X1 Plus (X1P42100) GPU firmware.
> 
> Add new LICENSE files.
> 
> License-Update: additional files
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   ...20250613.bb => linux-firmware_20250627.bb} | 53 +++++++++++++++++--
>   1 file changed, 50 insertions(+), 3 deletions(-)
>   rename meta/recipes-kernel/linux-firmware/{linux-firmware_20250613.bb => linux-firmware_20250627.bb} (97%)

[...]

> @@ -522,7 +552,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>                ${PN}-qcom-vpu \
>                ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
>                ${PN}-qcom-adreno-a623 ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
> -             ${PN}-qcom-adreno-a663 ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g750 \
> +             ${PN}-qcom-adreno-a663 ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g750 ${PN}-qcom-adreno-g715 \

Please keep the list sorted. g715 < g750.

Other than that LGTM.

>                ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
>                ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
>                ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
-- 
With best wishes
Dmitry

