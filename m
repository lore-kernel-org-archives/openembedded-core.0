Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2A1F977CF8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 16:24:58 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id w1so35887816qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jun 2017 09:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rm6wCkPtvRwwCTMQ+ub10yWaP4aFNz4e8ec9f7AkHTA=;
	b=Aj6HOXUyyBqMMWttVcSlwWL/Rv7bFZ7J7TNn1C4YDudo8ljahQdWu353JjefBWeSw6
	Ygf6KurSuV9vUbkExQLiotVp3UJnp96qH4hRHThTe9cNCUh/nfIaq6Vjt+87QjOymsdc
	Z5q1tfJvMAQuaIwUsXzS5xa/Tm522Z1aD111g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rm6wCkPtvRwwCTMQ+ub10yWaP4aFNz4e8ec9f7AkHTA=;
	b=ArmddBldHYrgVadHEzOf4lBpksqlDFsJbP5ljNuPM52KqQxPiZPTrVpzWGE7mj2qtT
	stLpeb6IeQLxciiSnJx/PZFGinxSzwSfAEltXbBTud5FaJXfpS8jjG3cn6EpWknngCcQ
	tCeB+coOOuVyZBaVda+B/GxQY7taCbBIQehkCetcWYe4xaUiJVJwO2bjhQbdPCquRHaz
	11SGmlV+C52EIP7yRX0Ixe30xDXQLEzfAJzavAJtue/FYr4s5Wo0lgbd1+/h6GvYiLyg
	COeNCQvx6IAjcfgt/f8evj+n4dHIc2Etwb+P2RX2CRrd4AGYpFm5LUzd85o22YTU+6hB
	6ySQ==
X-Gm-Message-State: AODbwcDje92iL/TwiOOFWTYgxe9Gfu3D460yZ593uYeKbAwO2jo/UVwr
	DE2wfGwqsjMCFDNpa19mk9jCiJ0YW70Y
X-Received: by 10.200.33.232 with SMTP id 37mr10275957qtz.189.1496420699844;
	Fri, 02 Jun 2017 09:24:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.104.204 with HTTP; Fri, 2 Jun 2017 09:24:39 -0700 (PDT)
In-Reply-To: <5f7f9187-8c25-e641-2d9f-88018201ad45@socionext.com>
References: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
	<5f7f9187-8c25-e641-2d9f-88018201ad45@socionext.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 2 Jun 2017 18:24:39 +0200
Message-ID: <CAP71WjzvFiOTUgd62kw8mUfTJxX5jUAkiZg3YQSrmQjP-=DQrQ@mail.gmail.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: KERNEL_IMAGETYPES and Image.gz
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
X-List-Received-Date: Fri, 02 Jun 2017 16:24:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 2, 2017 at 6:16 PM, Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
> I already suggested the patch to solve this issue.
>
> https://patchwork.openembedded.org/patch/138596/
>
> Although I've not received any comments on this yet, could you try to apply
> it?

thanks for sending this out. Well, unfortunately, I think your patch
is doing something wrong.

As discussed earlier on that thread, we should be using kernel
Makefile to generate the target as much as possible. The linux build
system can generate vmlinux, Image and Image.gz, but not vmlinux.gz.
So we should compress only vmlinux 'outside' of the linux build
system, and for Image.gz we shouldn't do that in OE. In other words,
Image.gz should be included in typeformake. Your patch does not do
that, and that is something which is taken care by mine.

