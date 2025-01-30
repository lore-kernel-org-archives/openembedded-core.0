Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0CAC0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 15:47:30 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.18405.1738252045059049065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 07:47:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iBfEQ9Oh;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21669fd5c7cso16918265ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 07:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738252044; x=1738856844; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=14/rKxgSrIcZU0wp7M+bdj1QWI/1puB3Mah2wI0Kc/Q=;
        b=iBfEQ9OhUCY0nkiddf/JyCDUpdC/3X7Pi1zwqRnJRaccTGs+LKRy8CUAtrB4THogF7
         8sviRRLBjZqHlsEqmtJaKb/+AC9PDcX4flYPmVoKA0EnKgbDAPKKNJFDpZCNwRsLrP/D
         Dkvf/T3GEikWT7fNMOHxVEhs4FV6ejVzKfJTsvikMcICMu9reo2o1beJ7t93g2zHIH3H
         ToNV7x6wDeVjgDlkmj4H1nCqLapjg9eA/mODXOEWa/OjLI3eucvpLCw6IHTnsnVFYVyS
         b9wdIWd1EvRgZqR/JjToOg9uvXnoXoYP/feTDOrSvjxuIDsZF5MPY3twdpvM72RNDOac
         lLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252044; x=1738856844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14/rKxgSrIcZU0wp7M+bdj1QWI/1puB3Mah2wI0Kc/Q=;
        b=RLQbxyNLjaltDigfit5m3aVvG2ObVwjp2cUYp06W/f9ZWxDry5mYOHJi6ixKJwbxPi
         KWDCsjO8zmIFjCZQ8sCViIeEw2KKgL+xPQ1weLybeBZYIEMFGZVXovPn4LrkFAI9F4bT
         9qrCKDuPMLEme1MpsShZzpQGnqHSMkqyi8pfiEfzQWO3Wns7G93RT1TcvkKIfP2Nkfus
         VbnQLCS7XRBwEwpvDM2JZcRMCxRpWa1Mp4c+JwTtCLCY/CAoWbYi5oVinx9b3YwWxkVj
         1rAegAUoh8tv2v5NnddrOW8rprNY0jVHxXtd9++77MYbrqWPaLmK4189kNuDid4sK6Mq
         SZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPFBehkjuU7sV2EKuJYkaOQEcAcPUpY7SRBBgcaieo1QHMuUjv5CZbLZLynDhZNgadRPaHLC0MhRAUKLXE5XEbig==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxb+mWSwkl+UFqr8WpIG6SQX8PGTXld+cMxCfv/0JTwnE5PaDDa
	2E2WIT9Fxb3zO8NrETzwZjRLBTt90kiA/ShyoW3Ukt9la1vv2LQfV5yFM5TGYk++UEzQNUVyo7m
	VtCad7OC8RSUbeeweWiQMJQU68EA=
X-Gm-Gg: ASbGncu/DzHt5N5Lt+Sb36whid7MyxFGY5IbLkRAvfqJhRHM5VqWrDBl1mufdLjFccf
	STVBZ88vNa1s06z6qXuAcyXWldMcfQ4T0mwjCxplETfR9QeJvZBBcUj8rdf7jf9j6X+BANI3pvQ
	==
X-Google-Smtp-Source: AGHT+IHwciFRbIlWcDxaOrbYThlEQyJjhZTYpf9PQ6E1TeQBmd6wWeKpehGeOp9Yg3EN/htGdlnYNlFjdHw8SbwKP5k=
X-Received: by 2002:a05:6a00:3a19:b0:724:f8d4:2b6e with SMTP id
 d2e1a72fcca58-72fd0bc82c5mr9188604b3a.4.1738252043409; Thu, 30 Jan 2025
 07:47:23 -0800 (PST)
MIME-Version: 1.0
References: <CAOSpxdbC-=6htz0g8i8NpcrmTsTpDXM0AkxtAO334KHEmKgu5Q@mail.gmail.com>
 <AS1PR10MB569795F9BEF718384BAECBADFDE92@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569795F9BEF718384BAECBADFDE92@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 30 Jan 2025 10:47:11 -0500
X-Gm-Features: AWEUYZkPwGQjL4SlOhRGJMWQVq_V1p8K-ZbonFI3fDfx0TN-NAOZeAsmyS0X3pk
Message-ID: <CADkTA4Oc-OOj+mN=ifGP4OxRCRVvyOLt4MNAhMnpZqbKowEVGQ@mail.gmail.com>
Subject: Re: [OE-core] Request for discussion: Kernel version for LTS releases
To: peter.marko@siemens.com
Cc: "steve@sakoman.com" <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000093e0c0062cee57e0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 15:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210453

--00000000000093e0c0062cee57e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 10:38=E2=80=AFAM Peter Marko via lists.openembedded=
.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> Hello Steve,
> Some thoughts from my side:
>
> Linux-yocto is a reference kernel for qemu machines.
> They are good for experiments but will not go to a real product.
>

There's plenty of data points that I've gotten over the past many
years that show it does in  fact go to product, and I've also done
several presentations on that point as well.

linux-yocto is NOT only a reference for the qemu machines,
full-stop. Even if it was only for the qemu-machines, that's only
the boot / runtime part of the kernel, we use it to drive the rest
of the compatibility as well as linux-libc-headers.

The main point of the reference versions are a point of momentum
and synchronization for yocto compatible layers. If we track a
version and do CVE reporting, it is a baseline for the compatibility
and what someone should expect from a similar vendor kernel,
even if they don't provide CVE metrics.

So are the linux-yocto qemu kernel CVEs interesting at all?
>

They are above.



> I bet that users of yocto have their own kernels.
>

And they all have their own distros, that could contain any
number of different packages and versions, but yet we report
CVE metrics for our reference distributions.


From this perspective of course upgrade is fine as no one is using it, but
> is it needed at all?

Isn't it better to keep the original one so users who don't upgrade have a
> good comparison base?
> Maybe it would be interesting to have two kernel version - original +
> newest so that components can be tested on both, but only if both would
> also be tested on autobuilder.
>

No kernel versions are going to be removed in the plan, it is
always additive. We'd simply be making a newer version available
in the branch.  If the old version is EOL, the amount of testing could
be scaled back, but would still be tested.


> We have split kernel and non-kernel CVEs in our reports since the
> beginning.
> For a different reason (each SOC needed its own vendor kernel at that
> time), but it made the metrics focused on what we needed.
> Kernel and other components are other worlds and probably no developer
> will be fixing both.
> I'd suggest doing the same in oe-core - split the kernel CVEs to a
> separate tables.
> This will not fix the numbers, but maybe help most users to see status of
> what they are using without overflowing from unused component with
> astronomical numbers.
>
> Third topic is regarding NVD CVE metric reporting.
> Currently it's bogus - not showing majority of CVEs and showing some whic=
h
> are already backported but never updated in the DB.
> I remember that Marta was working on annotations from cvelistV5, but
> somehow that activity died.
> Maybe there should be a restart of this to make the reports
> reliable/trustworthy?
> I think that kernel maintainers are backporting all relevant CVE fixes to
> all affected LTS branches.
> That should mean that with every update, we should be getting back close
> to 0 CVEs and just need a reliable data.
>
> Maybe a final comment...
> When we open this topic for kernel, there are other components where ther=
e
> is lot of CVEs which realistically cannot be backported.
> Those are usually handled via
> https://git.yoctoproject.org/meta-lts-mixins/, shouldn't it be the same
> for kernel?
>

We ruled out mixins for the kernel based on the tight coupling to the rest
of
the system, and that we wouldn't want to use it on the AB for the full
testing.

Cheers,

Bruce



>
> TLDR: Since I'm not using linux-yocto, I have just suggestions to
> reporting, no strong opinion on its upgrade.
>
> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Steve Sakoman via
> > lists.openembedded.org
> > Sent: Thursday, January 30, 2025 15:31
> > To: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: [OE-core] Request for discussion: Kernel version for LTS
> releases
> >
> > As you may be aware, the support period for Linux kernel LTS releases
> > has changed to two years. This presents a challenge for our Yocto LTS
> > releases, which have 4 year support periods.
> >
> > In light of this, Richard sent an email to the Yocto architecture list
> > in January of 2024 outlining the project's plans for kernel support in
> > future LTS releases (copied below)
> >
> > TLDR: Around the midpoint of the Yocto Scarthgap LTS lifecycle we will
> > backport the then current LTS kernel version and make it the default
> > kernel version. The linux-libc-headers version would remain at the
> > released version.
> >
> > At a recent Yocto Project Technical Team Meeting there was some
> > discussion around the growing kernel CVE counts in the stable
> > branches:
> >
> > kirkstone: 552
> > scarthgap: 225
> >
> > For comparison the master branch CVE count for the kernel is 18
> >
> > The suggestion was made that we do this kernel version update sooner
> > rather than later, and also include the Kirkstone LTS branch in order
> > to deal with its large number of CVEs.  The original plan was to only
> > do this version bump for Scarthgap, so this would be a change to the
> > plan of record.
> >
> > Please consider the above and respond to this email with any thoughts
> > or concerns you may have about implementing this version bump in both
> > LTS branches in the coming weeks.
> >
> > Thanks!
> >
> > Steve
> >
> >
> > Full text of Richard's email:
> >
> > The project is aware that the kernel versions that ship in our next LTS
> > in April will likely not have support for the full lifetime of our LTS
> > (four years). We've been asked a few questions about this so we wanted
> > to write down what our plan is.
> >
> > Our intent is to support the versions we ship with for as long as is
> > practical. If they become end of life around the mid point of the LTS
> > as expected, our plan is to backport a current LTS kernel at that time
> > into the release and make it the default, leaving the older recipes
> > there for anyone who still needs to use them. It would be based on the
> > kernel in one of our future releases, as appropriate.
> >
> > The linux-libc-headers version would remain at the released version.
> > This is used to control the features in the toolchain/userspace and
> > there is no need to upgrade this to work with a newer kernel version.
> > Upgrading it would potentially change the toolchain and userspace
> > functionality and this is not desirable in the LTS. To be clear, this
> > does mean bleeding edge features in the newer kernel may not be
> > available but that is desirable in the context of the purpose of the
> > LTS.
> >
> > The only reason the headers version would change would be to address a
> > security issue in the toolchain or kernel/userspace interface.
> >
> > Since we don't know what the upstream kernel will do, or when exactly,
> > it is hard to make a definitive plan beyond this.
> >
> > We appreciate this isn't our usual policy of "no upgrades", however if
> > everyone knows this is the plan from the start, we believe that is
> > different and everyone can plan accordingly, hence wanting to make this
> > clear now.
> >
> > Since the project is planning to execute the full QA process against
> > this new version, it is putting a plan in place to switch from the
> > start and it plans not to test against any other version beyond that
> > point, it makes most sense to directly integrate the changes rather
> > than the mix in layer approach which is there for unplanned changes.
> >
> > To be clear, we may also update this plan if/as things develop in the
> > other dependent ecosystems such as kernel as we can't know what will
> > happen in these on the timescales involved.
> >
> > Cheers,
> >
> > Richard
> > (on behalf of the Yocto Project TSC, LTS and kernel maintainers)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210452):
> https://lists.openembedded.org/g/openembedded-core/message/210452
> Mute This Topic: https://lists.openembedded.org/mt/110897884/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000093e0c0062cee57e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 30, 2025 at 10:38=
=E2=80=AFAM Peter Marko via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists=
.openembedded.org">siemens.com@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Steve,<br>
Some thoughts from my side:<br>
<br>
Linux-yocto is a reference kernel for qemu machines.<br>
They are good for experiments but will not go to a real product.<br></block=
quote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">There&#39;s plenty of data points=C2=A0that I&#39;ve gotten over the =
past many</div><div class=3D"gmail_default" style=3D"font-size:small">years=
 that show it does in=C2=A0 fact go to product, and I&#39;ve also done=C2=
=A0</div><div class=3D"gmail_default" style=3D"font-size:small">several pre=
sentations on that point as well.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">linux-yocto is NOT only a reference for the qemu machines,</div>=
<div class=3D"gmail_default" style=3D"font-size:small">full-stop. Even if i=
t was only for the qemu-machines, that&#39;s only</div><div class=3D"gmail_=
default" style=3D"font-size:small">the boot / runtime part of the kernel, w=
e use it to drive the rest</div><div class=3D"gmail_default" style=3D"font-=
size:small">of the compatibility=C2=A0as well as linux-libc-headers.=C2=A0<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">The main point of the ref=
erence versions are a point of momentum=C2=A0</div></div><div class=3D"gmai=
l_default" style=3D"font-size:small">and synchronization for yocto compatib=
le layers. If we track a</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">version and do CVE reporting, it is a baseline for the compatibil=
ity</div><div class=3D"gmail_default" style=3D"font-size:small">and what so=
meone should expect from a similar vendor kernel,</div><div class=3D"gmail_=
default" style=3D"font-size:small">even if they don&#39;t provide CVE metri=
cs.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
So are the linux-yocto qemu kernel CVEs interesting at all?<br></blockquote=
><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small"=
>They are above.</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
I bet that users of yocto have their own kernels.<br>
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">And they all have their own distros, that could contain any</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">number of differe=
nt packages and versions, but yet we report</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">CVE metrics for our reference distributions.</=
div></div><div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From this =
perspective of course upgrade is fine as no one is using it, but is it need=
ed at all?</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Isn&#39;t it better to keep the original one so users who don&#39;t upgrade=
 have a good comparison base?<br>
Maybe it would be interesting to have two kernel version - original + newes=
t so that components can be tested on both, but only if both would also be =
tested on autobuilder.<br></blockquote><div><br></div><div><div class=3D"gm=
ail_default" style=3D"font-size:small">No kernel versions are going to be r=
emoved in the plan, it is</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">always additive. We&#39;d simply be making a newer version avail=
able</div><div class=3D"gmail_default" style=3D"font-size:small">in the bra=
nch.=C2=A0 If the old version is EOL, the amount of testing could</div></di=
v><div class=3D"gmail_default" style=3D"font-size:small">be scaled back, bu=
t would still be tested.</div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
We have split kernel and non-kernel CVEs in our reports since the beginning=
.<br>
For a different reason (each SOC needed its own vendor kernel at that time)=
, but it made the metrics focused on what we needed.<br>
Kernel and other components are other worlds and probably no developer will=
 be fixing both.<br>
I&#39;d suggest doing the same in oe-core - split the kernel CVEs to a sepa=
rate tables.<br>
This will not fix the numbers, but maybe help most users to see status of w=
hat they are using without overflowing from unused component with astronomi=
cal numbers.<br>
<br>
Third topic is regarding NVD CVE metric reporting.<br>
Currently it&#39;s bogus - not showing majority of CVEs and showing some wh=
ich are already backported but never updated in the DB.<br>
I remember that Marta was working on annotations from cvelistV5, but someho=
w that activity died.<br>
Maybe there should be a restart of this to make the reports reliable/trustw=
orthy?<br>
I think that kernel maintainers are backporting all relevant CVE fixes to a=
ll affected LTS branches.<br>
That should mean that with every update, we should be getting back close to=
 0 CVEs and just need a reliable data.<br>
<br>
Maybe a final comment...<br>
When we open this topic for kernel, there are other components where there =
is lot of CVEs which realistically cannot be backported.<br>
Those are usually handled via <a href=3D"https://git.yoctoproject.org/meta-=
lts-mixins/" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.=
org/meta-lts-mixins/</a>, shouldn&#39;t it be the same for kernel?<br></blo=
ckquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">We ruled out mixins for the kernel based on the tight coupling to t=
he rest of</div><div class=3D"gmail_default" style=3D"font-size:small">the =
system, and that we wouldn&#39;t want to use it on the AB for the full test=
ing.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Cheers,</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
TLDR: Since I&#39;m not using linux-yocto, I have just suggestions to repor=
ting, no strong opinion on its upgrade.<br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Steve Sakoman via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Thursday, January 30, 2025 15:31<br>
&gt; To: Patches and discussions about the oe-core layer &lt;openembedded-<=
br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt;<br>
&gt; Subject: [OE-core] Request for discussion: Kernel version for LTS rele=
ases<br>
&gt; <br>
&gt; As you may be aware, the support period for Linux kernel LTS releases<=
br>
&gt; has changed to two years. This presents a challenge for our Yocto LTS<=
br>
&gt; releases, which have 4 year support periods.<br>
&gt; <br>
&gt; In light of this, Richard sent an email to the Yocto architecture list=
<br>
&gt; in January of 2024 outlining the project&#39;s plans for kernel suppor=
t in<br>
&gt; future LTS releases (copied below)<br>
&gt; <br>
&gt; TLDR: Around the midpoint of the Yocto Scarthgap LTS lifecycle we will=
<br>
&gt; backport the then current LTS kernel version and make it the default<b=
r>
&gt; kernel version. The linux-libc-headers version would remain at the<br>
&gt; released version.<br>
&gt; <br>
&gt; At a recent Yocto Project Technical Team Meeting there was some<br>
&gt; discussion around the growing kernel CVE counts in the stable<br>
&gt; branches:<br>
&gt; <br>
&gt; kirkstone: 552<br>
&gt; scarthgap: 225<br>
&gt; <br>
&gt; For comparison the master branch CVE count for the kernel is 18<br>
&gt; <br>
&gt; The suggestion was made that we do this kernel version update sooner<b=
r>
&gt; rather than later, and also include the Kirkstone LTS branch in order<=
br>
&gt; to deal with its large number of CVEs.=C2=A0 The original plan was to =
only<br>
&gt; do this version bump for Scarthgap, so this would be a change to the<b=
r>
&gt; plan of record.<br>
&gt; <br>
&gt; Please consider the above and respond to this email with any thoughts<=
br>
&gt; or concerns you may have about implementing this version bump in both<=
br>
&gt; LTS branches in the coming weeks.<br>
&gt; <br>
&gt; Thanks!<br>
&gt; <br>
&gt; Steve<br>
&gt; <br>
&gt; <br>
&gt; Full text of Richard&#39;s email:<br>
&gt; <br>
&gt; The project is aware that the kernel versions that ship in our next LT=
S<br>
&gt; in April will likely not have support for the full lifetime of our LTS=
<br>
&gt; (four years). We&#39;ve been asked a few questions about this so we wa=
nted<br>
&gt; to write down what our plan is.<br>
&gt; <br>
&gt; Our intent is to support the versions we ship with for as long as is<b=
r>
&gt; practical. If they become end of life around the mid point of the LTS<=
br>
&gt; as expected, our plan is to backport a current LTS kernel at that time=
<br>
&gt; into the release and make it the default, leaving the older recipes<br=
>
&gt; there for anyone who still needs to use them. It would be based on the=
<br>
&gt; kernel in one of our future releases, as appropriate.<br>
&gt; <br>
&gt; The linux-libc-headers version would remain at the released version.<b=
r>
&gt; This is used to control the features in the toolchain/userspace and<br=
>
&gt; there is no need to upgrade this to work with a newer kernel version.<=
br>
&gt; Upgrading it would potentially change the toolchain and userspace<br>
&gt; functionality and this is not desirable in the LTS. To be clear, this<=
br>
&gt; does mean bleeding edge features in the newer kernel may not be<br>
&gt; available but that is desirable in the context of the purpose of the<b=
r>
&gt; LTS.<br>
&gt; <br>
&gt; The only reason the headers version would change would be to address a=
<br>
&gt; security issue in the toolchain or kernel/userspace interface.<br>
&gt; <br>
&gt; Since we don&#39;t know what the upstream kernel will do, or when exac=
tly,<br>
&gt; it is hard to make a definitive plan beyond this.<br>
&gt; <br>
&gt; We appreciate this isn&#39;t our usual policy of &quot;no upgrades&quo=
t;, however if<br>
&gt; everyone knows this is the plan from the start, we believe that is<br>
&gt; different and everyone can plan accordingly, hence wanting to make thi=
s<br>
&gt; clear now.<br>
&gt; <br>
&gt; Since the project is planning to execute the full QA process against<b=
r>
&gt; this new version, it is putting a plan in place to switch from the<br>
&gt; start and it plans not to test against any other version beyond that<b=
r>
&gt; point, it makes most sense to directly integrate the changes rather<br=
>
&gt; than the mix in layer approach which is there for unplanned changes.<b=
r>
&gt; <br>
&gt; To be clear, we may also update this plan if/as things develop in the<=
br>
&gt; other dependent ecosystems such as kernel as we can&#39;t know what wi=
ll<br>
&gt; happen in these on the timescales involved.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; (on behalf of the Yocto Project TSC, LTS and kernel maintainers)<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210452): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210452" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/210452</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110897884/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110897884/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000093e0c0062cee57e0--

