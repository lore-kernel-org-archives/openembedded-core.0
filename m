Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72674C3ABAA
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 20:38:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.82.1746218312588886250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 May 2025 13:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=Zgbvy6Jq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAx4h015669
	for <openembedded-core@lists.openembedded.org>; Fri, 2 May 2025 20:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SD9o02vKalFJRhVvFP2SRR73h8pWkIQ10+Srll18XOw=; b=Zgbvy6Jqwrzuk9Zn
	R3Gwip6cekWmkaKP/fSD1HdNHk2QxRj7vgCsG+eK6GsrjOapR4XDEXZDZu/NIb5o
	YswNUcs0SA19ibh0GQq6CsaBsVODuJU129BRlUd+0kR1YcVHu1ffWiCLAImqZsR4
	dXs4PoJA0fdKOkqaemMsuhOKUMIvEOPXx3tOM2cedR9y/agXrs3mcSMblVH995xO
	0r9Rttr0lN9VCzTeDlfwhLk9iOsx7fIEa5zN9E7qGz+56isH+LZuXc5r+mdmloW4
	QnaZUwgNq0OHTUS4nf6eZKb4STJUaSyohn9xMbpupjFJJcoJJuwKmFk2KRslk6PZ
	Zi+qBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uah8am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 20:38:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c543ab40d3so256756785a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 13:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746218310; x=1746823110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SD9o02vKalFJRhVvFP2SRR73h8pWkIQ10+Srll18XOw=;
        b=fGiuxSsMU2V6jZdVvV6DjZypvhTvmooFCOWwigFQPbfkTkObxwUQLz4FXY0kd7Fu6H
         eSz9W/Q2wT3XkbiHNxRgpgONtRMYxml0wjyqRz+kSWIC8NLZ5N22afGSZLvKb2dA4G4H
         VgB34Dqsp+Qzhw+Osbc8NzjJc1Obmae/mvFiO2NI5li+bcHbXtNv5U6ZRQS5qzRG100u
         h24RLlpHsxNbBggawXDZaqWaC5fGp6pZIgUuUB6SxPGX28XSbDfNBFP15W4D2Zfkn7VG
         6EXt2cEm7jbQ4byMW/C5IHQJhh+MdELB98W/bpzpDyv3s1zvLrpE4H1Iwh0G4FXITjA5
         qvNA==
X-Gm-Message-State: AOJu0YyZFwh21gXgpE1Pu2cGiee1Tx2hJ1jJFev9LMwwv+dzlUQJ5KuP
	1/fLOHs2xH9ciLtfvZYfHoSLhmfK/72tBQxPAG4VQtbaT8mu0QNrIwJgfndmf2c9uIACm89bLoG
	FvcfAqiHOfhvaAKgVpN9g5ZyZX0HQTardTzs+Q88o/2NT0+WWsrq7d1PmNk6XIoVnSRxnIlJCJU
	fuNxM=
X-Gm-Gg: ASbGncv6JbYCjmIZ6BAEQKVQyaRu552eVSDHtVjlDeeYlK3/MGesgeJgvAJHHnhIxmc
	05vq/FlSd6MkBxGV1uigAi2vFhGCUd3OOjnDMXeboNocShCXiS/zDYtxQi1vf1qWyFMfcSTGsKU
	DRZwUK6MXdG31+AbL+VByZzmveMPwzTs4Do1roKYx21ONEmHNkm4wSqls1ZvFy5mWaWThOJjjuu
	3444Z4rlFMaV31/ZiBtTuGZpOuiCgWNl8LNfy6cHjDXjocInQV1/m8Jcfu6NgJOOJcscw5RtRez
	0mW9wTGm5hlXwhOY0iHXcbD8QxUEXcrqYlcjSHb725d1XIY/GHriWGWQGQMMcdPob8E8m41G3/V
	oG4bOaPXoDwFmSQ==
X-Received: by 2002:a05:620a:198b:b0:7c5:3b52:517d with SMTP id af79cd13be357-7cadfed9fd9mr86754485a.54.1746218310466;
        Fri, 02 May 2025 13:38:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHcQ/qB9FMH+27h4tkTYYXHIdEqUAvPapHy0n4eOy7IzbAMwYVlyqTFW7gWBnrb2gCjKRQAA==
X-Received: by 2002:a05:620a:198b:b0:7c5:3b52:517d with SMTP id af79cd13be357-7cadfed9fd9mr86750985a.54.1746218310058;
        Fri, 02 May 2025 13:38:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f1820sm477549e87.168.2025.05.02.13.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 13:38:29 -0700 (PDT)
Message-ID: <fd1c14f8-2c75-48b6-9819-efd2b639a8b5@oss.qualcomm.com>
Date: Fri, 2 May 2025 23:38:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] mesa: Pass needed clang flags via
 BINDGEN_EXTRA_CLANG_ARGS
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250502-clang-merge-v6-0-00f2c2e9ff68@gmail.com>
 <20250502-clang-merge-v6-3-00f2c2e9ff68@gmail.com>
 <coea7eqq4tekzubxffzhyom5vbhfl3fhh4fv25eht2inzpg2mn@nkb7tzza3fn3>
 <CAMKF1srM8uU=J58o6cGzuoaDhk-dVfrCPCOZ0egRaxa6Yn_-ng@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAMKF1srM8uU=J58o6cGzuoaDhk-dVfrCPCOZ0egRaxa6Yn_-ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=68152d47 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=iI0CZyxFEQmHUC52CcUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE2NiBTYWx0ZWRfX++KyzMCGeb/P e7Ppx3KtSzZiV/01xcS7/h80LdNuE6M1jM9JoCIME1dkkFoG81O1dbJAjWIJZ49HHlebTsbZiCs G7YPEScqnRSrIHU1zTyP7MXVPVm5ficN+5AoXdlB9sqTiA4MwZ2reA0FCI2Kt/h5AeWFbdR/BgS
 RDqHpN/VOePZL7qyNtulkNqKPTFNLuXJ8c5HBHaf41A6KQQHUE+cAtIgX364OTPBcKLdMuFu22v RMAo6zdLQUE6Nsg42FAzHW9EnT2RDMQZz05/nWumyfIEErBHIQMnuWSXfH9422C4PrzMD1FJkR2 kUF1WyIlaAGL+BwQ7jD30rPjmnuuicr8VLnFltV6zH4G12OEeIvA+M5zVjtQmviJnhe0MyRfNK/
 sI1iJzqsotExBfT3efCliaYEu76C6QkvnA7fmcdhsGjO5rMTPIenAazogqkYjPiXHcH5YEog
X-Proofpoint-GUID: jzAx8ctTOwBlpW1o6ENlk-8gNfMinwoL
X-Proofpoint-ORIG-GUID: jzAx8ctTOwBlpW1o6ENlk-8gNfMinwoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=980 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020166
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 542KAx4h015669
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 May 2025 20:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215926

On 02/05/2025 23:22, Khem Raj wrote:
> On Fri, May 2, 2025 at 1:19=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Fri, May 02, 2025 at 09:55:17AM -0700, Khem Raj wrote:
>>> This is needed for clang to find the c++ headers when invoked via
>>> bindgen
>>>
>>> Fixes
>>> | /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-linux/=
mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fat=
al error: 'cassert' file not found
>>> | Unable to generate bindings: clang diagnosed error: /mnt/b/yoe/mast=
er/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-sy=
sroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' f=
ile not found
>>> |
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>   meta/recipes-graphics/mesa/mesa.inc | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>
>> I still think that the attached patch is a proper solution.
>=20
> I have apprehensions about doing it meson wide, while the need is just
> for mesa and mesa
> happens to use meson, its not other way around. So tooling a solution
> for all meson packages
> is sub-optimal here, unless we start getting many other meson packages
> needing bindgen
> I hope you understand.

Ack. Then could you please extend the patch by dropping corresponding=20
setting from meson.bbclass? I don't think we should utilize both ways to=20
set bindgen args at the same time.

>=20
>>
>> --
>> With best wishes
>> Dmitry


--=20
With best wishes
Dmitry

