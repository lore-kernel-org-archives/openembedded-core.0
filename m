Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FF1C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 17:58:04 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.29296.1639504683689235059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 09:58:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kqqbErVe;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id a2so19123682qtx.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 09:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O0f2EyzZ2xBlOK3qJyhykFmqfgLr4vokYbrEH2VlYZg=;
        b=kqqbErVeFhDYENWeeeminiHjnSRrGgUY+qzq46wVkLN+0AlLPUz3ympwrfDwI5ZpVt
         W1eYI/tQaL6FmSomxCCFNQ2+InLFfwgw3BoADTz54ovIWAtiSoL0LsA1KiuauOdUJ4I0
         TCIjYU/l7614F123LHgpHslw9wJAkwnnsLIg0aagZyJYs5r2sgW4BsBetb78d0st7vYT
         efzDHrByn5qS5ciO//BC2qLk5ZSSJCTbJZuDMHvC/Re99P592tDPxeoqt2v38K7sfwum
         xFXEIEpNFgL65L5MfkdovyHafnDyu0YXg0pPZmsw57dXVpR4jcL68lqBeAcC9Wox+tCC
         NnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O0f2EyzZ2xBlOK3qJyhykFmqfgLr4vokYbrEH2VlYZg=;
        b=Djya9dnXZxRkg6UzOY1BF57k9w2jXdzGZdcsd1yAyc5gLBKfsFJsGi02oSXK6wse1I
         GN+ztkrLsJyNwwUvVWk+3g3z/Pt2p7bxoeTplFKtFGkhZxAdGG2mwIYXtv38oYSGMPpS
         I7x0IOPT5G4eM/bjPx7G5UUn8IPTu9869W0hnO8hXIliEebnmvhdDk++vlkBhhalhuy/
         +l2FzMyS3q8ZqujtLnsnrH0+czJuBcByFO0XUo1cq+YNQLPBCLs7QTR35EawmWqJBHV7
         dQVLGw1OSrxjDTo3zIfBsdrQEu/z+D5gPKX3WY7zaCUytj9MUaZLXrK1ZN/rHwDkl9yI
         1RYw==
X-Gm-Message-State: AOAM532NnnruzuEOh4E1HLAnRUYcdN1DpxEllwV3xfYR6zx+oMQsBPaH
	8GEYiuxxj3QzFF9K81G9Y3XRanCAosN6fxbmgM8=
X-Google-Smtp-Source: 
 ABdhPJyJYzcRutAdTvwBqtBbdVi4hPwgq2YZhswmZW+XENhBZGIJj9OuVj8qCO1uf+48BAjCsOsb4yQa27sgMNcgJTw=
X-Received: by 2002:ac8:518e:: with SMTP id c14mr7619883qtn.665.1639504682787;
 Tue, 14 Dec 2021 09:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20211214104613.19264-1-pgowda.cve@gmail.com>
 <e76b64a8-5651-378d-2e50-68dde5add6c1@windriver.com>
In-Reply-To: <e76b64a8-5651-378d-2e50-68dde5add6c1@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Dec 2021 09:57:34 -0800
Message-ID: 
 <CAMKF1spjF4dus=QLGLbZSPFfv5knJ5_NDFgXZM7fyVtA2EOQMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Fix CVE-2021-42574
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Pgowda <pgowda.cve@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
 "steve@sakoman.com" <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <rwmacleod@gmail.com>,
	umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 17:58:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159702

On Tue, Dec 14, 2021 at 9:31 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2021-12-14 5:46 a.m., Pgowda wrote:
> > Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=bd5e882cf6e0def3dd1bc106075d59a303fe0d1e]
> > Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=51c500269bf53749b107807d84271385fad35628]
> > Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=1a7f2c0774129750fdf73e9f1b78f0ce983c9ab3]
> > Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=bef32d4a28595e933f24fef378cf052a30b674a7]
>
> Ugh, that's quite a bit of patch to fix this bi-directional Unicode
> input attack.
> I'm fine with these changes though.
>
>
> I do wonder about how or if we should fix the CVE in older releases.

this is adding a new warning to help mitigate the problem, this is not
a gcc CVE per se.
so perhaps backporting to older branches makes sense, this looks ok
for 11.x here

>
> For example, has or is there an indication that gcc upstream will,
> be backporting these patches to:
>
> $ git branch -a | grep " releases/gcc-[10|11|9]"
>
>    releases/gcc-10
>
>    releases/gcc-11
>
>    releases/gcc-9
>
>
> ?
>
> The current state of supported branches is:
>
> Branch          YP gcc ver      Latest gcc ver          Upgrade needed?
> ------          ----------      --------------          ---------------
> master          11.2.0          11.2.0                  No
> honister        11.2.0          11.2.0                  No
> hardknott       10.2.0          10.3.0                  Yes
> dunfell         9.3.0            9.4.0                  Yes
>
> https://gcc.gnu.org/releases.html
>
>
> so please check with upstream to see what the plan is for
> the 9-11 release branches and this CVE and report back here.
> Feel free to volunteer backport patches to gcc upstream if needed.
>
> Are people CCed okay with upgrading gcc to the latest release or
> ideally the next dot releases that will include a fix for this CVE
> if it happens in the coming month or so?

I think doing a bug fix dot release upgrade might be ok. Although we
would have to do some good amount of testing. But I am in favor

>
>
> --><-- snip --><--
>
> --
> # Randy MacLeod
> # Wind River Linux
>

