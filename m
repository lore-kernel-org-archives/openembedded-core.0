Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFC6C282D0
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:28:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.18300.1741080490834080499
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gYrKjaav;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523NbrLl024904
	for <Openembedded-core@lists.openembedded.org>; Tue, 4 Mar 2025 09:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QnBNhsDp2bt4EuzszQlANYyyXTvTZsgQNAD13b/Ds5g=; b=gYrKjaavDjpJkJGs
	mit1iO7WQTFyNqH04ZFUBKBI9qhGlHW7TaA/j5JiotviK4zngB53hAJeaAuu+h2E
	zZmy9ZcLLA2Vaq10M8BI3+xod7zkGS6vQ7WhKfRpK/ci5yFRTDhryuEbncGdGJM8
	ZS6rY37xeECCTUeXXzOW8fsKAToY1h7tX6BeW+hkeJq4aSXdiEXjxhYRm1ZQYsKN
	PlTScqTV4sas0/xcyiAplc6XoIZ9X8Lb6JvZg19UksqYVTz8qnp8vFLt415ircT5
	t0H4M9I0Wcj5zYXvTggQOpLBSHvZEmWyX5QxI3qdM3Cc5K4P2KkyCEAhdRtujp9e
	oFfgEQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p931btc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <Openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:28:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e897598070so117179656d6.0
        for <Openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 01:28:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741080489; x=1741685289;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnBNhsDp2bt4EuzszQlANYyyXTvTZsgQNAD13b/Ds5g=;
        b=PJXVtHYdVbxZo2nsw8THvhaW5wwnkJ649n4Ccr804eMk5scJ2H68oKfXd1/B7GaUGb
         qK2xCVoRP9Rct0m/5pKMgT5Nlc9KRObrrb/62m9uxcdegroAEbWRp4cI3Le1mEICjMZ4
         i8TKRcTz1uN+ufm3q0FjWGNkKXCJtl6A6ztcPtqRW3CDrxyyLGv2ooq/3gxdshow3Qns
         Mt0r1Rj4756V4f/5rIRpulEbpk9nFp2pKHRqVFNxGj6WhTG7thlwlytzwwPXimzsFhhU
         CGjdYsjZUfiOFHR8VuuHUPWwbVqaNKdfmidir3RmsL30KnO68frgcGYe42e35AD+G9KQ
         Sj/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVFP2ymEwC0dt4vYXIM/jrKN0Alj6R7jReDTO7zIvjyLb6PLjNLl3+2rqG1uY/Xypt2ixesylnP5NLYvP0ydeiYQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzutbzin8j5VN0EdzwF4B+gtFY7ez0szxSzPBLxIExO9qLs4MZ9
	9r2X8pKOSytdifwWWwnR0LZBUB7hiinzWwQD6C6K5lBjG2YrQ2LuiOnZa6JuRPibLVRW1Pf5y+J
	aXobE4l6ahgZYFjsU7e+TG1ID3tqWHFoKpqEkuYDC+1fBA3vtVz2cmxRkpz0xkMBLPiVBEsihKE
	vmsJA=
X-Gm-Gg: ASbGnctf4DICH1I70aZWubjOcsMecOCMX4PkCFCdgZQ9ldHw8CGFXekqd1zL38VQH0C
	ufe6njvFNTF/ByZIsC7DjUnjEeubmdDV1zCaLLrOEAqCf8/Te0J+favnQwdDG9aPUuaQV663sc9
	weobaUcfO3Jdy2Lzad3dBlemMj652hn5mkRrIVeLEivSLnN8GSZOMVXnnBeYHeBIRaa+Jr3oy8C
	DY8J1e031xHD1Dn/MHYm4qAvMky8tedtMCjA0UQgC1LaKXPVsVZYv6grXL+N57YN3rMcWo6LzC3
	XFInLcNXdcGjnH7gh05B/3W7qg1wNhZpF1PHUEpwhg==
X-Received: by 2002:a05:6214:2687:b0:6d8:b115:76a6 with SMTP id 6a1803df08f44-6e8a0ad8ff5mr256948096d6.0.1741080488788;
        Tue, 04 Mar 2025 01:28:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGp3kf9YpC6V46tB6FJfnUTzMp7+2YrffXQGhtPoE15tENhKyYr4y8b+JwfjW9N9tLdmOsVsA==
X-Received: by 2002:a05:6214:2687:b0:6d8:b115:76a6 with SMTP id 6a1803df08f44-6e8a0ad8ff5mr256947856d6.0.1741080488371;
        Tue, 04 Mar 2025 01:28:08 -0800 (PST)
Received: from smtpclient.apple ([82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1ed20a9c8sm122985366b.68.2025.03.04.01.28.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Mar 2025 01:28:07 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <A5978220-EBAF-4C51-8587-76498A346624@arm.com>
Date: Tue, 4 Mar 2025 10:27:57 +0100
Cc: "uvv.mail@gmail.com" <uvv.mail@gmail.com>,
        "Openembedded-core@lists.openembedded.org" <Openembedded-core@lists.openembedded.org>,
        Alex Kiernan <alex.kiernan@gmail.com>,
        Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <229A357F-149F-4722-9680-128739962656@oss.qualcomm.com>
References: <20250219103908.42513-1-uvv.mail@gmail.com>
 <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
 <1825F47182B39BA0.23135@lists.openembedded.org>
 <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
 <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
 <A5978220-EBAF-4C51-8587-76498A346624@arm.com>
To: ross.burton@arm.com
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Authority-Analysis: v=2.4 cv=Me2Wu4/f c=1 sm=1 tr=0 ts=67c6c7aa cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=IQEsc5u+BqvcbVO/417rXg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=E2FL7ofkvHmJnoFXO7YA:9
 a=QEXdDO2ut3YA:10 a=014cFfLqO24A:10 a=P-bUU0mCbqUA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: NBwgsMshqI4qxg1REQpOfaJcCV8r7Myw
X-Proofpoint-ORIG-GUID: NBwgsMshqI4qxg1REQpOfaJcCV8r7Myw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_04,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 malwarescore=0 phishscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:28:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212259



> Op 25 feb 2025, om 15:48 heeft Ross Burton via lists.openembedded.org =
<ross.burton=3Darm.com@lists.openembedded.org> het volgende geschreven:
>=20
> On 20 Feb 2025, at 15:33, Vyacheslav Yurkov <uvv.mail@gmail.com> =
wrote:
>> Isn't is supposed to be created on first boot?
>=20
>=20
> Yes, ish, but our rootfs is read only at this point:
>=20
> [    7.639766] systemd[1]: System cannot boot: Missing /etc/machine-id =
and /etc is mounted read-only.
> [    7.641135] systemd[1]: Booting up is supported only when:
> [    7.641844] systemd[1]: 1) /etc/machine-id exists and is populated.
> [    7.642588] systemd[1]: 2) /etc/machine-id exists and is empty.
> [    7.643279] systemd[1]: 3) /etc/machine-id is missing and /etc is =
writable.
>=20
> On 20 Feb 2025, at 16:03, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>> I do know that it was a horrible thing to get right when I rewrote =
the
>> shell script in python (which I'm very glad to see the back of):
>>=20
>>   # If we populate the systemd links we also create /etc/machine-id, =
which
>>   # allows systemd to boot with the filesystem read-only before =
generating
>>   # a real value and then committing it back.
>>   #
>>   # For the stateless configuration, where /etc is generated at =
runtime
>>   # (for example on a tmpfs), this script shouldn't run at all and we
>>   # allow systemd to completely populate /etc.
>>=20
>> It may be that this behaviour was wrong in some cases, but at the =
same
>> time, I remember spending a lot of time getting this right!
>=20
> It certainly looks like it=E2=80=99s =E2=80=9Ctricky=E2=80=9D to get =
the right semantics here because the range of potential use-cases is too =
great.
>=20
> I believe we should be writing /etc/machine-id at rootfs time if =
systemd is being used.  Currently this is done in the systemctl class if =
it writes links, and then in the rootfs class if the rootfs is =
read-only.
>=20
> I think we should consolidate those into the rootfs class, and give =
the user the choice of whether to treat the image as booted or not by =
writing either =E2=80=9C=E2=80=9D or =E2=80=9Cuninitialized=E2=80=9D to =
the file as per =
https://www.freedesktop.org/software/systemd/man/latest/machine-id.html#Fi=
rst%20Boot%20Semantics.

Generating the machine ID during the build will result in multiple =
devices sharing the same ID in the wild, which is something we should =
try to avoid as being the default. It is no fun to debug a cloud where =
gitlab-runner instances all generate the same token in separate VMs.

So when we a-priori know it will be a read-only FS, option 2) is the =
least bad one, but you'll get a different ID each boot.

regards,

Koen=

