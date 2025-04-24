Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69685C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 09:41:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.11309.1745487691173036148
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 02:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=fmvTvxjV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F8c2030993
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:41:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfCZ06N+WqLDy1EsJji81p95MzhKumJL4kEBERQuPD0=; b=fmvTvxjVjFZyt7+a
	+f9D29FVs/VjLRLBddF37RsoXItvAkKQsPz7+86rVjweq7VHd38gMy2FBLVVHlwl
	utGkqljkm9kOAtv3gBcoJDgt1Jl9cryGX7u+Ybbs3U2De9RcTSGcEscT8XKPznId
	TYxByNmq84WG8yaJBD1NgPNOLx/DyktG9Um+SELVT/UdiJ0hbQ+4YcYtE0aj/bFB
	0tdpno4EyNUtXlNbyPMKy7MXz8oTbWz6/xA/7iI2s5XdCILvUnhlfAW5IZu9us+C
	sFckBVNoAnZUACSgUsTSbp2Ms39eKyHJSBePgj1VkKZHNeZ/4B8v9i5+bTqLi14m
	5O9ABw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5d12w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:41:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c95556f824so89235485a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 02:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487689; x=1746092489;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfCZ06N+WqLDy1EsJji81p95MzhKumJL4kEBERQuPD0=;
        b=kFfQsjZRvwie/iMP0ZzihXJow1rDXrvi2HESUp2VdHWUtE4/URODOhCjyTu+0G6QIJ
         I01ZuFYLWm9ra0hQ49pNKfWgO49zNCCtyB99+fqCUt66HX3HleD+Ss8WYaHb4uVVKAlD
         VKFHYVAZCMioODlhxPAhsrAHAN+a0FqnZYeW+gJV3CTgddijoP6sFRzob3/+QMnRp2JT
         B7awvfhWJY35brh4sbubLqsvSWlPJDZAL+29otW11i9RWjF1NkV+xtf1SBWCotG7+kbM
         WIC1Ko6GeF+eRH2RuKXi9mCaxIqqep2VxZguExPnvStWcHGTdMUuFdLYZcZ+WKQjIKrU
         13lg==
X-Gm-Message-State: AOJu0YwLROWin9lgJVNemxyaO4r5zjFahXhrGpQ6a50Z4UNttaYalLKt
	Npl+DP1F/tImJ3yTSzxIs5DJqC61BWNND+IzxD0LH4IbGRMFoFsL2syuecYh23goqU8C4iTdu0z
	uhYqO5QsceWbBmfsYYeYVVtQKdawP+8EpoghOzcLVB+2H5ntG0Izy4+OSW9hkqALOaMFfw8WzN4
	RrPsk=
X-Gm-Gg: ASbGncu39KLpyxaJ7ryKMUAOdYCkIqIt47boZU65wH6vsDDsrGYXnnvxaLnlot0YLah
	u6HDQc999rYe9w4uaACyVi2Jlaz9Zz2TgirQUT4GEKPmGYxV3ZSMxeUxaxy/s+f91hm6yuautp+
	pPSCnEZlaX9iISbfbWFdGbfksg9hlhduoQljdsZ8oytJdesReOX5xmTzuNsIrZ+poF5W7jJ7sQ9
	QLLkk1YnOMSd+IPrS3x52iHxyhLyiXzQPD3BmVVH++1RttDU7HNLJzh1LaI2/OdVtGFb4ntyipS
	4j2MOAOFAHorSUGcEz8FG+Bg3YQK5MATTY15etV450UJC9/nR0ev4zSOBRj7ww==
X-Received: by 2002:a05:620a:8082:b0:7c5:a441:f440 with SMTP id af79cd13be357-7c956e8204cmr279891385a.12.1745487689602;
        Thu, 24 Apr 2025 02:41:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdObGdjsjs85MI2kp1pqahJziCU5F95cZCymxfAvA+rU9quBtKNl5VmSCwzYm2qQOmiqVlVw==
X-Received: by 2002:a05:620a:8082:b0:7c5:a441:f440 with SMTP id af79cd13be357-7c956e8204cmr279888485a.12.1745487689189;
        Thu, 24 Apr 2025 02:41:29 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c26172sm78455866b.137.2025.04.24.02.41.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:41:28 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [OE-core] [PATCH] autoconf: upgrade to final 2.72 release
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <BAD77261-0590-4FDE-9B66-867EBD9CB242@arm.com>
Date: Thu, 24 Apr 2025 11:41:18 +0200
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B7FD1C78-979C-489E-89C5-2DFDB54E0117@oss.qualcomm.com>
References: <20250417151813.2295435-1-ross.burton@arm.com>
 <AB3E4ECA-B3F8-4221-9988-7606C0FF1C3C@arm.com>
 <F1487D3E-B2F6-46A6-AFA2-011D6F05FFCE@oss.qualcomm.com>
 <BAD77261-0590-4FDE-9B66-867EBD9CB242@arm.com>
To: Ross Burton <ross.burton@arm.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2NCBTYWx0ZWRfXz58KmQBG3lMR 8ayj8g8FPAhQgsZVcCUXtZHVABco4dsISJxEY87jLXF1fXhLfUE8Uq+Tb/Y+l5S8azr6KbVvMFr ZkJuqXf7ydTtSrA/RnlQORBdTtGuzf2R88hkEwrGs/SmZwHvxaiKD0wir+27iN4JidlZJaUtRc7
 CmW/ydVplQ/a/deNHwy6Ia+ywVj2itRMIPliLhd2wEEB0ENDIHwk5Kg26QXgJjLEGzzkk0f4BXC Y8FJkoO35/gCy05NpRkcBtTeZc3XmN1jsydqXqnQBGvNgdJWlFx7YJtamxMJuKSZ1HcX067IuOY llgf+mrwM7VnyqWWLFiCiPVNK+I2uPKRQj+NPwYEPCV2K56Yj1LAyrG9GwL9CiDb1y+3mgtRPi/
 cRodJmbdRf8pzupFn0ACXZVcNfTDvrSRsTpMxpRw3pUaTpoohB+/4yi8PUu7E2/BZaYEQOTW
X-Proofpoint-GUID: sf2USJUwTXBar7TGpWa2DCvqdPIcf9h1
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a074a cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IQEsc5u+BqvcbVO/417rXg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=Nt9CWuXgRqGuPvxzhWwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: sf2USJUwTXBar7TGpWa2DCvqdPIcf9h1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=961
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215345



> Op 22 apr 2025, om 14:58 heeft Ross Burton <ross.burton@arm.com> het =
volgende geschreven:
>=20
> On 22 Apr 2025, at 09:26, Koen Kooi <koen.kooi@oss.qualcomm.com> =
wrote:
>>=20
>> So, ehm, is introduction build breakage a good thing or better than =
shipping an RC?
>=20
> I dislike PEs so I=E2=80=99ll send a patch to set the PV to =
2.72e+actually2.72 and hope that they make a new release soon.  With =
that increased ugly, I=E2=80=99m now hesitant to backport that to =
walnascar too=E2=80=A6

Yeah, PEs are sadly 'forever', which leaves the less-forever-but-ugly =
RC+actuallyPV you propose.

regards,

Koen=

