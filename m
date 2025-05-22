Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF16C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 16:04:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.27790.1747929832090971442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 09:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=elLXGT1r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7ju6f000811
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 16:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaNnKp4VarVZeflU0fp/8alXTXpmuol4iDk4Y1oT1L8=; b=elLXGT1rJkU/7/sl
	M2ncx511mgyn7KubvOChf46zq9ClC205PwPj5WODc1qUvYV5YKsmv+cSE6XwHS2g
	D3BiMyDM1k867p4sqWLScuTWTVIzu+ZxF+PZ6bmcg+a98vGH8SkcQ/OXZSkkg9BH
	/ZRgwvs50dA7rPZBN0UrX3pCgsrK5Qr9wjOti84UWY4BlTRZsTwQQSvL84mUfyqu
	PR3nK3SU0WK8lGH/onrRcARq5uM0+MNqmonbg0MoTL+obxcRNgJJhNMrzuVuADQz
	1D4PFGBJ7zV5RA2v/QiylCLMmLepoiqaJfcJQ5bqN5B9urEJH+JEJAuT8RMmdgW8
	tbK2KA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tn97q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 16:03:51 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3f7ade514c8so3075340b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 09:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747929829; x=1748534629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PaNnKp4VarVZeflU0fp/8alXTXpmuol4iDk4Y1oT1L8=;
        b=DMbLLI57wLNmA6A1iirgB0zBEy7JmntjzE3D8eV/BCBZHj06Qv2G0fy5J+qKxOP9hd
         +/Y99XstbYYyYcCDLLULrnbYqNCJaZvazJCGhwVGqoJTmfYq0oI0OgDgR0aEFCezoySK
         A0dxywdZFdp14DUpb6DlwPlczWC2/UegODZPdqtHU/GCqYhK5wApfpdPa2cgtUmheT1C
         qzTaBYKSMBakFniDYSzYlF1VJlg3/8ZwyCntgitDk6CUivZe7Qi5FHVN8Thd0rwRmrrF
         kDhG0YOYbGqyj7Bd/aLjPJOovpdbQsQaOFevvL00rBGkRMOj77cBD//XjrJThBkVst2a
         /67w==
X-Forwarded-Encrypted: i=1; AJvYcCXYkWxv/f0CpERGh3NgoRgfuHgrjhiTbCxwxRTyB+9h+aO5eMaFxn2D1wIaD7qCGt1xqYCS82B8VmIQwITkzLFkvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHA/LSWc+CQsBXHHYuT03C3St5JuZfxLN/XrGH8tGQIIJJoyEm
	jeiacnMsv+zgib3mBXuapuEgY5Plh31i3CVQpUrxlSIuIG23l0hFerGe/lqn6uiJ8tsQEAIir7b
	EPbB8CP/cjNHPpcMSjj3hxJgUVzjSZWQV7Oc5PKjFXKA4fTn30Jfs2HNmQJJ5pYluDINg9W1c+O
	MuoOV/rn5Ug0FqFK0=
X-Gm-Gg: ASbGncuOGgD9Btma8jQsWx9Q55+yuZ+scCb/ZdNFm7/9DDJo1D7tDoMkk7H9mTpY/UL
	EPB00nizk++fbJwW7n0hQmPVqT2v7TzseCd655Ejguh+qqa7VIznIEuZdOW5s6uRGLUBwnUp4Bn
	cJKTd1umrReO7msJ0Db+QwEbrlizxnPGOqZsUSfTEwxiA++61wMabQ8YkY/Dk8yKUSviQqah15u
	e1lj39M4SrFRbfVn34yF4FoBNKs55yE2drbpQMbtfmZNBye8BvyRrFcHmF151MLojGm9u+BLmJC
	fqzad86X6vQ1xqJad6fSU3kvoHs1IYP0t5OY288kg3oFeFy/ONcI/AjkQld7AbT2r2a6qHK9n2/
	Im1Fuil21TqBMzA==
X-Received: by 2002:a05:6808:80ae:b0:403:3e4f:1f3 with SMTP id 5614622812f47-404da6f63d1mr17588819b6e.7.1747929829542;
        Thu, 22 May 2025 09:03:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYsq4IOnzMc0eDwXBKr+eNQ25onbH++Dc3RN0yjSD4v6AHHpjtUU3SUWIX9q4BroKUlF4HuQ==
X-Received: by 2002:a05:6808:80ae:b0:403:3e4f:1f3 with SMTP id 5614622812f47-404da6f63d1mr17588763b6e.7.1747929829026;
        Thu, 22 May 2025 09:03:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f48f92sm3454604e87.105.2025.05.22.09.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 09:03:48 -0700 (PDT)
Message-ID: <e7990766-2aac-4557-a6b3-e321cdaf3965@oss.qualcomm.com>
Date: Thu, 22 May 2025 19:03:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 06/12] mesa: don't add extra tags to the
 libopencl-mesa package
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20250522144605.2876771-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250522144605.2876771-6-dmitry.baryshkov@oss.qualcomm.com>
 <566ce066-c7a7-48d6-97e1-592f06a82897@gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <566ce066-c7a7-48d6-97e1-592f06a82897@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f4ae7 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=V0lkJZ_3EcBjshiHxiUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: fZN16iFor5KZQcVdwKTvDMafy10T2pmr
X-Proofpoint-GUID: fZN16iFor5KZQcVdwKTvDMafy10T2pmr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE2MyBTYWx0ZWRfXzUPreoRjZltp
 gAWjaV0B5kn6uy9X30F8T5C+PK3uyTK/DXbhZxzUZ/JkCPRAqXEOujTdHSmccNTz9ocCJkorDBC
 dKeKc3cxcg2P/JqJcPgpvB+ulhawBHWQa/SQTKwCP7wPA7I66XVp8l4NgtYJgYQoyyiTdEnEoln
 270/Ra07rvo4ps2PKgt4Qb6QR+ZN2q4wL4Kms53B0CvKoxpsDqUXtt4sPss1D1zkmvKYAZbnEx1
 z9jTPwO4oAk95Nh87DH1Tjt0RyN76oEB/B/WUSfjPfc+K6e4RTJfHkHoS101IyI56EafBpxPLLf
 t3eDxknEJKuXRCBcvZ44XABaRMMMuB4Cg8iL0ifTN8CqaymWv8ze0vE4sCEN8FbNLmYowcelCNU
 Xu99f6PQ4PQ1zahdRWz+oNp67ifyN+8RAiWF+YHk+sFez/N6c4LjG07QviAW4y9Y8vKebEHd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220163
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 54M7ju6f000811
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 16:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217131

On 22/05/2025 18:01, Gyorgy Sarvari wrote:
>=20
>=20
> On 5/22/25 16:45, Dmitry Baryshkov via lists.openembedded.org wrote:
>> The libopencl-mesa package provides OpenCL ICDs (Installable Client
>> Drivers). As such, there is no conflict between several packages
>> providing ICDs for different vendors. Split the loop that modifies
>> package metadata and stop adding extra RPROVIDES / RCONFLICTS /
>> RREPLACES tags to the libopencl-mesa package.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   meta/recipes-graphics/mesa/mesa.inc | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphi=
cs/mesa/mesa.inc
>> index a309c8023bd2..98860a0d7d15 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -264,28 +264,31 @@ do_install:append () {
>>   # RPROVIDEs/RCONFLICTs on the generic libgl name.
>>   python __anonymous() {
>>       pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split()
>> +    mlprefix =3D d.getVar("MLPREFIX")
>>       suffix =3D ""
>>       if "-native" in d.getVar("PN"):
>>           suffix =3D "-native"
>> +
>> +    for p in ("libegl", "libgl", "libglx", "libgles1", "libgles2", "l=
ibgles3", "libopencl"):
>> +        fullp =3D mlprefix + p[1] + "-mesa" + suffix
> Is it supposed to be=C2=A0 "fullp =3D mlprefix + p...", instead of p[1]=
?
> Otherwise it's the same letter "i" over and over again.

Good catch. Too much refactoring here.

>> +        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadri=
ver" + suffix)
>> +
>> +    d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" % (mlprefix, suff=
ix), "1")
>> +
>>       for p in (("egl", "libegl", "libegl1"),
>>                 ("opengl", "libgl", "libgl1"),
>>                 ("glvnd", "libglx",),
>>                 ("gles", "libgles1", "libglesv1-cm1"),
>> -              ("gles", "libgles2", "libglesv2-2", "libgles3"),
>> -              ("opencl", "libopencl",)):
>> +              ("gles", "libgles2", "libglesv2-2", "libgles3")):
>>           if not p[0] in pkgconfig:
>>               continue
>> -        mlprefix =3D d.getVar("MLPREFIX")
>>           fullp =3D mlprefix + p[1] + "-mesa" + suffix
>> -        mlprefix =3D d.getVar("MLPREFIX")
>>           pkgs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:]=
)
>>           d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
>>           d.appendVar("RREPLACES:" + fullp, pkgs)
>>           d.appendVar("RPROVIDES:" + fullp, pkgs)
>>           d.appendVar("RCONFLICTS:" + fullp, pkgs)
>>  =20
>> -        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadri=
ver" + suffix)
>> -
>>           # For -dev, the first element is both the Debian and origina=
l name
>>           fullp =3D mlprefix + p[1] + "-mesa-dev" + suffix
>>           pkgs =3D " " + mlprefix + p[1] + "-dev" + suffix
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#217117): https://lists.openembedded.org/g/openembe=
dded-core/message/217117
>> Mute This Topic: https://lists.openembedded.org/mt/113248268/6084445
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[skandigraun@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20


--=20
With best wishes
Dmitry

