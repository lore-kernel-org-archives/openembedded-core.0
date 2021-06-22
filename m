Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.8466.1624365780075262491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 05:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uyx/FkvD;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id ji1so28261497ejc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 05:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ony/Vb3W8/KzxGVcwEThMWANGS4I91XUvCuYkb/sVl4=;
        b=uyx/FkvDpDh1tvMf/tVaDwphWOz913mCJbwHsooymWXT/Q0kxGN4JjOoaisbmSxw0f
         DILZ9AL/i0RMRODaHKNBO7OUI5EAM5UHTK/e5T3o9SUGpcNWEd4gx8LvmPcBzdTA6F37
         sR/8AUjiUzo2u9ub1P5nTRo5AywpBDCB2Xx+Kbhc/BZ+YM6xiHPK4HLKt7ZNNTtRs382
         /Ozh/2+iof+SUN0fw9FB9PzC+kZl1UaYkmktUpNkQW5O7VYmFDiRnQ2QZIh5KFc4cFGe
         gY6ZJeYKEO3T4IrqiuoqOKI+4Fx0ercyeDulDokU0BQ+ETXh78MsAJac73Oq7Rtg3btB
         gb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ony/Vb3W8/KzxGVcwEThMWANGS4I91XUvCuYkb/sVl4=;
        b=rXAPGvh3EeEBeZfNqfUO1wjtCqWaEb5brzg2rWTN0WbQ/7SoA3omGfpT3Rl3VzXuX6
         OxUQIVikzHS2tuUlKMABFbuCZkGh41/dvltHRMHHsfsRw6GuROLOTpgqf0BVVuFmkDXM
         GcmS4OddRSHLQokT4pnScG4cwvKT0y8qA/x2tW8wtnc15l8oltwIs35MnWn44F34RVKo
         eEVyh4DYa83MmF94ctiaLCrcZ6t6uH/+HIgh4tfGODw62SZHtZdTorxHu0E9vCQF5haz
         lCfFLBHFJp/sMVOdJvbSFnOidn1ucuO5KhQgMlEgs9Sci+8gzOQgwJ8VodK6MxYAFVb4
         4o4A==
X-Gm-Message-State: AOAM532Jc7IjN04AsWUK3q9NIbPs6a974JZzlj+23cTsmbSXXs/1r+CA
	kVOCoODLPcSDyn0RLnwPgb+wrK3YTUkgBd4GkkM=
X-Google-Smtp-Source: ABdhPJw4hmj60A0fBZ5B/aA5ZQjxtsFYcuAPa0wIyJBD5yfM7oLfPxE/e96l22XmT9Joo9kS5aN5N1PmCBb8fTMuolE=
X-Received: by 2002:a17:906:4c58:: with SMTP id d24mr3752175ejw.298.1624365778152;
 Tue, 22 Jun 2021 05:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210622121531.13424-1-andrej.valek@siemens.com>
In-Reply-To: <20210622121531.13424-1-andrej.valek@siemens.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 22 Jun 2021 08:42:46 -0400
Message-ID: <CADkTA4PkEuH2XFOUcnM0gJJq6u_t3grqPoUjEz7hsCutXd7sCg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] ca-certificates: revert mktemp patch in update-ca-certificates script
To: Andrej Valek <andrej.valek@siemens.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 22, 2021 at 8:16 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> - revert f3eabbb5c15fb55ae3d46b2377c09bb58226d965
> - mktemp from busybox does not support '--tmpdir' option
> - coreutils is usually not possible to use because of 'GPLv3+' LICENSE

This should say "coreutils may not be possible" .. many folks don't
care about GPLv3, so "usually" is not appropriate here.

Also: What Alex said in his review.

Bruce

>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../ca-certificates/ca-certificates/sbindir.patch   | 10 ++--------
>  .../update-ca-certificates-support-Toybox.patch     | 21 +++++++++++----------
>  2 files changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
> index f343ebf16e..a113fa8b15 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
> +++ b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
> @@ -1,12 +1,6 @@
> -sbin/Makefile: Allow the sbin path to be configurable
> +Upstream-Status: Pending
>
> -Some project sharing ca-certificates from Debian allow configuration
> -of the installation location. Make the sbin location configurable.
> -
> -Also ensure the target directory exists
> -
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/5]
> +Let us alter the install destination of the script via SBINDIR
>
>  --- ca-certificates-20130119.orig/sbin/Makefile
>  +++ ca-certificates-20130119/sbin/Makefile
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
> index f78790923c..6e2171f758 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
> +++ b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
> @@ -1,13 +1,14 @@
> -update-ca-certificates: Replace deprecated mktemp -t with mktemp --tmpdir
> +From 30378026d136efa779732e3f6664e2ecf461e458 Mon Sep 17 00:00:00 2001
> +From: Patrick Ohly <patrick.ohly@intel.com>
> +Date: Thu, 17 Mar 2016 12:38:09 +0100
> +Subject: [PATCH] update-ca-certificates: support Toybox
>
> -According to coreutils docs, mktemp -t is deprecated, switch to the
> ---tmpdir option instead.
> +"mktemp -t" is deprecated and does not work when using Toybox. Replace
> +with something that works also with Toybox.
>
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/5]
> +Upstream-Status: Pending
>
> -[This was originally for compatibility with toybox but toybox now
> -supports -t]
> +Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>  ---
>   sbin/update-ca-certificates | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> @@ -23,9 +24,9 @@ index 79c41bb..ae9e3f1 100755
>  -TEMPBUNDLE="$(mktemp -t "${CERTBUNDLE}.tmp.XXXXXX")"
>  -ADDED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
>  -REMOVED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
> -+TEMPBUNDLE="$(mktemp --tmpdir "${CERTBUNDLE}.tmp.XXXXXX")"
> -+ADDED="$(mktemp --tmpdir "ca-certificates.tmp.XXXXXX")"
> -+REMOVED="$(mktemp --tmpdir "ca-certificates.tmp.XXXXXX")"
> ++TEMPBUNDLE="$(mktemp -p${TMPDIR:-/tmp} "${CERTBUNDLE}.tmp.XXXXXX")"
> ++ADDED="$(mktemp -p${TMPDIR:-/tmp} "ca-certificates.tmp.XXXXXX")"
> ++REMOVED="$(mktemp -p${TMPDIR:-/tmp} "ca-certificates.tmp.XXXXXX")"
>
>   # Adds a certificate to the list of trusted ones.  This includes a symlink
>   # in /etc/ssl/certs to the certificate file and its inclusion into the
> --
> 2.11.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
