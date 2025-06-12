Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49670C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 08:08:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.7673.1749715728988022795
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 01:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=G7SEVAxK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C84tfH027165
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 08:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ceh+glryhWGkf6K+hv49YlSMG9XD7+ODsKARa9F094=; b=G7SEVAxKdsgf3Jwt
	lNR//RNMS7YJNO7/PKdNlYlVTJZaArwkqsBczxT4jTvRx0GqxxHjCA7XP4Ri1FO4
	L9ZuvOv9NYOLHO6gk7UeR5xgkBE+XZeNHGNszy2w1wSC70EK3eqqBeRsnEk7wyA4
	ydvMZPMu6aD+FX1EIaa4qYX0eF3OzN9+cHpbIBiPlJo44FaCNyw0IIdQRQOY1r90
	7LR/3/DCsL1d4MQCTIYy2EDDnRaBl6eTSkYjiR6jflrq/948o5yw6vwTDQkJMTqP
	iPGVEoIe2zCed2/+Rmij+XZV8rF4JkEk2Uduhl6237RKqxDACtwomBXavVTuu7og
	9re3QQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvfn2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 08:08:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5bb68b386so219986385a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 01:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749715717; x=1750320517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ceh+glryhWGkf6K+hv49YlSMG9XD7+ODsKARa9F094=;
        b=any+hC2WmTmJzBulf5qkkSiR/NLhAeVfKFTAATdgcgcVuzD8Sv2uFZjIeNdEDrARba
         XGnmRmWvvW3D5bIoFiKUs+ymBfSvoMZWWXNC+8YUBMI+NnrM/G0Yxlk/Y8c/CI8Z6NP+
         NTp0J/foO16ecbR1QLz/lK4RK1mtiOfxNq2CMTaq3r6YHkvFzs6xWPJkAkIXK2DJMS/p
         Vg/RW4wRlhdVjwsKJYUD2eiaabdXBBvP79gHi5Zqx3mMhIrBCwjGnXvteuVEuTnA7wUY
         Y60vj6CZYKhHBB6Kj+7DpsBrwNnP4fm7lfIFRElle6QE7MA1LyaWEQW1sX2SAmLWpuZ4
         pyLg==
X-Gm-Message-State: AOJu0Yzhq4HJvIggS8JQ2rPLcDU2SmGUYSZ4r4SyOUpl7Vz/jJNUzMtX
	r0aHX19d28/ymugdhQGYKM9IZTf1aoEKqmEUL8H9NAMM7Kw/n5le/NaXsuTzcoys5n9RGmlgK8C
	Hr+Fh/qEq6dv+f+8bTDiOUFQFGp2Hro0l8WyIzW6LGKFd4OqUiJyKYIkePa1P4UyYK1C/aOARYQ
	oniRs0rKs=
X-Gm-Gg: ASbGnctHv+Ebb687510y22wWQiqKtniNc61U1nKRt9xs7A2RBi9SS7KZykF+W15Qfux
	lhTVLr5C0uqDM7WYanx5A0oTH4dpO6w3mAFTtWwSenxcBJQHvwWGmq5n0lxrUHhkFpYcqd+SsXv
	VyHzqMMvVzj3kcPtu8Pakaahhc9eJbR8Ehpd132fxog+LrRKveOeVjFkK2IOraUMD+f4ZSsyP8q
	fwMaVBW7Un7opJE22pZKZMw0+O0JHvQv6tQy6lk51nFFoyxVpGONf2i7hwNghKdSnBdv+LFe9At
	KS/9jqbtgKPx01Pr+jP2UHEMZxKX/XOTc4wnTfF7FArnIfRFFCTKAGcsFE2/XRPfUoERxkLLZo/
	YR2uAtl8FOZNzktR/zQRWb3RC
X-Received: by 2002:a05:620a:4153:b0:7ce:f3fd:cc69 with SMTP id af79cd13be357-7d3b29fc080mr385065785a.19.1749715717332;
        Thu, 12 Jun 2025 01:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb57+Q567igysP8+uWEHO0JsLb21XhEXY61CyXGc+YHhbgj4yFYOyKNlaWZhLRN4UmIl3RIA==
X-Received: by 2002:a05:620a:4153:b0:7ce:f3fd:cc69 with SMTP id af79cd13be357-7d3b29fc080mr385062985a.19.1749715716809;
        Thu, 12 Jun 2025 01:08:36 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3320eaaasm1385861fa.111.2025.06.12.01.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 01:08:35 -0700 (PDT)
Message-ID: <6ce1ccba-2d62-4cb2-b327-9dd81a942765@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 11:08:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: Fix bindgen includes
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>
References: <20250610142413.681911-1-zboszor@gmail.com>
 <CAO9ioeUn24ndJqaH1O8B0G+mB8JKx_JcROXhzJqrw36L84bmNw@mail.gmail.com>
 <8e9387de-14f0-4def-a41e-3b8aeaa178a0@gmail.com>
 <8155d605-c759-4645-a82a-15ef65f95e66@oss.qualcomm.com>
 <63ef3071-74eb-4caf-a08e-77d91bf82c44@gmail.com>
 <CAO9ioeVE94tAha_o0Q1tcP-2LhD6YAVtLUMkqACr4q55=ahgVQ@mail.gmail.com>
 <96fc5917-bd69-41e3-892e-b683fd635b9e@gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <96fc5917-bd69-41e3-892e-b683fd635b9e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-ORIG-GUID: CDKlZA6k6jznJIwzaq9xVOwj2jy54BoV
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=684a8b10 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=-wQqb4ZEc6nhM_m6cpYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: CDKlZA6k6jznJIwzaq9xVOwj2jy54BoV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA2MiBTYWx0ZWRfXws2ObpIYKDwL
 FmoobWoPNm2lJLXeK6dGn96DdJuZsJuAa16qRl/t/kQ39rEiaQRFat43c7ucc0olYJTAVWEgRK+
 hLx0J7jdDtNMllwA3KiRW/qQw3jI5zw1dh2eeoO/Maf1h3jtWAKR5KBPj3wjzbP+jrut70vLLJ+
 SK3fzM9dOnz60wPj4OikNeRSy81hELC4NhriAVZI5Aevsny+8X7Uk7KsttIDl70BUGHV3YdL7Jf
 PawXMQQG2QI97PdNibYmknQqUXYtcDP8Csk6fQMQFJCRByQXSgFB5//pKkdnQ88OtjQ66Y0iK7C
 aWch3rZKACvksNcBGoNvjUNCLqRji/K5eHTRbRokMD+9YjcGTnVu/PpBhCCPZfXJigduW5Fbwa+
 6jV/J04yBOLChtXCrnWnrlZLiAgmNudEsOAeTp13qVe1QtLWKFYykce5mmCRzfbLpmm8v+Wg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120062
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 55C84tfH027165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 08:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218485

On 12/06/2025 07:23, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n wrote:
> 2025. 06. 11. 21:32 keltez=C3=A9ssel, Dmitry Baryshkov =C3=ADrta:
>> On Wed, 11 Jun 2025 at 21:36, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <=
zboszor@gmail.com>=20
>> wrote:
>>> 2025. 06. 11. 19:34 keltez=C3=A9ssel, Dmitry Baryshkov =C3=ADrta:
>>>> On 11/06/2025 13:46, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n wrote:
>>>>> 2025. 06. 10. 21:49 keltez=C3=A9ssel, Dmitry Baryshkov via=20
>>>>> lists.openembedded.org =C3=ADrta:
>>>>>> On Tue, 10 Jun 2025 at 17:24, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9n=
yi=20
>>>>>> <zboszor@gmail.com> wrote:
>>>>>>> Add a patch to fix bindgen errors due to not finding headers
>>>>>>> in the system, like:
>>>>>>>
>>>>>>> |...
>>>>>>> | ../mesa-25.1.2/src/gallium/frontends/rusticl/=20
>>>>>>> rusticl_llvm_bindings.hpp:1:10: fatal
>>>>>>> error: 'clang/Basic/Version.h' file not found
>>>>>>> | Unable to generate bindings: clang diagnosed error: ../=20
>>>>>>> mesa-25.1.2/
>>>>>>> src/gallium/frontends/rusticl/rusticl_llvm_bindings.hpp:1:10:=20
>>>>>>> fatal error:
>>>>>>> 'clang/Basic/Version.h' file not found
>>>>>>> |...
>>>>>>> | .../work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1.2/include/./=20
>>>>>>> GL/ glx.h:30:10:
>>>>>>> fatal error: 'X11/Xlib.h' file not found
>>>>>>> | Unable to generate bindings: clang diagnosed error: /data2/dtd-
>>>>>>> yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/mesa/25.1.2/mesa-25.1=
.2/
>>>>>>> include/./GL/glx.h:30:10: fatal error: 'X11/Xlib.h' file not foun=
d
>>>>>> Can we fix this on the meson side by passing additional include pa=
th
>>>>>> through the cross file?
>>>>> This seems to work in mesa.inc without patching Mesa:
>>>>>
>>>>> CFLAGS:append:class-target =3D " -I${STAGING_INCDIR}"
>>>>> CXXFLAGS:append:class-target =3D " -I${STAGING_INCDIR}"
>>>> My question was more about meson.bbclass, where we set=20
>>>> bindgen_clang_args. See the
>>>> bindgen_args() function.
>>> I wouldn't change meson.bbclass because it works for the
>>> most recipes already.
>> The bindgen_args was implemented for mesa as the first user. It is not
>> frequent for the packaged software to use rust.bindgen.
>>
>>> Besides, it seems to be a meson bug, not a meson.bbclass bug
>>> as -isystem and other include path related flags (besides -I) are
>>> ignored in CFLAGS/CXXFLAGS.
>>>
>>> The "clang diag" messages are likely coming from mixed up host
>>> vs target header paths.
>>>
>>> See
>>> https://gitlab.freedesktop.org/mesa/mesa/-/=20
>>> merge_requests/35435#note_2952621
>>> https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/=20
>>> rust.py#L392-L397
>>>
>>> If we changed meson.bbclass to add -I${STAGING_INCDIR} to
>>> the proper places in meson.cross, it would still print the
>>> clang diag warning. Adding -isystem would still get ignored.
>> Are we ta
>=20
> ???
>=20
>>> FWIW, --sysroot is also ignored by meson and adding it forcibly
>>> throws a different error. See
>>> https://gitlab.freedesktop.org/mesa/mesa/-/=20
>>> merge_requests/35435#note_2952805
>> How were you passing it? Via CFLAGS / CPPFLAGS or via bindgen args?
>=20
> Using=C2=A0 this patch and -Dbindgen-sysroot=3D${STAGING_DIR_TARGET}
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35435/diffs?=20
> commit_id=3Da82381aeaba32775db51080b823893e4b6f647fb
>=20
> --sysroot is not passing through to bindgen from CFLAGS/CXXFLAGS
> due to the filtering of flags in meson by the already qouted code piece=
 at
> https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/=20
> rust.py#L392-L397

Can we pass those flags via bindgen_clang_args? If I understand=20
correctly, then they will bypass all the filtering.

>=20
>>> =C2=AF\_(=E3=83=84)_/=C2=AF
>>>
>>>>> but it also[1] prints this for some of the bindgen runs:
>>>>>
>>>>> clang diag: /home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/
>>>>> mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:95:11: warning:=20
>>>>> '__INT64_C' macro
>>>>> redefined [-Wmacro-redefined]
>>>>> clang diag: /home/zozo/yocto-5.2/tmp-sicom/work/corei7-64-oe-linux/
>>>>> mesa/25.1.3/recipe-sysroot/usr/include/stdint.h:96:11: warning:=20
>>>>> '__UINT64_C' macro
>>>>> redefined [-Wmacro-redefined]
>>>>>
>>>>> [1] Using the previously posted patch also prints the same.
>>>>>
>>>>> It seems to be caused by a meson bug because it doesn't
>>>>> collect the -isystem or --sysroot flags for rust/bindgen.
>>>>> See the discussion at the MR link in the patch.
>>>>>
>>>>> CFLAGS and CXXFLAGS changes are both needed because
>>>>> bindgen is run on both .h and .hpp files for rusticl.
>>>>>
>>>>>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gm=
ail.com>
>>>>>>> ---
>>>>>>> =C2=A0=C2=A0 ...w-build-option-for-extra-bindgen-inc.patch | 57 +=
++++++++++=20
>>>>>>> ++++++++
>>>>>>> =C2=A0=C2=A0 meta/recipes-graphics/mesa/mesa.inc=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +-
>>>>>>> =C2=A0=C2=A0 2 files changed, 59 insertions(+), 1 deletion(-)
>>>>>>> =C2=A0=C2=A0 create mode 100644 meta/recipes-graphics/mesa/files/=
0001-rusticl-
>>>>>>> Add-a-new-build-option-for-extra-bindgen-inc.patch
>>>>>>>
>>>>>>
>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>> Links: You receive all messages sent to this group.
>>>>>> View/Reply Online (#218438): https://lists.openembedded.org/g/
>>>>>> openembedded-core/message/218438
>>>>>> Mute This Topic: https://lists.openembedded.org/mt/113570520/36177=
28
>>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/=20
>>>>>> unsub [zboszor@gmail.com]
>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>>>
>>>>
>>
>=20


--=20
With best wishes
Dmitry

