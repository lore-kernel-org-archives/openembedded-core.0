Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D6EC7EE31
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 14:05:23 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.8922.1750946721775726215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 07:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ArFEl/6Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso4665315e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 07:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750946720; x=1751551520; darn=lists.openembedded.org;
        h=user-agent:mime-version:date:content-transfer-encoding:references
         :in-reply-to:cc:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e542voww+KiFZBRoWwEshtoq9sbjv8Bgu4K08tkseA4=;
        b=ArFEl/6Z3d5nY39/cyDrOApuO0vkDca2hHzG/zQ9QkRgliRRYFTllW/TkIjmQglRvG
         qBE6QhnO9BAnJeWaRRbceOtG7+6+PeipHRfL7bKbBuu9wtU+6NjtfSLDNROBYx8c6scp
         FPZjLRXNYtg8H5Bf+DwRPSRoQPPqwYmE/4/o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946720; x=1751551520;
        h=user-agent:mime-version:date:content-transfer-encoding:references
         :in-reply-to:cc:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e542voww+KiFZBRoWwEshtoq9sbjv8Bgu4K08tkseA4=;
        b=oPb4SF1JsLXHV3kX/lmD9J5CDZECveFYco6ugQfgJCcwfuB041e0wORJMIoqACNbnY
         PD/cyW4WoE5p6ZqsAdKA79Qy3QvLQ+lozfyfdSP+cxDyuYeqxDM2YKDiesuD813QJMYA
         ONGAKvZJZUBDgiJDLunKlZrS8WgRDSOBsgrSSn4KJUSIaZNeF3yoGfzrtM/a/PNoHdeY
         B5x2axB3rmU/WgPwojOYfBxZQomFIA8ZyNTd6s+I7XoVFriHIc1Ram1ahBv/06egg2T+
         PJ5057LfJca0fsYFQ5Xc6wPjeF+9hdSvy0u1a+eSg2fMBWCZrNTJJqm0a3Qh7x9BzeGW
         60Rw==
X-Gm-Message-State: AOJu0Yy6hn6Df5Pietw8vX0F1SQeTtLbax3X0YRu8YWykyKAK11bcarO
	lQU9yGOYOKY0K4tBVEKrU28XRdYoBWhqLLKQAg2rd4TAF4a/MxbYK9kXPgn0gReRGhU=
X-Gm-Gg: ASbGncuK3NZqbmuVlOxDNM6ALESf1pULsn3iHMJ/QSFssG9IvW90uewKF4/rXkOIC3H
	6u4/SBmtqiEcDOFxvGccT5kECbxjJOhCBqFmgTcKv8nocVwk8N3riHaysgajsLAKaIYQU4iVpaL
	SMzAX+UZLE5fOxOYid6B7eOM5Yo1B1ErP/QGTvRI06O9qkqljCW2Ic3OdotA2XexA5aTanIOxPz
	md2e8TJ8geeVel0MOTRsjSGqi8WPwxmyB3GZ2GqW1aGYHqDTENVm2mLH/1yZ16bOEI6pUU5anmd
	T4xPWIQbh1mlVnbZA5xqu35N9K4U44wZ4qQ0nIl/dz3HIYAffpCTEVi6Bk2Z9xTWiWeKSfOGrhf
	gi6bMFlyiJQHo+wDJT9euoqBCESKJETYAUiKAZGL+sepeq0Gch0M=
X-Google-Smtp-Source: AGHT+IEXHHH4JbkLVpeVwwPZHvD++XjGVpxPtI5Hy0DsDhrk2YSZ8RCx/JhPktzR7CtWoasC/tGCSQ==
X-Received: by 2002:a05:600c:a48:b0:450:d019:263 with SMTP id 5b1f17b1804b1-45381af6ab8mr76129295e9.18.1750946719300;
        Thu, 26 Jun 2025 07:05:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:50a3:2b09:3b63:a706? ([2001:8b0:aba:5f3c:50a3:2b09:3b63:a706])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe0efsm20851865e9.24.2025.06.26.07.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:05:18 -0700 (PDT)
Message-ID: <b0e0dff674260c652a553068badfafffd3a7aa73.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate.bbclass: apply proper umask when
 fetching from SSTATE_MIRROR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <ravi@prevas.dk>
Cc: openembedded-core@lists.openembedded.org
In-Reply-To: <87pleqy8db.fsf@prevas.dk>
References: <20250606093905.2715221-1-ravi@prevas.dk>
		<0088740e272e5c9a1181de3f258c7ace3f7f3e17.camel@linuxfoundation.org>
		<87ikkuzuf6.fsf@prevas.dk>
		<5be4f30a9368b56993590b8ebe5d6d5120b7c15e.camel@linuxfoundation.org>
		<87tt43xaev.fsf@prevas.dk>
		<f2e0550f251683ed085ac7abaadbaa2f9aea04a2.camel@linuxfoundation.org>
	 <87pleqy8db.fsf@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Jun 2025 15:05:10 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.56.0-1 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 14:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219356

On Thu, 2025-06-26 at 14:50 +0200, Rasmus Villemoes wrote:
> On Thu, Jun 26 2025, Richard Purdie <richard.purdie@linuxfoundation.org> =
wrote:
>=20
> > On Thu, 2025-06-26 at 08:51 +0200, Rasmus Villemoes wrote:
> > > On Wed, Jun 25 2025, Richard Purdie <richard.purdie@linuxfoundation.o=
rg> wrote:
> > >=20
> > > > This should mean your patch can now merge as it is correct IMO and =
the
> > > > tests were just broken/breaking.
> > >=20
> > > Thanks for taking the time to work through this. I was hoping the nee=
ded
> > > fixups were small enough (or localized enough) that my patch, along w=
ith
> > > those fixups, could be eligible for walnascar. What's your take on th=
at?
> >=20
> > A quick poll of a few developers on the review call as we discussed
> > these changes suggested it would be a candidate to backport.
>=20
> Great.
>=20
> > > I got into this because we currently have to set BB_DEFAULT_UMASK =3D
> > > "002" to get the sstate dir perms right on our shared build
> > > infrastructure, but it turns out that that cure is worse than the
> > > disease as I wrote here:
> > > https://lore.kernel.org/openembedded-core/87wm9r1wcx.fsf@prevas.dk/
> >=20
> > I have been meaning to look at that a bit. We haven't really supported
> > changing the overall default umask as the potential for unintended
> > changes is significant.
>=20
> Yes, I realized :) But since the sstate dirs/files were not (always)
> created with the permissions we wanted, I thought that BB_DEFAULT_UMASK
> was the proper knob. Only when that turned out to have unwanted side
> effects did I dig deeper and found that the sstate code already tries to
> create files/dirs with group write, but with the mirror case overlooked
> (which explained the odd mix of permissions we observed).
>=20
> We also share our DL_DIR, and the fetch code doesn't seem to ensure=20
> group write is allowed - perhaps we just need to set do_fetch[umask],
> but is it intended that DL_DIR should be sharable?

It is intended to be shared the same way as SSTATE_DIR is. Setting the
umask for that could be the right call.

>  The problem occurs
> when one user would build a newer git-based recipe and thus would need
> write access to DL_DIR/git2/foo-bar.git/ and that dir had originally
> been created by some other user.

Right, that is supposed to work.

> > It could probably be made to work but someone would need to put a lot
> > of development work in.
>=20
> Well, we'll be happy to just get rid of our non-default
> BB_DEFAULT_UMASK.
>=20
> But it might be an idea to ensure that do_rootfs[umask] and
> do_image[umask] are 022, regardless of the global default umask, or at
> least have some warning in place if they aren't. I haven't really tested
> setting those; it's possible that the BB_DEFAULT_UMASK setting ends up
> polluting stuff before it gets into the rootfs.

The default umask definitely has effects in other areas such as
packaging. I think I'd be relcutant to start setting it on a per task
basis unless there is a specific reason such as do_fetch.

I still think we should put the sstate umask into a variable too.

Cheers,

Richard


