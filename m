Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 620AAC369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 19:32:29 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.23397.1745263948839950085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 12:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=K6wOiFlo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIgEp8000701
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 19:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQKJwKJmtvz2LuJ3+4QnREqxqhmkZYmRooUZk2nhwsk=; b=K6wOiFlo/NXh1dKM
	w8uE+uGh7dT84WeShsT+yc3JqfEydSYb477QFF7BjgpQAvAXbJ6UPDu3dNjDw7l+
	6H8Y5qmLLVruasJ3IMgimPpQ2rmgyraXius5pGD7+pRqGAdjiQxGlI/n7jH49MAx
	lVcJvz5ckUv5SKJxllBuzjMwM5E02qDsVWtCpqaBtWer9dMMuVUQuZn/ZO83d7QO
	dnN7mUfFniWO2WWkmyGP0ACzDm5Ex4GhlEOnBCe4uX0qDVNTm5ntV8wuUkhcz3KS
	kMTVzHbv1Uhihpn/UFNMcDQ2jMrdopGXHa7MnCtcF52Cb3bLuPxBJDRF6dEpnjSg
	wbZIEg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46450pcyqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 19:32:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b0dae76ad9cso2094022a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 12:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745263947; x=1745868747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQKJwKJmtvz2LuJ3+4QnREqxqhmkZYmRooUZk2nhwsk=;
        b=HIJExpQVRltNODBCxMBKStIbtBZIdCJEVpBNm/tNo9pKlajb7aa8pfWpXvJCbXY2Sx
         tKbhNmbyxjTDpVj0BircsAlQuTw3R0hwE8mgL9x9t6kjvcuwTV7QLfJW8MNFZuzVKty+
         07rGjCdbxxuHyM9B/E0cgi4uwaj0Vp3buPMZyVdOn7AnZe700lDmiX5+B137EY2HOO+E
         UeI+AKdBVZRl4SHCkkPiNvhmNYP5f8irbWHepubBvAaW8+60TGiyzd3L+E5iPhyjudjF
         En/u5EcQOUKciu5aFxRhKxWWIaEltPBO0Rzt4ul+vi6olr4EECNVO2tbEss39JeodBYA
         7bjg==
X-Gm-Message-State: AOJu0YwJEqHxWkuqZoSuze+8ZVHQMGfDyoZ2DfjSFjBx6nxNMZ/kEM/6
	8pN8PwO+9vGUIrQsJxaf0ePtspY2uRZfvaCz5JzjcFiA4Rt25V3eAzsLvVVEwVHjMyHuLFGY7UY
	PpRAd2qtbiQXCQ1seXsBkoTi8t9mt25U26D5pDCfB+X/ewegcTE4SHxlXEkrLQyZIp2GkEHeJ8N
	Ow5mKbC9ksawZ9qRgA0d08WJlhJvVl22Vh8p3fBphyN3mANK26YoERLA==
X-Gm-Gg: ASbGncvk+oeQwmd4OmT+AgCQoK9fTkSABONE//9ryMdtthZJFzLbGAkoR5FX2JxgPvI
	ynergsH/5tMbYx29IYh8803Rgcr45m1I7AljjL7aJ+sjqoUWzxeKf8S+US4HpfHH3Jw==
X-Received: by 2002:a17:90b:17c5:b0:2ff:5a9d:937f with SMTP id 98e67ed59e1d1-3087bbb1dbbmr19894215a91.24.1745263947174;
        Mon, 21 Apr 2025 12:32:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6dqQtiXPs5PzEAlOCMFxufyI4hylzaxcPkQBdRznBK2QCa5gtmkj/XpKLKGxg8wlO4wj4nsEVtiLPMEza1oE=
X-Received: by 2002:a17:90b:17c5:b0:2ff:5a9d:937f with SMTP id
 98e67ed59e1d1-3087bbb1dbbmr19894178a91.24.1745263946600; Mon, 21 Apr 2025
 12:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com> <CAMKF1sr5VLmBKmrr8Q05C7aaZi6OK7JHS9DKEZyKo4eihnusgg@mail.gmail.com>
In-Reply-To: <CAMKF1sr5VLmBKmrr8Q05C7aaZi6OK7JHS9DKEZyKo4eihnusgg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 22:32:14 +0300
X-Gm-Features: ATxdqUEFRrDDSZyN2OVmUyG-UucovjIcc9hl5MptzRMZl1E1R-ksLYogRER_L3g
Message-ID: <CAO9ioeU8zhRVX_BgB3Pp_psH49gJt+jeE92TcfrZZoaL-HjUiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/3] mesa: small improvements after 25.0 merge
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=68069d4c cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=7sJ9-i1n-r3UAIRViSMA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 0WpGzSgET1c4im0SCjUhcDsSabtCzJoL
X-Proofpoint-ORIG-GUID: 0WpGzSgET1c4im0SCjUhcDsSabtCzJoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 19:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215183

On Mon, 21 Apr 2025 at 18:22, Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Dmitry
>
> I have picked these patch into clang-merge-2 branch.
>
> https://web.git.yoctoproject.org/poky-contrib/log/?h=3Dkraj/clang-merge-2
>
> They help with some mesa-native build failures however, I am still
> seeing a build failure build mesa-native
> on musl targets. I am not sure why target should matter but it seems
> to see the error

Note, the error is about 'required file', it usually means that the
dynamic loader is not found.
I'll try reproducing it locally.

>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/150
>
> Error is that mesa_clc is not available before its use. Interestingly,
> it never fails locally here but it always fails on AB. Is there some
> sort of build race or something else going on?

And this is usually because there was a uninative-enabled build in
sstate cache which is now being reused for the non-uninative.
Let's see if I can reproduce it...

> Would appreciate help.
>
> On Thu, Apr 17, 2025 at 5:57=E2=80=AFPM Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > Several bugfixes after Mesa 25.0 recipe was merged:
> > - Replace the bindgen patches with meson-based fix (Dylan Baker)
> > - Bundle OpenCL C headers
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Dropped applied patches
> > - Add the bundle-opencl-headers patch
> > - Link to v1: https://lore.kernel.org/r/20250412-mesa-25-fixes-v1-0-791=
840391271@oss.qualcomm.com
> >
> > ---
> > Dmitry Baryshkov (3):
> >       meson: pass -target and -I to bindgen calls
> >       mesa: drop the bindgen patch
> >       mesa: bundle Clang OpenCL headers into meta-clc
> >
> >  meta/classes-recipe/meson.bbclass                  |  1 +
> >  ...d-an-option-to-force-inclusion-of-OpenCL-.patch | 57 ++++++++++++++=
++++
> >  ...vide-cross-compilation-arguments-to-LLVM-.patch | 67 --------------=
--------
> >  meta/recipes-graphics/mesa/mesa.inc                |  9 +--
> >  4 files changed, 61 insertions(+), 73 deletions(-)
> > ---
> > base-commit: 53c772c941d5ce69ab89f35cd04724b740daf269
> > change-id: 20250411-mesa-25-fixes-5a38fe55dd3c
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#215115): https://lists.openembedded.org/g/openembed=
ded-core/message/215115
> > Mute This Topic: https://lists.openembedded.org/mt/112324544/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
With best wishes
Dmitry

