Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6264FC83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 12:28:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.79848.1753705714923408150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 05:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=nsIePu7f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlNWQ018226
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 12:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sGFxu3TrY2aNVuJrTBlwOp5stwdxgI96qumnf+B7EYE=; b=nsIePu7fcDcAItnX
	AfeQQ5Eyu80ZUSGhB6fglQ9eKqczSS6fzQOI98iElHrlQTGhEEHB+O9G0/WUkcnv
	RcocohX3pv3hTXO5BlbOFKxnsJxrotOlSZ6PSqHJAP0/zwilNg21XdtyMmncGa16
	xW7l/SWL3/EWrBOsJPl4iS3mK2rj/ijgYL2TXuwBbgKNT85rzqNMmk6kDRk39Cqp
	bpj7LMWxAhDh+2CnW8hljzHyjZGov54sx+hHLc4rFYduCKblW0kdaMWJsmLOgrCn
	PxgMO+KISViFhTpmBxtCcOaIZ7PImmMWY/cLfDC2iHB8/Eu/YLosf5V8OsQ/5p0U
	eTnpYQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkvgjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 12:28:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fe182a48acso86479506d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 05:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753705713; x=1754310513;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sGFxu3TrY2aNVuJrTBlwOp5stwdxgI96qumnf+B7EYE=;
        b=jA+hqZPX3t6OO8ZXDSgreX5/pLc5PIuJpLCUeJIvBKSqCLakRi2Xy9pMkLtcZglV0k
         7sNqkoSsA8W/y9yJjLL0MQtjWYejmMs7pysrN/Pl3sFE+PQ0cDIR0IPVgHZdpH3iB2K1
         I4+MpkGbWYhZmtRMKyqgz0uVAQQWwmfxlx0vsBnqQhhV1Jm9c+sWEIrbcNquV25G4+9M
         i85NUZ1X0n8nysmopgZQbyEmJEl4lo8UdHuM/Z9iy7ZMoBAUWwOiieMUaUxoBsNiNMWi
         ry6is5HyCzov5WaJPDFSv9K82MR0J3w471qJslMjComs9IiXrxdSWaCAqQGIn4d8dLG+
         d1HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXahTBuxpn2QGa5syia3Dn78hUjgz7UQ1sYZN5TW94uMYLcKnyu52lBIZFWQmM3jqz5CzaxaGW8zRISf8V3bWafbg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4+CMiXotTseyNvA+4gUnbxxyHJDzgBES8ew8y9pznROftViYg
	TnLL6A31DkTKS+W4+SThorrYUi+NXFxXa+BV3Nsbfd/hRcZXuezj8fiVaSnZTWtFKEKZyean7HF
	zeJhMZSJmUl27Jwd7YQn42+5XzluoTXlF+hc41HaApKB0jvZ7ISiPH6W3riRzekbx4i+2hhBFtF
	gX75griB4=
X-Gm-Gg: ASbGnct/7/KU+ac0B4t5O2zv7b9oCw48j7d694nZ/MCeH92HBKfg9xny3hQBpf4L25p
	zAxTURkom794JNUB8ofsPC+bkJAIj9YebMNRsB0HeuJ3I3m3Hw9qQDth3nXHvyKLYMAnY6MzVzC
	Iv5uEgsoZPWRUmNu74OkGG0NpIfdmDJi2neONHLa43pw0/NHvzQdPGq5RuzSZ401EYJSIt90loC
	PId4sI0LOXY1a4Vq0I1KEfwbwFZV2G+iNadV9uVDo+pApp2oCi6O9Utifj4dBfqSGu4tfIpXkKt
	Cyy9y1wHaPNl2NvHZrjHY7ccy/jq1qtrafYYz0qmbKkIxbssPLgRZWKMy9TCR0uIVCf0Rd34NSl
	C1tnGuf++2N/5+cLkNW8XYJSqSz9qNDt2XMbmKYaPLtzWxaFcrymr
X-Received: by 2002:ad4:5f06:0:b0:707:2628:3c9c with SMTP id 6a1803df08f44-7072628410amr122518726d6.4.1753705712742;
        Mon, 28 Jul 2025 05:28:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExcSDdfF5AluVmXBXLvQVR7HJK+knTDAuqkuizLivhXV0pMlh9vmjysdNAvZ0QlLlW+8eJ1w==
X-Received: by 2002:ad4:5f06:0:b0:707:2628:3c9c with SMTP id 6a1803df08f44-7072628410amr122518226d6.4.1753705712106;
        Mon, 28 Jul 2025 05:28:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6336381csm1265770e87.96.2025.07.28.05.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 05:28:30 -0700 (PDT)
Date: Mon, 28 Jul 2025 15:28:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
        Quentin Schulz <foss+yocto@0leil.net>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
        Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH RFC v2 1/6] mesa: move PACKAGECONFIG defaults to recipes
Message-ID: <64lr3pjpoj6b6ctdquufly5jrs73nqpzuausrdpmm7b6bcqq2l@2un2s2e77ujh>
References: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
 <20250721-mesa-libclc-panfrost-v2-1-f713d0858949@cherry.de>
 <5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn>
 <91998d10-a656-4ccb-bcf8-2670936b0d09@cherry.de>
 <EDDCE519-9576-4E2E-B7D9-20EF571A000A@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <EDDCE519-9576-4E2E-B7D9-20EF571A000A@arm.com>
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=68876cf1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=No3qwgGFaVjQa_8ojhcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA5MCBTYWx0ZWRfX8e6+b0L2QjIc
 teG3yiCXIG6srTCq0cS/V0OXpqi/IG3gRX4omRl5EokAgnFliAR/u1RQVQIFrICg89pGLrGgeZ9
 1+3CGAUtumvhXN0Kq4RQNASpgyW4DQGTY788sDHg0pJ5mC4UwNI44n84hN4W854fM4To5S+bsvU
 +JMj7oQ66/yMnj7IdS2Eqd4tHUp3QiVzRYmmCl8Da+IU9Ob8kpb6qaWhVcRW9DmaISiPtFeoNeh
 BkSEmT5Q95Z8oiFeT3hjwba45KPiwX5HbAupOK8Ait9UhGKZznN2QX+JV/9IHj9twpV+ldKVJ/K
 XXBGNmnK9O/5pMtVdIJrHLMB7WdjkYDhq3vI9HeHwygOeM49Em+kwU1TfmTqgJpbRxe1JQANQZ9
 OBUwBAZdtmmNKFOpvOsqzaNyUzJfG3FcQHKPy9i+MnfiLOXtD2KJgMcDODzro//s4wntOEKj
X-Proofpoint-ORIG-GUID: oqWu0O_YW1Gx99_uXdbu1XfrpQ4sNp-O
X-Proofpoint-GUID: oqWu0O_YW1Gx99_uXdbu1XfrpQ4sNp-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=782 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280090
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 56SAlNWQ018226
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 12:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221002

On Tue, Jul 22, 2025 at 12:24:31PM +0000, Ross Burton wrote:
> On 22 Jul 2025, at 10:20, Quentin Schulz <quentin.schulz@cherry.de> wro=
te:
> >> Please omit EGL and GLES here. If I remember correctly, the whole po=
int
> >> of the mesa-gl was to provide GL library in case there are
> >> vendor-provided GLES libraries.
> >=20
> > This seems to be hinted at by commit 015cb13a67c6 ("mesa-gl: add GL-o=
nly Mesa recipe") (poky).
> >=20
> > @Ross do you have anything to add here maybe?
>=20
> Yes, that was the intention. At the time I believe it was an
> Imagination-based Intel GPU that had hardware support for GLES, so
> mesa-gl was used to provide the big-GL APIs, albeit in
> software-rendering-only mode.
>=20
> >> But the fact than nobody complained raises a question: do we actuall=
y
> >> need the mesa-gl package?
> >=20
> > It actually would be just fine as I imagine most users would be
> > using target mesa-gl which only has opengl and not the other ones
> > (see the class-target OVERRIDES below). I'm not sure there would be
> > a lot of people using mesa-gl-native anyway?
>=20
> mesa-gl-native makes little sense, this should be target only really.
>=20
> > @Ross would you be aware of such users today? Maybe some ARM-based
> > SoC's using some ancient (or yet unsupported) Mali only supported
> > with libmali, or some Imagination GPU or whatever else? No clue what
> > would make one use mesa-gl to be honest.
>=20
> I suspect we should keep mesa-gl alive as-is, but I=E2=80=99m not sure =
if
> anyone is actually using it these days considering how well adopted
> GLES etc are.

Agree. Let's keep a target-only mesa-gl.

Quentin, please drop egl/gles from the mesa-gl recipe.

--=20
With best wishes
Dmitry

