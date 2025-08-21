Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D247ECA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 05:20:18 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.2347.1755753613667860859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 22:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VjhiwhHV;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e9513a4b346so70395276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 22:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755753613; x=1756358413; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=244jqRqbhCxUc5gp1MnpwY5nW7f/iVPsTwnwTyMVv84=;
        b=VjhiwhHVf3nwdwusGYKp5P98dSehYyAHXGhqqVMEy0U+WoUhsbj0E0Slz9Lpo3beXw
         uaKfVUg6cDHZofsXAmX4K5kUBy+a+2ZSzy5PvuB9iJuu7GxZF6Es3WjDVPonaN5yY9lj
         ftfMNyH3g+Hoj9IKppZpv9/btntZa6jVb3ETZFuL4zus++pitSilOSPjmbFzYHns3Qbp
         YP/lYExUlcvcJifU+DqZNv2vlLbGqosY3pUEBzqZ07cDbwIBNFfE6kV7vRLM6WsN0HMe
         H9xtsxTTSKTowfbFusqtgHdhQvN2Hcm2H9IWUyjz921jdA9+9CkqIdOVCjTwR1fp5wmd
         HZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755753613; x=1756358413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=244jqRqbhCxUc5gp1MnpwY5nW7f/iVPsTwnwTyMVv84=;
        b=uyhwUX0uyldpncph33xAzQLAgp34QJ0fhfdwRhduJKN9yL55ypSMhKwVv64AH0mGYO
         CrhsdeTXQCUmv5WbbpYOgZdzW/2N/995O7yc+/gTTl9i5qzu7jT8SPdfU0z1qJxj/s1x
         Qs0iBNvJCK7uR2vftBpPxWwisSsMtVwCVMkxzYPeo9/L3K7mt4sZeXS47h43Bj/o68TW
         ud/6XS+HcNzEyenB2JFHR+A1l5dR0BiPwtdz+jPh4yyrfQp0/0gcQ+TwNSWVoLdSGVyH
         CjLYzysvsLngqAaPxWypxHmUM7L4bNX8br1FG4Zoc4OcnYmoXVwYfKiBRRekKkdES1GD
         xrWQ==
X-Gm-Message-State: AOJu0YyzFhqLRbAUPZF+p3a1GK7Xd30GQJiF/kVaHbKMmyVqJBabydPS
	24n9PzhIqhmHmkOW916ehoHjgx7rlqh2l28ZWziJvRDpFEMOAzalWkrZenJOGzsRwKVgbXFhnge
	shjXrJIZrNxv8ts80uDqMD0Creeu1WmM=
X-Gm-Gg: ASbGncuwJywzaxt9PV4FdaCEIK2HNRaYRmKABYwca4GxuZpYNg5+ZhCYYgxlGvOr8jh
	3E0F66BxDzHzoGNZu429H37pEO4qoZTg2hmvButVSj8QSF5JEt+dgyzSGMWHh/D13GzXMWDEO05
	EDWvLlrHqX3v9uPYHARWC+3XwIsDrlaX7lJC51N4RuEdV3YLD9p8k7yOqI/tI6c/e8Zpligk4Ch
	elQ/ws=
X-Google-Smtp-Source: AGHT+IHbH1atDdQXJMjRuz9L8asMegsXqi2ycIEoAVHGTY8mJQkuWXHsmXif4OfemqeV6gxaB2zastrjzOZ/jt1d+Fo=
X-Received: by 2002:a05:6902:1894:b0:e93:4b37:f0a5 with SMTP id
 3f1490d57ef6-e950db39fb7mr970669276.7.1755753612658; Wed, 20 Aug 2025
 22:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250821032424.92606-1-Harish.Sadineni@windriver.com> <20250821032424.92606-2-Harish.Sadineni@windriver.com>
In-Reply-To: <20250821032424.92606-2-Harish.Sadineni@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Aug 2025 22:19:45 -0700
X-Gm-Features: Ac12FXwMciF0GsInE092EfvX0SnvfjUoBxLDO9S0h1UNsG12c72Y2X8qR1M7SOI
Message-ID: <CAMKF1soN36csHdCAANQame1Oyus6To6WihYQbdr-3JLWvbfoNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] oeqa/selftest/cases/gcc.py: Increase QEMU
 RAM to 4GB
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 05:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222205

On Wed, Aug 20, 2025 at 8:25=E2=80=AFPM Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> The test pr61599-1.c fails because it requires more than 3GB of RAM.
> This change increases the allocated RAM to 4GB to prevent test failures.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/lib/oeqa/selftest/cases/gcc.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/gcc.py b/meta/lib/oeqa/selftest=
/cases/gcc.py
> index 1bda29a72b..8025c8ac87 100644
> --- a/meta/lib/oeqa/selftest/cases/gcc.py
> +++ b/meta/lib/oeqa/selftest/cases/gcc.py
> @@ -79,7 +79,7 @@ class GccSelfTestBase(OESelftestTestCase, OEPTestResult=
TestCase):
>          bitbake("core-image-minimal")
>
>          # wrap the execution with a qemu instance
> -        with runqemu("core-image-minimal", runqemuparams =3D "nographic"=
) as qemu:
> +        with runqemu("core-image-minimal", runqemuparams =3D "nographic"=
, qemuparams=3D" -m 4096") as qemu:

It will be good to add a comment here, so we dont have to dig in git histor=
y.

>              # validate that SSH is working
>              status, _ =3D qemu.run("uname")
>              self.assertEqual(status, 0)
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222201): https://lists.openembedded.org/g/openembedde=
d-core/message/222201
> Mute This Topic: https://lists.openembedded.org/mt/114812116/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

