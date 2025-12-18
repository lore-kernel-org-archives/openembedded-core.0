Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4419AD711C2
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:56:44 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3043.1766091401611099971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WG1HO0wN;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c565c3673so1039227a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766091401; x=1766696201; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpkTUpfx7kUeIW5FNaPhnqNExvka63ok+cgesZ1pp/E=;
        b=WG1HO0wNMp9vsCBrgxVlQZ4kAGWgfzSGupMNWJ3fuY9iUn/sIEHut7hkPYH/1wPRJT
         bDML2Q4t0bk2IFnOVLAeK0id4CYk8kUbV7CtV+MHK2FZn8ziq60jHxMKqWxOh6/2m4kz
         dZ0dYyRgl14+C+CtK/fMnnLls2AcetfWwsMwbSGeKh63SYPOBYANhSt1SefWcVjKk6vK
         pwW7e4lzvJzarDB1oOFv4P/hKzbWmgDZIptfbs7BVUAZG+3+S2gok9dgDd51lmhOwuAa
         0N3G2o+OKr6VyYGnVpmMYlcx1XMF7gcStMeRjaraovSjK99h1EbUnMH4AZn/PdkhKBHP
         1O8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766091401; x=1766696201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VpkTUpfx7kUeIW5FNaPhnqNExvka63ok+cgesZ1pp/E=;
        b=RyHZ7kvOpxbpRZHzOCNSfg7C0JbHU8B46vG25LxW3kJyaugR8hFUkQ9XDp4y3E9JJR
         d4Gl2X7lo6g12re6bIMN6LQGVEHsltcfug3cUMco8VYSzNGG86sBIL464novWGCazIuD
         mD07wAiKugG2nmLAzYFrm+q84LmzjFMR+Iv6uhpaXc+ND/EEJKtuPIgIbMebnsRjNdk9
         LbQDbfB4uJ09ZyIz9Wk0ZrupmVDSqLKmXcbcO+hJGRsoVZ/sVjeYoZhyPpjJbINjLxGq
         h9qzgUorRpOVnRZWIHot5RQkxSnzzrNJEWm0jx03hqQx1MYhZosP70qqquEnANBjC6gq
         oMDw==
X-Forwarded-Encrypted: i=1; AJvYcCWrhvlwOSONVWp5/q8nzf2FF1T4t/HjtWQmVelK++j02QpXWOaXk7i1D8nEhp5ec6IrbtCXwRXpO9E2F/0v2PXRKA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyhUmvkNl4geLweuyQBUurSAppcCsUs3/IgT0Hh9ZjswiGXhtgt
	3jJQPrej3OSHx5/nkNeuy0r9Sx0sQPcnjwF/jJx26vmEOzwHN1PXqEfySAvyxjXeYIcQf/P6vqt
	pMy9Y38IELobpsmrZjHSEPk/7crDOWoI=
X-Gm-Gg: AY/fxX69Yl7QQlXbed1XoZos2mv1Q67NJlWZ5y7g3pmFZeTcuUVBMv06IjxThaGyYvm
	0z4o/Xay9daRQhgm/+lw6e/rp4fUdGZeUoW+6GP89feLcoDXRqlTP4iL4ZF3H5gZkT+SzsrQt+c
	FcWH2NdDooACfsRbNWtBXt4Amq0qEhIgQPEMZV5kxKik1NpNRA9nq97bRnxGdX+70N9BwrkTj2p
	nc/hMQtnYOacT/EJGi8+d0aV/v7rEoGzTvHEe7V/SMlTfljm71est0kayXK3xKXW7c5jT29
X-Google-Smtp-Source: AGHT+IG+e2Uc4o1OSvMTmd9itqZog74ucil1YNx4wSRP/GVnEl33dKiH3Bu9F7Po5R8Rz962re3ImJAZKKl1PT0JRbw=
X-Received: by 2002:a17:90b:2b46:b0:34a:be93:72ee with SMTP id
 98e67ed59e1d1-34e90d6d322mr726835a91.8.1766091400918; Thu, 18 Dec 2025
 12:56:40 -0800 (PST)
MIME-Version: 1.0
References: <188268ECAC642171.1614991@lists.openembedded.org>
In-Reply-To: <188268ECAC642171.1614991@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Dec 2025 15:56:29 -0500
X-Gm-Features: AQt7F2rAPCeuTAtl1mnKpyqO2OkrG2z-APiHlIisxVDICdKqC3_KLyn5jaGOgpw
Message-ID: <CADkTA4MZ6rrU1RxW8zmsAWCMC-zBgdvhWnWBpaXVSpst7njSCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/21] linux-yocto: combined and consolidated
 pull request
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228167

On Thu, Dec 18, 2025 at 3:22=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Hi all,
>
> As discussed in the weekly engineering call, I'm sending this as
> single series even though it crossed boundaries of the repositories.
>
> I don't have access to meta-yocto-contrib yet, so I haven't pushed
> the component parts to contrib branches yet, but will do that for
> future pull requests.
>
> I'm using this as a first run through some things I've cooked up
> to coordinate the patches across the repos. The formatting is my
> own, so apologies if it isn't clear .. and we'll see if it all
>
> Now to the series for OE-core:
>
>  - We have stable updates to 6.12
>  - A kern-tools fix
>  - Updates to 6.17
>  - Removal of 6.17
>  - Introduction of 6.18
>  - Bump to libc-headers to 6.18
>
> I've built and booted what I can locally, and I know that the
> major architectures work, and are functional with respect to
> core features.
>
> I have more libc-headers testing running against meta-oe and
> muslc, so there may be some breakage there and I'll help deal
> with that if it happens.
>
> The update and then removal of 6.17 is on purpose. In case any
> one was using it, they should get the latest tested before it
> starts to be removed.
>
> For meta-yocto:
>
>   - removal of any remaining 6.17 references
>   - introduction of 6.18
>
> The meta-yocto default changes are obviously REALLY RFC/RFT
> there will be issues, but I've provided them anyway to make it
> clear that we are going to 6.18 as the new default for all the
> variants.
>
> Once we get 6.18 fully green and the h/w references udpated,
> I'll remove 6.12 and 6.16 from master. That isn't in this series
> by design.


FYI: my extended testing shows a warning in the virtualization
fragments. It isn't serious, but will be fixed in incremental patches
on the end of this queue.

Bruce

>
> Cheers,
>
> Bruce
>
> Aggregate summary of exported patches:
>
>  - openembedded-core branch=3Dmaster : 15 patches
>  - meta-yocto branch=3Dmaster : 6 patches
>
> Changes:
>   [01/15][openembedded-core] kern-tools: fix commit SHA reproducibility
>   [02/15][openembedded-core] linux-yocto/6.12: update to v6.12.61
>   [03/15][openembedded-core] linux-yocto/6.12: update CVE exclusions
>   [04/15][openembedded-core] linux-yocto/6.12: update to v6.12.62
>   [05/15][openembedded-core] linux-yocto/6.12: update CVE exclusions
>   [06/15][openembedded-core] linux-yocto/6.16: rust kernel configs
>   [07/15][openembedded-core] linux-yocto/6.17: update to v6.17.11
>   [08/15][openembedded-core] linux-yocto/6.17: update CVE exclusions
>   [09/15][openembedded-core] linux-yocto/6.17: rust kernel configs
>   [10/15][openembedded-core] linux-yocto/6.17: drop recipes
>   [11/15][openembedded-core] linux-yocto/6.18: introduce reference
>   [12/15][openembedded-core] linux-libc-headers: update to 6.18
>   [13/15][openembedded-core] linux-yocto/6.18: rust kernel configs
>   [14/15][openembedded-core] linux-yocto/6.18: update to v6.18.1
>   [15/15][openembedded-core] linux-yocto/6.18: update CVE exclusions
>   [01/06][meta-yocto] yocto-bsp: introduce 6.18 h/w reference
>   [02/06][meta-yocto] yocto-bsp/6.17: drop bbappend
>   [03/06][meta-yocto] poky-tiny: make 6.18 preferred kernel version
>   [04/06][meta-yocto] poky: make 6.18 preferred kernel version
>   [05/06][meta-yocto] poky-alt: make default kernel 6.18
>   [06/06][meta-yocto] yocto-bsp: genericx86: bump default kernel to 6.18
>
> ---
> Diffstat:
>   openembedded-core:
>     .../kern-tools/kern-tools-native_git.bb            |    2 +-
>     ...-headers_6.17.bb =3D> linux-libc-headers_6.18.bb} |    3 +-
>     meta/recipes-kernel/linux/cve-exclusion_6.12.inc   |  632 +++++++++++=
-
>     ...e-exclusion_6.17.inc =3D> cve-exclusion_6.18.inc} | 1040 +++++++++=
+++++++----
>     meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   |    6 +-
>     meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   |    2 +-
>     ...nux-yocto-rt_6.17.bb =3D> linux-yocto-rt_6.18.bb} |   12 +-
>     meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb |    6 +-
>     meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb |    2 +-
>     ...yocto-tiny_6.17.bb =3D> linux-yocto-tiny_6.18.bb} |   12 +-
>     meta/recipes-kernel/linux/linux-yocto_6.12.bb      |   28 +-
>     meta/recipes-kernel/linux/linux-yocto_6.16.bb      |    4 +-
>     .../{linux-yocto_6.17.bb =3D> linux-yocto_6.18.bb}   |   52 +-
>     13 files changed, 1526 insertions(+), 275 deletions(-)
>
>   meta-yocto:
>     meta-poky/conf/distro/include/poky-distro-alt-test-config.inc        =
 | 2 +-
>     meta-poky/conf/distro/poky-tiny.conf                                 =
 | 2 +-
>     meta-poky/conf/distro/poky.conf                                      =
 | 4 ++--
>     meta-yocto-bsp/conf/machine/include/genericx86-common.inc            =
 | 2 +-
>     .../linux/{linux-yocto_6.17.bbappend =3D> linux-yocto_6.18.bbappend} =
   | 4 ++--
>     5 files changed, 7 insertions(+), 7 deletions(-)
>
> --
> 2.39.2
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228143): https://lists.openembedded.org/g/openembedde=
d-core/message/228143
> Mute This Topic: https://lists.openembedded.org/mt/116848895/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

