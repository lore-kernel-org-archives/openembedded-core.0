Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16135C001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 13:38:19 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.15204.1690983489672260390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 06:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fVCVsKdK;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-790b95beeedso81279339f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 06:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690983489; x=1691588289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/hbVzUyY2BBM9IwdfgaTLUvXHp55oNGho0Z6MU9otg=;
        b=fVCVsKdKgI1z9uj1gKCD+E2xFNNVCqOCrTrNWI+dGpjlDKwpB+uoiF40WtjqgILgBh
         ktTYM6yiVABsdnpRdNT5E2gpgf4n0PGq9etnxwq3RZTImugvhLcK4uATsvZeUx+JzD38
         9fM4Mf/LYg9EEKI+Yl7X++v/nrHeHW8cvE1y79hDbP04PQ0zBs9ydKV0v8b6e09zzxgF
         nied0A/CCusH9Zhjg2iSCTqegBFxX0vsb4oLKe6NnsgcJLL9WgS//Ulo7gPTegldTdnu
         mBsC9TDMDCcr8gE6HmEdRgqtaM5inp8Hu3NAvkN48NQqPLofY61gMtY6UkMyfdeFnbFP
         P6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690983489; x=1691588289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/hbVzUyY2BBM9IwdfgaTLUvXHp55oNGho0Z6MU9otg=;
        b=UTjG44gzRZLlHZKPrZH8mbZO2FxMrLTwhUWXA0wiOpBZndcAznqNc9OYHVeJUNezcm
         tSLEU5YFOZxFf05xSbca5bYIR5pAota0+XOqOuxLUwO7rwtWXr+1xtFI+MTMk1+qiL5s
         lWB+OgeDQwOyO7yZ36aBP1Z/NC1aj4Q/0BeABZlJj1vY906qMJ8XX2WdrplGh+uATZCN
         3rgH/S8jrF1od9h8GM085Qkd1abHIOy5zU2vLo9UvPXtmPYqas8Y02pFoSc2MCqYM5tm
         K9Q4wtyLLHFxS4V6L4xYOb59iVCGp0XRPat8EjY1bns82cNap0OaUD6APOh5NhURKBPr
         ol1Q==
X-Gm-Message-State: ABy/qLZuzIU3sRhVk/6yb8tBHWA/kW+2aMo4sRloztxKxM7RVTTRXwMo
	DusLDYUS5FRKjpAyol+oCYWPuE9PT1dTteotFLk=
X-Google-Smtp-Source: APBJJlFUQnCh/INsh7x/tNCrGX6j0l1i4AijX6ZBYKttfdreSB8wbsaY2Pkl/S7Smfp0ErtG2XvS7s46YxNrYlXCf/8=
X-Received: by 2002:a5e:a514:0:b0:790:acd0:a26 with SMTP id
 20-20020a5ea514000000b00790acd00a26mr8576680iog.21.1690983488877; Wed, 02 Aug
 2023 06:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230802114705.90137-1-joel@jms.id.au> <CA+cAkeqRRNUyPxDZrk_3kkQCT2xbE72S5vxrZ_VvHH-xcEB2YA@mail.gmail.com>
 <CACPK8Xd1DqL9WoV=kwxDO3bzcBEB_KhH-1oKhKE2xoqZzX9a-A@mail.gmail.com>
In-Reply-To: <CACPK8Xd1DqL9WoV=kwxDO3bzcBEB_KhH-1oKhKE2xoqZzX9a-A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 2 Aug 2023 09:38:09 -0400
Message-ID: <CADkTA4MxqDTacjdsJkN6Gxf8PMmqV5iy6_0e-Umn5BDjybDbPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: Don't fail if Modules.symvers doesn't exist
To: Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	Andrew Geissler <geissonator@gmail.com>, mdmii@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 13:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185398

On Wed, Aug 2, 2023 at 9:15=E2=80=AFAM Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 2 Aug 2023 at 12:45, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> >
> >
> > On Wed, 2 Aug 2023 at 13:47, Joel Stanley <joel@jms.id.au> wrote:
> >>
> >> The one liner tests using `[ ] && action` need to have || true after t=
he action,
> >> otherwise the line returns false and the recipie fails.
> >>
> >> Signed-off-by: Joel Stanley <joel@jms.id.au>
> >> ---
> >>  meta/classes-recipe/kernel.bbclass | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass
> >> index 247ef4a48aa7..f1bc41e82be8 100644
> >> --- a/meta/classes-recipe/kernel.bbclass
> >> +++ b/meta/classes-recipe/kernel.bbclass
> >> @@ -486,7 +486,7 @@ kernel_do_install() {
> >>         install -m 0644 System.map ${D}/${KERNEL_IMAGEDEST}/System.map=
-${KERNEL_VERSION}
> >>         install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERN=
EL_VERSION}
> >>         install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KER=
NEL_VERSION}
> >> -       [ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/$=
{KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
> >> +       [ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/$=
{KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION} || true
> >>  }
> >>
> >
> > By doing that, you simply silent possible error of the action after the=
 test, below is a little snippet showing that
>
> Sure. But the test is looking for the file, so if it doesn't exist
> then the command install won't run.

Something doesn't seem quite right, that test for Module.symvers (there
and in the shared workdir code) were put in place for the scenario
you are mentioning .. if Modules are disabled and hence Module.symvers does=
n't
exist.

At one point, we even tested that sort of configuration.

I didn't dig more through the logs, but maybe we had lines after that comma=
nd
previously, so the last return code wasn't a failure and hence no task
failure.

As was mentioned, we could make the test more explicit if the shorthand of
just checking for the symvers file isn't working, since really, if we have =
an
|| true in the one-liner, we probably can tweak things to not test for
Module.symvers
at all.

Bruce


>
> I can't think of any realistic situation where install would fail if
> the file is present.
>
> > I think the origin of your issue is that the action failed , having the=
 log of kernel_do_install task would help.
>
> That isn't the case.
>
> The issue is the Modules.symvers file is not found. This is expected,
> because the kernel does not use modules.
>
> Here is the log, with paths trimmed:
>
> DEBUG: Executing shell function do_install
> NOTE: no modules to install
> WARNING: temp/run.do_install.2584671:225 exit 1 from '[ -e Module.symvers=
 ]'
> WARNING: Backtrace (BB generated script):
>     #1: do_install, temp/run.do_install.2584671, line 225
>     #2: main, temp/run.do_install.2584671, line 283
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185391): https://lists.openembedded.org/g/openembedde=
d-core/message/185391
> Mute This Topic: https://lists.openembedded.org/mt/100503145/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

