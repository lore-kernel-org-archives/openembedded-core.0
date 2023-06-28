Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCBAEB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:26:58 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.17961.1687962408194756149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=M7Y3vGHr;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so3929831e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687962406; x=1690554406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rF++x0nwW7Pnvfq+0n6IkIQVXP2V4e+L7kjbPH6Rt3c=;
        b=M7Y3vGHrrDJeJe8ECV1mcFcapUL9NdQf5pVGVyKwY+peAvWGbjKH4qdiJuJD68i9Ce
         ef5dDfVI10YrdWt4k9xUz2gHB1m8azOitwDQLcHR4m6j0h32ws7vNhE5r123SeiEEKug
         ylsXwOoTp5yHYYu+4yw9IPBpDhhLYqdC4QE7B1bc1UkotoHOd6DcqP/2YFm3wug8Tc24
         mkyAz3Chdi6kT2qTIroWYzuLnm8LARFVYkF3JEAhpR77kRqBReemtqqu6OWM6tNt69Cp
         qJAfNiaSlJg7sOdHdb+XXhnrQXqY6kbWHFLuFPn/+o+/F6Fkc0j/crj2M5HplHpVgVrf
         T/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687962406; x=1690554406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rF++x0nwW7Pnvfq+0n6IkIQVXP2V4e+L7kjbPH6Rt3c=;
        b=A+1c7xBmIefcW0/Npniw1zpwhW5l55Db8pbXefra9cRDNzd3yoGBUAZRWOeU46N0qm
         1CuxPwlCYUP5gjN5jaou81SOjdbGNxZlwfWMZoDvCC2snxWDgCxLr6DRm0kK+bIg/N8W
         CBdwyV7bjRGDtaSGKgbICm9zhx667PTRnMX7akDn1449BiQUgtLJRep0+CyhXcNhXghl
         6FnAsUqrrHQriOyUmCfzhdgsxwPgdd7cXypF0sJtfq3U2kQl2DFcSjvtBBseF6dxMpUq
         SKXdgF8wgOB05LhLOaodsF+q+ki7CmqrjjZfVDReyDVB9uhZqvB3zc6j92+PUWBcdVoV
         nWcQ==
X-Gm-Message-State: AC+VfDxrw82F+W59YRV47WlKrJBfbt3k+rXga4mp0nTe7avA+a9oFT9+
	S6NpP4Axke1Lruy6dvALVFysVRbVfFro7VUJ4xMS/vylEhEKnQ==
X-Google-Smtp-Source: ACHHUZ6BKIrmpRIfLCzzJksKzLWgxFoqpR9Z0vv5xm2G5ogj6GmMHgMn63PISvZbwKobytiy+Q0SbE7QQfvJhCG7vZU=
X-Received: by 2002:a19:6713:0:b0:4f9:5933:8eea with SMTP id
 b19-20020a196713000000b004f959338eeamr11756453lfc.3.1687962406078; Wed, 28
 Jun 2023 07:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230618090946.2478083-1-richard.purdie@linuxfoundation.org> <176CD8BADED53114.21863@lists.openembedded.org>
In-Reply-To: <176CD8BADED53114.21863@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Jun 2023 16:26:34 +0200
Message-ID: <CANNYZj-guhK1H9mJ1NCFYynQ6kkLSgnx7CrXZJ9aaeGvUcSfbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest-runner: Pull in sync fix to improve log warnings
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183587

There's an open issue for it as well:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15154

Alex

On Wed, 28 Jun 2023 at 16:24, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> This appears to have regressed glib-2.0 ptest, particularly:
> Failed ptests:
> {'glib-2.0': ['glib/codegen.py.test']}
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5273/steps/12/logs/stdio
>
> I didn't yet got to the root cause, just wanted to register where it
> happened. Note that the ptest passes when run directly and fails only
> under ptest-runner, and it somehow is specific to qemux86_64 as well.
> Bizarre, yes.
>
> Alex
>
> On Sun, 18 Jun 2023 at 11:09, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Pulls in:
> >
> >     utils: Ensure buffers are flushed after child exits
> >
> >     We currently wait for the child to exit but we don't flush the buffers.
> >     This can mean the output ends up out of sync and the END: line isn't at
> >     the end of the logs.
> >
> >     We've recently seen a lot of issues related to this on the autobuilder.
> >     Add in a flush call for all fds to ensure buffers are in sync. This
> >     does appear to improve warnings on the autobuilder now we started detecting
> >     the issue.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > index ff5629c6f9b..67dd887c240 100644
> > --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
> > @@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
> >  LICENSE = "GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
> >
> > -SRCREV = "bcb82804daa8f725b6add259dcef2067e61a75aa"
> > +SRCREV = "ea2a9cc159ad5f64ee75781d55101d7c340e0303"
> >  PV .= "+git${SRCPV}"
> >
> >  SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
> > --
> > 2.39.2
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183585): https://lists.openembedded.org/g/openembedded-core/message/183585
> Mute This Topic: https://lists.openembedded.org/mt/99601743/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

