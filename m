Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB24C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 08:17:39 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.46948.1743409055555374506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 01:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bKwG+4jL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so41561025e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 01:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743409054; x=1744013854; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6lKgepNCWF0yjGlEN/q50yzwxeX9VwbUmkzkCnnCXkM=;
        b=bKwG+4jLH2vkZyvYIsFNpoXLYYjOFv0jE5vMEUruc0fTOX4NjYw6kE2/w6Z1NiiV2I
         6xaavlwF6xYgzUrI/lHOYPt2fbMOluI8vdtgBHI5WKGs1VEHwJRFh2WbWZNhcgKaGoKD
         UXc6aM9PPv6kJpEwOBJdqkAxsaF9A4+UULwps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409054; x=1744013854;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6lKgepNCWF0yjGlEN/q50yzwxeX9VwbUmkzkCnnCXkM=;
        b=S7aby6IGoukCzTXi8jRm+FJh03vamJGtyunODR42nyCZYgg9NHG49nbAcuvEMUbdau
         gHkiL865z/gDPFJWYPL7jYyfOZqbAKLy2LwZ9jjR2hZqqdrFvRqtZW7bsOPmP5WSRwXG
         c0n1RpZIlH9w+xVTk5aSMZZ3eLjtzIb+ZLAjAnuPhwt47vnlnUwZITfo6PkjXorrUHeO
         mOYbN56Gdqw0qrXyR777/kDZQwU73d9KMf393IlGhHG9V2+sgqWHlGfoe2FIWUYSMH6K
         vKfKBGayCuIfDQXZ9kKzyg/ENzimXOOMPLvOU+mn8yzXKbCRoDqGMqIq+oUveJdYslar
         ltFA==
X-Forwarded-Encrypted: i=1; AJvYcCUOtrGnW7apA5l1szjXgSADZCWYilkoHiJeLfFbN1IP1ZRHrd4NjlUfFNZrBMDMonNDrF2AKCJS2Qtk9ubhBxVoLw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxJwckEWgSx1ey4vQ1DdCJfQ5fUkXnWL2QwXArraVNaDQHNNK02
	0SoxGwqlhFAQXEuQBq5lMhtYEL2/6MLhcCeUN1OrqxixfuyoUt99IJk2Ii8eFBY=
X-Gm-Gg: ASbGnct5V1vFB3tCoyZ+CL86XUUuhW76I1qXpbfDLP/znhQvxAUruc+4S+0JLPY6G+e
	klw5y7p1Pl0txDiXOleMhHOX+dYeuk0GaZGcx2zb5jyRVhC3vWekKe+vQhIEZN0r6eoN18uK7j1
	JhBI/Goy42Yjsc6KCicrVK5KDzf98gf3pjdrYJfn6NXOJo2m8nEYYDutE8y+oNzDhxnnHeqVaFC
	7vEwUOpNJmFWhxEjY0eq1nWX5lEJztXtjvQZPpqU8Ikc8xsqYaZFzLe2k0MSqIh/EXhWloNmzbp
	hJ22XKhlOafW4d73qrBbdHZTutfG3ercypivhmo39XNZWgVjbjfhqmcCigsBfOUFtPHnv7z++xA
	wVtHbzsaFG055JMcuRDIkiJtWXKq8GT9mSA==
X-Google-Smtp-Source: AGHT+IHHMogLKlMgplK30ShIvmPmAqmLFebWB9sK0y5O5jQHrwxki/BT2OSlWYRWba4k8DOYuxli0Q==
X-Received: by 2002:a5d:64eb:0:b0:391:2d76:baaa with SMTP id ffacd0b85a97d-39c1211ddecmr5773897f8f.46.1743409053583;
        Mon, 31 Mar 2025 01:17:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2f01:de37:feeb:500c? ([2001:8b0:aba:5f3c:2f01:de37:feeb:500c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a9d2sm10595964f8f.43.2025.03.31.01.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:17:31 -0700 (PDT)
Message-ID: <3686e1e729579e4b2ab096f4f3b40a2a945599aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] rust: Upgrade 1.84.1->1.85.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash Shinde <Yash.Shinde@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Mon, 31 Mar 2025 09:17:30 +0100
In-Reply-To: <9730a4ae-9c02-43ba-a241-f7cc60ebef70@windriver.com>
References: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
	 <20250331055424.1978243-2-Yash.Shinde@windriver.com>
	 <6a0be636d9c44b3166ac50e42c34aedf13a1be28.camel@linuxfoundation.org>
	 <9730a4ae-9c02-43ba-a241-f7cc60ebef70@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 08:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213949

On Mon, 2025-03-31 at 12:46 +0530, Yash Shinde wrote:
>=20
> On 31-03-2025 11:54, Richard Purdie wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the
> > sender and know the content is safe.
> >=20
> > On Sun, 2025-03-30 at 22:54 -0700, Yash Shinde via
> > lists.openembedded.org wrote:
> > > From: Yash Shinde <Yash.Shinde@windriver.com>
> > >=20
> > > Rust stable version updated to 1.85.0
> > > https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
> > >=20
> > > Some of the major updates:
> > >=20
> > > - Update LIC_FILES_CHKSUM in libstd-rs and rust recipes.
> > > License-Update: Unicode license text is updated to Unicode-3.0
> > > License.
> > > https://github.com/rust-lang/rust/commit/6d2a3e9786ec43a0e0af20386e70=
46328296ac86
> > Thanks, this one step in the right direction but there is a
> > corresponding change missing. The recipe says:
> >=20
> > LICENSE =3D "(MIT | Apache-2.0) & Unicode-TOU"
> >=20
> > Does this not need to be updated to include Unicode-3.0?
> >=20
> > That commit mentioned that the SPDX identifier exists:
> >=20
> > https://spdx.org/licenses/Unicode-3.0.html
> >=20
> > so I suspect it should at least be mentioned in LICENSE. I'm not if
> > other unicode licenses are present or not any more.
> I'm not sure about that either.
> Perhaps it should be updated as follows?
>=20
> LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"

I think so, yes.

Cheers,

Richard

