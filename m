Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF86EE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 03:38:15 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.876.1692675486753828043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 20:38:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ToCHL0oW;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-79243040c2cso24196139f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 20:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692675486; x=1693280286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0j4zRzTEE4MI82veMLcL4Xidlc/gxUVS4pdurgJB9/s=;
        b=ToCHL0oWV4YRGz+8DO9qQkYHnTH+aR1Fe3divfzgf3xPO3e8ne0Ld3pr3Sov6dESRF
         Ogn6050bMtV3CcXi/aM7We4gmSwGUxUUvNpjGSPMwrXRaHsSCUPnHpxMMLvPjw5al9U9
         a0FidEre4epVP+ARiQzsmhwTmHDxktT+h4IYqR07cWZUXzIY+DQXU/C81FtfoulFyW4v
         Z/qQUSEI7ML5UxHjyKEi+Z2mgGyp98fDvv5zqqMZVnDYyewU0dN/ADMR3nqOpWuFLbVW
         yqruY5hAnX+6BrAFlhQchVBc/G/plHqmksCyOpm6nySv/YJXwj10saQ1oJFG2ddLWSJx
         nhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692675486; x=1693280286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0j4zRzTEE4MI82veMLcL4Xidlc/gxUVS4pdurgJB9/s=;
        b=LeXFJ4LWecGe4Ktd6hT2bAdA1MD8Az1RvfLAuwYPJ7eGuzqI4Gy9skSV998P1YPFEf
         1eytzvTToDpymUderoiG/pUR3DYi91qewbdrQxRHtMuHZ6quw0tsyGCK5/cwP/iIMYfa
         PeewxInbQe116RZWqvHvYM47WcgLKhPYfnQiMvpJhPWTrNDkAy62jABbk7b3v9eg5Gq7
         fkfOUhSHJ1aeKvioR0pg1WE02MBaFkVVVtilXPIN39Alc2GErrM62CJwK87PSD5Vmd75
         xVKywcTF8ykWwq7dz1XFs5TL+QiYE9R1/xFSLbfVSdxzFiZxUQHtOczLn/bwkup9qTe0
         pFBg==
X-Gm-Message-State: AOJu0YxvlhhmNB/58tJPAxPOSW6A5d5pCx2ukLO+t7GiClzRFKSSqWjs
	lnGReJGwbHNUelrUa+98S9+E4CAnAF19LiZWBE8=
X-Google-Smtp-Source: AGHT+IFjp/WZz64y+C69BJdGjfyzlJ0TW1q/+QVYJcZwGbw33I3BYbT4YSTUpXYCyE5UbiSzvPkDxrFSuUYighBVHfw=
X-Received: by 2002:a05:6e02:e50:b0:349:9745:89f with SMTP id
 l16-20020a056e020e5000b003499745089fmr9247603ilk.17.1692675485665; Mon, 21
 Aug 2023 20:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230531051408.2518859-1-xiangyu.chen@eng.windriver.com>
 <CADkTA4P0mMXrDowrqi2NryRhJwRyQ9xO9A9P5zWwMG9rMgUf0w@mail.gmail.com> <e9a73f10-22eb-e21c-931d-b7f3fc8c16bd@windriver.com>
In-Reply-To: <e9a73f10-22eb-e21c-931d-b7f3fc8c16bd@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 21 Aug 2023 23:37:54 -0400
Message-ID: <CADkTA4N4dXUatBp=T3YK8b68KP9dzrmrbHzDsuxgKxjuK-SKtg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] perf: fix argument list too long
 during compile
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 03:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186491

On Thu, Aug 17, 2023 at 11:30=E2=80=AFPM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> Hi Bruce,
>
>
> Sorry for being late, update some information I observed in my local setu=
p;
>
>
> On 5/31/23 20:23, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Wed, May 31, 2023 at 1:14=E2=80=AFAM Xiangyu Chen
> > <xiangyu.chen@eng.windriver.com> wrote:
> >> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>
> >> The perf would fail to build when BUILDDIR is longer than 190, The "O =
=3D ${B}"
> >> makes it use absolute path which makes the argument list too long, rem=
ove
> >> "O =3D ${B}" will make it use relative path to build will fix the prob=
lem.
> >>
> > Can you elaborate on how the relative path use is happening when an
> > explicit output directory isn't passed ?
>
> When I using a long path/long folder name as below[1] , the perf package
> would
>
> report an error "| make[4]: /bin/sh: Argument list too long"
>
>
> >
> > I haven't checked the source, but I'd assume that it will simply build
> > directly in the source directory if we don't pass O to the build.
> >
> > Also, is this fixed in a different way in master ?
>
> Indeed, simply drop the "O" is a workaround solution, just put the
> compile object to source folder.

As you know, it isn't ideal to mix the source and objects, it is
obviously something that we don't do unless there really are
no other options.

In the past, we have converted the directories to relative paths
versus absolute by specifying B explicitly (and making sure it
is relative). Have you tried anything like that ?

>
> This behavior cannot find after mickledore branch, after comparing
> mickledore and kirkstone code,
>
> I found that it related to make.
>
> The kirkstone's make using 4.3, the mickledore using 4.4.1. There is a
> commit [2] already fix the issue,
>
> but this fix depends lots of other commits(and not sure those commit has
> alternative impaction), so looks
>
> upgrade package directly is lower risky than backport patches, but i am
> not sure bump the make package
>
> (4.3->4.4.x) is meet the policy, could you give some suggestion? Thanks.
>

Interesting. And yes, it is unlikely that a new version of Make
will appear in Mickledore.

It would be interesting to see the list of commits that are required
and then we could review and look for impacts.

One other question ... it can't just be perf that is being impacted
by this issue. How are other packages building in your directory
structure without failing on long paths ?

Bruce

>
> >
> > Bruce
>
>
> Ref:
>
> [1] e.g. build_test_logname_xxxxxxxxxxxxxxxxx
>
> xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
>
> xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
>
> xxxx_xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
>
> xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
>
> xxxxxxxxxxxxxxxxxxxx_dir
>
>
> [2]
> https://git.savannah.gnu.org/cgit/make.git/commit/?id=3Ddc2d963989b961614=
72b2cd38cef5d1f4851ea34
>
>
>
> Thanks,
>
> Xiangyu
>
> >> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> >> ---
> >>   meta/recipes-kernel/perf/perf.bb | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/pe=
rf/perf.bb
> >> index a4ce3169d3..e213c3632e 100644
> >> --- a/meta/recipes-kernel/perf/perf.bb
> >> +++ b/meta/recipes-kernel/perf/perf.bb
> >> @@ -72,7 +72,6 @@ LDFLAGS=3D"-ldl -lutil"
> >>   EXTRA_OEMAKE =3D '\
> >>       V=3D1 \
> >>       -C ${S}/tools/perf \
> >> -    O=3D${B} \
> >>       CROSS_COMPILE=3D${TARGET_PREFIX} \
> >>       ARCH=3D${ARCH} \
> >>       CC=3D"${CC}" \
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >>
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186345): https://lists.openembedded.org/g/openembedde=
d-core/message/186345
> Mute This Topic: https://lists.openembedded.org/mt/99236216/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

