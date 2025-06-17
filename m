Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA2CC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 10:26:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.15372.1750155963614937318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 03:26:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gJ6QPv0R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H7Hvqv019970
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=So3roZaZBe3Tn+IgS0NdMzaB
	c9nbOeoBBM9fZvnQsS0=; b=gJ6QPv0R2M2E4w41Ma0VvnTUWDRaxexoVkZ19jx5
	8TCQ70anbPvb/rgxVM9sN5JW7TkKJKcaXeyrITdQ1sG9XSGED/WKE2D1uMsSM4WK
	OzZeGe1hgpSOF0KuA/Dy2Cs3GvmntmbN7FriJImj7J1pj83anKM7mdOTWzyBBaOM
	kxCpdvkPXvVAg/6cf+o87kUZyKQJKCRwERibBhMcrQH6e1NhA/NYkYPk+4JeWbMV
	bIeluOBw+VPu/DpPvz3XEtzVAsUHmuWjCPIYeOebMkPAw6YCJIM55pOxTxXqAC5g
	/M3WwxW/IsGw4QeBonjyDJLq+OR6HhuK4pvhZgM5KM/EbQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9yys4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:26:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3138e64b3f1so6692176a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 03:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750155962; x=1750760762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=So3roZaZBe3Tn+IgS0NdMzaBc9nbOeoBBM9fZvnQsS0=;
        b=GCQ6ah0m5O5tVcVVA+oYWZXoeIh2h9KqtVJfEebHKbZudI/YKO3xS6FuKBO4Q9nXVv
         nCKlVRHcBOElLBQfmD3ItVXj0wcivTGCrqJWI1Tiyh/9UkqVKoC0WqBxc30OYSUCOUJM
         BxTH9ziB9NwFDxVKS53DZzKWFuRbASONrthT8NVrx/IMR440XBvAUwJGp4uogYL8hz8N
         YNm5dVZZ2sZnWSgLHuYMJKVD5BqG4Evl7BBSh1RXKq8tbDhxoVKNkIjHc8MJBnnfeFoS
         wF5giegoOgX6eVTnbu0FKnIhh4hV3B24dHTAfBukl5lVuNwNywJeDDRJNrlpud8uAmfe
         NfKA==
X-Gm-Message-State: AOJu0YxkCtgvBz+3KmWASv50rFk39MXfhBR2FlLB3EcGMOfExq40GrkU
	TrXOvancoOvd18DyhbYZpS1DfwBqGSBSl5/lTAZN7b/WcIZAarIvsCTVnxnVBDDfzqg4seU+Xom
	t3/R0dH0fG8AJaFzDR6GcGg6EerEE3qA6UqOZ2NhpBDStmj9xHRfXwIOgJai1TjLCGlEzkDBE/w
	2hB0qRrIMO6zyU+g+JWOngTcpDz2+rqJBIGQHqByfhMfLMc+md/DAzqxyT93bmAYvv7mmu
X-Gm-Gg: ASbGncvIYVKwqtybqgWB1KpOUTL8z0tkKUY5knmcct9F0qfHlgiwjhOnOUxaTALw9QU
	1E0EtPLPUiI+qYxgkb4Ytr7+TnpYplKIgtilHl3Ma7ufZGc8kGMEOuoEf6eJpq+MyxEehQB26Xe
	tHnijnMrDeQyUsY270N/kC4fFXC7cX+fg2YGw=
X-Received: by 2002:a17:90b:39c5:b0:312:1ac5:c7c7 with SMTP id 98e67ed59e1d1-313f1ca7855mr20606754a91.2.1750155961831;
        Tue, 17 Jun 2025 03:26:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLevT0kdF4z8A7tCGjSL2DajZ4ALjEURHnhRYwVrVlpzlIDEeBtDDfHxgXACN+sQPNhW41kFTKAwWNwkTGGjo=
X-Received: by 2002:a17:90b:39c5:b0:312:1ac5:c7c7 with SMTP id
 98e67ed59e1d1-313f1ca7855mr20606722a91.2.1750155961217; Tue, 17 Jun 2025
 03:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250616161037.1518306-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250616161037.1518306-8-dmitry.baryshkov@oss.qualcomm.com> <07dd28a5-b214-4d95-8d27-276044768324@kernel.crashing.org>
In-Reply-To: <07dd28a5-b214-4d95-8d27-276044768324@kernel.crashing.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 13:25:49 +0300
X-Gm-Features: AX0GCFsUAO1lC0O8zfLuYLQb02Ea6gUXvDOXCLWB2r0Yw8MavCmRuGQXPAZ6U8k
Message-ID: <CAO9ioeUOvn7jfeCBsK3Nc=V2EL03QtRv9Xa4qijz-tW0wn=C-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 8/8] qemu.inc: handle GLVND-related providers
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: lsgObaJoxmMxOHvV4Sa0CD8hpLmoZh-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4NSBTYWx0ZWRfX2hApERaZtZ2v
 8DbZCTNp1TRDwmmV8p4+rPH+a7KmcDUN4GSsULaL2J45rjA/mmqow/5sVsxHOc8iuUMJlEvF+pN
 OvWXRfz/nysDg/BBsO1l2Qg/XRYRvg5pUXsJK2BBqXQaYcBoGyQsrjNDdnaspuz4IQxLgOT3p/w
 EWeZFD37fgnq7hB3PxpQKIOl893ApzDbyxVFF8qCnNGdmNatSyzv584pLnich+o3TkICHSUP5EB
 K0ZETsry37ISqIVygjo3lof15tIiftqgf5VfJpsFxVpOY7DRGi5Co7+8EA66RClkvQRhLBflFXZ
 TQkuzr1SB1kYQuucJj0GihLFmRUYpVLSnuYCQuW2TpbTLyihZCFVpiJDjqPHoZcEw2maklGqE1n
 agqsvXNMB6b0xxzj2xbBqyArJLgEgPgOD5IgePmbeR39xj2VYFSsPCgwIP0GooBrQFn8RG4z
X-Proofpoint-ORIG-GUID: lsgObaJoxmMxOHvV4Sa0CD8hpLmoZh-G
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=685142bb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=Q4-j1AaZAAAA:8 a=wMNdZWldAAAA:8 a=EUspDBNiAAAA:8 a=2ZR8wxroBhVroVlZ6GkA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FUarYpL4UH3yWsho8X8J:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 10:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218878

On Mon, 16 Jun 2025 at 23:20, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>
>
>
> On 6/16/25 11:10 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> > If GLVND is enabled, then libglvnd is providing all OpenGL / ES
> > libraries. Tune qemu.inc to select a correct package in
> > this case.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   meta/conf/machine/include/qemu.inc | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> > index d7392d476238..4fa18812dbc3 100644
> > --- a/meta/conf/machine/include/qemu.inc
> > +++ b/meta/conf/machine/include/qemu.inc
> > @@ -1,9 +1,9 @@
> >   PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
> > -PREFERRED_PROVIDER_virtual/egl ?= "mesa"
> > -PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
> > -PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
> > -PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
> > -PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
> > +PREFERRED_PROVIDER_virtual/egl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
> > +PREFERRED_PROVIDER_virtual/libgl ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
> > +PREFERRED_PROVIDER_virtual/libgles1 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
> > +PREFERRED_PROVIDER_virtual/libgles2 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
> > +PREFERRED_PROVIDER_virtual/libgles3 ?= "${@bb.utils.contains('DISTRO_FEATURES','glvnd','libglvnd','mesa',d)}"
>
> The above is interesting.  The defaults for these are already specified in the
> distro/include/default-provders.inc.  This should be where this kind of change
> goes (or in a specific distro or other conf file if the defaults are overwritten.)
>
> Setting these in qemu seems like a duplicate and really looks like the wrong
> thing to duplicate unless there is a specific machine reason to override the
> default provider for the system.

I think there is a difference between DISTRO-induced defaults and
MACHINE specifics. But I agree here, it should be fine to drop those
defaults.

>
> Unless this doesn't work, I'd simply remove the entries from qemu.inc.
>
> (you already dropped the other duplicates in the qemu files, which is definitely
> the right thing to do.)
>
> --Mark
>
> >   XSERVER ?= "xserver-xorg \
> >               ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#218842): https://lists.openembedded.org/g/openembedded-core/message/218842
> > Mute This Topic: https://lists.openembedded.org/mt/113673610/3616948
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
With best wishes
Dmitry

