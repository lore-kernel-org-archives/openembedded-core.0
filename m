Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F16BC36010
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 11:21:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.8750.1743160873196612949
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 04:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=S+7BIUPd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S856Xh011176
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 11:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n3uh+8Ujf7qn45XCiwtIdg3Z
	J4hzUYlE6YegsM5Uq8o=; b=S+7BIUPdNYUFfFhs6S1DxHeOdZCX9pnMDKRtSuMP
	2L0a/jEYM9eRtnwoUXYPxrYVkdNlGC3XxIR2D1he6gStUiLOkyMrPjmh87vN624p
	Mm7aJEvtvwvR+InmNjEMqgBJ+hA02+giKgHRL7HYeuWo6PWVuk/y3i1gsgaPF1Qn
	4bsX3YZ/oge7ViB19g4ZUNs3rlgBgsMiO/fcX9yDK1ublkDn8OHBOrq3LEhogrrX
	irYRtL17tiwWXngqTsHn4L0iovztMjbYdAeO/s6baM9RUXAVV2jjvqiM7w9aRHMn
	WZT7DyirCK089Y+iWw9lynFOAcWFW6B5mAg55YvPzjtM/g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45nqxugjvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 11:21:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-225429696a9so55840145ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 04:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743160872; x=1743765672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3uh+8Ujf7qn45XCiwtIdg3ZJ4hzUYlE6YegsM5Uq8o=;
        b=VAuFaJi9hm5cJqGjXI/Yp1EPiQJgYKWb6iTrt080QZVsbvhvSMeoatd4+fCGfHDDfC
         Zkuo/1ivlt2eZCtUzI4BvlPCpmxqQ2JbEIOn4ZdnwZeFVT1CoV59iv11htPv4jth5Brx
         VGLJTMU8rWHZHCSFFqhQrdlzqFUE8W9stOB8bB9RnZUF6ugnmrItGFiRWvcV1JgrZAgE
         sYGYpjXfVWJx6J6pE4YrkZh6boznNp4KVliXV41SpUA9XUaoXMI8TvvIOwHKLck39Fbt
         BNhZwH6ML+Rj+lsnXWzzC/lgQIg1TDk9UGTtSDRb/gWR9LRgqkOeKReJjiZAvKxRiUqW
         vj+A==
X-Forwarded-Encrypted: i=1; AJvYcCWnx8DKmUQ8b0oR3mo1f/sINEv8yaqpuFY3sDY6i4nU7TafadsbhOINboNllYZ5KlT0z8JO2U4Dx15nBpeoxrt2BQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwOO9WW06JZkZbJlBxta1ohZWyB4mXTm/LWt+4dK4uaTXh8Xp8B
	uq8OECTqSEIpgCV2leGyNesExXkcxokwuNgNyKNiEqjGzyyiOBkxfNFwqx4xpg6EWxUhb2m5oxS
	WN0Hh56F4y0biRGflMZD2DS+z3ErrjW1ryP+1QrKp4fUr9sovdNVtWMemUCFp2uOyAl5Gu9GDp+
	q0uYkdD81v2qeMIyS+rEiCFjRPiet+qJzwEGaHotsYRINqWSyb4Ehseg==
X-Gm-Gg: ASbGncu1nSghw6wOEFiVeRWY0YCOg15VbPA22gTIsyErdWCu96YhEbC1/NnRIPtLDCp
	kTrq/tQoapDz9wYux/QvA/bOizTtOs1TkDqH+Z+gtMUYhzCZyZWp5ZuDqlFMexab8W9DlZoFFNJ
	+4ZpH82vfQ3UW9wBIojRKhrlPrrh7f9g==
X-Received: by 2002:a17:903:11d2:b0:224:1609:a74a with SMTP id d9443c01a7336-22804931e4dmr122427815ad.34.1743160871264;
        Fri, 28 Mar 2025 04:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl/t1JxworbwjagL5VkOZWfLWNXaynsQnW/BsgkzTszQ9Hv/QCpTwUfdswzlMRrDdKfP1kcisUuEsq+F0XaWY=
X-Received: by 2002:a17:903:11d2:b0:224:1609:a74a with SMTP id
 d9443c01a7336-22804931e4dmr122427325ad.34.1743160870707; Fri, 28 Mar 2025
 04:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
 <CAMKF1sqc5pj33tDH0XMSSSM33H+8FxsWZ+rGvpNxM7N4PN=QyA@mail.gmail.com>
 <z6pzamb2kcloqwx5zlr6x47umloya4zevxxunmuoosokdfcczd@d4zligpbwr5b> <CANNYZj8gt0c9EF62wQ5CGByh5_GwGypKqrDmw6pWLutb=X=6Fw@mail.gmail.com>
In-Reply-To: <CANNYZj8gt0c9EF62wQ5CGByh5_GwGypKqrDmw6pWLutb=X=6Fw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 13:20:57 +0200
X-Gm-Features: AQ5f1JqPb74Uq2sL3cZhr-VMAPIX-pv0g-_t_uTlGNG4_SwLNkA75DgkUtNP3Ek
Message-ID: <CAO9ioeXHFGk9rKh6DdMz-jpwBEnWpF2zUbqDVL9aoWU5kiE2bA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/7] mesa: upgrade to 25.0.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: We-0T3Qz7ZGf49RuJGXTfxIZkFjFqNKG
X-Authority-Analysis: v=2.4 cv=e7QGSbp/ c=1 sm=1 tr=0 ts=67e68628 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8 a=xHiGkIL1wscjujI0Z8YA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: We-0T3Qz7ZGf49RuJGXTfxIZkFjFqNKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=769 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 11:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213832

On Fri, 28 Mar 2025 at 13:03, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Fri, 28 Mar 2025 at 12:01, Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> > As I wrote earlier, I think we should not be left with the outdated
> > Mesa. Otherwise, we lack modern hardware support. I really fear that
> > it will take several more months to land proper Clang support (sorry).
>
> Just to be clear, I fully support you here. Outdated mesa is starting
> to hurt the project. I only want the patches to be as high quality,
> well-documented, and maintainable as they can be.

I know. I fully appreciate that.



-- 
With best wishes
Dmitry

