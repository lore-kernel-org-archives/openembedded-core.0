Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288D4C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:11:38 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.70898.1722525094288962709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 08:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YaWliFFx;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cb53da06a9so1670092a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722525094; x=1723129894; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jxk66im7PFo8f/iBlNqtdnLrg6JmUwkPIxtECGW3X4=;
        b=YaWliFFx6nn/C8B7a6YLJpW+Npx1jKcfazXaPrWeUQjbei7oA0nkG72P8NZOwWvyOj
         XDucHa1KuewqHkvUMj+5ejDvzyun7rqTT9gIcyRmQYltgsJZvCj4ofaw6jRFNoLi5rpI
         0PJ4pjIrv/oJFfockVIs7Y5FVQ/A+ap4hmoG5GqTQbS7zOFJNrUh053dsEDvBKZsCKdf
         elnb1WgKkKFKlhpifgEP6z7Boq+5qXnTxIDGyJBi24By3nO0+o+Bw2aj456dxLL9Qawm
         KMHw7vMZFEFY2uulNn6NwSC104lRhhGsqXxE+0KxJWhWcI5yWjBu3vULh6JptOmt3mBF
         zRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525094; x=1723129894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jxk66im7PFo8f/iBlNqtdnLrg6JmUwkPIxtECGW3X4=;
        b=YF8Uw0AU3hNnuz8FsXPQJH9Lcv5XDvUEvf22gJ33y4Fq5mvXHvSie/AHYqqhPmFubA
         K8L965q5C2sBKufVJS0I9VJANPghTXV8DwAT8pVcgaXs4e2o7ozNZT4L2yK7F6RnEsZj
         z7YYyRO7smI8KMksGFXkUYVzbgdd2NPhSvc61D0H+6yrHse0ytDrCBwcrwRhCebo0roy
         agd+8HXQS0k/udkU9mv1XmYxe6TgAI+EGMHkEZpvJx619c+9v4+zi3nN5yTWnde3Atnb
         z8978iMhipWD6oTDPGLhJWIsca1kVfGjG7ESUr4Lo4qg+8DvU6v7o8JO7e8OWKqj/uRf
         5xFg==
X-Forwarded-Encrypted: i=1; AJvYcCXPtfqGC3/ds6GEa0Tol53gBT93k0hdCt33my1MOZpXg1i0ugl5GpUS910b5PSoalONQa9zz4/5XrKDUQCLxH0ZSxLklHYZcwmiwEESFdowcAaAUySPt2UV
X-Gm-Message-State: AOJu0YxSIAsVPQ1Hqe2XnuLH0ng+/ySQaVMIEJ2aKUP15OgM1I3FvFGb
	T18krVPst6OUvTaGWijRucOmbVSbGnAOWayQUJdNpc5JEzFyzEW78q0O184C0hVikdhVN0DMB0S
	SgGWzMehouJp0PZR9c0x+2XW44MWBCWli
X-Google-Smtp-Source: AGHT+IEdZaTrlvWWqttLw3pTwkQmpK42rkq33Zs7l7WycLMnyshDGkJrnVhdEQKSbZidIG/OxtYMp7EkU0jlUWugQkY=
X-Received: by 2002:a17:90b:2341:b0:2cb:58e1:abc8 with SMTP id
 98e67ed59e1d1-2cffa2bf513mr342405a91.21.1722525093356; Thu, 01 Aug 2024
 08:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <17E7A34B5AF9CCAE.20637@lists.openembedded.org>
In-Reply-To: <17E7A34B5AF9CCAE.20637@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Aug 2024 11:11:21 -0400
Message-ID: <CADkTA4Muvq9U0jhkBhL0VxKMKBu7GwNnocWpMXsQi7WiYMz_vg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/10] kernel-yocto: consolidated pull request
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 15:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202751

On Thu, Aug 1, 2024 at 11:08=E2=80=AFAM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Hi all,
>
> Here's the next batch of kernel updates. Obviously the -stable
> updates to 6.1 are routine, but the larger changes are the
> introduction of the 6.10 kernel as a new / validated reference
> version.
>
> Some notes:
>
>   - I've included the poky/poky-tiny preferred version bumps
>     in this pull request for simplicity. Yes, I know they go
>     to meta-yocto, but it is easier to make this available for
>     AB testing when they are all together.
>
>   - I'm watching the status of 6.10, if for some reason it
>     EOLs before we release, we'll jump to 6.11, which I have
>     under test and will push as linux-yocto-dev shortly.
>
>   - There's one known build issue with 6.10, it is zfs in
>     meta-oe. The upstream hasn't updated to support 6.10 yet,
>     so I'm watching and waiting on that .. but there's no
>     reason to hold this request for more testing on that.
>
>   - I've tested 6.10 for all architectures on core-image-minimal,
>     core-image-sato and core-image-kernel-dev. I've also
>     tested against musl and poky-altconfig (6.1 with the
>     6.10 headers)

The one point I forgot to add .. I've just cloned the existing
cve exclusions file from 6.6, I realize that this is changing
and I've done nothing with it. I just wanted it there as a
reminder / placeholder for now.

Bruce

>
> There will surely be AB issues with this, but it is now
> to the point where I need additional coverage and eyes
> on the changes.
>
> Bruce
>
> The following changes since commit fd8dc3a2f320f5b8335202ba9f366ed93bf53d=
d5:
>
>   gpgme: move gpgme-tool to own sub-package (2024-07-30 12:46:22 +0100)
>
> are available in the Git repository at:
>
>   https://git.yoctoproject.org/poky-contrib zedd/kernel
>   https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel
>
> Bruce Ashfield (10):
>   linux-yocto/6.6: update to v6.6.36
>   linux-yocto/6.6: update to v6.6.38
>   linux-yocto/6.6: update to v6.6.40
>   linux-yocto/6.6: update to v6.6.43
>   linux-yocto: introduce 6.10 reference kernel
>   linux-libc-headers: update to v6.10
>   kernel-devsrc: remove 64 bit vdso cmd files
>   linux-yocto/6.10: update to v6.10
>   linux-yocto/6.10: update to v6.10.2
>   poky/poky-tiny: bump preferred version to 6.10
>
>  meta-poky/conf/distro/poky-tiny.conf          |    2 +-
>  meta-poky/conf/distro/poky.conf               |    4 +-
>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
>  ...ders_6.9.bb =3D> linux-libc-headers_6.10.bb} |    2 +-
>  .../linux/cve-exclusion_6.10.inc              | 6660 +++++++++++++++++
>  meta/recipes-kernel/linux/kernel-devsrc.bb    |    1 +
>  .../linux/linux-yocto-rt_6.10.bb              |   48 +
>  .../linux/linux-yocto-rt_6.6.bb               |    6 +-
>  .../linux/linux-yocto-tiny_6.10.bb            |   33 +
>  .../linux/linux-yocto-tiny_6.6.bb             |    6 +-
>  meta/recipes-kernel/linux/linux-yocto_6.10.bb |   76 +
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   28 +-
>  12 files changed, 6843 insertions(+), 25 deletions(-)
>  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.9.bb=
 =3D> linux-libc-headers_6.10.bb} (80%)
>  create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.10.inc
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.10.bb
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202740): https://lists.openembedded.org/g/openembedde=
d-core/message/202740
> Mute This Topic: https://lists.openembedded.org/mt/107667882/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

