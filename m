Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09021C83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 08:00:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.7197.1753171212241009277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 01:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MUZWEUoY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7UBNF007509
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 08:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QwzlhwHN7Oi0qR+wYJPaLogy
	ShekilvwXiSAAQ8spXU=; b=MUZWEUoYckNuzuYIZoYbUXkNt+FDjg8TeRseMSuP
	Rsxj1IfNPsVxx6FyguPCbiPLChCCRlZddku+aEnB/UtcJDRBn3aARJR9auwWVFG1
	jYrsmsrCqTtkBpBAeb5htTqxWxTs14aaFPUf9Xu/37rlicNbvKBpPM16FT/Asx+M
	cSFibJPycmArxCal1x5OpfzPkYLNkwuEPvMzXYb0z7Uu/4DuvyHnD64IBjdwLYY/
	q0T6ZhPZ65tsVWiqf1z8UgRhkQOJFPXTk847E+nOkpjp1avyvrV3QBeC+pJJP8P9
	xtITaOEmx5DEjR2zV3eWq58uinaTN2/LJ4Rxjx9x1T40bQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459q4jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 08:00:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so1636654185a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 01:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753171210; x=1753776010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwzlhwHN7Oi0qR+wYJPaLogyShekilvwXiSAAQ8spXU=;
        b=az/ZOSoFmyCDXwH+Oq4I3r00aYU1OnnKdZUTKIpbuUZ+ej2inb4nUr92PLti/hBv6e
         cfyGeFr67b7yw1DsR3vF8+cVvZZqyyG5P/9wKW+fvPk3eAvuG64XxodelpsOrLE0WS3N
         sOrjYhC+gTGStMjP+cWH4FcmIZuXEV5MM0VibClbBtw+7Vcl69+CFn4RNeNWk07s1+YJ
         enpBW9DpwBuld7EARbw2X1del9skCtyjWmJyAZjVxfx55PFXseeNUgnabXQsztp43b9h
         X0JP6FInUmJ8P0BM6cG9uzzEfApwb06hF4TfgoeSmlfYTnh4vjLD3uLAQUHHIgJVMA+Y
         GOuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv93tKna4LlJsyj5rDIYrbDWVl5qliuaH1ZFwhr7qoYpen6DRemp5okn0qDMy8fCXICMO0nfqpuqr2A5Z2oTWBYg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxd+0GjvV+kNKDFkqkab5STWmV79fnj6gyUaWa16MJ2bQDug4h4
	C3PVOtPskjH0nAGiwcJEEx3Rdde50ZGK/lwRuzlnhrL1BdxP1Hm4etMxvGz7snLdSyKINJ7eAGW
	T0WQL5GbCPK0HW9XgctV4oWL6zIk81y7+LkLfyPINuKt//orMTiuIGyt/eB4uB1jzMvY31l69DY
	1uGQIzIyI=
X-Gm-Gg: ASbGncvScFJW+5xeEKE/tOUhHNUC10ILHJWVc7XK6rqeCpJr2PZAnN/oyQd6I6W+LvQ
	xOXNd0mm/eTf70jVgxGHFh9FmXlIMI1qe6Xin+ve3PjsKFNSIHNrRvRJimb1k4CHOVF1sRmo8ni
	7r1Eb4uSTZvJdJhxciAD+ZuxTJZvCn4A7NqcHAG+pbrndDod63KwWT5u0/c5XOkc1CR8+KrlhJH
	j10bR1Ote7WlT5DJC5zzX6VZxPAiHXNfXlFAccMdn9uf9xfIJyxXDmFsktfgaDMYaswMEV4ztVY
	vRUhI/pc6OsqL+tehjIsvIMyQK7rDxQhvxxlgD9OrP3wkRLyqiiVQOU81Ol7g+Kb9ZCrThle1tH
	0kE+KiD/aifd64A3ZUYwbhxLfs67rkRVkPVvWm3VpnZOE4uihDvwO
X-Received: by 2002:a05:620a:2988:b0:7dd:d38d:3e1e with SMTP id af79cd13be357-7e356ae0ae5mr1562284285a.34.1753171209800;
        Tue, 22 Jul 2025 01:00:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8jnp2L7C7EIAFB441f2Hc+4EqRdEJrvLEgyANrv1OoVLU4TygWzqrchhXJcDIkg2aiFgwBw==
X-Received: by 2002:a05:620a:2988:b0:7dd:d38d:3e1e with SMTP id af79cd13be357-7e356ae0ae5mr1562279385a.34.1753171209087;
        Tue, 22 Jul 2025 01:00:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d92715sm1880141e87.165.2025.07.22.01.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 01:00:08 -0700 (PDT)
Date: Tue, 22 Jul 2025 11:00:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: foss@0leil.net, openembedded-core@lists.openembedded.org,
        Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
        Ross Burton <ross.burton@arm.com>,
        Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [OE-core] [PATCH RFC v2 5/6] mesa: use simpler mesa-tools-native
 recipe as dependency for libclc
Message-ID: <h565hafbi2uzsotps3lid6ztin437avipvf7bkdw2hbmgddqtq@yl46kvfdp3sg>
References: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
 <20250721-mesa-libclc-panfrost-v2-5-f713d0858949@cherry.de>
 <719acd36-4a42-4d73-ab01-1728fb93045d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <719acd36-4a42-4d73-ab01-1728fb93045d@gmail.com>
X-Proofpoint-ORIG-GUID: i2ZGiRKjaALLyirA00VbTz1kkZ0Ktq9d
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687f450b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8
 a=z50CLhcOZYHsTqMdAicA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: i2ZGiRKjaALLyirA00VbTz1kkZ0Ktq9d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA2NSBTYWx0ZWRfX7mOgAqwQeTIs
 h3ZcBaU5nbSaqU5STtZtZdykxYmHjLMlN89iziFXrQT5b7fOf5cfE2UPxHe68d9a0A35w9lQJnN
 klJ/DEP0DjN4uUSlNJt6N2tPsx/YjZ2iScpGbaW8fcWzHypQz97p0dWjVlUEiaOc5natrSWC0GN
 M+lUL9lx29BfqYf5FQeXmTa2msbjI9216uW0mZsiX/YguVgf2HINoVZqXj9pOKlPS70BazLdfyh
 TenX55LN2/w2pAUyhTJmVyOwO1IUXUc+MXDmhYgVnS5jvkJqrrPM8ciBjgVK9BSnGoINfulW0X8
 jET5WAXZ23i09WW5VQdN6KnNsg0sW4ioGVt+kJoq/2jMdSeu6PugKW6Vc20F8EZ+X1nXTsFp7/5
 cvXgwHWmSl2oVwDf9lrI2aPQiOyr9/ozp0T8k50F0NqL7hWFN8gvXA2U3Kj/IlxMl0Q2w89s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 08:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220725

On Mon, Jul 21, 2025 at 06:36:32PM -0700, Khem Raj wrote:
> 
> 
> On 7/21/25 3:33 AM, Quentin Schulz via lists.openembedded.org wrote:
> > From: Quentin Schulz <quentin.schulz@cherry.de>
> > 
> > libclc is required for some drivers (asahi, panfrost and intel at the
> > very least).
> > libclc brings very expensive dependencies such as llvm and clang.
> > Building clang and llvm for each target architecture is very expensive,
> > but mesa allows to depend on prebuilt host binaries (mesa-clc and
> > precomp-compiler). Those are built by mesa as well, but can be compiled
> > in mesa-native instead of mesa, making the dependency expensive but only
> > once regardless of the number of target architectures to build for.
> > Ideally the mesa-clc and precomp-compiler would only be compiled in
> > mesa-native if target mesa requires libclc support, however this is not
> > possible as a target recipe cannot impact or depend on a native recipe's
> > configuration. We thus have two choices, always build libclc in
> > mesa-native with its heavy dependencies and impact every build or force
> > the user to modify the mesa-native recipe in a custom layer (as a native
> > recipe cannot use target's OVERRIDES). The latter is unacceptable so the
> > former seems to be the only option. Another big downside is that
> > mesa-native currently builds drivers (amd, nouveau, svga) which we may
> > have absolutely no interest in building, increasing the build time and
> > possibly dependencies list).
> > 
> > A third choice is to spin-off the native mesa recipe with libclc support
> > into a new recipe without drivers and only what's necessary to build
> > mesa-clc and precomp-compiler binaries.
> > This allows to keep a "clean" mesa-native recipe for whoever needs those
> > drivers built-in (e.g. for testing, for qemu-native, or whatever else)
> > and only bring the libclc dependency when required by the target recipe.
> > 
> > Because libclc is now only built for the host, opencl support now needs
> > to explicitly bring libclc and others to build as libclc won't bring it
> > in the build environment anymore.
> > 
> 
> libclc from clang ( native ) should be enough to use, we then do
> not need target clang versions, since we are cross compiling clang-native
> would be happy to use libclc-native backend for OpenCL and that
> would be all, we need to configure clang-native with AMDGPU and NVPTX
> targets of course.

RustiCL needs target libLLVM and target libLLVMSPIRVLib, so it doesn't
make sense to hack it to use target clang, but libclc-native. Overall I
think this patch makes sense as is.

> 
> > Suggested-by: Ross Burton <ross.burton@arm.com>
> > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > ---
> >   meta/recipes-graphics/mesa/mesa-tools-native.bb | 21 +++++++++++++++++++++
> >   meta/recipes-graphics/mesa/mesa.inc             | 11 ++---------
> >   2 files changed, 23 insertions(+), 9 deletions(-)
> > 
> > diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..5f7c3a2dc2338e328e0e30b93c263f6c87b61eaa
> > --- /dev/null
> > +++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> > @@ -0,0 +1,21 @@
> > +require mesa.inc
> > +inherit native
> > +
> > +SUMMARY += " (tools only)"
> > +
> > +S = "${UNPACKDIR}/mesa-${PV}"
> > +
> > +PACKAGECONFIG = "tools asahi intel panfrost"
> > +# llvm required for libclc
> > +PACKAGECONFIG += "gallium-llvm"
> > +# Doesn't compile without wayland-scanner if PLATFORMS has wayland in, and,
> > +# doesn't compile at all if PLATFORMS is empty so add x11 and wayland
> > +# to PACKAGECONFIG like in mesa.inc
> > +PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
> > +
> > +DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native"
> > +
> > +EXTRA_OEMESON += " \
> > +    -Dmesa-clc=enabled -Dinstall-mesa-clc=true -Dmesa-clc-bundle-headers=enabled \
> > +    -Dprecomp-compiler=enabled -Dinstall-precomp-compiler=true \
> > +"
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> > index 5295b70fc9b4bb9570d86333f9229aef9114d93d..0fdb6d19655a06b645c6ac8815dfc62fa7e0c9eb 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -126,7 +126,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
> >   # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!

This is no longer true. With these changes it requires only gallium-llvm,
libclc PACKAGECONFIG is no longer required.

> >   # Be sure to enable them both for the target and for the native build.
> > -PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native"
> > +PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native libclc spirv-tools spirv-llvm-translator"
> >   PACKAGECONFIG[broadcom] = ""
> >   PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
> > @@ -165,16 +165,9 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '
> >   GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
> >   GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
> > -MESA_CLC = "system"
> > -MESA_CLC:class-native = "enabled"
> > -INSTALL_MESA_CLC = "false"
> > -INSTALL_MESA_CLC:class-native = "true"
> > -MESA_NATIVE = "mesa-native"
> > -MESA_NATIVE:class-native = ""
> > -
> >   PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
> >   PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
> > -PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
> > +PACKAGECONFIG[libclc] = "-Dmesa-clc=system -Dprecomp-compiler=system,,mesa-tools-native"
> >   PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
> >   PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
> > 
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#220678): https://lists.openembedded.org/g/openembedded-core/message/220678
> > Mute This Topic: https://lists.openembedded.org/mt/114265791/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 
> 
> 

-- 
With best wishes
Dmitry

