Return-Path: <peter.suti@streamunlimited.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79061C001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 10:43:46 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.4482.1690800223322521924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 03:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@streamunlimited.com header.s=google header.b=pSZJ+1c8;
 spf=pass (domain: streamunlimited.com, ip: 209.85.208.169, mailfrom: peter.suti@streamunlimited.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b9db1de50cso25138551fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 03:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google; t=1690800221; x=1691405021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVNwrGft2D5/8bdfKA8jtifhjhRpdxD615SPtrPpb0M=;
        b=pSZJ+1c8U7WourtR/E+QNxL01eWm6uoUudYDgV398m5jriQzYZ1Z/0Ezk1EJWALZfy
         sT+LFQRlj7H7rde7McXny3PfURyeSEnEfAaa2kUIgFmOrI/X/s3LFp7srcGBERWthhCM
         /oF9fCtupNQdxGOCqZDKgOjfm6abBhYBIf9+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690800221; x=1691405021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JVNwrGft2D5/8bdfKA8jtifhjhRpdxD615SPtrPpb0M=;
        b=ARmSFgmOkthvmX9jANOMhmGa3pEx5IezT9JprxzUgXesLeJlUVIRZiCz0tVMcMI8GX
         BjwEgqc4xGvFUZf8oDTGH+WEEWGxoDeHDE5u0zqCDpWfvZ6EPJ1ih6jItirIDl7qhXNB
         gdLG8uzpz0/qkFIIvoR1BN1wg4bQcnCrNLSa6nis513SSnoLeEBEqzb6s1ayTwKi0o29
         81MAKG323jfjDkLV3Mmdbkf8TaFM1vZJ0vMf5CDC6voODiIGLJ+Y9QTWqAyUQJ5yxSks
         ZcXZD05oPNzOM0vDYtFQF05m/xZMidpw/2wfcORZEYtcGAZbQ3spfut0xTMetmv4XzVv
         AgqA==
X-Gm-Message-State: ABy/qLY7Bh3/ue8cQy0HC2HRfB+DOwL7QioqPdjhTu+yUNM+QEbbrzpK
	S5dTswJgQ+d68+inoIWAmB2kGDz4LpoVtLAO1rhjPtelYY4I6OB74tWHHw==
X-Google-Smtp-Source: APBJJlEUpENVL8007I8ociTjh4cTZzsGR9O2JCZMm7AZYFkOiLfC9uG6/0wrYXQbmoaEuSoUhNZiQfh0JfGDh70Ku2g=
X-Received: by 2002:a2e:3008:0:b0:2b9:ecab:d921 with SMTP id
 w8-20020a2e3008000000b002b9ecabd921mr1378962ljw.18.1690800221235; Mon, 31 Jul
 2023 03:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230731093415.261532-1-peter.suti@streamunlimited.com> <fe958ac3d572d910e9f4eb861b18c4df40381a1e.camel@linuxfoundation.org>
In-Reply-To: <fe958ac3d572d910e9f4eb861b18c4df40381a1e.camel@linuxfoundation.org>
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Mon, 31 Jul 2023 12:43:30 +0200
Message-ID: <CACMGZgbCCj9jsTTxjVCZoU=1LPxmca5Gei_tKDgpKhxb+X2wog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc: fix dependency chain issues
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 10:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185133

On Mon, Jul 31, 2023 at 12:15=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2023-07-31 at 11:34 +0200, Peter Suti wrote:
> > Fixes [YOCTO #15164]
> >
> > Instead of deleting setscene tasks, now SSTATE_SKIP_CREATION is set ins=
tead.
> >
> > This seems to fix the compile issues where the populate_sysroot task wa=
s
> > not run when an externalsrc recipe was built as a dependency.
> >
> > Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> > ---
> >  meta/classes/externalsrc.bbclass | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
>
> I think this is going to swap one set of issues for another.
>
> Setting the skip creation option will stop sstate from being generated
> but it won't stop bitbake reusing existing sstate. In the case of
> externalsrc, we need to stop it using sstate at all so this patch won't
> always have the effect we need :(
>
> Cheers,
>
> Richard
>

Thank you for taking the time to think about this patch!

I see your point, but wouldn't inheriting EXTERNALSRC cause enough
changes that the hash of the old sstate would no longer match?

This should in my opinion ensure that sstate is never used because:
A) old sstate would not be reused because of not matching hash
B) sstate with matching hash would never be created.

Please correct me if I missed something and this logic is wrong.

>
> >
> > diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsr=
c.bbclass
> > index a649bcdff8..12f2718850 100644
> > --- a/meta/classes/externalsrc.bbclass
> > +++ b/meta/classes/externalsrc.bbclass
> > @@ -76,6 +76,8 @@ python () {
> >
> >          # Dummy value because the default function can't be called wit=
h blank SRC_URI
> >          d.setVar('SRCPV', '999')
> > +        # sstate is never going to work for external source trees, dis=
able it
> > +        d.setVar('SSTATE_SKIP_CREATION', '1')
> >
> >          if d.getVar('CONFIGUREOPT_DEPTRACK') =3D=3D '--disable-depende=
ncy-tracking':
> >              d.setVar('CONFIGUREOPT_DEPTRACK', '')
> > @@ -83,10 +85,7 @@ python () {
> >          tasks =3D filter(lambda k: d.getVarFlag(k, "task"), d.keys())
> >
> >          for task in tasks:
> > -            if task.endswith("_setscene"):
> > -                # sstate is never going to work for external source tr=
ees, disable it
> > -                bb.build.deltask(task, d)
> > -            elif os.path.realpath(d.getVar('S')) =3D=3D os.path.realpa=
th(d.getVar('B')):
> > +            if os.path.realpath(d.getVar('S')) =3D=3D os.path.realpath=
(d.getVar('B')):
> >                  # Since configure will likely touch ${S}, ensure only =
we lock so one task has access at a time
> >                  d.appendVarFlag(task, "lockfiles", " ${S}/singletask.l=
ock")
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185127): https://lists.openembedded.org/g/openembed=
ded-core/message/185127
> > Mute This Topic: https://lists.openembedded.org/mt/100458147/1686473
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
richard.purdie@linuxfoundation.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

