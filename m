Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 094977D787
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 23:15:41 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v13so3679321ljk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 16:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YwFaqw7eXvQ3tUbWY+MVKcBoKm1O5yjKdOlt9TGv6Xs=;
	b=mxGeL1YF6I+r4xC18Jzn/MppM0KwChXyUfV8ZRPVB2Lt6HWcRM8aU8kcTcwboxGrMo
	xLJ8nbA+oGhcr076Tsg0bAVILkzRY6X5ub9XnDxpAQdk72/BN8XaMOKYqHD1+IQmVDox
	X6M7dgpe6qrzoFnpRDuEYZCgyX9fhodO7dHgcWJmFDQ2x4FLgzhdftgpJzbNoDMpEBSx
	OZ6zXEbZGASk/9n3FkDnyo3EwXpagUFEI08yAWMQIskuQjTgMe3uQyLJ9KiAVXRFT6uf
	wQ1dpH6xAnNkeZmt+ymUaPyoMdG0hWpOQ2lwFKWtYJzT4wrDeAoHyhi0B5nU+u2OZOo0
	YraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YwFaqw7eXvQ3tUbWY+MVKcBoKm1O5yjKdOlt9TGv6Xs=;
	b=DxWoSeKYA5tAOfeigYR6uM1bMWNmXjigMKnBxK+hdzxGNrp3+LT0y09AdL3YZCEBGa
	EG8LSjgLBrfEhwMCUXO1vYkbobjQagaGFMCp+iXd21jH+FGHrJ4HcPiLHne1rOKskRiv
	sOetdJ4pZk80A22b3v7AVuQO59UgqVCAvRi5sN54fxqk2mePvDUeUd/Ht1g/pzCVKGWC
	c9J6lgSATpdK65nmpeo5HYipestxlKpiKIF1eR8q4S7uVX6gLQOqoyNtu3sgfuC4yoCZ
	xVt+E7teLUhyUJHboTCvMIOGyQIaGlIhcDvY5nAVjTLx3dH8lm43GHYY7oPaEQxtvzS+
	fvZA==
X-Gm-Message-State: APjAAAWjYjD5oX7SzH6xMm6vIvt6tj3hjYLc9g8KKTdsAyl4xoR+whep
	PRXzsmf5e2l6cZKx97sppwF0U1kUgmYxp91IM7w=
X-Google-Smtp-Source: APXvYqzJG2UYUIZzQruOLv92tvgOV4nd0H9tRx15uZ5Qy3BboEun81DTl/wP8rAw7iIA1gAajuu/WHi18y5jRLc6wmc=
X-Received: by 2002:a2e:2a03:: with SMTP id q3mr24471438ljq.56.1554938142363; 
	Wed, 10 Apr 2019 16:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190410225524.7489-1-beniamin.sandu@gmail.com>
In-Reply-To: <20190410225524.7489-1-beniamin.sandu@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Apr 2019 19:15:31 -0400
Message-ID: <CADkTA4Nv=hzjbYCHfAQGLF6VWWpM7HOqfVYgrPPng=8S9ZsXiA@mail.gmail.com>
To: Beniamin Sandu <beniaminsandu@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: check for localversion files in the kernel source tree
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
X-List-Received-Date: Wed, 10 Apr 2019 23:15:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 10, 2019 at 6:56 PM Beniamin Sandu <beniaminsandu@gmail.com> wrote:
>
> The kernel-devsrc rework doesn't take into account localversion
> files in the kernel source tree. This might result in modules with an
> incomplete version magic when building out-of-tree using the SDK.
>
> Before:
> root@qemux86:~# insmod hello.ko
> [   42.000212] hello: version magic '5.0.3-yocto-standard SMP preempt
> mod_unload PENTIUMM ' should be '5.0.3-my-custom-release-yocto-standard
> SMP preempt mod_unload PENTIUMM '
> [   42.008200] hello: version magic '5.0.3-yocto-standard SMP preempt
> mod_unload PENTIUMM ' should be '5.0.3-my-custom-release-yocto-standard
> SMP preempt mod_unload PENTIUMM '
> insmod: can't insert 'hello.ko': invalid module format
>
> After:
> root@qemux86:~# insmod hello.ko
> [   39.094288] hello: loading out-of-tree module taints kernel.
> [   39.108044] Hello World!
>
> Signed-off-by: Beniamin Sandu <beniamin.sandu@gmail.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 69a8eaef81..ed265f702d 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -228,6 +228,11 @@ do_install() {
>
>          # required to build scripts/selinux/genheaders/genheaders
>          cp -a --parents security/selinux/include/* $kerneldir/build/
> +
> +       # check for any localversion files
> +       if [ -f localversion* ]; then

Why not just stay consistent with the rest of the copying and make
sure it survives these not
being present via || : ?

Since that is going to potentially have issues when no localversion
files are present.

i.e. just use: cp -a localversion* $kerneldir/build/ 2>/dev/null || :

Bruce

> +          cp localversion* $kerneldir/build/
> +       fi
>      )
>
>      # Make sure the Makefile and version.h have a matching timestamp so that
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

