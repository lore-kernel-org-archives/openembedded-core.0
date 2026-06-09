Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64549CD6E79
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:46:28 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75718.1780998372801262938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DuH8hafk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-beb44f97561so696836166b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780998371; x=1781603171; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2jYUoS5lzW3TYZbINmoXu7fqUbflhxUlVfenqxCYvg4=;
        b=DuH8hafkbbAAa2uqwUww7kFr9atRguxSCB+pBQ+FVd4wtFNw8BvWmYyJSxbG0hTjAa
         qssN4/ePX8Nl7UPm9+JV34dnwQ7jmiP7Rl9NLbYB+oWhp01P/uUFziTmVDY/OoCtJ3gI
         0ir37E6JB3Hhtia4MPJe8cr1/T6V7C2Fexwn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998371; x=1781603171;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jYUoS5lzW3TYZbINmoXu7fqUbflhxUlVfenqxCYvg4=;
        b=b8SU52iMouYs4/iLfklF/0f/2C4CXUVRQMq5m6nBEH8XG0fCUHBKtg+Q/p5DBdPXdb
         mzoSLXOu2ZQ6oJpFj+QSSyw5i3DpNqoxhuP5N9BXMFL6hoWsfPGLH6lx/j9q4GJuzN2B
         wq8VgfAr6AL4Hpv+8dPDyCStUKDuVCV/3UsfgOkNjzBKaV3BvpV8fRize//oUmMnzfsv
         dBjMCUoo1cnrZtxfxvUyh6n+I5uC9jaMsXA4VixiAUMqlrE4BgjeZBmoApTzSuSd2AdA
         KIrM22Wbrrpc1lvK9+mG8V0kN2//jefMZfxLce+qc6EMFO6zbAW8kTDjhtZrOg0rP+3t
         Z4og==
X-Forwarded-Encrypted: i=1; AFNElJ9mgNwpxW10tJmfMyf9XVW5JAMQ0Yg0nuMdPFXaRh8b1G5n3OACqZOfAO4nGEDYdnYJcLhLoIiD68MsIa4KrgiKNQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywdhg8GqnVi12+9UciU4TK9oAUJuKswpiMtrCWoY9FBx3R467aa
	7NzFukhgk3PWHkfkG27NGacPEi9FZR3xsLBl0M9HSB35JbZuZKGO9DAwtr9kWSHPsKU=
X-Gm-Gg: Acq92OE7nTmlL1M+0EIKS0jARlTz0+8LGGFz74MI+SR99d0rwmq1ip6oE1UPo8p+tYA
	keJNoe83AVnN3WmSKzIoFSW8UZbNlcAOVWae68YmX1IOpa7wcfafA7qhonVTpbcub5lqzRjH6Ph
	i1SbDhpwkKDJW1lJX22epmJVrD2VjcoSXjTFPBoSj9GPqwR+IsWIuSz6I6mdeIuPde6YS/jbN1u
	FI8rYpjkC/ZzrrNzv2ADrxz3mqpU+/G0WTyt6iJsx+DBNvIAXQ7nsQcblRXYXOYFVCLD3Q77AXX
	uEi1MNAF07LWMqDHvr5d8o/avuItEvP9L0RE1B7ppBZUIa6WDQbO9n4VqqhKWGtGkhCNtIU8vxv
	x9X+lnMDWj/AlXSPNgWk4zw9dx08BsxfEJ8yjaJej3Su2mco7CZB4cwnZI0g6iBEkQYVPpx7v0J
	qLZ8ap1urnPj/1MpoUnXzFJQnDG93GNqXV9oMWm5cH0YF2LczYxXeOnn0ZqVilccBrGVZVyK7M2
	pE66B/GLLRpPwPHjWYY9N3pqZU=
X-Received: by 2002:a17:907:6d24:b0:bd4:f3e5:b0f6 with SMTP id a640c23a62f3a-bf37234be28mr945243166b.28.1780998371134;
        Tue, 09 Jun 2026 02:46:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1? ([2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851d7bsm8283531a12.14.2026.06.09.02.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:46:10 -0700 (PDT)
Message-ID: <a5e0dca3e1eba8b86203fa63ba0c6bc7ce228a21.camel@linuxfoundation.org>
Subject: Re: [OE-core] insane.bbclass: add missing-srcrev QA check for SCM
 URIs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sai Sneha <saisneha196@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org, corentin.guillevic@smile.fr, 
	martin@geanix.com, paul@pbarker.dev, mathieu.dubois-briand@bootlin.com
Date: Tue, 09 Jun 2026 10:46:09 +0100
In-Reply-To: <CANcU11fqh7bRUo=h9C3woRYnpmwnbUjBkGwpbhs1QV4rhnm4Cw@mail.gmail.com>
References: <20260602062940.3107241-1-saisneha196@gmail.com>
	 <20260602062940.3107241-4-saisneha196@gmail.com>
	 <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
	 <18B61AC5A22983D6.29982@lists.openembedded.org>
	 <CANcU11dYfjDYfDq152H-Yanv3gJ__b=dUewq+sKL=hHKrisQvw@mail.gmail.com>
	 <80ef3660a609e1f080a6ec80872674cbcadb87c0.camel@linuxfoundation.org>
	 <CANcU11fqh7bRUo=h9C3woRYnpmwnbUjBkGwpbhs1QV4rhnm4Cw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 09:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238285

On Tue, 2026-06-09 at 15:13 +0530, Sai Sneha wrote:
> Hi Richard,
>=20
> That makes much more sense, thank you. Setting=20
> BB_FETCH_REQUIRE_DETERMINISM as a per-layer flag in OE-core and=20
> having BitBake enforce it is a cleaner approach than catching=20
> FetchError in setup_revisions().
>=20
> could you please point me to where in BitBake the network access
> would=20
> be triggered so I know the right place to check this flag? I=20
> believe it would be in latest_revision() or srcrev_internal_helper(),
> but I want to confirm before implementing.

Thinking more about this, does:

BB_NO_NETWORK:layer-core =3D "1"

already do what we need?

Cheers,

Richard

