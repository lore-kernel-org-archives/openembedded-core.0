Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171D1C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 19:42:03 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.3110.1659987713305898613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 12:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eT1O71XQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id a89so12637081edf.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 12:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9sAP5s3wiwMegrlGK9OoOFVvDVhpAHJaEyMSL2/MZbc=;
        b=eT1O71XQcSQ0+vfJdZbaFZp95VIaoU/lntJi67u5CizgAgMzied/C52cjsJqG+L5xn
         Ez0Jy1Os8Hm+OXpJEYbHW+3pqUCZUYrrsSbkuRf+78KPKr8aHFN8w/xZnE91m3iQi1vS
         VVHytub3swMGX0e3eFUuOuJmXSsjdU9hZop+ngVcGdRY39vTTEU359LGfl7TGzUlJ3Va
         rMGr03gmnZbdki7rPUhJszZzJu8v7IWY63NFlMtBgqivYQA7QE3VEoIY8k5UWTTTBtBf
         5diuWaFsevTqBg0+Zf9s77rGsP4gD5wq/raeDRzfNtoTb9UqwbuHsyNwd/DolyO+XGDE
         mzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9sAP5s3wiwMegrlGK9OoOFVvDVhpAHJaEyMSL2/MZbc=;
        b=WdUa/VyDSL1qi/Bi6ofid3J5Uwskn5jcXoVUbbOqeJcjcl4cGJ/fGmNq56X6Ck1yc0
         M4Rp+y41jHDI5yyjupjv1bMyQCFMLOg/h9UTRzvKqOrVYsXYMf4l7vwRjjp4Xns/3j+0
         8JTX1nb9ny+85G5h89gyKpkySzsLkSqwYgQ3HCmLpOWs8LUWGYUU5y9+FqgfDPgb5m/e
         tPMVHb7igd0R/LjWONsP3XTHWSpGSxQ3lQytla4uB0s7jeyIsbS0zYCg9vwkIEn19qEn
         xm0bFXX5atfTbzGK9FALB9Z2YkMRCI9KnfEaOf27xz4k2d3Lus6dY5FGQh4rUkmhPJX7
         zvtA==
X-Gm-Message-State: ACgBeo2BNY3vLUPXPsqWFpRazE1U4piPcGUqjNC0bg/SuHNuEOEOzVqu
	k0urIX4Jju/IEUTVNG9aXPXrPKgUe/ioAOvd+Nk=
X-Google-Smtp-Source: 
 AA6agR4uh/2umX9mpHEkEUJItoXvBYOxPqBYN0TkzP+GmJAFQOJfWK4uzxCuaoNjlQiMyGZW75zdkOkxf6j7gV9aqUs=
X-Received: by 2002:a05:6402:34cf:b0:43d:96fd:bdfa with SMTP id
 w15-20020a05640234cf00b0043d96fdbdfamr18927567edc.40.1659987711714; Mon, 08
 Aug 2022 12:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220808131951.2029559-1-JPEWhacker@gmail.com>
 <YvFlO0a8mT23eEqF@mail.local>
In-Reply-To: <YvFlO0a8mT23eEqF@mail.local>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 8 Aug 2022 14:41:40 -0500
Message-ID: 
 <CAJdd5GaUfPHROpMuuKwLwkjUhhsgj0oxOx475afc+2ZnGsvrrA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/sanity: De-golf regex
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, luca.ceresoli@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 19:42:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169116

On Mon, Aug 8, 2022 at 2:34 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> On 08/08/2022 08:19:51-0500, Joshua Watt wrote:
> > The regex to match github or gitlab was unnecessarily shortened, which
> > prevented them from showing up when grepping.
> >
>
> This doesn't apply since we have "classes/sanity: Add comment about
> github & gitlab archives" in master. I guess this was one or the other.

Ack, sorry. This was due to feedback on that patch, and I didn't
realize it had merged already. Sorry about that. It doesn't really
matter to me which one was merged, so dropping this is fine

I think I should have done this one as a V2, or at least in-reply-to that one?

>
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/classes/insane.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 37e10ad850..b66926f540 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -1335,7 +1335,7 @@ def unpack_check_src_uri(pn, d):
> >          oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
> >
> >      for url in d.getVar("SRC_URI").split():
> > -        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
> > +        if re.search(r"(github|gitlab)\.com/.+/.+/archive/.+", url):
> >              oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
> >
> >  python do_qa_unpack() {
> > --
> > 2.33.0
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169085): https://lists.openembedded.org/g/openembedded-core/message/169085
> > Mute This Topic: https://lists.openembedded.org/mt/92891575/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

