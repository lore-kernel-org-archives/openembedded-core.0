Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7D8C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 17:32:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.41590.1753896713723218551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 10:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=pK1mHshe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCb7AS030235
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 17:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NupK5ZXHzC2XLPge9nDBNAFnmEIKlwEEqPG6LdxoOFg=; b=pK1mHshen7irYbnG
	61kxzOQ0vr+7F2Dht8k026WcSFJhm688nWTeRTMvUdQdQhIBus6SOq1Bq6cHT5vh
	Mw6ru7pF5Crrv+tA+fOUzj+1wo0QoqfTT4YkcHhHtbmN06ITjoeeuP/A8kzBsgby
	M636grIwCCxJLHJhU5oazZP9UEtcahy7pMB5X9RFgLi5BTRsV2GITwyMM86Pz89O
	aKLkZlxriJJDf9igaCp80MW/hN5jR9mEygSZiEWlHRSouRJu27nTzo4JLQ//ci17
	SMXgBkBC5FPQZYn/6mmakDc5dBybVuklJDzYzPxKVhT3hzIfllKtti+mgBQ+i9l4
	WMPpUw==
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 487jwes46e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 17:31:52 +0000 (GMT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3e401ca74fbso106065ab.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 10:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753896711; x=1754501511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NupK5ZXHzC2XLPge9nDBNAFnmEIKlwEEqPG6LdxoOFg=;
        b=YG0fmYAT3Q7uR8RvVFObhL0B0JXH58arr4lwMwgyETdxxtLOM2VYNFMpip+vfKRioq
         AtsNJhGzq4iQPvJzKGs9HpC6XIRkX3UaSDWYbfXFbsxIYqiTg87tKSy+B5+gYJH8jl8O
         /VLWf1UOZu+l2CWT87YznMSyMplNcbWe7thSRdduiDM3DgR5gYXYxKtCbhvT3IWbOo44
         twu5tImEruEplsPFsHSKD5yxj0v7VxAXTTRcl5ff81e1mAoho3L7MCpgopGgEkx5tlVh
         wxwUL2+UwcOKsmz9932XyPTVKZ507C2Swfv15apVX+s0Qi3+g8ZvdH5hwsLH26Xhn5qA
         i8VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn4Ov3yR9hXsvX1oGBg+t+GySBpaSQQw6F7TMdsqVyWHRzx/BO6UIHFdNsEmTM6Ejmg1Bs+CK4x97wFqKklt6Y9w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxUl0tHb7/Ggrn9DUcx+oj7ej8w6awAHMNMMlibUTGFu+2eD0mx
	ff2SGx+/ijx2WfQrJZDKtr15fy3wm2DosW6CXVhGqkcxVmOxweKnqQvCNMCpesQ7AJ2WH7pLNJl
	ztpTaxUtYvizysCkwd14aiah7zpvkMnGX2QCrlgE9mu3nsTQn6m1qHLeCJOLsNRpjwciML0oc+P
	ftc8sATs4=
X-Gm-Gg: ASbGncv1duiFBjBRzX2i034MceIDcNZ7NhKycHv+72JBkRDMYMmaQNMnzS9UsPCIFPH
	53IRfcxSIXjCo5eu9Rie+RJA5bC1CZLabxqTzTce3DTBsAR/tXrafm2FCX2zo4Sz3WZCKF/l9U9
	Tb6q8aUQ4j/9au0Fsr/aRH0k0B17OsRye13ag1lflI+CJi6MqJQT6SnATeVvWF/wpyD7mymEJGr
	/ltSBF3a3+08Z/0vlct6iLQV3Q0mpwCFDopaU6f6t+oa98MeVJjXN+tS//MhBSQWpXKzcGtkLuU
	jeM8mA6cY4jtzhgRbSlhxpEZbDRqNcmL3owDvm+y247/q/iMRTOhXkQ/ZLkrNMiJKh4TV6m6DCt
	CgAPY2xnQut/E9w==
X-Received: by 2002:a92:db0e:0:b0:3e2:ac27:6ba with SMTP id e9e14a558f8ab-3e3f62b80dcmr60974385ab.19.1753896711362;
        Wed, 30 Jul 2025 10:31:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH80I5n96fuzeImo5y/DCNvY4xYed9Z1dM4XceNqx8kxsgJW0h/8/QYIYy8XAqkVBFPT43kA==
X-Received: by 2002:a92:db0e:0:b0:3e2:ac27:6ba with SMTP id e9e14a558f8ab-3e3f62b80dcmr60974075ab.19.1753896710831;
        Wed, 30 Jul 2025 10:31:50 -0700 (PDT)
Received: from [10.148.43.238] (87-95-32-33.bb.dnainternet.fi. [87.95.32.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63375ab0sm2230174e87.138.2025.07.30.10.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 10:31:50 -0700 (PDT)
Message-ID: <9ffce38b-b3ce-4d86-9f39-486c8b53bdcd@oss.qualcomm.com>
Date: Wed, 30 Jul 2025 20:31:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 6/9] mesa-gl: drop egl/gles from default
 PACKAGECONFIG
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+yocto@0leil.net>,
        openembedded-core@lists.openembedded.org,
        Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
        Ross Burton <ross.burton@arm.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de>
 <20250729-mesa-libclc-panfrost-v3-6-42559ddc93ef@cherry.de>
 <t7yu2iynfa5vewdnzliamq7u3b5ufppjpanm53n46m7pqhtop2@a2y2gfbu2lud>
 <8df98858-1aac-4314-ac6e-b43b7593aee5@cherry.de>
 <CAO9ioeU7ZLuh4GgizRestPgq_ztRjh6we2pnAEQ2Q_BYit_otg@mail.gmail.com>
 <549ab43e-1d0b-4142-b3c8-bc1ad56faf97@cherry.de>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <549ab43e-1d0b-4142-b3c8-bc1ad56faf97@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-ORIG-GUID: xZQ414m-ZihyWGPfpdp10IKfdrii_J2F
X-Authority-Analysis: v=2.4 cv=Wv0rMcfv c=1 sm=1 tr=0 ts=688a5708 cx=c_pps
 a=i7ujPs/ZFudY1OxzqguLDw==:117 a=H8T8cKqSsIHj2cBiWKmgXw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=SyhUpZAXZolwjzbh1msA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Ti5FldxQo0BAkOmdeC3H:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: xZQ414m-ZihyWGPfpdp10IKfdrii_J2F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDEyNiBTYWx0ZWRfX1PJ58uS+s4DH
 0av90nfUpSz2DbkIre261NLjm4SUF0l3agHqycrMKD6QMI/E35jcpY0kx6+hsp4cpEL+8qaXnlW
 TIBUOdmIDlX7/aPINtKB4bPyeAPqbILt1J9eojV4NCQA1/rigoBAqCXfYc0bDBOCDiAvQ9mT6of
 dUMC5kce1H+h/tLu1sdUQ1igGmMzU/KSjdq8QoIbRjM/7gDSptfDOQ6bCAMYz5RMSHmd7JCt91M
 MjQbDfw45x6IhuuF22/2H/t+3EGlFHg1KR0YhdM4Qf9V+lr9Uiy3KVvFSoASYSggn/tdCj8jqxv
 baPbp7SHbv4OvkKzDFz7ZhQf/G07d52Wzd6Zmnt7uabK3A1ADWNzJrRVokWPfguBAnt2XaolsB3
 2iJ68fEVabrXOGBhDl4GZaweVWENhKF7UA1LsSTMV9O9bwWRP50CZ0OMq3IZluGqArV6xtvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_05,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300126
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 56UCb7AS030235
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 17:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221137

On 30/07/2025 12:20, Quentin Schulz wrote:
> On 7/29/25 4:46 PM, Dmitry Baryshkov wrote:
>> On Tue, 29 Jul 2025 at 14:07, Quentin Schulz=20
>> <quentin.schulz@cherry.de> wrote:
>>>
>>> Hi Dmitry,
>>>
>>> On 7/29/25 1:02 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Jul 29, 2025 at 11:36:27AM +0200, Quentin Schulz wrote:
>>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>>
>>>>> According to the introducing commit log[1] and Dmitry's=20
>>>>> recollection[2],
>>>>> the whole point of mesa-gl recipe is to provide GL library in case=20
>>>>> there
>>>>> are vendor-provided GLES libraries.
>>>>>
>>>>> Therefore, let's remove EGL and GLES default PACKAGECONFIG as if=20
>>>>> people
>>>>> really need them, they likely should be using the full mesa target
>>>>> recipe and not mesa-gl.
>>>>>
>>>>> [1] https://git.yoctoproject.org/poky/commit/?=20
>>>>> id=3D015cb13a67c672de30f5384dab5ab4b8db305281
>>>>> [2] https://lore.kernel.org/openembedded-=20
>>>>> core/5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6s=
n/
>>>>>
>>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>>
>>>> Please squash this into patch 1, otherwise you are fixing an error t=
hat
>>>> you've just introduced.
>>>>
>>>
>>> I've not introduced it, it's been like this for years already, I'm ju=
st
>>> moving things around in patch 1.
>>
>> Yep... Maybe then this can be a separate commit before #1 - fix
>> mesa-gl PACKAGECONFIG.
>>
>=20
> Actually we can do better I believe. In patch 5, I remove support for=20
> native and nativesdk support, so I can make :class-target the default=20
> without an override and remove :class-native as well.
>=20
> Essentially, we wouldn't modify anything in terms of behavior until we=20
> remove support for native/nativesdk recipes (hence no need to actually=20
> fix the PACKAGECONFIG value for native/nativesdk). Does that work for y=
ou?
>=20
> Would look like:
> """
> commit 0656461de69559057c7c5d49f124ac2702920e0f
> Author: Quentin Schulz <quentin.schulz@cherry.de>
> Date:=C2=A0=C2=A0 Tue Jul 29 11:15:23 2025 +0200
>=20
>  =C2=A0=C2=A0=C2=A0 mesa-gl: make recipe target only
>=20
>  =C2=A0=C2=A0=C2=A0 According to the introducing commit log[1] and Dmit=
ry's=20
> recollection[2],
>  =C2=A0=C2=A0=C2=A0 the whole point of mesa-gl recipe is to provide GL =
library in case=20
> there
>  =C2=A0=C2=A0=C2=A0 are vendor-provided GLES libraries.
>=20
>  =C2=A0=C2=A0=C2=A0 Therefore, let's make this recipe target only by re=
moving the
>  =C2=A0=C2=A0=C2=A0 BBCLASSEXTEND variable.
>=20
>  =C2=A0=C2=A0=C2=A0 Because it is a target-only recipe, we can make cla=
ss-target overrides
>  =C2=A0=C2=A0=C2=A0 the default value of the variable(s) and remove the=
 class-native
>  =C2=A0=C2=A0=C2=A0 override.
>=20
>  =C2=A0=C2=A0=C2=A0 No intended change in behavior for the target recip=
e.
>=20
>  =C2=A0=C2=A0=C2=A0 [1] https://git.yoctoproject.org/poky/commit/?=20
> id=3D015cb13a67c672de30f5384dab5ab4b8db305281
>  =C2=A0=C2=A0=C2=A0 [2] https://lore.kernel.org/openembedded-=20
> core/5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn/
>=20
>  =C2=A0=C2=A0=C2=A0 Suggested-by: Ross Burton <ross.burton@arm.com>
>  =C2=A0=C2=A0=C2=A0 Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com>
>  =C2=A0=C2=A0=C2=A0 Signed-off-by: Quentin Schulz <quentin.schulz@cherr=
y.de>
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-=20
> graphics/mesa/mesa-gl.bb
> index bdb4920572..e4e66a762d 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl.bb
> @@ -6,19 +6,8 @@ PROVIDES =3D "virtual/libgl virtual/mesa"
>=20
>  =C2=A0TARGET_CFLAGS =3D "-I${STAGING_INCDIR}/drm"
>=20
> -PACKAGECONFIG =3D " \
> -=C2=A0=C2=A0=C2=A0 gallium \
> -=C2=A0=C2=A0=C2=A0 video-codecs \
> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan w=
ayland glvnd',=20
> d)} \
> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '=
opengl egl gles=20

I'd really prefer not to get egl / gles into mesa-gl at all. Would it be=20
possible to do it other way around first drop native / nativesdk classes=20
in mesa-gl, then move PACKAGECONFIG?

> gbm virgl', '', d)} \
> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', '=
zink', '', d)} \
> -"
> -
> -PACKAGECONFIG:class-target =3D "opengl gallium=20
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> +PACKAGECONFIG =3D "opengl gallium ${@bb.utils.contains('DISTRO_FEATURE=
S',=20
> 'x11', 'x11', '', d)}"
>=20
>  =C2=A0PACKAGECONFIG:append:x86 =3D " libclc gallium-llvm intel amd nou=
veau svga"
>  =C2=A0PACKAGECONFIG:append:x86-64 =3D " libclc gallium-llvm intel amd =
nouveau=20
> svga"
>  =C2=A0PACKAGECONFIG:append:i686 =3D " libclc gallium-llvm intel amd no=
uveau svga"
> -PACKAGECONFIG:append:class-native =3D " libclc gallium-llvm amd nouvea=
u=20
> svga"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
>=20
> """
>=20
> Cheers,
> Quentin


--=20
With best wishes
Dmitry

