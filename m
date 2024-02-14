Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A16AC48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 17:43:23 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.47870.1707932597250123032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 09:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DSmG4DxF;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50eac018059so7522395e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 09:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707932595; x=1708537395; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dLUA1ucRtKw2LUS303mrYxh8MM+d396P638xPaeKH1I=;
        b=DSmG4DxFz7BDqBJneE1+qmV+5N0Rfr3MVhHgbdK8YSd/oGBPkjF3u6m3IdRpW98unO
         UJmbjqrFN2Z8pTW0qt1FPVJc5dnSx9veUQluXKCjK/asQmPudCxjZ13V+W62s3HopAId
         OVKIeHCPwtuCl7f/esYx9yL2jhjCDKxTlEyRQ80FCU/FWz6XZHPV1qV6II9Tf0xDvZgb
         O4LEamTCB2D8ol/oJVVdOVO1A3MxC3ymIqEhuTwVW7CZkT4vs4wonhxjceCaycrRcC4u
         /XKsqcKVRIzDg2fhyEPmRHwsLVXJGlGCeb9kWV8H8mHSjb6/Xiw/Xe+EeEAxMmSpK5OE
         FLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707932595; x=1708537395;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLUA1ucRtKw2LUS303mrYxh8MM+d396P638xPaeKH1I=;
        b=TqadULVUPJCXexqHDX0HSIcfUR5E5OpTJEsV6OhE8gTiIcPNfhNuL2F58gnxCsb+hO
         OiU5cmbdiY9rcjILCGk776S2rcSj/ywoBNXwbrUxwmslDkUF6jODvhPptBK4z/J5mgn0
         m2n2J3G7qFFvyjbE9T7joUdUBPcIa+YJ27EiO2Qzj3qGOk8VwEDXvcOy87n3WcMPOf+l
         k4KpGZLf0TRCbI9N4sG90NbA+GcFyrZZ2nzkZsb2Z2iHqr4eKhdo7F5SCzY4EaMQPUik
         xxJBnaPZ0FFLUDA4JdZ689QZT7B1NejU75/uM1QebLAI8q+Nfyl7dRra18s1SHyvKTzH
         eYSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkQrhUVM1OgkHXXKQXrsW9hAgEXWMrkR7AVRr198E90lQIAxtLwjCxN4A/oB2lSam3LOIjbK4RTr7E6DgA/pDAujhB60lgAirDKePdRSRtC9uPBACx1+JP
X-Gm-Message-State: AOJu0YwZ/A3xCGPVenoEmgsOkUfTrU865ZcZObbPW6nkRdeF35Bh0zX1
	OVJb3N3h/18RNtMbrvSvrZlEqpbnDahcwqg9l2P4yfYMtrsA3XNvLCrFDvRN1mdV/Ce+DR4mVWL
	AyiCyyAzAsT9tGumyNsqSGXRniRhGhP+LeYc=
X-Google-Smtp-Source: AGHT+IFAZNOGyet9zzF4WF6NJRViuHznl+lojuZoiFgbOINKavyV6WQAs9pH9slyJw2jy6gXZpctkp+vmTNVw2X4Sy0=
X-Received: by 2002:a05:6512:102a:b0:511:ae1b:eea4 with SMTP id
 r10-20020a056512102a00b00511ae1beea4mr823664lfr.60.1707932595121; Wed, 14 Feb
 2024 09:43:15 -0800 (PST)
MIME-Version: 1.0
References: <DB5PR02MB10213FA30B1A62CEA61B98E02EF4F2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <3a0bb821-e692-4256-ab7b-95716f2e5896@savoirfairelinux.com>
 <3c844a195548fa8d0352bfc469996f3077eb5a0a.camel@gmail.com>
 <33e57963-8887-4c95-ad8f-654afcea5e74@savoirfairelinux.com>
 <14a1b53384f2901878d7b4ed225edf8254af07f9.camel@gmail.com>
 <CANNYZj9UxD9-Owt6H1OouZXu4WYWOoUnh77g10Cihj5nLjoAPw@mail.gmail.com>
 <4582012f-7518-462b-bee4-5777f28cb28d@savoirfairelinux.com>
 <2ec56f88fc1b7afd00d1dabcf818b56d92f9cffb.camel@gmail.com>
 <CANNYZj_wbPa9UEKPXmhcg_QZ2tfvYDOcf-jT_+L=EC5eZqHxpg@mail.gmail.com> <AS1PR10MB5697F8B9B490FD7E9A3484B8FD4E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697F8B9B490FD7E9A3484B8FD4E2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Feb 2024 18:43:03 +0100
Message-ID: <CANNYZj-mdjC_Kg3mETBfueSuzRhunsxg6K6_FpXscCXmAyA35w@mail.gmail.com>
Subject: Re: [OE-core] VS Code plugin and multiple build directories
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "adrian.freihofer@gmail.com" <adrian.freihofer@gmail.com>, 
	Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Ross Burton <Ross.Burton@arm.com>, Mohammed Raza <mohammed.raza@savoirfairelinux.com>, 
	"peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 17:43:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195489

On Wed, 14 Feb 2024 at 16:30, Marko, Peter <Peter.Marko@siemens.com> wrote:
> But when migrating from Kirkstone to Scarthgap https://git.openembedded.org/openembedded-core/commit/?id=bcfaeb8ed503ce1a5add3ec882f0e0c3bccfd3d2 hit me hard.
> Instead of short and comfortable ". oe-init-build-env" which I just do in fraction of second via ". oe<tab><enter>" as it's already in my "muscle-memory",
> I have to do long and cryptic "TEMPLATECONF=meta-<product>/conf/templates/default . poky/oe-init-build-env"...
> Or when I have multiple configs, then it's "TEMPLATECONF=meta-<product>/conf/templates/<config> . poky/oe-init-build-env"
> instead of nice ". oe-init-build-env build-<config>"
> Yes, it's maybe nice when you use oe-setup-layers, but with layers as git submodules...
>
> Two things we add already in kirkstone are:
> * BB_ENV_PASSTHROUGH_ADDITIONS: concurrency level and credentials; maybe I can change this variable is distro, I didn't check yet
> * PS1: to indicate the build configuration in active shell, this cannot be set in distro nor in the template, so it's would be a lost feature for us
>
> Noe that we're not really using a special/custom script, we're just adding two exports at the end of the original one (of course it's a copy in reality).
>
> Any hints how can I manage this with a default script?

Thanks, there's definitely food for thought in here.

1. I agree that TEMPLATECONF prefix is annoying and unfriendly; but
it's also impossible to change anything in how oe-init-build-env takes
its command line parameters, including that. It's partly because of
it, that I'd like to have oe-setup-build as the primary entry point to
yocto builds: there's a lot more freedom in how it can operate, and
what it can do because it's a new thing:
https://git.yoctoproject.org/poky-contrib/commit/?h=akanavin/setup-layers-tweaks

I make no secret of it: environment variables or magic optional files
as a mechanism to set behavior are best avoided because they're
undiscoverable and difficult to debug. Everything is best set as
explicit command line options or required default files. Meson
approach convinced me :)

2. How to add more exports to the environment? There are two options here:

- do the additional exports and anything else in a wrapper script to
oe-init-build-env (no need to copy and tweak oe-init-build-env). This
is the same custom script stuff, but at least it does use the original
oe-init-build-env.

- insert hooks into oe-init-build-env. For example it could run '.
TEMPLATECONF/extra-exports'

3. Concurrency levels and credentials should be going to
build/conf/site.conf I think? It's made exactly for that purpose:
site-specific settings.

Alex

