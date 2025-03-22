Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7F3C35FFC
	for <webhook@archiver.kernel.org>; Sat, 22 Mar 2025 20:03:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.3301.1742673782111991123
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Mar 2025 13:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tt8M3cXY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d0618746bso20651255e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Mar 2025 13:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742673780; x=1743278580; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpNFffQXmZd17AonWSWHxdTYkTrsgdgv6xbuaXKeqaQ=;
        b=Tt8M3cXY3n5R42G3A3QJIKTcnw/ExZ66MPTDj2c203WpWQ9H55NcVAaYTiNL8A8YmK
         15Rxvai1MsC9BcLe4GWSgeEoSAoKizwR+1/sEKEQKHsGpLAZhpTLAa8dpQBCrKW/PTPo
         fQ0zHMnO6pTCsEMtmX8aqHnfhfdzUffMvtWuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742673780; x=1743278580;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jpNFffQXmZd17AonWSWHxdTYkTrsgdgv6xbuaXKeqaQ=;
        b=JT3VmY+Nb1o6i+vrmSz397NN0hUntR5ekW9XV2mM0tYcJdibHTHvQsgZhP+t11k8zk
         y4SF+eIhSwBvzsi6EXNyJpqaAnPSHbjxXwDy6PXc+Pr9VSN1KTQT9+k+OZRBS1ocqhh8
         aDkpafmq/h8StqAl3pkgp4E6yf3p2CTzzE9U+gVvKQu2Guu2omKuzZFGZWG0i71DB5GX
         ZYWUiY+x3To+cIvTY0xor9VAZOffNA1G5+4g5HFKSv1NFy1d1VUwxOF7fVhE2YPxKdil
         qHDdAoNvx81p7sR0s2oprTDKzvT0821aZOOTHAGjo9oxVQsdCuT1Qh8HfDQKOj888qX3
         NAmA==
X-Forwarded-Encrypted: i=1; AJvYcCU6G3xorEVpVNe/JstfbtZ/O2Hoc3myW4QbOOgxNlmJSIZ6nQ/m43sN8GNhaYU/gouYnrx2d+GZtFmP/U/fqe+8MA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzZw7KmORn/e0lskcP6haV13o29XTZ9MUhCwvDPyHhOy1+plVCP
	WFFD4+Av7B4jSnbInHrD1Jw8BqEMUqZLVsvtMsnkiB9L/xQ+XYnzy1vh3y/Ffrc=
X-Gm-Gg: ASbGncv2oGN16LlL4a9CmoqYTfkIB3NGPtAaChs/UswjMzwpGKD64zlBkfC5kOUVBvG
	x5UU9bFZLv9KeEt+QF8iGkv/aSH6Pm2RO2PjF0Jx96bk6RRq33ouzmaI3I1jw60rBt5dE0NEUN7
	bTMv2VXOi3gBeVEm1J8ijZvYDTcpRMrubZlVD98M/t2ZccEGIKySy2fhrD7zqco/fX0EabMEL43
	24iQm8Sw39IAmaJoULJH4YcfV1IZaYa6XIAeNr3YYFdyq+tIeNQDFmzxRfPPNRjV4TGp11kqhvJ
	C7NgXwWLnsyWm0Ncxn4TcoTj7jBTON1kAOOZul7GPvSEXqnN0CIFzuZrVqWjEPw6dPkVUjerlR0
	zrRrMfrpCTo1LX/6f5iU/shiY6CHEGuThAYs2N4iq0zut
X-Google-Smtp-Source: AGHT+IFgiS2jzJ2kjFhfPvcTbDmT4DO7oXiYmh7s/tpNumM9H3s6V6UH1XyXm7BNh5qXCQZAj5M3ng==
X-Received: by 2002:a05:600c:83cf:b0:439:91dd:cf9c with SMTP id 5b1f17b1804b1-43d509ec70cmr89838775e9.10.1742673780354;
        Sat, 22 Mar 2025 13:03:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:67cf:ff68:8b5c:4565? ([2001:8b0:aba:5f3c:67cf:ff68:8b5c:4565])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm64944915e9.34.2025.03.22.13.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 13:02:59 -0700 (PDT)
Message-ID: <2b00dfa58869a6a2b8f0b709bf8eda20aaffa3e3.camel@linuxfoundation.org>
Subject: Re: [OE-core] gcc library directory and LLVM
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mac@mcrowe.com, openembedded-core@lists.openembedded.org
Date: Sat, 22 Mar 2025 20:02:58 +0000
In-Reply-To: <Z97_ivhm-0mW7_Px@mcrowe.com>
References: <Z97_ivhm-0mW7_Px@mcrowe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Mar 2025 20:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213498

On Sat, 2025-03-22 at 18:20 +0000, Mike Crowe via lists.openembedded.org wr=
ote:
> Someone complained to me recently that clangd was unable to find headers =
in
> multilib OE recipe sysroots even though it could do so for non-multilib O=
E
> sysroots.
>=20
> I dug into the LLVM code and discovered that LLVM has a specific "hack" f=
or
> OE[1] but that hack is not enabled for multilib sysroots. I proposed[2]
> extending this hack to cover two common multilib targets. One of the LLVM
> maintainers responded[3] suggesting that OE should consider moving from
> using its current location ("${libdir}/${TARGET_SYS}") to the (apparently=
)
> upstream default ("${libdir}/gcc/${TARGET_SYS}") or Debian's cross-compil=
er
> ("${libdir}/gcc-cross/${TARGET_SYS}") conventions. So I thought I'd bette=
r
> investigate that.
>=20
> gcc-common.inc sets ${gcclibdir} to what looks like the right thing, but =
it
> looks like that only has an effect on gcc compiled for the target and not
> the cross or cross-canadian compilers and even then just controls where t=
he
> recipe looks for files and not where the GCC build system writes them to.
>=20
> I found a comment in libgcc-common.inc that explains one side of what's
> going on:
>=20
> =C2=A0# install the runtime in /usr/lib/ not in /usr/lib/gcc on target=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=20
> =C2=A0# so that cross-gcc can find it in the sysroot
>=20
> Way back in 2010 (f47eeddbd692ac3c6109c18c9f04a3ad4dc789ba) that comment
> used to say:
>=20
> =C2=A0# Also need to move gcc from /usr/lib/gcc/* to /usr/lib/ else the s=
earch paths won't find the crt*.o files
>=20
> which provides a bit more of a clue but doesn't explain why gcc-cross isn=
't
> capable of looking in /usr/lib/gcc. Of course, my attempts to leave insta=
ll
> libgcc etc. in the locations that the GCC build system wrote them to (i.e=
.
> /usr/lib/gcc/${TARGET_SYS}/${gccversion}) result in the built gcc-cross
> compiler being unable to find it! (This was not a huge surprise to me.)
>=20
> My suspicion is that OE does things the way it does because there were no
> conventions way back when it started and even generating a working
> cross-compiler was an achievement. It did whatever was necessary to make
> things work.
>=20
> At the risk of opening a massive ancient can of worms, is there a chance
> that it now possible to teach gcc-cross to look for libgcc etc. in
> ${libdir}/gcc/${TARGET_SYS}/${gccversion} (or ../gcc-cross/..) to match
> other distributions?

As someone who has poked at some of this, I suspect you're right, we
managed to make it all work and we moved on to other more pressing
matters.

It would probably be nice to be consistent with the target layout but I
suspect there are issues with the compiler/library search paths which
prevent it as we do things today.

OE is one of the few setups that has separate host system, native and
target sysroots. We also use our own mechanisms of relocation of gcc,
partly due to that, all of which combines to mean that this isn't a
simple thing to change.

Trying to unravel the situation and then if necessary, talking to
upstream gcc about how we might be able improve things is on my todo
list. Sadly it is the kind of thing few people actually care enough
about to invest time into and I get too many other distracting bigger
fires. Sadly I struggle to explain to people why we should care about
making these kinds of back end infrastructure improvements and I
therefore struggle to find time to spend on it.

So yes, I suspect it would be possible but who would wade through the
pain involved, perhaps other than me, I'm not sure...

Cheers,

Richard




