Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B0EC3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 09:55:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.72749.1746525331482127215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 02:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TH7/AySD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54619ppu008012
	for <openembedded-core@lists.openembedded.org>; Tue, 6 May 2025 09:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ndsffqdAJnOh9l5WLb7fB1c1
	/B6ewdrl8m6FF+MQ214=; b=TH7/AySDNQEBdj4wJnxVazy5E1EjxfTlXxpek/sc
	nGJ3M4wwYBteJQwuG3iQBXamShj6IymijduDWuBd/wQqgFcTuE+aXUKbzpUSOFvh
	WXkhmma7cJtQLPGg1HT5PODNLKUoGl5BceerrHWUhCYmIChjKduhAzfqCVzb+4UX
	IQYS+64p18KioW0j7+mTY8EpU/wjzD8xDAt/XK/03o6NiS6nwUUZ0dDeqT4pH7fc
	6/XvfAWlqs/83YyNDlU2GPCi/UrxJr1tzk6N0Bf/u8hWaUP2PsEy6IZIHVh0WWp4
	TWkX9SGbH2Vvps4kl/5zodlA2JE4n/hcH3xLmXYNuL6i0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f8gw1duk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 09:55:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7caee990721so256506185a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 02:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525329; x=1747130129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndsffqdAJnOh9l5WLb7fB1c1/B6ewdrl8m6FF+MQ214=;
        b=gEWIRDzjHUb/0aKTJzE2723V7N68aG+CXPYGz+0qqUASZI7uNqLWjNiopp4skZRcoi
         N7MegPMNFK9sMJodvLmqSapzvcFJ0OFgL+Nif2VQP8EhRgIADUdN3DpoIRsBaB6hA1By
         PzJfAqA3CTN2TICL/LWplQFJyJfa9ZnQViUNaPKQorubpOYnl69fV8mT/3cf974ioJPW
         Lt3TnpKumcpY6QZPRMruEEsY7bi7lUKYFV6JsAyYqZXTWqsd45BqrTLkv5rv4bsBolAn
         HgWPhIo+lOKgTDSg9xR/9GgkB3p7ui4Fht161bHiI7qu4bE6+dPs5MSgLiBn2DK9hcar
         sXXQ==
X-Gm-Message-State: AOJu0Yz4N/5QbMeyaXx47fb1RJQPE98X7JIi94Qisqd5OOVlpgAE+4vh
	v87sFPtfZzoWzWU3cdZkuJvXAgYfyVA2VYV7zhKTqOqILMlonZHjCM9FyIlHEzs2Fq1OdLSz7jI
	MBBEe0HHvwMON454IzgXhk1ovWeP4VtZnvwuK7y7l8ghrce7iKCjnXhG6P1R9FucvVNCd5WbfsY
	FY1H4=
X-Gm-Gg: ASbGncvb74dJV3ZkBRpt9dWXu48KsIFfroocfpdVRGfUGBu0PG7laT1dWO68suB3PtN
	oz4TsliHqp6gD6ByO4y+OUEvvwlQ+SIgSYMIWM2m2IpPr4DqQdZO9spkGP6zu5cnzJhYpTu/Iih
	wpRvEw9Oam+3KrbQpf2h4vYPcuFCgzkoLsgCRsEw690Cq011dPcY2EveFSzeoti4GxR0U9jY2oU
	iHX7cyU3TZijEfJ6KFTqapc2sxGtP8lRN7dPkCW7pwhY1oPOFkrS4WcLoMXmJkUXj8KE8RGO5de
	B8dCz4CNEni4LhE2wFF62QCNHCo3dAUjUBea8dZMvkH3ezfrlBf4gQKSRfqP/4PX7bs1Q6ETAbE
	=
X-Received: by 2002:a05:620a:3714:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7caf09d7dc6mr480212385a.53.1746525329527;
        Tue, 06 May 2025 02:55:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr0CsmFGwZXGQYlPJTI3kJk3mne7BLmht/JIcZVz1ko5XCOi4QfMokA9gMz4kLEJd2c6l/FQ==
X-Received: by 2002:a05:620a:3714:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7caf09d7dc6mr480209785a.53.1746525329223;
        Tue, 06 May 2025 02:55:29 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f680dsm1989559e87.220.2025.05.06.02.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:55:27 -0700 (PDT)
Date: Tue, 6 May 2025 12:55:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] mesa: Do not use envvar BINDGEN_EXTRA_CLANG_ARGS
Message-ID: <g7nwk6adwdivua2z3wajtg26xthhegja7r4mnrofpf24b7eerm@c24yk56ud4uo>
References: <20250506022231.1665007-1-raj.khem@gmail.com>
 <20250506022231.1665007-2-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506022231.1665007-2-raj.khem@gmail.com>
X-Proofpoint-GUID: ZholJK95scRhAltsBX3NSR5s6cMZN-NW
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=6819dc92 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6bQyNIhnGh8tx_bF5zoA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ZholJK95scRhAltsBX3NSR5s6cMZN-NW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5MyBTYWx0ZWRfX3CPRz3QMhrlO
 WXAYqk8vLBTlYkEhwS3V7ibdoHBiGVkaYZz8JpvaUt8Z9xREfUW6EGV91jMGixeZdIUNz2sO9WO
 2XOi4N+RitVeZpBTTUXPPEzP980S6rWu2VG/r307AJzvny5YInF/YMBfz2hLMnP5ikVz/B4pTpI
 tHarpA6dkoohfv9iqmowMT/7uPm6+Bh310fSoLWlrnZJja2dw7d/14lFykMXufMY1ANKYDBd8my
 IaCwqjaRghwDtB8IzQn7EB35xksbTcKjZP+Rnla355IbqhWbbJzHbZK5yezQW9VYWl3rxdZkmYj
 57knRT2bf60m3MJtUo5pqrPPOM6881HF5nhsN6avHCLbpDpRYhAgea2z/pd55IEMaay/q0HhwQq
 VuSxjyI8wFwP80TqDKghfzynEZQ3q+V7l2iVIyw62XRBetm8NqzmfWbiror4DkQUzwAAkmkx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_04,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=573 impostorscore=0
 spamscore=0 mlxscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 09:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216034

On Mon, May 05, 2025 at 07:22:31PM -0700, Khem Raj wrote:
> Its now set in meson bbclass for native, nativesdk and target recipes
> correctly.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 4 ----
>  1 file changed, 4 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

But I wonder, what made you change your mind?

-- 
With best wishes
Dmitry

