Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352AECFD35C
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 11:57:50 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.9735.1728647865950827365
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 04:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R3MAlHg6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-431195c3538so11658065e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 04:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728647864; x=1729252664; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9QXuKRwIa4a2ZZv6YB7dKCzVXNyP1VP0ubXk5Tyqm6k=;
        b=R3MAlHg6/hFEjfUabj99mUVjUSbkGLByvVNI0aSbgFHINEM5wL2nrVYfVmbnBLiCO2
         hsZTqHwSjNupcd4LGTJUXjzjE4wnrg4MG6bUaDuN1hhG0cnxzy5vyRB1vfCyh022MGHk
         IUqPi+92FEUq3F5ZmCGzJJhMSZ2Iv6Z7mlRmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728647864; x=1729252664;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9QXuKRwIa4a2ZZv6YB7dKCzVXNyP1VP0ubXk5Tyqm6k=;
        b=MzXno5buOJ9CAqZ1BSTiXVu+9VH77JLPCZPgIgZPZrusG5fFPsl6IftxAdB52JT9T/
         +Bllx2r/VJHdMN49Rk26zVtxX//zvgkal3x7LEyr4qLpI13VHYPm6vy7ENDx7nFChMHe
         MmyNhrfTowDSgjru9c5OhfGRwgS/QWo4nHmfGbYJFXeGo8kv/ReY/Gw87nSWwpgJtaRd
         eT6FjE64dFQZOdJouarTVUwroLqGCRh3P/59GYmiNwmtPQWox21G2OvxiS9xsAEQvQ+r
         oMrlphvWQXe0RUUWeRn2nrnkS8OlAzzjZSw7glb3b1fA5n2ssWvFa+QAcemK1gTYDaSa
         aKUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI2W981+MIWLMmvYseWWG2DqadXW8Y3NYQTGljytUKXHgSpE/IKRtxPlq8dM9jJd3pF8Aq2z+ya8KufpTAJNgFMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyrjs7nnggy3+wp2bW+87BOeER7NQ3TBSGm1lwbUhFPfblDwUxy
	es/GHsVEGpRljlDwY4ve6dtiUygMwcME6XCgqOhJvuNVsoXPCvZ8PvYBDByDph0=
X-Google-Smtp-Source: AGHT+IG/SdrQVQ9hGmf9aHBZPmsZxRLbYCxqDIOSJlGT7oYVAsJX6N0CgiBK/tlVflrUaSamR4IU1A==
X-Received: by 2002:a05:600c:4ec7:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-4311df47618mr14221165e9.27.1728647863977;
        Fri, 11 Oct 2024 04:57:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8145:ba6d:a6de:28af? ([2001:8b0:aba:5f3c:8145:ba6d:a6de:28af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d748d42fsm73258925e9.43.2024.10.11.04.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 04:57:43 -0700 (PDT)
Message-ID: <533a239d067329826080a0390ce87d811798101c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] archiver.bbclass: Fix archiver interaction
 with kernel recipes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Reid <preid@electromag.com.au>, 
	openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 11 Oct 2024 12:57:40 +0100
In-Reply-To: <f05b8b5d-0bda-4e16-a925-9e74eeb03c8d@electromag.com.au>
References: <20241010052529.18502-1-preid@electromag.com.au>
	 <26e580e6dadced007020601689e3d7a4f2790e45.camel@linuxfoundation.org>
	 <f05b8b5d-0bda-4e16-a925-9e74eeb03c8d@electromag.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 11:57:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205676

On Fri, 2024-10-11 at 07:40 +0800, Phil Reid wrote:
> On 10/10/2024 15:17, Richard Purdie wrote:
> > On Thu, 2024-10-10 at 13:25 +0800, Phil Reid via lists.openembedded.org
> > wrote:
> > > Changes to the logic of is_work_shared where made in
> > > commit: 5fbb4ca8da4f4f1ea426275c45634802dcb5a575
> > > "archiver.bbclass: Improve work-shared checking"
> > >=20
> > > The resuled in a change of the logic (simplifed here) from:
> > > =C2=A0=C2=A0 inherits(gcc-source) or inherits(kernel) or (inherits(ke=
rnelsrc)
> > > and srcin(work-shared))
> > > to just
> > > =C2=A0=C2=A0 srcin(work-shared)
> > >=20
> > > With INHERIT +=3D "archiver" in the local.conf and a kernel recipe th=
at
> > > uses
> > > KERNEL_PACKAGE_NAME. When KERNEL_PACKAGE_NAME is defined the kernel
> > > source is not placed into work-shared, but the archiver ends up
> > > deleting the source folder in the work dir, and the build
> > > subsequently fails.
> > >=20
> > > Restore the previous logic while also mainting the referenced commits
> > > intent
> > > to consider all recipes that use work-shared. Logic is now
> > > =C2=A0=C2=A0 inherits(gcc-source) or inherits(kernel) or srcin(work-s=
hared)
> > >=20
> > > Signed-off-by: Phil Reid <preid@electromag.com.au>
> > > ---
> > > =C2=A0=C2=A0meta/classes/archiver.bbclass | 5 ++++-
> > > =C2=A0=C2=A01 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > You're effectively reverting that commit whilst changing the logic so
> > it looks slightly different.
> >=20
> > Was there a problem with gcc-source archiving as I notice the patch
> > adds gcc-source back too?
> To be honest I didn't test without the gcc-source, I reverted the commit =
first after
> finding that commit to be the cause and modified it so it consider it alw=
ays considered
> work-shared path and called it done and the old logic conditions.
>=20
> >=20
> > The commit message isn't quite accurate as gcc-source isn't something
> > which gets inherited.
> Fair enough.
>=20
> >=20
> > Does this only happen with kernel recipes which use
> > KERNEL_PACKAGE_NAME? That might be the key missing detail which would
> > allow us to reproduce the failure.
> >=20
>=20
> I haven't seen the problem on a virtual/kernel.
> When KERNEL_PACKAGE_NAME is specified the kernel source isn't put into wo=
rk-shared.
>=20
>=20
> How would you like to see this fixed?

I deal with many patches a day and part of the review process is to see
if a change makes sense. So far, this patch does not add up properly.
What I need is a change which makes sense and is something I can
review, agree with and merge. What I don't have is time to deep dive
into every issue and work out the proper fix, much as I would love to.
So far on this issue, the information I do have isn't adding up
correctly.

Taking what you say above, "KERNEL_PACKAGE_NAME is specified the kernel
source isn't put into work-shared" - that makes sense.

If the kernel isn't being put into shared workdir, "is_work_shared()"
should be returning False in this case. Looking at the logic, I believe
that is true and it will for a KERNEL_PACKAGE_NAME recipe.

So what you're probably saying is that the code should be using the
"shared" codepath for the KERNEL_PACKAGE_NAME even though the workdir
isn't shared. At this point I'm just having to speculate though.

So how would I like to see this fixed? I'd like to see an explaintion
of the problem which makes sense and I'd like to see changes which
don't make the code "worse", i.e. making a "is_work_shared()" function
return True when it isn't.

It sounds like there is a deeper problem with the archiver code which
needs fixing at the root of the issue. Again, I'm back to speculating
though.

Cheers,

Richard
















