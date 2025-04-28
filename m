Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAE5C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 23:04:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.63811.1745881432983712181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 16:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TmL+wxPM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SLvJHH019294
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 23:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dn9mhXO6z6RP4SK3S4Thu3tPjEjlfif8PY+xk3Lq544=; b=TmL+wxPMuL9mzF/E
	+swtKiFNn43kJgWozeRPWQfKuPlfJuzJcrbKJhMnSDdcAhwTeXssb/ThBna8cirb
	wVSe1cD7FgKwWiw/27vTzIRr9HOpFELFe0bKkIliaAT4pEcPrw7M1KCWcYsoOITm
	OooPMoJ94Mn2cnzdsNF7gix6YpZLN8wm6zyZq4cqd3F+B+AOOYWdctBxune80t4N
	Gb2IvNaIn+iwGeta5MBChct4sy+TBH/N7rO73Scsuya5QralZCmwAyWXwc+m42KU
	v2ZuzsudTcyeVzRbt0WSuZm45itB++ZKvpO+6b3tiAzT1VhmP7Hzo5gEovwAa7tf
	yaH8Uw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmjknh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 23:03:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff64898e2aso4592572a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 16:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745881430; x=1746486230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dn9mhXO6z6RP4SK3S4Thu3tPjEjlfif8PY+xk3Lq544=;
        b=WmWIYiSbJlz1jt4pyp8Js04RzuWGDg1Ycv+pOeympzQ5Vx+ZbKfs/iZNIFIqDTmnUY
         cBpyp6n9BEv6c5JVvjy72lkiCQWldI+fPzReVOFYvE79OfQqCNWkPxl8O1MZcqflJJ7E
         ejztlZnGy0wNxOlmcji3DZb4QV2f8nqVJRFw2/Tkz4ZQDCD3sHwOoZTK+RDZIdCIwZN2
         ymdG+j9SGmMep8qckp4XtFwqKUoECHwMsdGSUZiX2fgYbzNE6hpVZWkeHIZ5bNkVtOFK
         xLvJf5Ni7ya7LEdwxp11R4Ue8ukRxcqc8ZPIOqlRk3PD14lT7U/LcVCY5eaE5Bk/r/w1
         OnaQ==
X-Gm-Message-State: AOJu0YyOfBa6jLOgQbBPWPH1sc3Fs4+2/1v7WyUKIHo31yT/27fpvtx6
	0mVCbe8pnQYAzmEm1Uy6cth1O1qY7j7gWzC9dSxBfMAiRiDo2iuDDLtBcrdEGYUDauu/Njylk18
	6SZlUCGPPwl2HPKacJiur0uJjXVKvKsqoiYGoxeYp3p0FACTSiGX/2P7f3XcNs1Qut34Xcx6hkI
	Ha9zRbm3qaEAx7dCjXyQrPx0PbCOya6ApJ9cc5jkbsIzEOS8De6Qfz7g==
X-Gm-Gg: ASbGncs7Klrq1+8lRhUR5/zYK8IOv3A2asTEb+mEs19kmDLDApbxLiMgcsskG7Iyv4m
	UthdyQw1zKdsJRKBBL5d6FyOkm/IqWu6Tnq2ZFnr9pw8wFFWA+o07ojBH2UxX/5pKIR9MLXDDkq
	adkvqyy3012TSDYF9FNBNN5SH4
X-Received: by 2002:a17:90b:4b8d:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-30a22456a3cmr1171231a91.7.1745881430141;
        Mon, 28 Apr 2025 16:03:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+Hs4BmrX5BDL5hhaEywjaOVHeiW1mxJie7Xa08RyC+x4CFRuZ139BQJFI7xJkaQEu2cALStCMJ3bMl2dYQPY=
X-Received: by 2002:a17:90b:4b8d:b0:2fa:2268:1af4 with SMTP id
 98e67ed59e1d1-30a22456a3cmr1171180a91.7.1745881429527; Mon, 28 Apr 2025
 16:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
 <20250426-clang-merge-v4-8-42d205904261@gmail.com> <tims4g3kpjke7bfqfbvx2sfc5y2avhiyixn2sm7cgvwmwt7lid@3il6kjlvkpcd>
 <CAMKF1sq=x6caiTm_ixio56zVsg_rjLR9189vKHkQKzF7hD6HDQ@mail.gmail.com>
 <CAO9ioeWvPcSRt0kRNiPpnZQU+QDfMc9kbDZ_+PgzpLuzQJSbqQ@mail.gmail.com> <CAMKF1spY4-3SHT85oRU30SeLzYQA7kSvKczP6-OsHjwn7LNfZw@mail.gmail.com>
In-Reply-To: <CAMKF1spY4-3SHT85oRU30SeLzYQA7kSvKczP6-OsHjwn7LNfZw@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 02:03:38 +0300
X-Gm-Features: ATxdqUESd9lppWrbKkH3FB6qjJI6l5WcQ2Rc2zo1KDaOPjLfk5E1AK0pLGhYRfI
Message-ID: <CAO9ioeXR2JRBLMw_r-yqB4gU4=DHe-6SYLxfEP-M+Y=14-QyOg@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] mesa: Pass needed clang flags via BINDGEN_EXTRA_CLANG_ARGS
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: QUD6tPB2AONUvQYRuDJMcorQMorDrBa_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE4NCBTYWx0ZWRfX6AX9LdfBztuZ 0DZgq0wQdW7ZCOGtYfNhW/UTDsLbDueEUt1iQkPJnDMbtSBFmcxeZzaOh+ATMb8q8zHM0tpU/XG awHv+93qB/sRflY5UrZjzyveKsNOFHjrhZBluD1V+kJq5sOphkFS9o1jUxOpv8egS6FvC8Agbse
 5e9v9oVGQEydPCCkOJAd3XtiGq+3AklzEKVF0zNvLsy50GnPx8Ov/RP9VRhBBdxBqpC8kMif6t0 BZTlpPwuzKX0fj66Z5Y3u9SuLc1VUwBLrSWT0EL18UYYNf+NCH7T2l4ZvbpqLa5in0IPqPKBHkc z0hYQD9kJTbRnmW8JCyXMPoaEOk+S3CJMhI6+dISiNIBhwVzELBDGh+YKy3+IYuYQp17+1KaL9/
 ta1RQ5NYUqzJ97XxHXg9j02voBi4Wnkrryaphz3twP1lUuLM++3eR2vDvZBTt5oFl77I+YCm
X-Proofpoint-GUID: QUD6tPB2AONUvQYRuDJMcorQMorDrBa_
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=68100957 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MgGyTzT6hEBBYu1eiEsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=742 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280184
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 23:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215645

On Mon, 28 Apr 2025 at 20:10, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, Apr 28, 2025 at 7:56=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, 28 Apr 2025 at 17:51, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On Mon, Apr 28, 2025 at 4:03=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Sat, Apr 26, 2025 at 08:16:47PM -0700, Khem Raj wrote:
> > > > > This is needed for clang to find the c++ headers when invoked via
> > > > > bindgen
> > > > >
> > > > > Fixes
> > > > > | /mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-poky-li=
nux/mesa/25.0.2/recipe-sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: f=
atal error: 'cassert' file not found
> > > > > | Unable to generate bindings: clang diagnosed error: /mnt/b/yoe/=
master/sources/poky/build/tmp/work/cortexa57-poky-linux/mesa/25.0.2/recipe-=
sysroot/usr/include/llvm/ADT/DenseMapInfo.h:17:10: fatal error: 'cassert' f=
ile not found
> > > > > |
> > > > >
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > ---
> > > > >  meta/recipes-graphics/mesa/mesa.inc | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > >
> > > > This way we have two sets of bindgen/clang args: one added by
> > > > meson.bbclass, one specific for mesa which you patch up here. Pleas=
e
> > > > pick up the attached patch instead, it makes sure that there is onl=
y one
> > > > place to specify bindgen args for Clang and documents the reason fo=
r SDK
> > > > packages requiring special handling.
> > >
> > > This is breaking mesa-native recipe. Why is bindgen invocation specia=
l
> > > for meson? we have other recipes in
> > > e.g. meta-openembedded which pass this variable from recipes and have
> > > finer control over
> > > recipe types that way
> >
> > mesa-native worked for me, what is your build configuration?
>
> I have this
> PACKAGECONFIG:append:pn-mesa =3D " opencl libclc gallium-llvm "
> PACKAGECONFIG:append:pn-mesa-native =3D " opencl libclc gallium-llvm "
> PACKAGECONFIG:append:pn-nativesdk-mesa =3D " opencl libclc gallium-llvm "
>
> and I am building for qemuarm64 on x86_64 host and sdkhost.

Yes, this is my config too. I was building poky + these entries.
Anything distro-specific? Maybe a clang toolchain?

>
> >
> > Putting necessary arguments to meson cross file was a recommendation
> > from Mesa developers. I think we should follow it instead of patching
> > environment variable in recipes.
>
> Is this recommendation from meson too ? I think no, so we will be
> carry this locally moreover, meson
> is uses to build more packages than mesa and adding mesa
> recommendation for generic meson
> might not be ideal.

I'd say, it is a meson recommendation - they added an entry to the
cross file instead of making everybody use environment variable.


--=20
With best wishes
Dmitry

