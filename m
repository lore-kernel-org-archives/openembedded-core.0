Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5887C369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 22:05:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.4682.1745186704677121558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 15:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZNFslh0z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso28697085e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 15:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745186703; x=1745791503; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iOZNkUpLUHimF+9djaCJKht/VCT6gbzRSIYfRoLHNr0=;
        b=ZNFslh0z/CeBBRMS+BGng3E/Muo2J8+8hxc8ur+jJo2H97QutV/nwZwteCQL6MUMVk
         AYTVWVBo8y+ALjVDcL+EK8icXCw/E3MotkM+TQ6Zsksn5xh/v20EWvlwyHqMiVDkrIkJ
         ozUAyK5Yv/2NUTv2PQXsTDJ5KN/Ol2BNijeE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745186703; x=1745791503;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iOZNkUpLUHimF+9djaCJKht/VCT6gbzRSIYfRoLHNr0=;
        b=A9wMwd+lkxhHgXcPfZqaHVAs12HUyeX+XMeXdTJkK7rDRM2gAhdwC2Z5RLRTfpmpre
         yl3AQEHQmOeC4laSUlp7Y55husqKUCUN/NKbbBN0Sg1IMzO9caKWsdRY1TMtT35kjIzk
         up+5Huw6g3f7Qzk5HMHrMu64r+StQDLRzDvQiiWgmSbgL4xWx0/LwfGn6q9IQm0lNpqs
         5s+n6j8tEgRZ+YsyzFT3aME6uo3ijiHryWQ0hraz5Puv1Dy1Yzb+W4xA7ozU10kGHjAe
         bt4/F+VI022uGp4vl7v3Fz0h9Vtv9+BylQW2czpwzudBZjgHzjPHXtkrxaUWt4KQYffF
         vYwQ==
X-Gm-Message-State: AOJu0YxR4a2mFhrlc9jSSM8HRHIFJJkQB+W2kJy4sxGEyxMdIfnqIkpw
	pWWYIAOVgyQfo35D7C09rxxoFv0sNpKIsbEjR3kwbGz5h6IFPYyAugCPPf2378g=
X-Gm-Gg: ASbGncu576S+QobS3/z4R7pjo5vGmgfarPATZDuSzKUGYyDXwV0/GZ34khAslN/sGQ7
	8GPTFGRtQLKVsXKF7xHBWH+tewuVoCij/G+hqZJbTvaoC1ACyGB2aBNf1tMARH4rJJGuGHIDsEj
	WzBbeHaF3OWNuIislLYoQqLddVCn+BrkjRlMzDscJysgRWyZbwgwPpnnIyVh7Wdpc7UHLpCb8df
	G8yz0d+JWAaXSfTQCKjtGzM0rwK7XuGwGuujVjmPpNNbcyJDFBV9lEGPgAZMUb635WlrhscI3MU
	o+tD58LAIbuEB+cwVDX3LnZXeoiSmNch4UDYIhdbdOQOJyoF/EnIS6oYJwiiNhvs9QMWOWB6r6O
	WihgpoC4Xm4QZo18TjZSiTrcIchvyJA==
X-Google-Smtp-Source: AGHT+IHEdRy87Pnyx+A41O9TyFQ6hD370I/s1l5JP1GJYbSKs4l7LG/ffPqvHc22zSMlN/2F6N4CKA==
X-Received: by 2002:a05:600c:3594:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-4406ac2035bmr69669365e9.28.1745186702506;
        Sun, 20 Apr 2025 15:05:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d83:c080:c463:70fa? ([2001:8b0:aba:5f3c:7d83:c080:c463:70fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43ce6bsm9982014f8f.55.2025.04.20.15.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 15:05:01 -0700 (PDT)
Message-ID: <1a38737d7724ece0dd22637a85fc1151d8919cea.camel@linuxfoundation.org>
Subject: Re: [OE-core] 0/2] linux-yocto: -stable and config changes (for
 current release)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 20 Apr 2025 23:05:00 +0100
In-Reply-To: <CADkTA4PXD8V0TzJ0aDwxWnfzbjYqcSmgBRFyuqEcHXcizD4jUA@mail.gmail.com>
References: <20250418195446.1914594-1-bruce.ashfield@gmail.com>
	 <0da9657f7a33ece23b31415e225e099964fef5b2.camel@linuxfoundation.org>
	 <CADkTA4PXD8V0TzJ0aDwxWnfzbjYqcSmgBRFyuqEcHXcizD4jUA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 22:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215159

On Sun, 2025-04-20 at 17:51 -0400, Bruce Ashfield wrote:
> On Sun, Apr 20, 2025 at 4:58=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2025-04-18 at 15:54 -0400, bruce.ashfield@gmail.com wrote:
> > > This is the iommu configuration change you were waiting for, but
> > > I
> > > had already updated to 6.12.23, so that -stable change is coming
> > > along with the meta/cfg update to pickup the configuration.
> > >=20
> > > If there are any issues with the -stable update, I can attempt to
> > > jiggle the patches such that the cfg: iommu patch brings along
> > > the
> > > 6.12.23 kver bump, but not the actual -stable update itself. The
> > > -
> > > stable would then follow later without an associated meta data
> > > update.
> > >=20
> > > But since that is a manual operation, I wanted to send the
> > > patches
> > > as-is and let's see how they do on the AB.
> >=20
> > Thanks, I'm not too worried about the kernel version bump but there
> > was
> > an issue in testing with poky-tiny which looks related to the
> > config
> > change:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/1422
> > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2099421/raw
> >=20
> Indeed. Where this has moved is missing some of the dependencies so
> the allnoconfig of -tiny is missing the value and hence the warning.
>=20
> Is that config qemux86 -tiny ?

It is, yes.

> I'll start a build and see what I can do.

Thanks, I'm hoping you can spot the issue easily enough! It would no
doubt take me a long while...

Cheers,

Richard

