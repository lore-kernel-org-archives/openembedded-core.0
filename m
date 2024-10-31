Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFF1D74958
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 12:55:57 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.11792.1730379349553838047
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 05:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZCM+Rql5;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a99cc265e0aso133493266b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 05:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730379348; x=1730984148; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cQxBdw4saN9X8g9pjVeAzGJXaf0m88aECYSaabrLIIc=;
        b=ZCM+Rql5ikkCd1KzbJRvWMW9XScyd8P3wsAfPoy1BNjHbW0+zQU/wyA82NHGqvwNOy
         NQqUDmIYH2U/vM4mrR91YNgVmtqf95oEsmnZH/hXSdY4r1Pbzn9iBgxbIGTd63gwQbhg
         +QuGyB5XfsYC6KUhuW93bxztfmSadOgZTQpMacQe1v3nbztGg5ZM7o86qPhizsJyDTFc
         BD9QqSXLm3kTR2e2JbWRzlq0ZCKe3JxGxQcxyJ+0pnaedP7DQeRUP0YmQVHXzFAgjfr1
         2PNnMtm7wFz6qrwyTN+WHjhq4fqajNlY8z/4LkaJJfNIfS4Mzqkilfe1l8oPOv9NuEx6
         IQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730379348; x=1730984148;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cQxBdw4saN9X8g9pjVeAzGJXaf0m88aECYSaabrLIIc=;
        b=lHCKxq6BVsQcKJZFKGqrz/tILtUmyAHX/DnC3o3dR6k5BuRBXbY35eqvz4uqMaHxZz
         b5iojCl4clAaAQ1GARZyK3k6ouhS7vD+rWOQH7/tMo4vuvyJ+61Ejn8+BjZuGZZKZQYQ
         ZiHKk9GPXpCUz0zljrRzDlz6LdQk00PR3ZnGbJC6v/B7E5gYCwnILO/aPzaydpZ/ewuT
         iAjQuxmkkMHSqzbh1Aw7oIWdQjfYoDlPzz4Ht896iroE/y75J9A39h7werXEV/Xf3wOF
         j22KAQwsL9ONPnqh0u7x73aCLBWmT7tNO1yLtr4SdJSbc6gtYPpM2w98e+S8g+HRLEm/
         KbCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeQC9Fdy0PXH+JWDXxWupLkC5IzHTgy3Aft8iArOrdtkj7BMVGNqtJ42/neaVU10rSLtYyXqBUTKGJmLyQX8/4Ag==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxReOS9h1b2XE7KQBokXLSJdG+qKUfG9QxFvxiBi++XEiKdaxNa
	aUc9h8/9j/8aphmmRzydlVo/KrMRgksezEXAbSdwpMKV7kKmEQAZ
X-Google-Smtp-Source: AGHT+IFWt32C61MVO6eXoSbygxhK5J7LsmpjOFqQQb36eM29t4Jq50YASKMZBinVwkrBmuTsSvHfeQ==
X-Received: by 2002:a17:907:6d0d:b0:a9a:147d:fe9c with SMTP id a640c23a62f3a-a9de61d5d59mr1933827266b.43.1730379347653;
        Thu, 31 Oct 2024 05:55:47 -0700 (PDT)
Received: from [10.9.136.49] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56494119sm66547866b.27.2024.10.31.05.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:55:47 -0700 (PDT)
Message-ID: <6b0277ee8382af537edbdc1afa611e4359267f60.camel@gmail.com>
Subject: Re: [OE-core] [RFC][master][PATCH] populate_sdk_base: Add
 SDKIMAGE_INSTALL_COMPLEMENTARY_HARD_DEPENDS_ONLY
From: claus.stovgaard@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
Date: Thu, 31 Oct 2024 13:55:46 +0100
In-Reply-To: <CANNYZj-9acLWa+1LRmnwOfcFSjBBygqaMz1nT6O_8PJ9-uhHOw@mail.gmail.com>
References: <20240927132040.200122-1-claus.stovgaard@gmail.com>
	 <c3155a29aa855283f3396582c989263d93ded4f3.camel@linuxfoundation.org>
	 <2456863182484d2b15f75fe0f67a3473240a3fe6.camel@gmail.com>
	 <CANNYZj-Wna0xVjvoX0hJwd9Kg_=yaVB+dNLecBDsjpSayo1zVg@mail.gmail.com>
	 <2b4615fffa3c131e9795255c4884d6b9eea98c86.camel@gmail.com>
	 <CANNYZj-LcppbLy4bsHH6oRJeK6pPVXgVB_oq1UPik9B5wO2oGg@mail.gmail.com>
	 <41e5d235b97218e65737069ea5f541ae2114dbc9.camel@gmail.com>
	 <CANNYZj_-phKSj0smbkC=n5UVgDzmB5zxoOsOSnVhA=unGaJzRg@mail.gmail.com>
	 <84989466800399ebfc139396b659573edb7570c5.camel@gmail.com>
	 <CANNYZj-9acLWa+1LRmnwOfcFSjBBygqaMz1nT6O_8PJ9-uhHOw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 12:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206583

On Sat, 2024-10-12 at 14:18 +0200, Alexander Kanavin wrote:
> On Sat, 12 Oct 2024 at 11:41, <claus.stovgaard@gmail.com> wrote:
> > I am working more with it, and I think there might be a solution in
> > sight. Though if you have any ideas please share.
>=20
> I think you need to run it through package name translation function,
> the same one that package.bbclass is using to do 'debian-style
> library
> package renaming'. I can't remember what it's called though.
>=20
> Alex

Hi Alex and others reading this thread.

I ended up thinking my direction with using the RECOMMENDS was wrong.
When I was working with the problem, I figured out that my problem was
that my dummy package does not correctly fits with the automatically
runtime dependency part of Yocto, as there is no shlibdeps or pcdeps,
and depchains only handle dev and dbg packages.

So my solution ended up being a base class, just copying from DEPENDS
to RDEPENDS.

See
https://github.com/frosteyes/yocto-master/blob/fe/sdk_example/meta-fe/class=
es/dummy-package.bbclass


For specfic packages like sqlite3 and cli11 I handle it before
inheriting the class. Someething like

<snip>
# sqlite3 needs specific handling, as it package the dev package
# as libsqlite3-dev and not sqlite3-dev
DEPENDS:remove =3D "sqlite3"
RDEPENDS:${PN} +=3D "libsqlite3"

# cli11 is header only, meaning there is no library to depend on. This
# means that the package itself does not depend on cli11, and by that
# cli11 is not automatically added to RDEPENDS so only add dev
# package runtime dependency.
DEPENDS:remove =3D "cli11"
RDEPENDS:${PN}-dev +=3D "cli11-dev"

inherit dummy-package
</snip>

I was looking into some kind of verification that a dev package exist.
But it does not work on the parsing step.

Anyone knows of a solution for this?

# Verify a -dev package exist, or skip and warn that it need special
handling
	recipename =3D oe.packagedata.recipename(dep + '-dev', d)
        if not recipename:
		bb.warn("dummy-package: %s (Skipping DEPENDS: %s -
needs customs handling, no %s-dev exist)" % (pn, dep, dep) )
            continue


Maybe it would be better to move the function from an anonymous
function on parsing, to a function before the packaging task or
similar. If we can verify that a correct dev package exist.

Any inputs is welcome.

Also just to share for others to use.

/Claus

