Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187C1C369B8
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 06:56:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.14213.1744700201641116586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 23:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=X9/lKrfc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F16jQP000652
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 06:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wA4pNymBu0ChDlgtPlT74yBBC51FLJdtcNpZLR5suwY=; b=X9/lKrfcGIkaThgU
	EAReOl0eoBAn5ZyjBKCY1Eg9NUt6pGI5loq0ToJ5l6ATYiXcBDgN7uKgPaclxjUv
	20AirxhBk1KRufaAZT/2nO5ukvgDWzYwdp1M2MYTGE61FHeSA+Z+29aPfM1b6uKB
	0HUgl+2JLMdTNTgcKtnunQDy8fUNEw7QjZHncN42zlvy6PfDGsEFMlLJTlNlckbm
	DoZ9FDINLRFUCNFf0Go78Jr9anVD6MY+FaAl1MqHFp7j6cJsnB5i9bsgnoDLbLph
	3bg05WkWTfUZgymLfuh0aCq9gS2iN3YwhtwBy64HB6UlumZjlGUSjfP0UQXFoPwi
	ZmY0Kw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjxucb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 06:56:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5b9333642so594409685a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 23:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700199; x=1745304999;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wA4pNymBu0ChDlgtPlT74yBBC51FLJdtcNpZLR5suwY=;
        b=eYErB04ng6vjEaCawAtPJerLAVlsMpIYwI7KhOQ2zN7YwLTxFzr0x11ceBHtXQPuRu
         aQ73inkWdawk7axiy6HEkoipMUINLtZhMCn31/IUBIa+6o/R3qu3FYE8VehE/L3J8Ljg
         JfdgphHwhcv8n9tIwPH4C69PAdus5qA5/EpJ1xmfdLvUjFQkSMmD2pyccQ00ejXz+/c8
         EnqlexOIMGeK1LE/BsGSJOZnKybjlRhxiDShL0dzkEEckzdS63BFwjhp+XRnGZ7ocmAT
         SZgCRq8M36KKXAUouxgUjfBwxW6WANBGiTBN7gkf5zdTeqRhealTu9qmJyrAbQOh/TK3
         AL0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNmma/YCtRvPGj69S+CYCLH385LCIiG9n7+ln2mN6xM/1v0ff17zHXkMNaceanfH7i5DF/rfz2U2ZXy276BUj75w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwTF+QvUYhVOSm2nxxyo5YEJLQAs9Xg6L7NqwvSSpArHX9FAqYI
	ukWLIsY4h8GVuczVdz3g/A4+pZmXFQye6LyWUddvvuamXJIGlbLljSZlX/BPSHl1Eihppyy7Otu
	O9jAaKk8azQGj5UF0LVq8sq7nzbImw0K+8rDWRvDEEE7HIErcT0LN7tDfTmbNPkwFwa2UG0Or/J
	KR13Q=
X-Gm-Gg: ASbGnctNB7PZa3aMubJzRk0N7taZXV5CcixKHwTkfNaV9/VtdE2x40HPF2Ic0l+ybn0
	yhLOr5EFF2ESaSfefMuW85BRyo9xK+tXJH+R7P0U1bc5J5CT7ASu58rwYSv8l9wE7s9NtjJT/AU
	WiR6RmuSRJ1HJm829gN991g5Z0UK7IXkjaHewEYH+vCG4UYs3HBiLfkCcToOrKqAqGn2XKRae2/
	cgYgXcuy9ruCUdtcNbpygbr47TvkNdgVnXRr5jGjTXKat75oa8bK2OKfije3jHgXW0bxXB9rn9j
	3e8Ivir1dL1gl2hoUedEKnUH76Bw3sN+bRgTnS6sm2dMZOENhognlLp4zQp0
X-Received: by 2002:a05:620a:4146:b0:7c5:9b93:8f64 with SMTP id af79cd13be357-7c7af112747mr2377055085a.37.1744700199505;
        Mon, 14 Apr 2025 23:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfYK9iR99sBLd/foZDWV11FTw6IkV7BYdZJI+vS5JU57eKSWte5MsMUeNPaV5D7aecmlSt8Q==
X-Received: by 2002:a05:620a:4146:b0:7c5:9b93:8f64 with SMTP id af79cd13be357-7c7af112747mr2377053485a.37.1744700199105;
        Mon, 14 Apr 2025 23:56:39 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb2dccsm1040661666b.18.2025.04.14.23.56.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Apr 2025 23:56:38 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [OE-core] [PATCH] systemd: Allow overriding PNI name policies
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <CAJdd5Ga7-Swcb8Zej8dpuLP5AzuBHiTmFVSatL33Biwjhym+rA@mail.gmail.com>
Date: Tue, 15 Apr 2025 08:56:26 +0200
Cc: eichest@gmail.com, openembedded-core@lists.openembedded.org,
        Stefan Eichenberger <stefan.eichenberger@toradex.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A1955164-126F-4B34-B796-B2CD3E530AF7@oss.qualcomm.com>
References: <20250409101545.5936-1-eichest@gmail.com>
 <CAJdd5Ga7-Swcb8Zej8dpuLP5AzuBHiTmFVSatL33Biwjhym+rA@mail.gmail.com>
To: JPEWhacker@gmail.com
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fe0328 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IQEsc5u+BqvcbVO/417rXg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=m8ToADvmAAAA:8 a=EUspDBNiAAAA:8
 a=MhbwO3Pb4JV4Bhfdb6EA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-GUID: Q3-vkvS_ofrfjPyoN1xBrPBVKxUSJYGu
X-Proofpoint-ORIG-GUID: Q3-vkvS_ofrfjPyoN1xBrPBVKxUSJYGu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 06:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214823



> Op 14 apr 2025, om 19:03 heeft Joshua Watt via lists.openembedded.org =
<JPEWhacker=3Dgmail.com@lists.openembedded.org> het volgende geschreven:
>=20
> On Wed, Apr 9, 2025 at 4:15=E2=80=AFAM Stefan Eichenberger via
> lists.openembedded.org <eichest=3Dgmail.com@lists.openembedded.org>
> wrote:
>>=20
>> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>>=20
>> Add two new variables, PNI_NAME_POLICY and PNI_ALTNAMES_POLICY, to =
allow
>> overriding the default Predictable Network Interface (PNI) name and
>> alternative name policies respectively.
>>=20
>> This allows setting different name policies via a .bbappend file if =
the
>> defaults are not suitable for a specific use case.
>=20
> It's very difficult to configured systemd in a way that is acceptable
> to everyone, and I'm not sure adding variable "knobs" for every
> possible configuration option is feasible for systemd.

For me, the issue is that OE-core adds the MAC naming feature that =
upstream has disabled by default, which gives me unpredictable names for =
various on-SoC network interfaces[1]. Having a way, supported by =
OE-core, to disable the addition that results in predictable names not =
being predictable would be great. It would make PNI function as intended =
:)

> You could do the exact same thing by putting your sed command in a
> do_install:append() function (since you want to set them from a
> bbappend anyway), and in that case it's irrelevant if pni-names is set
> in PACKAGECONFIG or not.

I know and I hate it:

=
https://github.com/qualcomm-linux/meta-qcom-distro/commit/1820fefb6c675067=
26277f7f789fd5a4538ea33f

It's fragile and noone on the oe-core side will realize that changing =
do_install() might break DISTROs that use such bbappend. A proper =
variable like Stefan proposes would be more obvious and less fragile.

Or we could just drop the bit that adds 'mac' and have DISTROs that want =
that write a bbappend!

regards,

Koen

[1] The interfaces lacking a MAC in hardware is a separate, but equally =
frustrating issue.

>=20
>>=20
>> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>> ---
>> meta/recipes-core/systemd/systemd_257.4.bb | 12 ++++++------
>> 1 file changed, 6 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/systemd/systemd_257.4.bb =
b/meta/recipes-core/systemd/systemd_257.4.bb
>> index 24aad11c0a..00edd702fb 100644
>> --- a/meta/recipes-core/systemd/systemd_257.4.bb
>> +++ b/meta/recipes-core/systemd/systemd_257.4.bb
>> @@ -273,6 +273,10 @@ WATCHDOG_TIMEOUT ??=3D "60"
>> # and the watchdog is enabled. (defaults is no hardware watchdog use)
>> WATCHDOG_RUNTIME_SEC ??=3D ""
>>=20
>> +# Predictable network interface name policies
>> +PNI_NAME_POLICY ??=3D "keep kernel database onboard slot path mac"
>> +PNI_ALTERNATIVE_NAMES_POLICY ??=3D "database onboard slot path mac"
>> +
>> do_install() {
>>        meson_do_install
>>=20
>> @@ -398,12 +402,8 @@ do_install() {
>>        fi
>>=20
>>        if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', =
'false', d)}; then
>> -               if ! grep -q '^NamePolicy=3D.*mac' =
${D}${nonarch_libdir}/systemd/network/99-default.link; then
>> -                       sed -i '/^NamePolicy=3D/s/$/ mac/' =
${D}${nonarch_libdir}/systemd/network/99-default.link
>> -               fi
>> -               if ! grep -q 'AlternativeNamesPolicy=3D.*mac' =
${D}${nonarch_libdir}/systemd/network/99-default.link; then
>> -                       sed -i '/AlternativeNamesPolicy=3D/s/$/ mac/' =
${D}${nonarch_libdir}/systemd/network/99-default.link
>> -               fi
>> +               sed -i =
's/^NamePolicy=3D.*/NamePolicy=3D${PNI_NAME_POLICY}/' =
${D}${nonarch_libdir}/systemd/network/99-default.link
>> +               sed -i =
's/^AlternativeNamesPolicy=3D.*/AlternativeNamesPolicy=3D${PNI_ALTERNATIVE=
_NAMES_POLICY}/' ${D}${nonarch_libdir}/systemd/network/99-default.link
>>        else
>>                # Actively disable Predictable Network Interface Names
>>                sed -i =
's/^NamePolicy=3D.*/NamePolicy=3D/;s/^AlternativeNamesPolicy=3D.*/Alternat=
iveNamesPolicy=3D/' =
${D}${nonarch_libdir}/systemd/network/99-default.link
>> --
>> 2.45.2
>>=20
>>=20
>>=20
>>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214806): =
https://lists.openembedded.org/g/openembedded-core/message/214806
> Mute This Topic: https://lists.openembedded.org/mt/112169516/9418801
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[koen.kooi@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



