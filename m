Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF7FC87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 14:46:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.9460.1753800409728055279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 07:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NXGRyO/E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9o4Hx001728
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 14:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zQ76D5zu8nzjbLFQ3JyjZz6u
	5OTgEZqMs0E2WY8SfTY=; b=NXGRyO/E5BCvZ+S/Uv2ihnkjYr2QUGTM9DQbD5S4
	6R/62vT4l/qlYQ74oPk0gJ6ITi0mY9FLMhnjx5ivrrHXZSeKffT2DVQUnKAPFCjc
	4ELkcdD14num/wTpVA0H2Z2rQXQY3jJxf2fzRnPpdsuuDLZz39rnmsyRxjPt8RgA
	GiVy3yuFsJEEiox37oIyIR99xb0+MpSlPmihvZiXWCwN9SaAqriH1w4pAWOlt/ud
	UM+OxwuOQz27sFt9ds6yuXPxMIw3hVBsuqryAvBxJXHTOFmATATgRAB+0cH+JULa
	7Zf7IGVK08RlmxoShQyPAoHR2LYSz1tYHkP1OGS6sy87WA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1agf2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 14:46:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f77f86f6so61291665ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 07:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753800406; x=1754405206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQ76D5zu8nzjbLFQ3JyjZz6u5OTgEZqMs0E2WY8SfTY=;
        b=KI+3oQQ96zs/m5Z2WHYL7m0/qq1XNQkE42Y1wN6DR4hORys3aRVVYNVPLST/uOyWJe
         ULTEe57J9TPLjpahqZlNpx/7yVH42ch4TmhSCs7er1+h9ieOCE0YWv0pRgifYbPw4cC+
         XlCFgYV5BI6SnJTmWh24nfBSNRDxt7j+x0GF8qDh7kbkjy+1nXbgOz9nYow7+L71gsfk
         64tK0K8YP5aJjkyPUhSttE/Unw3o4eMOuXqkAfXEedGpsxY6Ow/Az8NQ2h3CzE4Ow4Pm
         PvnlzBlme9AmMUUM1AfWDIt/yFjZxtQRBPH8allV793Cw2vufNMFAWjsQ163qNlnq14h
         VbcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP7+uSDnf4OeCJIg/Y23afO7tIt97K5i7UO9b8/11crZrulJoART2Ulopt9tnz8RZjuk7YUQJ3ja0/R7FoOdKKMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHxWMBWfIRR/xpmxqpoHjhZxPhiXCky5c8pbpsyXOe5QPgIEZg
	VifWQU1peee3pGXK9ukqgpQqQBZ4la9fKq9//E1xV4fTpSzLw9IcxFVhqe988jPhQugdGj6FXJt
	/ODcEeoEUmcJi57svkRCMIkB09a6rmrM/7eFYrINaS/z3x7H7eYr2p8u1Ba4cEo0g2kziFQPqjv
	cRBb9nQodreSkX1jaS383WjeWnznUpvoqqFCv3sF/uTzSV5f028EniCyBAIQ==
X-Gm-Gg: ASbGncuvEVUORKv2zCwpC+XdLjgeru5wjEY8iOXhH4tp/dhydGDsup/wN8OkCuMc+aZ
	Jm8E2CFRwoPFEP6HP9ActaZy4fxoE4V8PGERPf+awfPxrU8LPz/RNhqjrtQ20ktlzN/iWVAnvFE
	eAc+LYBpKwr4ysUvH+qw==
X-Received: by 2002:a17:902:e547:b0:240:3c0e:e8c3 with SMTP id d9443c01a7336-2403c0eec24mr101515515ad.51.1753800405167;
        Tue, 29 Jul 2025 07:46:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVKF2FMKNdYcAnD/2vryvn4b+ajx9Y+g4WCZD3am/Gwd4qsgOa/AIjhVYvQMxbge2ffckf3mGmydVQe+Vw09U=
X-Received: by 2002:a17:902:e547:b0:240:3c0e:e8c3 with SMTP id
 d9443c01a7336-2403c0eec24mr101514545ad.51.1753800404116; Tue, 29 Jul 2025
 07:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de>
 <20250729-mesa-libclc-panfrost-v3-6-42559ddc93ef@cherry.de>
 <t7yu2iynfa5vewdnzliamq7u3b5ufppjpanm53n46m7pqhtop2@a2y2gfbu2lud> <8df98858-1aac-4314-ac6e-b43b7593aee5@cherry.de>
In-Reply-To: <8df98858-1aac-4314-ac6e-b43b7593aee5@cherry.de>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 17:46:32 +0300
X-Gm-Features: Ac12FXzBcleAtFjd99aJfGg3QGhY3GXMQj_qmay86a91Z607zqT0iKlsSf4Kt8k
Message-ID: <CAO9ioeU7ZLuh4GgizRestPgq_ztRjh6we2pnAEQ2Q_BYit_otg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 6/9] mesa-gl: drop egl/gles from default PACKAGECONFIG
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+yocto@0leil.net>,
        openembedded-core@lists.openembedded.org,
        Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
        Ross Burton <ross.burton@arm.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: Wf7c_A120sIc02PzhNvhE8b2YIskx1l9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExMyBTYWx0ZWRfX/rHoH7rVFGxe
 ndIFypZE3xPKUqPMOnmgX10gXaZ1OQbLKHLYLdiP5CiysOA4Fr6sY/bfLFC44YaTpELir3x8Yyl
 5nI56Nj0dQTex22FcZvflYNHlmVwXzsNQdZv0CsQqx7Pv0ZBNMSvD2HIktBnEWXABkQ4YRnUsrz
 fmm69kvvqYAI6b7PVRZZhz8msZHn0DRI+Uy2dP+DRFrDp8PgzwGfKyP+r1i/9m9DWJy2q5VgLXB
 frNp0meZLyARQa5eZwwM/jn9s7TjfjbjsMnNYo8GTqASoF4oFgtsszARiaQ+l15IMOs3GEZQNh0
 3bbvlKBmG8bC2v0pebHwMJYES8KGL49cVLqhXCOlT+zKe9SWRCW9NY8vu1EM+/gDHtdg7Iiv/Bn
 rU9IzNa0TGp8boBZpFD/LdHvJvNhriVqgUDN44ooyySeiBKgcbctWgDXxeszjy7Di7K0xv3h
X-Proofpoint-GUID: Wf7c_A120sIc02PzhNvhE8b2YIskx1l9
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6888ded8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3NFMqL2YfYjnS58Zr_UA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 14:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221080

On Tue, 29 Jul 2025 at 14:07, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Dmitry,
>
> On 7/29/25 1:02 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 29, 2025 at 11:36:27AM +0200, Quentin Schulz wrote:
> >> From: Quentin Schulz <quentin.schulz@cherry.de>
> >>
> >> According to the introducing commit log[1] and Dmitry's recollection[2],
> >> the whole point of mesa-gl recipe is to provide GL library in case there
> >> are vendor-provided GLES libraries.
> >>
> >> Therefore, let's remove EGL and GLES default PACKAGECONFIG as if people
> >> really need them, they likely should be using the full mesa target
> >> recipe and not mesa-gl.
> >>
> >> [1] https://git.yoctoproject.org/poky/commit/?id=015cb13a67c672de30f5384dab5ab4b8db305281
> >> [2] https://lore.kernel.org/openembedded-core/5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn/
> >>
> >> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> >
> > Please squash this into patch 1, otherwise you are fixing an error that
> > you've just introduced.
> >
>
> I've not introduced it, it's been like this for years already, I'm just
> moving things around in patch 1.

Yep... Maybe then this can be a separate commit before #1 - fix
mesa-gl PACKAGECONFIG.

>
> I would argue we should have the moving and the egl/gles removal in
> separate commits because it highlights there was an issue with how we
> used to configure it. Patch 1 isn't intended to change anything in terms
> of behavior.
>
> I have an additional question though, should we make PACKAGECONFIG
> "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',
> '', d)}" like we thought it was before patch 1 in patch 6? or is what's
> in patch 6 good enough? We can start with that and people using mesa-gl
> can trim it down further if they want?

I'd say, replace ??= with = in patch 0. It should be fine then.

>
> What do you think?
>
> Cheers,
> Quentin



-- 
With best wishes
Dmitry

