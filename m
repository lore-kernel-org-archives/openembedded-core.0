Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F7FCA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 11:05:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.11325.1755601518862892116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 04:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KcR/Wxte;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90XuV026955
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 11:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EowsB+J6EVJbNPHs7uLQTlu2i4DdN1cyX7wSbJG5gdM=; b=KcR/WxteLMW3RFsO
	4AO+uwdo4Np49dnFNnX2KRCxHu68oAlnSGMb9WGmpByKDNyGCZ1OjnKIt8vQkTiH
	8fuD9ZYQDtYcNWsm9otbPYsdx/OIzttK45aRm3YfPqhWL//Nqjj8KgynYhkKMIqR
	oEICapmyZPIcf3zduKpVlfkKNE8y1wfDFdEKMch+1JpwOP7q2Ke4AZpy5MMKfnyQ
	KlM3IVeShG8B45EpHyKyOvO8ICocBnMipgxRch0D8cAnfA4Wtn9UzrvUKgfxO8IO
	+OuRvB5o8cfWuCu5xrRSrisblmzRe/M9tinvMJklm0OqXQFxGNtNPqH5x6FGoeMa
	tBVZyQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyg8ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 11:05:17 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-71e84a8c4baso34538087b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 04:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601510; x=1756206310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EowsB+J6EVJbNPHs7uLQTlu2i4DdN1cyX7wSbJG5gdM=;
        b=XGlgibQvTHCJ/LOgI6bPR5htbcli1OsLfiKlQsN/0zsU2BNcgvqfT9yeo4bNSL6pzD
         YCUuasPbH0mDG86fIaqp9MkUotUMoVNu4yImwiLds90dCSfM7XrJwSZR/gOZ5Bs4Qnbx
         rWe5YXIkv/7tHsW+8XR0EeEg+dVpx/0NgRybpc6c0hUXH4yHC6uUsG6+YV3IE83MpfyO
         DOfBqNk1OTt7rOYi5Q+jRur+/Gtq+J+l8fO/5NWEGfAqauNPe41KdRnPuXoaSH6JCU3F
         JAoru09xODK/skmDSMoNH7InaJ3Um3yhJ+hdAsLMco17LnceQ89gMLDS0NkIZ1UoXg6l
         wc2A==
X-Forwarded-Encrypted: i=1; AJvYcCUtkhuom7U2JxFpKNAMzpe73C+EoZwbVAgl8Yoigoe2su1HJjwtV7g6/Ju1kKVglMRTxugC0/1w7IJ417gNkDDurQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxLlXltEKmT7I87isL17XFraP5E5zAeVbLRNhpdXLIRCY9Nx5Hx
	uInlS/clwtTzFSo6BX0JJwxvWfSWnmrAKFN+/3n7JjpMw6ZwPotEWx/FH8QDiQrprouJPh3F7qd
	GbaeMqIzQngSePAmD2Wfwm49aza7qXRMUTac6DPlmBUVV5SpcZQfhs2ls3SprCmaKSWtrHuBurb
	0PpIJxmy+XydjgrIl02KZQy+y408EnwMhpGrhHx2Dzv05ghewoCUre8XkG+A==
X-Gm-Gg: ASbGncu8wVYPgD1dEqgPnyZ4P1Jx801SlRVQ15p9wBMarvrYiiVtwe2RBjh873azUQV
	0jgFc96YuSnOad2VQ7/Pq9kErn9yXgLg5xvqDXnLvkMhTdSyY9t0YXATF/mVfIK9Wivhsq7orHF
	pKZF2cS6pieJHlL31DF0uFALw=
X-Received: by 2002:a05:6902:1004:b0:e94:e1e6:cd1 with SMTP id 3f1490d57ef6-e94e629fda7mr2803043276.51.1755601509496;
        Tue, 19 Aug 2025 04:05:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1Hst8UQRDesoW/kcazVnIPTC2g/ab/3KsmI/FWIQM4jUSuu/Acxnc1HCgUMe7uPIsra4sE4Y2P1rmI/4bGrA=
X-Received: by 2002:a05:6902:1004:b0:e94:e1e6:cd1 with SMTP id
 3f1490d57ef6-e94e629fda7mr2802993276.51.1755601508911; Tue, 19 Aug 2025
 04:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250812091453.1760880-1-kavinaya@qti.qualcomm.com>
 <20250812091453.1760880-2-kavinaya@qti.qualcomm.com> <bbfb4e294eff66d62a81a2cf875d9d6940e2792f.camel@siemens.com>
In-Reply-To: <bbfb4e294eff66d62a81a2cf875d9d6940e2792f.camel@siemens.com>
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 16:34:57 +0530
X-Gm-Features: Ac12FXxOvQMKa627r8hodALjmh1T2RRkgUdWRfF_lAtz9-B1O98b0tfP7ub7CNk
Message-ID: <CAHyS93rDFM+qgOSVtLNVxmshRpet3Fwqd4TPJQx4onJKPQkAnQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH 1/1] kernel-fit-image: skip kernel section
 if linux.bin is missing
To: adrian.freihofer@siemens.com
Cc: "kavinaya@qti.qualcomm.com" <kavinaya@qti.qualcomm.com>,
        "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: rho5Mpy9bFqPNxmf81wcou49khsZv-n7
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a45a6d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=gDFxSk2SVRziRNFRpbEA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: rho5Mpy9bFqPNxmf81wcou49khsZv-n7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX15LId0se+wln
 TbgiPe5XQJAc417KaG35Gj2eiFW7/Lr8KcMb2aJPuSx6hPQOJ5TG02thPTldRIv2BKk4QtkA0rF
 TDI+oSgHDlcyHjluAGlC4r8f0n5zoy4iLMI5hFnKj5pRfqbq9gZcdbRBw9Ll6b+Oyns2s3iw8B2
 Fb47PzWrpIiyvtYSSeAGX9pTmYKTzzXcdtO2dUz1mQCKOEMi2RHw6TzAY7qyOjKOVW1JmLqAGPv
 duSNstfGL+PxepFeCZNuHJIGYBM7FcZYNmvyK4qIEjwrlhGVEy7kIngDXxf2fz0mt0Hn1hPgXea
 5Tg40I2CFfSsr59wMIjB6gQJsCuM2BbQ8oBbAS2LtfNv96fqAav9YnM0vc3ttcCx1pdStncI/c2
 UoH2udix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 11:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222102

On Tue, Aug 19, 2025 at 2:20=E2=80=AFPM Adrian Freihofer via
lists.openembedded.org
<adrian.freihofer=3Dsiemens.com@lists.openembedded.org> wrote:
>
> Hi Kavinaya
>
> On Tue, 2025-08-12 at 14:44 +0530, Kavinaya S via
> lists.openembedded.org wrote:
> > Avoids errors during image generation by checking for the
> > presence of linux.bin before attempting to copy and emit the
> > kernel section. This ensures that the build process continues
> > gracefully when the kernel binary is not available.
>
> So far, the primary purpose of this code is to create a FIT image
> containing a single kernel and more artifacts. If no kernel is found,
> the process should fail immediately, as this is required for all
> current use cases. Adhering to this approach ensures the code remains
> robust and reliable for its intended function.
>
> To address your use case, one approach could be to introduce a variable
> in image-fitimage.conf which allows to configure your use case
> explicitly. For example:
>   FIT_LINUX_BIN ?=3D "linux.bin"

Thanks Adrian. Yes, this approach works for the use case we are trying
to address.
We'll refine this patch and reupload.

>
> Then the kernel-fit-image.bbclass could:
>
>   linux_bin =3D d.getVar('FIT_LINUX_BIN')
>   if linux_bin:
>       shutil.copyfile... all the existing code
>
> For your use case you could then override it to:
>   FIT_LINUX_BIN =3D ""
>
> Would that work?
>
> >
> > A clean separation between firmware (including DTBs) and the
> > HLOS (Linux Kernel) is highly recommended and often necessary
> > to enable independent firmware updates, enforce trust boundaries,
> > and support running the same kernel across different hardware
> > platforms by simply swapping DTBs. One effective way to achieve
> > this separation is by using a Unified Kernel Image (UKI) that
> > contains only the Linux kernel and initramfs, while keeping the
> > DTBs in a separate FIT image, such as dtb.bin.
> >
> > To support this setup, it's important to ensure that a FIT image
> > can be generated without requiring the Linux kernel binary,
> > allowing the build process to continue gracefully even when the
> > kernel is unavailable.
> >
> > Additionally, this approach is very useful when the kernel-fit-
> > extra-artifacts class is not set, as it enables the creation of
> > an .its file without depending on the kernel.
> >
> > Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
> > ---
> >  meta/classes-recipe/kernel-fit-image.bbclass | 22 ++++++++++++++++--
> > --
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
> > b/meta/classes-recipe/kernel-fit-image.bbclass
> > index fd4c6a30fe..c0f925d90e 100644
> > --- a/meta/classes-recipe/kernel-fit-image.bbclass
> > +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> > @@ -59,12 +59,26 @@ python do_compile() {
> >      )
> >
> >      # Prepare a kernel image section.
> > -    shutil.copyfile(os.path.join(kernel_deploydir, "linux.bin"),
> > "linux.bin")
> > -    with open(os.path.join(kernel_deploydir, "linux_comp")) as
> > linux_comp_f:
> > -        linux_comp =3D linux_comp_f.read()
> > -    root_node.fitimage_emit_section_kernel("kernel-1", "linux.bin",
> > linux_comp,
> > +    # Construct the full path to linux.bin
> > +    linux_bin_path =3D os.path.join(kernel_deploydir, "linux.bin")
> > +
> > +    # Check if linux.bin exists
> > +    if os.path.exists(linux_bin_path):
> > +        # Copy linux.bin to current directory
>
> Please do not pollute the code with useless comments. Something like
> that looks counter productive to me:
>
>   # Calling foo bar
>   foo_bar();
>
> But reasonable comments for example like this are essential:
>
>   # Support special use cases where the kernel binary is not included
>   # in the FIT image itself or has a different name.
>   # For example, if the kernel is provided as a uki image, this
>   # variable can be set to empty string.
>   FIT_LINUX_BIN ?=3D "linux.bin"

We like this comment. Hope you don't mind if it is reused.

>
> > +        shutil.copyfile(linux_bin_path, "linux.bin")
> > +
> > +        # Read linux_comp file
> > +        linux_comp_path =3D os.path.join(kernel_deploydir,
> > "linux_comp")
> > +        with open(linux_comp_path, 'r') as linux_comp_f:
> > +            linux_comp =3D linux_comp_f.read()
> > +
> > +        # Emit kernel image section
> > +        root_node.fitimage_emit_section_kernel("kernel-1",
> > "linux.bin", linux_comp,
> >          d.getVar('UBOOT_LOADADDRESS'), d.getVar('UBOOT_ENTRYPOINT'),
> >          d.getVar('UBOOT_MKIMAGE_KERNEL_TYPE'),
> > d.getVar("UBOOT_ENTRYSYMBOL"))
> > +    else:
> > +        bb.note("linux.bin not found. Skipping kernel image
> > preparation. ")
> > +
> >
> >      # Prepare a DTB image section
> >      kernel_devicetree =3D d.getVar('KERNEL_DEVICETREE')
>
> The FIT image and the uki code has plenty of test cases in
> https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/fitim=
age.py
> https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/uki.p=
y
> Would it be possible to add a test case for your use case as well?

Certainly. We'll add a test to validate this use case as well.
>
>
> Thank you for the patch
> Adrian
>
>
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222087): https://lists.openembedded.org/g/openembedde=
d-core/message/222087
> Mute This Topic: https://lists.openembedded.org/mt/114706196/5192326
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [vi=
swanath.kraleti@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

