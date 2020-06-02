Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com [209.85.161.68])
 by mx.groups.io with SMTP id smtpd.web12.7095.1591091074798049772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 02:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GB7G13wp;
 spf=pass (domain: konsulko.com, ip: 209.85.161.68, mailfrom: paul.barker@konsulko.com)
Received: by mail-oo1-f68.google.com with SMTP id i9so2030352ool.5
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nJFzaQdeAug4a7IeVEsM+J6pYc6f2tM5A/FsC6tH+aI=;
        b=GB7G13wpK62aIkpqqh0oirL4C53rysJnGhHbCcdEegf1zdyGP8qz8x1ELmBYi0i0MR
         vVYI5hvRu6m7AJJrYldb6bnpCXW5hup9VPGMHjONMN2cbQJ/WgiTrJrCzdLCCQOv7vWj
         jFkfyRpLjbckotCYybArft3wbcGxsdyO2Z3Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nJFzaQdeAug4a7IeVEsM+J6pYc6f2tM5A/FsC6tH+aI=;
        b=VTDPfmHrtPmi7WusHA/Ycs/I2avbseGbT3WvBNOD+eGmAPH9HBmYGnoDHKm6UnnPuU
         JWNv7lSl9z8+zXXPS88CqcnrRntSgbbxEFIxoh5O8U7lmz4mWUXC0Vv5aIt3jikXyJ/z
         ZoXUopo24OKq6vAKONypfEU3rNukZ7L6/NIpJi7F4K6Q5M3UN17rZfQq2DMMtFfnuR5n
         zaOkxmPiIu2lbMyQ1ktQfLhZpu1Tx+usJbjS9QoPgYL00QlIxRWpxovitfzwAyWUvoQQ
         vNtwh0qo9wPwfIPzSInoehAPeklYQUbRJVEubSNXg0c87S5b662gT1KzjLnWDyNSu8yy
         GCtA==
X-Gm-Message-State: AOAM531efR4XipBGfY60vTEUBmiduic4U/iGWkgk8hhDubVNti7XTcIl
	tBCk5TsVoaTO3fECGo7P3Fdort2gFuuWBlDftbqP1fO1WO8=
X-Google-Smtp-Source: ABdhPJy7lNvgs/tkalpuVgr/ccLzsaTEXc9DjIqFWURLaEZLozJOeCYo0niBtzpLVGornXH7w7YuzJOO+NDkbCtLuQk=
X-Received: by 2002:a4a:b146:: with SMTP id e6mr19906145ooo.68.1591091074056;
 Tue, 02 Jun 2020 02:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <160EA27C0123740E.25148@lists.openembedded.org> <4409bc1a-7bf3-65b3-8d4a-b75fa7c53e72@kernel.crashing.org>
In-Reply-To: <4409bc1a-7bf3-65b3-8d4a-b75fa7c53e72@kernel.crashing.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 2 Jun 2020 10:44:23 +0100
Message-ID: <CAM9ZRVvMy4jc8HvFRpKhXY-zoAoLr8LnC8=6UzC3h9Yn4Bj5UA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] sstate.bbclass: When siginfo or sig files are missing, stop fetcher errors
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 May 2020 at 20:11, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
>
> Ping
>
> I noticed this hasn't been integrated or commented on yet.
>
> On 5/13/20 11:12 AM, Mark Hatle wrote:
> > From: Mark Hatle <mark.hatle@xilinx.com>
> >
> > Prior to fetching, the system checks if the sstate file is present
> > either locally or on the mirror.  If it is, then it goes to the fetch
> > stage.  Up to three files can be fetched, sstate, sstate.siginfo and
> > sstate.sig (if signature validation is enabled).
> >
> > The previous pstaging_fetch function would iterate over these, and if
> > a download error occurred would spew forth a great amount of fetcher
> > failure messages as well as stop fetching the next item in the set.
> >
> > This was resolved by adding a fetcher.checkstatus() call prior to
> > the download.  If the file isn't present, then the exception will
> > be triggered, and no fetcher failure messages will reach the user.
> >
> > The exception handler is then modified to be a pass so that it will
> > loop and pull the rest of the files that that are requested.
> >
> > Additionally, a check for the existance of the .sig file was added
> > to the sstate_installpkg to avoid an error trying to load the .sig
> > if it wasn't downloaded.
> >
> > Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> > Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> > ---
> >
> > v2 - fix a typo in the error message about signature not being
> >      present.
> >
> >  meta/classes/sstate.bbclass | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index aa9c30b4e1..375196ef21 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -355,6 +355,9 @@ def sstate_installpkg(ss, d):
> >      d.setVar('SSTATE_INSTDIR', sstateinst)
> >
> >      if bb.utils.to_boolean(d.getVar("SSTATE_VERIFY_SIG"), False):
> > +        if not os.path.isfile(sstatepkg + '.sig'):
> > +            bb.warn("No signature file for sstate package %s, skipping acceleration..." % sstatepkg)
> > +            return False
> >          signer = get_signer(d, 'local')
> >          if not signer.verify(sstatepkg + '.sig'):
> >              bb.warn("Cannot verify signature on sstate package %s, skipping acceleration..." % sstatepkg)
> > @@ -733,10 +736,11 @@ def pstaging_fetch(sstatefetch, d):
> >          localdata.setVar('SRC_URI', srcuri)
> >          try:
> >              fetcher = bb.fetch2.Fetch([srcuri], localdata, cache=False)
> > +            fetcher.checkstatus()
> >              fetcher.download()
> >
> >          except bb.fetch2.BBFetchException:
> > -            break
> > +            pass
> >
> >  def sstate_setscene(d):
> >      shared_state = sstate_state_fromvars(d)
> >
> >
> >
> >

I see this has now been committed to master.

I've previously discussed issues with the separation between
time-of-check and time-of-use for sstate artifacts (see
https://lists.yoctoproject.org/g/yocto/topic/71426351 for the thread).

If checkstatus() succeeded in sstate_checkhashes() then the sstate
artifact was marked as available. If the download then failed in
sstate_setscene(), bitbake would fall back to running the real task
instead of using sstate, however the build would be marked as a
failure with bitbake returning non-zero even if the targets were
successfully built.

Should this patch fix that issue? I'm not 100% clear on whether this
is the same issue or if your patch is just addressing the case where
one of the files is present but the others aren't.

Thanks,

-- 
Paul Barker
Konsulko Group
