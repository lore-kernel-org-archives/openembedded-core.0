Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2323BCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 17:12:15 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.20657.1758215529968230826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 10:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FahDs8D9;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-78defc1a2afso14909476d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 10:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758215529; x=1758820329; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JGRDLGlq5tbXNGNBGNsPVrF69e6eDz+mXG8RqUvfhfU=;
        b=FahDs8D9G0j7Xo88kAuMeAJm2+YdE0duzUI7xcO8YHl1oDk2XTiznG9L58S2E82rZC
         Cpk1tUHHXQbsJBQx1xQIvEng3q4loykqBtcsVZqhHdYmQ72LC9sYVMotgy1uIX642ya0
         sqZOiaT0KJS/O4OPsOM2mTf86BUt8jrDmydpZCwCv5FPhrQApM22ZF/z3SQadjKzwZGa
         OAaPpSlN6hWp6+gZmbS/WENuvSS7976/AxbP3l3Xd+KyuomiaQ1/O6ae16JWz0YnSz/q
         bR3rVHB3QtaUPXgOreyedeU4sddQRr8fbMZi8ukIICevTlJdmaMLQOv9Nmo4gDfJXUy5
         okBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758215529; x=1758820329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGRDLGlq5tbXNGNBGNsPVrF69e6eDz+mXG8RqUvfhfU=;
        b=DNF1QvQNB4oYAotn5CjG3Z2ylSuxanjEkxVrlKZov7UUrKXxF5LwQek+AWzFib+04f
         SxNNd4MGMpcZcAB97k2iaImyk5cN9mGmDjwtEEMg04CxaCi9/WKJA+nMm6JvOxzGj6Jf
         VDh584o82JVSMpzHtRjuMJGT5ZUUGeOnxobNxXSeu57Q8LUio9AYKr5DPLyw5W9A5oZA
         U1Osi2NhdoYmsTwxJbRV4Npv0Tksfhs7N9NPF/Ncv64Nc//aC6mFCvEM2VneOUlpVpnY
         qhfWhbl2nmSI0/zTk390HSU8pep4ZXKGLWyay6sq7lILxU2bR6ap1nhsqjYONbOcq0sO
         M8TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuWrGXBusIlpWYoKmqSEYTwsx2XObjoJPeE4W3XtYHNCbYgmMj/TXPYC2NoOKTr1vImypIelY94wWrfwmHix5YzA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YznnIDDHlUAcW97xP9RgIGIv02pFVp8thu0GGbD5AD3eGkAnUr9
	aQeFHJK2NeE69MZBiyL/WCSMpW3H0MaIFELrSn8UqEZMFoMJ3wjWPFpHWk/wl2wEAiZZUEK4lOy
	0n10gYrjhEsdhKOMAYu5rRDo1x1zHPls=
X-Gm-Gg: ASbGncssUqmyUCJgSg0AuqDpy1R68DlantAmjEFK98RslcVYsGCv8QuFcYrk7C8defA
	yi5Mrx2SS7uz2IEq4Hcf2Y+oZeL5IeKpyfCWlRDdgoJ2kPVC3NEkc6ta1WMRgbGzxqDLxTLs3rY
	liK8v2aVnTKAxgoAOkThLC8mmPPFJdAmO6sVnAhefcVmC6o6q49BckhkhQOK1O32bS9q26S2PZ/
	8lyPuuCK7o2paUgZsDeEXwhrW+5wsuxjMjmj3giLW10QfR00R++suL2fIKA0R6Mvz/v8+yIcHL0
	9uvS0W60852TPOjH86KpqBw=
X-Google-Smtp-Source: AGHT+IEdTm+AfMEoA/pWQzWbbtihhW1a5bIXRv1jteqoUqK+wSJ0Z1tIguvuht45btZqDgYCqWISSR/W8DsEUEOc40s=
X-Received: by 2002:a05:6214:410a:b0:710:9995:ced4 with SMTP id
 6a1803df08f44-799155a2a44mr2660536d6.17.1758215528687; Thu, 18 Sep 2025
 10:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250827064940.16074-1-r.gruenert@pironex.com>
 <ea6b3f3beb56b2cb5d2eb92562b6dc9990d94b1f.camel@linuxfoundation.org> <1864457B0136FCCA.29923@lists.openembedded.org>
In-Reply-To: <1864457B0136FCCA.29923@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Sep 2025 19:11:57 +0200
X-Gm-Features: AS18NWBZTOioTezbJT3upTtUfW4FOxSr4vSCOQN1bntiD0dLU7dQji7S9spT8Ww
Message-ID: <CANNYZj8v+b6Hpo-YLGW7XWMNeoR2PfpFErDaya+CdEka0LDhfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] scripts/runqemu: raise an error when bitbake
 was not found
To: alex.kanavin@gmail.com
Cc: =?UTF-8?Q?Richard_Gr=C3=BCnert?= <r.gruenert@pironex.com>, 
	openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 17:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223651

On Thu, 11 Sept 2025 at 17:55, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Thu, 11 Sept 2025 at 15:31, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>
> > What is interesting is that your patches do pass testing. It is
> > therefore possible we've changed things and this codepath isn't
> > actually needed any more. That may be due to the qemuboot config files,
> > which we probably didn't have when OE_TMPDIR was added.
> >
> > Either way, we probably do need to try and clean up this codepath
> > before this change can merge.
>
> There's another spot at the end of the environment getter function
> where a failure to obtain the environment results in the getter
> returning nothing:
>
>             try:
>                 return subprocess.check_output(cmd, shell=True).decode('utf-8')
>             except subprocess.CalledProcessError as err:
>                 logger.warning("Couldn't run '%s' to gather
> environment information, giving up with 'bitbake -e':\n%s" % (cmd,
> err.output.decode('utf-8')))
>                 return ''
>
> If this code path has been executed this *might* explain why testing had passed.
>
> Anyway, I think this is all horrible code, and the environment getter
> should fail if it can't get the environment, for any reason. Then it's
> on the caller to either not try to get the environment in the first
> place (by checking for presence of OE_TMPDIR first), or handle the
> fail.
>
> I apologize that a simple usability tweak has turned into a total rabbit hole.
>
> So my suggestion is:
> 1. Keep the current patch.
> 2. Add a patch that removes the above try... except block so that the
> environment getter function does not return nothing in any
> circumstance, and always fails if it can't get the environment.
>
> We take that on the autobuilder and see what fails and when, or if
> nothing does. Then we can formulate what can be removed/reworked
> around the OE_TMPDIR getting and setting.

I added the patch in point 2, and ran a-full on the AB. The outcome is
that nothing failed:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2401
(the three oe-selftest fails are due to an unrelated issue in
bitbake-selftest for which a fix has been sent)

This means we can indeed remove the code paths that set and get of
OE_TMPDIR, as they are never used, and then change the environment
getter function in runqemu to always either return the environment or
fail with an exception.

Richard G., are you still able to work on this subject?

Cheers,
Alex

