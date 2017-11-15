Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id C39887851E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:37:32 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 4so8115520pge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Muxqli4EbdSG2nV3xje6RjfukpJ9MgsLTTqS9fw5ouk=;
	b=hgVtZ1T9dG9LNnSYs7DAPO+kiWrWdhwz6mZ7jDhXu2VuNhys+bxrkU5rHQv8ELJPcE
	FxtIy6nkOP3K/umD6o5aMmSjCCnBl8Ao8YFtT/WRQaFVgPimt0eCRU+UB0PImcq5PbJs
	lvN/DbhWPZr+gMBT55PTwugbAa2DY9KwVEOTTeufDvbKpuKp3C9XXLq/pPWOOUpI8Jjp
	LNL1y7jCJF1m2Wn5K6mv+gXPXnym5USaeXqndfmoOPE26sAlAf7LCymEKNYr8RnyLX+9
	nu5mY9JQtKhLuown8jJ4sOZKfx1UfjLAmFAsLwOr1/dP1aa/nbETQdPiHt4KB6j8MpRs
	wvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Muxqli4EbdSG2nV3xje6RjfukpJ9MgsLTTqS9fw5ouk=;
	b=PhQXX1OjUbGYu4+iN1EmiKZ9vgv4lzpIyD+ourphjBPKjRqaRbvrE89K9IXk5nsaHj
	dMoq0SMA3O+KQvP1T0WGU/OuBpiKa6oA/CedTv++uG70m564vJVnx0wQMI4fzGWVxdw1
	iqlCvsKwU5kTPYD8nVBryqV6wAJRdjrkzwIG0i9mGTV1S/WUgaWzoTz7C9MKcMLelKpN
	VIo1zN5JVF181WOeUcZv2DAsHRZbeVvvyh2ekaXrLKDATjgzdedTLFTFN+hfbxLd1NVx
	VMkcZzqm74BhkScs1Y/PcH6hw+2RRPV367Z3CZtU0ffQobzTvUhJJBtUC+RBQmJbN4mR
	Wsuw==
X-Gm-Message-State: AJaThX5wWi7kHne0U+i87UQ3V3TdLRj+fAm6gEEg9tJigmSNgsOcJQmL
	ArvM8WRQolPF1KIvwnhuhhQwUCTzr7kI8XKBV+s=
X-Google-Smtp-Source: AGs4zMZFpUqpOH4CdFKB4cAX7JCGWp5Tx9hzt6uuGJwGnMOP6rxIKCPOd4duSfqNy5JI+Zd9keDFEo+bAnDGAx0vxw0=
X-Received: by 10.99.160.96 with SMTP id u32mr14366962pgn.25.1510717054172;
	Tue, 14 Nov 2017 19:37:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.167.106 with HTTP; Tue, 14 Nov 2017 19:37:03 -0800 (PST)
In-Reply-To: <1510695882-31186-1-git-send-email-andrea.adami@gmail.com>
References: <1510695882-31186-1-git-send-email-andrea.adami@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2017 19:37:03 -0800
Message-ID: <CAMKF1sp+6mEW8r65fDELAR=SO3oPcgv4Bx0s0ROaS=4euUum9w@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: use arm instruction set for armv4 and armv5
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
X-List-Received-Date: Wed, 15 Nov 2017 03:37:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 14, 2017 at 1:44 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> thumb1 is not supported with musl.
>
> Fixes: [YOCTO #12336]
>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/recipes-core/musl/musl.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
> index 56c9d7f..b4b0de9 100644
> --- a/meta/recipes-core/musl/musl.inc
> +++ b/meta/recipes-core/musl/musl.inc
> @@ -26,3 +26,7 @@ INSANE_SKIP_${PN} = "dev-so"
>  # Doesn't compile in MIPS16e mode due to use of hand-written
>  # assembly
>  MIPS_INSTRUCTION_SET = "mips"
> +
> +# Doesn't support thumb1
> +ARM_INSTRUCTION_SET_armv4 = "arm"
> +ARM_INSTRUCTION_SET_armv5 = "arm"

Ah I submitted a parallel fix that was sitting on my branch.
is that fine ?

> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

