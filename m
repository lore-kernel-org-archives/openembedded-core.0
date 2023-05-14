Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7E4C77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 21:54:38 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.75664.1684101270119294870
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 14:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=qPT4eSjb;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-965e4be7541so2077376366b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 14:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684101268; x=1686693268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UM+eI6ajs0aZDaYIdHcvMO3cxBbd19EVFC4t9rpJ5gY=;
        b=qPT4eSjbfnywyiJT34X/ot5eUiVKodL5QS54W+xolO492k/DkpNrVp+MGSJTAfdjB3
         Sp6cdEDp5zlTIXPD0WIkU3gcqNIAZsViN5rHdKZPC/nRd0xbd2h4WWQ31coVmhc0bAq9
         xjdzIpf4nl5lvUjMKhpbNt2/vivc79hMPLtogceHMqcAre5gXCWTTtH/ghlJQcotLEi4
         3MyxqTwZTLVldL/pj8d6/+YrVkrGCOazFtuc8Qf7iLwyWXcI1HDLu0GYfmtrjy8VtOm0
         6MPLBPhjHswHMjrPck8hZgo/OlKq00En0CBGtShtafy45t4+tkxdeBQ5TLIduefzV2bT
         ufYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684101268; x=1686693268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UM+eI6ajs0aZDaYIdHcvMO3cxBbd19EVFC4t9rpJ5gY=;
        b=OcN85UVHJyNH4ijrUaNTh7iZfJytg4L+uflpQ89TB1yz9aXei9uHem2sCoIEXwx8KI
         5xdze+3MnP5RMMbFNZz2cOmKJAtlNSem//eF/AmqFbmFdiA6X4DiRwbGZqcflXklgvgr
         bTU0g4Sw5YY08dfNq8k2CfzoJ0cm2zaKPvAZE7yivR/8xZUuEs7QuVnBoHx1cVkIDd7q
         Gwvuy2O45P2qOiczqqRrU9MHpi2EhzZPt8GOAGMpQ0h03P+jESkAVXG3jpA2Sr4da4bO
         vL9yHWTGi6TEwzwYVwSkK/QZfoKLMRgTYjT7DJdDTV2UowHzIGyfKXLvXjgp2wGBiAgz
         rp9A==
X-Gm-Message-State: AC+VfDyosmv6/9m8vTHqMnoVzJ8cgXLSJ+SCGVCvLshAX4u83Amzdv9l
	zZO7DGoW/B5qZuP0O80q0qJJT90A9EYzwfudYUgOOg==
X-Google-Smtp-Source: ACHHUZ4t+T+i8RpKV37YR7E8hV51U8+YBpu2stwR7kc0EiYiLr58RJrdDpO0xlOWEZJaDsCPRtpqxgy02j1o9yVn8UM=
X-Received: by 2002:a17:907:2d0c:b0:966:5c04:2c5a with SMTP id
 gs12-20020a1709072d0c00b009665c042c5amr24400076ejc.69.1684101268221; Sun, 14
 May 2023 14:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684081748.git.steve@sakoman.com> <66dc4b94e9fad8d209f12fa64bd0673a42c28ac9.1684081748.git.steve@sakoman.com>
 <4138a44fc28eaecc2feb86dcec97b04c8aeb4e0a.camel@linuxfoundation.org>
In-Reply-To: <4138a44fc28eaecc2feb86dcec97b04c8aeb4e0a.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 14 May 2023 11:54:17 -1000
Message-ID: <CAOSpxdZUg8S0ehe6zQgVjO4jwO4nKYcayoXfYY40=J36PPmrTQ@mail.gmail.com>
Subject: Re: [OE-core][mickledore 05/15] glib-networking: Correct glib error
 handling in test patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 21:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181219

On Sun, May 14, 2023 at 11:49=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2023-05-14 at 06:31 -1000, Steve Sakoman wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit 4ba74f61f38827d82586cf9c993a4b27065f5c6f)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/recipes-core/glib-networking/glib-networking/eagain.patch | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.p=
atch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> > index 6dfbb2736c..ac6592ffef 100644
> > --- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> > +++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> > @@ -21,7 +21,7 @@ Index: glib-networking-2.74.0/tls/tests/connection.c
> >                                      MIN (TEST_DATA_LENGTH / 2, TEST_DA=
TA_LENGTH - test->nread),
> >                                      NULL, &error);
> >  +
> > -+      if (error =3D=3D G_IO_STATUS_AGAIN)
> > ++      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_BUSY))
> >  +          continue;
> >  +
> >         g_assert_no_error (error);
>
> I'm not sure this is working yet, I suspect we've seen the error in
> builds with the patch applied :(

FWIW, I used to get the error often without the patch.  I haven't had
the error since taking this patch.  Certainly not proof it is working
100% of the time, but certainly much improved.

Steve

