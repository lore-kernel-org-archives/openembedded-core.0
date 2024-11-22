Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAE8E69184
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:38:57 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.28733.1732293530227692162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LQD3NJ6m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-382423e1f7aso1546802f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732293528; x=1732898328; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rTSCwhLVtRZxxH0EINr/D7qaV5ODu/rWdyWg2Wdluk=;
        b=LQD3NJ6mS9NAQXbtOH7Sd9QpCWJsfl9w7fHNc7Jws7qJ6DhRd5jE2/vweq1tw8Rkp1
         kXdw9nuLgOMcYQGHDzWgZvd07FCfx7swb7U3JEKvY06uCJKdC66BZomNsnNK5iyguQ5K
         L7+03zF4+umPdaHoszL1VkHlRnN93aHrwoG/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732293528; x=1732898328;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1rTSCwhLVtRZxxH0EINr/D7qaV5ODu/rWdyWg2Wdluk=;
        b=TDKZ3IFdHp1VMQAZTpDaDAIfRrfwLL8gUJJWRonG8HO1gUGWDY4mCyCDEhZ5n+nOeo
         In7liQZsT8blx/PLgA3at+IEcEhZfatWyt9MV9Zf9PkQBj7NGTr3ue7IfU2P8BzBxVEy
         9MNbPOEuzF2OumGDZ+L1fxQLtRbkfvZRJmEUByLunm8bx2xwgy0GeTz8Y8e5l4ss+S0a
         mOCrPDEKWQACfT7t33SUfTq86Rh3PQpp4EiFkk5vWeMJPNHfHgN5y32fdn33X64zQNNn
         GQd1cMY20lkUgh3sBD4e1RNJPBpdRrU8BbDK+e4DIq7hRKh7KVa2SEl7qUPP4NtKmqM1
         rzng==
X-Forwarded-Encrypted: i=1; AJvYcCXKWszEiCJmeu5mNOlX6ark/u6xewNL4SbfyqOJgXZ7EkNjoAClIB1yfD9RtI5qgmPkF412UJ2nvGlHmuFq/2d+gA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy6MEX/8I1LqraZve+GwQFZ2OhZSzNDqp4wLwJZ2KEKpxqWlT6u
	7cf300bs2E2QmeIQ4PHFq03vzyMluzB8hq+FY2EydFzXEmZJq+op/rXIdsW58sY=
X-Gm-Gg: ASbGncuW+olkybT/3xBeE8/ZgiYdrrPznjnk7SrHl31+KlXXZxuk+N9WRS+NyjqY1lY
	ym3DRAEVzd0manHbFH2806lwWZMfh8bZ48hFbMJD7dJRzG71od+wVgaxuYgrRNeIeHQg6iGCB13
	j04V5tJNhpzB7+cbstGv+yOuqdzk8pUdVw6ONyTnobMja7EsCCjb5Z8vj645Ak52Wts1l2f0fXO
	OvpUWsaMY5ZWJQZh1wTeVNRtntiMZjiE9rvTt6xwm7x3XVRrWUDWtOKNz6KmsA9zJAPx0uXHz+x
	mFXiiK+K+rV8tg6O75FsnUYTJ+6qyuy8zUcsJts=
X-Google-Smtp-Source: AGHT+IF75NhEMIfvE230VGWNIxWWBI/YzWTyWsggp/cl2Z6MktsZSY5CISb6+FwOqVu4T7rRLmlSuQ==
X-Received: by 2002:a5d:6dad:0:b0:381:b68f:d14b with SMTP id ffacd0b85a97d-38260bc860dmr3564150f8f.45.1732293528525;
        Fri, 22 Nov 2024 08:38:48 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:87e7:ee61:98f2:6cd2? ([2001:8b0:aba:5f3c:87e7:ee61:98f2:6cd2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbeea0dsm2803709f8f.106.2024.11.22.08.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:38:47 -0800 (PST)
Message-ID: <1cc00e4a21ac06e05994ea52e1e67f4f3b91827b.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] spdx: Fix SPDX tasks not running when code
 changes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, JPEWhacker@gmail.com, 
	openembedded-core@lists.openembedded.org
Date: Fri, 22 Nov 2024 16:38:47 +0000
In-Reply-To: <40520d80-5548-4195-9c70-bc7fbfbd8ab1@cherry.de>
References: <20241122154939.2133845-1-JPEWhacker@gmail.com>
	 <40520d80-5548-4195-9c70-bc7fbfbd8ab1@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 16:38:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207641

On Fri, 2024-11-22 at 17:22 +0100, Quentin Schulz via lists.openembedded.or=
g wrote:
> Hi Joshua,
>=20
> On 11/22/24 4:49 PM, Joshua Watt via lists.openembedded.org wrote:
> > The SPDX code makes heavy use of python classes. While this works very
> > well, the bitbake dependency parser is unable to understand how to deal
> > with them, and thus changes to the class code do not cause rebuilds to
> > occur. To correct this, add the library files that include SPDX code as
> > file checksums for the SPDX tasks. If this method works well for SPDX,
> > we will look at implementing something similar in the bitbake dependenc=
y
> > parser that should allow correct checksums without having to explicitly
> > add them to each class.
> >=20
>=20
> Oooooh that reminds me of this very issue happening at my previous compan=
y.
>=20
> I'm wondering if we shouldn't just add this file-checksums dependency at=
=20
> the global level somehow? Since one needs to call addpylib=20
> layer-dir/path directory in order to be able to import those modules in=
=20
> tasks/functions. Maybe there's something we can hook there somehow? The=
=20
> issue being we would either blindly reparse/rebuild all recipes when=20
> those changes or we need a way to check which task(s) import those module=
s?
>=20
> Another option could be to forbid addpylib on a conf file and force it=
=20
> inside recipes only, but I guess this means we cannot use those in=20
> inline python in conf files anymore? which we do use in=20
> meta/conf/bitbake.conf.
>=20
> The change itself looks fine to me though, wish I had this idea at my
> previous company :)

The challenge is that you only want the dependencies at the points of
usage. We could make bitbake just checksum all the files but it would
mean a world rebuild for any single change, even a whitespace one.
We're trying to be a little more clever than that.

In this case the python file is basically the class so it does make
more sense.

We might be able to teach the dependency code about classes as a large
object, that remains to be see. I'd not want to do it at the file level
though in general.

Cheers,

Richard

