Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAE2CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 01:49:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.22021.1758419358319108601
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Sep 2025 18:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VY2yKeHm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KNZYJS003474
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 01:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hsm2dsgDySTNjJwL49fGEDA5
	hqU0ETsnd+pLG0xS8Ps=; b=VY2yKeHmxMfzk56JasF3BLzJyOIweRRzxTRF0sRJ
	CVHMJiwSZTDu9UsVtBmcyfD76xCploY1dVLOEvyIU26WS8ByGqCAL1mLJH8WYxGu
	BZijJllPV2qJmJ9A0upQdHdEr0y32GfAfrxomtEKDmg2yGQTMYcc4llVMnrcrs72
	O4K5d+j8151UDfyPac2t+6C1XH5C2mgEdnnWohZCOvxtSRlkt6cEWn/0Q+NFQYMZ
	PSiPUobcpfSqYrrUYvNJCh0KBUCTQQBr8ss5GiqY4p5sjVVfj066IYVVmnPrqt/+
	KEGJDfPQ1TgiLd0CGDU7GfcR7Oz/19jiAP2CW6WIcMikXA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nj8sd8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 01:49:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b49666c8b8so58283101cf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Sep 2025 18:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758419356; x=1759024156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsm2dsgDySTNjJwL49fGEDA5hqU0ETsnd+pLG0xS8Ps=;
        b=cjUcT0shOmtm73nvWUyUSoBD0JbgCOjFVB8cLcLDzbt+KaWx9pbzKsQNRssYhhFKk0
         OHPfw+C9pXqToqRlG0sFQUKMZVeTl7BbBX2tJPT6ipEDHR+wDbgPn/VVXcFWyr9JqUsw
         1JMtOtHg9zSUY+i7n/M3pA3CdPKpUsIFTv2WqMFkvPKcY0xQVepkOjUaH/vmYEhzoskf
         q2M/ZrsBA5hBQIfW5RRORMQ64YrTapD4YMIC5LLtcEFQL/RdsNDSlKtWF0/jKMB2M6bW
         C/bfEzKXy93XN9LxF+yof/cNOBu1sUdTMaCt9tElzPrOiZyZOhuTIzv59XHDtwPvLyIV
         0E5A==
X-Forwarded-Encrypted: i=1; AJvYcCWR0FDzBeAE9tHzEg8DY5Oq2w8IaD/+GzmUkSKvFT02W65TVVWPTHIUUJJFNbpadSUkY8Zv72QG3EE2LTimamXkEg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyIcearmQL7mbSU0eHUel6WpiVADMVYf2HVDRCNz1slCmtDMy7t
	mMY5Tqd/Wc2wxGLH0vF+dNO/bMCRlBjEiJmXiAQiTMiNR6RolgxCMZCYgERP83+6aoc4HeQ/aZx
	tzv/Hi9ob/PFOuKpbPkNhdVVSYpJCPiyJVbZR1Rf9qu/DdK5xQJM6MhZ6gE2m1NibIGic9U+Re/
	C/Tmcx3uA=
X-Gm-Gg: ASbGncvf/ZXlbUPB7Z80AyNW/XS6bmeFTgqaJ+AjID1dy+PtOf6shhvQ7HCgOhU8gqd
	eeQyVuXa7BJ4kjIEGUYk7fOYXeamQdIiCcTKe07o0pnUXq5SbNyvbxLNfDQsUs+GkGw36iPndby
	hMBisL0OtyxaMLFIu4Kwj8VNVcW0cXt/hqE0g9R95GEo0x3ynYPlLIy+4tN1eyFvizukEGI7tx0
	OHOOQBEkclsqSCeCVRAtvSRP+tYZs1MpT3hBknf1izgp2d166RyuL4f/tNxcr9gKt/GnyaHRmVW
	vSfSNTyMpy1fx3yZmoSrW7nM0bpkWIeH8EpOWFJfJdOoBW2zym7vcShUDFyzgun5Vmjr2xtTK8w
	t3IGSVKzuDXR8D4LSQIrcq01LNDyV8vHbIkAR4aQseKtJ2H+Fxd0d
X-Received: by 2002:a05:622a:14cd:b0:4b5:d739:627b with SMTP id d75a77b69052e-4c0737ce027mr105141591cf.76.1758419356048;
        Sat, 20 Sep 2025 18:49:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ/GcTEYi753AUey1mpb43MmLbsV1UstHobmgJ7KUMHNXmtGuN2sHkM+m9zA+cDr2bHU4fOw==
X-Received: by 2002:a05:622a:14cd:b0:4b5:d739:627b with SMTP id d75a77b69052e-4c0737ce027mr105141381cf.76.1758419355496;
        Sat, 20 Sep 2025 18:49:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57b1f76ad64sm814937e87.150.2025.09.20.18.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 18:49:13 -0700 (PDT)
Date: Sun, 21 Sep 2025 04:49:10 +0300
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
Message-ID: <njiio3x6gcmkr2l66ik2bdcdo5lp65zwc4tdknnredmbtgd6uv@566hczdxilc6>
References: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
 <DCA05S64WG23.38E7E260MAS7S@bootlin.com>
 <07cd1d3c-4d67-4e60-b3d3-75953784f70f@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07cd1d3c-4d67-4e60-b3d3-75953784f70f@cherry.de>
X-Authority-Analysis: v=2.4 cv=dZ6A3WXe c=1 sm=1 tr=0 ts=68cf599d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=iGHA9ds3AAAA:8 a=1-QtvcaaK5VB8CfW3k8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: Ei-8TxXWfscCEwgBbD6nrjF-yhlq4Psn
X-Proofpoint-GUID: Ei-8TxXWfscCEwgBbD6nrjF-yhlq4Psn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MyBTYWx0ZWRfX0jHUNrKPErDz
 mUuC89UHAyuO3ewmaTwuW2nt3nyoEvWfY3JlbGEsnSECEDEOby+9iNpJiR6DqByaAsIJLLMkVyE
 9uvwiaJ2DZ2VDimSDv9DjqrlMtNr1yFV3k6/mesIgSCg/RQ+ikOnAtk4Xe/LSr678SZEU26DNed
 MMtajJQma+8jriqIYHXdHBr3ZqE1MvCeDYBPAKxhcSimpm03esIC1kI08eC6fcnIz4Pff6D54sB
 LYsz4gF/Qlk1/WxS0iTLJMUndO/vg5VRoQY+vY5hfmfVLo79RrpFHeOyPXysFypPDjC0lGzQY/0
 q+d/dA/zOnbWoCUZ2WnWiqylsfGSR1gtCOxfGKpr/6iPxf1ZPBw0+ckx+qhHva6Id45zxtgLKGC
 TULD/ad9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 01:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223784

On Mon, Sep 01, 2025 at 04:51:49PM +0200, Quentin Schulz wrote:
> Hi Mathieu, all,
> 
> On 8/23/25 8:01 PM, Mathieu Dubois-Briand wrote:
> > On Fri Aug 22, 2025 at 2:53 PM CEST, Quentin Schulz wrote:
> > > @Otavio, can I add the new mesa-tools-native recipe under your
> > > maintainership in meta/conf/distro/include/maintainers.inc, it is after
> > > all still mesa?
> > > 
> > > Panfrost support has been broken for a while already because it now
> > > requires libclc which isn't enforced by default. This fixes this
> > > oversight.
> > > 
> > > While re-adding support for panfrost, the build time for libclc were a
> > > bit too much to my taste and I tried to figure out if we could lighten
> > > up the dependencies for the target recipe and it seems to be the case.
> > > 
> > > libclc brings very expensive dependencies such as llvm and clang.
> > > Building clang and llvm for each target architecture is very expensive,
> > > but mesa allows to depend on prebuilt host binaries (mesa-clc and
> > > precomp-compiler). Those are built by mesa as well, but can be compiled
> > > in mesa-native instead of mesa, making the dependency expensive but only
> > > once regardless of the number of target architectures to build for.
> > > Ideally the mesa-clc and precomp-compiler would only be compiled in
> > > mesa-native if target mesa requires libclc support, however this is not
> > > possible as a target recipe cannot impact or depend on a native recipe's
> > > configuration. We thus have two choices, always build libclc in
> > > mesa-native with its heavy dependencies and impact every build or force
> > > the user to modify the mesa-native recipe in a custom layer (as a native
> > > recipe cannot use target's OVERRIDES). The latter is unacceptable so the
> > > former seems to be the only option. Another big downside is that
> > > mesa-native currently builds drivers (amd, nouveau, svga) which we may
> > > have absolutely no interest in building, increasing the build time and
> > > possibly dependencies list).
> > > 
> > > A third choice is to spin-off the native mesa recipe with libclc support
> > > into a new recipe without drivers and only what's necessary to build
> > > mesa-clc and precomp-compiler binaries.
> > > This allows to keep a "clean" mesa-native recipe for whoever needs those
> > > drivers built-in (e.g. for testing, for qemu-native, or whatever else)
> > > and only bring the libclc dependency when required by the target recipe.
> > > 
> > > Because libclc is now only built for the host, opencl support now needs
> > > to explicitly bring libclc and others to build as libclc won't bring it
> > > in the build environment anymore.
> > > 
> > > Note that this was essentially only build tested (run tested on RK3588
> > > with panfrost though).
> > > 
> > > Note that building gallium-llvm support on big.LITTLE architecture with
> > > TOOLCHAIN = "gcc" (the default) currently doesn't work as llvm doesn't
> > > support big.LITTLE architecture in -mcpu/-march which is passed to the
> > > CFLAGS/CXXFLAGS/LDFLAGS via the TUNE_CCARGS. I haven't investigated
> > > further than that but that prevents us from building opencl support for
> > > Rockchip most popular and powerful SoCs right now. One option could be
> > > to force this recipe to be built with clang toolchain only whenever
> > > gallium-llvm is specified in PACKAGECONFIG (not tested). Though that may
> > > be not straightforward seeing the comment in libclc recipe related to
> > > forcing the toolchain to clang.
> > > I'm also not sure mesa has a way to specify different args to LLVM-only
> > > drivers but that could be another option.
> > > 
> > > Runtime tested on RK3588 and PX30 with kmscube.
> > > Partially runtime tested on PX30 with opencl-cts (and rusticl; it fails
> > > after some time but could be kernel related as it starts failing after
> > > [  968.625506] panfrost ff400000.gpu: gpu sched timeout, js=1, config=0x7b00, status=0x8, head=0xa68d200, tail=0xa68d200, sched_job=0000000019e6f20d
> > > 
> > > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > > ---
> > 
> > Hi Quentin,
> > 
> > Thanks for the new version.
> > 
> > It looks like we have a build issue for riscv platforms:
> > 
> > ERROR: mesa-tools-native-2_25.2.1-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'expat:populate_sysroot' (multilib variant '') could not be found.
> > The pkgarchs considered were: qemuriscv64, allarch, x86_64_x86_64-nativesdk.
> > But none of these manifests exists:
> >      /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/manifest-qemuriscv64-expat.populate_sysroot
> >      /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/manifest-allarch-expat.populate_sysroot
> >      /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-expat.populate_sysroot
> > 
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/379
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/396
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/362
> > 
> > Can you have a look at these, please?
> > 
> 
> Ok so I believe this is because mesa-tools-native uses a different mechanism
> from other mesa recipes to be a native recipe.
> 
> mesa-tools-native inherits native + -native in the recipe filename.
> mesa-gl/mesa simply adds native to BBCLASSEXTEND.
> 
> The issue I believe is that mesa.inc has a DEPENDS with expat (and zlib) in
> it. In the case of BBCLASSEXTEND, non-native dependencies are suffixed with
> -native to be native when building the native recipe. But in the case of
> inherit native + -native in filename, it doesn't.
> 
> To validate this, I did a simple
> 
> DEPENDS:remove = "expat zlib"
> DEPENDS += "expat-native zlib-native"

I took a glance. I think it would be more idiomatic to write something
like:

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ddcf3b774a37..5a303538d7be 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -41,7 +41,10 @@ do_install:append() {
   fi
 }

-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
+DEPENDS = "makedepend-native flex-native bison-native libxml2-native chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
+DEPENDS:append:class-target = " expat zlib"
+DEPENDS:append:class-native = " expat-native zlib-native"
+DEPENDS:append:class-nativesdk = " nativesdk-expat nativesdk-zlib"
 EXTRANATIVEPATH += "chrpath-native"

 inherit meson pkgconfig python3native gettext features_check rust


> 
> and compiling mesa-tools-native on qemurisc64 then worked just fine.
> 

-- 
With best wishes
Dmitry

