Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6959C531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 13:00:52 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.15450.1724418042573035801
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 06:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UGiZkl2j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3718c176ed7so990174f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 06:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724418041; x=1725022841; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CFs7CIXFnf8p1j0zuXLmahDpO82PJtMfUkya8fkEhM8=;
        b=UGiZkl2jH254cBZSmEQWGtrTsgfJsYLbPCZEv61+1r3QB50uOI3JpiGCnsWlYoa8Wc
         UeD8aWu6jyU7sBU5aLgdRx9Zr61ynlbyIiXSldXolWQitDpXHj3eF7kYJ2dqwa6hOhxn
         2UIlTddkGtadTZNtUo+mUgUmPs8G9U60mmdac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724418041; x=1725022841;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFs7CIXFnf8p1j0zuXLmahDpO82PJtMfUkya8fkEhM8=;
        b=LkUM9Y2VRXeSfB3XcOF23QVeV7x9O++XZVvrD9JSRiv7t/oiXxX0s7S/WfE0yeTdRN
         AtY7poYxgShSmKQcQOe56eFq9l65DVV+kFe1FLeUSTlh6vIx7HDiup7Muej0cHgjuuIr
         A0ETJw/EVZbrHVans2Tloe5LSmi1R+jVpzPqZ/vN+7FYiDSoOGyv4oedUKuojpDa5O+q
         MvGMb1CvrfJ+M4PyYiL96Aig5OZXilYaXpwo3RZwRoc21zxcaOWa9RDIy0YVOizA3HAT
         YZy+8PHqhRw2BEvhj4KjYY9ffA30IELQLj1C8VxHBm7hFarCWS3WNqhEKBtHFCvTJ8hX
         3etA==
X-Forwarded-Encrypted: i=1; AJvYcCWWQVRmSLlZQs+zL1n2XHeBr7TjBzezg/kntLXArcJdi4Khz6NjgxEixfHdXnpm/4zdAGlkpHAVmrtT4QODB30Wtw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzcJJpmoCVabKZDt17idlLcfAM1KfCd/gUJ10NTmqHmqA32MopW
	BWF5VuGpy2i3iaN64JDGEef8xBMSFe7+G4S9Ur4napI/4cQkKqRYefQ1mDpbMhU=
X-Google-Smtp-Source: AGHT+IF67gVXRD4a6ovZAhaTU4gLz5Y+eG4uQI8Y6mFSbp2Kve/GYOPJ8VdiiCgcN2dluySNweTaYA==
X-Received: by 2002:adf:efc2:0:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-373118649cfmr1210370f8f.31.1724418040513;
        Fri, 23 Aug 2024 06:00:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4f5:df28:3cf9:5842? ([2001:8b0:aba:5f3c:f4f5:df28:3cf9:5842])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110420sm4145914f8f.6.2024.08.23.06.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 06:00:40 -0700 (PDT)
Message-ID: <168ddcc1fa6f6a5e53ad96a5600dbbf0cc2d6a11.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] kernel-fitimage: run unbundled fitimage
 after deploy
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Fri, 23 Aug 2024 14:00:39 +0100
In-Reply-To: <20240819152136.1185744-5-adrian.freihofer@gmail.com>
References: <20240819152136.1185744-1-adrian.freihofer@gmail.com>
	 <20240819152136.1185744-5-adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 13:00:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203688

I have been struggling to find time to sit and think through the
implications of this. I have finally done that, at least a little and I
have some questions below. Sorry about the delay in getting to this, I
keep hoping someone else will help with this kind of review but it is
very time consuming and I suspect nobody has quite the right set of
knowledge to make it easier.

On Mon, 2024-08-19 at 17:17 +0200, Adrian Freihofer via lists.openembedded.=
org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> Without this change, the kernel is always rebuilt if something changes
> in the initramfs. If the kernel is rebuilt with an empty TMPDIR, the
> process starts by fetching the large kernel git repository and
> recompiling it from scratch. This is very inefficient.
>=20
> This cannot be improved if INITRAMFS_IMAGE_BUNDLE =3D "1". If the kernel
> Makefile is needed to generate the initramfs bundle the kernel build
> folder is required. For this cases nothing changes.

When you say "kernel Makefile", I'm assuming to rebuild the kernel
image, you need much more than just the Makefile but a complete kernel
build tree? The Makefile is a solvable problem, the tree isn't!

> But for a build configuration with INITRAMFS_IMAGE_BUNDLE =3D "" the
> build folder is not needed. Creating the initramfs bundle requires:
> linux.bin, DTBs and the initramfs. These artifacts are all available in
> the deploy folder which is also sstate cached.
>=20
> Therefore do_assemble_fitimage_initramfs gets split into two tasks:
> - do_assemble_fitimage_initramfs creates the bundled fitImage which runs
> =C2=A0 before do_deploy. This is without sstate and therefore the do_depl=
oy
> =C2=A0 task still deploys the artifacts generated by this task.
> - do_deploy_fitimage_unbundled creates the fitImage in unbundled mode.
> =C2=A0 This task runs after do_deploy. It uses the linux.bin artifact fro=
m
> =C2=A0 do_deploy to create the fitImage with initramfs.

I'm a bit worried about having a second do_deploy_xxx task after
do_deploy. This creates a recipe with two deploy tasks and whilst I can
understand why you're doing it, I worry this is going to create
confusion down the road.

The reason I say this is that there are rules for "deploy" tasks, e.g.
in meta-classes/sstate.bbclass:setscene_depvalid() has:

       # do_package/packagedata/package_qa/deploy don't need do_populate_sy=
sroot
        if taskdependees[task][1] =3D=3D "do_populate_sysroot" and taskdepe=
ndees[dep][1] in ['do_package', 'do_packagedata', 'do_package_qa', 'do_depl=
oy']:
            continue

do_deploy_fitimage_unbundled isn't listed in SSTATETASKS. Whilst that
is simple to fix, I'm not sure what side effects that is then going to
cause.

Also, there is this to consider:

meta/classes-global/base.bbclass:do_build[recrdeptask] +=3D "do_deploy"

which is basically making sure "build" targets (the default) trigger
all artefacts to be deployed. I think this new task will be missed by
global code as it isn't covered there. The intent was to have one name
which covered all cases, not having recipe specific entries in there.

I'm starting to wonder if that unbundled case should be handled by a
separate recipe, which can then have its own do_deploy task and depend
on all the correct pieces.


> =C2=A0 This task is done with SSTATE_SKIP_CREATION, because this also wor=
ks
> =C2=A0 with the eSDK installer (oe-selftest -r esdk is successful). It is
> =C2=A0 also more effective to quickly create the fit image instead of
> =C2=A0 handling it via sstate.

Skipping sstate creation is a huge red warning sign in my mind. So far
we've only had images and eSDKs using this option and I never wanted to
add the option generically in the first place since it was going to
lead to more exceptions like this.

The implications of not creating the sstate can be problematic, for
example the sstate tests then need to learn that some new subset of
sstate artefacts will never be created. This also complicated the
testing of eSDKs which do a similar verification which will also need
exceptions. I can understand why you've done it but I am worried the
side effects will be left for others (such as myself) to resolve as fit
images get used in new codepaths :/.

> Unfortunately, this change is not 100% backward compatible. Previously,
> a dependency on do_deploy deployed all types of fit images. With this
> change, deploying the unbundled fit image requires a dependency on
> do_deploy_fitimage_unbundled. To address this the image.bbclass gets
> improved to handle both cases with the KERNEL_DEPLOY_DEPEND variable.

I think this proves my point about why adding a new deploy task is
potentially problematic. Have you considered using an intermediate
recipe for the unbundled case instead?

I wish we could determine how much use the bundled and unbundled cases
have. I'm also starting to wonder if the two cases should be separated
apart into two clear workflows rather than the current entwined
situation which is very hard to visualise and understand.

Cheers,

Richard

