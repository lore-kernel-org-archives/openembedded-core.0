Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3991C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 11:01:25 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.8502.1743159679663060769
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 04:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=lko+R+tr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S2Cgsf024699
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 11:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+iU7jw/KxKc6xgrZ4xqY3+pVNfn3j/1aCafdOpCiAs=; b=lko+R+trANeYGvO+
	D3fI1PYuqiDevvq/iNWjnU6G9jHLnbFlWfrgBBRMKhn4ILUFnfRPx3AQXq5KjFOl
	OZD9WQCDqVYtzCNtLTrWtd3VmJvJzyqk/KFnvQSk6YWVsXArqAwUqTQo40nLLYC9
	8Tp1GPMDVfjMmLeM8wW1RX1hWVrsFH5e2iHE1d9wSt4ihOA7gZi5YKPk0hCg3euH
	y+zAnYvUFZLO9GsRkf710/VsyoGt/5nnljfERYAumK5PeX1CLH6AFwMGXn6Vltk9
	D56P4f6TcNFHv03hTF/7MRNOvD7qmP+zYsun+RwvGN5AaM5MuFQZs5divLdUkRBx
	vTucOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45njsc1dxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 11:01:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c549ea7166so299814485a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 04:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159677; x=1743764477;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+iU7jw/KxKc6xgrZ4xqY3+pVNfn3j/1aCafdOpCiAs=;
        b=Wsl0cqzEyLVFsJimQj32gozlOX8c3jdEu5LKu4vIKZQD1gJbknjRAgTFPESBfASQSu
         fkPXAGf4j3IuPm8TJtXn54pdD0Lotdd7DA2+I5fjigJZLRMYDlo2zZUrHwCwOys0ZFuY
         +H+QwZCn9bWxTZSsbKpYyzJDWtXCCeRimD80tuo1FclucDKtU3v/xw4AA5g1Fkifwmq+
         WZ2DHVMnlDN/CeB4kKdfVnjOMauHwMxBDfxA55THBV48BNNf+pTaq1jqaY4OQeA9pW9i
         P1Yz+FAW3wv1MhejnNTJ4GQATsRNJ9uDxZXzQ3vxpcHaYlAUab0sOec5MrwmEfqCqkS1
         h34A==
X-Gm-Message-State: AOJu0YyOydMAaYJDk3FTOuK9UhO1l7C3jZ6ufJg4BHmmdz3tNLkO+mRy
	a1w3+2s9fGvz8RdCHXTkcmXyoies5tmN+sJPEMTSG8BeAfj6TE+/DsiDCIE7rcUTs7CRMHAgS8z
	Dt8yMq2LM7/+COOZ/PG0sbsC4gWf1ProOgBpetLLZaH/0bqJjanZkVF7+6f3hQRDuxzuJwdJZQH
	9Mp8W/X6KZ5b0=
X-Gm-Gg: ASbGnctDnxeabAhKyPdKhzEULJbhcGhuv+YQGx/Gkzb8Vokl8Z6wwyUH7F1xTOpppkU
	5TQoCC2s0z8xuq5AcUgVXFr1NSGuBbWtOceocVlChdAzjLtLV4XUmjQ2SM9TP4XM1nYopb3lGLa
	BDp5Fbs+C5DQCx8X2Uji9ZmqgihdPd4ICzh5Z1c6rpya3hEM15fL8Zzn2UAmoDHLHS3by83FVmA
	94ovjatRd0H9erAtP/y3GNXN6iSgVQlOwmjYxq1/ii3v6hFtAfuaK9wqWyVVsJ2ccNurEdUfW5l
	N/qaE3fnsLu7oXQCYMTdINMKT4CJMdQoUU5vFz4b6f8VrYwhQKc2f353XGx5cajb31630+Q/ZtI
	herM=
X-Received: by 2002:a05:620a:31a3:b0:7c5:444e:3f5f with SMTP id af79cd13be357-7c5ed9fcfaemr801649485a.15.1743159676448;
        Fri, 28 Mar 2025 04:01:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG12Mk3WlcG4Ddg8TfSgBS/5dtfcY/rcGKmIE5nfl0z/xXUbBSmZXja4ZiTGGKq5VIC4W0J/Q==
X-Received: by 2002:a05:620a:31a3:b0:7c5:444e:3f5f with SMTP id af79cd13be357-7c5ed9fcfaemr801644585a.15.1743159675898;
        Fri, 28 Mar 2025 04:01:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb470sm271631e87.3.2025.03.28.04.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 04:01:13 -0700 (PDT)
Date: Fri, 28 Mar 2025 13:01:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/7] mesa: upgrade to 25.0.2
Message-ID: <z6pzamb2kcloqwx5zlr6x47umloya4zevxxunmuoosokdfcczd@d4zligpbwr5b>
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
 <CAMKF1sqc5pj33tDH0XMSSSM33H+8FxsWZ+rGvpNxM7N4PN=QyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMKF1sqc5pj33tDH0XMSSSM33H+8FxsWZ+rGvpNxM7N4PN=QyA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=fJk53Yae c=1 sm=1 tr=0 ts=67e6817f cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=SeR2dSFOC_917RH7R5QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 8j_k9qJjiTxDH2jVKHJhiMwtgPnzYs3b
X-Proofpoint-ORIG-GUID: 8j_k9qJjiTxDH2jVKHJhiMwtgPnzYs3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 mlxlogscore=818 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280075
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 52S2Cgsf024699
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 11:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213829

On Thu, Mar 27, 2025 at 09:33:26PM -0700, Khem Raj wrote:
> On Thu, Mar 27, 2025 at 3:18=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > libclc is required in order to build Intel drivers in Mesa 24.1 and
> > later. Thus OE-Core is currently locked to the 24.0.x branch, which i=
s
> > no longer maintained, having last release in June 2024.
> >
> > A clean solution is to package Clang, then use it to build libclc and
> > SPIRV-LLVM-Translator (required for Mesa OpenCL support). However
> > creating proper recipes for Clang is a long process (ongoing by Khem
> > Raj).
> >
> > This patchset attempts to solve the issue in a simpler way: by buildi=
ng
> > libclc and SPIRV-LLVM-Translator together with the LLVM. This way we
> > don't have to create target Clang recipes, there is no extra toolchai=
n
> > to support, etc. Clang binaries are creted as a part of the build
> > process (in order to support building target packages), however it on=
ly
> > hits the LLVM sysroot-native and is only used by the LLVM target buil=
d.
> >
> > Future work by Khem (once Clang is properly supported in OE-Core) sho=
uld
> > allow us to create proper recipes for libclc and spirv-llvm-translato=
r
> > and drop them from the llvm / clang recipe.
> >
> > I think this approach provides a good balance between OE-Core being
> > stuck with the outdated Mesa release and being able to upgrade it,
> > bringing support for new hardware.
> >
> > Last two patches of the series bring in RustiCL support, a new OpenCL
> > implementation within Mesa. They are optional for the sake of the
> > upgrade and can be dropped if there is any issue with those. RustiCL
> > support is mostly compile-tested at this point.
>=20
> I took a look at the patchset, I don't have any particular objection to=
 it.
> Since this is too late for walnascar release I think this will be consi=
dered
> for next release only atm.

I was kind of hoping that this can get into walnascar, but it seems we
missed the boat. I saw that the branch was created this night.

> In that case, Since clang is also deferred until
> next release I wonder if we should do it along with clang merge into co=
re

As I wrote earlier, I think we should not be left with the outdated
Mesa. Otherwise, we lack modern hardware support. I really fear that
it will take several more months to land proper Clang support (sorry).

> but then I don't see big conflicts in there, it could even make mesa st=
able
> and a good litmus test for clang merge if that happens after it.

I tried to stay as close as possible to the upcoming changes, as
possible

--=20
With best wishes
Dmitry

