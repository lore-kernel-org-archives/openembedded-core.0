Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420BAC71136
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 17:34:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.1372.1749663256764486053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 10:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=XJhRWZa5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DCP5027238
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 17:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w+g/Mrt+b95z9+wHQuyTv2l4BIwGA/i9+961Io2u/jY=; b=XJhRWZa5oqKi8Dda
	CTr1VsshyfZnZm90ktEfT5GJh7sxQrrOGknzA68aR5bE/cZe9fyKqoqCDTc+QS9U
	c0PrY73ci+RTiIdk/7M2c0zjxw+yhALOuYW/6r/deCVGElrXRViP/YB0v+AVAPXF
	SWlxy+APq89oxi8Ir2X/E1viwYn/Hho0XnG7YtzW6iB1HZd7JG0MYtpwBixl4ivv
	ofM0bOA4S20JY1UIPpRsAPrVdARuZ1gYVZU02ktVJVN/nVfGjaKkBGX+hlGX+1uF
	SGpDM+YHJbmEOzJad5Xm+U3mW0sjZd3BGa3M5fwg4qlkYcAwV9cVUNHvxyiCrPZR
	pTNM+w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhcsvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 17:34:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so27735685a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 10:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749663254; x=1750268054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w+g/Mrt+b95z9+wHQuyTv2l4BIwGA/i9+961Io2u/jY=;
        b=EfMaViueq2B7R7AujvjieklJUDlVeumyOlMgfNsGnCoawvhCUMT5cDMaJVPIn09ohF
         vN1cZI4e8KgL9j8MWl9ZhxiCDYobaQ76zbYmJuoTavKpHX8WWZRlch6RWbsqzGpnN17p
         h1Vlp9aBqXEYbnmecnKX9JBCIgVl4VDPnRIGENQ4A/vXJyi7rIeM069JaoC0fWMKpfTh
         oSV8rUf/CV2oOCYs/FUXKCI1/F0nnEmDUKLdOm08IJSyAfQwgePhpadzX0/uTE8WtzWM
         adSdb/lOMu0mWF1M+zui2wimyw23yJsdGZ4pZyiVxnSPaqicw1p0PDzRq0eI0KAYg2AB
         1OiQ==
X-Gm-Message-State: AOJu0YwmhZhrXCDpvQRE3pZK3iOzzSjL7V5wR7Gr3eSjV3xAAsSEUwCw
	vwJCSEZMLkIBxcm4ASWAOx+z3xiispK/KiqZ0KghOQU1MkcseYOIg8h668sOPctnvQlCQmg89dq
	l+qNsJkqC5tOWkRvVVxbEhbNU0jp9DcvECxom41jqdqD/I9Y+siZDlOEIS0Peq7/o+NZ7LwLyqx
	rexLmLepg=
X-Gm-Gg: ASbGnctDqdD9XCTTh3KTxpd0L1sPs+jQdRNjy1dboii0O45tuZ+j1V7nS8tapy2LX7T
	5nsuvelltFc9tEExfBmIz0RrwX1lODRs0h6BgW8Ke5ml4X+yqB75k4/JY2YPL/C/qxXzFXy0y+x
	s99+bc6T1FVchzUUHKeIOYK0i6nWQPq1dOsy5C7CVqGO+RLWYIClqOkKXjJ7KvHPJl0nO1anr1s
	G3qeX+JCg13TL+uSZS+ktnIj4op7POCafzUdibVxXCxz/fw4teeq/r5i9YPI0+s26IQjA6AIp6T
	n8j/BX5LRp7r7Nzpqw6D/q39NPAvDAwHQBEvZN8TIg==
X-Received: by 2002:a05:620a:408e:b0:7ca:f3c6:c0a1 with SMTP id af79cd13be357-7d3b2a8b8a7mr51108285a.55.1749663254471;
        Wed, 11 Jun 2025 10:34:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEttDWrKAYXnAc5umXg2sNpnIER6LDTNJ/4yjdHmMdOBqNItKpfM8PjkU7YVcGRo7dVJfwftw==
X-Received: by 2002:a05:620a:408e:b0:7ca:f3c6:c0a1 with SMTP id af79cd13be357-7d3b2a8b8a7mr51103985a.55.1749663253984;
        Wed, 11 Jun 2025 10:34:13 -0700 (PDT)
Received: from [10.92.249.106] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754968sm911678066b.37.2025.06.11.10.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 10:34:13 -0700 (PDT)
Message-ID: <8155d605-c759-4645-a82a-15ef65f95e66@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 20:34:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: Fix bindgen includes
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
References: <20250610142413.681911-1-zboszor@gmail.com>
 <CAO9ioeUn24ndJqaH1O8B0G+mB8JKx_JcROXhzJqrw36L84bmNw@mail.gmail.com>
 <8e9387de-14f0-4def-a41e-3b8aeaa178a0@gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <8e9387de-14f0-4def-a41e-3b8aeaa178a0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6849be17 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8
 a=M6Qo5mDz2_i3xHLlW5cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: fiP1iRsfE1vuGSuyh-PXSE_ILaiePkrw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDE0OCBTYWx0ZWRfX2p8+MhITfs+i
 Vj3j3f6PD2XeNxfLe0B6DA7F3vaReisDmxtNaR2uVoM1cjUtNUnRlxh31oYCgWTKSEW6lc0nt2X
 DwasQw3Sf97eV0QyUs0nZJVdWbEkb1Lgyby2TcYzsrlvEG+tV7zB9fpenih+LHxZMF4edLMXeza
 eRdPRnVSadVVM88DXANj5kyvH5/wkonuZn3KAZ94jMEu4EawpU3n5dxNZGe9GLUnKY0SPdrDrIp
 +P4bBpaF9Rph+lrjgzyBcFjEGoCO7oLqF7d1oK3iXS2yPlcfQQfWj6n1hr2O/1ri010JtoYKZoS
 yPC+2A6P89AsxRX8+MRloB9xtD1l6wVDErhhNMkPh7pwibTcylii1enN+UKN0Ur5m5e7veqC6rJ
 5jfOazASszlc+UukJnXhuV2WWVJMP3u6oDY95OxwW/qX+cCPqzRS8F/dH4uJZ0aNjW1yKLmV
X-Proofpoint-GUID: fiP1iRsfE1vuGSuyh-PXSE_ILaiePkrw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=833
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110148
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 55B9DCP5027238
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 17:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218465

On 11/06/2025 13:46, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n wrote:
> 2025. 06. 10. 21:49 keltez=C3=A9ssel, Dmitry Baryshkov via=20
> lists.openembedded.org =C3=ADrta:
>> On Tue, 10 Jun 2025 at 17:24, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <=
zboszor@gmail.com>=20
>> wrote:
>>> Add a patch to fix bindgen errors due to not finding headers
>>> in the system, like:
>>>
>>> |...
>>> | ../mesa-25.1.2/src/gallium/frontends/rusticl/=20
>>> rusticl_llvm_bindings.hpp:1:10: fatal error: 'clang/Basic/Version.h'=20
>>> file not found
>>> | Unable to generate bindings: clang diagnosed error: ../mesa-25.1.2/=
=20
>>> src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp:1:10: fatal=20
>>> error: 'clang/Basic/Version.h' file not found
>>> |...
>>> | .../work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/include/./GL/=20
>>> glx.h:30:10: fatal error: 'X11/Xlib.h' file not found
>>> | Unable to generate bindings: clang diagnosed error: /data2/dtd-=20
>>> yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/=20
>>> include/./GL/glx.h:30:10: fatal error: 'X11/Xlib.h' file not found
>> Can we fix this on the meson side by passing additional include path
>> through the cross file?
>=20
> This seems to work in mesa.inc without patching Mesa:
>=20
> CFLAGS:append:class-target =3D " -I${STAGING_INCDIR}"
> CXXFLAGS:append:class-target =3D " -I${STAGING_INCDIR}"

My question was more about meson.bbclass, where we set=20
bindgen_clang_args. See the bindgen_args() function.

>=20
> but it also[1] prints this for some of the bindgen runs:
>=20
> clang diag: /home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/=20
> mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:95:11: warning:=20
> '__INT64_C' macro redefined [-Wmacro-redefined]
> clang diag: /home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/=20
> mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:96:11: warning:=20
> '__UINT64_C' macro redefined [-Wmacro-redefined]
>=20
> [1] Using the previously posted patch also prints the same.
>=20
> It seems to be caused by a meson bug because it doesn't
> collect the -isystem or --sysroot flags for rust/bindgen.
> See the discussion at the MR link in the patch.
>=20
> CFLAGS and CXXFLAGS changes are both needed because
> bindgen is run on both .h and .hpp files for rusticl.
>=20
>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
>>> ---
>>> =C2=A0 ...w-build-option-for-extra-bindgen-inc.patch | 57 +++++++++++=
++++++++
>>> =C2=A0 meta/recipes-graphics/mesa/mesa.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
>>> =C2=A0 2 files changed, 59 insertions(+), 1 deletion(-)
>>> =C2=A0 create mode 100644 meta/recipes-graphics/mesa/files/0001-rusti=
cl-=20
>>> Add-a-new-build-option-for-extra-bindgen-inc.patch
>>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#218438): https://lists.openembedded.org/g/=20
>> openembedded-core/message/218438
>> Mute This Topic: https://lists.openembedded.org/mt/113570520/3617728
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [zboszor@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20


--=20
With best wishes
Dmitry

