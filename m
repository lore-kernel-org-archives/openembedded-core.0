Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA06CD5BD0
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 12:54:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18031.1779879739834483710
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 04:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=PnxerT9C;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=BPvz0bDD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: wei.zhang@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RAVBRc1401254
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 11:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FegbAgjZnuV8NtHL6dYfxNvt8vndBZoUwEirBtEIbUA=; b=PnxerT9ChYIQMCbC
	FkpTqNH3U007PjSLUtAqFEuVZ1DWi2ARfkl2cJjs1fMKV7RYJcQRUdg/PTdOXCIE
	Y8dNj/A1dXPgZvuzhrWed+LPLfV0EPgIhrvx6weGTU5uZ3821Xypeulo/yOO7SSZ
	tRHq4v1VY8kAFJ7GHarQtCllJvzyWH131R0kLUDWOaS9HfIESPIbN7uzrFk9zQ0b
	uY+LH1H+mK0u+I29W4hHzgmpK6yKlLsA5fka8qP9fxNa3hhUBkZ7eWfNQhK+Fejx
	QsfQYIWws4lgalFHdhZDt0exlnYkyqyCGW+t3AGXtBMyvnacZSLWYKAxOlWXt9Ce
	q4+cdA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxxar31a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 11:02:19 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12dece274b1so14722512c88.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 04:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779879738; x=1780484538; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FegbAgjZnuV8NtHL6dYfxNvt8vndBZoUwEirBtEIbUA=;
        b=BPvz0bDD0SYLfsuqQ/HaTBwk5yE5P4nN5rrpBfv6m5DQxJCpxhrbsOZ17PZllC2qd9
         +unurw43YWITi+V2I7rUmRTMlDzg8ITfZBPd/GI445UlCDsPLRayJA+mKVsePfYovNfr
         9mbzj4aVzhfx9TwyNzH5mcjP04g2i0NNUXPbw4ylIt3a+bZdSN10Phy7u92iYevenycL
         PNDpspc+JCgFtwvoucUp2faNC6C/2zY0rMZsQUNqrwIX3TG+U0QfvsRRyqSM2ULMJcY3
         Og3bvWhY4ZcPK3ZDtNh5XI+TynJotdENx8sSKgmh1VoY4FB4LURK8UejdbtRHBAV6Ll0
         QNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779879738; x=1780484538;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FegbAgjZnuV8NtHL6dYfxNvt8vndBZoUwEirBtEIbUA=;
        b=CzlDYLdOc0ILr99L+edZMsrFwrCy+tVFV9vsAAzQi8KK3jJYzsoSYv/PKNCwCxbn7S
         DDjmCOBd6+oMozIr7otgUkVt2TlCnsxZzrv1Jn4FZmoZ7JjLXSfZ6TSl5RAH3Mtnbdhk
         K1p12ggaBUCgmJanyOxgaH+IP0sYEwJ8Fwm21czoI5HfkqZC88BCnO5VRN6yP8xnjc5B
         RzNV7cSv8Xvy+ngC160Kk1YfLjsduUvOlelrqYEKVhVYSGyTwCETHugESsLrX9IEFXx1
         sNRJf8pDQ05G7tOfkX7ZGFIcW+duV/IHVB3gYrIQKcRgZVRquONJIMirOVkBapN3Foku
         o15Q==
X-Gm-Message-State: AOJu0Yxe0k27viOu/IS754icNS7h4AsWHN4dSwAOFhnZL/nGIr7MD5uw
	0SCbyf/FV+vtDsyF6mQ9Tl6+vo3+6nETXfmzKSj1k6H2tnuaqix4UgMPiZcQcIeXJSjEJhiG3Ut
	Epnn1JVNYEI6uNNkOrAR9uOQeuhaWQmekOsfXre4NxluwpaZKkJ5n7Kuq/JLLRBTJuAUSy6EtWh
	CvcJ0viiY=
X-Gm-Gg: Acq92OFsnA1KsnCeQ/ffKIWoVx7wCdWzBml6Aiq/QcvAg3dgVqTU6fpy+Mfcm4Kj6Be
	P5MEGYiJdv8WoZv+lL6yrXkugPvI94Q84uxcqN5rsLcY2D6kMVhrumOQVGGmjw4McbK9eF8NIY0
	RefJ40P9jfRtwlCvtw2cpUaXSP/WrFuARfIKQWJQh6FpwNjY2FAgMAw1CZEb3sRBzhBLK2Wo5jC
	cBKdh28d6XzQAL/UTuVPu1D86tOzoyQenCvDVYIzo6uiPiuUcp2c8cm8sIF6VPMyY+vdkdxSoue
	Cp+NSz3qAjzS2ZfETyMK+BVz82e6i34buXr1YjbNMKffsaMXVGMtqre7HhZVc6hkNm3uqIUtf+i
	LyLMpAzIXVXqXaNrFi/zX7OGfPd5isb55CbG6cy9Rwkd3jEQOXbc+y0l/vysOK1pR28DxuaQ3j2
	+0rF7Cpnrstg==
X-Received: by 2002:a05:7022:6624:b0:136:83f5:c99 with SMTP id a92af1059eb24-13683f50f0cmr6662697c88.5.1779879738454;
        Wed, 27 May 2026 04:02:18 -0700 (PDT)
X-Received: by 2002:a05:7022:6624:b0:136:83f5:c99 with SMTP id a92af1059eb24-13683f50f0cmr6662682c88.5.1779879737822;
        Wed, 27 May 2026 04:02:17 -0700 (PDT)
Received: from [10.110.95.222] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aba39d7sm9515953c88.14.2026.05.27.04.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 04:02:17 -0700 (PDT)
Message-ID: <75b044b4-eb36-4aef-9630-f5ad09712950@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:02:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] wpa_supplicant: Handle invalid op_class 255 in BSS Transition candidates
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, jouni.malinen@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        hangtian.zhu@oss.qualcomm.com
References: <20260526083048.4122860-1-wei.zhang@oss.qualcomm.com>
 <qvdfgutqr7wpdkycvhkvexjl6nbkdaqtyyv5zdkor2ylivvewo@4aoqgsynvgca>
 <CANNYZj8Q7kD4Q1PGvfOzC8LzVDDDuaSHnTXMWep_quZpOqeoEw@mail.gmail.com>
From: "Wei Zhang (Stone)" <wei.zhang@oss.qualcomm.com>
In-Reply-To: <CANNYZj8Q7kD4Q1PGvfOzC8LzVDDDuaSHnTXMWep_quZpOqeoEw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEwNyBTYWx0ZWRfX7lbiSX+EAaVI
 CckcMjHAvDJJT856vIaKlJV1fBDGyk7gx5bKohli4+9Hp/MfYSBv4jWsCBE+FyM1HNliNw5cPIV
 gy8iWAQwTTUC7JnYMvJShdonuSl3IM0pBzHixrvMGNFGi5yvE/3vq7CsqEyUGWbkhi9uWroCcCJ
 /Eeln8DdEB//Hvy5YCweM8emL8dgYo0gzXOpWqh+fZ07MiSzNDxa255Vgarv8FJYPA2LMOxOrHp
 +h65Jfbw7B+dfi/qGCmos0/gwbOY4Sb6pCZWHmaBsCCeKWjmTTUVSw/dMKAlre3VWt1sX4ngivb
 cUmYsULm7kMdxPgo0+u1lw290+r2Gqhliip4vsaCS1pUw0oAlMi6t7WL7hqbR78S2tLMEFf7szA
 m318fxQ5aAQj8scte8+eXAAT2A9i4mRLnYKLqQfvCuJitPLsr3WeOHRkulUQrs4OSuYS343Ef17
 D4DOPggUZusOQ8bNyHA==
X-Authority-Analysis: v=2.4 cv=AureGu9P c=1 sm=1 tr=0 ts=6a16cf3b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=Z1V6lDVYwKlJ2i68rAkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 2UgQG8DKsyj4kcxaKAuP4XrwbWBo2-dU
X-Proofpoint-ORIG-GUID: 2UgQG8DKsyj4kcxaKAuP4XrwbWBo2-dU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270107
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 64RAVBRc1401254
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 12:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237656


On 5/27/2026 6:18 PM, Alexander Kanavin wrote:
> On Wed, 27 May 2026 at 11:53, Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>
>> The same question. Which branches does it need to be backported to?
> Wait. This ever-increasing mass of backports coming from Qualcomm isn't=
 great.
>
> You need to engage with wpa-supplicant upstream (which also works for
> Qualcomm), and try to convince them to make a new release (and make
> releases more frequently). This was previously requested, but wasn't
> acknowledged or acted on, so I have to press you again to do it. You
> are in the same company, so it's not difficult.
>
> Alex
Thanks for the feedback.

I agree that improving the upstream release cadence would help reduce=20
these backports.

CC=E2=80=99ing Jouni here to get guidance on the release plan.

Jouni, could you please advise:
- whether a new release is planned soon, and
- how fixes like this should be handled before an official release ?

 From our side, we can also help coordinate or prepare any updates if=20
needed.

Thanks,
Wei Zhang

