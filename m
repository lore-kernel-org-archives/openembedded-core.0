Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359C5D11194
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 18:42:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1441.1764182569201676497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 10:42:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Sivyche/;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CjAxo/u3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQGCx4u2855086
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QtXGDNndRkuVcZceL2l/DXx2
	agLw+xevBde17VwVR8g=; b=Sivyche/YUClSdl6gTbvnJL5RtAyHCewvB2QPpnU
	nAv1CxoOWOIqfa+WEVMK5yXNrp2mw41T4rM/McgpGg1hp9pdNS/sywLyVmG12vsO
	R+YNCtydMlJfOUC5HY3u0rVKzmBnZyqqa+IM3oUTB4NRjvGZzTUwFbm5xNywKmA7
	Lv/poJO3bQmImEApY3lWbkllSRY2DGjVDnFi+nQbac1leEgR2JFqy0EVpQZ7Cnsp
	xa+UyYUU+jYJSFBurc5AqJ2D5UZND7zSLmbjJQ/2RTmqIWozshb7W3MP3I6yZpNE
	Apop5NOj/PmaSF+VBuB3UpJ2V3+ADZFF3fME6NHsOngskg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vh8dcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:42:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29846a9efa5so1592055ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 10:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764182567; x=1764787367; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QtXGDNndRkuVcZceL2l/DXx2agLw+xevBde17VwVR8g=;
        b=CjAxo/u35lvj5TTIqhNsTbBYc/cT/D/dGELqtEsw6TFl9Q0Q7zyyV8LKYn7SLeTQh9
         gtlFdx4Q1xN+NE4Pg6pna0DntoXAcZPfsafZrSSTKSEe998+b9nq7gTkVU6zOXObafar
         rfkqcSto6I4S7g6XIXluPFFZFR2OEW61fEoRg2drxh3Q7TPIloEy4gYUjSnjiC6kcXhB
         AdquOS0IjyNTSjyzsxlFlF94hqxEWdTzzfmA95Xjye7RTUlXknF6EVXqBRO0RaL5heyj
         44sTH33mTG43fO2HjztAFOp3W/SDtSABfVm6Tzzc+/47YfLV/xdmuo3OG2TIRza2M/G5
         rN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764182567; x=1764787367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtXGDNndRkuVcZceL2l/DXx2agLw+xevBde17VwVR8g=;
        b=In5sOdTb6/+/fWL3NpBNu0Ov+dgFvs6F/RHFVmy3ylKbwvvoiii0r3laNF84SnVZqE
         wjYQUMp4Iqt7AVRfzKrgsgd+O+i5LSbEe6tNVfy4h59a5ZS03YN4WYkCO5IIH9N5Yqx6
         QuNtPcta28C6k/hlYv+X1VkI2dqG3dl1PEiQiX5eQP7ljUjRu4c/wUZbMzAL+twbnMZr
         VEEZpmp9T+miGzH1u5T9rvOdAIxREILRAKmqQNhGIF0t5qJPC4ez6pfWOAUAPSoytyc5
         vTp7NxjmEI6xIWbIIvjdCxEAvX7+aQGWe6068o3NcFA6zF0NjYsHqzX9R9WS60pC1WxT
         9GVw==
X-Gm-Message-State: AOJu0YwCnE9PQYKLFDCgXMxv3wenA6nbv05V9H2IiKI4Pu9q5odbEXUH
	k8qQAKTu5tHBvmyRshwH5NOIG+iJ1qh1+eznXUG/krmIlX40qtDU0LZDOnnUlkb+rNGD4uvzIZY
	IGQYb9GgIFQOeaV0g2V81rfoUfip9kXVICvu+W9WNDPlhbxL7jID8mW1ObkFfK4qRxwoyy+E3Xj
	vtsJPS/9KD4q+lhGDtJQS2iBWbQhohGmFwtjOHy0WHNHfl6Iv0JBv3z6yTYg==
X-Gm-Gg: ASbGncumJqUwJk9F3/9jHpy6+iX+oULz5I4BiTthH9s2QkJKUkSUM3MINXGI8Eu6zDm
	+94eiQ9xCFFbTDDGJctEeaaBdCWPgBXIkc8Kn3FOb9paCceIwlmtiE/xyg1z2yyvdYDJApiGHt/
	8D0uDH+x52Un2MAFUtBE/z/hXJP+Xh6GopTGljxKhUZTYnnwQ5BZ3FVPKxF0SWFiUho2f8vncB+
	yZ7qTkQ
X-Received: by 2002:a17:903:2448:b0:299:dc84:fd0 with SMTP id d9443c01a7336-29b6bead622mr230839145ad.17.1764182567180;
        Wed, 26 Nov 2025 10:42:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8kpaCvBHrL7jooQIPMnhhPig4w1I1CPDFXiy33x+UtwEjgykq/VRPgeVdVH8oPYojcUm7vBioAnt2FLNk98g=
X-Received: by 2002:a17:903:2448:b0:299:dc84:fd0 with SMTP id
 d9443c01a7336-29b6bead622mr230838935ad.17.1764182566687; Wed, 26 Nov 2025
 10:42:46 -0800 (PST)
MIME-Version: 1.0
References: <20251126140713.1414484-1-miaoqing.pan@oss.qualcomm.com> <20251126140713.1414484-4-miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <20251126140713.1414484-4-miaoqing.pan@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 20:42:34 +0200
X-Gm-Features: AWmQ_bnG9mWK7TG8eAg_JdMsKPDcR--JgX_r4cq4YQp-FSNUFKOaJzT_WchLAck
Message-ID: <CAO9ioeWqXjrxBOGjT-ZpY9oy8cS0-S3-bnBn=a354MH7ize9vw@mail.gmail.com>
Subject: Re: [PATCH 3/4] wpa-supplicant: enable 802.11be support
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MiBTYWx0ZWRfX/bNK27hrsEmd
 kgK7ajwjh8ttbC4Yr02nP4MZtgcxM//XXiwtRc4guzfyNejyq8rE9rMX3KNzzSRuHvEK5P+NpPm
 HYSVrUbkHOAGwJSWUl6TyEYdTPQC6JKBU0lJhNaLXJ4/wmdmpopaTiDa590ZHcJGSjNMEL/8ZbO
 AiBOR3tqHcB6c8Dhozm/wZ1I3UWdVntwOWsbCRSli7zbhYfofhvyKYNEiALvozHi9/KNR/mK2YB
 VFYSWqxGyP7z8WJeG7BvRlyMiw6uv5oDeM/x5tX0qSnI2zfaIDHhUmbwXH32xZlxszan3EC0oW9
 gjYeU4zZyR63XKi8KxsuAFeCkWRFVEqeAFFGsTYaYqB9Z8RTy++1LmistPA9NwNzZ+ujgNHtTmd
 NavoHXeqUvN20lgZG0T/hZPNe9eA3w==
X-Proofpoint-ORIG-GUID: q6-jlPVP8PAvWpFJIjmr4lRYyn7qHzWF
X-Proofpoint-GUID: q6-jlPVP8PAvWpFJIjmr4lRYyn7qHzWF
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=69274a28 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=T7FyCu7Z4WHDiU8PX1cA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 18:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226811

On Wed, 26 Nov 2025 at 16:07, Miaoqing Pan
<miaoqing.pan@oss.qualcomm.com> wrote:
>
> wpa_supplicant has supported IEEE 802.11be (Wi-Fi 7) for over three
> years. With growing market demand for Wi-Fi 7, it is now an
> appropriate time to enable IEEE 802.11be Extremely High Throughput
> (EHT) support - mainly for AP mode.
>
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> ---
>  .../wpa-supplicant/wpa-supplicant/defconfig                     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> index 52befd8f15..e313894ecd 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
> @@ -510,7 +510,7 @@ CONFIG_IEEE80211AX=y
>  # Note: This is experimental and work in progress. The definitions are still
>  # subject to change and this should not be expected to interoperate with the
>  # final IEEE 802.11be version.

While we are at it, could you please clarify here and upstream whether
this is an implementation of the draft or whether it is supposedly
conforming to the released version

> -#CONFIG_IEEE80211BE=y
> +CONFIG_IEEE80211BE=y
>
>  # Wireless Network Management (IEEE Std 802.11v-2011)
>  # Note: This is experimental and not complete implementation.
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

