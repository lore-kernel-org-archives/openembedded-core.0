Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F75CAC5A7
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 11:24:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.49803.1758540248103874585
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 04:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VROx8txx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7pFWR006023
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 11:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sjNh9xYWBJdb8mH4V1mfOi6c
	z43LhkIASq/LknPGXZk=; b=VROx8txxAtW8ybe+SXHDCHDf2yjUFuCLL+47S6F5
	RSnL3vQUaAE2srtjnjQH1Mh5qkt/v5cBlIJ0zDdNv5HMAN/9ycKGMGxhgipP+U2A
	IpghlfwpdhjUssvjw54O4Sm5Vjfqf/Pf2mZu1Gcyutjq7Ex9/F0HO0kfAkeJ3wPJ
	/PfQ3bZX7hs8CHFktpQJb6f3to/Hqdf5ZWEiorivP/eqVksSzEHKm15CKAyfmR5Y
	ZL9XRAH3iXAQoshahJiWP8nJeuGRXDQiizuDkXNCzUuwnkC6WauIdeSIlnDYhIrv
	KVeW/tssVhN31sHWjLfoqyErp5SOC6Y36qNxWv4fztB8kA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b2e10px5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 11:24:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5f6eeb20eso153184271cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 04:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758540246; x=1759145046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjNh9xYWBJdb8mH4V1mfOi6cz43LhkIASq/LknPGXZk=;
        b=CuQZp60+Ubka2PrsbmnlKs/keEdoIipieSPVPFRFPESeaatChTgQ68l5xF1XQYBpc6
         YQmTOs81fr19qjObUdxawtD/EezbQ4iX7Xt53yJoKhtQglJZOpIG7zICL3H3HvduY/dm
         V1qRX6c33UmMuKVq+r5vJ50/4CxSaW8DIJ5WFGHjvDTH1LMTvR+kGRiTIoeqII99HZtP
         bxhnwdZX9dQMe0zKN5zBHib8X7HxYdGcPAv3xUobrL1pbqyHNjLB/FisWME7c7BvxDHW
         MdooRC+mqxq0eWqapqTDUrTGwGFIOUEXEsawLXpGrESfcbBmNgkfctyvYo5Nhk5JG/oL
         swaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVixZmWZvMMOHgmsnxtpDyPYNA3o3NwxO7lf9bTrxMikOgi5YgIODhGmZXkEhp7yxZy0Zbsi66mcLIYDRAZHxJVGg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4U/abNHjVihrXVYXXaJ+KXyFmFIsCz4UQEga3i+pzxqP5itYl
	SC9+VLKWaPLtBufOrgI7CnUwq4VBq7J1/xKOgQbzpCNdqWzL10WsTzCJeq4RQsQudbvIJwTeB4y
	4Ei+6X+S8rhjesB+wsfPExEXNV9NKDeKeXMlCUi+6UNy3y4DHiJWrSHSwko5DsH3qWrfVHkcep2
	pvOQOWaS8=
X-Gm-Gg: ASbGncs7gq9qvrQD2z+qfib7Y+pQyYgTUAd4E1xAb8Uf02r05kwWIfIElZxb1FnapgA
	nmnlI8IQUChhD0Kdo0Fe3pEu44wjI/dd79TtRUU/eDu0vNsDvpL9kruLQnvKwgSk0ErPiRTC4Xz
	skFQ80/5PF+lS2rTIkzirMV3V/WDBFiT97MYjRh6ZkqlFubNkaFJMJyMz39CrzqHKXAxMSMmY7B
	bLuQpakM07oPLHDfYZkomzhP/lTKh5I3J9oxYkxreo4fgOu+RNPlFGM8LTY5kRvCCjNrJSlZbHi
	/V24RbuXfEUwGElZ0QrnUcj2u8TtAHqHcTF4Ca25W1efLCB05n0VZOMJO0Bj+nlDRSI2xz6IQsw
	OalAgVGdsknMrzfklN3qmnl5S3VAIYTg14p4Gh+2euR7P2CnZ7BxR
X-Received: by 2002:ac8:5755:0:b0:4d0:ef92:2575 with SMTP id d75a77b69052e-4d0ef9229e0mr5003921cf.55.1758540245761;
        Mon, 22 Sep 2025 04:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1UWU0YsWOIz+aum78ZZXbODFbMAy91ZKgGbH2fMn8TLF02IdsfJW202+AiMFsZ//HJH6wcQ==
X-Received: by 2002:ac8:5755:0:b0:4d0:ef92:2575 with SMTP id d75a77b69052e-4d0ef9229e0mr5003461cf.55.1758540244990;
        Mon, 22 Sep 2025 04:24:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f4479fsm3260101e87.12.2025.09.22.04.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 04:24:04 -0700 (PDT)
Date: Mon, 22 Sep 2025 14:24:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Quentin Schulz <foss@0leil.net>,
        openembedded-core@lists.openembedded.org,
        Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
        Ross Burton <ross.burton@arm.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH v6 00/14] mesa: lighten up target's libclc
 dependencies and fix panfrost support
Message-ID: <yj4ml2ubylwluyvu66qsq5f7yoxdzubrpwnumafv4pregayumx@xky2kreirrtq>
References: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
 <DCA05S64WG23.38E7E260MAS7S@bootlin.com>
 <07cd1d3c-4d67-4e60-b3d3-75953784f70f@cherry.de>
 <njiio3x6gcmkr2l66ik2bdcdo5lp65zwc4tdknnredmbtgd6uv@566hczdxilc6>
 <f6a19aeb-9a05-4e14-8933-0ab10ec9e569@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6a19aeb-9a05-4e14-8933-0ab10ec9e569@cherry.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA3NiBTYWx0ZWRfX+2Pc+HNzofxU
 rxt6SmMECLFLQLpIQsC5mId75RxUd93Z1r4s1tt0vpmmhq7gZ96SGBRKuBcfpkdnC2nWWhKdS1x
 VM01+q6VKpRUbsKRSiBg3wxpGt8g/eopLTj5QgrzqoAzZSJGvSzAs0D43GRZ9TXJX8zY0+Vo5/G
 5R8+9AUfM/x6wHO/qjQHexjJXDymO2ncdk51tAspYhv1GSZt7aRiBJRilgVk9n7QzyBZNVmR29p
 gGhyDRe5EjhKcJGqJgxoAfCW9rfspuTLPA3P3pUV7Rqu/SNTR4QjKFm8i1Meawkrb7P3DGDsga/
 +Yz8LAQgsU17b8etkGW/36iO6qmK9sSI7yE8LeIQUEWzNFOLjg046B/OItdXxjb6W6fG2Zis2ZF
 64ygSTiN
X-Proofpoint-ORIG-GUID: 5MUN2ZY_0IBLes78Y9QwFpB2S_uGYnTf
X-Authority-Analysis: v=2.4 cv=HM7DFptv c=1 sm=1 tr=0 ts=68d131d7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=G-ZnL5elncBWzKWoouwA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 5MUN2ZY_0IBLes78Y9QwFpB2S_uGYnTf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 11:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223817

On Mon, Sep 22, 2025 at 11:37:01AM +0200, Quentin Schulz wrote:
> Hi Dmitry,
> 
> On 9/21/25 3:49 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> > On Mon, Sep 01, 2025 at 04:51:49PM +0200, Quentin Schulz wrote:
> > > Hi Mathieu, all,
> > > 
> > > On 8/23/25 8:01 PM, Mathieu Dubois-Briand wrote:
> > > > On Fri Aug 22, 2025 at 2:53 PM CEST, Quentin Schulz wrote:
> > > > > @Otavio, can I add the new mesa-tools-native recipe under your
> > > > > maintainership in meta/conf/distro/include/maintainers.inc, it is after
> > > > > all still mesa?
> > > > > 
> > > > > Panfrost support has been broken for a while already because it now
> > > > > requires libclc which isn't enforced by default. This fixes this
> > > > > oversight.
> > > > > 
> > > > > While re-adding support for panfrost, the build time for libclc were a
> > > > > bit too much to my taste and I tried to figure out if we could lighten
> > > > > up the dependencies for the target recipe and it seems to be the case.
> > > > > 
> > > > > libclc brings very expensive dependencies such as llvm and clang.
> > > > > Building clang and llvm for each target architecture is very expensive,
> > > > > but mesa allows to depend on prebuilt host binaries (mesa-clc and
> > > > > precomp-compiler). Those are built by mesa as well, but can be compiled
> > > > > in mesa-native instead of mesa, making the dependency expensive but only
> > > > > once regardless of the number of target architectures to build for.
> > > > > Ideally the mesa-clc and precomp-compiler would only be compiled in
> > > > > mesa-native if target mesa requires libclc support, however this is not
> > > > > possible as a target recipe cannot impact or depend on a native recipe's
> > > > > configuration. We thus have two choices, always build libclc in
> > > > > mesa-native with its heavy dependencies and impact every build or force
> > > > > the user to modify the mesa-native recipe in a custom layer (as a native
> > > > > recipe cannot use target's OVERRIDES). The latter is unacceptable so the
> > > > > former seems to be the only option. Another big downside is that
> > > > > mesa-native currently builds drivers (amd, nouveau, svga) which we may
> > > > > have absolutely no interest in building, increasing the build time and
> > > > > possibly dependencies list).
> > > > > 
> > > > > A third choice is to spin-off the native mesa recipe with libclc support
> > > > > into a new recipe without drivers and only what's necessary to build
> > > > > mesa-clc and precomp-compiler binaries.
> > > > > This allows to keep a "clean" mesa-native recipe for whoever needs those
> > > > > drivers built-in (e.g. for testing, for qemu-native, or whatever else)
> > > > > and only bring the libclc dependency when required by the target recipe.
> > > > > 
> > > > > Because libclc is now only built for the host, opencl support now needs
> > > > > to explicitly bring libclc and others to build as libclc won't bring it
> > > > > in the build environment anymore.
> > > > > 
> > > > > Note that this was essentially only build tested (run tested on RK3588
> > > > > with panfrost though).
> > > > > 
> > > > > Note that building gallium-llvm support on big.LITTLE architecture with
> > > > > TOOLCHAIN = "gcc" (the default) currently doesn't work as llvm doesn't
> > > > > support big.LITTLE architecture in -mcpu/-march which is passed to the
> > > > > CFLAGS/CXXFLAGS/LDFLAGS via the TUNE_CCARGS. I haven't investigated
> > > > > further than that but that prevents us from building opencl support for
> > > > > Rockchip most popular and powerful SoCs right now. One option could be
> > > > > to force this recipe to be built with clang toolchain only whenever
> > > > > gallium-llvm is specified in PACKAGECONFIG (not tested). Though that may
> > > > > be not straightforward seeing the comment in libclc recipe related to
> > > > > forcing the toolchain to clang.
> > > > > I'm also not sure mesa has a way to specify different args to LLVM-only
> > > > > drivers but that could be another option.
> > > > > 
> > > > > Runtime tested on RK3588 and PX30 with kmscube.
> > > > > Partially runtime tested on PX30 with opencl-cts (and rusticl; it fails
> > > > > after some time but could be kernel related as it starts failing after
> > > > > [  968.625506] panfrost ff400000.gpu: gpu sched timeout, js=1, config=0x7b00, status=0x8, head=0xa68d200, tail=0xa68d200, sched_job=0000000019e6f20d
> > > > > 
> > > > > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > > > > ---
> > > > 
> > > > Hi Quentin,
> > > > 
> > > > Thanks for the new version.
> > > > 
> > > > It looks like we have a build issue for riscv platforms:
> > > > 
> > > > ERROR: mesa-tools-native-2_25.2.1-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'expat:populate_sysroot' (multilib variant '') could not be found.
> > > > The pkgarchs considered were: qemuriscv64, allarch, x86_64_x86_64-nativesdk.
> > > > But none of these manifests exists:
> > > >       /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/manifest-qemuriscv64-expat.populate_sysroot
> > > >       /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/manifest-allarch-expat.populate_sysroot
> > > >       /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-expat.populate_sysroot
> > > > 
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/379
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/396
> > > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/362
> > > > 
> > > > Can you have a look at these, please?
> > > > 
> > > 
> > > Ok so I believe this is because mesa-tools-native uses a different mechanism
> > > from other mesa recipes to be a native recipe.
> > > 
> > > mesa-tools-native inherits native + -native in the recipe filename.
> > > mesa-gl/mesa simply adds native to BBCLASSEXTEND.
> > > 
> > > The issue I believe is that mesa.inc has a DEPENDS with expat (and zlib) in
> > > it. In the case of BBCLASSEXTEND, non-native dependencies are suffixed with
> > > -native to be native when building the native recipe. But in the case of
> > > inherit native + -native in filename, it doesn't.
> > > 
> > > To validate this, I did a simple
> > > 
> > > DEPENDS:remove = "expat zlib"
> > > DEPENDS += "expat-native zlib-native"
> > 
> > I took a glance. I think it would be more idiomatic to write something
> > like:
> > 
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> > index ddcf3b774a37..5a303538d7be 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -41,7 +41,10 @@ do_install:append() {
> >     fi
> >   }
> > 
> > -DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
> > +DEPENDS = "makedepend-native flex-native bison-native libxml2-native chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
> > +DEPENDS:append:class-target = " expat zlib"
> > +DEPENDS:append:class-native = " expat-native zlib-native"
> > +DEPENDS:append:class-nativesdk = " nativesdk-expat nativesdk-zlib"
> >   EXTRANATIVEPATH += "chrpath-native"
> > 
> >   inherit meson pkgconfig python3native gettext features_check rust
> > 
> 
> I would prefer to have a PACKAGECONFIG option for expat and another for zlib
> since it seems from my reading of mesa various meson files that both are
> optional.

expat is required for Intel tools or for XML driconf support and
optional for v3d driver. Zlib is also used by Intel tools, v3d driver
and for compressed shader DP support (or it can be replaced by zstd for
shader storage).

> But we could start with this to move forward and revisit this later on once
> someone has time and motivation.

Ack

> 
> What bothers me is that both suggestions rely on the fact that DEPENDS will
> never get a non-native recipe as dependency, which is kind of implementing a
> ticking bomb.
> 
> Another option I thought of is to move mesa-tools package from mesa recipe
> to a new mesa-tools recipe and thus make mesa-tools recipe both target and
> native (and likely nativesdk as well). This eliminates the need for a new
> PACKAGECONFIG or fixing DEPENDS like suggested here, but this likely
> involves the user changing PACKAGECONFIG for both mesa-tools and mesa
> recipes to include whatever they need and keeping them in sync if they want
> the tools for the driver they are building. I'm also not entirely sure it is
> possible to build all tools from mesa for drivers while not enabling the
> drivers themselves.

Each time I see 'keep in sync' it makes me worry a bit. I like your
current approach of enabling drivers necessary to build host tools.

-- 
With best wishes
Dmitry

