Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCE3C83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 10:46:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.9512.1753181202407117083
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 03:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GyldQnCr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7WdjB009366
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 10:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CV3VBJKrxDmZcwU1vp0qtaD1
	wEfqL8PF8RqYWOWSnTE=; b=GyldQnCrrK6EMb4CBRmPDLoB3mC7foTQacHf7BAH
	Nen1yCtYGvY/korE6U3qdAiBB6T9kdiQDOeu4S2pHeApHWIB0HWeltKgiZr3p5nY
	hVLM+GL8n6jQLrtO7nslYOpe3xM3ZKEFrKfBo0R3phOtrIz++Nl+t0CNs76+mV9N
	UU9tqLNhuim1mSxuUtycCnRoCi79m6wu8PBxIGn+qq5nUfrmdsmBD4awo/kCznze
	cCM1i1BNnyrnxZ3QeOC0iaW1MfvaDHYTo+SmdU4X6sn4Xt34AdbbS0S9R1gi56q7
	GBHN66hCafBmoVyNa+uqhQ6ODtbKTXX1YRK7YVjS0wEsfA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045vyfty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 10:46:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3f2e05fb78so3306995a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 03:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753181201; x=1753786001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CV3VBJKrxDmZcwU1vp0qtaD1wEfqL8PF8RqYWOWSnTE=;
        b=uZuedh/4iBSD1tJ5CxCjKyyu+PvAiVSSg9y5Rg7D2LxANrsWqP7trc9IcMLRGfWhDK
         D36hqHSZcBVPfpQhC9XvTZmRPb9fhIbofRvwQl4y6U6cb0DySRvtZvspw/4PJut5Mrk3
         o7XxAq2In/u/3q5yNwIF9kD9SRLHFssTOFlxwHkKvglb/S5lRF4i1Y6lGpTFsR9uyXvK
         bFkNivKYWLK5j63TGZWATlfsFo8ZA6jLqCz5HDBe1n9zASPyLuylhy2LxkXzGV7bH91S
         CfoTKkjRAlMTsA+5E/O0TUfvJSCC/aEwg3lekWAe3QseGX3NNLjpO8759FQYYsGrR3a9
         TQOA==
X-Forwarded-Encrypted: i=1; AJvYcCURP8s2Z7yzvH6NMBDlYHOH+NqoDPFvDPT3MvkyRqKFWd2x/QrT+S6JcqF8a/VcYyMsbwS9OWKv39Izh/IWExtCew==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwXuHaJ5v1lghQi9C1W3axd+ann12+iS3CigGiBZMvQIKYlO6Vs
	fSDBXodaB/NHQ8+g+3Z/4RwS4jp8LswMK7scoEwXXvKoQTScxA66uU0bjcyEB0k7413vdjof4RF
	Qs1Th+ERjcx45hjgSD1jo/UsX70ZiLqS3KPsrWCCx/9itFBvX55fhule8mrC8q9zz6JUL5wDmKd
	F6z+0TZraUuun8WR71+l+yH29goIfPjJ1pP5+Zd35q3Z5KetbNi1PG8X2vCQ==
X-Gm-Gg: ASbGncu7jgi9P1sxefA/Xhd8Yn6sCtYs4uihms5c+/zJUQk5jJuEdBrvtNnF9JIQm8l
	0gz69cbnVUJY5OJW13bwplAzA6FbdAcKvcGjDYO5dTkpkkDIdb2s/4yJHkG5GpK2INDj4A1dbZY
	qK6oChrSh6iGSUA58xuuN6qx47gKKHuzy8C8c=
X-Received: by 2002:a17:90a:e7c8:b0:313:f6fa:5bb5 with SMTP id 98e67ed59e1d1-31c9f4a8032mr33279874a91.18.1753181200884;
        Tue, 22 Jul 2025 03:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBSwD4bfH0QI7l0ypcQqDZakXvauYDHRiYuYsYOMvNd5oWEU8YxvUbxE4V6SEBUPaeuezVBS2ZWZgmmZfQ2m8=
X-Received: by 2002:a17:90a:e7c8:b0:313:f6fa:5bb5 with SMTP id
 98e67ed59e1d1-31c9f4a8032mr33279846a91.18.1753181200390; Tue, 22 Jul 2025
 03:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
 <20250721-mesa-libclc-panfrost-v2-4-f713d0858949@cherry.de>
 <7hqzlznxd357u24pob6g7hlriqrniu5v5mjnxd5odouw2udkpr@vww6agvbn7tp> <c8adee80-e7b1-47e7-b0c9-11b256dda694@cherry.de>
In-Reply-To: <c8adee80-e7b1-47e7-b0c9-11b256dda694@cherry.de>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 13:46:29 +0300
X-Gm-Features: Ac12FXzLuYCJHHVR7zSMxEaMOOQoY9f68Q1ZG0OcGapyaV4oOtXklSod2RXJJxc
Message-ID: <CAO9ioeUk_Ov757vwzE=2Fg4N5LabxdwGeugg=8OV=rYrVtCB_g@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/6] mesa: add asahi to TOOLS when selected in PACKAGECONFIG
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+yocto@0leil.net>,
        openembedded-core@lists.openembedded.org,
        Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
        Ross Burton <ross.burton@arm.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687f6c11 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=e5mUnYsNAAAA:8 a=cH-8FeD4Ni_YsKSY7WUA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 5wHVrvYmQ-a-D2K46t3PbZtyvhgS9aPY
X-Proofpoint-ORIG-GUID: 5wHVrvYmQ-a-D2K46t3PbZtyvhgS9aPY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4OSBTYWx0ZWRfXxXUzpCZZIwx6
 d3w/6isFy2Y2Tc0U9uq59abW/sn/8CsPreyydN3C5IbkVb5TDo0saJaaTGlF9XJTF9xi4cTif8J
 yCzLrEDIBYpFEv9724tTda9mWvkwoPgyBrA1VqzzC2lxp75o4OZwLwuBECR9GoceXzIhRfrki08
 eRcGOH+OVkes9dH/HpukNbTidq1bRr45+M/SUfb1uVBC1jXZzS5tLVtjNbMiQwIwfckDm39AKgi
 KqqvejH36W7rm2xIZKzyJ18zYWjqsITXPRr+jb2/zhNyL9kuKfwuJ44OYJaY2N/1as0TEFpCE2l
 2/RU2T5eh6jPK+Kc2gZ6TzK2vu68JN07OfN1DkhNVorfaXpPSC8UGcPsYWqD8T/16lIkVx8oBOv
 bs1Iot8GMB9YOthuevPcHEJVvCid/TtFB3oRv/28UF18FsMONsG0Omf4x3z7jnu/D47HL0he
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=610 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 10:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220731

On Tue, 22 Jul 2025 at 12:03, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Dmitry,
>
> On 7/22/25 8:57 AM, Dmitry Baryshkov wrote:
> > On Mon, Jul 21, 2025 at 12:33:41PM +0200, Quentin Schulz wrote:
> >> From: Quentin Schulz <quentin.schulz@cherry.de>
> >>
> >> Similarly to panfrost and other PACKAGECONFIG, mesa has tools for asahi.
> >> So let's build the tools whenever asked.
> >>
> >> This will be useful for building asahi_clc precomp-compiler in native
> >> mesa for example.
> >
> > How? I think asahi_clc isn't controlled by -Dtools=asahi.
> >
>
> asahi_clc is only built if:
> - you enable the asahi gallium driver, or
> - you enable the asahi vulkan driver, or
> - you build the asahi tools,
>
> c.f.
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-25.1.5/src/asahi/meson.build?ref_type=tags#L12-L17

Missed it. Yes, it's correct then.



-- 
With best wishes
Dmitry

