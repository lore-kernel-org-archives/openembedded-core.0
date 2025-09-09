Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A3FCA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 11:25:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.10633.1757417132608889468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 04:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SYkpOIBh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LWEo020625
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Sep 2025 11:25:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NxOA5HnQ2/KpmEiKKcgNrDsAQGZ7xlugXW2EwzQey3E=; b=SYkpOIBh3OqxdHdv
	Jd95wk08Qgn0LkQ30OdsfKb1o82K/F1QlN8WdV8o+GYOpJ4KaZSWc9WIWN0mcSBQ
	DwYB5Fffsp3IdB/e1u1Mq0nPpkGCAmRLOdmG80op/N2bDeTG9bE3v8mhGSQf0qTX
	FZUbXhkaMEc9f2gOXCT39puAB/jfVibEY9q2qLs6aFnYkbRwRng9zRkRrk+Ia4/j
	iTWPCyExONgnxrNMHo+6xKCR7ujllEspGfI1GYyXDm0aWgtLj7oS04Q569P8pRSY
	lAuDxasmIvw+qZcaEhe22kyb97O9F6lOCXXdkyNY8czLZyDgZ2jNPHvUlONa/YYF
	fyieJQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a7x4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 11:25:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7296c012e7dso110890566d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 04:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757417131; x=1758021931;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxOA5HnQ2/KpmEiKKcgNrDsAQGZ7xlugXW2EwzQey3E=;
        b=qishY1cwDwnX6kRns9uS8PBLpcFbVmlAnxAcqoWwnb6YeaPVqL+w/iqFDBQrCGJ1mH
         zfctLJPAhMhEP63JbGoil3VsQDXBQsbu0PMBRJVmIaI4bVphEdhEBOytxJ83/Q+uiYXE
         qRBtPoEiMXt8r0q+CMbLOMP71gQdF0FeXiLQBmeg1BjdP89OY/Ww0ejUINZVLzC2kUfT
         USjGN5GGRRlxinc0Nm9uQ684gpTaeUiXS85ngiviO1dM+oCg8pm4rR8o7wHPQ0nDePag
         LO0jvKb173TFkMVF2rtmlxwzdi2X8xFiibhifAEcpTnqjddFCXlXjPYvgzrJb/94vtkV
         NuRw==
X-Forwarded-Encrypted: i=1; AJvYcCU1/eW/dpqS40FtQSAidjgzC1dDDbFbVq6Df7iEJq4e7z23UeQvKVwmwaZQ9sVcQry0TF+DpOat1woM18RHsX/yNg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxgoT559w8BoEasQvVdaGGoh+Z+84hnIv+DD/R6EXx06lcPqI43
	1Fismw4P1x6s3iEuxHSEOwY0azU+KcZFQlLVV835bR1hPM1PjR8Nu8K95psSdEFFurezHCiyBaT
	huqPbjIa5xuj2jAycyxQqiAWekKMQiwggDfiP0p5A5JS+jp2cV/RAaW6U1xTEWQx1tt9Ue+qgAC
	u8LgSOEvM=
X-Gm-Gg: ASbGnctAK2OM7sqEQiWw37zsjplDPWkV/8nTWbjzlAThV+T2vU7Kji2uhhHhlAFf8SP
	VRwJnzOeZshs+22XP5TiReZq81J2bo/04GAu7nqyy9KWR1WvTtxPmk43ZnvzXGiMF94RWNOdLNP
	JX4MDjhe2YD/BPVcoXtRihRxgQDPUry8eoadwnPGKMpWSJXUJCZ4asueWxgoiosG+Zwyx2ZvJom
	Jd+2BRWN0g3gnygErno8GT/RsCIRiZHVsNKRwPKy7h1nbMlXMGAIoRVjcyABKh/lLMr8t6a/kTV
	CtZsa886UXE7BuE6RwWplw0+FBQORqoCpwCGUY7itSroRs9adkFfBgc+LyKHIkdrcCEz4cy9LUf
	D9AZmoZA9cRiEHA==
X-Received: by 2002:a05:6214:e69:b0:72a:ba05:7759 with SMTP id 6a1803df08f44-739268e6ef6mr119798476d6.28.1757417130513;
        Tue, 09 Sep 2025 04:25:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJG7mw/VPTwyANI2QZJ0PAb18PoYLtG7r9yVuXAKvrByI+GlJSurfEf60HLH0i8/AULgQkrQ==
X-Received: by 2002:a05:6214:e69:b0:72a:ba05:7759 with SMTP id 6a1803df08f44-739268e6ef6mr119798206d6.28.1757417130048;
        Tue, 09 Sep 2025 04:25:30 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62bfe99fffbsm1115586a12.4.2025.09.09.04.25.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Sep 2025 04:25:29 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [OE-core] [PATCH] systemd: stop enabling non-standard MAC policy
 when using the 'pni-names' DISTRO_FEATURE
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <8726848D-4267-479C-BC1D-3EE8930D3BEC@arm.com>
Date: Tue, 9 Sep 2025 13:25:18 +0200
Cc: Antonin Godard <antonin.godard@bootlin.com>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
        Adrian Freihofer <adrian.freihofer@siemens.com>,
        Peter Marko <peter.marko@siemens.com>,
        Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E74BE609-6665-4187-9CD8-25D500FD39B2@oss.qualcomm.com>
References: <20250902090925.2904294-1-koen.kooi@oss.qualcomm.com>
 <DCKQ7KX5D934.3FS2DI6M1I2L1@bootlin.com>
 <ABE717E9-255C-446F-A5CC-C33C7D20ABBB@arm.com>
 <18626142A7130E51.28137@lists.openembedded.org>
 <D98DABEC-9D8B-4D6A-ADB8-EABFAADAA502@oss.qualcomm.com>
 <DCKW7R98LZAP.19SKBT6URU40X@bootlin.com>
 <A66C93B6-7EB1-44AE-ABC9-96254953F5A2@oss.qualcomm.com>
 <8726848D-4267-479C-BC1D-3EE8930D3BEC@arm.com>
To: ross.burton@arm.com
X-Mailer: Apple Mail (2.3826.700.81)
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c00eac cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IQEsc5u+BqvcbVO/417rXg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8
 a=v-ceQxDxxaKveBpqjwMA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: aqAr2JJ7rArOSEuUSgSxXOdzTCpUogEy
X-Proofpoint-ORIG-GUID: aqAr2JJ7rArOSEuUSgSxXOdzTCpUogEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX5Bels9Gsfdnn
 HzyeUBxmrMm7cvJUHai6H0WyHvCCcjH8TIG4i6pm895H5L/xmDQ5WxS84wSFETdqcPIKjITTv5S
 PMpKi+QMdoC+XRfdNCC+U09HTKPI2m3mpASE0466XNtePqn2fW/ajbSRJkwEV2vxl83W2LGRRgj
 0cYVaw7bnBzz02ts3aZ7lHMMGt/c0Rk7gmYsbzVscvhrkv/lYsj+8lUt4VdWSkla8YDNnsVG5qX
 t1jZsci37IvSGUKgFci1jTiUiZV7J2RVNj7DzAHMRARNZ/lVFIk63hPqJd2lGmAKA3z3dqLq0SF
 c/SC054NR/jFw8v2zxM+23hamrN97wnGZfXYpfjV0vlW0rUryHY07LSIsjll93LdsOlhrJ5+ysx
 t9XEdnCw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 11:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223106



> Op 9 sep 2025, om 11:43 heeft Ross Burton via lists.openembedded.org =
<ross.burton=3Darm.com@lists.openembedded.org> het volgende geschreven:
>=20
> On 9 Sep 2025, at 10:40, Koen Kooi <koen.kooi@oss.qualcomm.com> wrote:
>> My original patch was applied, do you want a followup patch to switch =
to 'if !' or leave it as is?
>=20
> Personally I struggle to have a strong opinion either way, to be =
honest. Send one if you have a moment as it=E2=80=99s just neater but =
I=E2=80=99m not going to chase you down over it :)

No problem, patch incoming!

>=20
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223096): =
https://lists.openembedded.org/g/openembedded-core/message/223096
> Mute This Topic: https://lists.openembedded.org/mt/115023020/9418801
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[koen.kooi@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


