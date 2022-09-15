Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6098AECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 09:20:51 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web12.7789.1663233641654109275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 02:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JYHPQKhQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.181,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id z20so21443705ljq.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=S55TJ9/CoaziKfL8dPr2h6G2TS8VFWUB/a1mjwwhOtE=;
        b=JYHPQKhQblnpjrILs0x8+HaUnwWCLuCEVv8GS7rGVJZCJNP2+9odXmGecn4pJPtKyN
         lxtxf61RMkA/nH7JD34j+58ph+FC6LBhmkxTIeWO3Gda2E9kaUydVklfHN652vKmKMno
         +C3MKRvb867xpialM4p4lD+Qo2akhcccxfHejghxjbk6Z8G2Uwbf8M4ONmfEwWqQAGcu
         o0jlvYBzyjqUlFn6ufT0Wo7b7t4xrOW84TKeAUUvxA1UppwRHLXSU3NV5aN50+vQN0yL
         PxLCTNACY2KCSaX4V7zZrTkADwXBfviITCiXZbv33g7SH5y3pQnGycHkYrV2BjCfQalJ
         YjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=S55TJ9/CoaziKfL8dPr2h6G2TS8VFWUB/a1mjwwhOtE=;
        b=LiW+Ti52EQ82lnT8gCL5ZvcAN2cD4tlqwrtZDCteLIlyjMxVkjkCoqqXwll0rIhcn4
         cwEFHIFKZ5dN95tPeZeCm8Cv+x348tIj9HgfrO7izEnBq6mvMCTsR1xyke+rmhvqqc93
         jwuiERmqvc7WLjoy4GACABt+Rr7mtcUfBSHFdXnzDr6oUIJOwzwmfZFYO8iIq0k1cBO0
         TMIFNzBikYU2u6JTKSFHKm3/pPl4FrizhwFLXRxM7RtIWne+HDNyVTblsSIZ2mxYWMTd
         BWuSUY3YKFK89xlJtE0o+XYqVDEkxAfEtMJpbKG/m4/1IxmTNTvEku5Em5R5eQw192JW
         YoYQ==
X-Gm-Message-State: ACgBeo3yXJgcs8xKxpN/Za43ngiYD2vIICysPLvwr7I/Wtl4nvDgavzm
	yhdMh3TbKPrjlynhBb7XOlJmopgDPkJTHGfo8uE=
X-Google-Smtp-Source: 
 AA6agR4b+Y4XyPKOW/Jl9sFK4/uOSiqX3KYotxv8qqYmms1ir6lBrZTC9r3SPXjTt923Q8lKpgexGbXZ+X8nguhcOGs=
X-Received: by 2002:a05:651c:1787:b0:261:c1ff:4407 with SMTP id
 bn7-20020a05651c178700b00261c1ff4407mr11851052ljb.257.1663233639828; Thu, 15
 Sep 2022 02:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220831111401.3330342-1-alex@linutronix.de>
 <e73f356f-87dd-2aba-7445-2f93ad6bf145@windriver.com>
 <CANNYZj-fLHiNEOLzp5etSQRwtNb55kHa4k02jzRRm=c3dohULA@mail.gmail.com>
 <6917e065-3b17-a57e-f862-90366717106b@windriver.com>
 <CANNYZj_OqjRgsQQwQditr1iHCM1RkZak-hFG-zEsqPmMfdNd_A@mail.gmail.com>
 <8e5b3cc0-bf66-fb7c-0199-ae6766c76cc8@windriver.com>
 <CANNYZj8owg_f1=g6VWVo-S6Qhq8VOgeYiGwQgNYQ5-GmbP8OTQ@mail.gmail.com>
 <8f083713-d00a-2393-3b74-35491e830bb0@windriver.com>
 <CANNYZj9nK6OXGEb0qHHSUz_UYn8QZt9ZSk5e_i-A76RPqMG8kw@mail.gmail.com>
 <e0a16812e51d41ada44bd388dea8a90b@axis.com>
In-Reply-To: <e0a16812e51d41ada44bd388dea8a90b@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Sep 2022 11:20:29 +0200
Message-ID: 
 <CANNYZj9_wrEF7OvWYFX090ET1cG0cfK4w0J44a8zMHX6DRHYVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] scripts/oe-setup-builddir: add a check that
 TEMPLATECONF is valid
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: ChenQi <Qi.Chen@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 09:20:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170683

On Thu, 15 Sept 2022 at 03:07, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> I know you have suggested this to me too as we use a similar setup to
> generate the bblayers.conf.sample file based on the layers that repo
> has checked out in our environment, and now I realized why this is not
> as simple as it seems. The problem (at least in our case) is that we
> run as a wrapper around oe-init-build-env. This means that before the
> wrapper sources oe-init-build-env, the build directory and thus the
> conf directory inside it (where the bblayers.conf file is supposed to
> go) may not exist. And after it has sourced oe-init-build-env it is
> too late as the bblayers.conf file needs to exists before. So to create
> the bblayers.conf file, the wrapper would have to duplicate all the
> non-trivial code in oe-setup-builddir that determines what the build
> directory should be called. And while this of course is possible to
> do, it means duplicating code that is internal to bitbake, and risking
> missing important changes to the upstream code in the future. Thus it
> is much easier and safer to generate the template files and let
> oe-init-build-env do its job.

Wait, I have to ask for details here. What is the non-trivial code
specifically? Isn't it simply

mkdir -p builddir/conf
write_out bblayers.conf

where builddir is the same argument that is passed to
oe-init-build-env? Something doesn't compute here for me.

> Where I (and apparently WindRiver) are coming from, the decision on what
> layers are part of the configuration is not something a specific layer
> is responsible for. I.e., in our setup we fetch the layers we want for
> a build, write the list of layers to bblayers.conf.sample and source
> oe-init-build-env. With your setup, if I want a project with the two
> layers meta-a and meta-b, I would also have to create a layer meta-x
> where I create a static bblayers.conf.sample file that lists these
> three layers. Then, if another project wants to use meta-a and meta-c,
> they would have to add a second static bblayers.conf.sample file in
> meta-x that lists those three layers. Basically every time there is a
> new combination of layers fetched, there would also have to be a
> duplicate of the information in a static bblayers.conf.sample file
> somewhere. I am probably missing something here, but to me this seems
> suboptimal. If the list of layers in the static file had been used to
> fetch the layers, I would better understand it, but then the problem
> becomes that the list is now in one of the arbitrary layers that are
> supposed to be fetched.

The idea is that yes, every possible combination of layers needs its
own template, and it goes under version control into a layer.
Typically this would be a layer that is common to all of your build
configurations (which is meta-a in the above example - *not* meta-x)
and that is where the templates go. Do you have such a layer?

I also have to ask, what prevents you from simply listing all of the
layers in a single unified bblayers.conf.sample. Do they step on each
other? How?

I also need to remind you that bblayers.conf(.sample) does support
includes, so you can implement a structured hierarchy of layer config
fragments, where the common bits are only written once.

Basically, there are alternatives, and I think all of them are better
than writing out the list of layers just before setting up a build
with a custom script.

> in our manifest repository. This simple manifest is all the project
> team needs to create to build with their project specific layer. It
> also means that the only input to our Jenkins jobs to build for this
> project (instead of the main platform) is the name of the project's
> repo manifest. It also means that if we make any changes to the main
> platform, e.g., add a new layer (which is a one line change to the
> cfp.xml manifest), all projects will automatically get and use that
> new layer without having to make any changes to all the project
> manifests.

This is somewhat tangential, as it is about extending the default
layer setup config, not the combinations of layers in the build
configuration. So far, the json is not extensible, but we can think
about how to extend and overlay it too. As far as development in
meta-foo goes, the templates (including layer lists) for it can be
hosted there, until the layer 'graduates' into the common structure.

Alex

