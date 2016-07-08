Return-Path: <armccurdy@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7255F60119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 13:08:41 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n132so8971920qka.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2016 06:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=klLSCXsYxCRX7VtLrlWTP2nsQ4hbQ9RVZme08sPQhf0=;
	b=IJn55XNaPhA8V+KnwB2d6T5SZor4Hl0NrAQ4693f/XWXFQvKqVt8nyf0OO2EbIsTVf
	OthtY0yluzYlEYsuWMjXBfZ8PMI92uQHpzgeFqDKod/I0/ivL8H+68QCC8UkvkRqtHfO
	8MUid3ChOLBK7/R7z/P+FakpG28TAITdmpV0BQm4jbKU89aAjSxc2eDFb4uVxjYlRlCj
	JCJlXPPKQcjGVhF+Xy4QFRz2S8zAw6zFOOJ/RyHIQRyVJEiolJHpIj6mYoI7wuwGAnTR
	Eb1K3+Dxb6rvKv4V4TcLFmUw7N2N+uEoyF6ptqC41867p5Lj1DdmocG/973khvNKn1Ud
	Vt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=klLSCXsYxCRX7VtLrlWTP2nsQ4hbQ9RVZme08sPQhf0=;
	b=Wr89RSXnT0E/hWq0PwZChqYXAuVzyHByRkEbczxgMyXP+Z5BQgcRaXMVTEINss8zzc
	aFJjYkCkOFH1NXrGPrLpXaT7gDJ3LEnRuTiFHW5DZbQ/MztkUstTpSOqyURM3Hll439r
	tycZYXiXiNiBY7T8vMpIspOlGQ+BIJ8ES+QLgFwIpZDW7Nv6rA5XGueX8UNfisI8OQYQ
	x5zepSy0dEJY9WmKm6O8hWUfdzwXy9If2FYjyDvx2vsXhbdlkiFWwGYdWjA5yosP3HHY
	joLHVFBOSemMLXRZUX+bkw8m/Q5LVnryEYgn8+zVAKufQ75mff/fdJb3eNuUFloRu5bB
	4EPg==
X-Gm-Message-State: ALyK8tKFg162vEE7kv9skT7UnCDqJBnqqRN04erMdUuNpAhFTrsZYDVnz6SVW2zeJGjVbB7GE7Ul5Uu1KHdW3Q==
X-Received: by 10.194.90.81 with SMTP id bu17mr5244247wjb.43.1467983321710;
	Fri, 08 Jul 2016 06:08:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.145.39 with HTTP; Fri, 8 Jul 2016 06:08:41 -0700 (PDT)
In-Reply-To: <1467925713-13460-1-git-send-email-kergoth@gmail.com>
References: <1467925713-13460-1-git-send-email-kergoth@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 8 Jul 2016 06:08:41 -0700
Message-ID: <CAJ86T=U4xLC9wtd4_+uhkdEaR4J1A8PSZvwyYTCoN7SF92siVg@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] gcc-cross: default linker hash style to sysv
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
X-List-Received-Date: Fri, 08 Jul 2016 13:08:43 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 7, 2016 at 2:08 PM, Christopher Larson <kergoth@gmail.com> wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> We explicitly set the hash style to gnu in our LDFLAGS. Setting the default to
> this in the toolchain, while convenient, actually hides bugs, as a failure to
> obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to how we
> poison the sysroot -- rather than relying on the default, notice right away if
> somoeone isn't obeying the needed flags.
>
> This will result in a failure to obey LDFLAGS causing a GNU_HASH QA failure,
> which is what's often seen with external toolchains. This brings us all on the
> same page, and makes sure a failure to obey LDFLAGS is seen early.
>
> This is limited to cross, to retain ease of use for SDKs.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>
> Supercedes '[PATCHv2] gcc-cross: remove --with-linker-hash-style'
> v3 changes: per khem's advice, switched to use of LINKER_HASH_STYLE
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> index f479360..c0b8751 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -13,6 +13,11 @@ PN = "gcc-cross-${TARGET_ARCH}"
>
>  require gcc-configure-common.inc
>
> +# While we want the 'gnu' hash style, we explicitly set it to sysv here to
> +# ensure that any recipe which doesn't obey our LDFLAGS (which also set it to
> +# gnu) will hit a QA failure.
> +LINKER_HASH_STYLE ?= "sysv"

Defining a new variable (LINKER_HASH_STYLE_INVERSE ?) and setting it
to the opposite of whatever bitbake.conf ends up assigning to
LINKER_HASH_STYLE might be clearer here.

Otherwise MIPS toolchains will continue to default to the same hash
style as MIPS LDFLAGS.

> +
>  EXTRA_OECONF += "--enable-poison-system-directories"
>  EXTRA_OECONF_append_sh4 = " \
>      --with-multilib-list= \
> --
> 2.8.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

