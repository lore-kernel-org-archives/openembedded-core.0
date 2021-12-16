Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA6EC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 17:09:48 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web12.13249.1639674587639363092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 09:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=Ol2y+9O1;
 spf=pass (domain: madison.systems, ip: 209.85.208.174,
 mailfrom: matt@madison.systems)
Received: by mail-lj1-f174.google.com with SMTP id a37so38433316ljq.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 09:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sUOMcai48m9rhFXmaVZfKBQh/yq60wg5PkZ4uDabjjE=;
        b=Ol2y+9O1kM205ixmZnIddIu3Z8WtPpqbhSIGirWAtsCHinjYsAWZdIJt8qvwB9uJ92
         1PUXDhTDGf6ggW+mSck6tmp90xTtlrVBadhDrDppWYK5yQNz2YGrH4d7vN0emI1DsYsl
         1mBGLAvOJSvd6Vr4wS9EdR1HBiCmyh11NEgXkxSZO98cbpxFQrcZQzJc0ncvxYxDhxdj
         w0KgUK4nAcjeEHh1RRzyILUGF1XG5aDFinXlLn0WDJQ3GBM4InbAOZexcxU6O+naiY/f
         lr7HjBrkR02xTW1rWKQegPOOAQ/T3tVIZnHEUJRnkxjPJjfeunQ/tdNES6sNLKg9PkTt
         UfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sUOMcai48m9rhFXmaVZfKBQh/yq60wg5PkZ4uDabjjE=;
        b=v2GZiro2MnouwmmSkhNMMEuqZgyKLxtQs6PyBo9Fav5KB+C1kgi2b3gWpw5o8U0ewW
         Mg+/RgHVA7XKcV61oWRsr1i35f9nAVIVyu4xXJ402WCnIcmGrEil5yPNOfED5b8vkOgN
         k7XXMEDl98cZjMA13EVQhCtQAvDhenTAHeJPIhwY5hMEwV5wFCTaONzrxi1lNDQ2HOGF
         P0x1H2H2p1EHC9274fl8DIAHfuqxgw+L+NtabYjGaH20sDg8H3d1E0gvgEVWvwNgjsis
         qv79MwBcss92dEL2ifOWuQ6jOywBASiqn/Mq8uERA/DlIRLzGScJ+xETnGtHvMG5zaUJ
         6Hqg==
X-Gm-Message-State: AOAM531zzSOEWzA9yHchftLg9NcOKI+MqK7KtFxvUF8+HQ/vji/9roMa
	0EUJ3w4PfPONDNHlsVCYJFKmgMjnH9lq3NdwK/tlPw==
X-Google-Smtp-Source: 
 ABdhPJw0rGbUuGH9776AUbSyHNEK0LEnekWj8VpwbVvfylVs+eAhoIV8D/5g1QozyORwLZk+UB1jM+CM8srt/kgbuDU=
X-Received: by 2002:a2e:bba0:: with SMTP id
 y32mr15561923lje.138.1639674585613;
 Thu, 16 Dec 2021 09:09:45 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAGgRHJqMNi+rfsiojpsxTG6e2JurK22zwK6CLOoyzz2BW0RQmA@mail.gmail.com>
 <CAJdd5GYn5ozdUsdhd67+xXESuyyTjxyr=-zgRox1zvmL+pLrww@mail.gmail.com>
 <16C1473316FC0603.32027@lists.openembedded.org>
In-Reply-To: <16C1473316FC0603.32027@lists.openembedded.org>
From: Matt Madison <matt@madison.systems>
Date: Thu, 16 Dec 2021 09:09:34 -0800
Message-ID: 
 <CAGgRHJoO0ZkbFdeLXJOUn1JEV0gbv9YHzL2EB+r9SUL8xr36rw@mail.gmail.com>
Subject: Re: [OE-core] cargo fetcher, SRCPV, and setscene issues
To: Matt Madison <matt@madison.systems>
Cc: Joshua Watt <jpewhacker@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 17:09:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159798

On Thu, Dec 16, 2021 at 7:53 AM Matt Madison via
lists.openembedded.org <matt=madison.systems@lists.openembedded.org>
wrote:
>
> On Thu, Dec 16, 2021 at 6:47 AM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > On Wed, Dec 15, 2021 at 8:16 AM Matt Madison <matt@madison.systems> wrote:
> > >
> > > I'm finding that none of the Rust recipes are getting setscened in my builds off
> > > master due to the the SRCPV hack that was added to make the cargo fetcher
> > > visible during parsing. There's no error reported about it, but by adding an
> > > exception handler into the sstate code I tracked it down to pstaging_fetch()'s
> > > using d.getVar('SRCPV').  Since the cargo fetcher doesn't advertise
> > > srcrev support,
> > > the base fetcher class raises an exception on this, causing the
> > > mostly-silent failure.
> >
> > Hmm, this is strange. I have this recipe:
> > https://github.com/JPEWdev/meta-phosh/blob/master/recipes-graphics/squeekboard/squeekboard_git.bb
> > that is using the cargo fetcher and it is definitely using sstate like
> > I would expect; perhaps there is some other strange interaction with
> > another class?
>
> I'm just talking about the rust toolchain, libstd-rs, cargo, etc.
> It's simple enough for me to reproduce with a bare-bones setup:
>
> 1. clone openembedded-core and bitbake
> 2. init build environment
> 3. set MACHINE="qemuarm64" in local.conf
> 4. bitbake librsvg
> 5. Copy sstate-cache contents to a web server
> 6. Wipe build workspace, re-init, and set SSTATE_MIRRORS to point to
> the web server
> 7. bitbake --setscene-only librsvg
>
> I've attached the cooker log of a sample build.  You'll see from the
> sstate summary that everything was found, but there will be warnings
> when executing the setscenes.

And if I apply the following patch:
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0326d27c74..ffc3b08b7d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -761,7 +761,12 @@ def pstaging_fetch(sstatefetch, d):
     localdata.setVar('FILESPATH', dldir)
     localdata.setVar('DL_DIR', dldir)
     localdata.setVar('PREMIRRORS', mirrors)
-    localdata.setVar('SRCPV', d.getVar('SRCPV'))
+    try:
+        curpv = d.getVar('SRCPV')
+    except Exception as e:
+        bb.warn("Failed to get SRCPV: %s" % e)
+        curpv = ''
+    localdata.setVar('SRCPV', curpv)

the setscenes work, and the warning is:

WARNING: libstd-rs-1.57.0-r0 do_packagedata_setscene: Failed to get
SRCPV: Failure expanding variable SRCPV, expression was
${@crate_get_srcrev(d)} which triggered exception FetchError: Fetcher
failure: SRCREV was used yet no valid SCM was found in SRC_URI
The variable dependency chain for the failure is: SRCPV

I'm just not sure whether that's the right place to fix this.

-M


>
> -Matt
>
> >
> > >
> > > There's no issue if the sstate package is already in the local cache;
> > > it only affects
> > > builds where I need to fetch from my sstate mirror.
> > >
> > > I'd submit a patch, but I'm not sure what the right solution would be.
> > >
> > > Regards,
> > > -Matt
> > >
> > >
> > >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159795): https://lists.openembedded.org/g/openembedded-core/message/159795
> Mute This Topic: https://lists.openembedded.org/mt/87744591/3618418
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [matt@madison.systems]
> -=-=-=-=-=-=-=-=-=-=-=-
>

