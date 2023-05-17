Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D83CC77B7A
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 13:51:30 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.49921.1684331480458365941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 06:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=JJmMKfpO;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-94a342f7c4cso144845966b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 06:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684331479; x=1686923479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwdUcykJ+PZQPA+r9Dx8Eq4MTMLYg+N0zFxY3qKjxZI=;
        b=JJmMKfpOzEpb8PueHw49xnf8Z2if6cI0KyF2MSQxcSm2q47o96mpqjGZPE4hHsFbCT
         BN6PrjPaCV1WYCDYLmREP6y5YbkHwJH2EblMEe1mjbWJdijRMYv5GffcdHVNXU8fJkc3
         m3ia2wpmRjAs7tXtc/WR55MZbexDae3xonBTO2Xs35or1P4fKWZP7iNpUXvycAR4+SIE
         lEHpnPIdMHZAyCw4bcshn+gm05yxLU5PJ3+mBzhLntnBEE4fEnxgxu9e1pGTMxKtH2B/
         oyyJJREZ4+GVIHlhfiIUyHGO9cJVQ8WYiFuhTSaj45gGI2e/p0i8oUg5WjOH9UKUb/ij
         VB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684331479; x=1686923479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwdUcykJ+PZQPA+r9Dx8Eq4MTMLYg+N0zFxY3qKjxZI=;
        b=HFiyp1DtBpQSarAmBMpod/L10IuZlKKjKJgT+9ZPpLx0Rrt27OVvPFlYgyvX0vYYE5
         j4Zn1INdCJfWi3xUiQtSGgm6YqLoz0nLzFyR+cXW1zb/lhWaKA7cWRZrPd8JRL+kC6D6
         +yywt+y4i1R2Gf+rSHhfBtQVlQ97iU9JTdCiwoZiehGdkCuBJBKQ3L21JA8ZdeTm7xq9
         VJSJfnUVHwo2pKe5BvpIjQ4QPGji7IjAO5PeZy87Mu9oDj0zDlojYMonXgXBvQ66sax8
         B6D//32eBGBck42WBqGZx4WbswuB7XjAOVBq1wGFJrR/vpCV+jTDaTidZIMFkTCzC6Yg
         8CDQ==
X-Gm-Message-State: AC+VfDxcupKBOwOwhdfVOioJz6sz2W1R4/xcNUq4Mz0tSyRAnkIVQDJF
	cx+ZvVGY2m3TcULEri5SYBazY0ExZSs/+tYXgBE02g==
X-Google-Smtp-Source: ACHHUZ74iarxlyFae722l1GhW1Qiz4sm6oGI3kPAUAqpIq5AyXfW8/UtnZBDp0CP4vTSu2F4XClkaMslDZJEZooANYk=
X-Received: by 2002:a17:907:7293:b0:969:dda1:3896 with SMTP id
 dt19-20020a170907729300b00969dda13896mr29941265ejc.0.1684331478666; Wed, 17
 May 2023 06:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684081748.git.steve@sakoman.com> <66dc4b94e9fad8d209f12fa64bd0673a42c28ac9.1684081748.git.steve@sakoman.com>
 <4138a44fc28eaecc2feb86dcec97b04c8aeb4e0a.camel@linuxfoundation.org>
 <CAOSpxdZUg8S0ehe6zQgVjO4jwO4nKYcayoXfYY40=J36PPmrTQ@mail.gmail.com> <d0305c4edc9c84ca544a33c45cfc2432cf31d66f.camel@linuxfoundation.org>
In-Reply-To: <d0305c4edc9c84ca544a33c45cfc2432cf31d66f.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 17 May 2023 03:51:07 -1000
Message-ID: <CAOSpxdZqneVsEO_Oug2=qO-QUhvKAoQezhRA5tyfizYxA3hBkA@mail.gmail.com>
Subject: Re: [OE-core][mickledore 05/15] glib-networking: Correct glib error
 handling in test patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 13:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181489

On Tue, May 16, 2023 at 10:11=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2023-05-14 at 11:54 -1000, Steve Sakoman wrote:
> > On Sun, May 14, 2023 at 11:49=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Sun, 2023-05-14 at 06:31 -1000, Steve Sakoman wrote:
> > > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > >
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > (cherry picked from commit 4ba74f61f38827d82586cf9c993a4b27065f5c6f=
)
> > > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > > ---
> > > >  meta/recipes-core/glib-networking/glib-networking/eagain.patch | 2=
 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-core/glib-networking/glib-networking/eaga=
in.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> > > > index 6dfbb2736c..ac6592ffef 100644
> > > > --- a/meta/recipes-core/glib-networking/glib-networking/eagain.patc=
h
> > > > +++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patc=
h
> > > > @@ -21,7 +21,7 @@ Index: glib-networking-2.74.0/tls/tests/connectio=
n.c
> > > >                                      MIN (TEST_DATA_LENGTH / 2, TES=
T_DATA_LENGTH - test->nread),
> > > >                                      NULL, &error);
> > > >  +
> > > > -+      if (error =3D=3D G_IO_STATUS_AGAIN)
> > > > ++      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_BUSY))
> > > >  +          continue;
> > > >  +
> > > >         g_assert_no_error (error);
> > >
> > > I'm not sure this is working yet, I suspect we've seen the error in
> > > builds with the patch applied :(
> >
> > FWIW, I used to get the error often without the patch.  I haven't had
> > the error since taking this patch.  Certainly not proof it is working
> > 100% of the time, but certainly much improved.
>
> Failure on master:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/2134
>
> https://autobuilder.yocto.io/pub/non-release/20230517-2/testresults/qemua=
rm64-ptest-fast/glib-networking.log
>
> so not fixed :(

Sigh, I had one on mickledore yesterday too :-(

Steve

