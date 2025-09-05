Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7743CA0FED
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 12:02:26 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.19815.1757073743198538051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 05:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TMRdRI3A;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5854Se02018638
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Sep 2025 12:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyCQtphqL6yLs3GkL++lTLJ9wDe+fXah/L2IWb1Iuto=; b=TMRdRI3AHNg+Kn5J
	H+DcKDv8/9zZMs347EjOw2yJqJ2hnWzLMOLQ/UpZn7hd+Zr8qM56hHSQIOnyLuAf
	HyWpHskI9/26MGFqRQho48UDpBgPz+spWzgqezol6R1eHODw5aX7RiPFAwMAAB80
	r1B0RgZojq0ZBkUbM5LizAC+VXXuEXWdXD7jsWa+u1HIPABPI/YIp3Bz2GaJEtWH
	w7hpedm1kapD/3HUINtMmDwPPpH1BC1TJ7PreZ/wZRRj5nnuLtuOmqDblgBnT+Nh
	fGhrYzx+0CtFA7Lci20VEa4ClX8CJsgUfnJaz7p3p5n/nqnEXHEtfMlcmw1ckIby
	Xm271g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yebutwwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 12:02:22 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-544b12e328fso774238e0c.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 05:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757073741; x=1757678541;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyCQtphqL6yLs3GkL++lTLJ9wDe+fXah/L2IWb1Iuto=;
        b=fPOPKm1z2HXdvzsSNwgp+ezgXPvQ1Ikbz2xpVS26iUhWCBkLODn/r26SrUffIiex3e
         llaQn1QgettabitMCvIZ7K4jiJtvd26hQnlaYSSoqASptKaykODGDuWXHcgecc/XVqoM
         bc+UkmiejG8vFhZTQNCgpLRSzGTZcMPGlXHWaT5iuXkd1W1itaygUP//p7+B5L0zjDg1
         SAUr2XNOGzHCJgNi9Lvnz5AgP7Q+HwGEXLfaIYwb6INHf+cspGTetfbeInxL2BkEWcY7
         duyEj27fT9qYpdGY3DPxZ2xhfvuIl8mSPCcNYE7wU4v2Y6e4hQTR8U/GiaA7mklLVMJC
         An/g==
X-Forwarded-Encrypted: i=1; AJvYcCXmNf1VUi1mJWE7ExU613t+8RiB4kCD+5TOy1IMvDlTui0YMtL9HonfJAsWuB0Q+QVmRObDRObkNJcdcTP/I/0/+g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwnQ+PH9hlQhReYYopdiaDa4aDXKpfzKBgHUyPU08DyNFfG9gSP
	pzbMiKaBhT6TEYxIYfIYZjoY87CrJ7Z2ua+LFI/vhs/iEuOIFccAAFEqC0Fzgkg2bBCNdP3be4a
	vcPrXcwFgH8+2zKDi4KO5kW6w1UmGhvqbsxvlnXDoUjnBNYfrqzhRI91SaLkG7o8FffP9cGO/5J
	elBvmWchE=
X-Gm-Gg: ASbGncuE82ftPziuoWsDrYckQxAqZNsVrqhIgBfA2dA2FJPwoWMuAVtlLPO7Df6a3R7
	POFqOb6TgyFdqkYYTQKCJwvjhSFhaA04BBuwv0C6uw8SygMKqGZFcRTfhnEakcEVtcUIJalAeiL
	nr7ukIoG3o1aTWGeOl7+wxvfAZSYYnGRSqhvJvo9qokrzbakCswUwGN/b6ggGSJCpavSKEOxuD7
	dxHaH1r1Fu4XcwVcOJi2onbojLTlky64f5VOF+yMyKB/kFZKNiiVJxe7Dx8D3SHcJwvKth8xE7k
	pwQmVrN7CzA4ogtUKP1knAglPbTBxUBKiTALAVZpmd93UBWT/4OAOjzEJHpqgR84k3O6wZ9Gf1B
	RoCHTT+AyUKL0KdVxNBg=
X-Received: by 2002:a05:6122:3295:b0:545:d756:be7d with SMTP id 71dfb90a1353d-545d756c233mr3805818e0c.13.1757073741172;
        Fri, 05 Sep 2025 05:02:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG31HCiWGH7H0q5gjIf4S4dGBl17zw78TxeZpVVWnK7VQvTWVsaIjY8x0Qm22V6OUMZI5eVIg==
X-Received: by 2002:a05:6122:3295:b0:545:d756:be7d with SMTP id 71dfb90a1353d-545d756c233mr3805788e0c.13.1757073740655;
        Fri, 05 Sep 2025 05:02:20 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b042c7b3671sm1235776166b.42.2025.09.05.05.02.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:02:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [OE-core] [PATCH] systemd: stop enabling non-standard MAC policy
 when using the 'pni-names' DISTRO_FEATURE
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <ABE717E9-255C-446F-A5CC-C33C7D20ABBB@arm.com>
Date: Fri, 5 Sep 2025 14:02:09 +0200
Cc: Antonin Godard <antonin.godard@bootlin.com>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
        Adrian Freihofer <adrian.freihofer@siemens.com>,
        Peter Marko <peter.marko@siemens.com>,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <90C15739-E903-497A-9EEC-F4E3CD42F69C@oss.qualcomm.com>
References: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
 <DCKQ7KX5D934.3FS2DI6M1I2L1@bootlin.com>
 <ABE717E9-255C-446F-A5CC-C33C7D20ABBB@arm.com>
To: Ross Burton <ross.burton@arm.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Proofpoint-GUID: 9dNQ44D-Z6XGTGVyxfGPNZ9UtVcY1dfd
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68bad14e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=IQEsc5u+BqvcbVO/417rXg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=7CQSdrXTAAAA:8 a=P-IC7800AAAA:8
 a=FDeDpVli-5HCbClKRjsA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfXxmRboSQUIF8X
 xxZDMeF0fnIRie9z2i94tLK1VyaUA8dN25BzTVkEzrDnPKRd2ShYqqoKBXrbBFRxY9WWhyBEOon
 JnXubf9eWDmnSYMsSkPIDZlq67Tzj1o4wPqd2FMPG5uhDR4gDlelFC8y7sPcv1j6oA/NmHpEKP+
 6oOw0aSduVostNDpa3mgYRkjL/DHCXv/88blTmIIch+S5ujh4V0kx/7kADTSdkIRu4YcewqnHOo
 P/U/R5xAOgTXYFhK6WADctw9Y10aCSPk4zhoo12YWL3gvlPuMwc2ofoUNrN6R2K22L2BFugXwjR
 Uzor8mPPm4GwYXITRV1u69PW4MJZiExoJmiNqJJLXZYQxcBTRiL6+n5yxQlp/9e76dVBH42GV56
 P7y27ue0
X-Proofpoint-ORIG-GUID: 9dNQ44D-Z6XGTGVyxfGPNZ9UtVcY1dfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 12:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222995



> Op 5 sep 2025, om 11:09 heeft Ross Burton <ross.burton@arm.com> het =
volgende geschreven:
>=20
> On 5 Sep 2025, at 09:33, Antonin Godard <antonin.godard@bootlin.com> =
wrote:
>>> + if ${@ 'true' if not bb.utils.contains('PACKAGECONFIG', =
'pni-names', 'true', 'false', d) else 'false'}; then
>>=20
>> This could be simplified to=20
>>=20
>> if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'false', =
'true', d)}; then
>>=20
>> no?
>=20
> I dislike contains() calls that return false,true because that =
subverts expectations,

Same here, which is why I lifted this variant from an existing OE-core =
bbclass :)=20

> but this seems like a compromise to me:
>=20
>  if not ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', =E2=80=99true=
', =E2=80=98false', d)}; then

I can rework it to that. If that works, a v2 will best sent!

regards,

Koen


