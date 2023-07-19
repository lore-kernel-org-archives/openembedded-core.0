Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39048C001DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:33:04 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.722.1689798776296784299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gNlphGk+;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b701e41cd3so296591fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 13:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689798774; x=1690403574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lnld0yPg3yI4sf4omjU/qgtGBU2baCSUZdYKWkTLk8Q=;
        b=gNlphGk+EbYhQIJjSXTxSt5GogLAltp87mz4r7+MLRsayphnNNW+o0hUX+oZzMPAFX
         Q4PbwVM2k8t8HESJT4xtxm4EmvHOyxBOeyksc+XzF9ZMgkeAG4DnMURJZTb/PnUmQL18
         2mCHj7KHATfWJq0V3cMgWcl7TY2suEp/kYXMMN7FRdNPswHAnqUm4ST2L9D4xYGBD48y
         WKWD2KOfXIlzkHdAQ02vPno4G7Srs+jBJhVEU61DALy37X1VKaN+HIdCSMh6n6SluO3k
         LKchVhrL2i6pTao67qSJj6dZ7lmhZC54pF4vAtri8ip9W3Pr1JZrToNxwzic5fdMfuU2
         7cwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689798774; x=1690403574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lnld0yPg3yI4sf4omjU/qgtGBU2baCSUZdYKWkTLk8Q=;
        b=fY+raZqpqqBwGNE5dUZOgPL8AZwTz+MIpEkwV6tGGuemvaXDEdyCW/Eq9AvwApkKOA
         x62BcB1OELhuZSu0a91W1n83QlxjokQ/Z+1SXqzQRcwA4cLL0aBe5Sob2G4vSo4Q21Lv
         +VFa94aJRMBPiPV9C0aEhX7j9hgtYZ7ze8a/xF+nkkUDNRA0uFpJDeNED+5MeQ6/4lMM
         h1PCHqk+gqnZbIOdSrMdJCbWJ6/pn7ZhLLsTZdZtNJ3UMKIgxjFRWkq7DiAu1OGh0Sdp
         7E2n4c5YhDxm0VD5kMRKFTQUYq0ZTdomI+sCCQhjHaeaMDDTvRKAfpU6kJmWMtiSy62e
         Er8Q==
X-Gm-Message-State: ABy/qLbIPc8F1p+dTWZ2beMLVYRltpsJJNJVAxJ5L9t/s6iHrHmn6bIH
	MwrrTzmuuZ3jgwVYns7VTtkGGnc0Gfvd20QJmEVr2lVZ
X-Google-Smtp-Source: APBJJlEaC4N2fFdcdpNBh7wtU6g4oM4LOABpOmswexWvwhlqatarso7KmMoFjxQjsdrLyxuSM/T6cQBeTkU8VeUesHY=
X-Received: by 2002:a2e:a0ca:0:b0:2b6:e719:324e with SMTP id
 f10-20020a2ea0ca000000b002b6e719324emr712771ljm.49.1689798773925; Wed, 19 Jul
 2023 13:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230717143624.437293-1-richard.purdie@linuxfoundation.org> <CANNYZj-9u4gDwvjL8+9F8+GSJUqes45w-DMn-v2xvg3qaXRH5w@mail.gmail.com>
In-Reply-To: <CANNYZj-9u4gDwvjL8+9F8+GSJUqes45w-DMn-v2xvg3qaXRH5w@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 19 Jul 2023 14:32:42 -0600
Message-ID: <CAJdd5GakykM-7tv0FppDg7iSa3rwzCPbhhh1jR3zdYm1hm9QWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest-runner: Pull in parallel test fixes
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184609

There is a newer commit that was merged to master just today; please
see if that fixes it.

On Wed, Jul 19, 2023 at 2:26=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Unfortunately this seems to once again have regressed glib/codegen
> ptest (the test writes large amounts to stdout):
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15154
>
> I'll send a revert.
>
> Alex
>
> On Mon, 17 Jul 2023 at 16:36, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Pull in the commits:
> >
> >     Change test timeout to be total elapsed time
> >     Report if child dies from a signal
> >     Recreate pipe for each test
> >     Revert "runner: Correctly handle running parallel tests"
> >     runner: Correctly handle running parallel tests
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/=
meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > index 6f3104499f2..77e2b94f376 100644
> > --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cgi=
/ptest-runner2/about/"
> >  LICENSE =3D "GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D751419260aa954499f7abaabaa8=
82bbe"
> >
> > -SRCREV =3D "8259375d306a8129f6c5d8528314496fc6ae1ca3"
> > +SRCREV =3D "07d8a676aa962ecc5ec264ec33b0074adf2a8733"
> >  PV .=3D "+git${SRCPV}"
> >
> >  SRC_URI =3D "git://git.yoctoproject.org/ptest-runner2;branch=3Dmaster;=
protocol=3Dhttps \
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184473): https://lists.openembedded.org/g/openembed=
ded-core/message/184473
> > Mute This Topic: https://lists.openembedded.org/mt/100195650/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

