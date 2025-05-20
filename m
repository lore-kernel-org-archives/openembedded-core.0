Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1807FC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 14:16:53 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.21992.1747750611080021449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 07:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LPkfI3/Q;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-551f00720deso2269264e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 07:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747750609; x=1748355409; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPQslYNjGVcFCxGR6VZmS+l+O0L8ma0+9NH3PmeyP1c=;
        b=LPkfI3/QpZKqh+aIi3Mb3+H83g1lC53m3i1sfDBrXLTWbo2VMNn8Warn6IqBHolDDu
         w8tJ7pF9lsmO6dSlD8Pu3NPoZ0mOXe78/tvJyIFnRPL9BWurdZudrRcRKBS8Jyk9UPKK
         I6ZH09KxokAatepo9IBXyMOEeNFDIZ+lpfkp1JZqjmlPr11QANc8/Ldwo5K2hu0eApSv
         9lgNInANI+Jj2O3gSAT+kHr31iEzoR4KdmnDOMClURctw1StEFSERQhHbiRjrg21phIG
         hdLrYxBxoQsbAScAXdPv6U34fT3IxV9758QjtirUc0iZag314bYV4H0WjvM3KLLhTDFc
         LAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747750609; x=1748355409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPQslYNjGVcFCxGR6VZmS+l+O0L8ma0+9NH3PmeyP1c=;
        b=rzhg7pG75RooWZPqiaMMkhVu0L04i4sd2NaK4953n5YxuPS4zKdZOJnoxhP89o/5Zn
         g7R1P4cd/elq4UJ3HWHjXCSTryp8Qd5qPflBqsY0qR0wImgycAtpdwrkKN6Co4Am4Yun
         Ju2YoGt+K+OtfL5TYuUfx9qoHpHMrZY4fIIo6Caav7Jv7xMmAqwf9NCAVsCCuksas+UO
         kCQTXTp4FbY5r/n8rVc8HkOScvxxdK2wQOk0FHDQ7OhoDs744Lwe++x84x/V5SSph3Et
         EZ/h+DD8VsRQLl1FReFIbV6uYRg/ISFZkcvm7MOsPGgLDz9LO7BxKR+XFE1mYo2RFk4X
         6VCg==
X-Forwarded-Encrypted: i=1; AJvYcCVy2Vwp6ZtnDPEc2xegmPWFC/D76hOZSbw1/+1wgbhnIAX3DusF92M3nAcNbbtk+hPbJI1ud3uw1P/RLjzAx2ZGuA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YygA6TjVH+5i7lMcIjmby67deuwBtpcUfwBfZmsa+0MtONYeqcd
	597KGwfo84BHnRpatSORPWPJNl3gX4k6vf0vDCsGVuH4nJUjygAi1O3AEp+/JRwOjhqNCbUHYAT
	OPqiHwCNOH7G3J8M/6eSjgTNEaY+0VkQ=
X-Gm-Gg: ASbGncvHJngjEgiJvKd7v4fS2D+aN/WUjv+sDA23bjk5P8w2VIVTysngqGetCGKP39Z
	/V/ZKJXs9eJSAqfQEm5cY/WaV5pQ4glH+/54PcgpilWcBTe/TszzrNJogixpBDxMVqudm5a4udl
	HZKnDDRBz7pj42hrT83z7EHNyc4MQ2eWf8upncyHxU52ef+DI=
X-Google-Smtp-Source: AGHT+IHOMjKaURDeC8lUyvIuDLHyUitwYiI0cC3ZE6veH9RyuVShMoae2dm4FuPHodvw4UPxLl6haenor5Q+QIfDrV0=
X-Received: by 2002:a05:651c:f0a:b0:30b:c569:4665 with SMTP id
 38308e7fff4ca-32809780b50mr53823231fa.29.1747750608560; Tue, 20 May 2025
 07:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250215165545.1929-1-alex.kiernan@gmail.com> <54484445b491b8be597cf35b47e7059c97c037d9.camel@linuxfoundation.org>
In-Reply-To: <54484445b491b8be597cf35b47e7059c97c037d9.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 20 May 2025 08:16:35 -0600
X-Gm-Features: AX0GCFu4dSYRiqI4hSMYGcZsPD-3XGQ57dBy4ddvQVyStkyCwQ_D9WCXVaQDgO0
Message-ID: <CAJdd5Gb3WW0j5d+d29MA8KJGginb0bJdkjwyK6QOB0fFQGfxuw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] packagegroup-base: Add option to set zeroconf provider
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: alex.kiernan@gmail.com, openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 14:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216918

On Tue, May 20, 2025 at 7:39=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2025-02-15 at 16:55 +0000, Alex Kiernan via lists.openembedded.or=
g wrote:
> > avahi, systemd-resolved and mDNSResponder (in meta-networking) can all
> > provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
> > which of these will provide service via packagegroup-base-zeroconf.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >  meta/recipes-core/packagegroups/packagegroup-base.bb | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/met=
a/recipes-core/packagegroups/packagegroup-base.bb
> > index cb9d1f07af51..ac450fbdc9a7 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> > @@ -312,11 +312,14 @@ RDEPENDS:packagegroup-base-nfs =3D "\
> >  RRECOMMENDS:packagegroup-base-nfs =3D "\
> >      kernel-module-nfs "
> >
> > +# Choose 'avahi-daemon', 'mdns' or 'systemd-resolved' as zeroconf-daem=
on
> > +ZEROCONF_DAEMON ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'system=
d-resolved', 'systemd-resolved', 'avahi-daemon', d)}"
> >  SUMMARY:packagegroup-base-zeroconf =3D "Zeroconf support"
> >  RDEPENDS:packagegroup-base-zeroconf =3D "\
> > -    avahi-daemon"
> > +    ${@ '' if d.getVar('ZEROCONF_DAEMON') =3D=3D 'systemd-resolved' el=
se d.getVar('ZEROCONF_DAEMON')} \
> > +    "
> >  RDEPENDS:packagegroup-base-zeroconf:append:libc-glibc =3D "\
> > -    libnss-mdns \
> > +    ${@ {'mdns':'mdns-libnss-mdns','avahi-daemon':'avahi-libnss-mdns',=
'systemd-resolved':''}[d.getVar('ZEROCONF_DAEMON')]} \
> >      "
> >
> >  SUMMARY:packagegroup-base-ipv6 =3D "IPv6 support"
>
> This has been sitting in master-next for too long. Various people on
> the patch review calls have promised to reply to it but we've all been
> struggling for the right reasoning and time to write that reply.
>
> Basically, several of us are not convinced this is correct. The
> challenge is that "zeroconf" means different things and the things
> being switched between here aren't equivalent. They don't have the same
> APIs and don't function in the same way, the similarities are very
> loose. That contradicts the way we usually make selections like this.
>
> That said, having stared at this just now, I can nearly convince myself
> this is the right thing to do :/.
>
> Can anyone suggest how this should be handled?

Ya, I struggled with this one also. In my mind, the problem here is
that "zeroconf" is a pretty precise set of functionality that allows
you do to automatic network setup. The problem as I see it is that
each method of implementing that does so with wildly different and
generally incompatible userspace APIs (systemd/avahi/mdns-sd). The
problem is thusly that if all you truly cared about was just zeroconf,
then it doesn't matter which of these you chose (although, by that
token, why do we need a choice at all if they all do the same thing?),
but as soon as you want to write applications that use mDNS, it
matters greatly which mDNS provider you use.

As such, my suggestion is just to leave this as is. If you truly only
care about zeroconf, then use the packagegroup and you'll get it. If
you care about the mDNS API, *don't* use this to provide it. Packages
that need a specific API should pull in the correct one automatically,
or you can add it as a distro dependency, etc. It just doesn't quite
seem right to me to backdoor it though this packagegroup.

>
> Cheers,
>
> Richard
>
>

