Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65002CA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 11:37:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.20559.1755171431008479123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 04:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=CyoLWd+H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9p71l012964
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 11:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SEfOPtk6LpH501Ntnl7+pxvwrsebKYOmrJVLdckBiZc=; b=CyoLWd+HqK/kKMEe
	InxOliyoKdT2brlQm57riXaPC7cb/6s53b9yZLJw++qsUMq4tKGWregb1zRV05GO
	A4s0BwduR1xPk5Q9Rji+egHt9lvtplv+bUX3Yhj2D2ms4fZyzCCK4eNWJt6qRzAC
	7dRLCnfMelLGD/QaLrgmwoX0izXNHlt2WiMOCQOANQqrl5z0Wo3DsQHn8XOWyziz
	Q0CkLWoAIEHqSQNZP9eB/X16qr4P8DPh5VsT2Z/+YaQAcshH3/K0rGQTDCPAFi5x
	sYpocrcOY6LOVOLYo3dl+s/HvuZsGEAxe5Ggpplk9/+vEf2hQ82wmmWA0+uDzRwV
	yTARJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6uc82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 11:37:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e870315c98so330006085a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755171429; x=1755776229;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SEfOPtk6LpH501Ntnl7+pxvwrsebKYOmrJVLdckBiZc=;
        b=uUdiPoeAlHbTaDGfcYFt+SS13Oaymln4R0K9JKr4NgBbRvBaWu9EfG2vipoR4v3BkR
         hPkcGUODQHLXStUSCXkOnbNTyNNTtoep42zjtaV3SmhrvCLH92tCnh2UIQvApzdEcQ0M
         eNXFm6vXanAzPdaUoP2raXhNvBSZiQoDIivKqVm2XpMNqlzzcewxL1+z1vx9hI8Bx5oc
         am/qFsKW4R8rMtp/UsaVELmcP8D8BhRg/VC0PAPymf9nrAL+MTQQXmK9a7Yibo+wHXTy
         LJqoczQDAEmsmvf3o8g28vi6yvZ5bfn7f6kQe+vWZEsZw0XELUBzBtVoTPLkO6ixkwmP
         wBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSHNcV+AqSH4iTobuhcWJCgDAErN18ejFDW8nQLFGfQXD4ZG6e+sSqzftIMo+Gs6hREkao5XC1UAydA+r2Q7S9NQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwDei9wRoNcP7dwDfky8Xa9KNU6qmxy4+H/h0jyyOE5zUp38Io7
	hEbJWCscHtZgN/KYpBs+rH8YU3ADjQ0OcbgDwvwHmTMoj5XwDWyKmlm1A2w9dTLLdJrujgtT9Ck
	0FuOyLoIgogo6fkoYFYM/347/RUDz4OQ0Ce0T0S7ghIvNx0P9MXKzpPsuC7/o1N+FDV0BasyAIP
	fr9tMjw8A=
X-Gm-Gg: ASbGncs9npM+Z0F7n01wbGzyzaRMd2sMDB+Zk3kxmoOk/v7zMsYCkhu/fhUmxM29ACW
	IVSjdK4e6bd9eDe9whvSRUjpt0EUB8CNqenFcz/Vh1nrlr28hFmD5XBIYwQX+m3jOUHZxBx717U
	SfsXnNxCiP/B2+npNJMUNvJeb0njA1M6I0lLtY/Fi1YALOJHs4b16xODUmXdeum8IkWlJZYXEdO
	8k/1xBPi79uawdYJg037ImzjjvNV6mu+KRH/9kvgv2HSgnqdhLz+U1X5A0mmeC+Jdfpp25mH48q
	ek2IycG4pKlnNY3L9XE4u6KHxxdk7537NiEW0BSVs9ZiPzvLY0RyzCCxLKlP81+sA94Wv6zSohR
	FNWgEJFnX01izZQHfrHE6z7Cq5PwIGligjyKJ9LXNfaOey37Edh6k
X-Received: by 2002:a05:622a:124d:b0:4b0:693a:928f with SMTP id d75a77b69052e-4b10abb0b39mr36176391cf.58.1755171429018;
        Thu, 14 Aug 2025 04:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxkDx+AsGXm7OvGOWXwCjVb6bpYZdODLFHeHdmojnuserbnQhEwQ+2/0xxe1OWE/jdgJiQ2w==
X-Received: by 2002:a05:622a:124d:b0:4b0:693a:928f with SMTP id d75a77b69052e-4b10abb0b39mr36176011cf.58.1755171428516;
        Thu, 14 Aug 2025 04:37:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c9908esm5645726e87.76.2025.08.14.04.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:37:07 -0700 (PDT)
Date: Thu, 14 Aug 2025 14:37:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: ross.burton@arm.com, Quentin Schulz <foss+yocto@0leil.net>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH RFC v4 3/9] mesa: move PROVIDES out of include
 file
Message-ID: <ey6duc7fde2ghpbuqbgdrx6eir47ztq6xr45kup2pgpyux42bs@nr7q6vl5ygmh>
References: <20250801-mesa-libclc-panfrost-v4-0-101c6dcf564f@cherry.de>
 <20250801-mesa-libclc-panfrost-v4-3-101c6dcf564f@cherry.de>
 <2028623D-6052-4893-80C7-17F7FE1AB92F@arm.com>
 <b0fe3372-39b1-4d86-8333-02a6b5eb6828@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b0fe3372-39b1-4d86-8333-02a6b5eb6828@cherry.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX5Mp1eCzp8jT2
 rx4JaojQE/vHpNKpDUu9vPohXcTs04WrgmNJMulsLqZl4CD1mfVZBBG1zBOdmiyn1s2XtiJs0mC
 WbiyYbnB41DyfWDfDkp7+t0diuZvohtfwV/93qGiZQ2WPbYnn9YuxGhCFA6nTlPKiMocpcOcltV
 rLlshHwMXGaKo+07i+IPsMRwaltyCpZ7KkqztyIvxI4MZGumZbGHh+zyhRCRsHQHApeHFjoutov
 5tVr/otelm+/MypoUssJ6OIv9rL4X2sEY4r5zTst0+llruhQJZzGB7eGef/UleZ8o+QWt4+cA2Q
 J6sggAcC1zy/+0PGjro+F1PcWPF5nJoumWtn4ULsC7d687lrsmNs4Pi3RNo2OnNmnNdZBLRfWMo
 XSdrJPSF
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689dca66 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=Q4-j1AaZAAAA:8 a=7copsteyAAAA:8 a=q6gqy2WPpXU4rJ60YLMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=np33tI3PdIrD0yRJz6Tq:22
X-Proofpoint-GUID: Xr5ErdXfgHjLUz1DUy3zEoIKwGTyKA0y
X-Proofpoint-ORIG-GUID: Xr5ErdXfgHjLUz1DUy3zEoIKwGTyKA0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 57E9p71l012964
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 11:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221860

On Mon, Aug 11, 2025 at 03:08:01PM +0200, Quentin Schulz wrote:
> Hi Ross,
>=20
> On 8/6/25 12:50 PM, Ross Burton via lists.openembedded.org wrote:
> >=20
> >=20
> > > On 1 Aug 2025, at 12:03, Quentin Schulz <foss+yocto@0leil.net> wrot=
e:
> > >=20
> > > From: Quentin Schulz <quentin.schulz@cherry.de>
> > >=20
> > > There currently are two recipes including mesa.inc, mesa-gl and mes=
a.
> > > The former overrides PROVIDES and the latter just inherits it from
> > > mesa.inc.
> > > Let's just move PROVIDES to where it makes sense the mesa recipe.
> > >=20
> > > No intended change in behavior.
> >=20
> > Doesn=E2=80=99t this remove the provides from mesa-gl?
> >=20
>=20
> No. The current mesa-gl recipe does:
>=20
> """
> require mesa.inc
> [...]
> PROVIDES =3D "virtual/libgl virtual/mesa"
> """

Hmm, this might need a fix for GLVND, but this is again a separate
topic.

>=20
> so whatever PROVIDES is set to in mesa.inc is ignored anyway, as explai=
ned
> (worded differently though) in the commit log. Do you have a suggestion=
 on
> how to rephrase to make this clearer to the reader?

Maybe "Move PROVIDES from mesa.inc to mesa.bb, keeping the value in
mesa-gl.bb intact." ?

--=20
With best wishes
Dmitry

