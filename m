Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F7DC531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 15:29:43 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.18726.1724426976071176996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Aug 2024 08:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cqGPJyvZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52efdf02d13so3067210e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 08:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724426974; x=1725031774; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9K8/CAVXb3aecMIBmcT4ncq5UxTtgpOIryHZYKvCNpM=;
        b=cqGPJyvZMmaIdWDMdFV9ajGjMiE20eo/iwSp1SAw5ANrhHP7QCsEfBEMXZhCSymhYE
         AzwPRW0MwpApbnTnKnAX6S8zLF1ItsSMxdcVrn35oebEq02sFDYgy1nfnC7qMxKfuWlh
         ztlad17/vuSuO7cf7MXxZSIxFZQwL1XzD9SYa+QvdWzrTbs7UyZ1UcGspCJQehs0yx0D
         Rk9qsdz9+cz9aLjuf9g4Npa+sRdI4UeET4EIp864EIb5e46zgE1KxMyBsrMyg/ZWa/UG
         l0YOMH3nDJvej2QWZR1lNnOBICYJep305JVf8yTd098j4962uBe5XOlg+OervicYnDQA
         CWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724426974; x=1725031774;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9K8/CAVXb3aecMIBmcT4ncq5UxTtgpOIryHZYKvCNpM=;
        b=X3GrTu4nkRxGnWP3ewNmZLEK7D/nyLJvFVZFjCZdC+Lablj1/DySJzx5aOYP/Ku+0v
         h3D/WPDi+Qa6LhHMDUEmHXE2YlmiTDA4soWxiYp+HO7rxwuNWQzIKauvEY8Vby/QM0nt
         4Q9XdoIxVp0Juxwgwyt2lRxJEUJJh9NDtxLwRmULn8zP2+sGQkJEqbSYuW16Id5wy1gy
         4PyG+z+26Gj4PmqahKLbcahdHikp8nSF3sMkKOQ+zbpvfj8O6lYx1n4tJVA/DO87f2Ww
         W6cFz0Yf63vv7PEe7jcSs0u86Ctwv60PptDp0DUZ7vFmgSFXBSLcoHCbihYRNku10ip5
         /7cg==
X-Forwarded-Encrypted: i=1; AJvYcCXs/dBGkoELH5lo6JT9aFXX+J/NQHcpoM3OumDTVjXz5CuQnrsCBQSh3OdMnXhnTJJSRRft1iCAR2COlp6GR8Ozjw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwyBEHm59vMRJ+A039JVdJj/rQZAlncIKf9mFFyf9mFxWI10U81
	IhIGJpZHFdERk8T52NnRFXqJXF0qPfd2SmeAWi2E9+7iwidveF8g
X-Google-Smtp-Source: AGHT+IF/JUqJNpQJ8bOkbHsKOTg0gNjYd5geUni95N9Dl5eLRA76izx9gR48IKPF+PNDsBtwbtLOog==
X-Received: by 2002:a05:6512:3b11:b0:52c:dcdc:f186 with SMTP id 2adb3069b0e04-53438850fccmr2489844e87.27.1724426973207;
        Fri, 23 Aug 2024 08:29:33 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4379c7sm276622366b.141.2024.08.23.08.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:29:32 -0700 (PDT)
Message-ID: <54727de0c04f3c3a9ab74db9b1aa9064f174cfd2.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] kernel-fitimage: run unbundled fitimage
 after deploy
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Fri, 23 Aug 2024 17:29:32 +0200
In-Reply-To: <168ddcc1fa6f6a5e53ad96a5600dbbf0cc2d6a11.camel@linuxfoundation.org>
References: <20240819152136.1185744-1-adrian.freihofer@gmail.com>
	 <20240819152136.1185744-5-adrian.freihofer@gmail.com>
	 <168ddcc1fa6f6a5e53ad96a5600dbbf0cc2d6a11.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 15:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203695

Hi Richard

Thank you for the review.=20

On Fri, 2024-08-23 at 14:00 +0100, Richard Purdie wrote:
> I have been struggling to find time to sit and think through the
> implications of this. I have finally done that, at least a little and
> I
> have some questions below. Sorry about the delay in getting to this,
> I
> keep hoping someone else will help with this kind of review but it is
> very time consuming and I suspect nobody has quite the right set of
> knowledge to make it easier.
>=20
> On Mon, 2024-08-19 at 17:17 +0200, Adrian Freihofer via
> lists.openembedded.org wrote:
> > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > Without this change, the kernel is always rebuilt if something
> > changes
> > in the initramfs. If the kernel is rebuilt with an empty TMPDIR,
> > the
> > process starts by fetching the large kernel git repository and
> > recompiling it from scratch. This is very inefficient.
> >=20
> > This cannot be improved if INITRAMFS_IMAGE_BUNDLE =3D "1". If the
> > kernel
> > Makefile is needed to generate the initramfs bundle the kernel
> > build
> > folder is required. For this cases nothing changes.
>=20
> When you say "kernel Makefile", I'm assuming to rebuild the kernel
> image, you need much more than just the Makefile but a complete
> kernel
> build tree? The Makefile is a solvable problem, the tree isn't!

Yes, I should have written kernel build tree.

>=20
> > But for a build configuration with INITRAMFS_IMAGE_BUNDLE =3D "" the
> > build folder is not needed. Creating the initramfs bundle requires:
> > linux.bin, DTBs and the initramfs. These artifacts are all
> > available in
> > the deploy folder which is also sstate cached.
> >=20
> > Therefore do_assemble_fitimage_initramfs gets split into two tasks:
> > - do_assemble_fitimage_initramfs creates the bundled fitImage which
> > runs
> > =C2=A0 before do_deploy. This is without sstate and therefore the
> > do_deploy
> > =C2=A0 task still deploys the artifacts generated by this task.
> > - do_deploy_fitimage_unbundled creates the fitImage in unbundled
> > mode.
> > =C2=A0 This task runs after do_deploy. It uses the linux.bin artifact
> > from
> > =C2=A0 do_deploy to create the fitImage with initramfs.
>=20
> I'm a bit worried about having a second do_deploy_xxx task after
> do_deploy. This creates a recipe with two deploy tasks and whilst I
> can
> understand why you're doing it, I worry this is going to create
> confusion down the road.
>=20
> The reason I say this is that there are rules for "deploy" tasks,
> e.g.
> in meta-classes/sstate.bbclass:setscene_depvalid() has:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # do_package/packagedata/package_qa/=
deploy don't need
> do_populate_sysroot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if taskdependees[task][1] =3D=
=3D "do_populate_sysroot" and
> taskdependees[dep][1] in ['do_package', 'do_packagedata',
> 'do_package_qa', 'do_deploy']:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contin=
ue
>=20
> do_deploy_fitimage_unbundled isn't listed in SSTATETASKS. Whilst that
Thank you for the hint. I don't know how this could have been
overlooked until now.

> is simple to fix, I'm not sure what side effects that is then going
> to
> cause.
>=20
> Also, there is this to consider:
>=20
> meta/classes-global/base.bbclass:do_build[recrdeptask] +=3D "do_deploy"
>=20
> which is basically making sure "build" targets (the default) trigger
> all artefacts to be deployed. I think this new task will be missed by
> global code as it isn't covered there. The intent was to have one
> name
> which covered all cases, not having recipe specific entries in there.
>=20
> I'm starting to wonder if that unbundled case should be handled by a
> separate recipe, which can then have its own do_deploy task and
> depend
> on all the correct pieces.
>=20
>=20
> > =C2=A0 This task is done with SSTATE_SKIP_CREATION, because this also
> > works
> > =C2=A0 with the eSDK installer (oe-selftest -r esdk is successful). It
> > is
> > =C2=A0 also more effective to quickly create the fit image instead of
> > =C2=A0 handling it via sstate.
>=20
> Skipping sstate creation is a huge red warning sign in my mind. So
> far
> we've only had images and eSDKs using this option and I never wanted
> to
> add the option generically in the first place since it was going to
> lead to more exceptions like this.
>=20
> The implications of not creating the sstate can be problematic, for
> example the sstate tests then need to learn that some new subset of
> sstate artefacts will never be created. This also complicated the
> testing of eSDKs which do a similar verification which will also need
> exceptions. I can understand why you've done it but I am worried the
> side effects will be left for others (such as myself) to resolve as
> fit
> images get used in new codepaths :/.
>=20
> > Unfortunately, this change is not 100% backward compatible.
> > Previously,
> > a dependency on do_deploy deployed all types of fit images. With
> > this
> > change, deploying the unbundled fit image requires a dependency on
> > do_deploy_fitimage_unbundled. To address this the image.bbclass
> > gets
> > improved to handle both cases with the KERNEL_DEPLOY_DEPEND
> > variable.
>=20
> I think this proves my point about why adding a new deploy task is
> potentially problematic. Have you considered using an intermediate
> recipe for the unbundled case instead?

Yes, I have thought about and tried 3 different implementations:
- This one here which is supposed to be backward compatible.
- Renaming the sstated kernel do_deploy task to e.g. do_deploy_stage1.
Then bring the do_deploy task back as an empty task depending on the
do_deploy_stage1. This looks equal to the current implementation but
allows to inject the do_deploy_fitimage_unbundled task from the kernel-
fitimage.bbclass. However, this has similar side effects. For example
the eSDK assumes that the do_deploy task is the last sstated task in
the chain which provides the relevant sstate artifact.
- Add a separate recipe for the unbundled fitImage. This could simplify
the implementation, but is probably somewhat cumbersome from the user's
point of view. Bundled fitImage remains in the kernel but unbundled
needs dealing with different recipes.
>=20
> I wish we could determine how much use the bundled and unbundled
> cases
> have. I'm also starting to wonder if the two cases should be
> separated
> apart into two clear workflows rather than the current entwined
> situation which is very hard to visualise and understand.

Yes, that's probably the conclusion so far. The kernel recipes have
reached a very complex state. Especially the implementation of the
unbundled fitImage support is a bit strange and adds complexity that
could possibly be simplified by splitting it into a separate recipe.
I will try to come up with a different implementation where the
undbundled fitImage is created by a dedicated recipe. This recipe will
basically have the do_deploy_fitimage_unbundled implementation as its
do_deploy task which depends on the kernel do_deploy.

Not sure if such a recipe could also provide a package for the fitImage
kernel. Currently the fitImage is deployed only. Other kernel image
types are packaged and deployed.

The challenge will then probably be to hide the extra complexity of 2
recipes as good as possible and to refactor the tests accordingly.

Kind regards,
Adrian


>=20
> Cheers,
>=20
> Richard


