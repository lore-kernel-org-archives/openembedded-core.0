Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0E99F78757
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 16:37:38 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i17so7169333qke.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jan 2018 08:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NSvsXVpj0+bo4wLY8RD0sPW8vLoIsy5cVxQ3b5w4s5o=;
	b=NxgtcA4AMqQE532oEi7aVlkd8+/ZkVd9hQgQkA14zZqthabQozjErWaTcIPJtsApFe
	5Q953ZviFfAbJSxZOmMevUyb5SKJ+XiaM6bft5BUqmKjE9DSJWimGO79clh95zxV5nPL
	FH1mkgWhkv4q6VG9V89erKfyCMhpllfM1W8D2BYe1+AxfIZRwajy41rUQl8X3g5xaLS9
	+Xx6QtC5a77Xs+cE2CaPhr9hFymGA5v9Yc3VqSKOXv9QZ5QLgqfWY5NxjX20hBzpESod
	y0HC0eXiZTI4Weact2uGcUXc3RVNFRMt7cQtKTlPobAa4iR+UhFyqarDIMseMiT3Dkr4
	ISUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NSvsXVpj0+bo4wLY8RD0sPW8vLoIsy5cVxQ3b5w4s5o=;
	b=Rj8iT4U1zNliCajA8irL5FZiUz1PL3bF/6zMVhsYHURQwqX76aJDlwkjdR0QwxPB6f
	3LlfQ5m6B6kOSDPaPclXUTas7ctz8o/Y7/yUV9evGsX6T5nzjz1MkMIK3qCh0FrHSFhc
	t94/8mkEu3RBO2HfJ+Nox659L/HM8SqtdmPaElz3D/GX/tK6jWtS/NaZ8SvW/8Hku8F3
	pFt9G6/U8F7hjsq5BS3lMRE7gzC1kZoLO2omhXKDbT28I97mGlHEEgpjH+WhR056gOGA
	EjIgPvIYgMfujqz/7PSjSqvCrLvQQEHREjP9l9dEjT5oIiguuVDXNHXB7f2IfNhi+t3S
	osBQ==
X-Gm-Message-State: AKGB3mKUjxDPC1/G+H1ecp/FORrZBe/Lz7F0KI+wUhUuBA1nMqYO0w1X
	y6sYzDruEbaUBLQRod4oyLIzuVE8OLo9GhpUUyA5xw==
X-Google-Smtp-Source: ACJfBovi3UNIuhrh8wVhaIdK2QDBFqPSsmBDM+PVEVLl0MGuhq8sYV9nb7kNALEQY046AxLb/A2Kfa7n6pFrKC76lVI=
X-Received: by 10.55.191.65 with SMTP id p62mr11685673qkf.265.1515343059863;
	Sun, 07 Jan 2018 08:37:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Sun, 7 Jan 2018 08:37:39 -0800 (PST)
In-Reply-To: <20180107161920.30937-2-marex@denx.de>
References: <20180107161920.30937-1-marex@denx.de>
	<20180107161920.30937-2-marex@denx.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 7 Jan 2018 11:37:39 -0500
Message-ID: <CADkTA4MH4EL42iL=BXRKy8y0Gp_bwOarpXiBEPrvCSygOuT4oQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel: Add optional patch_xenomai task
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
X-List-Received-Date: Sun, 07 Jan 2018 16:37:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 7, 2018 at 11:19 AM, Marek Vasut <marex@denx.de> wrote:
> Add additional task, do_patch_xenomai, inserted between do_patch and
> do_configure tasks. This task applies the cobalt patch to the kernel
> sources for a specific machine. This is disabled by default, so use
> PACKAGECONFIG[xenomai] of the kernel package to enable the patching.
>
> You will also need a kernel recipe for a kernel version with ipipe
> patch applied.

This doesn't make any sense to me.

Why on earth would this be in kernel.bbclass ? and part of a xenomai
recipe ?

Bruce

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/kernel.bbclass | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index f7b612f84f..70fc39086c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -481,6 +481,22 @@ do_shared_workdir () {
>         fi
>  }
>
> +PACKAGECONFIG[xenomai] = ",,"
> +
> +do_patch_xenomai[depends] += "${@bb.utils.contains('PACKAGECONFIG', 'xenomai', 'xenomai:do_patch', '', d)}"
> +do_patch_xenomai() {
> +       set +e
> +       cd ${S}
> +
> +       if [ "${@bb.utils.contains('PACKAGECONFIG', 'xenomai', 'yes', 'no', d)}" = "yes" ]; then
> +               ${TMPDIR}/work-shared/${MACHINE}/xenomai-source/scripts/prepare-kernel.sh \
> +                       --arch=${TARGET_ARCH} \
> +                       --linux=${STAGING_KERNEL_DIR} ;
> +       fi
> +}
> +
> +addtask patch_xenomai before do_configure after do_patch
> +
>  # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
>  sysroot_stage_all () {
>         :
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

