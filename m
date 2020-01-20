Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1F3DE7F93F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 15:42:58 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id e5so101308qtm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 07:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4SJ/9mxkiMrMehoUc1LVxzrCclwePsbT1gX8URkmRoA=;
	b=St3lKgbIhnLunGoH5L9QmDvte/JRJiBGbXQH+6dYuuDS8yTBzKlk1dvQgWYyq/CWZl
	ZFkpehbltetoOlCtxPDW9nb082wMWP2IajQhL0uewP79eVu0BRE9PNiXrtnvmAIlONQK
	mYyf7Abpvruz6hyJn/x7Fi4J8mWtXmaD/jLpH22FNOdXCXDawyJ4XZMdB1Q7+fzfRE1j
	SNoVquk9CuNveavkCkpbtQKPrtvPW3KbJj1ewo/Sql/I+qiSRtlzaK18wvWDO5G/u9LO
	7E0rFTdRrwnbwT/Z8cWrR0mHEAwYV5mod88rWgWoxTnjCik9ynic0hYwTvb+RAGrfHCC
	393w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4SJ/9mxkiMrMehoUc1LVxzrCclwePsbT1gX8URkmRoA=;
	b=p6y7zyUITsL/BhQtzaKm6ahTJI/SpSewzR9se8H8TPJKl1F7qVd4blQWgrdDHXHlLF
	i2V0FMFidMNqJjaCKInecFxB8bk3K8BS3d+nJDWazNTI6IQ7mPmdzCE2IPORJ/tV7gUN
	HxC4FkxLKkmYgRKoVK24DOoP9zb56HCyKLoDns7CHAF5Z/Rxuq/9Xty4BtBiEcBak2PT
	iPGFVm32kS30BvjDHzrHMZ3moVkMHpyCCnbLTboPf7sQ/GXKr/lDrwanu9ETC4xnMvNL
	SNBJbFpcuOn4n0mR1l/mY/lHacnhZOPkqP/hkvoakXIv7fabRnc8fcO0p3E+AO5oK1tl
	FWjg==
X-Gm-Message-State: APjAAAVAXubTX2GrTs/+SCKBijW5wxUXP/P9jGB3fuM+rNaT/+n97GUp
	ZFRbWngSD5h2o3pGj00L1fvUL4+aVeIAJ6gLJzg=
X-Google-Smtp-Source: APXvYqxO7AYX6wiuSfv+z77oJyvPVvGDgS+IY/ric5Jrowx9AGQgClPzBTY5L8XLw/1v/Qn7ceBrXG4ngJlml0uAnjU=
X-Received: by 2002:ac8:145:: with SMTP id f5mr20702973qtg.194.1579534979739; 
	Mon, 20 Jan 2020 07:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20200120072801.16603-1-rasmus.villemoes@prevas.dk>
	<20200120092258.32254-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20200120092258.32254-1-rasmus.villemoes@prevas.dk>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jan 2020 07:42:33 -0800
Message-ID: <CAMKF1so2RcV_qzS3if53Z-xhAchan1piCUrAaUn2Gb-3M3VwYA@mail.gmail.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] glibc: don't ignore global LDFLAGS settings
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
X-List-Received-Date: Mon, 20 Jan 2020 15:42:59 -0000
Content-Type: text/plain; charset="UTF-8"

this patch is ok but I have reservations since  += now means global
ldflags will be applied
so it would need some testing to ensure it works well.

On Mon, Jan 20, 2020 at 1:23 AM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> Two things: The -Wl,-rpath-link comment is stale (due to per-recipe
> staging), so we no longer need to set our own LDFLAGS to avoid
> -Wl,-rpath-link being in there. Second, overriding LDFLAGS should be
> done at the recipe level so "bitbake -e" can show what is going on.
> Otherwise debugging why one's global LDFLAGS tweaks are being ignored
> is needlessly painful.
>
> So pull out the LDFLAGS setting from do_compile, and change it to an
> append instead of assignment.
>
> For the benefit of future git blame: the -fuse-ld=bfd setting was
> added by ac64c3b96b (glibc: always use bfd linker).
>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
> v2: Rebase to real upstream master. Note to self: "git pull" before rebasing to master.
>
>  meta/recipes-core/glibc/glibc_2.31.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
> index b8c570db52..cfba4de49b 100644
> --- a/meta/recipes-core/glibc/glibc_2.31.bb
> +++ b/meta/recipes-core/glibc/glibc_2.31.bb
> @@ -93,9 +93,8 @@ do_configure () {
>          CPPFLAGS="" oe_runconf
>  }
>
> +LDFLAGS += "-fuse-ld=bfd"
>  do_compile () {
> -       # -Wl,-rpath-link <staging>/lib in LDFLAGS can cause breakage if another glibc is in staging
> -       LDFLAGS="-fuse-ld=bfd"
>         base_do_compile
>         echo "Adjust ldd script"
>         if [ -n "${RTLDLIST}" ]
> --
> 2.23.0
>

