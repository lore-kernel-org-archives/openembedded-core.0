Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB21CCAC587
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 09:40:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.8963.1757410820247040042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 02:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CLCAJefw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LR6m032042
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Sep 2025 09:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6yQOnaIA9R11tiOeTIVyt5NtcapOpdPmcvitsURuRoE=; b=CLCAJefwOxqcsliw
	NFCOgHZBb8taBR4DnGv+VMN1ana5TL8Zsx2NipyMGcOUumUtDVjAl+L+PaIDmjDj
	yUYqClMuZpLNFesYgdu3Is+AixZLmcQXWMtPZzGxQxhxHDl5g3x8+AYY8OB31geU
	cfXIwQdVHQEXvwZdywagGcr1sfFUg+iVv1Va8ob2lklcFT0/Mlp4+69tyT80uy9x
	On1bMl7zCD0ZdYybFFjf7QZlIJJMBhclup1T1iN2GDLOSMHTBy9L5HQDVySvS0Ms
	hMTpyaZ2sVJ1S7QeqnsgHrR9r96/XqWeL6r+HUPKAqZVee36rDhQcrDMlddobli/
	OERtBg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kymaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 09:40:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5f31ef7dfso96946211cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 02:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757410816; x=1758015616;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yQOnaIA9R11tiOeTIVyt5NtcapOpdPmcvitsURuRoE=;
        b=Bxrup0PHQJxgZGa+lqgwXYEuTVk5v7UG+fyGEytuf2gMVGC3Gm8PgtP8+NgfAxHRcR
         +Yl6PKy/LrbeU8jrkFdXNoolQM/vCFK4wK0fUitxvHyMHO/wz9iFnKuGoWxlylFo9miU
         uVoCNCGzLCheTXJHrnyd6PsOKraBAK6Owx47rc7gSnz6J4rg1qWF+G1Z044QzmiKdUl7
         vcmlU6/vfZDD54lQ2188MDdNw3V0JEXkIxUBi/SQIq0RsdYDKQHHSK+4I1C5duiVfiLn
         SSAVYbh/Pp3ci77ZpspPQ1W46Gg5hsDlITPqTMhJWwjj/0oxHmSPCTVMIl8U1jWtTjd7
         qr/w==
X-Forwarded-Encrypted: i=1; AJvYcCXN4FcoRSJJzKRgh83Dc0cNSsRGuxUDVSWaMPGVyo8t0NQr06GJRGmjhi1iwr0uEVnnqGO+e1SysRfN+s6iX9Bybg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9l5OG/TAh1clBlc885fRRby71cey+U9IsfejABnEaI0X9Ftjm
	ky/En9QzC0fx3FDjRtv6S0lrjBr2z69hYTB2uPLILMI0/0MVF1osah1lhJYk5tE4TGacRLPJ6TR
	4+YOzYUg7pmh4bhcdpZwyKeso+JVg8BwXW1hnIUJXGiPJcGHXQ6mBwR2Ww+Bfuf443a6S93KxNb
	wp4LGLwe4=
X-Gm-Gg: ASbGnctEkXDOYdBLKJeYKdDUVQgyLf0slFK/FaQ6lmCEGTET9gKj1dFNpNqJo9yKI6m
	4V/MZ0N1eMKgVeLZkC6DiQz1C9wr8Laxe5JlB9YLRlQMd3tYcS1r07ZUy+pnYuZBmQM/t+x2RR0
	kTm92O9M/aap+rUQT6FIhs/7tJiull4LxLl2c/be2Bjy8UPhO3MurAHBP3AYX6MmE0fGHKfxMj8
	srZbfC6ErdnewqKMCiNaGkIMZx1EBVm/ffQXVJWcnb+60rJXt1ZKQ8ajtL/MlGLZtYVfoi0YYhD
	irDm3DeBLaPucoIS7OYrwdeT+vLCrinW2RGmV0VvPXJC2Vwj6IrOiaTKDxOaOkj9R5B9odq8snf
	48/GSPK4qrrVPmg==
X-Received: by 2002:a05:622a:20d:b0:4b5:5ac4:3672 with SMTP id d75a77b69052e-4b5e7b766bemr171544921cf.0.1757410815982;
        Tue, 09 Sep 2025 02:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2ndp2KkgxYA5GrgnQ0kuI8xjp9aPTwRwRH/Qcbd67gvbq9f4lIbV9DvukGAQuWvuWamaopA==
X-Received: by 2002:a05:622a:20d:b0:4b5:5ac4:3672 with SMTP id d75a77b69052e-4b5e7b766bemr171544751cf.0.1757410815341;
        Tue, 09 Sep 2025 02:40:15 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0971379esm2567977166b.102.2025.09.09.02.40.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Sep 2025 02:40:15 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [OE-core] [PATCH] systemd: stop enabling non-standard MAC policy
 when using the 'pni-names' DISTRO_FEATURE
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <DCKW7R98LZAP.19SKBT6URU40X@bootlin.com>
Date: Tue, 9 Sep 2025 11:40:04 +0200
Cc: Ross Burton <ross.burton@arm.com>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
        Adrian Freihofer <adrian.freihofer@siemens.com>,
        Peter Marko <peter.marko@siemens.com>,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A66C93B6-7EB1-44AE-ABC9-96254953F5A2@oss.qualcomm.com>
References: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
 <DCKQ7KX5D934.3FS2DI6M1I2L1@bootlin.com>
 <ABE717E9-255C-446F-A5CC-C33C7D20ABBB@arm.com>
 <18626142A7130E51.28137@lists.openembedded.org>
 <D98DABEC-9D8B-4D6A-ADB8-EABFAADAA502@oss.qualcomm.com>
 <DCKW7R98LZAP.19SKBT6URU40X@bootlin.com>
To: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXxBAOYNxZqeT3
 kcph8NNljRe2/zJPguYaVB/Cs2WUKNYBElcV5fbtEfqaMvy358K5SuQdwHsMzdIzSrdFXFYk1bF
 XOTrfqS274hOEOLsfH1Hi7yIO7WOTok2wrSiJpqXsKQDt74vmrJah2dG6U4g0VFwrnGk0UKxR0k
 d58LvTlMEHijsnEeKwzCXtDkKSvaNgn56eL4wYn3yI4Wu5ktvB0R/KIxNX69PSz91hXX+5M52Ub
 UWCLbc1xmmw69ew8QRcwAPEPGwblZ1q5DnPEIuWHzhreDbgJBGZRvsu0TwH8dD2iN6VYn1z9ecR
 3iRD2dhFMUHSCzdh4umpoRS6GeogkJFTE1aDUeZ2vOW2SSF4qJs2Wy+pUpjmghEAnJ/Im0zM5t1
 IlkynONy
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bff603 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IQEsc5u+BqvcbVO/417rXg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8
 a=7CQSdrXTAAAA:8 a=uMmTJP539dalJI4WLbwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: I3PIX40-w3q1xYxae3dfahwdXfeZ8gME
X-Proofpoint-ORIG-GUID: I3PIX40-w3q1xYxae3dfahwdXfeZ8gME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 09:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223095



> Op 5 sep 2025, om 15:15 heeft Antonin Godard =
<antonin.godard@bootlin.com> het volgende geschreven:
>=20
> On Fri Sep 5, 2025 at 3:09 PM CEST, Koen Kooi via =
lists.openembedded.org wrote:
>>=20
>>=20
>>> Op 5 sep 2025, om 14:02 heeft Koen Kooi via lists.openembedded.org =
<koen.kooi=3Doss.qualcomm.com@lists.openembedded.org> het volgende =
geschreven:
>>>=20
>>>=20
>>>=20
>>>> Op 5 sep 2025, om 11:09 heeft Ross Burton <ross.burton@arm.com> het =
volgende geschreven:
>>>>=20
>>>> On 5 Sep 2025, at 09:33, Antonin Godard =
<antonin.godard@bootlin.com> wrote:
>>>>>> + if ${@ 'true' if not bb.utils.contains('PACKAGECONFIG', =
'pni-names', 'true', 'false', d) else 'false'}; then
>>>>>=20
>>>>> This could be simplified to=20
>>>>>=20
>>>>> if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'false', =
'true', d)}; then
>>>>>=20
>>>>> no?
>>>>=20
>>>> I dislike contains() calls that return false,true because that =
subverts expectations,
>>>=20
>>> Same here, which is why I lifted this variant from an existing =
OE-core bbclass :)=20
>>>=20
>>>> but this seems like a compromise to me:
>>>>=20
>>>> if not ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', =E2=80=99tr=
ue', =E2=80=98false', d)}; then
>>>=20
>>> I can rework it to that. If that works, a v2 will best sent!
>>=20
>> So that *technically* works because 'not' is both not a bash builtin =
nor a command installed in the sysroot. This ends up giving us a=20
>>=20
>> not: not found=20
>>=20
>> in log.do_install. I don't think this is an improvement over the =
original patch. Thoughts?
>=20
> It should be=20
>=20
> if ! ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', =E2=80=99true', =
=E2=80=98false', d)}; then
>=20
> We mixed up python and shell syntax here :)

My original patch was applied, do you want a followup patch to switch to =
'if !' or leave it as is?

regards,

Koen=

