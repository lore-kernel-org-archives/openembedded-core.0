Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id DE47773C3F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 15:18:24 +0000 (UTC)
Received: by iebrs15 with SMTP id rs15so49609879ieb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 08:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=tzYHP1q6IDNOoNJsEhM5b5+6IfuU+YIrCeRB+ZQmc/I=;
	b=w93ZNQUSOOf6dWRm+XUlgKGLsY2dWRBcknssNiNiFhCOq0b6d8FLnNNc/6YvGURd/X
	QA/6rfHqHXg0OrzooDbPS6I9toMJwam6z48nNzrNWd6IdnlCCD6vqEfGUIuUgcQL/Wqm
	lMOHY+/qdhLh8s4qH2q3HM3e1DMrf47vbR8p0qi6EGhgjb7BSzUcfT6T3NZ6U+KhRsws
	QYT+c0lG4kosIYYfaon9IFIlH4hURZOxKfSCt91KRdZfwUxKvfw7Kp67ofRA2Cx2k9Jm
	TylAAZd5zg3XYsTZ48K5cL4uFgYqkDXp6fXzqJnp9ctpra1cueTEFfok6lFZEE83gHOf
	kGig==
MIME-Version: 1.0
X-Received: by 10.43.55.12 with SMTP id vw12mr26385918icb.30.1428419905053;
	Tue, 07 Apr 2015 08:18:25 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Tue, 7 Apr 2015 08:18:24 -0700 (PDT)
In-Reply-To: <1428418172.14020.465.camel@linuxfoundation.org>
References: <1428418172.14020.465.camel@linuxfoundation.org>
Date: Tue, 7 Apr 2015 12:18:24 -0300
X-Google-Sender-Auth: YEMweZ1sAxob8J1beFVW8oX0Hp4
Message-ID: <CAP9ODKqzj7SkucnHi6d9huCGG60=C0HyzOmEWfnWjOhM-82QUw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Avoid issues with binutils-2.25
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
X-List-Received-Date: Tue, 07 Apr 2015 15:18:25 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 7, 2015 at 11:49 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Add a patch based on one from Zhenhua Luo <zhenhua.luo@freescale.com>
> in the meta-fsl-ppc layer to avoid build failures for u-boot with the
> mpc8315e-rdb machine with binutils 2.25.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot/0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch b/meta/recipes-bsp/u-boot/u-boot/0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch
> new file mode 100644
> index 0000000..5e9d569
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot/0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch
> @@ -0,0 +1,188 @@
> +From 9ba002f1b1afc7af84a352f4ecab32a30d7ba353 Mon Sep 17 00:00:00 2001
> +From: Zhenhua Luo <zhenhua.luo@freescale.com>
> +Date: Mon, 9 Feb 2015 18:33:56 +0800
> +Subject: [PATCH] powerpc/cpu/*/u-boot*.lds: remove _GLOBAL_OFFSET_TABLE_
> + definition
> +
> +In binutils-2.25, the _GLOBAL_OFFSET_TABLE_ symbols defined by PROVIDE in
> +u-boot.lds overrides the linker built-in symbols
> +(https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commitdiff;h=b893397a4b1316610f49819344817715e4305de9),
> +so the linker is treating _GLOBAL_OFFSET_TABLE_ as a definition into the .reloc section.
> +
> +To align with the change of binutils-2.25, the _GLOBAL_OFFSET_TABLE_ symbol
> +should not be defined in sections, and the symbols in linker generated .got
> +section should be used(https://sourceware.org/ml/binutils/2008-09/msg00122.html).
> +
> +Fixed the following build errors with binutils-2.25:
> +| powerpc-poky-linux-gnuspe-ld.bfd: _GLOBAL_OFFSET_TABLE_ not defined in linker created .got
> +
> +Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>

The Upstream-Status field is missing.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

