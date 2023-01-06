Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3187C54EBD
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 18:10:48 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.322.1673028647798895114
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 10:10:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k1rAdcWP;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id f34so3044197lfv.10
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 10:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pNfp+lG/fkBUmCyRvXMXyyYjx6tM9iehWMCrug96dKI=;
        b=k1rAdcWPfcHLhdn0e0pcRQtLsUMAR5q8g/SNumOc5eZN5lcjjaixRLC/dx9+ty6FT9
         lhAIs+Zp0KdgyzOWAg27LLbm+B8HXpCixu2uOeKFbpz5QebrCBdpBbl8MRjZKkgUah2d
         L/G0hBDUID1IU4sHC37RQhl5ZyMGql+5HMT1XipCF7kZee/Umdduk7twtYwfwZZstHT+
         gs3SL3USsD9bH8jIwlHY7tYgVj0OObiyQkuQOix2bcoNPLnepKDEik4T8NDTqKhr1G1p
         npTdkHFBPOb9A7nAxItqZaRjopl7zHGssVqj+YTRadn1xmNo9ZsOayuqG6xjTIt8tLpI
         cNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNfp+lG/fkBUmCyRvXMXyyYjx6tM9iehWMCrug96dKI=;
        b=jzqnuH7qLg722HJvQXSZh9b5SGPsXXx6MKCjvcoC2ifY12aBeBd7D15yTSVOYBSRb8
         Koz10WaDTyoy44MAwKfseRlL2nR3WFPLwUlfcGrG2oXpoAqbkW3ycudtYFMSP/gxKWc5
         GuX056A+Xz5GI1o5nr6/bnlVi7cLcjnXoTPvF22npJJocgB/n4Nop82udssvT8DPidB+
         9MTn5CG8d8IvQJzhDLCeX0XR5jfEpvSYFlKmt2DmQxOJhd75i0cuZAO/0D7Xr4yAkbUR
         OiUU9thdq4CtFdy61Po+Xr+e6R0C7t2OODn9GIVyAvgavjOV411+xYu3TjS2P4Q60o6M
         NQMQ==
X-Gm-Message-State: AFqh2krGAW8087pTWotdP656cvdSAVvztGn+D0b+82x058pViCrU+tFn
	Uoa3KowRh92207ntLKbgLWWpsxOXdqj1PESN2NM=
X-Google-Smtp-Source: AMrXdXt/aGswfbJIfUriYZL+L0JVonDOuyAkO9B6VZO9S/VxdiimLCVnGeB7l6pZ1aKp+j/8oIDzPEdi91EuB+CKF2c=
X-Received: by 2002:a05:6512:261f:b0:4ca:fd2a:d984 with SMTP id
 bt31-20020a056512261f00b004cafd2ad984mr1995928lfb.445.1673028645760; Fri, 06
 Jan 2023 10:10:45 -0800 (PST)
MIME-Version: 1.0
References: <20230106161621.1288055-1-ross.burton@arm.com> <1737C75520A6A960.7095@lists.openembedded.org>
In-Reply-To: <1737C75520A6A960.7095@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jan 2023 19:10:34 +0100
Message-ID: <CANNYZj-3bjdP5Ta1qEJZ4WAp=h_ZWYU4QEfydYMDVboxjxk19Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] elfutils: disable deprecation errors in all
 builds, not just native
To: alex.kanavin@gmail.com, Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, openembedded-core@lists.openembedded.org, 
	nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175609

Curl marks deprecated API with this macro:

#define CURL_DEPRECATED(version, message) \
    __attribute__((deprecated("since " # version ". " message)))

For some reason, our target gcc 12.x does not interpret it as a
'deprecation' and stays silent - no warnings, no errors. But other
compilers do take it as an issue.

Any hints?

Alex



On Fri, 6 Jan 2023 at 18:09, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> But how did this make it through all the builds? Something doesn't compute here.
>
> Alex
>
> On Fri, 6 Jan 2023 at 17:16, Ross Burton <ross.burton@arm.com> wrote:
> >
> > The curl-related deprecation errors affect all builds not just native,
> > so set CFLAGS instead of BUILD_CFLAGS.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-devtools/elfutils/elfutils_0.188.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.188.bb b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
> > index c94e36071cd..084908a38c0 100644
> > --- a/meta/recipes-devtools/elfutils/elfutils_0.188.bb
> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.188.bb
> > @@ -34,7 +34,7 @@ EXTRA_OECONF = "--program-prefix=eu-"
> >
> >  BUILD_CFLAGS += "-Wno-error=stringop-overflow"
> >  # compatibility with curl 7.87; can be removed when elfutils upstream fixes the deprecation fails
> > -BUILD_CFLAGS += "-Wno-error=deprecated-declarations"
> > +CFLAGS:append = " -Wno-error=deprecated-declarations"
> >
> >  DEPENDS_BZIP2 = "bzip2-replacement-native"
> >  DEPENDS_BZIP2:class-target = "bzip2"
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175602): https://lists.openembedded.org/g/openembedded-core/message/175602
> Mute This Topic: https://lists.openembedded.org/mt/96096249/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

