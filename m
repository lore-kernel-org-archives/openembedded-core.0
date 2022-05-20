Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1590AC433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 14:36:23 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.9489.1653057381589381524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 07:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UvtRHzvR;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id n13so14100573ejv.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jy9SLchAaXzEYPyumqup4h87ikY+5rlZx73MhRzO8RA=;
        b=UvtRHzvRn/B6xLqAs2bCMxZofhAM1bzftIbcms72VJ2oOpkYWbt0noFhYnhUGvYGVW
         6aW/JgCv7/1iErq+9E4E92BXPOCewd9o2JcznlqY42AkXrAEbv3lbZwZY4xf2RAH6v9i
         qPzpleUQD9oy8ebQMlp2j5mU6cm48ipmSuIQtJu1IxZQySzmPiTvoU80P1bFiOGl0JWL
         RJP4mC9bjCj3uMTiiKSKNY2MHWZH4RqOy97IAmUoKCc/q7dypywk0ybshibiq36CNh+1
         mO9M//VjkrwL2xMK6CiQkLtcKhuOKLeGckfIhKLrfrLQZnVZlJQtn7I8vyQg6xd/vubA
         +cLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jy9SLchAaXzEYPyumqup4h87ikY+5rlZx73MhRzO8RA=;
        b=gpMm5hvMspFKHtu3PuV5LkGK9cSMvFCE/UJKDB4Pld/icpUS9cbMw2QI9YBTWPM655
         QbH2PhGOcwKIjrwC03nipo3cu0GTIoIQ1o+B/weJ1haxKdAmZyB+AyP9S5qRjKkPM9Pq
         yr2MmFuT2jmoK63R//PDxBWK99NE3ODD7tCn4LW0soRmLjEN4uI+9d0gz9F670U1M6dl
         8TVdNNs5u7M9cR3Iy5CzW9MPe+o4UZDOTgK2HctZtX0Y4zWONzZI/YqswXpvPL1nnjPx
         Eq5I04iO3tkfRxEXLU+P8/+wl+sRjfhIu4cAwt7JJDgqrRfEIPy3vfh6HKMFA9gSbapk
         QDdw==
X-Gm-Message-State: AOAM532BzUJa1+FNh2+UmBaglMbva3MNeEXzGSRz56y6s198qIhKLPet
	9yH+qL7fZWAKfsgYbUYFJtoiKmWWewAkXKhUYO4D5Q==
X-Google-Smtp-Source: 
 ABdhPJw50B5cezpM1m5ad/bCEnUs9l1nsv+fVISTxpbIkbAhfUe2x6CbIGSbgTO4JdRFDhR4JNfdtAVr20iwvqQ+Als=
X-Received: by 2002:a17:906:478c:b0:6f4:e6c6:526f with SMTP id
 cw12-20020a170906478c00b006f4e6c6526fmr9330811ejc.41.1653057379540; Fri, 20
 May 2022 07:36:19 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAOSpxdZ7Nqe8XKFRgrNXp3Sx_LgajemLg3QNyTxf0vSHfcLcrA@mail.gmail.com>
 <2277.1653048267139448562@lists.openembedded.org>
In-Reply-To: <2277.1653048267139448562@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 20 May 2022 04:36:08 -1000
Message-ID: 
 <CAOSpxdap4dyvj-uwiurSs+ZG3o+iZfe_Ya0a+h3SUncEe-skfw@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] libinput: Add fix for
 CVE-2022-1215
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 14:36:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165940

On Fri, May 20, 2022 at 2:04 AM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com> wrote:
>
> On Tue, May 10, 2022 at 10:50 AM, Steve Sakoman wrote:
>
> Extra newline above silently inhibits application of the following two hunks!
>
> Hi Steve,
>
> Can we raise a bug in the Yocto for this? Because it seems a serious issue where the patch is actually not applied and bitbake not giving any warning/error for this.
> Mostly if sometimes it should fail with the do_compilation only, but sometimes if the dependency is not with do_compile it will not fail which happened in this case.
>
> I think we should file a bug for this and some expert in patching tool should take a look at that.
>
> Richard, Steve: Suggestions, please.

This particular case is a troublesome one, because technically that is
a well formed patch -- the new line causes the following lines to be
interpreted as a patch footer.

I tried a couple of patch checkers and they did not indicate an error
with your patch. So I am not sure how one would test for this without
generating a lot of false positives on patch footers.

So I think that the real lesson here is to not hand edit a patch
without really carefully verifying that it does exactly as intended.
It is much safer to use something like git format-patch to generate
the patch. Yes, more work, but the odds of a malformed patch are
astronomically lower!

Steve

