Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16597CA1013
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 13:09:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.21431.1757077755737144215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 06:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XfWV0G7R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857Qkew007622
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Sep 2025 13:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKAcGjdr+UaBtSra98JCwM3zAQdedzRoSfaFxd8vQ78=; b=XfWV0G7Rfqr5SEVV
	XF1ZCOU0vltFpjtAt4fNOYuwTajFdSe0yONO1mLdG/Z4PxmbDrXlnLRlv7Pz40ZS
	lN+o/TgShhZULYY59ikh4zsm4Cig6ysLO8SAfCixogT9wKTyfi+BYb7o6H4CYTNw
	icJw7DqVXiOzJooMSqX6+BSyyy4VTl2piH82euXZHZNUratlMe4lYb3NtY3UxcAo
	Xr3X9A6a6jZ3DCE+WOJFmR638jpxrUWrRwJmHEIrERiKpjRVg6RUCzHUVTnInE1c
	uOYCmfAUmURaZN+PupNBcT2uS0/v+T3FjPf+z/yL9XC1RElG/tNYT3PwZBHuch1X
	C7pEEg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura9338y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 13:09:14 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5448b533d2dso1045596e0c.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 06:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757077754; x=1757682554;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKAcGjdr+UaBtSra98JCwM3zAQdedzRoSfaFxd8vQ78=;
        b=gI7k1sladu20Qvb8SDRlHN9cqZRj4lm/Y9wlE6T1Gdny51Yzagfb3Zvao8bOkP/hFT
         wtKqrn6DbOMFstCzx/QyBQ1qGQmXy+SYs9dQSpPYEg2Y0VGcEOhJLyMpZC3XfxnHSRjd
         txKawIg+6N1dXUY1Yy4xV3MTvbDyey18pkmUutzuSjshG7i8gaU7ttYGR/2PSAXk6J1z
         nLL5BnknUBs4WG+nhC/42E5M1a7CZMCYIa2l3JwIawY60SVrRemnZ8pii9x5VTpU4p1r
         fouAbMHVLHjc1TGKW0vXZ1nbZL28zc7lxEL2pzqUqfmXpgAlDAjOzExllPd/ETrJM/Yn
         ep3g==
X-Forwarded-Encrypted: i=1; AJvYcCVDsUqmERZaZtQX7b7FJgJYZo1y8e+5bpIw0Pau5OP/Wx7RuFRwwAaJtjf0Hv+BSHL6u+NaNVPcp2Lj6+3h+2aIjQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6K7/f0S60fam4EUonY9QFIuIY1Tj0qtAJvqwZM2sThQXZEVDT
	f+c7oz4wzMZNFCLa2IdeF+AXG0WL2OpZB9t9cqVmDDEKb+x1nGhz/DJNDSoAUmsfAp2Gb0vTJpC
	ZBLwYLy6fmQkOGopno0GvE5Dq/VGnGeeXP3Am/HndZyfwoYSF3qUzFActvohyw7ML9OB8LT0USp
	WL1jv3zp4=
X-Gm-Gg: ASbGncvZW7xvGOZu1FrF/K5IstwC9xL4pMcuaD3EODJuad5H5XeHB3Z0SfsBz7HxZlx
	DMhUrEhNiHDsozBudjp2/MKqUA3c00eRaYOKRKqa/+j8MTrqZi8yYsjDpIM+hUmiWLpbHCvpi1e
	qa4+nqliUgkD8lwpGkN0uyZFiE9jJxwGcE2hv/tcStiz86o2vj4GWAeTHY/ieaDjM1Kv6lMse4+
	t/uS4Crk39ODRJa4NHq9eYWqCYdp9V9BSxuLfFYjmomqyqpVpqylyzI3K89/3WF8yO4J67f+cBj
	2dJk6SAyPummOGW5vTyIH/uwc++weaFRWYstFoFpyECRYRmB9jUa2H4GlZTezmoNF2JYq/Aze8I
	9HROHfgPR45gRXXeAmMk=
X-Received: by 2002:a05:6122:90b:b0:53f:7828:16c7 with SMTP id 71dfb90a1353d-544a02f4ce9mr8311752e0c.15.1757077753731;
        Fri, 05 Sep 2025 06:09:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1L+8UE2HmOCz8Ek8KWwb9dyRZ3a+d7zMm7ZmcakgdUAqkLjtaPiHyoSW2VV4mJ6rdBB+hgw==
X-Received: by 2002:a05:6122:90b:b0:53f:7828:16c7 with SMTP id 71dfb90a1353d-544a02f4ce9mr8311733e0c.15.1757077753179;
        Fri, 05 Sep 2025 06:09:13 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b016e56a4e2sm1575455366b.26.2025.09.05.06.09.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Sep 2025 06:09:11 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [OE-core] [PATCH] systemd: stop enabling non-standard MAC policy
 when using the 'pni-names' DISTRO_FEATURE
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <18626142A7130E51.28137@lists.openembedded.org>
Date: Fri, 5 Sep 2025 15:09:00 +0200
Cc: koen.kooi@oss.qualcomm.com, Antonin Godard <antonin.godard@bootlin.com>,
        Adrian Freihofer <adrian.freihofer@siemens.com>,
        Peter Marko <peter.marko@siemens.com>,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D98DABEC-9D8B-4D6A-ADB8-EABFAADAA502@oss.qualcomm.com>
References: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
 <DCKQ7KX5D934.3FS2DI6M1I2L1@bootlin.com>
 <ABE717E9-255C-446F-A5CC-C33C7D20ABBB@arm.com>
 <18626142A7130E51.28137@lists.openembedded.org>
To: Ross Burton <ross.burton@arm.com>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Proofpoint-ORIG-GUID: kUOHa9CwdJ7v_9vKeRUJJUHbtSmDOVbw
X-Proofpoint-GUID: kUOHa9CwdJ7v_9vKeRUJJUHbtSmDOVbw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfXxuR1eF9UuBMA
 H7K0+LRAaMApn/RfwEXLe0zkT9+D18MTS/rcwTG9InGlOzEF5FazcLmQYD3SOUW32t98hwf4sUI
 DsIf0EyZ2nn3ggyYXd+DjMqmS0M3lBXsbvIVOg6/gRuSOwCkc7RZlIYN1W2ouH0nXsU2omg3JPq
 lYnImp/fHoQAQzC6ic2ymHWZyUL0F2CVRiF5il/X2JiDudpSMQ47IJaUL1PyKteUPVa1Bj9z56N
 8b9ThrQf6K07u4ScnLyYA+qDv85PMlGeCS/QGtDRXIGIFOquRNAuqxFKztrjfdrAviW61nyeegk
 fnqv9gTndyU+wPfwrBwO4UCEWoIOHXWOM4OldgwWaPh17a1l+/lOr7EVl3yI7e6ewPM2xhvHzyU
 7cmZeNwL
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68bae0fa cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=IQEsc5u+BqvcbVO/417rXg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=7CQSdrXTAAAA:8
 a=P-IC7800AAAA:8 a=bpuxubCHhakn0mBMiIQA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 13:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223002



> Op 5 sep 2025, om 14:02 heeft Koen Kooi via lists.openembedded.org =
<koen.kooi=3Doss.qualcomm.com@lists.openembedded.org> het volgende =
geschreven:
>=20
>=20
>=20
>> Op 5 sep 2025, om 11:09 heeft Ross Burton <ross.burton@arm.com> het =
volgende geschreven:
>>=20
>> On 5 Sep 2025, at 09:33, Antonin Godard <antonin.godard@bootlin.com> =
wrote:
>>>> + if ${@ 'true' if not bb.utils.contains('PACKAGECONFIG', =
'pni-names', 'true', 'false', d) else 'false'}; then
>>>=20
>>> This could be simplified to=20
>>>=20
>>> if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'false', =
'true', d)}; then
>>>=20
>>> no?
>>=20
>> I dislike contains() calls that return false,true because that =
subverts expectations,
>=20
> Same here, which is why I lifted this variant from an existing OE-core =
bbclass :)=20
>=20
>> but this seems like a compromise to me:
>>=20
>> if not ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', =E2=80=99true=
', =E2=80=98false', d)}; then
>=20
> I can rework it to that. If that works, a v2 will best sent!

So that *technically* works because 'not' is both not a bash builtin nor =
a command installed in the sysroot. This ends up giving us a=20

not: not found=20

in log.do_install. I don't think this is an improvement over the =
original patch. Thoughts?

regards,

Koen=

