Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A97BC433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 01:41:15 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.5545.1637631674026345499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 17:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ejqdOWeI;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id r11so84952435edd.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 17:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zY3+QDpmusREHe2DMBzIr54nZCqr5ndBvi8nJH7AZ94=;
        b=ejqdOWeINCN1b8RUeU/LiVW3pRcfaPoxpvejVKsMb295EQRSvqJGs5WUDY5D+vtNOi
         cwcKsnXx2Lsfn2CtEy1H3Z7jjsM2QQjV4twPWdRkt+5mVrZQDy9TIAWSIhxq8oClIzyR
         7OBcx9cyODJvdfQqdDrrI77uZ7NLq7jjNg19OacuRRk/pBeykhz5BOSa1yaVV+lB0PU+
         Szgi7hhOTJ0a9HoFp0s3Otz046gHP9xRJ2z9jMuTJbuclsC3d/sTJxrQuvSMJUZL3VY+
         QFUvz2GX7dAPYTapPjPu0XJLnz7axMut0/mBToZiyLNzzNcLAOH+Vdty3a+mLognKBuF
         JHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zY3+QDpmusREHe2DMBzIr54nZCqr5ndBvi8nJH7AZ94=;
        b=R4b+5tWD64IHpVQjl2LDFaRXkrhC3/jE+At+e0X8T/ikhMY1jDGcLgdhQxYRzznflu
         zoZ6RGEOOk3ZEDpqAWnLofJfEmViA81ScrnuTjhHDhZFUzVRjZnur6IsiPS7lBym4zmj
         7XONciArc6J6C7PUN35rDu8PFag2WysE6B48abfVguh/pZKpHLoPbn3PkcWwp/Vv/9q/
         pXYAlWwBLQuHqVbIrn3lIxp/LKWy+nEdqWIW1WOZalLd+WFo7hTK67nES4yjNSPItPSR
         dMuM4RksG5KAnHfsZmD46XmfPbZ4KCrDYxiXxfZEGEo+OaCKbc6BSuUp+1z6MsT6fgEm
         QlsA==
X-Gm-Message-State: AOAM531pEywicOhEzfvLo4ZnOAuT2aOsAxb8A3cVxIoEdJ3KX6Aqsqc6
	He4hRgHL9s+iGMSscS2LuoBsoBrIBu+LLjANgBkaGAwCYeI=
X-Google-Smtp-Source: 
 ABdhPJzk18mVYznrH1sLosLMdF2ICon2nE2Wm76g3Lerylv/lnTWgF4CvfKIHowsOTil6ySAlJSRMV2Zj/0bDvDVme0=
X-Received: by 2002:a05:6402:1d50:: with SMTP id
 dz16mr2658013edb.385.1637631672586;
 Mon, 22 Nov 2021 17:41:12 -0800 (PST)
MIME-Version: 1.0
References: <20211122163459.41079-1-max.krummenacher@toradex.com>
In-Reply-To: <20211122163459.41079-1-max.krummenacher@toradex.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 22 Nov 2021 20:41:00 -0500
Message-ID: 
 <CADkTA4PdbYSU+DMsh_wd58zsrKo0xVOTCAroZhvXHiVR2BNE5g@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/2] perf: sort-pmuevents: some fixes
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 01:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158595

On Mon, Nov 22, 2021 at 11:35 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> I am trying out a kernel recipe using linux master, 5.16-rc2. I found
> that perf fails to build in do_compile with such a setup.
> Root cause is that the kernel did add 'static' and 'const' to the
> arrays of structs which sort-pmuevents does sort.
> This is addressed in the second commit.
>
> While at it I noticed that there are some struct arrays which neither
> have a name or cpuid element with 1 array element. That 1 element was
> dropped. I did not verify if that causes any issues at runtime, however
> that behaviour was improved with the first commit.

What MACHINE were you testing against ? When I build perf against my
-rc2 dev kernel, I still run into the build issues with these commits
in place.

I just want to make sure that I'm not seeing something different .. so
I can do some runs against a similar config as you are using.

Bruce

>
> Note that the kernel itself doesn't build either as after 5.15 it now
> does try to run the dt_binding_check for which the kernel recipe does
> not provide whatever stuff is needed.
> I just did a revert patch for commit 53182e81f47d ("kbuild: Enable
> DT schema checks for %.dtb targets") to get over that.
>
> Max Krummenacher (2):
>   perf: sort-pmuevents: don't drop elements
>   perf: sort-pmuevents: allow for additional type qualifiers and storage
>     class
>
>  .../perf/perf/sort-pmuevents.py               | 28 +++++++++++--------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> --
> 2.20.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

