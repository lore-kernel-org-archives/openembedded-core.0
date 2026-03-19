Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828EA109192C
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 22:14:35 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.334.1773958467228055450
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 15:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a8M2RvFG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b48ac2727so1029502f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 15:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773958465; x=1774563265; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QMWRO+JniGGVSpq3SNyw0nCQWtfx6gEwekUjQ1HTRrA=;
        b=a8M2RvFGk6mNdTIPKE00t3vcE/Cy3VIAAGAmMlWp5G1vaLfRibp7scRq7nFGkZwzU0
         fRi+v/pWBU7jUbdHHxdQfJ1I9/6BSk8dsk/uFNF+ODiyDyApgn74288KQfe3/Wgqc+ha
         q0SXCP/yabR27qn/+q98Y8Jld9WDIZ0WdFKG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773958465; x=1774563265;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMWRO+JniGGVSpq3SNyw0nCQWtfx6gEwekUjQ1HTRrA=;
        b=mhuunwFxnLFqT/OzspTwo7JweQmdYL647KBCYjkltIYdh6dp8eSWMg6sEQrL4/1oa2
         TLQzB8yRCi+Bw/fkPLRq+5c3L57hZekzRMYKqkq+P1LzCgvXWE1Pn6ADz1TYS7BSfYOp
         /q0G+jKlNVP88tPvz6zuOPQY4+qV/iQpOoZ+FUTqg4+BT8G6/aii5FUtWFRQaWTfcnvh
         TZ+kYxfItPpMCUWj+ZO1UvawX7k0bCr+ZTHTavH+WmLb3KpHKVgMwBHDDBBvxAeMBSx4
         8mVBzpV6jtTXkKjKLE0qLGPSJcNmuPs/zsgwxsSHHsRApsB7BWDiUgUBrrv1oylv+buD
         EYnA==
X-Gm-Message-State: AOJu0YzkHvP9P8NZQoVIbVGMNaBMP6kZcxBBXSh0UlwzoyaaMcodtD3s
	GBzM4IYyvYq9XIB1LEcW85f80rRkxifbIsc2GQ0YdT2GVb2V6nyXPh5cabE4iOKI6FU=
X-Gm-Gg: ATEYQzwhTjsPxsHSmWXjsqpQDxoxC8DKlPvXBFUFifcw7NwKAWQt7arSagsdAGzfRpn
	nRXOfY3kBnIUKgEbfPeINMbWOPSIA0c6vWJSpngxghyusnf6e4e3UkOiKfMwpjlxK/vX+oMaYvD
	P2wCVN7TyQ9NuFCv7TAiLUVQwI6lM84+bC/lit0gzakYBPwxWYai8/nkLnk5Yqow6O0okUPR9c7
	ps5s2RYQxfmusyC01SFkT9XeKJooJA52zBde2k7D2E66Q/SuzfGNmZafSiXLN6Ep4B/rOzTRF4V
	ZjZfdIAbnTxxesaNEsNbFwcEVv09adooFXc8zlMVBx0sX54dz3tU/66N6IAm+Y6dbjRJYg3oYjD
	9G7DS2k2N8mYxZVj9gLgrlYkWi5eRKFvmSEMVgwpM6f+oHKHXWyxv+DXZGx1hnEilC4MeLwTWCD
	Gh36kTd9z/GsbXBK3z08ikTCk6zZugiY2KKN0TfQ5WnzoK+Y1++NMleZHKRcGMDZ2b0RSYclaz7
	kFYe68FLdRR4MDwtlB5qHjx8WE=
X-Received: by 2002:a05:6000:40c8:b0:437:75c1:578e with SMTP id ffacd0b85a97d-43b6424eae0mr1563243f8f.21.1773958465424;
        Thu, 19 Mar 2026 15:14:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:825d:929b:d471:a79f? ([2001:8b0:aba:5f3c:825d:929b:d471:a79f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bdaf8sm1539911f8f.13.2026.03.19.15.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 15:14:24 -0700 (PDT)
Message-ID: <7f555d2b868ce2994ab1e2e12ecc0cc940dd4d89.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v7 00/12] Add SPDX 3 Recipe Information
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2026 22:14:23 +0000
In-Reply-To: <CAJdd5GZ9HXHoZkz4xX64O9e3CzSWAiPHQ5BGgW6K401Jji--AQ@mail.gmail.com>
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
	 <20260318134655.953233-1-JPEWhacker@gmail.com>
	 <CAJdd5GZUvWKb37Ys-dNjOShHYb0Gis9wU3Q2WkdA2_m6xoLdhQ@mail.gmail.com>
	 <DH6KHVSGCDH0.DZ1GQQ228GWT@bootlin.com>
	 <CAJdd5GZ9HXHoZkz4xX64O9e3CzSWAiPHQ5BGgW6K401Jji--AQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 22:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233555

Hi,

On Thu, 2026-03-19 at 15:55 -0600, Joshua Watt wrote:
> These errors are caused because those recipes do:
>=20
> PACKAGE_ARCH =3D "${SDK_ARCH}_${SDK_OS}"
>=20
> Which is not in SSTATE_ARCHS, and therefore the required SPDX files
> cannot be found. It appears this was done circa 2016: 1dbc6ec4ca
> ("buildtools/uninative-tarball: Fix deployment overlap issues") , but
> I'm not sure it was correct before that.
>=20
> IDK what the fix should be; Maybe SSTATE_PKGARCH should always be
> part of SSTATE_ARCHS? Or maybe ${SDK_ARCH}_${SDK_OS} needs to be
> manually added?

Sorry, this was my fault then, broken by=C2=A0
https://git.openembedded.org/openembedded-core/commit/?id=3D834efe5eeaa7eda=
e27d54a382ab864ef8f924b2d

I think they need changing to ${SDK_ARCH}-${SDKPKGSUFFIX}. I'll try a
patch.

Cheers,

Richard

