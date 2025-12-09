Return-Path: <miaoqing.pan@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1160D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 07:37:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2412.1765265874894883152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 23:37:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=Y+71dQyU;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=VSFYmvqv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B91JH1G2442602
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Dec 2025 07:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzhs9c0yOIVN805n4CljDaM+iO/BTdNzXX3O3fgSTLE=; b=Y+71dQyUiv2wr6sM
	srJ/xe/w5fc2rrwbXUIVRu7narJCALlSsBnNOeIxxOk98yFWnAUil1LG73Ikghni
	l6zX5W1zYzpqexGda+DoNSRZH59ThFK0YBqMADHyVt8virByOrd595Xi7UjmS4Kt
	zuPdxepArF2wUFaYsWZi9P8aqk3UUs8H2z0QXxlNHVUCDepEq1bBf4Ie3ufj6rHP
	y9F3+9dvykE5HFWQp76YNE+bw3Bi2nrSAsZOHQ+oo4Bg5itltuXG6a0aaPVZYTcS
	F02UpMk6dstWSkcl1WpFS2U+fsaXTNkPkmkLBfSyPIl8OrGWP4++1nHJ1aB9Iuy0
	JWoH5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axa0bry8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 07:37:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956cdcdc17so56956445ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 23:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765265872; x=1765870672; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jzhs9c0yOIVN805n4CljDaM+iO/BTdNzXX3O3fgSTLE=;
        b=VSFYmvqv39eTFayvoB3YcQl5FsuWTLO0R2KixfPlfc8jR1Fndvg3b4oIPogRPM0Cz0
         1SO8Y0P2az1eVVmPSCoQAeUWqtEz77+ZgBQDycWx90uTJit4R2VEpe3d9GP4elVkW+7E
         dcSAfG97D2uZR5Q+4i8WgkSsC4+th3zVEgwxe6FX3AIrAmucoHXlr8wmv3S+fpqWY7Cu
         9bKyq/Fs+njRdcPyknXizI2IbOLUVbtcXE9F9IcV1qaLYjsPc8jsgqhswGhQoVFVZemU
         dm1/xhGzL3RWURQ8ITEOxcE1/jpEU3oSbYTWdVGiHpt8S4jUK+o5nn4/EJS8bG6EgqWP
         7fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765265872; x=1765870672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzhs9c0yOIVN805n4CljDaM+iO/BTdNzXX3O3fgSTLE=;
        b=f/wg16ahkDVOUpe4RvFNR1uDtBRfz4eVC2NikBWJcQsx8jcK3W0J/aPaltzqhGkq84
         XN8dkmfwNa6PvYbM+xgG40w6+Zt49zFDHDWaVTnZTt1mhSzFnXc+IG/PoCtmhPWgXI8v
         l1GXYO1XdOVUS2SEB2kmv8LdOTk9Hm0au4ZxxFyWKbhKfZeTFrTeHj8I+O/saPu4thvc
         7qLaiN6Ij+gJfpbLHXfO1sbRFpGizffqBf63jrlPOjI5OuSWfdHGAqcnO9OqSZ+9wMvn
         GPDud/9ONhVuiUnEXosMT3aFw0+uC8YzMh1OrkXh93r8tsmvWBJxT7BZi7k+UfmW+v98
         14vQ==
X-Gm-Message-State: AOJu0YyM58+NZyaik9DyVDpFyI4YMGiC651W/6masFYdneLXEvE0hPHG
	hTyAwsAXBJT43XjWLNLHsm8JEBw49PIJn1gocRD7WDFAFq/1Zpw96SwqoXrZqljuInnT2Z8HUjD
	mESKNFidFgj5mq1pOnlue1jqJUTyr3KgSpE/FhPBuGjFehfSQpMWWehMFwh15otpB5kovl6iYUG
	eKxise6rE=
X-Gm-Gg: AY/fxX5rwFnT6I1AjRF4kjGT+S0C4q4t8kFIVGWIaROxHc/vbB84UKFje/9d3z//DEy
	CYXeDPftv5ju2716AsmSE0sNdW1fEy6oCsmAjMjrx+cLq26FuRntkd2mdyIcYRkDCZL3rLxx6mt
	BB5pXEHF5rAANFyoX6flrV4w4oO2ICJtZsuztdkByYslhbgtQ0rUQMLxiRGXqQxAL2+J4EBwbZS
	bqksALe32u2qhnw3NPyd6aSiX0HMV8n2pVRjt1KF16hlE2FCYiB46gtXy9mRt+AIm7v2X24TqT2
	9/EQgRA13VZXaYTYVxgFpRCKf4MZFa3yivWSp4CLSxdnU+q7hEcPvs3mQi0niRGxyHsKF/d9gaE
	kzYyOgztEidNr66Mndj2aKzBf1yWMhUJRrk7zZfJ3NiZ/ZYFTuN4nCKjLXulMlfMdK3zdkNjdHh
	zhFCDD9A==
X-Received: by 2002:a17:902:d506:b0:297:ec1a:9db8 with SMTP id d9443c01a7336-29df5dbe3e8mr114141685ad.49.1765265872460;
        Mon, 08 Dec 2025 23:37:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL8j+vG/ewXou5sv/Q0gdcNXKIdfx3sG+rcwn/rnOajEkOEWApcjzwJWBfU4ETDN38W+DfeQ==
X-Received: by 2002:a17:902:d506:b0:297:ec1a:9db8 with SMTP id d9443c01a7336-29df5dbe3e8mr114141515ad.49.1765265871984;
        Mon, 08 Dec 2025 23:37:51 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6ae0sm145395225ad.93.2025.12.08.23.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 23:37:51 -0800 (PST)
Message-ID: <98414d4d-260a-4fac-b8b9-9e8e47ffbabc@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 15:37:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/4] wpa-supplicant: restore use of packaged
 defconfig
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Jouni Malinen <jouni.malinen@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org,
        dmitry.baryshkov@oss.qualcomm.com
References: <20251128013628.2187455-1-miaoqing.pan@oss.qualcomm.com>
 <20251128013628.2187455-2-miaoqing.pan@oss.qualcomm.com>
 <187C300838343AAE.236385@lists.openembedded.org>
 <CANNYZj-41tXqMX2D=bUU2Q8E7=qAC8=5M_3uvMFcmq0aKV_sRA@mail.gmail.com>
 <8d2218a0-3f94-459f-ac2f-8880d356db2b@oss.qualcomm.com>
 <CANNYZj9J7aNyqi6vxeZr_6viF=gze87JaKJx7-ge_6GokcCLTQ@mail.gmail.com>
 <97ef8fca-f266-4e6a-b94d-469709500c62@oss.qualcomm.com>
 <CANNYZj-2aJEenGpzSq53fPbYVpLOEvSAiKKGmb4j+heNVhbS3A@mail.gmail.com>
 <a89409ba-8786-42fd-a587-70606fe57f63@oss.qualcomm.com>
 <aTGthgduOuJaLV-2@anonymous>
 <CANNYZj_kvZxiuoYu5+Uo1Zs3k36--dexc5FOuaC7mrWA9t0X-w@mail.gmail.com>
Content-Language: en-US
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
In-Reply-To: <CANNYZj_kvZxiuoYu5+Uo1Zs3k36--dexc5FOuaC7mrWA9t0X-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA1NSBTYWx0ZWRfXy1KD3s7CVMwb
 lEvbnYL+bKWTBKqxBhoz2aCmeg566RPSzAwXl12aIXNzyN0I+i1KFRli+Q5Mxgq/Ac7nYrNqChl
 o4qMkzctTpUUc6YDr9LnQkJJmJqgCNiK0cnToPGop96/Gw1pMBXBo1XVNBwdMikvo7r73jNpOHW
 6QsMZRwP7ZVelOqveIR2mlKpNe9J5ghPkPQzO6fcDnUVV3Z0ZE5MxerGjsE0iafKgul3cU2FdfW
 UG36/laH9RJ9rJFVkLy+ACE65jUHluuHZmwstpG+4FZZTgBbS39lyts+Mqkep1oTbsSxZiMzenn
 LOIDY7L9zQsQviiRun0fnmlTaUbFY+YBW6s0PBbxWbZNweTbZK2bADLK/G6KaDkXCNjCd9OMbrU
 CKl2Bnv7Gd+zddCLZBxDvMhngja8gA==
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=6937d1d1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=EUspDBNiAAAA:8
 a=M490E00Ti0IuceNPTr4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: V0HA_L3YfWv8kGqetFqKL3stMaS3iOSL
X-Proofpoint-ORIG-GUID: V0HA_L3YfWv8kGqetFqKL3stMaS3iOSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090055
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 5B91JH1G2442602
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 07:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227415



On 12/5/2025 12:01 AM, Alexander Kanavin wrote:
> On Thu, 4 Dec 2025 at 16:49, Jouni Malinen
> <jouni.malinen@oss.qualcomm.com> wrote:
>>
>> On Thu, Dec 04, 2025 at 03:56:06PM +0800, Miaoqing Pan wrote:
>>> Jouni, do you think it=E2=80=99s the right time to enable CONFIG_IEEE=
80211BE and
>>> CONFIG_OWE in the upstream codebase?
>>
>> defconfig in upstream is mainly a documentation of the .config file. I=
t
>> is not a specific recommendation of how to configure any particular
>> build. Each project should consider what are appropriate features for
>> their use cases instead of doing this based on what happens to be
>> enabled in the defconfig file. In other words, I would store build
>> configuration in some other location that is specific to a platform or
>> project using wpa_supplicant.
>=20
> The specific patches that are being proposed for defconfig are these:
>=20
> https://patchwork.yoctoproject.org/project/oe-core/patch/20251128013628=
.2187455-4-miaoqing.pan@oss.qualcomm.com/
> https://patchwork.yoctoproject.org/project/oe-core/patch/20251128013628=
.2187455-5-miaoqing.pan@oss.qualcomm.com/
>=20
> Is it ok to apply them upstream? They seem like commonly wanted
> default features, as of late 2025 (because they're suggested by
> Qualcomm as defaults for the yocto project). I also think upstream
> defconfig should suggest sensible defaults, and also not claim
> something is 'draft' or 'experimental' when it no longer is.
>=20
> Alex


Kind reminder, final option?


