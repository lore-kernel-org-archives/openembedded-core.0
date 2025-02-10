Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0214C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 22:33:52 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.6383.1739226825677438833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 14:33:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WSrMH202;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso7536915e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 14:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739226824; x=1739831624; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vDl5qaTAE5smbNY1JfMR+DMZ2IYDVHGUpnaw+Ypzp7A=;
        b=WSrMH202ADO+AWN1dZS9aphno0YbiNEtcxa5qZKL6SDeTT603sK+rX0NgkXLdpMV6e
         FOOgC/9Te7wo0o7hi9YWqmwkfYXokfGLcJryxdHXrTY+4M4sronejRaP/SMFC9psW458
         u9rOMYkaLwFgh15apioYgSj63/iy3WkcQT9x/Kud5KFrMRft3nqrwDQvc/BM7IFxSfK3
         zrQsXsVM+CcrdGXFZBl1vex4aW343IdYe0SYQl7MuI+unEUJm5CR/Y5Rr2Fzi6B0c0F2
         eqGG8e8jZWSchxahSt2NMl2qS2kzEbP+PeOYn/jNBvEEGEfBYoJCkO29kLyEyKNwSO25
         4BRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739226824; x=1739831624;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vDl5qaTAE5smbNY1JfMR+DMZ2IYDVHGUpnaw+Ypzp7A=;
        b=CG3ZRroIRjLuKfyuE/ZA7NqwlPqFiRamycj00lVWaH0aOl4FklCEsdZQBrgcWUEYqu
         5lme9Mmp9bKRXQDtp39+I1bosT7aJg1bswnxERdDyr9veTJcoN6gpRJelpNi1GJ3Askc
         iHf9m528NGBpnuKzcu30CRwFauys+2jxqw5jUO4qhK8JP7gm8XTxBk+4Ild3J9npw6if
         19nhUwn13kGgrf0QrOcZDHTZ7y9aIuYVb9DshBR6cIu5TTw9MkDMDYZ+4vUJXPbITmVm
         6Jyyff58V2CX0K9XvmSet9EeVZbXWDktXqGpE0+awmlVgodvrX/W+KJGfGCyRalz5/x9
         T8zA==
X-Forwarded-Encrypted: i=1; AJvYcCVBuw8hnIrFFssuTTGsq39xGb3qriCL0de1npp0rHEnfYBH+x7TXaglYIzqShW7SX2erleBFyGpONQXrWugw7GUQA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySQ9nuA1RApyXm3+VEXJWrgcR4n1xBw+DANRav/Ox+Yg/+emdg
	fY7r7k4k00RimP8QJDQn/OCKrMXIdxROzBtTXcpo3h66L+tIhObq
X-Gm-Gg: ASbGncuFCsFAzGC4CJPlwDqrAN/F62pvsi5wpYV1ng6UcGnzldHkr8Hv6pQp1A47h6a
	9Vu3bTfGoet3J5CaPaVwrpkJknlWMnrw5ZKb9e6HjULJZDbK4fq5V/eS4ZiiZpY5e1BOfnXw2Pm
	R34y2muAfx+Z2OrP8//72+4F6ceiNJRC8cr/xAcj3rSE+x+45ru+eJHCITQiSV8bynHfriOqilf
	Th5a0QGbbIEdYEFSis8CN1tSnkn8FUKxx4Ifw0ZPS7VG8P1VQTtF+rY1QZtqzp/Pwv64fHV3bJ+
	3FxWRl3WSeyHOha/iGtuveANaeaqUoT2sCzZMI0B+NRHwKiw5iccCpCDKY40nXEr
X-Google-Smtp-Source: AGHT+IG6+K2+iVKNfKwdR8KmegcUJIF0Lp3HQwPeJ2LNiE3epbmFvkhudjs6ugJfWLLIzq0Gwb65Ww==
X-Received: by 2002:a05:600c:3b86:b0:439:4696:c071 with SMTP id 5b1f17b1804b1-4394696c404mr38542505e9.19.1739226823805;
        Mon, 10 Feb 2025 14:33:43 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca34a8sm157103105e9.16.2025.02.10.14.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:33:42 -0800 (PST)
Message-ID: <008427b1b6e750333275ec65c902f4cc3b827cef.camel@gmail.com>
Subject: Re: [OE-core] Request for discussion: Kernel version for LTS
 releases
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: steve@sakoman.com, Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Feb 2025 23:33:41 +0100
In-Reply-To: <CADkTA4OHKxnGwHTmMpnVQRoEaN5Ly-7ygCr1Vn2UkgsOdAra7g@mail.gmail.com>
References: 
	<CAOSpxdbC-=6htz0g8i8NpcrmTsTpDXM0AkxtAO334KHEmKgu5Q@mail.gmail.com>
	 <CADkTA4MDZb+_MBBNvKCMKm6xT_V_z_+C-pVj=xG8Ua-zSA3aZQ@mail.gmail.com>
	 <CAB3asfgTmXaE9a=wC7wnT09ZbcwHeiVGNtadkYH9rZVi_pZjoQ@mail.gmail.com>
	 <CADkTA4OHKxnGwHTmMpnVQRoEaN5Ly-7ygCr1Vn2UkgsOdAra7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 22:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211122

On Sun, 2025-02-09 at 18:27 -0500, Bruce Ashfield wrote:
>=20
>=20
> On Sun, Feb 9, 2025 at 5:58=E2=80=AFPM Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
> > Hi Bruce
> >=20
> > Am Do., 30. Jan. 2025 um 15:48=C2=A0Uhr schrieb Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org>:
> > >=20
> > >=20
> > > On Thu, Jan 30, 2025 at 9:31=E2=80=AFAM Steve Sakoman via
> > > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> > > wrote:
> > > > As you may be aware, the support period for Linux kernel LTS
> > > > releases
> > > > has changed to two years. This presents a challenge for our
> > > > Yocto LTS
> > > > releases, which have 4 year support periods.
> > > >=20
> > > > In light of this, Richard sent an email to the Yocto
> > > > architecture list
> > > > in January of 2024 outlining the project's plans for kernel
> > > > support in
> > > > future LTS releases (copied below)
> > > >=20
> > > > TLDR: Around the midpoint of the Yocto Scarthgap LTS lifecycle
> > > > we will
> > > > backport the then current LTS kernel version and make it the
> > > > default
> > > > kernel version. The linux-libc-headers version would remain at
> > > > the
> > > > released version.
> > > >=20
> > > > At a recent Yocto Project Technical Team Meeting there was some
> > > > discussion around the growing kernel CVE counts in the stable
> > > > branches:
> > > >=20
> > > > kirkstone: 552
> > > > scarthgap: 225
> > > >=20
> > > >=20
> > >=20
> > >=20
> > > I hope these aren't based on the fact that I haven't sent the -
> > > stable
> > > updates to the list yet. I do the older branches on a monthly
> > > cadence, but can increase it. I have all active upstream kernels
> > > on their latest -stable in linux-yocto already.
> > >=20
> >=20
> >=20
> > Given the increasing importance of timely security updates and the
> > rising
> > frequency of new CVEs, staying as close as possible to the latest
> > upstream
> > kernels from kernel.org is becoming more essential than it was a
> > few years ago.
> > Additionally, patchsets such as preempt-RT, which were conveniently
> > offered by
> > the linux-yocto kernel, are now mainline.
> >=20
>=20
>=20
> We are creeping away from the question that Steve was asking,
> not that these aren't valid things to ponder, but they have been
> thought about many times and are revisited periodically .. that
> being said, I'll offer some context below.
>=20
> If you take an extremely narrow view of what we do with linux-yocto,
> then sure (I won't repeat things here, since I've done no less than
> three presentations on this in the past).
>=20
> Not to mention there are still parts of -rt that are not mainline,
> and
> early access BSPs, as well as SDKs that are part of linux-yocto,
> kept on their own branches so as to not inflict themselves on all
> users.
>=20
> linux-yocto has almost no delta from upstream timing wise when it is
> available, and it isn't like we'd be doing a rolling release, the
> only lag
> is our own embedded specific testing and validation. So there's
> nothing=C2=A0
> to be gained on that front. I only asked that question to be sure
> that it
> wasn't related to that (and it wasn't).

I took some time today to understand what you are describing here in
the linux-yocto git repository. Your pointers have helped me to start
my git tool with sensible parameters, so I now understand exactly what
the difference is between linux-yocto and linux-stable.

I agree that the way the linux-yocto git repository is maintained is
the best approach for maintaining a downstream kernel repo. It's at
least as transparent as it can be if you know how to look at the
overwhelming number of branches and merge commits. Basically, it's
about creating a new branch for each major upstream release. Then all
downstream patches are rebased and applied to the new branch of the new
major release. Finally, the branch is maintained by merging the minor
upstream updates into the downstream release branch. Since the merging
of minor updates can probably be automated to a large extent, it should
be possible to follow the stable git repo quickly. And yes, the two
repos were at the same commit when I compared them.

At least from that point of view, it would be possible to run the CVE
checker with ${AUTOREV} for the linux-yocto kernel and get the same
results as if the linux-stable tree would be used. It's not the linux-
yocto git repository which adds the delay it's just the recipe which is
not updated in "real-time" which is also understandable.

> =C2=A0
> >=20
> > This raises the question: Is a downstream linux-yocto kernel git
> > repository still
> > needed? From my naive user's perspective, it would be simpler and
> > more transparent
> > if the kernel were handled like any other recipe. Instead of a
> > linux-yocto recipe
> > referring to a downstream git repository, there should be a linux
> > and/or a linux-stable
> > recipe referring to the corresponding git repositories from
> > kernel.org.
> >=20
>=20
>=20
> Again, I'd refer to the various previous works on what we do with
> linux-yocto, and we want fewer, not more reference kernels so we
> can have the momentum around specific versions. (i.e. there would
> be no advantage to splitting out -stable)
>=20
> linux-yocto is bit for bit the same as upstream in the /base branches
> exactly where it is fetched is the only difference.

Yes, got it!

>=20
> >=20
> > Ideally also the workflows for updating the kernel and testing the
> > kernel would
> > be possible with the Yocto standard workflows like devtool update
> > and running
> > oe-selftest.
> >=20
>=20
>=20
> That's already possible now, but how we use linux-yocto as a
> collection
> point for contributions, BSPs, managing the versions, the workflow,
> etc
> don't scale to slinging around directories full of patches (again,
> covered
> in the various presentations).
>=20
> We heavily test linux-yocto, so obviously oe-*test works, and you
> don't
> chuck out a workflow that has scaled and worked for 15 years (and
> predates devtool significantly if=C2=A0 devtool doesn't work (I have no
> idea, I
> =C2=A0don't use it and probably never will, but if it is important to
> folks, I can
> dive in and fix what is broken (I just need to know what is broken).

Yes, the standard recipe tools should work as for any other recipe. The
magic is how the linux-yocto git repo is maintained and that's a
special non standard tool topic. I see.

>=20
> Back to Steve's question, and one of the other follow ups. We use
> linux-yocto
> as a point of momentum for versions, fixes, releases, etc. It always
> has been
> and always will be opt-in for people's distros and projects, so they
> are free
> to ignore it, or use it.=C2=A0

Got it. linux-yocto is in sync with linux-stable.

Thank you!
Adrian

>=20
> Bruce
>=20
> =C2=A0
> >=20
> > Thank you and regards,
> > Adrian
> > > =C2=A0
> > > > For comparison the master branch CVE count for the kernel is 18
> > > >=20
> > > > The suggestion was made that we do this kernel version update
> > > > sooner
> > > > rather than later, and also include the Kirkstone LTS branch in
> > > > order
> > > > to deal with its large number of CVEs.=C2=A0 The original plan was
> > > > to only
> > > > do this version bump for Scarthgap, so this would be a change
> > > > to the
> > > > plan of record.
> > > >=20
> > >=20
> > >=20
> > > I don't think we should be updating kirstone to a new kernel
> > > while the
> > > upstream kernel's are active. Both 5.15 and 5.10 are still active
> > > on=C2=A0
> > > kernel.org and I'm still updating them, or am I missing something
> > > ?
> > >=20
> > > That was the primary trigger around the updates: EOL on k.org
> > >=20
> > > If we are now questioning the -stable process=C2=A0on k.org that it
> > > can't
> > > keep up on these still active LTS kernels, that is a different
> > > question.
> > >=20
> > > If we are questioning it, I have other suggestions around the
> > > reference kernel versions.
> > >=20
> > > But in the end, as long as the kernel we jump to is actively
> > > maintained
> > > in our newer releases, there's not a lot of extra work so it is
> > > fine
> > > with me. I just want to understand why we'd move kirkstone as
> > > well.
> > >=20
> > > Cheers,
> > >=20
> > > Bruce
> > > =C2=A0
> > > >=20
> > > > Please consider the above and respond to this email with any
> > > > thoughts
> > > > or concerns you may have about implementing this version bump
> > > > in both
> > > > LTS branches in the coming weeks.
> > > >=20
> > > > Thanks!
> > > >=20
> > > > Steve
> > > >=20
> > > >=20
> > > > Full text of Richard's email:
> > > >=20
> > > > The project is aware that the kernel versions that ship in our
> > > > next LTS
> > > > in April will likely not have support for the full lifetime of
> > > > our LTS
> > > > (four years). We've been asked a few questions about this so we
> > > > wanted
> > > > to write down what our plan is.
> > > >=20
> > > > Our intent is to support the versions we ship with for as long
> > > > as is
> > > > practical. If they become end of life around the mid point of
> > > > the LTS
> > > > as expected, our plan is to backport a current LTS kernel at
> > > > that time
> > > > into the release and make it the default, leaving the older
> > > > recipes
> > > > there for anyone who still needs to use them. It would be based
> > > > on the
> > > > kernel in one of our future releases, as appropriate.
> > > >=20
> > > > The linux-libc-headers version would remain at the released
> > > > version.
> > > > This is used to control the features in the toolchain/userspace
> > > > and
> > > > there is no need to upgrade this to work with a newer kernel
> > > > version.
> > > > Upgrading it would potentially change the toolchain and
> > > > userspace
> > > > functionality and this is not desirable in the LTS. To be
> > > > clear, this
> > > > does mean bleeding edge features in the newer kernel may not be
> > > > available but that is desirable in the context of the purpose
> > > > of the
> > > > LTS.
> > > >=20
> > > > The only reason the headers version would change would be to
> > > > address a
> > > > security issue in the toolchain or kernel/userspace interface.
> > > >=20
> > > > Since we don't know what the upstream kernel will do, or when
> > > > exactly,
> > > > it is hard to make a definitive plan beyond this.
> > > >=20
> > > > We appreciate this isn't our usual policy of "no upgrades",
> > > > however if
> > > > everyone knows this is the plan from the start, we believe that
> > > > is
> > > > different and everyone can plan accordingly, hence wanting to
> > > > make this
> > > > clear now.
> > > >=20
> > > > Since the project is planning to execute the full QA process
> > > > against
> > > > this new version, it is putting a plan in place to switch from
> > > > the
> > > > start and it plans not to test against any other version beyond
> > > > that
> > > > point, it makes most sense to directly integrate the changes
> > > > rather
> > > > than the mix in layer approach which is there for unplanned
> > > > changes.
> > > >=20
> > > > To be clear, we may also update this plan if/as things develop
> > > > in the
> > > > other dependent ecosystems such as kernel as we can't know what
> > > > will
> > > > happen in these on the timescales involved.
> > > >=20
> > > > Cheers,
> > > >=20
> > > > Richard
> > > > (on behalf of the Yocto Project TSC, LTS and kernel
> > > > maintainers)
> > > >=20
> > > >=20
> > > >=20
> > >=20
> > >=20
> > > --=20
> > > - Thou shalt not follow the NULL pointer, for chaos and madness
> > > await thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >=20
> > >=20
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#210448):
> > > https://lists.openembedded.org/g/openembedded-core/message/210448
> > > Mute This Topic:
> > > https://lists.openembedded.org/mt/110897884/4454582
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-
> > > core/unsub [adrian.freihofer@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20


