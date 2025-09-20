Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285F7CAC59A
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 00:11:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.276.1758327088776716341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 17:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=WH8kEPF0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JLhJlL028671
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 00:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qtlkyk8cuQlT2fDP8EKSKvuN
	Q9Ebc/UGYVZSz88sdPo=; b=WH8kEPF0ps5h0RdfGOKBarCn49HlyA7mRWlGGcee
	kabCPki95cKbGJvf4TdoxE2TS3Bk6eJ5hIKuM77dS2QFDvPdWIHmguMkqpTRXx0X
	hsjsOrHhiBJ9AVl3Bzd/hVOSNQQnmsrVxUqew11Prh96BxwjNzN+eOFNbe9yoLsO
	O9vxGuny35n/YH01myeN791KS3yoLD2uCHxM6H5nX/Ay04kHf/zkJ0aHNcD9CueG
	OsWxMEDWegy22/V/jrold920oX3uogBHa0XTgD8jyXhg7TFxEF8uPJzZY1OjPWfF
	T3xenFYN1Z15WQ0eiwzR9uzjKp9sDMGDd1b0qpkky4fOBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49916x3317-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 00:11:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-842b2ad7c28so11003885a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 17:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758327087; x=1758931887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qtlkyk8cuQlT2fDP8EKSKvuNQ9Ebc/UGYVZSz88sdPo=;
        b=svDtlGRVqsgGbtohiASXF6g82PgYz22r0QS3376Tpo+iDxoB0P1XaAbmInm10Qhov3
         Ie63hDaaZgEZHaiiZJxTzV8RKRAbmt4p8geswc4aucl9bsSnafrwx2v/9zFBtGWK5ZoC
         FZF9b0HeVnuupGSbLL7mnZjAd57nBZk8yHbedthAsXmp5lz0IrK4dtOSXhoGI7NRRLUt
         DJiM8oyxoAM2lo/BFmkt9JGru0BlfwIqOocFvq4XhO7S9VqjMVlE2UOOuz46a5WK9Nxd
         kDjenEu1WM24er6kncvd/yOscuZ/73LqONPNJZVJvVOIoXd5/hjNi8JyR9va9DaYAT8j
         Y0IA==
X-Gm-Message-State: AOJu0YwvF8lr1+VUNfw6FObg1qTVgfWfPaoajF+FRI60N1pnotCPRjlU
	rvZ91dX9YavuGTLf/JZS8vdgWmuOeRcDe6jejgeo9K00CLZ/E5VIjBYyh9DkA4DLEPibJoYMvJY
	RWI5d1T4jffZmYuwXplGHlBGZXamXCx6MWy0/IL4BX59UuYP8h0ryuYVJ5xjtFKGyZocJkMQxBV
	dRSqBLHEs=
X-Gm-Gg: ASbGncsE1zef2XjPEW+CMOhCqO9N9OZ+IiB1T3PCeo9YEyuJHraKGM8A/99h8+dhHCR
	45eQ8x7Laf7CT9HZZpx/EBL/sdWphe100tzHqoGSqEjOkBqL+wDxiUg/pao8l0hjc8N4Mje+wWq
	2MY4F6uJJF01zc4JiTcgHEIVYLeF0QX+kNt3OGw1GlmOigOw4QIKpkIf+4r3/RczQNfuTGDSEXA
	dboGTQHbhNw/2ttGIrUdgoK+I7svURwK19eETKp/QOWXA04GPsGp9XoTrztRSUmWpFr6ihFbjgQ
	GbHR+Yy8Vbu2wkaiIgBorQT82aaXttnYyzdThH4+ew+5Bp88uC+J0N0UkJb7SFUCW3kHIz8SoKD
	5HcCYDKERhvxBu6aTnTuuufYjAQlvfevus0wBSuCyfCc+vpE3dxT7
X-Received: by 2002:a05:620a:28cb:b0:829:7c30:e83 with SMTP id af79cd13be357-83ba29b6521mr662222285a.2.1758327086877;
        Fri, 19 Sep 2025 17:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPuA2WDnQyhQbEM+blLWtZ0tQt/dXO8JcoTj2XYtZlwQFqCiahKmTpZZxpUB1jhL7pIljrVA==
X-Received: by 2002:a05:620a:28cb:b0:829:7c30:e83 with SMTP id af79cd13be357-83ba29b6521mr662220685a.2.1758327086402;
        Fri, 19 Sep 2025 17:11:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3619c92cd02sm15484801fa.0.2025.09.19.17.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 17:11:24 -0700 (PDT)
Date: Sat, 20 Sep 2025 03:11:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Puar <vpuar@qti.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] linux-firmware: upgrade 20250808 -> 20250917
Message-ID: <dvtmteaczr4linkwvzu773akab4iea7bhpyjocpruoc4qjw6to@tveqo7ktp6ez>
References: <20250919211116.3607622-1-vpuar@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919211116.3607622-1-vpuar@qti.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA0OCBTYWx0ZWRfXzD1h8Nc+mhYY
 Dh9LTJXeL+YD67S8d8O8medcAjtVyLf1/UwHN9ZMZXngo+Sio/rzCpElQ7oIeWbfVC997h1fDnB
 mml2lDgrJh33ztkYwkBLBK+Hcf8ldeCQ9yUfp85vQjw4qHWAFbZZDRTMgx2g/+dTr6/HIb+I8UV
 ae9VEzDZDTl3+cUvNpUClAweuCWB0jIwbYK49HyFKF9BIn+t5oFYxFuPeNZ8tKmF740bPJa7q3C
 7+RjlvVP0ooPAijmNun5VKxo3OpFzydNXnhhwP3n+750lOF9cZlP3zIC6vc98kvg4t5mfIejE18
 N1w4FnKTXnFq8BGqTVQ+YuAJUMOuhJdSmnQskzClieDanLfVNxPN4uvMQ8lPwIqE0/LNjhPZ9fe
 +94yGXBv
X-Proofpoint-GUID: fmNTgPPcZv32jF1q7CtbabyaO2l94T2A
X-Authority-Analysis: v=2.4 cv=LcM86ifi c=1 sm=1 tr=0 ts=68cdf130 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Vh1iVaj0qxPYo7AG0bwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: fmNTgPPcZv32jF1q7CtbabyaO2l94T2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509190048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 00:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223777

On Sat, Sep 20, 2025 at 02:41:16AM +0530, Vivek Puar wrote:
> Add packages ${PN}-qcom-qcs615-{audio, compute} to include DSP firmware
> for qcs615 platform, ${PN}-qcom-x1e80100-compute to include CDSP firmware
> for x1e80100 platform, and ${PN}-qcom-sm8350-adreno to include the GPU
> firmware for SM8350.
> 
> Extend Qualcomm QCS8300 RIDE and SA8775P platform to include audio topology
> and include linaro license with both the packages.

This didn't happen. You haven't updated licence for the packages.

> 
> License-Update: additional files
> 
> Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> @@ -1955,6 +1956,8 @@ LICENSE:${PN}-qcom-qcm6490-ipa  = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm6490-wifi  = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm6490-qupv3fw = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs615-adreno = "Firmware-qcom"
> +LICENSE:${PN}-qcom-qcs615-audio = "Firmware-qcom"
> +LICENSE:${PN}-qcom-qcs615-compute = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs8300-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcs8300-audio = "Firmware-qcom-2"
>  LICENSE:${PN}-qcom-qcs8300-compute = "Firmware-qcom-2"
> @@ -1987,8 +1990,10 @@ LICENSE:${PN}-qcom-sm8250-compute = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sm8250-thundercomm-rb5-sensors = "Firmware-qcom"
>  LICENSE:${PN}-qcom-sm8550-audio-tplg = "Firmware-linaro"
>  LICENSE:${PN}-qcom-sm8650-audio-tplg = "Firmware-linaro"
> +LICENSE:${PN}-qcom-sm8350-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-x1e80100-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-x1e80100-audio = "Firmware-qcom"
> +LICENSE:${PN}-qcom-x1e80100-compute = "Firmware-qcom"
>  LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-audio = "Firmware-qcom & Firmware-linaro"
>  LICENSE:${PN}-qcom-x1e80100-lenovo-t14s-g6-compute = "Firmware-qcom"

-- 
With best wishes
Dmitry

