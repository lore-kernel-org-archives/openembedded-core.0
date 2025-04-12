Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E53B9C369AE
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 15:50:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.13322.1744473040672418179
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Apr 2025 08:50:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=PD0/Vmd0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53CDj1Hu007059
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 15:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zIcEObjoWZXfM9jAa1mJIRbo+WuWdniHPXXQ6forKN0=; b=PD0/Vmd0UYtvnvQb
	/rVZRHLOxUPNQzjjG1sjyZeOp/BTnkjj8H9LknLY1Zcru1nSHT3v/tQPwWr1kVhP
	xazYTaJaJat1rQl4j3Z9oLz+9PExQkwhn+kM3X6kSCXG9sUS6V32bTk9mfY1zhDT
	X6Mtxw0bz+d3dAqKyJ94HlG6AmvmGiX9rRpxWJg3JPedLje2Rt41CZHb6Jn9xnqb
	GqZPh5L5yDsX1H8W8B1qBlialmwkVubkLjdjtiaiOERemQLf9oBsJgzTPPzysAqv
	ECoP8nvzbTtdqb/D9xSb8zGiDghlsKFjgevOOoE1Aycm/JI4wVfCQgpIUJJ685mN
	RfbnWg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcrqqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 15:50:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ead629f6c6so49901286d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 08:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744473030; x=1745077830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIcEObjoWZXfM9jAa1mJIRbo+WuWdniHPXXQ6forKN0=;
        b=fP/4+ND2C1npJzv2OZ7jMgDu7UK06YkkepeaVEsF6gvJnnoVrauL9l1yWXYjZyk/lb
         Wwy115XDsd/uIaInHfL4ZQZtPUY5Q32R0J+mVsREK6oKRWN0BejQsKRJV27JnXNkKNO9
         gFoAf7Lwf0hhSp/FKKOh3tZ6QHcsn7uZ7qQxc2O0/NE6vtp96mmfhHddBCABXxMA9lod
         A+s+4gY8irZ/EUtlHNS3sKFH0x8UIorCmBqh82rCTVr9gotCKxmPafV0TIlTMh1uz5rW
         iKFKaBQ14isGUI2WQnFTf0Jio/LlYUVaOOrBmetHmBvLb9QOcq5+G1PRciaaR/t7U5L4
         5VLA==
X-Gm-Message-State: AOJu0Yx6uDs/L3tl6lMrsw53VFVDgsek57kEd2PF10QN8ejwGl9F/3Hu
	JQWNZ/OyqkKd3ZZNyG3WQVK/EK1YDOF6uXlkglzHf0KXGquFzihwskmNeUAaqUZORNQVlvmaJNx
	kdm8qp9MRpdzTmS5lqYpd51fJvLYg1D0QFTQ6wCO1uwnUtHw/xNt1pptRuyWp4aZ+/spwUIRe5I
	5pQ74=
X-Gm-Gg: ASbGncsiZfNqE/PDhUTQySZpTJn07YQFDJdhFyDkR8lcuyZ4y42p/v/C2x23Ps1OfsC
	PFsIcrgTS+RkZbPumjjqIJz/8zZM0i9tP5bm12hqWGEG4+LDuJoX/8SZQmZUEZ8oSnomWAWu1M6
	CLdFhHvWECgEwcc140pcr41OLyiQQN/DA1ETUk60dBw8v2XpAUZiT1J82q/D57dmlcB9bnU1g56
	XTny34d8ra4sS25bmgNxyaJzFKw0Hi1d73AzEhR3dtwp6PHD4HJByd0L/ouOTKOsIPIzNOfzMMC
	iitP99zrQ6EX3cA0J74qMiXYX5yNYuUX16tuKDfsg91NNXJUsuqH/0HL88agV7Za1N0=
X-Received: by 2002:a05:6214:2342:b0:6eb:2f7a:45c2 with SMTP id 6a1803df08f44-6f23f16e6c6mr96369346d6.43.1744473029672;
        Sat, 12 Apr 2025 08:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD0DeWewKlQUga3XBHeykiWKDK+pnBOiAkrO6TBmQ2hBi1/tSxFOWXlnd32Uo89mDBdNpGKA==
X-Received: by 2002:a05:6214:2342:b0:6eb:2f7a:45c2 with SMTP id 6a1803df08f44-6f23f16e6c6mr96368896d6.43.1744473029001;
        Sat, 12 Apr 2025 08:50:29 -0700 (PDT)
Received: from [10.187.209.180] (37-33-188-210.bb.dnainternet.fi. [37.33.188.210])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d5e0sm11246341fa.6.2025.04.12.08.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 08:50:27 -0700 (PDT)
Message-ID: <48d442f2-0a6a-4ba1-a7f0-2f54674a1ab6@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 18:50:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/7] meson: pass -target and -I to bindgen calls
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
 <20250412-mesa-25-fixes-v1-2-791840391271@oss.qualcomm.com>
 <CAMKF1sqFzfsPgr0LJbGY3djKGGBa9hJD6rYNVC+oT9eP9Cjpsw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAMKF1sqFzfsPgr0LJbGY3djKGGBa9hJD6rYNVC+oT9eP9Cjpsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fa8bd0 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=gh1egkeLKbPt9jDVRuYeUQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=SgfeYxXYP2ewa1jSAywA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: e-q3jekPyN35XW_Imc-zEP3DR4IjBclY
X-Proofpoint-ORIG-GUID: e-q3jekPyN35XW_Imc-zEP3DR4IjBclY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=675 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120121
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 53CDj1Hu007059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 15:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214776

On 12/04/2025 01:53, Khem Raj wrote:
> On Fri, Apr 11, 2025 at 3:09=E2=80=AFPM Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>> In order to properly generate Rust bindings for the target systems, we
>> need to pass '-taget foo-linux-gnueabi' flags and a correct include
>> target include path (${STAGING_INCDIR}) to the bindgen. Add those
>> flags to the generated meson target file.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   meta/classes-recipe/meson.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/m=
eson.bbclass
>> index cbfc45b94bbd076735847134a0976b6b30784d50..ef45a034a767e979a45553=
ba08e46dc90e34f33f 100644
>> --- a/meta/classes-recipe/meson.bbclass
>> +++ b/meta/classes-recipe/meson.bbclass
>> @@ -93,6 +93,7 @@ cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
>>   [properties]
>>   needs_exe_wrapper =3D true
>>   sys_root =3D '${STAGING_DIR_HOST}'
>> +bindgen_clang_arguments =3D ['-target', '${@d.getVar('RUST_HOST_SYS')=
}', '-I${STAGING_INCDIR}']
>=20
> I think its better to use ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
> --target=3D${TARGET_SYS}

TARGET_SYS doesn't work, as it doesn't include 'hf' on ARM, etc.
For v2 I'll use ${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}=20
--target=3D${RUST_HOST_SYS}

> here
>=20
>>
>>   [host_machine]
>>   system =3D '${@meson_operating_system('HOST_OS', d)}'
>>
>> --
>> 2.39.5
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#214764): https://lists.openembedded.org/g/openembe=
dded-core/message/214764
>> Mute This Topic: https://lists.openembedded.org/mt/112219030/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
With best wishes
Dmitry

