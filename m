Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D4BCCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 15:37:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.11681.1760110620495165501
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 08:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=dHneC5tv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59AFBGT7008079
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 15:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JHQRYqdwwMT1G55cArXiQ44Cl3HZ4HgKwLztBFcpIQ=; b=dHneC5tvRFeeBDta
	dg99WR7h0WBEU7fsYcM9XL244qDKVN4AquurgE5tR9rVIIo/pDwxD55oeBHfQ6uq
	aJ4/c8+pyLuJYseeFV6SFs5zkXqO2D8LripY6nob0yg9bDjqCO6ZfA+nJVUGIQ5u
	arppj8NcZsE4gqyElEATg09xJCiYyCPexn4TCW+DheJf2T6xKRNXZV9xDNSmybhb
	YMquL/1GoNtRpFtBXPvUwvy0YZ6w49PaQdm87SxiyUhtUrIka9uia7z1c2ptxG8T
	tzmmRxepULuRUgBocsXH1zrmE/XWKQJ1qmyb2r7TPqidwuERhfVn5nNT3i7LEaAv
	eAe/rA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kpw67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 15:37:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8645d397860so1032539385a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 08:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760110619; x=1760715419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JHQRYqdwwMT1G55cArXiQ44Cl3HZ4HgKwLztBFcpIQ=;
        b=AxYRJJ9WgPwkdK7Uz+FXdgmZNwZrH0pBrZI2FhJFlCOphxOaA9QXldHFMdxEu1yeZ+
         3AJ3tMuQycXw3lUD6z9VTST02au3VhEx4nva8ywb5pFpB7vnj/adv2uY8RVOl2MaM5xm
         2r6d86XG6/eFlNuGBv4n0r5wM7Ix5IlVCXPxwZNrnh4mt6t4Vht2ate8yp9wNmWYnqp0
         hm4s7AYOHW78GZBQxA3dTw9aeZwWPlPVdfrNH/v3XvnqhZMio9ZwAtcTfs6KzgEW/8Oh
         DIihv/bvGyGgT8Eb/U1PgGmRmZutegSUlORNmc1MCty9s9Du49ktSwjHYDEzH9GouZoJ
         3VXQ==
X-Gm-Message-State: AOJu0YxC3wPq09MgpNEJ28eOES39qsZ/TmFZ3EFInfNI8o1ltZJV6NCT
	dHhKpwAfh/MFr0SDhFIfu9tYUo6TdKmoKGgefPyLDD5r8A5Ggq3tQnOTKFCpsmIfaZPd8Fcxhx1
	f8HZfPiU8HBzDnbiBdlWfuHhyYxyN6I/wsOsvm77XhNWSNRT863r9o7VfzGVKLIJaKQ2G09ME2w
	4d8oQ5q88=
X-Gm-Gg: ASbGncvaPP1e4//AAnsXQkIuDxwQp+vZkipd90CO/viYoWqJ4ChrKwnB19LDjfLMCcZ
	wsHrMyYX+9U2B9PII1C5YH5a0kMWDRl6af4B6xAkTk9WtBu/+hSqVNkAKqLZBHuEPjuLkN38SX1
	U8qQzFl31RRIC8Lfd7l8FZV62mDkCnzeF62kVHIoTBW/b3ukeph9O1HH7iy5LR7BHdwNX/eVadT
	aR7+Mji5yneug/LaCBjZaA+CWKtRGV2oTjjq1SwJCFi0VMZMnurRgKlKZ7j8hJ3AWFCHWjMQ7gJ
	13ecDNp9BWKRkkl+aE2Ulmu7GfHG1d2gyAt5exdgyGOARyV65JWquasVRf9G7lBsbiIKvoRr9eg
	RRTAzzZmct3uHrQhqxahUSHsAI1QiHq9uuPIkkhR8Oq+q69f+YqPd
X-Received: by 2002:a05:622a:30a:b0:4e5:c50:54c9 with SMTP id d75a77b69052e-4e6eaccbd6amr160813851cf.14.1760110618755;
        Fri, 10 Oct 2025 08:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbWQABgI7EIQI1yDnn8+3JtQ2xYCowzXvGjVNOLYo1bNnKm0sUdFYwv5dQZGqtPtXL2jLD9Q==
X-Received: by 2002:a05:622a:30a:b0:4e5:c50:54c9 with SMTP id d75a77b69052e-4e6eaccbd6amr160812621cf.14.1760110617210;
        Fri, 10 Oct 2025 08:36:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4de3sm973689e87.1.2025.10.10.08.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 08:36:56 -0700 (PDT)
Date: Fri, 10 Oct 2025 18:36:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
        Randy MacLeod <Randy.MacLeod@windriver.com>
Subject: Re: [OE-core] rust: building UEFI software in OE
Message-ID: <tnqvt5akhc5f77hicxjmbkwjlhsgnccwr5gywc6zntrdepdjc6@4ayi5e3gwgt3>
References: <rkasjmloevi7fplsyvh2s5z5wxmulvyrewrol6kjlcgn64oe63@5ajr7yfw547a>
 <0f0773981e12d39f55edeb24a82aa5793b3f80b5.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <0f0773981e12d39f55edeb24a82aa5793b3f80b5.camel@linuxfoundation.org>
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e9281c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=Q4-j1AaZAAAA:8 a=KtRELMTHPCAnFL6cZtEA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: YRdCh9ErEJ1IHwk-qFcD5AE7mJvgJOS0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX5I25zrpRhXaA
 TFZm7G3qqklnfEmCRzyWbmia5/VpgGg0yVKKLLxHd2TtTqr9QqCCtoQV/iAngZ0rYMEs3dBxZrr
 /I6aXHfLodaKRkMDv4i2bHnobnkq+kJaZ+o9zbfvPc+b3jHTSJtw1TLyOxhH1U4QxtpQnXlNTzq
 qKF6oRzonq2YSWTqB39pmfXoIogmXGFZ1HHe1bNNnhQoxQbiM0N0EptOmiKnEPFlIogp3KiTl2v
 N8VlOPI3GrG47ytBUrDXV4qkKGOliNrQaJLrObHRFYK9v4Yuqp/NYEqs6N4zfrfQ/gGKrGvwDV9
 3N/dGSqcFqMBcKv7ONFcRqeOnbzvm0H+GfWlc0/Qu+a/rfbBJcp6AbA1kLd6J+ji8HpJAK3g9KX
 PhTphuaPAQkWQEsVlw5AQnSuiDDNWQ==
X-Proofpoint-ORIG-GUID: YRdCh9ErEJ1IHwk-qFcD5AE7mJvgJOS0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 59AFBGT7008079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 15:37:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224692

On Fri, Oct 10, 2025 at 04:29:44PM +0100, Richard Purdie wrote:
> On Fri, 2025-10-10 at 16:27 +0300, Dmitry Baryshkov via lists.openembed=
ded.org wrote:
> > Hi,
> >=20
> > I have tried using OE to package the UEFI binary built using Rust ([1=
]).
> > So far I can compile the crates with minimal hacks to OE, but the
> > linking stage fails. The ccld wrapper tries to use the (non-existing)
> > "aarch64-unknown-uefi-gcc" (and fails). The aarch64-unknown-uefi
> > toolchain installed through rustup uses rust-lld for linking, but we
> > cannot even try building rust-lld because Rust doesn't allow building
> > LLD with the external LLVM.
> >=20
> > So, several connected questions:
> >=20
> > - What is the reason for rust / rust-llvm split? Would it make sense =
to
> > =A0 squash them together and enable building of lld (which we won't u=
se by
> > =A0 default)
>=20
> There are patches merging them on the list!

I think the patches are doing slightly different: they are merging
rust-llvm with llvm.

--=20
With best wishes
Dmitry

