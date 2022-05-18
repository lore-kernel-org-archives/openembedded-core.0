Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD20BC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 11:58:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.3905.1652875106748972491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 04:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pgPY6caV;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 oe17-20020a17090b395100b001df77d29587so5382816pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 04:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cF8wZYjj8UD3cxyDMxolnSfb/Uz+fnPJgR9e59Nq+rU=;
        b=pgPY6caVCvOaxXlBxEed7XWP0V6xkJ5LBDaC/0Lc/dP93zt2QnvgRhnbwynRtyyYN4
         4ezDe+eCyWL01Dah+X4fGyJ7oC6v4tlG4gKYh+F0ttLzpeYPxBZy4f03nOzuZDt6MniW
         CTP4JlEwPQU379koZ4/b1jb3JBoxU/4APN++JbINzFE7nc5/0EYHNLnoH7uFcnUpzhVX
         WNadZoDWQDQyPlX2wOSWBWypHzQmW6Mr3V17Cs5m6NhCmy4GHmAcZi2C662bU0MJHPIk
         XX53Qx8AcupbHZoL2CeglUlkLTWQC4maYjHksn2SDZ0D1o+veHs+n8XnmqP6fO74LPUY
         XU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cF8wZYjj8UD3cxyDMxolnSfb/Uz+fnPJgR9e59Nq+rU=;
        b=cpk+0lOITsrvPMZUJ8+I/U/n91FH4oHIeN7BRRd/gDKM6ejOLyyucjxBsfokyu0eJa
         JGrMOx4tZ8YKBqXqyCRjGhh7p9L03ZEeJINsyuwDzVa2zNthrTBZO7Qm+GHzYTY0s3j2
         Sr2VglEYXVdL28ZPaCxIDo6neBUImlLisC0+Td8KkhNELYRUc4RJqGVEc1xBwjKwM49+
         nn9ruei346N3Xu5tOeB6BGm7VYIqWoV0BYQsyCtDdMUFuyvMDl3UzdHry6xPznUZ/HgW
         ZZ4QClKymYKIf3Mnpm/8MicrwW12+LFCPd2vrdWOJWr8h9ByorM33AMFQCVF4jMBvzeR
         CqUg==
X-Gm-Message-State: AOAM532pf6aHYes0ba4GhuUaKcSlqnPcwgwEGL9Md0HoY10Fp6lp5aAW
	FXdoYuYhVCuV+T6KJGgP7vqyxvpv55bmDideHwk=
X-Google-Smtp-Source: 
 ABdhPJzhaBaq0B6YIvmuCDUCG+xXKTq5MEocLbbkA5q8SHSfknGFcCwuRKl4fkjEpL7NXBfYJwNVvzWeSHIQIW0Xdlo=
X-Received: by 2002:a17:90b:33ce:b0:1dc:690e:acef with SMTP id
 lk14-20020a17090b33ce00b001dc690eacefmr40854001pjb.121.1652875106300; Wed, 18
 May 2022 04:58:26 -0700 (PDT)
MIME-Version: 1.0
References: 
 <722011c32a289bb9945a491e1f9b9e290e62c3ea.camel@linuxfoundation.org>
 <13088.1652867175060959086@lists.openembedded.org>
 <e793362e2958aecec75daa66230558f7feb9add5.camel@linuxfoundation.org>
In-Reply-To: 
 <e793362e2958aecec75daa66230558f7feb9add5.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 18 May 2022 13:58:14 +0200
Message-ID: 
 <CAApg2=ToM0QwDU8MkV-3FNHgTOuhtV6Az6E3uT2WyQigWnfTow@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCH 1/3] cve_check.py: Add new method
 get_ignored_cves
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Akash Hadke <akash.hadke@kpit.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 11:58:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165847

On Wed, May 18, 2022 at 12:33 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-05-18 at 02:46 -0700, akash hadke via
> lists.openembedded.org wrote:
> > Hi Richard,
> >
> > I tried modifying the cve-check.bbclass but did not able to get the
> > solution for disabling the NVD data, because when we inherit cve-
> > check it executes the cve_check task that checks CVEs from NVD DB. So
> > I am also not sure how to disable it hence I used the separate
> > bbclass.
>
> I guess the task dependencies are a bit of an issue there. There are
> probably ways to make those configurable, it would just take a little
> work.
>
> I really do want to encourage us to work together on common cve tooling
> rather than having several partial implementations so I can't take this
> patch series.
>

I plan to cut those dependencies and make different stages optional.
In my case the first use
is to be able to run multiple cve-checks with the same database
(guaranteed without updates)
or run cve-check with some given known database (for testing).
We can add an option to make the actual check with the database optional.

Exporting the data to the buildhistory looks like a useful thing to do, too.

I can draft the split after YPS.

Kind regards,
Marta

