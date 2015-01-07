Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5B065CDB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 17:47:34 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id pv20so4855679lab.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 09:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vMLXqWou+0cxrboQFiWRjVrno627dLRSCLVJTvQVqbw=;
	b=QwJ/Zbzt3WJVVp82aslBBv7rmX4c2WdGf2ilWQwsPbrNDzXY8J0nSiRS8Vio/Cdpx3
	GBqFsID7oiZNQirGi9INPtRl+GPeETt7WI2kINIMv22ITZFqk1dVyEl/3UUIFpqo4avN
	ZNCUqk2J0dvAEydBaYGbeKzzf1fA/xUS6C4Z9gfcjLffDnrWk9ltZ9O6cAX2bhaNFuHM
	Ww+F33hvJ9heQ33Xw9OznIxZ+bhzPAgQ8NqpmthEiGx45Xaq2mEgLFqXdx6s7ffaybTT
	pgp0g10Ww5uDLCkfxGgnWSk8p1rU32Awp10HuoS4MrmBCsPSU0sigPS/LtBZzatqhlsV
	QzUQ==
MIME-Version: 1.0
X-Received: by 10.152.87.12 with SMTP id t12mr6726810laz.31.1420652854514;
	Wed, 07 Jan 2015 09:47:34 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Wed, 7 Jan 2015 09:47:34 -0800 (PST)
In-Reply-To: <1420651519-25240-3-git-send-email-otavio@ossystems.com.br>
References: <1420651519-25240-1-git-send-email-otavio@ossystems.com.br>
	<1420651519-25240-3-git-send-email-otavio@ossystems.com.br>
Date: Wed, 7 Jan 2015 12:47:34 -0500
Message-ID: <CADkTA4M0XTK0fhtk1j-hV94Qr5TweM5VEBr-uq2Rf8edFG2nzA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] kernel.bbclass: When linux/version.h exists, copy it
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
X-List-Received-Date: Wed, 07 Jan 2015 17:47:38 -0000
Content-Type: text/plain; charset=UTF-8

Unless anyone needs these really fast, I'll queue the two kernel
patches and take them
for a spin today.

I have a variant of the version.h here (and when the directories
shuffle again, we can drop
explicit copies all together), but will make the switch for this in
the short term.

Bruce

On Wed, Jan 7, 2015 at 12:25 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Old Linux kernel versions rely on linux/version.h for modules; this
> needs to be published for external modules to use. Copy it when
> available.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/kernel.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 88356b1..78c8c7c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -252,6 +252,10 @@ kernel_do_install() {
>         cp .config $kerneldir/
>         mkdir -p $kerneldir/include/config
>         cp include/config/kernel.release $kerneldir/include/config/kernel.release
> +       if [ -e include/linux/version.h ]; then
> +               mkdir -p $kerneldir/include/linux
> +               cp include/linux/version.h $kerneldir/include/linux/version.h
> +       fi
>
>         # As of Linux kernel version 3.0.1, the clean target removes
>         # arch/powerpc/lib/crtsavres.o which is present in
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

