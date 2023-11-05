Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0412C4332F
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 19:43:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.37093.1699213412898299690
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Nov 2023 11:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lUfuLmwQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40859dee28cso29444915e9.0;
        Sun, 05 Nov 2023 11:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699213411; x=1699818211; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bNK3LrTF5tM7QJrEqjLcNE0wA5dpreVent9FQYXF/kA=;
        b=lUfuLmwQEYtuBP67CA7LrAZxrsp/FCnILmzrSCOetf32VL/cD4k+WyTcjSEiymLuDo
         B4rrcVIIMjhoi9ze19Z/wgXprA4Hcx5fsxLhcNRjCHAvwbR8g7KcOmyXaisus+xxtcWm
         rERavIS7IupGO32Lvf+5WfpNPS5xrc4N4zmOg1tJVhQnaYaz5Q8GGd6X8G4oRAuGgSYZ
         NPIe4h5dPxjcB0CDr3BLUYCUUISUpOVp9JIMj3lbFdA0HJ7Qk5pef+F4np2/4RyhzHHI
         HrkGqdmWBB1aubaWDD50V83e5XOzfG7PbFqvaFcs0mBD+HbEJ2HDCteWMH6CDuQUNXUf
         fJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699213411; x=1699818211;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNK3LrTF5tM7QJrEqjLcNE0wA5dpreVent9FQYXF/kA=;
        b=s7HO4gHnt4s7/36jS/3VXqWKGth+NTILv+7R47j8lp4CHtOyIshsxEAgIAr2WQ3AuA
         s983FQgZDUNOCxHwsD/nzwupouN/BynnTZs37Li4Y22xfnMlW4NRpqcMJJs72Fj15jMN
         o/7VqFzzft4F4jR2JkpcgBUoE9WBxUVFIItyyXweJ/9o/lDEepS0RwVc2omqF0RLvq9e
         uamU5/NrEe90uesvx55CxPDk9nH5OFG7fZPhXkGZshapiYfl6QPTtQOerBzWh9xj4/FV
         EnLAYGJ+229heGsjtsc/Dh28tXoJNbp5CljUspuQsAr2v5cZCyuvS+35oFv2Y2UQQnkz
         v+1g==
X-Gm-Message-State: AOJu0Yz3tE36YbDgypdPxH7UN3m7imQQJTMlqjXsjiMjlwRRDMPVcbyk
	jlrJYoCK29opH9Tz3Ac0lTo=
X-Google-Smtp-Source: AGHT+IGYJ6Sxr5HsCOldl7DhrOHO4CmCuyhD1tI4Laj2mjZmIdD8M7SNofnhhPy7b9G7YbSpzjBveA==
X-Received: by 2002:a05:600c:3146:b0:406:53ab:a9af with SMTP id h6-20020a05600c314600b0040653aba9afmr23025479wmo.10.1699213410769;
        Sun, 05 Nov 2023 11:43:30 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 12-20020a05600c020c00b004063ea92492sm9849221wmi.22.2023.11.05.11.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 11:43:30 -0800 (PST)
Message-ID: <dd3d342e400b900c7f7ddbbe93c725472f6d6f1f.camel@gmail.com>
Subject: Re: [OE-core] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
From: adrian.freihofer@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Michael Halstead
 <mhalstead@linuxfoundation.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Julien STEPHAN
 <jstephan@baylibre.com>
Date: Sun, 05 Nov 2023 20:43:29 +0100
In-Reply-To: <0b1cfe6b26e5c61b1e700e3801900038e2d48f25.camel@linuxfoundation.org>
References: 
	<CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
	 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
	 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
	 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
	 <649b2f000761831cabd1f5737fb5b30a2ffc3654.camel@gmail.com>
	 <CANNYZj_Cq+cncw5SCGii=Mhj0KGgo=qr=hCuo+wpdvtR9C=Qyg@mail.gmail.com>
	 <58e2c7a830bceac9b3a8c6cee63f03ae4a118da0.camel@gmail.com>
	 <0b1cfe6b26e5c61b1e700e3801900038e2d48f25.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Nov 2023 19:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190190

On Sat, 2023-11-04 at 11:09 +0000, Richard Purdie wrote:
> On Sat, 2023-11-04 at 11:29 +0100, adrian.freihofer@gmail.com=C2=A0wrote:
> > Hi Alex, hi Richard
> >=20
> > After some internal discussions, I would like to clarify my
> > previous
> > answers on this topic.
> >=20
> > =C2=A0* Usually there are two different workflows
> > =C2=A0=C2=A0=C2=A0 - application developers: could use an SDK with a lo=
cked
> > sstate-cache.
> > =C2=A0=C2=A0=C2=A0 - Yocto/BSP developers: need an unlocked SDK. They c=
hange the
> > recipes.
> > =C2=A0* A locked SDK
> > =C2=A0=C2=A0=C2=A0 - can work with setscene from SSTATE_MIRRORS
> > =C2=A0=C2=A0=C2=A0 - setscene does caching in the SSTATE_DIR (no issue =
about that)
> > =C2=A0=C2=A0=C2=A0 - But network problems can occur during the initial =
build
> > because
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake executes many independent setsce=
ne tasks. Opening so
> > many
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 independent connections slows down the b=
uild, especially if
> > the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 server treats them as a denial of servic=
e attack.
> > =C2=A0=C2=A0=C2=A0 - The denial of service problem is difficult to solv=
e because
> > each
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setscene task runs in its own bibtake ta=
sk. Reusing a
> > connection to
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 download multiple sstate artifacts seems=
 almost impossible.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is much easier to solve with separa=
te sstate download
> > script.
>=20
> FWIW, we did have a similar issue with do_fetch overloading
> servers/proxies/ISPs and added:
>=20
> do_fetch[number_threads] =3D "4"
>=20
> Finding the right place to put a thread limit on overall setscene
> tasks
> is harder but in theory possible. Or perhaps a "network capable
> tasks"
> thread limit?
>=20
> Is the overload caused by the initial query of sstate presence, or,
> does it happen when the setscene tasks themselves run?

The most extreme situation is probably bitbake --setscene-only with an
empty TMPDIR. Each of the setscene tasks establishes a new connection.
A server receives so many connections that it treats them as a denial
of service attack by throttling. A separate script would allow the same
connection to be reused to download all the required artifacts.
Limiting the number of threads does not really solve the issue because
there are still the same amount of connections which get quickly
opened.

>=20
>=20
> > =C2=A0* An unlocked SDK
> > =C2=A0=C2=A0=C2=A0 - Tries to download the sstate cache for changed rec=
ipes and
> > their
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependencies, which obviously can't work=
.
> > =C2=A0=C2=A0=C2=A0 - The useless download requests slow down the build
> > considerably and
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cause a high load on the servers without=
 any benefit.
>=20
> Is this sstate over http(s) or something else? I seem to remember you
> mentioning sftp. If this were using sftp, it would be horribly slow
> as
> it was designed for a light overhead "does this exist?" check which
> http(s) can manage well.

Yes, we are evaluating sftp. You are right, it is not optimal from a
performance point of view. For example S3 is much faster. A compromise
is to set up a limited number of parallel sftp connections. This has
worked very well so far.

The question of why we use sftp brings us to a larger topic that is
probably relevant for almost all Yocto users, but not for the Yocto
project itself: Security.

There is usually a git server infrastructure that makes it possible to
protect Git repositories with finely graded access policies. As the
sstate-cache contains the same source code, the protection concept for
the Git repositories must also be applied to the sstate-cache
artifacts.

First of all a user authentication is required for the sstate-mirror.
An obvious idea is to use the same user authentication for the sstate-
cache server as for the Git server. In addition to https, ssh is also
often used for git repositories. SSH even offers some advantages in
terms of user-friendliness and security (if a ssh agent is used).=C2=A0This
consideration finally leads us to use the sftp protocol for the sstate
mirror. This is also relatively easy to administer: Simply copy the
user's public ssh keys from the git server to the sftp server.

If one then wants to scale an sstate-cache server for many different
projects and users, one quickly wishes for an option for authorization
at artifact level. Ideally, the access rights to the source code would
be completely transferred to the associated sstate artifacts. For such
an authorization the ssate mirror server would require the SRC_URI
which was used to compile the sstate artifact. With this information,
it could ask the Git server whether or not a user has access to all
source code repositories to grant or deny access to a particular sstate
artifact. It should not be forgotten that the access rights to the Git
repositories can change.

>=20
> Recently we've been wondering about teaching the hashequiv server
> about
> "presence", which would then mean the build would only query things
> that stood a good chance of existing.
>=20
Yes, that sound very interesting. There are probably even more such
kind of meta data which could be provided by the hashserver to improve
the management of a shared sstate mirror.

Would it make sense to include e.g. the SRC_URI in the hashserv
database and extend the hashserver's API to also provide meta data e.g.
for the authorization of the sstate-mirror? Or is security and
authorization something which should be handled independently from hash
equivalence?

Another topic where additional meta data about the sstate-cache seams
to be beneficial is sstate-mirror retention. Knowing which artifact was
compiled for which tag or commit of the bitbake layer could help to
wipe out some artifacts which are not needed anymore.

> > =C2=A0=C2=A0=C2=A0 - A script which gets a list of sstate artifacts fro=
m bitbake
> > and then
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 does a upfront download works much bette=
r
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + The script runs only when the us=
er calls it or the SDK
> > gets boot-
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strapped
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + The script uses a reasonable amo=
unt of parallel
> > connections which
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 are re-used for more t=
hen one artifact download
>=20
> Explaining to users they need to do X before Y quickly gets tiring,
> both for people explaining it and the people doing it trying to
> remember. I'd really like to get to a point where the system "does
> the
> right thing" if we can.
>=20
> I don't believe the problems you describe are insurmountable. If you
> are using sftp, that is going to be a big chunk of the problem as the
> system assumes something faster is available. Yes, I've taken patches
> to make sftp work but it isn't recommended at all. I appreciate there
> would be reasons why you use sftp but if it is possible to get a list
> of "available sstate" via other means, it would improve things.
>=20
> > =C2=A0* Idea for a smart lock/unlock implementation
> > =C2=A0=C2=A0=C2=A0 - Form a user's perspective a locked vs. an unlocked=
 SDK does
> > not make
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 much sense. It makes more sense if the S=
DK would
> > automatically
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 download the sstate-cache if it is expec=
ted to be available.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Lets think about an implementation (whic=
h allows to override
> > the
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 logic) to switch from automatic to manua=
l mode:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SSTATE_MIRRORS_ENABLED ?=3D "${is_sstate=
_mirror_available()}"
>=20
> What determines this availability? I worry that is something very
> fragile and specific to your use case. It is also not an all or
> nothing
> binary thing.

It would probably be better to query a harserver if an artifact is
present.
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 In our case the sstate mirror is expecte=
d to provide all
> > artifacts
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for tagged commits and for some git bran=
ches of the layer
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 repositories.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The sstate is obviousely not usable for =
a "dirty" git layer
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 repository.
>=20
> That isn't correct and isn't going to work. If I make a single change
> locally, there is a good chance that 99.9% of the sstate could still
> be
> valid in some cases. Forcing the user through 10 hours of rebuild
> when
> potentially that much was available is a really really bad user
> experience.

Maybe there is a better idea.

>=20
> > =C2=A0That's what the is_sstate_mirror_available function
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 could check to automatically enable and =
disable lazy
> > downloads.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 - If is_sstate_mirror_available() returns false, it =
should
> > still be
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 possible to initiate a sstate-cache down=
load manually.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0* Terminology
> > =C2=A0=C2=A0=C2=A0 - Older Yocto Releases:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + eSDK means an installer which pr=
ovides a different
> > environment with
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 different tools
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + The eSDK was static, with a lock=
ed sstate cache
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + Was for one MACHINE, for one ima=
ge...
> > =C2=A0=C2=A0=C2=A0 - Newer Yocto Releases:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + The bitbake environment offers a=
ll features of the eSDK
> > installer. I
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 consider this as alrea=
dy implemented with meta-ide-support
> > and
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 build-sysroots.
>=20
> Remember bblock and bbunlock too. These provide a way to fix or
> unlock
> specific sections of the codebase. Usually a developer has a pretty
> good idea of which bits they want to allow to change. I don't think
> people have yet realised/explored the potential these offer.
>=20

Yes, I also started thinking about the possibilities we would get for
the SDK if there is a hash-server or an even more generic a meta data
server for the sstate-cache in the middle of the infrastructure
picture. it would probably solve some challenges which I could not find
a solution so far.


Thank you for your response.

Adrian


> Cheers,
>=20
> Richard


