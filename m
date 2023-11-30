Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E77C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 17:38:44 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.78770.1701365921820925418
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 09:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T+T+rbqN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-332e58d4219so721837f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701365920; x=1701970720; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SWv9JJ055oS4GTtqUKuMhYaX47erpocIi65rJZofSy0=;
        b=T+T+rbqN2vhoogIySkLtiF8yk8LyeeIZxjd6BqPJ+WcoWOnSO3XSQ1HU4K13ig+dAu
         S3UkpS/kxzfS6whXC+Fa/AytomwaKgxJiEsVvStNFayXbH/hQtS5cot6119Ru+dAJsPS
         n3NtZFKoWmB7IOjM2MBwAk/gTJ+5QM4lWGSMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701365920; x=1701970720;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SWv9JJ055oS4GTtqUKuMhYaX47erpocIi65rJZofSy0=;
        b=oqygzNx0G8TAAwoSwg42Y5DO28m+VFUFB5HvvWyaVRnC6AKDp+rf3+szZi1swpuLh4
         /GO1ov/HlUR8gdJYo/LfMN9uquEsYFgyE0MPb14UjkmpXsH+eaoXeOW9wIfPDztfEbfT
         NLCxwegoHSbkjLwdxH+LQJv4cqopo4e/oV9oP68wF3Xoo4VB9KJv2ZnzaGmAmIaYpx7A
         K5zliRLFUJiFd1/eL3JsH/rKcLfwLrwVMPJWrfAVMkYUht8TTK1RfQgPItcgVfbIMK7I
         NSVmRifl/mw4MWEDgbwCgRwRl9eibf2VKnFRe7kr9P+dvtVFGhNSlH4L1CqeGVWtuzjs
         JEEQ==
X-Gm-Message-State: AOJu0YwkNDDcP8dJ3BzvHei1EkuUbpBgZ/HPFEbWNYBP56MfQmKvVYUt
	DiZ4FzD1yP/Rbb5KFjwFKf1w7A==
X-Google-Smtp-Source: AGHT+IEFmpK6fgEIQJDk7k5cbe0GTzFGmKKVDnIi4vlRIBFG5AQUrX4otUfxRlF7ai9Y9kvCOnoARg==
X-Received: by 2002:adf:ab1b:0:b0:333:94b:7fcc with SMTP id q27-20020adfab1b000000b00333094b7fccmr11963wrc.23.1701365915940;
        Thu, 30 Nov 2023 09:38:35 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb09:1509:8dbd:5aaf? ([2001:8b0:aba:5f3c:cb09:1509:8dbd:5aaf])
        by smtp.gmail.com with ESMTPSA id i2-20020adffc02000000b003330aede2aesm2072314wrr.112.2023.11.30.09.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 09:38:35 -0800 (PST)
Message-ID: <dec2276c23dfb65d60f759431d7f973b05c728a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gdb/systemd: enable minidebuginfo support
 conditionally
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Date: Thu, 30 Nov 2023 17:38:34 +0000
In-Reply-To: <CAMKF1soGVJED8A7HO8Fdvwn4sMjF2ACORONqNPQxxvuSLg5KYQ@mail.gmail.com>
References: <179C617DA6240870.31732@lists.openembedded.org>
	 <CAHUKmYZEOc+xkE2xCbMhUea2QDVZQ4u08sDoQPigD_pJYcFKDg@mail.gmail.com>
	 <aebacb803aa1f3addc1c425a465ab75d3a415dc9.camel@linuxfoundation.org>
	 <CAMKF1soGVJED8A7HO8Fdvwn4sMjF2ACORONqNPQxxvuSLg5KYQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 17:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191516

On Thu, 2023-11-30 at 09:32 -0800, Khem Raj wrote:
> On Thu, Nov 30, 2023 at 3:21=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > Hi,
> >=20
> > I saw some of this discussion on the systemd-devel list so I'm happy to
> > see patches to sort out the configuration on our side, thanks!
> >=20
> > On Thu, 2023-11-30 at 12:15 +0100, Etienne Cordonnier via lists.openemb=
edded.org wrote:
> > > Hi all, I sent this patch to start the conversation, but I guess
> > > PACKAGE_MINIDEBUGINFO may have to be turned into a DISTRO_FEATURES
> > > before this can be merged.
> > > I tested this with core-image-sato after enabling systemd in
> > > local.conf. I then started:
> > > $ vi
> > > In other terminal:
> > > $ kill -SEGV $(pidof vi)
> > > $ coredumpctl info
> > >=20
> > > Before the patch, I didn't get a call-stack with symbols. After the
> > > patch, I get a call-stack including function names inside
> > > busybox.nosuid ("read_key()").
> > >=20
> > > This is a very useful feature for debugging and/or bug reporting, so
> > > I think it would make sense to make it easy to enable via a
> > > DISTRO_FEATURES. I was just not sure why MINIDEBUGINFO was not a
> > > DISTRO_FEATURES in the first place, and whether you would be willing
> > > to enable systemd-coredump via the MINIDEBUGINFO DISTRO_FEATURES.
> >=20
> > I think we should make minidebuginfo a DISTRO_FEATURE and then key all
> > the tweaks off that.
> >=20
> > I was looking at your patches and thinking we might want to enable
> > minidebuginfo in poky or perhaps OE-Core by default too.
>=20
> is it dependent on systemd for coredumpctl or can be use some other tool =
as well
> for inspection.

binutils and gdb know how to read them too, as long as the right
configuration is in place (xz support generally) as I understand it.

Cheers,

Richard

