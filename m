Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA50C369AE
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 16:30:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.13952.1744475400146340279
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Apr 2025 09:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=TPzy5CYQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53CFRQEH017797
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 16:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TPZnTowpCQMdK9gKFTgIdg/kqrv6SnK89JhvZ16LGic=; b=TPzy5CYQBMH6V3F+
	DLjp7u57qDliRv0dnxzSUGIeBSPckw+gRExT8jTcQZmTIndNErocqHuopip5hKz9
	ZTVpCS/mkOf7ZWD1jTYGCPpnGDAQjapnMC/AS2cOqxnsHFJiFCm08YmHRmH3x/5Z
	j0IzTICT8m+euxcyAErV98/eURmelSWlLZoyy8/HpQAKzKXp3nkiwxL+0trcF+vA
	gk6A39xZBKu+WnF3v+jg1kJkKYUUM5TJM0wZTkotbc9uX3Zlexgj1n69gxYiGzyK
	W1W5mN2Tcat9eKrgu7KYueLeUolGpXfoftwtAztrgf5w4zJwXYuxMb5RjHdj+ze+
	g++yrQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj90vg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 16:29:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f7210995so538019985a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 09:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744475398; x=1745080198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPZnTowpCQMdK9gKFTgIdg/kqrv6SnK89JhvZ16LGic=;
        b=UscuIjMsLuFEzDjWHLJerwVqxKu20M2o6Cywx1LUdoCTVXeELZ92As45P19KPL9RIi
         Oks8c14OiTrO8yeKdkIVw27DX8dDLvVCm8/+FPNk0/5qh1sN3qIWIXPM+SdN51ervqTE
         X1AgaPv8Wq7n8pAz4W33jhkLZwkq1gPn1WTT9rlpqxvwyK8zYHT+QaQlrSly1PEpoVnd
         Jecq8voFDFqXtg5OS0czvau8ZmkNcqCOROGG6oaRYyQS8wBEiWUTzritwRrmleiX+IyI
         NtOOLsWYFiFDrR3GpaCkdWYmyDuFF0go40nngcKe4aCkdIvPJLj5HpmPqBW1oS9IyXNu
         U2ig==
X-Gm-Message-State: AOJu0YwTYKRsesNv4QTb3N/rYH06XQnw5od/MLZE1zm3zacwaJkC3w+3
	/zmedPPrg02nYY/foAilNhBQezCzPvKFpnIF+lekLQATCVVh41IGu1U0gHJS6VHGie+nQ17EFmD
	S53oFSDQGbybQqjKawFxteMbObhGW8wEN0gHOVbMfqwlickBrWv3fsu7RAyrgxeZhm+P0+RbLKG
	YNP/0=
X-Gm-Gg: ASbGncs9PsSjrF1lQ/DTzOa0Gz3JEYuX7kug5hmPNyiPkMLj0lYNZoR23fhCoAK6VT6
	SH2I+VeIJy0FBzampZQyuUDyUsF2xaI/NKKVXIUGXI8Ag09vir6S+wP8wE8NrvJYTXpW0fFqfoO
	ku7/iIFn45NOxb62EibFBhmuptZNQnFJx2dVZL/SMQ6xHadHgJ7r1efOM4FfSspg91UVpGvryc6
	WYLFYyQcws3MJXSp7OFCzzK00sbfHlUAHc7ygWv+JsZ1iphkZhTgFOkkJ0J2NfIjAQCoqiBnKgl
	ADmmhlY7yRCaREcjv25WNLir33alboco+X8BO1tRUBHST8AKIWGOBeDS9h0L171qryI=
X-Received: by 2002:a05:620a:1b86:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7c7b570e30dmr564796685a.7.1744475398076;
        Sat, 12 Apr 2025 09:29:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtL/mmeM8497fyEc8JdBaBuYC7I7SpurdXWc9GMwU0ZcUpHJr+lJDGD6q4ORn5SYg9PTZFtw==
X-Received: by 2002:a05:620a:1b86:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7c7b570e30dmr564792585a.7.1744475397570;
        Sat, 12 Apr 2025 09:29:57 -0700 (PDT)
Received: from [10.187.209.180] (37-33-188-210.bb.dnainternet.fi. [37.33.188.210])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d50f61dsm669518e87.159.2025.04.12.09.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 09:29:56 -0700 (PDT)
Message-ID: <7df3cee7-99e4-464f-9638-befaab4a097f@oss.qualcomm.com>
Date: Sat, 12 Apr 2025 19:29:55 +0300
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
X-Proofpoint-ORIG-GUID: x-HtWqrcW-UDC_hRdE4NMMPc9LVemC5L
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fa9507 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gh1egkeLKbPt9jDVRuYeUQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=SgfeYxXYP2ewa1jSAywA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: x-HtWqrcW-UDC_hRdE4NMMPc9LVemC5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=645
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120126
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 53CFRQEH017797
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 16:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214777

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

Using ${TOOLCHAIN_OPTIONS} breaks x86-64 build with the compiler being=20
unable to find headers. I'd rather stick to the patch I have posted.

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

