Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AD5D20682
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 12:57:25 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42763.1764853036001868525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 04:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=G18F0Qrx;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=ONQ7Gvoe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEr7P926176
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 12:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TEKayXRiLhOfbg76WooLxpAyOAALL1ZoipMeUDT9Yik=; b=G18F0QrxF6XMu1xF
	a2FoAMLD983q8JQdtHVxeZJwrNXndeHWCoCLkrIV1dKmBWTbGRSF6qeREj2CHDIr
	QcvpC6igokfSuu2vSqeB0EDN8w92/FkwQPvnXaE5ORebxMQm2BMDlho1bKAvHGeo
	G+sPRzvLZYniR1xd6jWPqiqZ62pnt1JRGwtneHrFM2z2UC+wV7uQRu4myfNIADNt
	fK2AFjT5amvy/CUyMtNb69e757H0N/iWplRCa0p7vfm4lEsbfjtpOGQ3NHQEgYOq
	vsmaL8/0POuyMVOa83ObKVIlss9ilVcxeCQ7iUca8SARy8Y/MkTVvOxzUQRXDsoH
	TE8pLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5m311q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 12:57:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24383b680so312336385a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764853034; x=1765457834; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TEKayXRiLhOfbg76WooLxpAyOAALL1ZoipMeUDT9Yik=;
        b=ONQ7GvoeYSnK0VzPiZNtH3HNq5Kr5OJYl6tBUbxp4+YOmhp8gr+Trj9EoHVt6qAdZj
         skQV+7bMZ0kI/NRAdeklfBcKLA7ixGDMiDN1qTfCgsbLGmvwpb6QMkWI4CzEJ21Zp+Tx
         xuS36LWx6jjflRZ1MLKGBBdPC1AEO0ZXc+U/dw7xcjbfooXsQqKlAEltoTtpzeMUWppl
         YayjBmeoRGtboqHB2maGiKJb9j3Xx9R/VHbmJAa1zHxSRc4z1sxp+/HKnQAwrm7XI3Ix
         W2GMniJ2uLmT3NtNtKPCU9lxKvvJp1aei1jw9asb4L4glqr9UnWOAABIsc+p8/1AQdbH
         7Y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764853034; x=1765457834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEKayXRiLhOfbg76WooLxpAyOAALL1ZoipMeUDT9Yik=;
        b=ubF8gt98XNq0b81MR5U8t2S/82qdGLKY4jGD+V5DG4e03pLtRiP6SUL4GafhS3L96u
         P4MEaS7gEBrqtHljRNyWg4btnH78X6b776r7cVVTbmMhhhUEMisK+IiIE7ven989hQqr
         zOkx3NbdGnNA57QKvU7/Y54Pxq15MtLEQ78krtfFJ5fHqqmWRdAeAYTanPRUFVrM7/Q1
         SF5JkU0N9lWKZf86uuanESqgee+hCSQVWbvS7kQqfn1iqU1HDFt/CZHosyrrLlai+AzP
         t2Utdg0vOPsARshd/LgSCqBYps6RXIIIA4j5p+DXnhAEcL40S/VOxyDf3NT8fwj05lee
         aA8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVR5jDW1iBPqDkkzfqY1BmBqeScqGldXJLAYvqzMK+oWXpsXiQuPa8G/9hcr6H3CchPI1XOh33Dbe5DIud7Mz4c9w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzLj6o6D6hd26x+kLqug5rll91thcNfzAD692LxitSsbFr9bEod
	wqPgZWecMIzdITNUdRqmWhFDtIRy2Vp534FvKZpvMgw5Mp3STTHzP/TMwfGByQYmdKTL0U/iCVJ
	DtKiToLgv22b7begO9qzxynjljjMyZ6VELhH2u/0qbZvEvFwYot4KuFwefMUDQdbS1jjEVdLoUj
	fi11xZCCM=
X-Gm-Gg: ASbGncsVGz9Cm8bVP/xM0lIrhniFwzl7sE0X4PGxMU7yOX1AjJZHJ6tBP/CLrkZb510
	GnDFCuNbfMyURMnoMSbZemQ6EQxbxaZlny/uXyULWwtYIhFQspR0WYI8l6c0HGyoOiGV1BlOzOu
	QDYDlY9aaT3Tz3N5fZ/1zrbiy7jGCD2PF9sjgXP4usw83oSuJXlzvqpMew+avBJ4NDokk4Qwj59
	POelkMSCqWM5e0eVvsEklpAfMp2hGU2ZQ0hsY8e5zIM95aNTjeXgE0313YFPqWU9zRIOzYyHy7b
	xjTBQ1ESE/KJdKK88JRtnMi6Geluo7Mcc9WJnVBOsGwJK0be7I+N0Q6xe2eFE1DECDlnPrh5zll
	eWcBdbbElSEoJ3fCv49Reg0WJ1G+WRHenx4LaamxN/1azR0OeCQisagpwu7+QfNsdP9OLS/zKvb
	V8YprqntelhGqw
X-Received: by 2002:a05:620a:2a15:b0:8b2:e284:1bd6 with SMTP id af79cd13be357-8b5e744f9e5mr843187185a.76.1764853034104;
        Thu, 04 Dec 2025 04:57:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+YwJKFec5FgU8/vhpaFBcv+BpVZFllZ2Ad4CoOlRqOG9OdPJOM5kXeV9QmYhS/WWkyEz+xg==
X-Received: by 2002:a05:620a:2a15:b0:8b2:e284:1bd6 with SMTP id af79cd13be357-8b5e744f9e5mr843182485a.76.1764853033404;
        Thu, 04 Dec 2025 04:57:13 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e70596bd4sm5300921fa.31.2025.12.04.04.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 04:57:12 -0800 (PST)
Message-ID: <4a332969-32ee-450b-ba25-34f2b5dec81b@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:57:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] mesa: upgrade 25.2.5 -> 25.3.0
To: Quentin Schulz <quentin.schulz@cherry.de>,
        openembedded-core@lists.openembedded.org,
        Ross Burton <Ross.Burton@arm.com>
References: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251202004951.2358784-4-dmitry.baryshkov@oss.qualcomm.com>
 <cdf76069-ffd1-4b7f-b164-0a8b4ab1f5f5@cherry.de>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <cdf76069-ffd1-4b7f-b164-0a8b4ab1f5f5@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-GUID: y7ROi18XkjRTj-_5a718L4sUPcgbpU0o
X-Proofpoint-ORIG-GUID: y7ROi18XkjRTj-_5a718L4sUPcgbpU0o
X-Authority-Analysis: v=2.4 cv=esHSD4pX c=1 sm=1 tr=0 ts=6931852a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ZpVaWaFtAAAA:8 a=Q4-j1AaZAAAA:8 a=2f9kOfnec1gUK_NDvKMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6P56k4kqNu8A:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=5tn4MO8azEBWFjlAA-rn:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwNSBTYWx0ZWRfX3PzjknKBP1kM
 LvtV4O/+mksF9F0SDElruZHVySkZ4fqX+jtqYfi74vvG5cLDzoelbAxOObxBLbkoDnrV8HbHFou
 4SKV2UmkVmA5MsNljsARldSw7kQDoQqLyVTppeHvRIAgvjAuWJQMeeJscPl6Asz7HaZN7fOgwRa
 /+HuRGo1fpt6WscfRjRxR7u8OQf5ab9glsT3NyT57dRQj5HtE+sm4YQAlA3e6LMYXgXjO8XIF6/
 ZYMHZsor/6Dv+uLnH+CnowDcXv+D+KcNjccHzKcc0PprNAw20hND4yBaRlpd+Bqzd5oWOa6M3D3
 T+hzoN/udkiVNtGAFCoQV+SZi6pUYHHVuLEUS/D9GrxT3jsP247wqBdsfyY0qQhIW4+C2QVgw1s
 6bC+cB7tvUYRp+dlTRdJfkIF3tpS8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040105
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5B4AEr7P926176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 12:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227293

On 02/12/2025 12:35, Quentin Schulz wrote:
> Hi Dmitry,
>=20
> On 12/2/25 1:49 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
>> Upgrade Mesa to the latest release. Drop VDPAU tracker (dropped
>> upstream). Add support for ethosu and rocket Gallium drivers.
>>
>=20
> Thanks for doing that!
>=20
> https://docs.mesa3d.org/relnotes/25.3.0.html for the release notes and=20
> checksum.
>=20
> I'm wondering if we shouldn't add the buildpath QA check to upstream=20
> mesa's CI so that we don't have to patch things up for every release?
>=20
> [...]
>=20
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-=20
>> graphics/mesa/mesa.inc
>> index 420ba2032b67..106767476ccc 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -18,10 +18,12 @@ SRC_URI =3D "https://archive.mesa3d.org/mesa-=20
>> ${PV}.tar.xz \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://0001-meson-misdetects-64bit-atomics-on-mips-=20
>> clang.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://0001-freedreno-don-t-encode-build-path-into-=20
>> binaries.patch \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 file://0001-gfxstream-don-t-dump-genvk.py-args-to-=20
>> generated-file.patch \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
001-ethosu-drop-file-names-from-the-generated-=20
>> file.patch \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
002-rocket-drop-file-names-from-the-generated-=20
>> file.patch \
>> =C2=A0 "
>> -SRC_URI[sha256sum] =3D=20
>> "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
>> -PV =3D "25.2.5"
>> +SRC_URI[sha256sum] =3D=20
>> "0fd54fea7dbbddb154df05ac752b18621f26d97e27863db3be951417c6abe8ae"
>> +PV =3D "25.3.0"
>=20
> Can we first bump to 25.2.7?
>=20
> We won't update mesa in whinlatter to 25.3.x I assume, so it'd be easie=
r=20
> if we had a commit we could backport for whinlatter right now before th=
e=20
> release (or right after for the first dot release).
>=20
>> =C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>> @@ -104,12 +106,14 @@ PACKAGECONFIG[amd] =3D ""
>> =C2=A0 PACKAGECONFIG[asahi] =3D ""
>> =C2=A0 PACKAGECONFIG[broadcom] =3D ""
>> =C2=A0 PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
>> +PACKAGECONFIG[ethosu] =3D ""
>> =C2=A0 PACKAGECONFIG[freedreno] =3D ""
>> =C2=A0 PACKAGECONFIG[imagination] =3D "-Dimagination-srv=3Dtrue,-Dimag=
ination-=20
>> srv=3Dfalse"
>> =C2=A0 PACKAGECONFIG[intel] =3D ""
>> =C2=A0 PACKAGECONFIG[lima] =3D ""
>> =C2=A0 PACKAGECONFIG[nouveau] =3D ""
>> =C2=A0 PACKAGECONFIG[panfrost] =3D ""
>> +PACKAGECONFIG[rockchip] =3D ""
>=20
> I'm not sure about the naming here. Rockchip also has Lima-supported,=20
> Panfrost-supported, Panthor-supporter, Panvk-supported GPU in various=20
> SoCs. I would expect that when selecting rockchip it would enable=20
> support for "everything" one can find on SoCs from this vendor, which=20
> isn't necessarily a good thing (c.f. amd and intel bringing in too many=
=20
> drivers you may not be interested in).

Yeah, I was trying to find a balance between having a per-driver=20
PACKAGECONFIG entries (which would be a nightmare for GL vs VK drivers)=20
and just declaring a "vendor", which enables all drivers, even if one=20
doesn't need it.

For Intel / AMD / NVIDIA it historically went somewhat okay, having just=20
a single vendor config entry.


For ARM-based systems... you know. We have 'lima' for the oldest=20
generation (gallium only), 'panfrost', which also enables panvk, now we=20
are getting 'ethosu'. I was tempted to merge all of them into a single=20
'arm' entry.

>=20
> I guess I would just name it rocket?

Why not. Ross, any opinion from your side?

>=20
>> =C2=A0 PACKAGECONFIG[svga] =3D ""
>> =C2=A0 PACKAGECONFIG[tegra] =3D ""
>> =C2=A0 PACKAGECONFIG[v3d] =3D ""
>> @@ -129,7 +133,7 @@ VULKAN_DRIVERS .=3D=20
>> "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-l
>> =C2=A0 VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'bro=
adcom',=20
>> ',broadcom', '', d)}"
>> =C2=A0 VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'freedreno', ',freedreno', '', d)}"
>> =C2=A0 VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'vir=
tio',=20
>> ',gfxstream', '', d)}"
>> -VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'imagination', ',imagination-experimental', '', d)}"
>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'imagination', ',imagination', '', d)}"
>> =C2=A0 VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'int=
el=20
>> libclc gallium-llvm', ',intel', '', d)}"
>> =C2=A0 VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'int=
el',=20
>> ',intel_hasvk', '', d)}"
>> =C2=A0 VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'pan=
frost=20
>> libclc', ',panfrost', '', d)}"
>> @@ -171,6 +175,7 @@ GALLIUMDRIVERS =3D ""
>> =C2=A0 GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asa=
hi=20
>> libclc gallium-llvm', ',asahi', '', d)}"
>> =C2=A0 GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'int=
el',=20
>> ',crocus', '', d)}"
>> =C2=A0 GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'etn=
aviv',=20
>> ',etnaviv', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'ethosu',=20

Note for myself: move this one line up.

>> ',ethosu', '', d)}"
>> =C2=A0 GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'freedreno', ',freedreno', '', d)}"
>> =C2=A0 GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'int=
el',=20
>> ',i915', '', d)}"
>> =C2=A0 GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'int=
el=20
>> libclc gallium-llvm', ',iris', '', d)}"
>> @@ -181,6 +186,7 @@ GALLIUMDRIVERS .=3D=20
>> "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',pa
>> =C2=A0 GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd=
=20
>> gallium-llvm', ',r300', '', d)}"
>> =C2=A0 GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd=
',=20
>> ',r600', '', d)}"
>> =C2=A0 GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd=
=20
>> gallium-llvm', ',radeonsi', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'rockchip'=
,=20
>> ',rocket', '', d)}"
>=20
> Only useful if you enable teflon support as well, so we need teflon in=20
> the PACKAGECONFIG check alongside rockchip (or rocket or whatever is th=
e=20
> chosen name for this PACKAGECONFIG option).

Nice idea. And for ethosu too.

>=20
> Haven't had the time yet to dig into the diff between 25.2.7 and 25.3.0=
=20
> release, so I don't know if we've missed on something.
>=20
> Cheers,
> Quentin


--=20
With best wishes
Dmitry

