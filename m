Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC4DEB64DD
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 02:32:44 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.23096.1689993158459227525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 19:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WCEr1u7A;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-785d738d3feso66731939f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 19:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689993158; x=1690597958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IQ0O5e6wLsDIYsJd1MDrhJJEZVKeK3qnMS3UCrCs5s=;
        b=WCEr1u7A10jJp8OTtujEre1p5qKFaU8UwIhUg/iVgaDpzVoTQjJrZdo+Amy5+29E9P
         AFOTx3t68/z1EY0g5Hh6TPP6tdoRk5Y0FNehTlHyfblmCAI/3BPN4PDC2WHlbuBnRrAe
         mDLZZwoLAvdfNrB4qCetMrop2CWwdGdE1xRoL2AzbyJsH7h3rWMs2EVvnox7iWt8UlUA
         Mm3Bd8JMMZ/1QLa85q77fmJluZOdN1+LyxRGn3D68RXbXPGVnojfRo+SyOH/KNRaMv8P
         xiXAEof6reKdEVIQ7NFehNzz7SXKhmDYPYEvYGspHTsVcTuM/ya+xGU7z4SFnFLPZz9z
         TwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689993158; x=1690597958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4IQ0O5e6wLsDIYsJd1MDrhJJEZVKeK3qnMS3UCrCs5s=;
        b=FyJDareftQCbAE1tqJHMcx3znAZn6mN9ii/ZHli72+eJKIxGT8/Ot7QwiL4exfErGU
         PReWQTmMSMXhT7+8jK+7yciuLB9Il7jIBDDOeivvQlktFLjf9pTuCnblvKvijyDdO6Q6
         MR0NFaMAG2Ykzud+yfKaW6mkmQsIX8+snaAPnPFmlWcdhX5kWeK1T3rrPnG4K6cKu/mE
         Y7/DAXQo6YxEOqFsJ6ew9+l3tFXAeOeHctSbtWn0QyTB8ERy88K84Fve18gh6X4r4Xyu
         C7oxTAoSqu8iSCaG0t5Iwab0UPCj8hzlyja50/qApFjB7MSOBlhP2+HMccXlCD/LsWiG
         piXw==
X-Gm-Message-State: ABy/qLaV9EiqW5nCx5ksTZD3ObC4ZOCDt9T1Dfp7DKw87zsrGCV8tcfR
	FRUoWTmcMkmHI3Sj70MEvhX3att5rdb8HWI1scU=
X-Google-Smtp-Source: APBJJlElQaq9bkaRZ/p/WobZPBk5H/VC5OmJp96hQ1mrQkFPCbIEPAuyiclBi8DvDkI75x3PynbsMcJCrXQ43IXj1Q8=
X-Received: by 2002:a05:6602:481b:b0:786:a615:6281 with SMTP id
 ed27-20020a056602481b00b00786a6156281mr1200869iob.3.1689993157694; Fri, 21
 Jul 2023 19:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4O92vHqJbTEqUDPktnuaCp-vzskCZeb_5iqr5NmfGNONg@mail.gmail.com>
 <TY2PR02MB3678ED281AB36D9AB6CBA9C68139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4OBjLFxO8x3X1tBvzwU9P=nFU4iVx-qgAphbrboqxu1nw@mail.gmail.com>
 <TY2PR02MB367838917BD294BF286FE226813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4P6NXH-7am1emePfWaZN43e58FsWe9_Rdj2_PdXD6b9RA@mail.gmail.com>
 <TY2PR02MB3678FC5D7379332D46E8A7EB813EA@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <177395F667E9B0AB.1070@lists.openembedded.org> <1773AC7F6FA975DD.8172@lists.openembedded.org>
In-Reply-To: <1773AC7F6FA975DD.8172@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Jul 2023 22:32:32 -0400
Message-ID: <CADkTA4NhrE0idYrbLG5Jzuf3Eg-myKgvHnLJCCU81XWX0hbqZg@mail.gmail.com>
Subject: Re: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
To: bruce.ashfield@gmail.com
Cc: Petr Gotthard <petr.gotthard@advantech.cz>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 02:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184713

On Thu, Jul 20, 2023 at 4:12=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Thu, Jul 20, 2023 at 9:19=E2=80=AFAM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Thu, Jul 20, 2023 at 9:16=E2=80=AFAM Petr Gotthard
> > <petr.gotthard@advantech.cz> wrote:
> > >
> > > > My question was about CONFIG_LOCALVERSION_AUTO being something that=
 you
> > > > changed after the first issue popped up (I understood what it was c=
hanging from
> > > > your first description) I can't clearly see if you turned it on in =
response to the
> > > > breakage, but I'm assuming that the answer is yes.
> > >
> > > Oh, sorry for the consuion. Yes, I changed the CONFIG_LOCALVERSION_AU=
TO only to reduce the number of suffixes.
> >
> > Ack'd. Thanks for confirming.
> >
> > I'm coming up with something that will keep 6.3+ working, and not
> > break older/existing recipes.
> >
>
> I have a fix under test. I'm just running into a bit of sstate
> oddities that I need to sort out!

The first iteration of the fix is on the list.

As you mentioned and Richard reminded me, rather than doing some
fragile logic to make the variable consistent, I've followed the lead of
the abiversion files and we are now saving the localversion info as
well.

Bruce

>
> Bruce
>
>
> > Cheers,
> >
> > Bruce
> >
> > >
> > >
> > > Cheers,
> > > Petr
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184661): https://lists.openembedded.org/g/openembedde=
d-core/message/184661
> Mute This Topic: https://lists.openembedded.org/mt/100240236/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

