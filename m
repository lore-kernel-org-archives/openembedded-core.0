Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7303C369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 09:31:37 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.3116.1745573489867229747
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 02:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TXU91AYl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso13314445e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 02:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745573488; x=1746178288; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L5YYaNHtBBGeraJLvNzjvZt8x9Hq5cgZQ8DNA/udNLU=;
        b=TXU91AYlwyRIQm/Gf+G41m3x8+mVow2Cd84jgLuV/mY58/OGaf8aOc6VTRnTQh95jQ
         KmyGBaGbWdIGEo35AonsIZifNO2zrCjZVRuu8HDxw48SQ4hfRtbWknM90+XchRchhj9O
         aYTw/Y+0qmQhfUE1EdbZbb5TSAUflkKMAQC+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573488; x=1746178288;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L5YYaNHtBBGeraJLvNzjvZt8x9Hq5cgZQ8DNA/udNLU=;
        b=IT2I+PpDWgZMtyIsEKqS65KMa7sTRUbRbvxpkwYa/DV8jltDAr9fPOfVZ3DVPMuTex
         eHgdRV/XGrRaYb/bg7JXl1FqFtRdhQUAa6dYOqzGH/Wrl4gIuCwvrGnJepyF+E/jv6Ig
         qJGJ4Nn/RNHZZ8ZUHnpW1UeLBYrhu02Bd5aw6c+0AgMgJ9GIZSU4DS+XVsngBBCOqM8S
         w3vWMfLjdtxjLngM5cTaOedpzYOgam1/w9JA5XiXQnBwlp6w5HpOfVB6s73587aid3DT
         IL/hIYAx1sIcHDjj/PVFi8iv7J/6ITZGvy7runsQ53D1h8ABx1bVzDfaseHF8W4bi9Fa
         Slpw==
X-Gm-Message-State: AOJu0YwIclRiRffG1onuA5l1tYT6Ujfp0+ZbbUi/t6kkinhi3jvuSCeJ
	1+cl6Se9zE5VLr2zaipn+kf3tPmTDv9uydWs9SCYXBgsprmsKcR9yRb9eFu1d20=
X-Gm-Gg: ASbGncvfehxj6ubJ8csXSAziUtYpwCOA+IbmBxO572ArOiXsIMJ//KM0gBqua29Vx1b
	wzZ7GaHAQFwZvMOxfhUSttkdhXHRnb9cIyccTHIjtkzfjr8aBgxRxQRJeIJCMUx+uRy8qXm5Imz
	Kx9KiUjEzqINQ5tDFZsgkV+monw7acDdsO8WtXYiUrOWXb+wU3w3b21mThOBbzliYRaxhNZi5qd
	Heh0RGbS1wKyAv4iwOT1r/qmwKdE78fT4z+Xlid1UqcOSDw7FGaOlLZk53hHqmVhLYqDJfLhYNr
	hCS4+2KiD80nENw+XJc0H0VEmjfwEjYWUMIbG1erwnuvwyLySDUx0YFpHSRJ32X4k8yBGfWY01W
	5K1oaZXNMrH/cxu5sWkrcT4i36pXz/Q==
X-Google-Smtp-Source: AGHT+IFnQM/UZeMxYYv5TfZlmJni2u2zTC/IjBJ65ikEifXEb3/9N97QDp7oAn1HINsjt6YbLsPJlg==
X-Received: by 2002:a05:600c:4f06:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-440a65b6fe5mr14136915e9.3.1745573487690;
        Fri, 25 Apr 2025 02:31:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b43:cc8c:5e78:12c1? ([2001:8b0:aba:5f3c:4b43:cc8c:5e78:12c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a1d1sm18517415e9.26.2025.04.25.02.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:31:27 -0700 (PDT)
Message-ID: <a0571f14790862528506c994f349a78517031624.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Fri, 25 Apr 2025 10:31:26 +0100
In-Reply-To: <CANNYZj8ooWqS1OXO7M+S4wgX8sVkWG3wTiCb5s-bnZhE9CxZRQ@mail.gmail.com>
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
	 <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
	 <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
	 <18394019E7982924.8448@lists.openembedded.org>
	 <64802f57b85b524ef1bab88b07a116e5af228d5c.camel@linuxfoundation.org>
	 <CANNYZj8eA1vnm6hO-AAn=xNEyMxrBGf48GTtiQOzW7w3yCqHKA@mail.gmail.com>
	 <655a8640b7d8f528851f187558d19f8285e111e8.camel@linuxfoundation.org>
	 <CANNYZj_j9TnJGEsfQ9fuivKQ0KcZgSyCc-OXbyXvzOuy2=S68g@mail.gmail.com>
	 <db5f670164880a45133b2133b3957214b3ff0880.camel@linuxfoundation.org>
	 <CANNYZj8ooWqS1OXO7M+S4wgX8sVkWG3wTiCb5s-bnZhE9CxZRQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 09:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215448

On Fri, 2025-04-25 at 10:33 +0200, Alexander Kanavin wrote:
> On Thu, 24 Apr 2025 at 22:34, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Why can't it set UNPACKDIR to the the workspace path and then just
> > run
> > it to directly unpack to where it wants it?
> >=20
> > It can then redefine UNPACKDIR to point at the workspace path and
> > things should "just work"?
>=20
> It can. But it will fundamentally change what users are going to get
> under workspace/sources/${PN} and not necessarily for the better:
>=20
> 1. Right now, if you 'cd workspace/sources/${PN}', you'll see a
> source
> tree that matches upstream repository (or tarball) exactly, for the
> unpacked item that contains ${S} in it. It's obvious what to do: you
> can modify files, run bitbake with these modifications, make commits
> and devtool will pick them up and integrate into the recipe.
>=20
> Yes, technically there can be more than one upstream item listed in
> SRC_URI (I'm not sure what devtool is going to do when it sees them),
> but the vast majority of recipes have just one item, and this keeps
> things simple and straightforward for the users (and tools). The cost
> of it: devtool is a convoluted mess (and to make matters worse,
> without a maintainer); I don't argue with that.

There are continual requests to have devtool able to operate on recipes
with multiple SRC_URI entries, be able to see/modify files, support
things like gcc and the kernel which have interesting build layouts and
so on. I thought we'd already added support for some of this which is
probably why the logic is already convoluted. I suspect it will only
get worse.

> 2. What happens if workspace/sources/${PN} becomes UNPACKDIR? When
> you go there, you'll see something named 'git/'. Is that where the
> actual source is? If the recipe is fetching a tarball, there's no
> git/, but rather ${PN}-${PV}/. So there's an extra, potentially
> confusing step to get to the source code. It becomes more ambiguous
> and less consistent for the users.

It does match what happens in a real build in WORKDIR. Where you have a
subdir of a git repo, this is already exposed as you don't get S but
need to find the subdir. My point being it is already probably
inconsistent.

>=20
> 3. This will also break all the tools that assume the current
> structure, and another reason this change shouldn't be taken lightly.

Perhaps, or perhaps not. Do we have a lot of tools that wouldn't cope
with this?

> 4. Maybe there's something I missed that could be done, and won't
> break the current layout? For example, we can set UNPACKDIR to
> workspace/unpack/${PN}, and then use devtool 'logic' to provide a
> hardlink into it from workspace/sources/${PN} ? But it would be the
> same logic as now with the patch: take original values of WORKDIR,
> UNPACKDIR and S, and figure out where in the new UNPACKDIR to point
> to.

That 'logic' is effectively what do_unpack is already doing itself to
maintain 'compatibility'. Perhaps we could use the same logic in both
places and be consistent!

I'm torn here. I could take your patch, bury my head in the sand and
pretend everything is fine. We could try and actually improve this and
set things in a better direction for the future, at the expense of
breaking things in the short/medium term. I don't know what to do for
the best here to be honest. Taking the patch is way easier for me I
doubt we'll ever improvements if I don't push back on things at times
:/.

(I'm spelling this out so people understand the dilemma)

Cheers,

Richard

