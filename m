Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD20C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 13:00:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.48023.1752757243016835226
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 06:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=mJXKzQV7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HAw3JC030411
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 13:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P54wk+n08ni3MInQ7kiZovsH0HS1JXJIGr6ufa4raeE=; b=mJXKzQV7dfYPqJ11
	kuRLE6eK7lmuCDw7M5vyCTUtr+rORJqeyHMunuQBwlb4/yvXDQZOb+CLMEmcWliv
	6gH80FX84uTBUe5xyVZ37bFf7s+8ns/JVGUO/oQKl25QrXdNYadSOKd4QdV5Zt9H
	32f1cSmj0JLHr8MIAbS+VUi9WFMOjkYN6e5GP5J0UCFx7SuF3xlD1XmHtl0fVsdC
	My2zd4l02ZrA3pXicK6LOwneZb9Fv/fghW6XV0oIzTIgHdx4Dl5ijm3Xy1fceoc+
	qfWDLOYigvbDTFhnurNodaNzjbe0Ud8BYAuQc+cfXjdzty8WKxTcfMnx2Jr4J1r9
	J4GP1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47x8x7mj5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 13:00:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e33f7a58f6so145083785a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 06:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757241; x=1753362041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P54wk+n08ni3MInQ7kiZovsH0HS1JXJIGr6ufa4raeE=;
        b=hSnQOVPyVzSv+RVHgBn1quJAozP7od/Zjb5Yqh2/Bbuf9cGsnoanv/V98I5tFbznv4
         8BnqPLSKkQm3g6K8cbl3AhHn2ueNUAZmMoIYcvJaUiVc9cCzhSkIG9SAlJZCX+pe/woz
         yJK9DibjfQfQ1OFY6dbgW7vOyrCjTzF/3K99wyjeX7wfigrooxo+2uSeMc7Sb78LY8UM
         q43/NB1L0PKLuunwERb8RXmt8LKzVK+fhYv5Np4w3+euEorAb5Z2runSSF5gvha5vK4A
         gYCaQCuaf50fKIjlzw6JYdNdSrJJcE0TM3mKPhhF2yIhXd9iTOScwgljWkhmWa9nD1FN
         Gr+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWY8oTEI59FJTDqOGdo+K8yIsHhu3mYkh+Z4hDc06O4EYZ6bsvBitnjj9iYNcZUP/FmzhKWPNdzSywBzqPpippiBg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwKdgFPJkJqeAfcsql7XvzwZfByYLELBKaoiMjqdvtwU4Z6J0OF
	OoaxfoBYbhlmwexwG9ecdOS1Dwtcpj+LIPphFDDsCdr+vIPdum9EoI3hMlvs47Rnag3Y3Sog0AA
	/hNJ47TYh4L7dIWFm63aBENrtbPNT16k/AavHjuXjXw3cQd5IbAtBmvUeJmRVjB+EmFQChT+qmZ
	FycK9ydeQ=
X-Gm-Gg: ASbGncvA5WTVSoq/aZPxDHi/+cWsrUh+aVTn7GDVhzFDMizX1oAyCdVsJ2EDb5YRcZn
	7nedXLMns5YT9/nXi8FMDK84FSVELxRgfrAUKGazeVHvLlH2on+r4YBYAZ4JOEAn39ExkFi8mg2
	RTaPNds5Aaqqsv2IjNdrLNkd4Lcll5o9ZdeZdAP+REx3HRv7ZwG+bkd0jQx7XQ7uDb9gnGYrgq0
	w/WareTdkS2MU/Lekmb+CxB8IZnekdHzVblqJhjFLqWXpzGxGdRnWG4z/UT8qJyYWGhieMlbNUK
	HpzaZHY/6aLtPnu432lv6bmDaGOb1vRKNV4kLMj1PPLk4bAorN0HDCaUtsy+hTQ9+YDaz5ENwxh
	+ADbYnlcPWYv7GnR+DDx9JwU+yhrpiKiOLM5YWU43jwjMH25FsJdh
X-Received: by 2002:a05:620a:2945:b0:7e3:2ee5:71b0 with SMTP id af79cd13be357-7e343374b3amr841930085a.16.1752757237077;
        Thu, 17 Jul 2025 06:00:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4zhf8AymGwPDx71qAfUi3hmJg0NpnTXqMipCX16JPALSmZoRZzp6t4qlxoorQyhEu0p6nlg==
X-Received: by 2002:a05:620a:2945:b0:7e3:2ee5:71b0 with SMTP id af79cd13be357-7e343374b3amr841916785a.16.1752757236142;
        Thu, 17 Jul 2025 06:00:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7f3522sm2995563e87.87.2025.07.17.06.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:00:35 -0700 (PDT)
Date: Thu, 17 Jul 2025 16:00:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] spirv-llvm-translator: drop tag from the
 SRC_URI
Message-ID: <27vjhf4ojfpwvsbdxkboo5hgoaaj7ongeax5icelqv7trobh5c@vfj4cn4mm5h2>
References: <20250716144749.1880959-1-dmitry.baryshkov@oss.qualcomm.com>
 <CAMKF1sqkK1o3e=ehvMhkBGTFVuvPMQF0LusEYYDURfdgxLitmw@mail.gmail.com>
 <CA+chaQeEQ2EKt8RdZrDiae54NE0Tidq1_md2zHQJATpX7=5X6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+chaQeEQ2EKt8RdZrDiae54NE0Tidq1_md2zHQJATpX7=5X6Q@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExNCBTYWx0ZWRfX+yZfslGSXmFC
 MUgvrLEmv9LVRvG3id4qGy5NwW2vL9H6HHnoexUquPv5gIZTspNxn61zIC4ojMHpHe81SMkVWP5
 bH9k7GvoT8eQIQFslU8TNE9F7NgHDofB1y0WlS7e1n5mct9EaBbaR63a/khxdqgoCfBLwA8C1K5
 eMftSsrMqjpZT1zbxgTwBLbAF4CMFwOBRZxhkIoiXtShhU5Icd+b+IaXYcv/T7WqwcRAfzChDaa
 2v/FUe41UO1f/MGf46CepAq6YXl+RhnNxCFTxWcpXq/B/7rqqmMawkbnASzCsOudvs21mUmLqoH
 zoFiZZt5cDWBuLKwJswzg8iQrb8JZIrCkJtoAT68Qhlk4pWQQMoczGwIXu5z1wxdugy2GOj1zNz
 /LeEGnV9v5b2hnco6jSseA8LQqL/pMqzkDMN+ZHLSiWiNvB6BekZ9dyxbrv5/sUZiIGgQ/Mw
X-Proofpoint-GUID: kESZGnjO_vzxvMVbgEQcT7XykyoMt2GU
X-Proofpoint-ORIG-GUID: kESZGnjO_vzxvMVbgEQcT7XykyoMt2GU
X-Authority-Analysis: v=2.4 cv=N9YpF39B c=1 sm=1 tr=0 ts=6878f3f9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=vzD-wQqqRqMbUCVz5mIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170114
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 56HAw3JC030411
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 13:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220541

On Wed, Jul 16, 2025 at 05:14:34PM +0200, Martin Jansa wrote:
> On Wed, Jul 16, 2025 at 4:56=E2=80=AFPM Khem Raj via lists.openembedded=
.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> >
> >
> > On Wed, Jul 16, 2025 at 7:47=E2=80=AFAM Dmitry Baryshkov via lists.op=
enembedded.org <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.or=
g> wrote:
> >>
> >> It seems under some circumstances the tag in SRC_URI can prevent the
> >> recipe from being unpacked correctly. Drop it in order to let bitbak=
e
> >> handle the recipe correctly.
> >
> >
> > I think we should look more into underlying problem. I have seen proj=
ects create release tags that do not belong to any branches and can creat=
e fetching issues using nobranch=3D1 helped in such cases
>=20
> I think this happens when the git repo tarball already has the
> revision from SRCREV but not the tag yet.

Most likely. I don't follow exact timeline of the repo, so it well might
be possible that the tag was pushed way later than the commit.

> Adding tag param to SRC_URI only when upgrading the version helps in
> some cases, but not when the tarball was already created with the
> right SRCREV.
>=20
> The only work around which worked for us in webOS builds is enforcing
> to use annotated tags and using SRCREV of that annotated tag (not the
> SHA of the code it points to), then either both (SHA and tag) exist in
> the tarball or neither and the repo is updated before the tag check.

This might work, but not all repos apear to be using annotated tags.
Maybe we should extend bitbake to check for the tags in Fetch code too?

Khem, Richard, can we please pick this patch?

>=20
> v20.1.4 isn't annotated:
> SPIRV-LLVM-Translator $ git show-ref -d v20.1.4
> 74843f2186bb63b6802758222084da17fcbe603c refs/tags/v20.1.4
>=20

--=20
With best wishes
Dmitry

