Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F7BCDE010
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 15:01:47 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.45799.1727362905797931281
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 08:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NQkfyTZ8;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d0d0aea3cso150706366b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727362904; x=1727967704; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xBDTLaRBE19Dx1/kn/fze9OqqbTM0//dFojb+KdA/QQ=;
        b=NQkfyTZ8XsbbYg2xvsA7M0yQuBCdQf2K23BMbHs11AUlF1pFnA3m4ZDqaw41g+l+fm
         TcRbDrj9rcDzWTIGttRZ3777y1FIBS+xVZDJlAAY1WUmTN2Mlz8kjWuuIR8k05n4Mqhs
         jyLSwwP44guLM/l3k6q5uJxM7a7EOfKwAyq/s3z6Q0HPV11hvp7hi4Cy/9XIIt+W38xO
         TYyMT/i0j6Kzbdp3gImgZUkzdq+wKBgAK/iPyXmGB/ejWq46qZKwTIWi9eeSuWgU0W0s
         0Dig3z50mAGWjdXXUIOO4q1akm1o1syjxeoQfSiGgG9ayeGoFgm6vkDN5H18U5rRzhtb
         Frgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727362904; x=1727967704;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xBDTLaRBE19Dx1/kn/fze9OqqbTM0//dFojb+KdA/QQ=;
        b=rZDQroOWWlAVbC7KdUpLF593CxzVa8IZq/K6JAAwH/NKZRcy0fGgTZQlytu0sFZOJQ
         IB7Qvwn9JKd+Xiryz2NlGY6dFxdkcvekf5vaoxBfqJhMPTqZ1ojqcz+00YuzzbNWBpLV
         NJyiNvkUtpQrkZH36qwGdgJJ6csJKENLS88rNCAuaAhlW27Rg0JcVnQlH9TITYb32mhe
         ksgWzcV6OMilyrDmbEGWL5hEGzUQ4rz04yWWd8rKuYobPBu0DYqao8RoV1/R7iIfUrPI
         ZNdaPqux/njJuDRydQWiysa2Q8o9zpn/gJYkvs+msKZ1xjBfn6fpdK55im8RDaZW2yBq
         iJRg==
X-Gm-Message-State: AOJu0Yy+D9d20SF9/R9Qk/UEa2FW+4FYAGwUVry0DWcREl3uGvpPlTIS
	DBLNHJjrH2NB1IokVBMMUGAs9myF+ElF+qK1/UoZFOBoXiPqqhl4
X-Google-Smtp-Source: AGHT+IHyBDFEir0hZhSZkBfFjUE5yxJCEHASsAqr4xekT2tw5szXg3RBkK78mzvp8nzwNtsTHqPkeg==
X-Received: by 2002:a17:907:36c1:b0:a86:7924:11bd with SMTP id a640c23a62f3a-a93a05fff3amr653830466b.41.1727362903416;
        Thu, 26 Sep 2024 08:01:43 -0700 (PDT)
Received: from [192.168.101.51] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2997507sm6480366b.204.2024.09.26.08.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:01:42 -0700 (PDT)
Message-ID: <1499318433b026e195265907f2b39987bf0c0fcc.camel@gmail.com>
Subject: Re: [OE-core] [master][scarthgap][PATCH] lib/oe/package-manager:
 optimize install_complementary
From: claus.stovgaard@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2024 17:01:41 +0200
In-Reply-To: <CANNYZj-sjrT+a0aWfraw0OZDx-J5wTznYTnZwS9=hAPW_ZLoxQ@mail.gmail.com>
References: <20240926091731.2008047-1-claus.stovgaard@gmail.com>
	 <CANNYZj-sjrT+a0aWfraw0OZDx-J5wTznYTnZwS9=hAPW_ZLoxQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 15:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204989

Hi Alex

Would a better headline be "don't handle empty glob"


Also a small question.

Looking at the getVar code - It seems that it can return None in some
specific situations.

So it might be more clear to do

if globs is None or globs =3D=3D "":
    return

The optimizing part is that the install_complementary normally does.


if globs is None:
    globs =3D ""

if globs is None:
    return


do work, where if glob is empty string, it does not matter.
(Involve creating installed_pkgs file, and process it with oe-pkgdata-
util but with empty glob, so it will never return anything, just spend
time on each line in the file, and create a empty list of packages,
where it will call install of those)


So the change optimize by removing the work on an empty string.

What is your take.

Do you like "don't handle empty glob" as headline, and what do you
prefer

if globs is None or globs =3D=3D "":
    return

vs

if not globs:
    return


/Claus


On Thu, 2024-09-26 at 11:51 +0200, Alexander Kanavin wrote:
> 'optimize install_complementary' really doesn't match what the commit
> contains, please be more specific.
>=20
> Alex
>=20
> On Thu, 26 Sept 2024 at 11:17, Claus Stovgaard via
> lists.openembedded.org
> <claus.stovgaard=3Dgmail.com@lists.openembedded.org> wrote:
> >=20
> > We are rewriting the globs variable, so it can't be None, but
> > rather a
> > string. E.g. the lines above.
> >=20
> > if globs is None:
> > =C2=A0=C2=A0=C2=A0 globs =3D self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY=
')
> >=20
> > As globs is now a string, we need to test for empty string instead
> > of
> > compare with None.
> >=20
> > Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> > ---
> > =C2=A0meta/lib/oe/package_manager/__init__.py | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/lib/oe/package_manager/__init__.py
> > b/meta/lib/oe/package_manager/__init__.py
> > index d3b2317894..1d923c436e 100644
> > --- a/meta/lib/oe/package_manager/__init__.py
> > +++ b/meta/lib/oe/package_manager/__init__.py
> > @@ -365,7 +365,7 @@ class PackageManager(object,
> > metaclass=3DABCMeta):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 for complementary_linguas in
> > (self.d.getVar('IMAGE_LINGUAS_COMPLEMENTARY') or "").split():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 globs +=3D (" " + compl=
ementary_linguas) % lang
> >=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if globs is None:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not globs:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # we need to write the=
 list of installed packages to a
> > file because the
> > --
> > 2.45.2
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#204970):
> > https://lists.openembedded.org/g/openembedded-core/message/204970
> > Mute This Topic:
> > https://lists.openembedded.org/mt/108664320/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20


