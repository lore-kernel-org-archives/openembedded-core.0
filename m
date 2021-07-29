Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web08.14272.1627585895017480006
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 12:11:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j346SP8V;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id d17so13065194lfv.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 12:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5pNi5U/mgpvH8RbGPSEenKtM/fqbzPqkwr0QYl9VrQA=;
        b=j346SP8VtLVpW6UjAPAyjTR2jH2CtDz9aN1Cbxoc0dtL5lXd6Ep1swZW/4gf97pKRe
         um+Pp9ISGUCr8TLdjDo0GY2mqpepBM1qPqksjUcUPawHDy/SMSmTMnVm7u5Vq2zyjeoA
         doekfFtZFbk+YIfQlGsbcL1Yr+uLgLefx2pDBaCoO3bE8iMMeIeuJfKoITKR/usbPMNb
         kXrzCVPUbykoccg5IyS/aeb+GISsovjphGxz1/OlSzNY38Ogc3zkh92/r2fl/CP9kiGQ
         lAO0Xg8s5BHNGGajBgRZ14Bd7MOqPqbUabFaeFfQlp9Ziyse0WWzG2m5ahUSQJZbkENI
         j0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5pNi5U/mgpvH8RbGPSEenKtM/fqbzPqkwr0QYl9VrQA=;
        b=lga1uRgZDsd90826/3VL3CMdeSsEgHGJ9mzS9XyyswZ2FhPIe1z/yrRT9B9toxGyZd
         uI3x31YmJNoKftYT2Mer9VCzhvr0pO8KVKQja9yl2kEA8YIfQU/W3yVne8WP3ZGIpYwG
         R9EjvoPHijghGKxvpN5wLq4XRrUUijv5GCMqyrjJbOccskUHZlyNQMcOG7j+DU+K8Eey
         HFjvkcFjNHt8t+j/eZovq2j1gPulXq/s1P56+K3yXkistx7eXQRF7dYXBrUrGCkTb1La
         i3FphTN4XsjDTNZ8qDxR2fl6av3ga+XOaCTRk5c5TnNIMNRbpRT50eNSUUXEjbsfAtKc
         qgLg==
X-Gm-Message-State: AOAM530J7kZYDMrcOzWh04zaAvN9Xnjl0PmFOJ5qiZNTy/NzW9r8os7R
	RjuT8fCLaaI8Tv616LuAWyvudgg54vaQ3se7uH0=
X-Google-Smtp-Source: ABdhPJzwh/bKpVitNTPIGwZyseozTisTthaVZsf7tN9M4pDJnQgQMCeSMJT03umfqEyWYmju8whHyhjQZVwvKnJmg48=
X-Received: by 2002:a05:6512:3253:: with SMTP id c19mr4782532lfr.568.1627585892788;
 Thu, 29 Jul 2021 12:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210727201325.2215487-1-raj.khem@gmail.com> <AM7PR83MB0436960F9D4BFDD1F504F0DFF1EB9@AM7PR83MB0436.EURPRD83.prod.outlook.com>
 <423aed88f51b09d6342089f4b02dc9d62bbdb413.camel@gmail.com>
In-Reply-To: <423aed88f51b09d6342089f4b02dc9d62bbdb413.camel@gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 29 Jul 2021 12:11:21 -0700
Message-ID: <CAJ86T=WgmhDG1OpB3CVf9EtRtxA0hFimKmXod4tcTX3NX1j54w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Fix build on musl
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 29, 2021 at 6:49 AM Luca Bocassi <luca.boccassi@gmail.com> wrote:
>
> Having a look at the patches, a few comments:
>
> - 0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch I find
> quite worrying, as it fundamentally changes access patterns, some of
> which are done for security reasons. At best, this will cause
> completely different runtime behaviours for the same filesystem
> depending on the libc implementation, which doesn't sound great?

I wrote a long and verbose comment when I created the patch which
tries to document any differences in runtime behaviour.

  ----
  Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right thing to
  do and it's not portable (not supported by musl). See:

    http://lists.landley.net/pipermail/toybox-landley.net/2014-September/003610.html
    http://www.openwall.com/lists/musl/2015/02/05/2

  Note that laccess() is never passing AT_EACCESS so a lot of the discussion in
  the links above doesn't apply. Note also that (currently) all systemd callers
  of laccess() pass mode as F_OK, so only check for existence of a file, not
  access permissions. Therefore, in this case, the only distiction between
  faccessat() with (flag == 0) and (flag == AT_SYMLINK_NOFOLLOW) is the
  behaviour for broken symlinks; laccess() on a broken symlink will succeed
  with (flag == AT_SYMLINK_NOFOLLOW) and fail (flag == 0).

  The laccess() macros was added to systemd some time ago and it's not clear if
  or why it needs to return success for broken symlinks. Maybe just historical
  and not actually necessary or desired behaviour?
  ----

If that comment is now out of date or something is missing then please
send a patch to update it.

However looking at this patch again now, it appears to have got broken
during a past rebase:

  https://git.openembedded.org/openembedded-core/commit/?id=e8dd5a36bf2f1e645fb2ff15eb3b5e97c04776e6

The upstream code changed from:

  #define laccess(path, mode) faccessat(AT_FDCWD, (path), (mode),
AT_SYMLINK_NOFOLLOW)

to

  #define laccess(path, mode)                                             \
          (faccessat(AT_FDCWD, (path), (mode), AT_SYMLINK_NOFOLLOW) <
0 ? -errno : 0)

but the replacement version in the patch still returns the raw result
from faccessat(). That looks like an issue.
