Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 06239605B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 17:10:51 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id hl10so5046189igb.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 10:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oZcCR0WqNSNTq4dkwXqNgkm1wTQDWUEB2zYj9Ocv4Qk=;
	b=otDEcW3x4j7OSR+DYeRlUIqdwsygkyyf7w0yaaAffpulW+XjcqljYlHRE2jVR0WLGG
	Gop0JR4Am71MHaWwvA0JDawv+yXlsT5Y3Ny9A81HETFGNK/XZmGttv3bP6dzMyD102s3
	H6nDbUe4AvvmVfIYWVZ+5ZhpN5gwxM+NzKua4EFzzMg763DwiglkSc1IZqO1mc/OzPsJ
	rZRplccIIC4xZeEAawUftsHg3tcvi5f1ddPhiQtw99RmNKtOMlABMuQPUaVSJ3s50WOm
	61aKFP4Vl90HiQYCnF6QetCtWilpYWDj/Q/lst0kN1te1mzzBqtbaGWwiDee27so7Dv9
	D4YA==
X-Received: by 10.50.78.201 with SMTP id d9mr25139059igx.17.1398705052189;
	Mon, 28 Apr 2014 10:10:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Mon, 28 Apr 2014 10:10:22 -0700 (PDT)
In-Reply-To: <1398699537-28100-1-git-send-email-drew@moseleynet.net>
References: <1398699537-28100-1-git-send-email-drew@moseleynet.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Apr 2014 10:10:22 -0700
Message-ID: <CAMKF1sq49NF+qyQ7nEO4yzedFiB9i+Z7oOQR_UHAvQ=ouAkAhA@mail.gmail.com>
To: Drew Moseley <drew@moseleynet.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Check for HAVE_POSIX_FALLOCATE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Apr 2014 17:10:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 28, 2014 at 8:38 AM, Drew Moseley <drew@moseleynet.net> wrote:
> From: Drew Moseley <drew_moseley@mentor.com>
>
> The check for the config variable is using the wrong define
> resulting in the #else always being used.
>

good catch. Looks good to me Thanks for the patch.

> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> ---
>  .../systemd/systemd-pam-fix-fallocate.patch        |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
> index de73be9..d25acef 100644
> --- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
> +++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
> @@ -27,7 +27,7 @@ Index: systemd-209/src/journal/journal-file.c
>           /* Note that the glibc fallocate() fallback is very
>              inefficient, hence we try to minimize the allocation area
>              as we can. */
> -+#ifdef HAVE_POSIX_ALLOCATE
> ++#ifdef HAVE_POSIX_FALLOCATE
>           r = posix_fallocate(f->fd, old_size, new_size - old_size);
>           if (r != 0)
>                   return -r;
> @@ -66,7 +66,7 @@ Index: systemd-209/src/journal/journald-kmsg.c
>           }
>  -
>  -        if (posix_fallocate(fd, 0, sizeof(uint64_t)) < 0) {
> -+#ifdef HAVE_POSIX_ALLOCATE
> ++#ifdef HAVE_POSIX_FALLOCATE
>  +        r = posix_fallocate(fd, 0, sizeof(uint64_t));
>  +#else
>  +      /* Use good old method to write zeros into the journal file
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

