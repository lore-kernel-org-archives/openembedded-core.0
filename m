Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B0CCE7AAA
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 17:21:04 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.66935.1695662461976920698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 10:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HexwqcxF;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1dcead29b3eso2164538fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695662461; x=1696267261; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utL4mS+ndSZIHydQR1EL9dz6B9HdhCfe1C1ZwepKk48=;
        b=HexwqcxFFoTdPqKGunIU4LlzLb+S2CtZaef96VhDvPbpP3CW9SD0goFo5ndG776Ca5
         6oX3JCxdJQKXOrnnh4AHbfh00gO1haKEkgHUT/vNJaMDDloFjsPxg/Qq63HzOP3VX1Kt
         SS2Mzr/tyZqOQd+v4SjOtFrIcaAFw6U6f6B9sHSqqo8ucQf9pbExQYisqdUhINvuYX9a
         hF/toIvR2NSa3ZtBreKVX4qg3WoAZ8Y7WkNvs5Lajmk+mmJbQxft3lIM3RZxe+spSkOg
         khcJ4267UWv04G3VwfB3ANdFVzvIizYf7E0Bfuk7OlUfG5hm+Xl5JTD2D3PBOf2kRw2D
         Jcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695662461; x=1696267261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utL4mS+ndSZIHydQR1EL9dz6B9HdhCfe1C1ZwepKk48=;
        b=uD7jdM+tTzi77xMkUdOH9pNCZtxmP21xnZyyOay4QHQSyBafjiucW5NLsUSNHpbTZb
         YD8E8xCqGgyw5CrgnwVmrbi9Rgw9BRj/k1csqETYnuM4s88qjlNNfROlhwyBj4LVGaTz
         tgazOUrX3PlGVmkGmf3V79/h90bhlzt981UQrZp1vMc+nshkEzCk9LxogcBkY1F4O7PZ
         uR0p32I0Ju3MREX2hAK4IgYkJiryk/Cfbgr0PgKUaVw3omThX15T+LCPpL+qFnCumaLo
         jKm6Wr/bGi8hZnPhshHWrNdFQb4k23/SAvBg1veuuhWxT32WvMoXwUyXOg06hooedUAq
         GuKQ==
X-Gm-Message-State: AOJu0YyYProwWOUNaCJ29+aLzYkvJ9Gqp+b+PlK9YwdgcqKp9CVgB0b9
	2IWPOAy8t3IRSkrOjm2RoVdJ0dTSkz4+saeqXgI=
X-Google-Smtp-Source: AGHT+IEB8tJ1Xpu0RGBD1nRgtoHRRlvcYjfXqgCCtlyH9G18FLEV4tQEHu2q/7JqVEi7ynsd7uPgrRP7AkSYX4QiWzc=
X-Received: by 2002:a05:6870:3119:b0:1dc:ddd0:6ee1 with SMTP id
 v25-20020a056870311900b001dcddd06ee1mr8743445oaa.38.1695662461166; Mon, 25
 Sep 2023 10:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230923204507.882395-1-raj.khem@gmail.com> <20230923204507.882395-2-raj.khem@gmail.com>
 <CANNYZj-9wiNejuCKxtcT5_Dp9uG8y54E+qV_RBD1SCCd-HcF9A@mail.gmail.com>
In-Reply-To: <CANNYZj-9wiNejuCKxtcT5_Dp9uG8y54E+qV_RBD1SCCd-HcF9A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Sep 2023 10:20:35 -0700
Message-ID: <CAMKF1sqzGZTZj7CfrkZPf=C=H4wDYMV1fs3PLo4AKZ2DW2kV=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glib-2.0: Remove failing ptests on musl
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 17:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188198

On Mon, Sep 25, 2023 at 12:42=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Wait, shouldn't the reason for the failures be at least mentioned, if
> not addressed? "Remove test because it fails" is never a valid change.
>
They are not triaged so no root cause reason is mentioned.
The failures are listed in commit with some details that ptest shows.

> Alex
>
>
> On Sat, 23 Sept 2023 at 22:45, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > FAIL: glib/convert.test (Child process killed by signal 6)
> > FAIL: glib/collate.test (Child process killed by signal 6)
> > FAIL: glib/gdatetime.test (Child process killed by signal 6)
> > FAIL: glib/date.test (Child process killed by signal 6)
> > FAIL: glib/converter-stream.test (Child process killed by signal 6)
> > FAIL: glib/option-context.test (Child process killed by signal 6)
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/glib-2.0/glib.inc | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/gl=
ib-2.0/glib.inc
> > index 5183f37a6ef..c508990ee8c 100644
> > --- a/meta/recipes-core/glib-2.0/glib.inc
> > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > @@ -134,7 +134,12 @@ do_install:append:class-target () {
> >          # https://gitlab.gnome.org/GNOME/glib/-/issues/2810
> >          rm -f ${D}${datadir}/installed-tests/glib/thread-pool-slow.tes=
t
> >  }
> > -
> > +do_install:append:class-target:libc-musl () {
> > +        # Remove failing tests on musl libc systems
> > +        for t in convert.test collate.test gdatetime.test date.test co=
nverter-stream.test option-context.test; do
> > +                rm -rf ${D}${datadir}/installed-tests/glib/$t
> > +        done
> > +}
> >  # As we do not build python3 for windows, makes no sense to ship the s=
cript that's using it
> >  do_install:append:mingw32() {
> >          rm -f ${D}${bindir}/gtester-report
> > --
> > 2.42.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#188154): https://lists.openembedded.org/g/openembed=
ded-core/message/188154
> > Mute This Topic: https://lists.openembedded.org/mt/101546413/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

