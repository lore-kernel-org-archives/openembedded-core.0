Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03F6FF885A
	for <webhook@archiver.kernel.org>; Sun,  3 May 2026 07:21:16 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19633.1777792866326985962
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2026 00:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RKWW3Wx6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so19537505e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2026 00:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777792865; x=1778397665; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=08g3biCykL7ZqVVdWZWshyAiDVHjEivvS1d9JUFT4TI=;
        b=RKWW3Wx6tTYzBdXnaJh5P+39AKlBJzWDR8fgCpdXXJ6NihkFQjqPi4zVyRhWMEYOED
         Z5ho1lqZpF5r+8DW0bpv5zkqkNRNACHP4M+CU5+4eaDFqT1MPPy26C+btmON5YK0ZINp
         Zx7WO7GgSKq87BFbQi+T6NuzEYhv41W7wO5Gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777792865; x=1778397665;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08g3biCykL7ZqVVdWZWshyAiDVHjEivvS1d9JUFT4TI=;
        b=jbnxaLgfQNH9KC+8gT7UmeXc+uCPBe5qmsAxfT6dZcxW1G5uZdhL++aKdflpXKPloA
         bBONjQhbnIJFKBVkPnRvplM4ZSGFGG5F6m6jhjsM/lOTS2fl/CQLH0ZHfAL1v+mg1s1B
         ruWNSwRHrHAoHgUk4rMnXfrmDxYCkw/CQMi2Ow2vmRiI2HgJkxm93z+3cigxBfcmBwsV
         K4f+XZ3+PD1NoBmq+mjajlFLxsGs/4Zj22AKXIZWH4QkEWClP3Tbqs7AxlgD9XUN8hpa
         oBAc8Bz+UCClTXA4alKtHr0cGx+i0Pyk7ojnxL3t1ZjyXjvsvH+yTG4MOcB+eJOESCzK
         MCIg==
X-Gm-Message-State: AOJu0YwLsXkeiy61lMgunP+KyL7JNFJm0ObZaNQ/RIYc7aS3it6ZUcwq
	5M59fPg6MAdFt+pAM36jl1SzTISPe/fu5JWgKp1XFv/5B55aASeHaqWJAKhZVSZmkXGZkt0fuL0
	eC3vul46QJghGW6LLyIBVFAo5KBigpesOcy4pnDqf3OL5Tex9AEJcOm1Lk94qf/RrLJahu3B7hW
	E=
X-Gm-Gg: AeBDiet52/QQMixv/RJR7c2V/jQ1+kxrkjnpYXtaNEqbFuFD+1kFbYjwgNwK91Vs7Sl
	Us4hG9sE+fDIqQDQRA0IO/SQuhaU9f+hSdC1FUbVGDOrW2AZ6gI4CaoTLQ7Ze43jaMmma7ShZFU
	vzYi1ZFVIby7I2ZPDFCMccpQ0xR67P7iFxf0vYhkZfHb0oy8SGSXoFgxRjSjaowTDQJwMQgG/4Y
	eqKfg4kv0H+zS4Q5Zi8GZcCzlbNN2RilIq6/jwSY6xpz2Ov3V0rd5exPLX2UJiwZMrXPC5P9kjJ
	5VUHWQrjkO4wTSANHXL9ZdQvE0mHUlHFmQZoZ+KA/rVmKEknNuZhDwSWoYOziolGfBAU1OYhj6T
	ogCfeotWEWQUyFJviAjmGUKB6jv9tlCq1J4FIST+CoArPkCzMgXqWZ8NNzYhKURsZCzmWs/JP3V
	mYJC3U0VWvlKiaSq5vl7G4iddpFwv44zWC89bUbsQKtPeUmJKcfs5PbFtIY6QCarrNTor1GIKzA
	iYBoF6zFUx9klcZyZrd3GRR
X-Received: by 2002:a05:600c:4e46:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-48a970b36eemr90855465e9.6.1777792864554;
        Sun, 03 May 2026 00:21:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ca9e:55c7:784:99bc? ([2001:8b0:aba:5f3c:ca9e:55c7:784:99bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fe9317fsm51164695e9.5.2026.05.03.00.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 00:21:03 -0700 (PDT)
Message-ID: <894044565ab68e30c31aae1eadff7e5d1dd6f762.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 61/62] wireless-regdb: upgrade 2026.02.04 ->
 2026.03.18
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 03 May 2026 08:21:01 +0100
In-Reply-To: <CADySD0FagR_SEZBMvJSHTNJR9DxB08XkhVkJ0+RMAvYmODwShg@mail.gmail.com>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
	 <20260502162929.1377831-61-richard.purdie@linuxfoundation.org>
	 <CADySD0FagR_SEZBMvJSHTNJR9DxB08XkhVkJ0+RMAvYmODwShg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 May 2026 07:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236429

On Sun, 2026-05-03 at 10:56 +1200, Ankur Tyagi wrote:
> On Sun, May 3, 2026 at 4:31=E2=80=AFAM Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0...ireless-regdb_2026.02.04.bb =3D> wireless-regdb_2026.03.18.bb}=
 | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > =C2=A0rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02=
.04.bb =3D> wireless-regdb_2026.03.18.bb} (94%)
> >=20
> > diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.=
04.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
> > similarity index 94%
> > rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.0=
4.bb
> > rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.=
bb
> > index 2f7c8160434..a70e9dd0dae 100644
> > --- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
> > +++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
> > @@ -5,7 +5,7 @@ LICENSE =3D "ISC"
> > =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D07c4f6dea3845b02a18dc0=
0c8c87699c"
> >=20
> > =C2=A0SRC_URI =3D "https://www.kernel.org/pub/software/network/${BPN}/$=
{BP}.tar.xz"
> > -SRC_URI[sha256sum] =3D "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039=
243ad121cf5aabf6c6"
> > +SRC_URI[sha256sum] =3D "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b=
5a3e7b7e98528945ac"
>=20
> We already have this submitted via
> https://lists.openembedded.org/g/openembedded-core/message/236182

Thanks, I''l take that in preference.

Cheers,

Richard

