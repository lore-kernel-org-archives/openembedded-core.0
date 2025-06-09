Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB2DC61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 16:17:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.64092.1749485846830091078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 09:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XufL77pb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599IP1p020541
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Jun 2025 16:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lzm9UIXLwNun5WrhqrfvW6Zb
	EWG8IEd43MB+jnSTjSA=; b=XufL77pbOox0bQVfubAgFmkd0OMFgLdBdulqXRi6
	JbmgOPO6V04B7Ts9LBcCygVesfperHTes4P+QTEYv5wQ2xsc175aD8Vk9iif28fZ
	VWir/Ogg7ksM+7HvKTKtRqYi2lzn0PWKIHc/KMF6ShGCNh8MMqeRNIdzJhseswks
	QUkprGswUuFUulUyFFTDbEIM6sD9zJU1qr04noRpjuuhxPN+Xxymyd8Bh0KUOfF/
	PAMKMqX9iwofl8nXpIXKodpc5l2l1lv/oFowCMJDoKPdjjMEfZUnpKM4e9uOIHVB
	I6GHatlNRK34JGlsGxLK3HwSu2IDQuBxTjF37TrhVRwwzw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6jed5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 16:17:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3138e65efe2so932638a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749485845; x=1750090645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzm9UIXLwNun5WrhqrfvW6ZbEWG8IEd43MB+jnSTjSA=;
        b=rW93VyELVqNVmlVIp9RDflS2A2iDlwllA3ugTACXvjFK7euSGbpjycvlZDoW9Y3qTA
         8tyXok8rLMvQ752nr94G+q1v/pNykA/ywbgf73BnxsBtkXC9n1G7wfNLnAZbbipG7/xi
         E1CLFY+ly340enlXM2OLyQdFcYTqnMLESCqQmXwSeMsYpphqXuZbLbMgKdpBneEr8Rds
         PU+TxP0+Unq3S4YV2WlhqiDYNKPjChWDD5thp8z1BzwgO5Bg/0damTPNiGoOHaqyBNri
         Ku2YQOKwFuDvcRXlU2QiqUYcGQ0ATGUrZ2feISIXHCsULNaJ+XKUp7k/WpHNLg6WPRFE
         CHRQ==
X-Gm-Message-State: AOJu0Yy6CqmGLBJ8e1pKHwU6XKvO9em1zebVi67At7XyVCokIKoAIVn8
	7Ft777P4/Wdv7EqPhhgoZrC5in8Je4NZUzlKOc9qTjDXvybGK28KLOpLPTYX7oPLNeX8ftgo0c+
	qjv0e3r7LESbVVMNsKpbktpxfxh/jxxGx2mMbKqycd2fR3yfADprPxZh+A0naO+xrvQJKUiP9SQ
	HzbJtFdQ2KmS4sqKJWkXitbj4ZI+jGYR0xoIelLsWyRYHOGePmydzODPP1Bw==
X-Gm-Gg: ASbGncv/1YKGsjfGa15DHxf+nFij2PEq9plHgbtvHoUaSGpQilw6BNIzGY0CtveVaQZ
	SSpD5vWMC1OWMEYS8IZKujEtwtq8o3w2p8T1rvsaVrY0znwT8U1sEhgfcBJ7q7TEzoF7S9Nuiim
	RszyHXx9AvibZ4Ew7ECw==
X-Received: by 2002:a17:90b:1c08:b0:311:b5ac:6f6b with SMTP id 98e67ed59e1d1-313472e721dmr20221925a91.9.1749485845085;
        Mon, 09 Jun 2025 09:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERwKmOF92+vgR0OyLY4xDT3ckUdOAQJL6nRd5ccAZFrKZS+I9euQO4OpP/97707oTdI4YRACHhSpTQR7w6btc=
X-Received: by 2002:a17:90b:1c08:b0:311:b5ac:6f6b with SMTP id
 98e67ed59e1d1-313472e721dmr20221573a91.9.1749485839729; Mon, 09 Jun 2025
 09:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250522171334.3040820-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250522171334.3040820-9-dmitry.baryshkov@oss.qualcomm.com> <DB5PR02MB10213DB92F7EB71D578B4A8C4EF6BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213DB92F7EB71D578B4A8C4EF6BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 19:17:08 +0300
X-Gm-Features: AX0GCFvKdrQBZex0qqpfoYwmlxar8DQvLoqth9md6fLz6QO2ujIj154QFaE0lAQ
Message-ID: <CAO9ioeX9zKF8GBDHiupAfdS525RhD4Hb+Ty6cdsw7g=Kzr0CwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 09/11] mesa: sort out PROVIDES for the glvnd case
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=68470916 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=3-RhneuVAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=EfqMrtYSJ6eyJuxBaKgA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=VLVLkjT_5ZicWzSuYqSo:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: lnGh3SoGJ45UFHwsbAKVJv7zFk-6B2Y7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEyMSBTYWx0ZWRfXyq219/fXQWTS
 yGGYYCn5eGGxxWX7rgp9MtS/qxvSkRmyXngIZ3NymaTomfQcZy0840XXayKQtlYk1OBB768WUwK
 tQoq1Bsz7woVEzb5ZEV5gZ5btcn3w+f3EGRQhuEZBHU3RHQvToB4rG7wvzd59vekyDTup07xkAK
 NPI7eTyI5CZOp8uQDB8EFjvMIQc/+vNRuRbYPWBA3vExfoYSJ1Num5C5IQ5Fn/XtwH8zg5Z1Fqq
 0cxsiC2dLWDtZ5odXOaOmOcOqVJcE8Ik47Gx1NcgrUipAeQv1HnGh5B4dUJ4nOiEXvThUDoJpO9
 MmReml2jCHhsA0AhBltoGW5lVm31xaXAWs3av7kB3dNM8emZ+n/VwnDjkHjUSh0/aUNP9S3ZKTH
 0r2v+Zyf2f94uKKTgMEDVWZGLbJIkz7nG2herZg3rqyAbzFpvuo/+IN+DBRwsm6c8yEWiKWX
X-Proofpoint-GUID: lnGh3SoGJ45UFHwsbAKVJv7zFk-6B2Y7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 16:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218297

On Mon, 9 Jun 2025 at 12:28, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Dmitry Baryshkov via lists.openembedded.org
> > Sent: den 22 maj 2025 19:14
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH v3 09/11] mesa: sort out PROVIDES for the glvnd case
> >
> > If mesa is built with GLVND enabled, it doesn't provide GL / GL ES / EGL
> > libraries directly. Instead it provides two ICD libraries: libEGL_mesa.0
> > and libGLX_mesa.so.0. Remove virtual provides from the glvnd case
> > (dropping incorrect virtual/libglx provider while we are at it) and
> > replace those with runtime providers (to be used by libglvnd in order to
> > pull corresponding ICDs).
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  meta/conf/distro/include/default-providers.inc |  3 ++-
> >  meta/recipes-graphics/mesa/mesa.inc            | 12 +++++++++---
> >  2 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> > index ee91af87968f..4f094163546c 100644
> > --- a/meta/conf/distro/include/default-providers.inc
> > +++ b/meta/conf/distro/include/default-providers.inc
> > @@ -7,8 +7,9 @@ PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
> >  PREFERRED_PROVIDER_virtual/libsdl2 ?= "libsdl2"
> >  PREFERRED_PROVIDER_virtual/libsdl2-native ?= "libsdl2-native"
> >  PREFERRED_PROVIDER_virtual/egl ?= "mesa"
> > +PREFERRED_PROVIDER_virtual/libegl-icd ?= "mesa"
> >  PREFERRED_PROVIDER_virtual/libgl ?= "mesa"
> > -PREFERRED_PROVIDER_virtual/libglx ?= "mesa"
> > +PREFERRED_PROVIDER_virtual/libglx-icd ?= "mesa"
> >  PREFERRED_PROVIDER_virtual/libgl-native ?= "mesa-native"
> >  PREFERRED_PROVIDER_virtual/nativesdk-libgl ?= "nativesdk-mesa"
> >  PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
>
> What was the point of adding preferred providers for virtual/libegl-icd and
> virtual/libglx-icd? AFAICT, there are no providers for them and no recipes
> that depend on them, neither in OE-Core nor in meta-openembedded.
>
> There _are_ runtime dependencies on libegl-icd and libglx-icd in libglvnd,
> which are provided by mesa. Should they have been virtual-libegl-icd and
> virtual-libglx-icd instead? Comparing to opencl-icd, I would have expected
> mesa to RPROVIDES virtual-libegl-icd and virtual-libglx-icd, and for
> default-providers.inc to set PREFERRED_RPROVIDERs for them.

Yes and yes. I was thinking about RPROVIDERS and then forgot about it.
I'll send a fix together with the next libglvnd iteration.

>
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
> > graphics/mesa/mesa.inc
> > index 4c61447031e3..ab8c22681fe8 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -37,11 +37,13 @@ do_install:append() {
> >
> >  DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
> >  EXTRANATIVEPATH += "chrpath-native"
> > -PROVIDES = " \
> > +GLPROVIDES = " \
> >      ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
> > -    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'virtual/libglx', '', d)} \
> >      ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
> >      ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
> > +"
> > +PROVIDES = " \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', '', d.getVar('GLPROVIDES'), d)} \
> >      ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
> >      virtual/mesa \
> >      "
> > @@ -275,7 +277,11 @@ python __anonymous() {
> >
> >      d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" % (mlprefix, suffix), "1")
> >
> > -    if 'glvnd' not in pkgconfig:
> > +    if 'glvnd' in pkgconfig:
> > +        for p in ("libegl", "libglx"):
> > +            fullp = mlprefix + p + "-mesa" + suffix
> > +            d.appendVar("RPROVIDES:" + fullp, '%s-icd' % p)
> > +    else:
> >          for p in (("egl", "libegl", "libegl1"),
> >                    ("opengl", "libgl", "libgl1"),
> >                    ("gles", "libgles1", "libglesv1-cm1"),
> > --
> > 2.39.5
>
> //Peter
>


-- 
With best wishes
Dmitry

