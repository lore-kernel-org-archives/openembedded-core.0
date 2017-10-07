Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA4AA600EA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Oct 2017 02:31:07 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g65so18069457pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 19:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=na6MEqu+KgmZSMejk9+CZ/CYrIB0UcR6Z522px/+ydM=;
	b=o4umwOIhlf5ox0Tewc8JATSizGikk22RA/0A/UPrmJKLf3Kw7Ng/3sHNIxlVNNwAjc
	5O2vqivrQPVRQ9FLRolUyepYepJSGkjLjOoJTzH60tL1MZt/rw8XCB7F4ZvZo/ewhdpN
	64+7pn4cub4p/p5RbYsXcgccXfTrS2QK1MLHjOJctKsxF6hjubXaRX2r8p8Vi4LzH9Pf
	H1+tXvSr01bZHYj7PKEzFYn8VScw52MV3o0cgcPzzel19WIWh+QR1tKEm90VhOPssNss
	r6VTNjkPzMmDxufVRIWPQF7fAKVH20gPRAr3NvsnX4SddnOT7PhoTjyEMIii8mGBmwc1
	9beg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=na6MEqu+KgmZSMejk9+CZ/CYrIB0UcR6Z522px/+ydM=;
	b=LK/sUVNdso381sXItxIUWlsiRnNhRRoOPJT43gVWjE/2H7XDDAi7V/L17ms7o9f7oe
	sBsogSqaXD0ShPjms9gJxYXkSWlf+8xRhyjnpgufghv8RX8NUbn0bCAG2auOBDdkUkfq
	hKDt8dYE2kAebPKLI8HB6Bx8UcMNDbkfxXgoaQcy5JEIV1cwAf0ZOhK/SwN3p3G5aoF8
	ibVgT1ai97nLJ9IvLd4uiHjmXRMfmaQ6VEaZRHAhTjr0MIuyr2MCzU6PgREQ13QEf9tU
	MiDes1pkk2uFWn39SKhkoz0DEFVc9nHUs09dLn0NhCSKLz8miJy6oEBnRQaHp13risKh
	75xA==
X-Gm-Message-State: AMCzsaVqXZlm3zehjuKmJCin+FlRa5Opgy4PkT6MCklaPJBZ1SBqD1pX
	d4/tK2MscBXrdu78G1BBzJBupryYItrhGhQyUog=
X-Google-Smtp-Source: AOwi7QBASPPKJ6yZDz4yxG4aPMDfo3XBRQDL8LRJ64B8QrMkvlxYCzzRApiLNL3+1H0G3fkhX5ows/aBL0PqSRg5rP4=
X-Received: by 10.98.156.152 with SMTP id u24mr3826838pfk.255.1507343469134;
	Fri, 06 Oct 2017 19:31:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Fri, 6 Oct 2017 19:30:38 -0700 (PDT)
In-Reply-To: <1507342365-28471-1-git-send-email-armccurdy@gmail.com>
References: <1507342365-28471-1-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Oct 2017 19:30:38 -0700
Message-ID: <CAMKF1spxg7bc++Lo8hqF8kiCn8GkAFay3UnJrbFXXRvHHGDodg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: use a more specific fix for ARM thumb + frame pointers
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
X-List-Received-Date: Sat, 07 Oct 2017 02:31:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 6, 2017 at 7:12 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
> since the Thumb frame pointer in r7 clashes with musl's use of inline
> asm to make syscalls (where r7 is used for the syscall NR).
>
> In most cases, frame pointers will be disabled automatically due to
> the optimisation level, but appending an explicit -fomit-frame-pointer
> to CFLAGS handles cases where optimisation is set to -O0 or frame
> pointers have been enabled by -fno-omit-frame-pointer earlier in
> CFLAGS, etc.
>
> Note that this limitation applies both to gcc and clang, the only
> difference between the two being that where gcc aborts with an error
> about reusing r7, clang apparently silently generates broken code:
>
>   https://bugs.llvm.org/show_bug.cgi?id=34165
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 8b6a2e3..3766501 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -28,6 +28,16 @@ export CROSS_COMPILE="${TARGET_PREFIX}"
>
>  LDFLAGS += "-Wl,-soname,libc.so"
>
> +# When compiling for Thumb or Thumb2, frame pointers _must_ be disabled since the
> +# Thumb frame pointer in r7 clashes with musl's use of inline asm to make syscalls
> +# (where r7 is used for the syscall NR). In most cases, frame pointers will be
> +# disabled automatically due to the optimisation level, but append an explicit
> +# -fomit-frame-pointer to handle cases where optimisation is set to -O0 or frame
> +# pointers have been enabled by -fno-omit-frame-pointer earlier in CFLAGS, etc.
> +CFLAGS_append_arm = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
> +
> +# Pending testing, this can probably be removed (fixed more specifically above
> +# by appending -fomit-frame-pointer to CFLAGS when building for Thumb).
>  ARM_INSTRUCTION_SET_toolchain-clang = "arm"

Please remove this. Then I can test the patch with clang and see if it fails

>
>  CONFIGUREOPTS = " \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

