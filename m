Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751AFC369B1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:07:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.14671.1744794458329895201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NM8Ac5U5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7JdKD022289
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 09:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNJRXsZrXB1JlC8PxMe4lQnt9+GKSaMDOrMsr/XcGkM=; b=NM8Ac5U5ywGOfbtH
	hNrfm9KPr50BB5BUcwpmiLigOqfBFBR5sQRj86JC3vtP33ArK7p3lAjj9UFFq0zr
	Cuktp35BjoauI5p7zTYbni0B42IA2h6PE7/GdCKATUtXjq1jIOVF701OaOoHOM1W
	B5txZu/Jw2fsDyBS8aU+/aIkoiLqOP+z71y4bIsLJKZ73pKjXrUV2jJr9Ln/S6Z1
	bVYIKB+WxyDFf2zVHVIT0xgXmO/tJndoCPcvT1KTwUUoT3d+elpLbJ7nMp5DvsDW
	Bk8k+7hmWyl5cn5KqICI2V2kS/EYuc9q4T+jClTNgpx1Mneqf985wttYDD1lHl0f
	q/by2Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjjwam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 09:07:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eeffdba0e2so120605986d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 02:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794456; x=1745399256;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNJRXsZrXB1JlC8PxMe4lQnt9+GKSaMDOrMsr/XcGkM=;
        b=YaaTGestyLkyByQ6Bd6c1vkj+U2puoS5V8tt77uUJFtnqndet2MYNMSuXjCF0SaqnM
         RZRydeia6ANBgfRwazgHrFYqbeXZeTWLqEvebW2DXcLVQZ8fkN2JUHgjk19CCRU8+d/X
         apHfO52shZy4skxBVOU+N5ht7f7B5wx/JFejP6WNEdS+Hjs2WxqpWqF3zGlvHUQ8n5RL
         J7L0doqbxUNf+gic8T1FDueo3ETfuTCnVDqZYJ3tWdQoi9dHJZ5TLBG59/2Lg3CRcKta
         DUqjfxMlfeNANOtNf/RBugo5cf1qjDSqvUA+TP34hYOA7tXTIgyaNlQE8egeifZdgH/m
         ebLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/SsX5MwPOY3qe/L6mKXisrowgUeYZ6EdZZN7mtbtUz/jdXCboLoGDKRp7QI5qog30bdWbKYke13us0iTEjFLfLg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzev0kGdJMJppez7qWzNHEAOi7rehi9GBNILmhl2C+ve1SQefuZ
	5jiXkXtUkq6eseig+ekJKmZjIayTQny+cU3SBqmB3kCDwIki6TVurn5t1czTPb03Be9dS9+5tBp
	Yq3fD1nW0j4Hk3hfKrelgW5KQuCZVE/+miE8VjbNVgl8RGZo/IkNNmgcO0ZX5R8IMKQgnbid+ya
	xTOzY=
X-Gm-Gg: ASbGncsWSRb521tv+z7x3NLc81FrXziuKc9BGUl/hyMwggesMWmh6N/LAJw4usJtX3S
	YoV7BvWZmcphhUvH7DIa5zsMkgJlwcQLrDzMVQMyNsOz2iEhSerRPh4gfItI0yTCUbLtAbnE+DW
	xCCrwfTcc3hiu8mXyEOfWZ9/Wm62buDuTxLRQTa1Jugz7LKqjl4wgU1KhnIMTUmedb4lsWpsnbt
	YfD4uD2u/uz3RjIxNF37HrG6B0UaHElH3HYyqw7WC/Gw+RT4rMy1T7+Q/BHMMXZY0rO47AZEA6J
	0psBLtpvCkGSQQP0C1Wfbe29Gfl82toTn3rLNPlY+KFU96XmoS71rb7AbJLg14OE5m4=
X-Received: by 2002:a0c:f9d1:0:b0:6f2:b551:a63 with SMTP id 6a1803df08f44-6f2b5510ca7mr4759116d6.3.1744794456529;
        Wed, 16 Apr 2025 02:07:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiXi3o4DYMdpfx+05s0JoK01xWrTEQSwdCEli6E4jE2ufo0sH2zm0tx/Lo8EijHNlYbdCe5g==
X-Received: by 2002:a0c:f9d1:0:b0:6f2:b551:a63 with SMTP id 6a1803df08f44-6f2b5510ca7mr4758906d6.3.1744794456119;
        Wed, 16 Apr 2025 02:07:36 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f068aa9sm8025563a12.33.2025.04.16.02.07.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:07:35 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <Z_9JcY4ANLN7SPvJ@nuoska>
Date: Wed, 16 Apr 2025 11:07:25 +0200
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Adrian Freihofer <adrian.freihofer@gmail.com>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
        "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A570EC23-F4A6-4730-9B91-F24DD960F120@oss.qualcomm.com>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org>
 <8ae24df9-f1ae-44a9-a4f3-7d8aa273a335@topic.nl> <Z_jy0-3v8qVSyll8@nuoska>
 <960572ae-f816-4d55-b935-8e11e2dad89f@topic.nl>
 <CAB3asfhjnUAm-sB=Q4mk9whXUMdgaBZk0kwiwYKKyPJ0ydnU2w@mail.gmail.com>
 <Z_4sMeEiHjZ8ydfs@nuoska>
 <DB5PR02MB102130E10617CF99E82F6A94FEFB22@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <Z_9JcY4ANLN7SPvJ@nuoska>
To: mikko.rapeli@linaro.org
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-GUID: Uj6x69znZO4slmqNtCQTOZt0ULMSHspf
X-Proofpoint-ORIG-GUID: Uj6x69znZO4slmqNtCQTOZt0ULMSHspf
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67ff7359 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=IQEsc5u+BqvcbVO/417rXg==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=Z6EfDJrRAAAA:8
 a=ml08fzKUmNGtWPaAStgA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=GLvejNd0Yr38jcbvy3o4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 09:07:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214983



> Op 16 apr 2025, om 08:08 heeft Mikko Rapeli via lists.openembedded.org =
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> het volgende =
geschreven:
>=20
> Hi,
>=20
> On Tue, Apr 15, 2025 at 04:20:50PM +0000, Peter Kjellerstedt wrote:
>>> -----Original Message-----
>>> From: openembedded-core@lists.openembedded.org =
<openembedded-core@lists.openembedded.org> On Behalf Of Mikko Rapeli via =
lists.openembedded.org
>>> Sent: den 15 april 2025 11:52
>>> To: Adrian Freihofer <adrian.freihofer@gmail.com>
>>> Cc: openembedded-core@lists.openembedded.org; =
mike.looijmans@topic.nl
>>> Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support =
by default
>>>=20
>>> Hi,
>>>=20
>>> On Mon, Apr 14, 2025 at 06:28:13PM +0200, Adrian Freihofer wrote:
>>>> Hi Mikko
>>>>=20
>>>> Would it be possible to provide some numbers on the impact on the =
size of
>>>> the binaries and the additional dependencies that could be added to =
the
>>>> image with or without efi enabled?
>>>> I think the patch would be a very good compromise if the impact is
>>>> negligible, but otherwise the question is probably still valid.
>>=20
>> I have probably missed something in this very long thread, but what =
is the=20
>> reason to force EFI support on us rather than relying on the efi =
distro=20
>> feature? We do not use EFI in any of our products and thus do not =
have it=20
>> set in DISTRO_FEATURES. If it is suddenly expected that EFI support =
should=20
>> be enabled all over the place it just means I will have to go hunting =
for=20
>> it to turn it off rather than just relying on the existing distro =
feature.
>=20
> Is it ok for Richard to enable "efi" in poky/poky-altcfg =
DISTRO_FEATURES
> by default?
>=20
> It is already enabled in MACHINE_FEATURES for oe-core machines I care =
about.
>=20
>>>=20
>>> The impact is small:
>>>=20
>>> * python3-pyelftools-native is added to build dependencies
>>>=20
>>> * At runtime the efivars partition is now automatically mounted =
read-only by
>>>   systemd to /sys/firmware/efi/efivars and can be used to query =
various firmware
>>>   and EFI bootloader (grub, systemd-boot) details
>>>=20
>>> * Since "efi" is now default, other layers can stop enabling it:
>>>=20
>>>   =
https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-core/systemd/s=
ystemd-efi.inc
>>>   =
https://git.yoctoproject.org/meta-security/tree/meta-tpm/recipes-core/syst=
emd/systemd_%25.bbappend#n5
>>>   =
https://github.com/Wind-River/meta-secure-core/blob/master/meta-efi-secure=
-boot/recipes-core/systemd/systemd-efi-secure-boot.inc
>>=20
>> But isn't the problem here rather that these layers want to force EFI=20=

>> support instead of using, e.g., REQUIRED_DISTRO_FEATURES =3D "efi"?
>=20
> These layers want to enable EFI support but don't want to change the =
poky/poky-altcfg
> distro settings.

So it sucks to be them, they can't have their cake and eat it as well. =
If you want 'efi' in your DISTRO_FEATURES, add it to your =
DISTRO_FEATURES. That is what is so great about OE: you can very easily =
create your own, optionally derivative, DISTRO.

regards,

Koen=

