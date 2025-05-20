Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60870C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 15:12:43 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.23460.1747753953590883808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 08:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FGetgy6Z;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3280ce0795bso40781811fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747753952; x=1748358752; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hVqCzJrpfk62qTr++ZqXwrTh0GaQX41gBoLkOfsXzo=;
        b=FGetgy6ZE4AXEEv9uaNqS7I5fvK/NP2ViO0hCQkI4+9V9AjeitxeDuMgfpl6Q9PRYL
         UV9UcUGBDdwmg05TxJzBe6eL6EMqDs5IdAT5D3Ls+ubxSXWNy4MrXu7bW/18wUFg/QSz
         kkYZwXmfiQApR6sZcgE0sTPEMZdW/7LyI1FB5l6W7L4V9XYoxVfvc7FMojRaT9Q4U7JS
         ezx121o+JQcJUms3bSwn5FjRJhivDk3NckfZfD/ly6XYEnF97HZtk1yW3IUtZEL9ZLHe
         jzs/rUAq+bO6JEyVtSk8P2+hUpNHss9oXmy/bCUN+niRNGr/BGAHP+i0RcH+wruf/Xoc
         UM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747753952; x=1748358752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hVqCzJrpfk62qTr++ZqXwrTh0GaQX41gBoLkOfsXzo=;
        b=lC9AvCoXvm6qVFAuGolrgiKBFE7VO0msK/rT+crehT8b6l+9/tZs8H1eWAwXrakj7Q
         85uPQFf8igrSO3v/1OHgFlCZaYsPXhgykGtBKP2+70eO0SlGUkNftgY7UAd8mH6d2rcc
         LCsWVis2ylQcoRt0LBQpzqdekKTTKzelbhhyrHvP1vUEjSzOH5gC2i9gqSE621u+yI7J
         uFC9AnAjugGzkGGNS2gTYlfDcAn4dEHqWXc2Jfawh02bpxPUuvwWf50JQpKgpYsYB9Bc
         wOPV0FYFquW5DaNJr9aTtFkFAhWOh5btbcgOImpNFqtte4qNoW2O29hGcUDTds4OwjWX
         725w==
X-Forwarded-Encrypted: i=1; AJvYcCV75yNL8RSwJ01tvdwz19c1Uq2iJ3aUpZWFhTTVz+E6T1f8iVdW8jLW+P0DipRb3vpXV0cB4yttveN/6hxlo4xCMQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywd70LZZrwoAnWW8YWJeGWm959DMb17WsqM0IiYj/m4YSJ/kYKW
	NsunDkcA6rM1L1U/tOxYZlO1PpICJVbeEh7WuNnQCZxdcXJm///ih4UKk3cC+5QFKIL2Kmc1FUS
	YFR8X9WqeNflYGF1CTnYBn1RD+Z/a2Ds=
X-Gm-Gg: ASbGnct09v+MrmOx0PKFzf9HAu6N701qazmdzGNKQVZ6MHrRMB5majoyP5c4UKus6eh
	SMorKi8jxXOPtvQ7ANGIdMJPUUmfKOTbq3WoGXXltsfLNR8Dm3UWzqbCTuwB5qarmq+GrUBMR6P
	ZwBopK2e1d3Wqkxv8UKZhxZpdIspVe1Hs=
X-Google-Smtp-Source: AGHT+IEzF6RbZD3mNVtTtLasGONTXngi3qlqvzjWprDVt9HT9OgCH8yI9NWT7bm3wDkZUgt9A+vwiwhFkYeDZq0Ltxs=
X-Received: by 2002:a05:651c:4183:b0:30b:c6fe:4529 with SMTP id
 38308e7fff4ca-328076e7056mr47247901fa.8.1747753951402; Tue, 20 May 2025
 08:12:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250215165545.1929-1-alex.kiernan@gmail.com> <54484445b491b8be597cf35b47e7059c97c037d9.camel@linuxfoundation.org>
 <CAJdd5Gb3WW0j5d+d29MA8KJGginb0bJdkjwyK6QOB0fFQGfxuw@mail.gmail.com>
In-Reply-To: <CAJdd5Gb3WW0j5d+d29MA8KJGginb0bJdkjwyK6QOB0fFQGfxuw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 20 May 2025 16:12:20 +0100
X-Gm-Features: AX0GCFtCj0h8barbN5ROE2-d_t0LtJzF2ApZxK5RfahRvuNLf9kkqk9ofoQjlco
Message-ID: <CAO5Uq5REMvpD8Moh3=VUMA3ymK2Smf0_984ALeiWrFzaE7gYYA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] packagegroup-base: Add option to set zeroconf provider
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 15:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216922

On Tue, May 20, 2025 at 3:16=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> On Tue, May 20, 2025 at 7:39=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Sat, 2025-02-15 at 16:55 +0000, Alex Kiernan via lists.openembedded.=
org wrote:
> > > avahi, systemd-resolved and mDNSResponder (in meta-networking) can al=
l
> > > provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
> > > which of these will provide service via packagegroup-base-zeroconf.
> > >
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >  meta/recipes-core/packagegroups/packagegroup-base.bb | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/m=
eta/recipes-core/packagegroups/packagegroup-base.bb
> > > index cb9d1f07af51..ac450fbdc9a7 100644
> > > --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > > +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > > @@ -312,11 +312,14 @@ RDEPENDS:packagegroup-base-nfs =3D "\
> > >  RRECOMMENDS:packagegroup-base-nfs =3D "\
> > >      kernel-module-nfs "
> > >
> > > +# Choose 'avahi-daemon', 'mdns' or 'systemd-resolved' as zeroconf-da=
emon
> > > +ZEROCONF_DAEMON ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'syst=
emd-resolved', 'systemd-resolved', 'avahi-daemon', d)}"
> > >  SUMMARY:packagegroup-base-zeroconf =3D "Zeroconf support"
> > >  RDEPENDS:packagegroup-base-zeroconf =3D "\
> > > -    avahi-daemon"
> > > +    ${@ '' if d.getVar('ZEROCONF_DAEMON') =3D=3D 'systemd-resolved' =
else d.getVar('ZEROCONF_DAEMON')} \
> > > +    "
> > >  RDEPENDS:packagegroup-base-zeroconf:append:libc-glibc =3D "\
> > > -    libnss-mdns \
> > > +    ${@ {'mdns':'mdns-libnss-mdns','avahi-daemon':'avahi-libnss-mdns=
','systemd-resolved':''}[d.getVar('ZEROCONF_DAEMON')]} \
> > >      "
> > >
> > >  SUMMARY:packagegroup-base-ipv6 =3D "IPv6 support"
> >
> > This has been sitting in master-next for too long. Various people on
> > the patch review calls have promised to reply to it but we've all been
> > struggling for the right reasoning and time to write that reply.
> >
> > Basically, several of us are not convinced this is correct. The
> > challenge is that "zeroconf" means different things and the things
> > being switched between here aren't equivalent. They don't have the same
> > APIs and don't function in the same way, the similarities are very
> > loose. That contradicts the way we usually make selections like this.
> >
> > That said, having stared at this just now, I can nearly convince myself
> > this is the right thing to do :/.
> >
> > Can anyone suggest how this should be handled?
>
> Ya, I struggled with this one also. In my mind, the problem here is
> that "zeroconf" is a pretty precise set of functionality that allows
> you do to automatic network setup. The problem as I see it is that
> each method of implementing that does so with wildly different and
> generally incompatible userspace APIs (systemd/avahi/mdns-sd). The
> problem is thusly that if all you truly cared about was just zeroconf,
> then it doesn't matter which of these you chose (although, by that
> token, why do we need a choice at all if they all do the same thing?),
> but as soon as you want to write applications that use mDNS, it
> matters greatly which mDNS provider you use.
>
> As such, my suggestion is just to leave this as is. If you truly only
> care about zeroconf, then use the packagegroup and you'll get it. If
> you care about the mDNS API, *don't* use this to provide it. Packages
> that need a specific API should pull in the correct one automatically,
> or you can add it as a distro dependency, etc. It just doesn't quite
> seem right to me to backdoor it though this packagegroup.
>

If I explain how I got here, but then say I don't actually disagree
with this point of view!

I have a platform that needs to use mDNSResponder (i.e. needs to get
through the horror that is bonjour conformance testing[1]), but we
have zeroconf in the default list of DISTRO_FEATURES, so
packagegroup-base gets you packagegroup-base-zeroconf, which gets you
avahi.

But I guess I've made the assumption that zeroconf is about mdns and
how that happens, not how IPv4 link local addressing is done, which is
another of the zeroconf hats.

Maybe this is really a documentation problem and the zeroconf feature
is just IPv4LL addressing and not the entire networking soup of
https://en.wikipedia.org/wiki/Zero-configuration_networking?

[1] Yes, I know Avahi can pass, but getting a BCT pass is beyond painful...

--=20
Alex Kiernan

