Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA48C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 16:44:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.52852.1744044284775140659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 09:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OV3XvoNb;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so42782105e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044283; x=1744649083; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f3cLvwgSZQNJFnEl2Dp3WjJqOY5NkJAruFPwGOObHdI=;
        b=OV3XvoNbbIAM44plydXbJfspXqjtIC0QmcvW9ARHmZJiycjvyaVM0XF4emIUlo1s2y
         kvwFjjoVMIkN5TIzxk/mnusBPXVVpocMCc0IstnMJMF5ryjqcU+K/soqlJe7YsnDFHpc
         FiGwGmi3yYvBFBgq3I2WANsjlQPQ9DESl1VSz0znyQiF6Zqwg9vruQ7PVEvk8gdrL/x9
         Yw0ohqUcrdSV1O7IU5XIBelefWhx1ifARcgxKCP+ZyilQNGsxVy1U5Afhb0cz0b0mFyz
         VzKnUFpmp95zAkTbE2T6Y20vk05Ez/KrXl/A4fBUR49c1z47tBQ4owu/5Fcp8njjbCyb
         MUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044283; x=1744649083;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f3cLvwgSZQNJFnEl2Dp3WjJqOY5NkJAruFPwGOObHdI=;
        b=KLfaR5GECzisgq7tGg5GC11chbb86C18dx6qNFVjIj6Ei8iLZ5rNFzFIottcB8pdq7
         jq6ZMBsRciqhXpEyfutByMABM5W4Zgw3sqtpIIOjogSct+6k1fJlq8GvgVNQlAUa9T8i
         Ot1Vhx9JkMiuFwMnUdpKWQAPvZJA+DLVU6YuhFT3dw/HKc/9EWa6RdMzDMAA1SobZxfu
         UmU3JTWXhJ8GB3PCEq4l0mcYdp/GiUW2uw+Gm96bdTLb+vjkAsRlqk+grhGGv/7MjOun
         HGMozjKzBo20EA+JGRFKvh85mYACD01Kwuo1ZJ2MkZvbQuPvTFiY8KZbr7URY41YeIYL
         kM7w==
X-Forwarded-Encrypted: i=1; AJvYcCUHBk3jOvEL9i4gidVrH9yFPdI5awfQxKj8VPEvIlV8QbozJvk+qieWTWCtrZiX5SBAw6c6Og03MozNbODQ1Ty7DA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVOaNM1RfUXByoic9eWak3w+j2xWd2mgQdrVOLubx1p+/YOLR8
	80cZd7nRco439FeKmF8jJpdcsWSIK6rbMpXZD13hpVKnrdwoqPlZ
X-Gm-Gg: ASbGncsAOmmgYB5XhBKyW1krM6G4aCFJrkyOa/LD7zOktatHsA4pK51zTkO0mG/I24M
	NORwpNW0wBPOoExQzxI6xg41v1IfWjc1ewjXsOzyVLHjk+bG5ZLSlBRWiBVUN2r+uQrunhEzJJF
	lGVjK0keBCz7tDUR7PNL0pjjCi5rPQk6tSz+aELObMv4gWMHIc4T1p930a+wDCqajEKUjtF/5ZA
	1df3p4r8ypI4wrsN+G84yFy0NANsAGaFuTK6jOByrzZoj9aCE8F0XyX3yCxS/nal8mQMpSHsIu0
	z+MmJUSFaq6F+cdwVE3XBPqEeXWa3rXyWVXM0GCj5qln5jArLrBwYxlz1fcLY724TbqQASBecep
	moC7/KEauG0f3PyEyaw==
X-Google-Smtp-Source: AGHT+IF0MMDDkSP7LQiZQLH3tWS9DUa6tSnH31FI5FAJS8heEPq0wXdSEPmO5x1LzY4NoGVOcee91g==
X-Received: by 2002:a05:600c:1d91:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43ecfa18d8fmr160746055e9.30.1744044282838;
        Mon, 07 Apr 2025 09:44:42 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bf193sm134099425e9.24.2025.04.07.09.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:44:42 -0700 (PDT)
Message-ID: <38637d0589962b50af4bc0f472d7c8e3a5d68e22.camel@gmail.com>
Subject: Re: [OE-core] [PATCH OE-Core 0/5] connman: Update for all
 PACKAGECONFIG options, clean up legacy
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <jsmoeller@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross Burton
 <ross.burton@arm.com>, 	richard.purdie@linuxfoundation.org, Scott Murray
 <scott.murray@konsulko.com>
Date: Mon, 07 Apr 2025 18:44:41 +0200
In-Reply-To: <352101e120074ee9e08455be1c162f2bc36c4ce7.camel@linuxfoundation.org>
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
		 <633bbc8576502d873a8e2a3938a6ae64bc508eb2.camel@linuxfoundation.org>
		 <CAO5Uq5TWH00ALXtatz8y8Vf9fy4DLpC949ut_UeZhSx3BJKeSA@mail.gmail.com>
		 <cdcd72e3c0d2490030eb1b00bef5a11b49ebbfcb.camel@linuxfoundation.org>
		 <e5fe985a-9022-00d6-cd92-dd64061fa6d6@konsulko.com>
	 <352101e120074ee9e08455be1c162f2bc36c4ce7.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 16:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214463

On Thu, 2025-04-03 at 17:52 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Thu, 2025-04-03 at 12:46 -0400, Scott Murray wrote:
> > On Thu, 3 Apr 2025, Richard Purdie wrote:
> >=20
> > > On Thu, 2025-04-03 at 07:42 +0100, Alex Kiernan wrote:
> > > > On Wed, Apr 2, 2025 at 8:33=E2=80=AFPM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >=20
> > > > > On Wed, 2025-04-02 at 16:02 +0000, Alex Kiernan via
> > > > > lists.openembedded.org wrote:
> > > > > > connman has a legacy style, this patch set adds in all the
> > > > > > PACKAGECONFIG
> > > > > > options which the upstream pacakge supports, removes
> > > > > > patches which are no
> > > > > > longer required, explicitly supports operation alongside
> > > > > > systemd-resolved and
> > > > > > reworks the packaging so that PACKAGECONFIG and explicit
> > > > > > package selection for
> > > > > > every VPN is no longer required.
> > > > > >=20
> > > > > > Everything up to the final patch should be backward
> > > > > > compatible cleanup of the
> > > > > > existing recipe, with only the final patch reworking the
> > > > > > packaging.
> > > > > >=20
> > > > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > > > > ---
> > > > > > Alex Kiernan (5):
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Merge .inc into .bb
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Delete patches for gold=
 and MIPS binutils
> > > > > > fix
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Move ppp from DEPENDS t=
o PACKAGECONFIG
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Add all build options a=
s PACKAGECONFIG
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Rework to avoid splitti=
ng into many single
> > > > > > binary packages
> > > > > >=20
> > > > > > =C2=A0meta/recipes-connectivity/connman/connman.inc=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 221 -
> > > > > > --------------------
> > > > > > =C2=A0...vice-stop-systemd-resolved-when-we-use-co.patch |=C2=
=A0 26 -
> > > > > > --
> > > > > > =C2=A0...ange-visibility-to-default-for-debug-symb.patch |=C2=
=A0 31 -
> > > > > > --
> > > > > > =C2=A0.../connman/connman/no-version-scripts.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 47 -
> > > > > > ----
> > > > > > =C2=A0meta/recipes-connectivity/connman/connman_1.44.bb=C2=A0 |=
 154
> > > > > > +++++++++++++-
> > > > > > =C2=A05 files changed, 147 insertions(+), 332 deletions(-)
> > > > >=20
> > > > > This failed in testing on the first try. I've added:
> > > > >=20
> > > > > diff --git a/meta/recipes-core/images/build-appliance-
> > > > > image_15.0.0.bb b/meta/recipes-core/images/build-appliance-
> > > > > image_15.0.0.bb
> > > > > index 03f02d14ae8..c5ddea79005 100644
> > > > > --- a/meta/recipes-core/images/build-appliance-
> > > > > image_15.0.0.bb
> > > > > +++ b/meta/recipes-core/images/build-appliance-
> > > > > image_15.0.0.bb
> > > > > @@ -6,7 +6,7 @@ LICENSE =3D "MIT"
> > > > > =C2=A0LIC_FILES_CHKSUM =3D
> > > > > "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384
> > > > > 361b4de20420"
> > > > >=20
> > > > > =C2=A0IMAGE_INSTALL =3D "packagegroup-core-boot packagegroup-core=
-
> > > > > ssh-openssh packagegroup-self-hosted \
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-dev kernel-devsrc connman connman-
> > > > > plugin-ethernet dhcpcd \
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-dev kernel-devsrc connman dhcpcd \
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tzdata python3-pip perl-misc"
> > > > >=20
> > > > > =C2=A0IMAGE_FEATURES +=3D "x11-base package-management splash"
> > > >=20
> > > > Is keeping all those RPROVIDES (plus doubtless more at this
> > > > point)
> > > > actually useful? I can see it in the traditional distribution
> > > > world,
> > > > but for OE-Core it feels mostly redundant to me.
> > >=20
> > > Short term, it will help fix people's builds and give some level
> > > of
> > > runtime compatibility. Long term, it would be deadweight we
> > > carry. I'm
> > > therefore torn.
> > >=20
> > > I did note that meta-agl ran into a similar issue:
> > >=20
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/12=
50
> > >=20
> > > With the above tweak and the tweaked nftables, the rest of the
> > > build
> > > was ok through.
> >=20
> > If you're leaning towards taking it, we can adapt in AGL, though I
> > can't
> > guarantee there won't be a brief instance of AB breakage before I
> > push
> > a change.=C2=A0 Overall, I'm a bit ambivalent about removing the split
> > out
> > packages.=C2=A0 I understand the desire for simplifying it, but I also
> > see
> > some benefits to still mirroring what most other distributions do
> > with
> > networkmanager packaging since there still seems to be some
> > interest in
> > attempting to do binary packagefeeds...
>=20
> To be honest, I'm torn, I could be persuaded either way.=C2=A0
>=20
> I copied more people to collect viewpoionts as well as make them
> aware
> of the potential breakage.
>=20
> Cheers,
>=20
> Richard

I don't use conman, so my opinion is not really relevant here.

But I think that PACKAGECONFIGS are of course the big advantage of
Yocto compared to binary distributions. But one should also not forget
why binary distributions are very successful in many areas: You can
address many different use cases with one distribution without having
to recompile different packages just to put together slightly different
firmware variants. With systemd or NetworkManager, for example, we have
the option of using PACAKGECONFGS as well as splitting it up into small
packages. This is very useful, at least for us, which is why I think
removing package splitting would also be a disadvantage for connman.

Regards,
Adrian

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214329):
> https://lists.openembedded.org/g/openembedded-core/message/214329
> Mute This Topic: https://lists.openembedded.org/mt/112049312/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


