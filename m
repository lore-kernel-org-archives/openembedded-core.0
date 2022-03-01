Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F258C433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 01:55:55 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.3570.1646099754320383874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 17:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ac0YRJAD;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id w3so20051877edu.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 17:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8TBqpJV9lYN+LXgEJ3XczWBzUTi0mSuMlXLO4PrvQs=;
        b=ac0YRJADozPgYN1VWWiBgKdtT64Jt1LW9ZHxtrgnZo1eQ3SnYkVrDVsqd6KxujUKZ1
         FlYT4kfxWRBBCioM2sd1kcx/ifukaMALFZTv+a5sV7Hl674op8xpp059VXY2whzeAfQJ
         fo12yrYfEA7LEnjXvJ3MUcEJKjoRR///5PMUjzlGDREdgR8MWtu1dvyst0cnvV++dQIQ
         /UCjCy0satPSyoLRG3ycVSxhHW2afm/WQD1/hSSzHZ4x1vj78/qWB83FF9tdOniMMxl7
         EZoTGKsvRxTqGFSzRzvASC4Tbh3g3EbjNKhl7DODxdib4gLGdFqdFPDAKg059QA9Lh7r
         aByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8TBqpJV9lYN+LXgEJ3XczWBzUTi0mSuMlXLO4PrvQs=;
        b=QTqmUEaRy1EcB3w/KeiazXAXjC+53XGyjMTBloxIidJrcdlxHaEa6Yi8l5dL42dzmO
         Of7YH1w6wxsGDgnOUiZnXLobhnjpH92psJ6xL3fM9RqSX3oegyO7Gu3ARqKEWonRiRNl
         M3iEAclPqKiBlP6OosWI5UYssWNSRTjIjLx3wxxC1RaHluzn/iwXWT6oYNBBUdEOc3sp
         C3Nk1IHFjxhpXcOd2noFxUbGDQV/emu5y6G9d97iQuTaqEGMHAs2sD+64tftgEdvPTw0
         MEGk9Rl6VE2xrAgMV/jV530LRlTmQrdYFW4wO2AYOVANbPWxs4fObevkLpLmkWgAqRBg
         FJEw==
X-Gm-Message-State: AOAM53339BhejmByngEuIGaMBlOtncJywUQhXfx2YyShvOKHfb95Gx4X
	K5mqp4S88Mycl98dWUakcGzosHqOqbphlZfh5IQ=
X-Google-Smtp-Source: 
 ABdhPJwEBvz+7fakzOQyHb66EYEpHA9PdFnR8tj9W9Eo8Vt21xYODJ812cDEMTIGFYTdtH/Scl4Jfm0bvigIblf8ong=
X-Received: by 2002:aa7:dcda:0:b0:413:2c17:d969 with SMTP id
 w26-20020aa7dcda000000b004132c17d969mr21993990edu.185.1646099752771; Mon, 28
 Feb 2022 17:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20220228235433.3948994-1-andrei@gherzan.com>
 <16D81CEE77B62019.3953@lists.openembedded.org>
In-Reply-To: <16D81CEE77B62019.3953@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 28 Feb 2022 20:55:41 -0500
Message-ID: 
 <CADkTA4MEqxJc7=RNEKS4emNKOy_7ytPs4rF6F5E=EPCCMTLQSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] go.bbclass: Allow network in do_compile
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Andrei Gherzan <andrei@gherzan.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 01:55:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162522

On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan <andrei@gherzan.com> wrote:
> >
> > From: Andrei Gherzan <andrei.gherzan@huawei.com>
> >
> > Compile pulls in the go.mod list requiring network. Without this, do
> > compile would fail with a similar error to the following:
> >
> > dial tcp: lookup proxy.golang.org: Temporary failure in name resolution
>
> This is something that needs to be carried in your own layers, IMHO it
> isn't appropriate for core.
>
> It isn't about the fetching, it is the entire gap in functionality
> that we are missing if go starts fetching dependencies during compile.

A further thought is that if this is for go.mod issues, there is the
go-mod.bbclass.

Perhaps enabling it in that class and doing a bbwarn about go fetching
dependencies would be appropriate ?

Otherwise, someone may not know that this is happening and that a no
network configuration has no chance of working.

Cheers,

Bruce

>
> Bruce
>
> >
> > Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> > ---
> >  meta/classes/go.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
> > index 9c4c92bffd..dc246c72cb 100644
> > --- a/meta/classes/go.bbclass
> > +++ b/meta/classes/go.bbclass
> > @@ -113,6 +113,7 @@ go_do_compile() {
> >  }
> >  do_compile[dirs] =+ "${GOTMPDIR}"
> >  do_compile[cleandirs] = "${B}/bin ${B}/pkg"
> > +do_compile[network] = "1"
> >
> >  go_do_install() {
> >         install -d ${D}${libdir}/go/src/${GO_IMPORT}
> > --
> > 2.25.1
> >
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
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162519): https://lists.openembedded.org/g/openembedded-core/message/162519
> Mute This Topic: https://lists.openembedded.org/mt/89464905/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

