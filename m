Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B35FC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:53:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.12112.1752594826113636208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=TYFp1+Yo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FCCaYS005751
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdKoe86bxe+Ho17mU9DYGy3W3ggtOOGbQ4JVJ1ihhew=; b=TYFp1+YoYOQYiKlS
	uSM5TU+cHIrhS9ljiKP75/ph3AfUAcwVxAXCH4MNiVDHp4RhKeXsaYie7hkCumzv
	TAIj7ofdPkl01C9tMX4vpaaRzi97XLsHug10ZUizeOFZ1Qo44aBDsrs58+pPFiu1
	emBQW/SEA1q1zVFBANECBP4mItxbktSsayvCJGugT8Y9Vp4rK+DbPtqZuTDoxJir
	ydzBOjFqxOtKzI0H1sRgDoL6E4lYO9NZMUKvfEt53ctOoGYG+kvIjn0HK0/WStmB
	wz05yicGNss8k4k1T2csE78kjC9T2AKI4EcRJ9813mUfvDi/2x6gyF0SjGAsKDBH
	U27Pqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w58ykpqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:53:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e338e627f1so275375385a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752594824; x=1753199624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdKoe86bxe+Ho17mU9DYGy3W3ggtOOGbQ4JVJ1ihhew=;
        b=XzLtQn4GcwLNhGLQsQhp6Z8dYh1Jm568n7dHl9nK7a//K7UF84Ldr0+A8G/C7TbzPt
         sg2v5MV9fRvNCPnD0lgXLLDmZFxKO7i6MEdVIYFoT4HaE+cajweSJv/3TthREshAgfRL
         Tah3vLjhBHGrEplwvmvx7xW05YvoWFagY+oWWIsN641lD0lAkoot8dNxnGtP5TGEgvKE
         FooQpX+1zsDk7XX5pJWPy+sMtozKLXmngc2o/K+SmXbgI+ZDS+aX6zBKQN8q8Tn5LIGH
         kMLz9NNswtyvSX8LMqaPGISwQTEKMDqBasYt/fD4QbMqn8d9wCvgGrtTnevf0w2qEoQl
         NJ1A==
X-Gm-Message-State: AOJu0Yz957FKxVxXTzGaWbVwBmRobmo6JnEG90p4PO0QdFQSlIYN1Jrv
	7UJ8ElW20wHu337Qkv47vf2MSvEMVKwGriLRn8Yu8sNFf8Ok8z1Pt0qnghJAghbuyPxaJ3aFwrA
	3uInTeunZBPs7pzu6MrlMQlE24KvqSJ9B3fqdHxoVdz08lfqk6eNuEFYEtx4crnkNGsnnvOeOSv
	REI6uOvcg=
X-Gm-Gg: ASbGncthOHBhHZq4NBlVb0U8sifMAHOctSrUQxdlyPWK+qsTrg0/IhwrKKj/t2dSQie
	ESfvb1ZiDfG9iYVG2k++1+/DVuKI/Ptxl94vTQK1WKIhA1YSsiKSjzBFNik4pDMHuPp4xb27SHR
	qPE53AzYZCY0xmI+OZFVEIyGYytsVgxudoLJsJj6YMQjL6DfXcV3ZveThGC7Ush+gM589CsmVJx
	v1vPIpmUImL/GZm8n8mvBIsTOZfVwSIj+v1+FUW01VU7qbmmJZ7kN+HmqMhRU9K0K99WTPIS+UG
	CJTELuWK44VMmBhZ2yolpJqQV1mb9H2BybVdFvhNnvIWqGWBdZzsTHYBRUYKgHIkGPKl56mkoZA
	/VrVjKWyfRmjhLMs=
X-Received: by 2002:a05:620a:4088:b0:7e3:33e7:e4f3 with SMTP id af79cd13be357-7e333e7ec18mr710491785a.26.1752594823926;
        Tue, 15 Jul 2025 08:53:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKycYjeLo3bStQ6+f3RmHDP+zmhE7qtVSJLbSI0zQCo8xpNZYZ4hIIR5jJ0A7C8O0D8oxVlg==
X-Received: by 2002:a05:620a:4088:b0:7e3:33e7:e4f3 with SMTP id af79cd13be357-7e333e7ec18mr710487185a.26.1752594823360;
        Tue, 15 Jul 2025 08:53:43 -0700 (PDT)
Received: from [10.143.245.182] (87-95-12-98.bb.dnainternet.fi. [87.95.12.98])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7e8033sm2346939e87.57.2025.07.15.08.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 08:53:42 -0700 (PDT)
Message-ID: <42374d49-7520-4aee-9c47-665f807dd543@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 18:53:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] libclc: split out of clang
To: Alexander Kanavin <alex.kanavin@gmail.com>, ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250715143139.1829393-1-ross.burton@arm.com>
 <nj7fgmdc26aeloydskcehk7fkkucxmr3bpnzfrmvhji7fpyeh5@bdhms5msviu4>
 <E2842659-CDB1-473F-91F5-9074337D1BE8@arm.com>
 <CANNYZj_eT9sKEBORBOPdCSbh86N3eTngJ6qxQexbpa9oo2EbGA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CANNYZj_eT9sKEBORBOPdCSbh86N3eTngJ6qxQexbpa9oo2EbGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE0NiBTYWx0ZWRfX0C0X1Z8j89Xj
 gS9Gs6jud2+EabFiPQhyXjgqA6DrFmnvoAPS/OxcQ2/tiR6gCgoW5mGFhg3F6vtKilR54dSi/FX
 sE8GMzPJsIa/c4G7Gzg56jmjEFEbf6ZiJlzuWr9tdRnNfb8SFyXAdQ2HAV9R8SaD32QibYNPVdp
 QBvBzym+s0dG4urYMSESWYvKZG26cwKaL34giLnWPS+voVFD2g7VYfVojXymN68jJIEMyiHx7xD
 hjWeqk+xcX9wWauEZBFsH8Viyrq0wJJNSoNxsiecfNMGvSQuKQ21Xp7+ED68W5R/hMPAws0frvt
 2D9VwNfxmDZOXHEW6dtQlTwweuxkOYo12hbYFzRnhjdt5R9UwC3NkHFQ9k87MFzvhUINU4vPeh1
 KznZ9FwGeNO2RhI0/6gDbZEFQOWKZy983Jus71317DOIZyA5WWkSRTMLO8ij9o30Af1ah+Ja
X-Proofpoint-GUID: 5XF9TUDlOiZYRD92pY_WHv5lGxluqDZk
X-Proofpoint-ORIG-GUID: 5XF9TUDlOiZYRD92pY_WHv5lGxluqDZk
X-Authority-Analysis: v=2.4 cv=Or9Pyz/t c=1 sm=1 tr=0 ts=68767988 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G1XBu1ow44TIBf0dtryxDQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=P1SoaQsUX4I_TOPiWbcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150146
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 56FCCaYS005751
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220308

On 15/07/2025 18:05, Alexander Kanavin wrote:
> On Tue, 15 Jul 2025 at 17:01, Ross Burton via lists.openembedded.org
> <ross.burton=3Darm.com@lists.openembedded.org> wrote:
>> Yes, good point.
>>
>> Because building _all_ of clang when you don=E2=80=99t need it is pain=
ful, and introduces a large recipe build that bottlenecks everything else.
>>
>> Adding clang and using it in mesa resulted in a massive increase in bu=
ild time due to mesa and thus all of clang needed to be built twice.  I=E2=
=80=99m trying to recover some lost ground, by splitting out components. =
Even if they=E2=80=99re all used in the end, by not doing the build in a =
monolithic lump you get to run more tasks in parallel.

There were patches to get rid of the second clang build.

Anyway, this should be a part of the commit message.

>=20
> I'd also add that this has been mentioned in weekly status emails for
> the past many many weeks. Those emails are a good way to know what are
> the current pain points in the core project where help is appreciated
> (and ideally joining the weekly tech meeting that starts right now).

--=20
With best wishes
Dmitry

