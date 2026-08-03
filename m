Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2244C55179
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 13:12:55 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42912.1785762771665811131
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 06:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F0cj0jC6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69c20ba892eso5940871a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 06:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785762770; x=1786367570; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kN4SB5krYxEiy18XWiXtlKvu8ER38uQ6u8QB1myMe6A=;
        b=F0cj0jC6+a8BD+rqO+IytgW8BtySdKo1FtnJe3ygsWm2BJABtTO9GEz7/slDcdLo8o
         lfuaPvagHzQzYiJ5no/orsIxpRua4N/ZCKJGk6npCn/8/+g0uHm6AOigpH8oLxuQvz0z
         paJ1FZdeyeyPnXHA4W/UsjVoYWDzM7dZDNN5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762770; x=1786367570;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kN4SB5krYxEiy18XWiXtlKvu8ER38uQ6u8QB1myMe6A=;
        b=RraQBCVoWLMYLEopVhKWujtBJeHJ3TybCId95nPds1VXBc80jOEfHi8DqO4Q0hwctJ
         pjnYfLskNw5fBMiBI0ob/OhpQfRGhDRLYw7R/b2vj6BmmDucmI1NBHvfXyC+H/UFGdrg
         Gd8/M9eit5e4iUoUFZ1jdOSvOcqAsxJVXFcsd5ZHYo72C1TJnN2eQXSfz1HZr/lqn/0W
         tb63AO617dV7NK7tbLCGzloWQBRFnSnI7vGmLBSJijTHwk2itDyraxv7bYbjhrGXEj9w
         E6W48fDHJmdYJOnJ6FVtpIA07a1s2hgilbB+mtmLRRLxHGLszXZiT/vUNAshuRWioNN6
         aLtA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1dzu2+2eK5cT4AbAYRM0QSZIoUVLZrXdDyHkBty4Uw/TudqGPHoyOzXzwqgtUH5s16rX9NVXcAErs3yiKq34lVQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxE8Uq6H5LbPKa8fDqJ7V7z1XmscWLEH3xQkJ/8iUIkPmAXcmdt
	JiBGK+lx4uAqAIzJfQVl/rFuKJQS8iwExjVsG1WbYOKdkcpRonn+LJGwHJaS9WKQtco=
X-Gm-Gg: AR+sD137/uUSMPxRLCuHYtUN882vCAKsGiNWQZfP8f0tUa+c9+aEIQrZ9Gu6PMChwuG
	d3QhhokvJRErQjJSiy2oAZFERy/T034Pcw8NKG6+2FcOdjgWqNJWVpqyE1XiN4omVssJ76iPN/D
	YzVnAHzzU/OdiE/TJDKwgedujwXejSHpmFuji9H+Jw8PrhO3kf2hy+KXcRz641YfrIljJCN6FSc
	dQ3P8P5mGzh00a+Rulg5RM8z385Zr30Cej4s42sxY2jmUIbAQbnFlsfUB2eROJLk3xVanMBp+9M
	fOIHYH8243Z/nRw/vmPD8TawZ7u/ORpK0fzIzIIbYUK9CR3dUeKKH6nm0/eLZhHDvQZu9ebxKPG
	c5L1h6t2IbwM+maGeydCRQ6Y2ry185IGPVVNWnvC1v8GmT2/85npgrXjx/G4WoMwk2YuvhVaF1e
	ljDNTVLQ0cLlWw5QPoOzp68G57jJowfb1h3nZU8thGSAR4DssPXs3mbK+SonScq/ygUl0Duj2OF
	+5yi5tcNxBTIVJl9bMZqL0j0Jbh6LuGVjQXuzjDepfXbBuI+8Rzag==
X-Received: by 2002:a17:907:5c9:b0:c12:3cbf:9f6d with SMTP id a640c23a62f3a-c1fe791c85amr775002266b.1.1785762769768;
        Mon, 03 Aug 2026 06:12:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6b5c:9c24:b513:8797? ([2001:8b0:aba:5f3c:6b5c:9c24:b513:8797])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4537755sm555201966b.54.2026.08.03.06.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:12:48 -0700 (PDT)
Message-ID: <358db0c094083c05a67c0d989bc6390e33659949.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] devtool: upgrade: ignore changelogs from
 3rd party
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org
Date: Mon, 03 Aug 2026 14:12:48 +0100
In-Reply-To: <20260803100231.3752129-1-daniel.turull@ericsson.com>
References: <20260803100231.3752129-1-daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 13:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242652

On Mon, 2026-08-03 at 12:02 +0200, Daniel Turull via lists.openembedded.org=
 wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> Some upstream projects bundle vendored dependencies in their source
> tree (e.g. nghttp2 ships third-party/mruby, which has its own
> NEWS.md). The changelog extractor could mistake one of these
> vendored changelogs for the recipe's own, misattributing unrelated
> upstream changes to the package being upgraded.
>=20
> Exclude paths under common vendoring directory names (third-party,
> vendor, external, deps, etc.) from changelog candidates.
>=20
> AI-Generated: Kiro with Claude Sonnet 5
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
> =C2=A0scripts/lib/devtool/upgrade.py | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)

Thanks for these. Unfortunately something in here caused the devtool tests =
to fail:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4274

Cheers,

Richard

