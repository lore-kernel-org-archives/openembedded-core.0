Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D844C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:11:48 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.44530.1684311098446700423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=XitR9HxM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f450815d02so2979135e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684311097; x=1686903097;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=01vgGzEmaVRUsp+s9E7uF3wuE+6CMx1qbKsLjAHxxec=;
        b=XitR9HxMhgh9gDICnqRIBuwlGWp2hbr8lPkJHuNLTX22YPI6SXeqFEiPhDoLucBatE
         syhxTcO865LPe2xNOwSqOSbdj19eDiuNXvPiRP1RVjF4NsqR6gM1qED+YCC16z8OMpq/
         1fwn51U0+eKdrPDvSg/cHBOtInmIL6tabikMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684311097; x=1686903097;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=01vgGzEmaVRUsp+s9E7uF3wuE+6CMx1qbKsLjAHxxec=;
        b=eGYOBD8v5Iwtc1uw9kjKGZTUrCBXAgETtM9+ubmclSLnVmgTxQO2QNeV7woo0lJO6j
         X5T5THYSUqnop6Gjn8ZXVBRoGDr5Wk/8aEzX0JI9AAxo3UYu9wxDWRXUX41uYIeZQZta
         Xv1VduP1X0dZG/LlWe8aZL6fph6U5kZCvo2uy1JXOagNrkT85vGeLU8LnTjOaCEYK9M4
         pd4lIXjk+RKuTehPlmHDol5u2e+Pmuo1V3lWSVtMpme672SKWlTTe/R0ujugDs+pgthh
         H9HWUk0n1l05b7q9EgSSirLF/Aq3YFrhkn5skb4yy9NVS6Ioyje97B38D3GgkMMd3pfq
         6U6w==
X-Gm-Message-State: AC+VfDw+sSnCNxXP5kkSnc4uLVHPyZ3ILSwoECdcH4eU1yr5lKkPnABG
	vBFik6i8iSgbV1T46e3pzRhRpg==
X-Google-Smtp-Source: ACHHUZ52H+ti+UkrNBDy1wZ/tGxt9v5yErJJsl3SDCrtahsAUq+pQpAIl0ePcs8ROczGhrC/oDbByg==
X-Received: by 2002:a7b:c419:0:b0:3f4:a09f:1877 with SMTP id k25-20020a7bc419000000b003f4a09f1877mr16337909wmi.23.1684311096854;
        Wed, 17 May 2023 01:11:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4728:4ae8:88ad:4efb? ([2001:8b0:aba:5f3c:4728:4ae8:88ad:4efb])
        by smtp.gmail.com with ESMTPSA id x10-20020adff64a000000b0030630120e56sm1970142wrp.57.2023.05.17.01.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 01:11:36 -0700 (PDT)
Message-ID: <d0305c4edc9c84ca544a33c45cfc2432cf31d66f.camel@linuxfoundation.org>
Subject: Re: [OE-core][mickledore 05/15] glib-networking: Correct glib error
 handling in test patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2023 09:11:35 +0100
In-Reply-To: <CAOSpxdZUg8S0ehe6zQgVjO4jwO4nKYcayoXfYY40=J36PPmrTQ@mail.gmail.com>
References: <cover.1684081748.git.steve@sakoman.com>
	 <66dc4b94e9fad8d209f12fa64bd0673a42c28ac9.1684081748.git.steve@sakoman.com>
	 <4138a44fc28eaecc2feb86dcec97b04c8aeb4e0a.camel@linuxfoundation.org>
	 <CAOSpxdZUg8S0ehe6zQgVjO4jwO4nKYcayoXfYY40=J36PPmrTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181470

On Sun, 2023-05-14 at 11:54 -1000, Steve Sakoman wrote:
> On Sun, May 14, 2023 at 11:49=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Sun, 2023-05-14 at 06:31 -1000, Steve Sakoman wrote:
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >=20
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit 4ba74f61f38827d82586cf9c993a4b27065f5c6f)
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  meta/recipes-core/glib-networking/glib-networking/eagain.patch | 2 +=
-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain=
.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> > > index 6dfbb2736c..ac6592ffef 100644
> > > --- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> > > +++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> > > @@ -21,7 +21,7 @@ Index: glib-networking-2.74.0/tls/tests/connection.=
c
> > >                                      MIN (TEST_DATA_LENGTH / 2, TEST_=
DATA_LENGTH - test->nread),
> > >                                      NULL, &error);
> > >  +
> > > -+      if (error =3D=3D G_IO_STATUS_AGAIN)
> > > ++      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_BUSY))
> > >  +          continue;
> > >  +
> > >         g_assert_no_error (error);
> >=20
> > I'm not sure this is working yet, I suspect we've seen the error in
> > builds with the patch applied :(
>=20
> FWIW, I used to get the error often without the patch.  I haven't had
> the error since taking this patch.  Certainly not proof it is working
> 100% of the time, but certainly much improved.

Failure on master:

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/2134

https://autobuilder.yocto.io/pub/non-release/20230517-2/testresults/qemuarm=
64-ptest-fast/glib-networking.log

so not fixed :(

Cheers,

Richard


