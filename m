Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1E1105F7A6
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 12:50:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15037.1773406194218694642
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 05:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZUbxjNrr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso19790515e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 05:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773406192; x=1774010992; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P8d9n66Elv6t2R15YXEIj/z/kQVQpQQl70msbXaRe/I=;
        b=ZUbxjNrrhcHbPRhXEY12Rm4bZDSJjkcu6omGP62G5oxJGJe/J79F60yr7LjS2LNfRB
         GKWtrZz0GTZ0hxQVP3jrEtUT7y8gXpFIFSZEpgNgBnYlQvABeJYypIEXcj6ND+Qb1l4f
         ejMesWx5P50ApI349E1H4ruG5/5wEazvgDJKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773406192; x=1774010992;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8d9n66Elv6t2R15YXEIj/z/kQVQpQQl70msbXaRe/I=;
        b=Qt9T0ZFdM1ooMUwP2I3saKQ/0LvhAr5768JHEFSJ+b7QSn2leNflfdJzkNaJThpVXl
         jef0pn6k9tV2XOUmydwZZEDvVLXEHsAa6QWheT64W72fY/SJtSAwfD4LHVYT86WTBxOC
         GwJ07aOtKyCkp5Cs1oqnaQb0cWiEHzV8HYRWZOyRgbXFeJoVCWc9hEQQeelpxGoMbM9p
         xnQaBWBUtMelnAsfLC1JJtTHOBLEp3cLL1WSRwAmyYIozQEES49021gGD1dYV7szD8Ft
         78wSnsvidzko5vnC5q/PehU01GP4pYp0UifIwgm1aQxo8a4L3xWaUYo5N4dW+mGasktp
         zK1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCwzbsCX51MVjTgks7ZdCStRMzyI7qDmfoEc/ADNjotD+6uRDiRqeB2aUIk/vFJCq7PhREdp6d6OWEwcmecSOW8Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4RucuL/FnqrPKCmyJLXU/MJFk2JdawciZmbr1Em6oyv106z2I
	XTCvVxjyVosa+N6unNnHqPzWKozQ2ZoFu6WWjwfp3RLl009Dg2L57MkgWm8CzU/oAZM=
X-Gm-Gg: ATEYQzyq+EdenxikIdnYT8fcY2oCznNVa98rbbK1lPmNkGipSSVkXq7804onWwocTHN
	ml/osweiWTp0oVbephCQAs4lV4NNC9/ScKrc2TzAURQjCvTLfxcouPo3eSDVlbbfWrP8W0rBk4C
	C3f4DpaqLKMbqAHasf7BrgZViltR0g2nMB2Vdbkst0F5p/kN87sprKkqxlTX8hUTaIast+iNCio
	6hwRAOyrIszQwWjtkIStCbXilmiZFa9Urvu4w7Aa6YjX/aQJnN+9vhRBtommaEChpDjnuzw9Uq2
	cSZQulcXPxGYR0vWKcRo330vk5U4/+Gf1qIyLBAqjxoDbn8J54cbHabmxrJOIylyAkxgsbsupUX
	tBc0/49b5d0rCiekeuadqQ2ZAZ5MazaY9I1Sq49vxyAXAeR5mhlF7MIcUYfSx90Vn/C0Uxv2fFS
	g8LGLtjAvVHz4coHgooFz7u2CCHDeV2v3KeGG0uOxYReoA9BdFbIKJ3PyAtez9BA9yC8x3F6Zzr
	LJlm88cOS0EHLs=
X-Received: by 2002:a05:600c:8b70:b0:485:39d1:b500 with SMTP id 5b1f17b1804b1-485566f9445mr52120995e9.16.1773406192433;
        Fri, 13 Mar 2026 05:49:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8f77:c880:e027:e164? ([2001:8b0:aba:5f3c:8f77:c880:e027:e164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b65fed7sm192398425e9.11.2026.03.13.05.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 05:49:51 -0700 (PDT)
Message-ID: <86735ada0cf017f2d6ea85c36359689515d0b414.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] pacth: add user and email when patchtool is git
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quaresma.jose@gmail.com, openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>, Jose Quaresma
	 <jose.quaresma@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:49:50 +0000
In-Reply-To: <20260313115345.4704-2-jose.quaresma@foundries.io>
References: <20260313115345.4704-2-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 12:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233043

On Fri, 2026-03-13 at 11:53 +0000, Jose Quaresma via lists.openembedded.org=
 wrote:
> From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
>=20
> When the PATCHTOOL=3Dgit, oe-core creates a git repo for the sources with=
:
>=20
> =C2=A0git init
> =C2=A0git add .
> =C2=A0git commit
>=20
> The git commit fails blindly due to misconfigured user when git don't hav=
e
> the email proper configured. Although the commit command does not fail
> because it returns 0, it is not executed and the tree remains with all
> files staged so the following git commands can fail and fails in some cas=
es.
>=20
> This problem has been particularly observed in some obscure and little-us=
ed
> cases in openembedded-core like patching the linux-firmware which only wo=
rks
> using PATCHTOOL=3Dgit because it deals with binary files.
>=20
> Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> ---
> =C2=A0meta/lib/oe/patch.py | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> index afc42df8a7..abc822f7fb 100644
> --- a/meta/lib/oe/patch.py
> +++ b/meta/lib/oe/patch.py
> @@ -318,6 +318,8 @@ class GitApplyTree(PatchTree):
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 def _initRepo(self):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 runcmd("git init".split(=
), self.dir)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 runcmd(("git config user.emai=
l %s" % self.commitemail).split(), self.dir)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 runcmd(("git config user.name=
 %s" % self.commituser).split(), self.dir)

If my name is "Richard Purdie", does that split() do the right thing?

You may just have to split it out in advance:

runcmd(["git, "config", "user.name", self.commituser], self.dir)

Cheers,

Richard

