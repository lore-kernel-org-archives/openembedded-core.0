Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57BA4CDE039
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 20:41:49 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.54332.1727383302255255383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 13:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jTE2KXOT;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5367ae52a01so1798873e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 13:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727383300; x=1727988100; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u86sLrmM7SCMEOZJe1WiKspZkwxi8cFZJgqxkAgeRUE=;
        b=jTE2KXOTuWgfAr6OPv7j5kh46BVN0cfkphzkDxqXyMar2X4p+F5Kqpa7mdDFk0jA4Y
         eTwN/fMbPnN2HlMkJmnc05xExwsKOsP5ssgmXsPvYrIMJK05o+QQB+gHhAf0pcdtJTEv
         swGrwZ5kzjvR5ZexHUQEnz0s7UFP/D8gUPKCzHC+UCeoyA4+eC8zFbGlZHBKCK4ACz5z
         oEwuHPYEY6bENiQd1NYR5rb6tETEVCSwdQQvHvN9nzt2oI/SG09GlhA1Or/I24sCktb4
         YgMj6J9e2XHNDgYbXsG1TDGWgbENyIsjGOoAguwCdBbOMaGbaJK7UsO9tSfZ5ufJ/fhI
         3dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727383300; x=1727988100;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u86sLrmM7SCMEOZJe1WiKspZkwxi8cFZJgqxkAgeRUE=;
        b=hRv7SIpcA8u4OYPcKv0iSKKUoVnVp2twRMZb56+/LENclbF94sbFQJYkGUZBy/KLJJ
         CvwkOaM9rNDZZnMSbg8Gu6ukJ6B9Uj1fWsTPUtOhdYHCgTUfADZDsS6H7GiCOfMYt4Wh
         tB0B5mWwd2BlOhdoQ0UX042RU3SUjB41EVUt6kFlHwfWzFCbhiY7AALeeytsCIJX2/SZ
         ZqciyxU8pEgGxrormRjP/Qlo3PRywBlBvRLNtJZPGElB70xMti9br4xnsYHaz9HguMKa
         J4oyCtdGtqF0QwUn9FqhtVfyWPqvK3bWKQ5fmmeiX/772YzqPyuyOGxGl+shxJXy6oer
         tBLg==
X-Gm-Message-State: AOJu0YxXwMKv8NRSR9poScka4xASJv7dCZ0kvb69Mjy7Sfu5N0NK3hOj
	oNcSMGEYrA++JYGZPXYV47VeAaM8BL7iDm3zUTAT66LjP3qviFpP
X-Google-Smtp-Source: AGHT+IFKBT0f7ZL8yIMA4Jo+T8La+VV5QAv0/qaKRrZvlQO5tpvhYv2dedx3VYWe5xHJbX20qQMWtw==
X-Received: by 2002:a05:6512:2812:b0:530:dab8:7dde with SMTP id 2adb3069b0e04-5389fc47f7fmr567584e87.34.1727383299961;
        Thu, 26 Sep 2024 13:41:39 -0700 (PDT)
Received: from [192.168.1.70] (0x57346aa5.static.cust.fastspeed.dk. [87.52.106.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2777baasm36724866b.25.2024.09.26.13.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 13:41:39 -0700 (PDT)
Message-ID: <021895e280ecc4444b06ce55abc8aaa436f4cc4f.camel@gmail.com>
Subject: Re: [OE-core] [master][scarthgap][PATCH] lib/oe/package-manager:
 optimize install_complementary
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2024 22:41:38 +0200
In-Reply-To: <CANNYZj_vu2A9WOObG9ZG2P7O-=h9tnZaJ19+d6F5qDW0g9UJtg@mail.gmail.com>
References: <20240926091731.2008047-1-claus.stovgaard@gmail.com>
	 <CANNYZj-sjrT+a0aWfraw0OZDx-J5wTznYTnZwS9=hAPW_ZLoxQ@mail.gmail.com>
	 <1499318433b026e195265907f2b39987bf0c0fcc.camel@gmail.com>
	 <CANNYZj_vu2A9WOObG9ZG2P7O-=h9tnZaJ19+d6F5qDW0g9UJtg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 20:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204999

Hi

Se version 2 of the patch.

/Claus

On Thu, 2024-09-26 at 17:12 +0200, Alexander Kanavin wrote:
> Hello,
>=20
> the headline should be 'return early from install_complementary if
> glob is either None or an empty string'.
>=20
> I prefer a shorter condition.
>=20
> Alex
>=20
> On Thu, 26 Sept 2024 at 17:01, <claus.stovgaard@gmail.com> wrote:
> >=20
> > Hi Alex
> >=20
> > Would a better headline be "don't handle empty glob"
> >=20
> >=20
> > Also a small question.
> >=20
> > Looking at the getVar code - It seems that it can return None in
> > some
> > specific situations.
> >=20
> > So it might be more clear to do
> >=20
> > if globs is None or globs =3D=3D "":
> > =C2=A0=C2=A0=C2=A0 return
> >=20
> > The optimizing part is that the install_complementary normally
> > does.
> >=20
> >=20
> > if globs is None:
> > =C2=A0=C2=A0=C2=A0 globs =3D ""
> >=20
> > if globs is None:
> > =C2=A0=C2=A0=C2=A0 return
> >=20
> >=20
> > do work, where if glob is empty string, it does not matter.
> > (Involve creating installed_pkgs file, and process it with oe-
> > pkgdata-
> > util but with empty glob, so it will never return anything, just
> > spend
> > time on each line in the file, and create a empty list of packages,
> > where it will call install of those)
> >=20
> >=20
> > So the change optimize by removing the work on an empty string.
> >=20
> > What is your take.
> >=20
> > Do you like "don't handle empty glob" as headline, and what do you
> > prefer
> >=20
> > if globs is None or globs =3D=3D "":
> > =C2=A0=C2=A0=C2=A0 return
> >=20
> > vs
> >=20
> > if not globs:
> > =C2=A0=C2=A0=C2=A0 return
> >=20
> >=20
> > /Claus
> >=20
> >=20
> > On Thu, 2024-09-26 at 11:51 +0200, Alexander Kanavin wrote:
> > > 'optimize install_complementary' really doesn't match what the
> > > commit
> > > contains, please be more specific.
> > >=20
> > > Alex
> > >=20
> > > On Thu, 26 Sept 2024 at 11:17, Claus Stovgaard via
> > > lists.openembedded.org
> > > <claus.stovgaard=3Dgmail.com@lists.openembedded.org> wrote:
> > > >=20
> > > > We are rewriting the globs variable, so it can't be None, but
> > > > rather a
> > > > string. E.g. the lines above.
> > > >=20
> > > > if globs is None:
> > > > =C2=A0=C2=A0=C2=A0 globs =3D self.d.getVar('IMAGE_INSTALL_COMPLEMEN=
TARY')
> > > >=20
> > > > As globs is now a string, we need to test for empty string
> > > > instead
> > > > of
> > > > compare with None.
> > > >=20
> > > > Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> > > > ---
> > > > =C2=A0meta/lib/oe/package_manager/__init__.py | 2 +-
> > > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/meta/lib/oe/package_manager/__init__.py
> > > > b/meta/lib/oe/package_manager/__init__.py
> > > > index d3b2317894..1d923c436e 100644
> > > > --- a/meta/lib/oe/package_manager/__init__.py
> > > > +++ b/meta/lib/oe/package_manager/__init__.py
> > > > @@ -365,7 +365,7 @@ class PackageManager(object,
> > > > metaclass=3DABCMeta):
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for complementary_linguas in
> > > > (self.d.getVar('IMAGE_LINGUAS_COMPLEMENTARY') or "").split():
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 globs +=3D (" " + co=
mplementary_linguas) %
> > > > lang
> > > >=20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if globs is None:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not globs:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # we need to write=
 the list of installed packages to a
> > > > file because the
> > > > --
> > > > 2.45.2
> > > >=20
> > > >=20
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#204970):
> > > > https://lists.openembedded.org/g/openembedded-core/message/204970
> > > > Mute This Topic:
> > > > https://lists.openembedded.org/mt/108664320/1686489
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe:
> > > > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > > > alex.kanavin@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >=20
> >=20


