Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C45CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 07:16:04 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.59088.1756192554427910242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 00:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gjQoRbwv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so29739805e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 00:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1756192553; x=1756797353; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VxB1RSd53oVW6AIY5S4160HdQYrQA6IWd22sQYWAgMA=;
        b=gjQoRbwvRIPRzI9Fr+k+lYKh1DkBxOcMeXlTPHOTY9t7eZUIWr1V1kNUxPf9XF0Wy8
         rQNsgurg8XPi7BeG6QbHwvWDQFthfbR0y6anJFc/YVRWdZzI6NyQk1EvsPwr4I3Cl4ER
         s4kJnali7WzSXZPKcDyoSmukenFWQxmXbxJCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756192553; x=1756797353;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxB1RSd53oVW6AIY5S4160HdQYrQA6IWd22sQYWAgMA=;
        b=ExRAY9b+gRYYbCWab3lArU+waKuivQNAGoGCFcOkO3kUqB/dsEeXsCl/4zSUV9JlZd
         fUQWMxBtqH8OBgxI7TSN3aMSri+ofDndstt+AMqQ+mE0O+Tc0lB0fqC4/ysD5e8DjJmC
         k4yeArG4jDg4Xcc3y9glQXPfDbRCi8x9XRZWoxh+dt8ZIZ7HF1EP1YkIVXJfgGttyswy
         Lp1t/ig0GdGAToerEyyxJZBcCHzkYWgbYBre/hnalQr8xBy9L9ocInijP5fon08noijJ
         aV44L9znoScAHv8nr28NprOwfVN9LKiXfvFRBwi71zfi44zNqw/wiMwbf06qUFhcuDy7
         ekLw==
X-Gm-Message-State: AOJu0YzFxorrFVoypmE4vPksg6OMZgezOrX026k1M924BKGjS/HffUfJ
	1opJlGJUevqySm2rQxUfOJl9g4m7VQryUe3ih95KudNNDs9k4WWGWcNclXOO0dr/wak=
X-Gm-Gg: ASbGncvnwK3FU+g00p2EA7UPKxiKjPG5+D2neePUqdcLwLuCWJkIzUmOyB9E1W3UT2B
	KpuKSaYdkjMdMP1YUrQ/3C+9Rzgh0vtoqhi9tOqL3LDorTrfRdGKy4Kb9XM5pN8OqiYDuzVjPfr
	R2ZrNbDqie/1C/OptrY5zQ6ynIcV05HX4L38ubnjhUGMTO2C1WbCtsMcWjVUqNfDLJBKHf9QoJy
	0A1HwPh6tVaDgXli89YvLIkxgrUryxaxH5HAIhWJRuPRMen8nSsMJXN3U2KnNsM2W8jOSBDVOV/
	8YPHk1IhRmgJZM6M7MHKSb+pDX4l6VqnZDZafyac4j9IZep3/ARrzmAt5jpiC2yltqZwd+be7w8
	xOsTZblY6j2SH8KwW48fe4KApecE9EBUGQ9Gc4OKBlvoQNFPHp+F3ok7tTzoABcQBrD4tLgICwU
	yN/ZM+799Emms=
X-Google-Smtp-Source: AGHT+IEOdRMSty2TRbj0EoprrtvRPO0VJeLLGjSrPx/smzhdHJ7x0u9RhojwJMVHdBCGeY2WrdCYBw==
X-Received: by 2002:a05:600c:6209:b0:456:161c:3d77 with SMTP id 5b1f17b1804b1-45b56e7b0abmr145134345e9.16.1756192552749;
        Tue, 26 Aug 2025 00:15:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f254:a54d:7a5d:55ab? ([2001:8b0:aba:5f3c:f254:a54d:7a5d:55ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ca6240b4f9sm5254466f8f.15.2025.08.26.00.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 00:15:51 -0700 (PDT)
Message-ID: <5fabf7da2300b7efccd2f1403e7d4eb53e22d20b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/4] kernel-yocto: -stable and new reference
 kernel
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Mathieu Dubois-Briand
	 <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2025 08:15:50 +0100
In-Reply-To: <CADkTA4MVTtjd0bRyVHhS8AiWmN+zw7bj2QZcgoUEhcV9zhHVVQ@mail.gmail.com>
References: <cover.1755784780.git.bruce.ashfield@gmail.com>
	 <DC92RWVBN7V4.30RLT0SCEWDPC@bootlin.com>
	 <CADkTA4MVTtjd0bRyVHhS8AiWmN+zw7bj2QZcgoUEhcV9zhHVVQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 07:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222435

On Mon, 2025-08-25 at 23:03 -0300, Bruce Ashfield wrote:
>=20
>=20
> On Fri, Aug 22, 2025 at 12:52=E2=80=AFPM Mathieu Dubois-Briand <mathieu.d=
ubois-briand@bootlin.com> wrote:
> > On Thu Aug 21, 2025 at 4:03 PM CEST, Bruce Ashfield via lists.openembed=
ded.org wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >=20
> > > Richard,
> > >=20
> > > Here's the next set of updates to the linux-yocto kernel.
> > >=20
> > > The plan is to introduce 6.16 as the latest reference kernel, and kee=
p
> > > 6.12 around (since it is a LTS).
> > >=20
> > > This isn't ready to be the default for builds, but it has passed my
> > > core-iamge-kernel-dev testing, so I wanted to make the recipes availa=
ble
> > > as visibility to where we are headed for the release (plus, I'm out o=
f
> > > the office on holidays until the first week of September, so making i=
t
> > > the default would be a bad idea from me being able to support issues)=
.
> > >=20
> >=20
> > Hi Bruce,
> >=20
> > Thanks for the series.
> >=20
> > I understand this isn't fully ready, but I did launch a full build
> > anyway: most builders succeed, we just have one warning on config
> > fragments:
> >=20
> > WARNING: linux-yocto-6.16.2+git-r0 do_kernel_configcheck: [kernel confi=
g]: specified values did not make it into the kernel's final configuration:
> > ...
> > [INFO]: config 'CONFIG_CRYPTO_LIB_CHACHA' was set, but it wasn't assign=
able, check (parent) dependencies
> > ...
> > [INFO]: config 'CONFIG_CRYPTO_CHACHA20_NEON' was set, but it wasn't ass=
ignable, check (parent) dependencies
> > ...
> > [INFO]: the following symbols were not found in the active configuratio=
n:
> > =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_SHA2_ARM_CE
> > =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_CRC32_ARM_CE
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/2248
> >=20
>=20
> I always find it odd that I can't click on any of the AB tabs (in the lin=
k you sent) and see what the MACHINE value is for that build.
>=20
> I looked at the writeconfig step of the build and it looks to be qemuarm.=
 Which is odd, since I'm not seeing the same warning for that here.
>=20
> When I'm back from holidays next week, I'll have a closer look.

FWIW if you look for the "Write config" step (step 10 in the above
link) and expand that, it says MACHINE =3D "qemuarm".

It is only hitting that build as it is a nodistro build and hence has a
floating kernel version.

I somehow got the patches the wrong way around and merged the ones with
the warning but we'll manage with that for now until you're back.

Cheers,

Richard



