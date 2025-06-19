Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6A2C7115E
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 08:56:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.10427.1750323363167464792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 01:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=naLDOvC1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J8u2IE024085
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 08:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KFVQ9gYA+ytg4O2kr0dtGQU5
	bySCIt4VqDoJfweiB8E=; b=naLDOvC1CKDQp5v2ohOSVpacrftAOOuXcYVSRKoH
	ooRl8BllOHRn2OYiVSxLgnyCI+vzP4X7fmpCcgAvwxD8rf18e/t0TaStz8MgGbjb
	P1aJWOK+jmlQ2aNSFIL72GimQZEnWG/xvxowzea78PavDCNGxr2SoIDaTVV62y7H
	yFxCQB6Hy3Duy74dGBB/U5x7S3D5rEX2FclqP0myoKhWj8jjZzk3jzoaEAmyvjAv
	T/2MYIoz3SafU6r5Y4gOIUB6cA6HCP80XebrgbRzJh41zTfLkGxMmbBxR6ZLCXF9
	beI78WqdSFkWp8PpCHnHmZGrilPVU8QGQHpvQJNJasye9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw13bac5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 08:56:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3138e671316so604567a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 01:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750323361; x=1750928161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFVQ9gYA+ytg4O2kr0dtGQU5bySCIt4VqDoJfweiB8E=;
        b=AMHzvvtA6zthYrI3AYCD72sMYnI28ZYi8Eat8eenVCEKXz7S0dUW2+URnYUXwUg8At
         2Mp5A5HbUP0fD+BUlkOCQwNzTDKCyHO3dtlBxs6wt+3MNXZqXph0YmogCJIpyStiWcca
         coVhOUBN4dH04EUZZLn8OCWH2Utj8ov1imrg/DIGUrqcBoPKA8Z4ZPEXqiVCSM2479XP
         p6G+kYIegFVE7Z4LQOpxFnfzCQVTxG5trRUCuj4en4s/MBqGsZq13fBBRj+LhamK2YRp
         yqaK+avuHgy50npjA5v9HttClV3JjNRN07oNm4UtGhV/IlSV6CrH8x/ef2OKDsibyLkQ
         2ZIw==
X-Gm-Message-State: AOJu0YyyYO57tIY8XfbTHKjioK/8PCVUh+608gmOP4uGTkEFHKuGAq7a
	pG0ZRqKYMPzaXM2yraSXIhrwwq+ufN1iiB54rh9xKB6H7d8tvKlASuO/6T4bJiZO+2lMrjhYTiC
	P2qSFA5iLMXUo0eeHWpwb3pptN40RwFzn+N/+nN7jE5lPcwajR0CJhbR2zwawUCoy7TA3Qkq3bX
	sGsQW6Wb/Ctenk6bmIuyQjv+4yBGze49LNV3Yu04voxl/DCf3D6ZJ7Yfmloj7OnUyiqViU
X-Gm-Gg: ASbGncv+VyQtK6W4Ctu5v19hIrEpZ51CnGL5nPhVQVd+YNgMtJLNk3U+jpI7O825Kzj
	WNiRtY5QEwN/619H+3okkYX6F7W3FiO1m55UAft9/NSLsAiIqDSDKlp5BotfX6TS3YHxu7FgYmd
	yQXw==
X-Received: by 2002:a17:90b:582e:b0:313:f995:91cc with SMTP id 98e67ed59e1d1-3158abb3820mr4145041a91.2.1750323360856;
        Thu, 19 Jun 2025 01:56:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF75XUbsBGKR4nm5ionht9lBAUBBa2ZSkVvlEoduBtmAmUMv0krblJJ4n0qEnoDFWncPcrsOEUV9nWJtLfWQgA=
X-Received: by 2002:a17:90b:582e:b0:313:f995:91cc with SMTP id
 98e67ed59e1d1-3158abb3820mr4145001a91.2.1750323360239; Thu, 19 Jun 2025
 01:56:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250618212055.1529969-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250618212055.1529969-2-dmitry.baryshkov@oss.qualcomm.com> <DAQCIVNY2M23.29XYUTYYDNS0L@bootlin.com>
In-Reply-To: <DAQCIVNY2M23.29XYUTYYDNS0L@bootlin.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 19 Jun 2025 11:55:49 +0300
X-Gm-Features: Ac12FXz63MPD2BhJvT2HRKdjHRHNe8DmzW-oK558B2i3kQwh_qXkpEf5SyOKnus
Message-ID: <CAO9ioeV3rJiexhFzPcBwva3VD59cnzwKUnWrrm5BtEo9WXD3mg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6 2/8] qemu.inc: drop duplicates with default-providers.inc
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=6853d0a2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=p-h8gJ9D79QGYdxliDMA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: VlQmOJXBLqgGKO-4s9_bdblTSwkk-nhf
X-Proofpoint-GUID: VlQmOJXBLqgGKO-4s9_bdblTSwkk-nhf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA3NSBTYWx0ZWRfX7xbQ6pm6SFJM
 N22YaFvzRKe7N+uKrz5bIF5Qz3OVF5EtK2IgzcN8mzYPB2amkCU39GA9T/DL9ps3RN2rDHQEiB9
 k6tv/TaB74AWvxzS8bKEFe++L7LLgnW8qccXH4rq9/HeF3ZxDb5TD4MOfoyio7TxWOOYht8S8Ap
 MqOF4pYC/f9v/nOsEafAyWH01Is52IUz9wcT4Y5zlV84bcCLVFa0/LCWGVMEYz0VDZRL894ZgJq
 SDasnDCRMNnkgB5Qhe27xbcXDpuqgB+7yoXRHTnrYmOkE6SH1VNBqM2IXBRfDlx34IHWgtR5qcV
 C+1o3nWlAONBb7Qh8flNxv80M8qB9tt2axvS4uK0liuE8g1OrDijs2VEK+JEyx1L9rTteauDiCf
 hE25kWPnAQCWljgsPxDsnIk76UXbDrEgf0YtYIYdhub8CjwrdFETj2uTHQb9MF2rXqbMQW6M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 08:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219061

On Thu, 19 Jun 2025 at 10:53, Antonin Godard <antonin.godard@bootlin.com> wrote:
>
> On Wed Jun 18, 2025 at 11:20 PM CEST, Dmitry Baryshkov via lists.openembedded.org wrote:
> > default-providers.inc already includes PREFERRED_PROVIDER values for
> > xserver and GL libraries. Drop the same values being set in the machine
> > config.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  meta/conf/machine/include/qemu.inc | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> > index d7392d476238..c143e37f710e 100644
> > --- a/meta/conf/machine/include/qemu.inc
> > +++ b/meta/conf/machine/include/qemu.inc
> > @@ -1,10 +1,3 @@
> > -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> > -PREFERRED_PROVIDER_virtual/egl ?= "mesa"
> > -PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
> > -PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
> > -PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
> > -PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
> > -
> >  XSERVER ?= "xserver-xorg \
> >              ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
> >              xf86-video-fbdev \
>
> This conflicts with your previous patch ("qemu.inc: handle GLVND-related
> providers"). Should this one be refreshed to:
>
>   diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
>   index 4fa18812db..c143e37f71 100644
>   --- a/meta/conf/machine/include/qemu.inc
>   +++ b/meta/conf/machine/include/qemu.inc
>   @@ -1,10 +1,3 @@
>   -PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
>   -PREFERRED_PROVIDER_virtual/egl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
>   -PREFERRED_PROVIDER_virtual/libgl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
>   -PREFERRED_PROVIDER_virtual/libgles1 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
>   -PREFERRED_PROVIDER_virtual/libgles2 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
>   -PREFERRED_PROVIDER_virtual/libgles3 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
>   -
>    XSERVER ?= "xserver-xorg \
>                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
>                xf86-video-fbdev \
>
> or should the first one be dropped?

The first one should be dropped.

>
> Dropping the first one for testing for now.
>
> Antonin
>
> --
> Antonin Godard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


-- 
With best wishes
Dmitry

