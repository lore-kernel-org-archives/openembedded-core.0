Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6947D46617
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:06:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2576.1768503984411994125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 11:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=BYT7/X9f;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ajW2CgKZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY5Xp347630
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tW9/6L/AsPW/28M0SRdK+9gJ
	07L+hMdTAr8BilX9WYI=; b=BYT7/X9fGB+8VPh6itONBtg7zRxT7mTPvEtk8Dat
	hoqNGAoYki4hHmwoIqy6UcgV3Vzq3/SDvri0abWJhd4NEsz9Tlk4LI37QeLpFaF7
	zGEL42S3Bec0Jrde5tYDmdcwKXLlqc6gjNUqREMItQTLW3A2Sxy+cOchYB9GGMsH
	rm+85VaWOMbIfc90bN4utyScYMfj6V8SBPGgSvOE87gn2jDGBwAbfJy3qId2dUxV
	FbVSiTsDJw2IlAnJrvpBR06qowcf/6Q0n9iLTmTa9YmYKpunFyBtOhM4kH3SWO3g
	V5iZfWmDUHhRuwMw+nZ9HVoAIQz43llrM0vaOMjUSnMpFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpy07sg22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:06:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0bb1192cbso12159625ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 11:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768503983; x=1769108783; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tW9/6L/AsPW/28M0SRdK+9gJ07L+hMdTAr8BilX9WYI=;
        b=ajW2CgKZfleopaKKMhgbZfGq9gDhoY+2S4feS7z/UDxVPwY/I29JE7z3TKWkRWujir
         RVLQd0q1zHMqq5vS29RpeIujYl0/6O47XvI7Xjpbtzie0jfzBh1WTjmaHAx41pqRDpd2
         6xdqHSDTyTfIenXx9ibrplFvwpITRlIWXBkF+u7j3u0PVEWsKt2JQEAJiBXNz/awsSIC
         JotqOBgF1Ww7FXcAt/BKz3HxOuQZ8cWUPXLbf0X5qYpIwBq4k/VAm3yYKT0QmqLIIw9S
         eclo+euSLXooyRX6iO+kv3h2RnUsP1nqPc04Alx5FogQulzsdTvxbz1R8NOY95SA8e6B
         WF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503983; x=1769108783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tW9/6L/AsPW/28M0SRdK+9gJ07L+hMdTAr8BilX9WYI=;
        b=f7s7TwI48VMT7T9+9M41z/L+z3SZp5hzAnCkZb2xGh3jV4e4hdNYUoiyzGMV71feiD
         zC6qv7fMkAYJ0Y+jukHeAX2C4hkAq7CQq1jkATKPHwAwdPwbQO4zehuP9wniJFSDc9tp
         kAujdTCYIf87HITxE7MtHK7P1aV0iN6c658o6rjIYrH/n4eTRhYeX7C1ieX5eI1EFqA1
         0b+v43FqmAOFxhY6Zg7SUZW3CCViUwHy7lGFfjJAEJoGRocTMW+fcgZgM9B/FAFL+6PK
         m/2Yny7SVXQmGLENHRBmHP3TJAfvAHUTv6pWxxRYQJlhppbV1Pt18Z2Ifsde3NG6U6Dv
         oxIg==
X-Gm-Message-State: AOJu0YwOa8gNfnAddH9J2BxCSut2rM1hc8o3E4x0oii8AGSjhVCL0NrE
	mmvbEniOdZ16RqnKAefLs/DbsobrfiSLFJvuBGizvcFgUdGoONABIT67A0JMNVyTDbsA4w3hNKa
	NiKDaDR3QRj+IC7RVzjQ4kGOhutUFUIx9m46DtHGT4OvMxO/15g4OWepvK3G9MkTRPx3uRGPqZq
	Ng7+3r3H3PiwrKigK0s/tNGLwcfmdbZHJBVwU9ZdWluwWyQcUomn/wD4X6lDhNFuzHkQ==
X-Gm-Gg: AY/fxX55e/rWuwzUFlW5UR/uI7z2voAEmujXAaO+m34G09zFXVa5M0ve1opnQUVJzJ9
	jwiDmOB1DNT6WgEggnSl4T3HbC6kR3xAh2fB5qnDNpSnUQ9MGjHkvcB0Nm6qkuiHXpNHHbxsNtE
	ltrqQh3aP7ARYwe6LlyJdh/IW6rZn6OannsBKR67RRpvAQzNJsEEEhopdvYv3AXbBLVw==
X-Received: by 2002:a17:902:e785:b0:297:f527:a38f with SMTP id d9443c01a7336-2a7175349bfmr5842695ad.18.1768503982503;
        Thu, 15 Jan 2026 11:06:22 -0800 (PST)
X-Received: by 2002:a17:902:e785:b0:297:f527:a38f with SMTP id
 d9443c01a7336-2a7175349bfmr5842425ad.18.1768503981937; Thu, 15 Jan 2026
 11:06:21 -0800 (PST)
MIME-Version: 1.0
References: <20260115032458.2775110-1-dmitry.baryshkov@oss.qualcomm.com> <DFPB57SVHXHM.3URJ37NIHTAC6@bootlin.com>
In-Reply-To: <DFPB57SVHXHM.3URJ37NIHTAC6@bootlin.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 21:06:11 +0200
X-Gm-Features: AZwV_QhFVDNL288E1KJ54e_jQX-P13vPutP9VwL9FDTcmEA8r_8l3qMOCgQ00IA
Message-ID: <CAO9ioeV3HrOzPXWWROw5_Q+-JRSWgpYdgfXKrfT8iQsdcCO=9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: drop VDPAU remnants
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: vPQg_LsmreX_7qMO9T95bV-UXt5JIMw5
X-Authority-Analysis: v=2.4 cv=fMw0HJae c=1 sm=1 tr=0 ts=69693aaf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8
 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=xdbL2CGX7RCRtPEdIH8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: vPQg_LsmreX_7qMO9T95bV-UXt5JIMw5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0OCBTYWx0ZWRfXydpukbpfYdPC
 pNysQxm5Gx8y1mGeSJaByzRPqxW8dttZn23OOfQDOXHhid3ww/FMK9Cgk5fygXn219DHRWeNOd7
 FqyUB8Jb0jk5pN4bYcll999GGKQ/VY557qAJG8mS4acflyqFbAmveVWD/gix91axZroiv0IqT6z
 zlF9C7U1pqsYlTMeFto15VWKyOcOyypewzVpxv4xxlr0GaFs9L5zC8O41ogtHLHZO/eT/046FcA
 byVHqbkA/BVUDt4kqIMmU5S0miz4u8/qlQju8JJ+bN6aQkHBquZAnIdsl7iPVet8/odUQ6mWyqT
 hfk0ZbQ6wssL5YOiua60ZBL81mN1uuiQGP7DZoNC1YPEwGTphdC/pwT1S2hgRGfoB7fO8l+I7RS
 t6nsS8M73jrdFiKS0EPZZf9PFkjcVd1E/qP7B/VsegN4tzddqIGtb5knihdi4V+bSGSrskgNOs1
 SavWunl52s4zFUUZYzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229433

On Thu, 15 Jan 2026 at 18:36, Antonin Godard <antonin.godard@bootlin.com> wrote:
>
> Hi,
>
> On Thu Jan 15, 2026 at 4:24 AM CET, Dmitry Baryshkov via lists.openembedded.org wrote:
> > Mesa 25.3.x dropped support for VDPAU. Commit 88e26a937549 ("mesa:
> > upgrade 25.2.5 -> 25.3.1") has dropped most of VDPAU-related items,
> > but it didn't drop mesa-vdpau-drivers package (nor did it drop VDPAU
> > bits from mesa-dev). Drop those remnants.
> >
> > Fixes: 88e26a937549 ("mesa: upgrade 25.2.5 -> 25.3.1")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  meta/recipes-graphics/mesa/mesa.inc | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> > index 2547f8a68f02..a82bfb613549 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -251,7 +251,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
> >               libopencl-mesa \
> >               libteflon \
> >               mesa-megadriver mesa-vulkan-drivers \
> > -             ${PN}-vdpau-drivers mesa-tools \
>
> I think this was based on master-next which used to contain
> https://lore.kernel.org/r/20260109123232.1199822-3-joaomarcos.costa@bootlin.com
> ?
>
> But this patch was dropped after review.

Ugh, I still can't get myself used to patch reviews, which don't end
up with the master-next changes.

> Can you re-send this series based off master? I can't apply your patch at the
> moment.

Sure, I will!

-- 
With best wishes
Dmitry

