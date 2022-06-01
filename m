Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DFCC43334
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 22:30:16 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.4510.1654122613069220823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 15:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GOIl6lc0;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.52,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f52.google.com with SMTP id m20so6492751ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 15:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wYmboArFAJr+0KjuyWoDLncJ8Xfy+PHiRomBa1ZAueM=;
        b=GOIl6lc0lhxzUmlDYOGMCURcS1zlKXdRxMukTF+NQiaF9eJjgaxAdZtU3fye+coXga
         RrmiStKo/5GGXQbThCoxUyvmKAbRYoKH/gZGmRyy/azinx8GhiLSOGMaZ0Nsxy+EOGL7
         V4gCfqWO2XKfixw5RKqtHP2bAerBS2dwgLEkEWyFIDvk74HRqOpwWc6iQc70JZA3uEeW
         xEjLwMTZ0LUoRKa2HrrmN3iLsPGAy9BFWz2w2F0KNG6VFRE5UWqQqv3ztk/l5QuJNaTI
         CHer7OaaySHrPEFXVLtxtMSx/o0/eyOgvpkvwOondULx6O60Z+yZ/9UJtGehAyIxaew5
         ESaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wYmboArFAJr+0KjuyWoDLncJ8Xfy+PHiRomBa1ZAueM=;
        b=1CM2GJftwbvV4AY7awfZlCZwrKWQcSZ2wNNhEdlDlt7kmq0SnWEAfuXo1Y3VN86yni
         2hFVaYDkZemoPXjtGFXd+swxJV0lO6SKbxwZJlbCse8qSjXRwuURa20yXVuOW9RPcoUk
         5LW7QzHoTntDdCNVYY442tDUVOcVKbLJJnNBG3FA+qCgQgOMmt4ninOQc/A5uAVO7NW8
         FUfm+BKuD5/gBfJqfFgvjM4cYb0+YSfVkONTt67EcjaIoPkctlVkAKqHBuJsmAePUXqB
         x4C1txwq0kqdebQM1Qju2uFnGHmMWokIGkp4E58HidpbLFuOrcYMbguyDZTbblZ0qJrZ
         w9dQ==
X-Gm-Message-State: AOAM533tN6HzrGOT9aKmu/XgW3PMYtTI8S+ijt0Niho1JFbieOaliJi1
	2+idgstdrgRG+xPzTdXKEXUVHROT0rRazvokNNkx6Q==
X-Google-Smtp-Source: 
 ABdhPJwCcs0LR7hpf4dOgi1KoQLDoeno2K4uFI80hq+nUvzf0GOMkqkepitBlTqPyWrTzY6hlahclTJ0qY7xQma68Wo=
X-Received: by 2002:a17:907:3e29:b0:6fe:cf85:31a8 with SMTP id
 hp41-20020a1709073e2900b006fecf8531a8mr1569490ejc.18.1654122611257; Wed, 01
 Jun 2022 15:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220601205504.3464879-1-jpuhlman@mvista.com>
 <17046dccfb415c1afa9851ab45b90fe04114798a.camel@linuxfoundation.org>
 <b282c6d5-454c-43ed-e9b2-3737a8120558@mvista.com>
In-Reply-To: <b282c6d5-454c-43ed-e9b2-3737a8120558@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 1 Jun 2022 12:29:59 -1000
Message-ID: 
 <CAOSpxdaBLC1SffjnhK1+6g197MVGL29nCOG-=T7dHkitMrFb2w@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] gcc: depend on zstd-native
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 22:30:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166445

On Wed, Jun 1, 2022 at 12:27 PM Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>
>
>
> On 6/1/2022 3:15 PM, Richard Purdie wrote:
> > On Wed, 2022-06-01 at 16:55 -0400, Jeremy Puhlman wrote:
> >> Sharing sstate cache binaries between two systems, one with libzstd installed
> >> and the other without, leads to various gcc components being linked against
> >> the system libzstd and failing to run on the system with out it installed.
> >>
> >> Make zstd-native from our system available.
> >>
> >> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> >> ---
> >>   meta/recipes-devtools/gcc/gcc-11.2.inc | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> >> index 68e0d203fc..e2a28468f5 100644
> >> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> >> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> >> @@ -11,7 +11,7 @@ BINV = "11.2.0"
> >>   FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
> >>
> >>   DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
> >> -NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
> >> +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
> >>
> >>   LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
> > Does master have that issue?
> >
> > Cheers,
> >
> > Richard
>
> I would would be really surprised if it didn't, since it appears gcc is
> explicilty decidding to use the library if it is there. The patch
> cherry-picks with
> name fuzzing so if we want to start it there, I can resubmit on master.

Yes, please do!  I'll cherry-pick to kirkstone after it hits master.

Steve

