Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
	[209.85.222.180])
	by mail.openembedded.org (Postfix) with ESMTP id 89CF774712
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 15:54:32 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id 80-v6so4860854qkj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 08:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Bf+6MJYFniIXSale7AIFoMwWOWIUDUp9ypbGEpm0bQ8=;
	b=IMXN6p+uCuCY2fFkzFT6EaiAd1HeQrmoaKOO65qiB4rw8G5QrybHPOtc45OoBuiv0y
	QCTHJLvUAcozjuAXr6PXJNAN/gkChWtmCWa0ndZqDWhRQCD/aMWc0DdK0oz4oH1DRuI9
	Rswi9AhrHl7Pq0IJwcx2r/OXur4E7meVAeOQlqf708qoGpz8R7uRd+4uM8xkNzwqjBxI
	PwdrUYNDftyXfXMG2/GwxDOvv5UloQz3r2BBZCLddDa6DS3jCwagCgLVoNoAyqXm8wOe
	CFeBQN+hzQ8PfT4JbeA+RElrrq4APO7FemDfkmlfCQhyRxU2I2KaXEEv7ZK9Qu2EUeP4
	cbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Bf+6MJYFniIXSale7AIFoMwWOWIUDUp9ypbGEpm0bQ8=;
	b=A67QPof+ZmYUmAce3ZsEmjfDPdn7zRCHvMfelDveTQknsLEJ9aR7oAxU/a4pjK7A9a
	9e9hYQ9iuPt4m7PX4svizrc/nySex6vzYH/a7B3QWVOsSuFOBkfS5Gd4HjiFbF5ED4qv
	AoQq/NnoJ3oox6Vn/v/NzNB9jBiTWvC2qHNLugC1IOcIJWdqMnUKLevegoevWUOou5lJ
	gh6HLHIDWQydQP5sVE+FecO8U0pdL9cOSflRjJcZgFuEnQ1GVG2eImQ28qybAczF5UQA
	meW1Pu20JaKE4gXXCSJrkhn6kMEG+X0xRBKjTiUPauSKAEJ7CGSuRBqWYiwbLp1OAVh2
	XqYQ==
X-Gm-Message-State: ABuFfojQGA+9RshOpSo9UUsAECbRD6XZsMCiArPJWorsxwVoSbk+0JKu
	RXEH8j/8CO5KdGyKMRhAMUtE885yUFSdGb6HEIk=
X-Google-Smtp-Source: ACcGV60jvkyKDbKbYluvwswCuJ9ptj5PyTJCzhV1/S6acrbAhvAt7ai+s5LTdFa2QShcXnApz7BxKtGJV1cFKy1rTYc=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr4765535qkm.2.1537977273160; 
	Wed, 26 Sep 2018 08:54:33 -0700 (PDT)
MIME-Version: 1.0
References: <7f369514-092a-6a76-0262-ac9a84309b10@siemens.com>
	<20180926132848.6632-1-andrej.valek@siemens.com>
	<20180926132848.6632-2-andrej.valek@siemens.com>
In-Reply-To: <20180926132848.6632-2-andrej.valek@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Sep 2018 08:54:05 -0700
Message-ID: <CAMKF1sqTfiZaz6=mKRh1d2+4gEgD2=YUbFUtXYpF6FrzdgvjWA@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel-devsrc: fix searching for non-existing manifest files
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
X-List-Received-Date: Wed, 26 Sep 2018 15:54:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 26, 2018 at 6:29 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> Even if the do_populate_sysroot have had set-up noexec flag, populate_sdk's
> tasks were trying to find .populate_sysroot manifest file. Change noexec
> flag settings to delete appreciated tasks.
>
> WARNING: core-image-minimal-1.0-r0 do_sdk_depends: Manifest
> build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-kernel-devsrc.populate_sysroot
> not found in qemuarm armv5te armv5e armv5t armv5 armv4t armv4 arm allarch x86_64_x86_64-nativesdk (variant '')?
>
> WARNING: core-image-minimal-1.0-r0 do_populate_sdk_ext: Manifest
> build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-kernel-devsrc.populate_sysroot
> not found in qemuarm armv5te armv5e armv5t armv5 armv4t armv4 arm allarch x86_64_x86_64-nativesdk (variant '')?
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 463305e89a..716e908af8 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -20,12 +20,12 @@ do_install[depends] += "virtual/kernel:do_shared_workdir"
>  do_install[depends] += "virtual/kernel:do_install"
>
>  # There's nothing to do here, except install the source where we can package it
> -do_fetch[noexec] = "1"
> -do_unpack[noexec] = "1"
> -do_patch[noexec] = "1"
> -do_configure[noexec] = "1"
> -do_compile[noexec] = "1"
> -do_populate_sysroot[noexec] = "1"
> +deltask do_fetch
> +deltask do_unpack
> +deltask do_patch
> +deltask do_configure
> +deltask do_compile
> +deltask do_populate_sysroot
>

LGTM

>  S = "${STAGING_KERNEL_DIR}"
>  B = "${STAGING_KERNEL_BUILDDIR}"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

