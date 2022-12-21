Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9C9C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 02:29:20 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web11.9495.1671589750236686760
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 18:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=rA1jBydw;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: sakoman@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id h26so13515720vsr.5
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=krHAouruLfvhuC2TILgROD6bLOZoBr2kT3Sx+fWH6Ic=;
        b=rA1jBydw76X2SPOvztzMUg92tqjL/3IxussgpOqNM02QcejMuLu/dmTsmuF2L2p28m
         a7rEUQ/TVt0+6otMUle3y140vIsrud6NYuJtiIPM+pvxAC+SfwXAcvSOvLdG5QstQXjz
         eRsk+uHYaXK83sbqVTqIXEu9XX8EuPN1ohVXYgdEHzFwTZta27FHfvxbNulOIDXNlSb1
         yRSwqNlzF6KxqMSVYasou/E9ak5oGKdofUXGxZYC/wlQ4NNjkTfo9fpWN76GsmovhQfZ
         mkJ7HWBgPdVAyfnoY7DqKJ+6UCYmZbvkwbf2lRma3HpbkZUauhryL9byssVoDThapran
         1cPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krHAouruLfvhuC2TILgROD6bLOZoBr2kT3Sx+fWH6Ic=;
        b=BMC/T4omL2aQ3JvahRi2CiPs8HfLRvk6L843WyaMns66SpJxURvMKJ/D2H+X2yxMHl
         iXDV1AvD4aZoVpMP1O+lPvBHgwAFPc9ZtgWf6vRhvXFWZsD7V57i2tIQe9pN4bf36vNw
         ZyRApCO1LqCg1BIhlBlKG2fHiA65QIkiWvkk0VEwmwP5udxarNh2CILwmGkj7TeeNF1T
         yDJ67IKkJYOaFNq6AD2k0FRjHNyX5g4zI6vpH47PbInaHILQYYHEh14yXrpuup61Nqws
         ZxRIJ0PsfGt0me/CHzWjIS2OjE7kypLUeqriEU4MPXb53czVc8LekwYmam9A7jJvHWas
         uECg==
X-Gm-Message-State: AFqh2kpukU17D5aEt+yvpY1jn2kVGcC1yk+o1eWZK4vNs3zPKFN6j6jm
	RrxZmTQl/sBw5JHAP9xqBLhB4hL0U26IWiO9EO4=
X-Google-Smtp-Source: AMrXdXsNmEjJkvX3SKAFV4OOJhqejhn1zU0QaciUfDwhj+N2M5xJKSY+u7mVRwvlN2L7LFT7kFQkPkpcg9nNblJbBg0=
X-Received: by 2002:a05:6102:3642:b0:3b2:f4e4:a865 with SMTP id
 s2-20020a056102364200b003b2f4e4a865mr18193vsu.71.1671589749204; Tue, 20 Dec
 2022 18:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20221219174146.64696-1-bruce.ashfield@gmail.com>
 <20221219174146.64696-4-bruce.ashfield@gmail.com> <CAOSpxdbQ9SaCmMJddnFTyX3Z7p+seZO9vtGjYcDNUPSAWQOhzQ@mail.gmail.com>
 <CADkTA4NFev8Kxy_Eu5rUYt6zMwfb+smyCcH7RzZLC-zAmOA2Tg@mail.gmail.com>
 <CAOSpxdbjEq0PyuSgu+RrZ7bhb+Pf=oTZv33F_EL+ou11DFk5sA@mail.gmail.com>
 <CADkTA4NvfML8HQ_K03OknW44hi3NG5MW+kHj3wCM_-44dCKxcA@mail.gmail.com> <5132a777cff0cefe9ccc04c74ae7272aa3263240.camel@linuxfoundation.org>
In-Reply-To: <5132a777cff0cefe9ccc04c74ae7272aa3263240.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 20 Dec 2022 16:28:58 -1000
Message-ID: <CAGDS+nno0+wVA4dmmhZzjaUJn06YPxHWmEMAizCKhbiaBq3Owg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4][dunfell] linux-yocto/5.4: update to v5.4.228
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174886

On Tue, Dec 20, 2022 at 11:49 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-12-20 at 13:50 -0500, Bruce Ashfield wrote:
> > On Tue, Dec 20, 2022 at 1:48 PM Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > On Tue, Dec 20, 2022 at 4:46 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > >
> > > > On Tue, Dec 20, 2022 at 9:27 AM Steve Sakoman <steve@sakoman.com> wrote:
> > > > >
> > > > > On Mon, Dec 19, 2022 at 7:41 AM <bruce.ashfield@gmail.com> wrote:
> > > > > >
> > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > >
> > > > > > Updating  to the latest korg -stable release that comprises
> > > > > > the following commits:
> > > > > >
> > > > > > [...]
> > > > > > -SRCREV_machine_qemuarm ?= "13d88d2fc15f1edfa91378bc3a76aa4274969ed8"
> > > > > > -SRCREV_machine_qemuarm64 ?= "14d0e6d0baf0c7b2308ff1270bd706f927c72df4"
> > > > > > -SRCREV_machine_qemumips ?= "11472a4308590f1858d1ba7bb03bdc25cd2c9b3f"
> > > > > > -SRCREV_machine_qemuppc ?= "daf1282f1c6fd653fcae25e8d1d49540a932baeb"
> > > > > > -SRCREV_machine_qemuriscv64 ?= "15231fe2f4542b044e279e53269ee506bced9988"
> > > > > > -SRCREV_machine_qemux86 ?= "15231fe2f4542b044e279e53269ee506bced9988"
> > > > > > -SRCREV_machine_qemux86-64 ?= "15231fe2f4542b044e279e53269ee506bced9988"
> > > > > > -SRCREV_machine_qemumips64 ?= "31f08b9f81298e80e00ea37886db6f88092a5cf6"
> > > > > > -SRCREV_machine ?= "15231fe2f4542b044e279e53269ee506bced9988"
> > > > > > -SRCREV_meta ?= "3e7ca0fe77707fabb1beefd5d3cd322a4db1eb41"
> > > > > > +SRCREV_machine_qemuarm ?= "32654a547b05ba63c604503fc865d7052ae96992"
> > > > > > +SRCREV_machine_qemuarm64 ?= "2bd8ca7c0973870753b103107513689a598383d7"
> > > > > > +SRCREV_machine_qemumips ?= "84a8ba0ada556ba3307c33e2b5a0ca8f9e3df1dd"
> > > > > > +SRCREV_machine_qemuppc ?= "20db90d7935c8760bfc68c0de4f7d7085cba7c14"
> > > > > > +SRCREV_machine_qemuriscv64 ?= "921d9e22542506ba26c2e5e2f25ec00ff9bffa63"
> > > > > > +SRCREV_machine_qemux86 ?= "921d9e22542506ba26c2e5e2f25ec00ff9bffa63"
> > > > > > +SRCREV_machine_qemux86-64 ?= "921d9e22542506ba26c2e5e2f25ec00ff9bffa63"
> > > > >
> > > > > I suspect you forgot to push this final change set to the linux-yocto repo!
> > > >
> > > > Hmm. nope. Everything is pushed, disregard the updates, I'll have
> > > > another look at it the second week of January.
> > >
> > > It wasn't there earlier this morning when I sent the email, but now it
> > > has magically appeared!
> > >
> > > So nothing for you to do at this point.  I've restarted the build and
> > > will let you know if I run into any other issues.
> >
> > odd. I was pushing some 6.1 changes, but git didn't report anything coming
> > from the 5.4 branches.
> >
> > Fingers crossed that my script updates to the SRCREVs and what is there
> > now are a match!
>
> FWIW it takes time for the revisions to mirror from the push server to
> the other public git servers. For the kernel it probably takes longer.

Yes, I'm familiar with the delay.  In this case though the patch
emails arrived yesterday at 7:41am and I did the build hours later in
the early afternoon. I'm not sure when Bruce did the push, I assume it
was before he sent the patches!

I noticed the failures in the early evening and stopped the build.  I
didn't look at the errors till this morning and noticed when I browsed
the linux-yocto repo that the requested commit id wasn't present. IIRC
the top of tree was the 5.4.227 tag.  It was at that point that I sent
the email.

Later in the morning I checked linux-yocto again and the referenced
commit was now top of tree and my build succeeded.

Not sure if any of this is helpful in debugging mirror tarball
breakage, but thought I would record the details while they were still
fresh in my mind.

Steve


> I think these builds with "missing" revisions and the older fetcher in
> dunfell caused some kernel mirror tarballs to get deleted and broke the
> esdk kernel module tests in my build. That shouldn't happen but somehow
> seemed to :/.
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174885): https://lists.openembedded.org/g/openembedded-core/message/174885
> Mute This Topic: https://lists.openembedded.org/mt/95769673/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

