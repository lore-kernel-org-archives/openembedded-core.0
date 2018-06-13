Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id BC9E174AF8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 14:01:40 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id o17-v6so1582812vka.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=J7zMp+IbXpjxnr0kDGnni1ru4et51+rntvMKmulk410=;
	b=FBmjP1ZzpnbBj0TetSSZbE1344Sml2IFkH7rJkFUPbnslSiorMREx3eHq5hKxrZJkd
	3psuC/tyQEtCDWV6K7gQQhbKhKdD1gDIzZ674YYwerKIrbRzIiyf011II5IgU5dkLWKn
	/GH/A1wfI9WDFvDYlvuWWzDKH6EgJw3xz89uiZeL8YL+pnIdgtc2nTiOatYKPO17hpQ+
	0Kf3ajSLGTRXzajayBvRoeIGSZ5UGykhU1RVEDuqUOk2NxgXKzX8x4epC9BLejmtfB0q
	AFpZU6Q3c7Ejx0qT0tczyP+T9PkO2RISQnbyIQ344gjuBE8rLY7nPof24ERO0twbEGoJ
	ocfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J7zMp+IbXpjxnr0kDGnni1ru4et51+rntvMKmulk410=;
	b=cLLQBJ+7N0AQX1+2mUs3+/d3n25VfBqP+N4nM94Svqn9ww4DHmyUj4HKeN1eQLYgWn
	UyyWs9S/Y2wcH4W6zrJvHMZMLlm31ouTh+L0kXH4t+5T6xprsANw0XnO8YC3O6XvRggX
	ECIUwD6h7VAzaFjfsUSLZ+SLNyzEtUj1fGc/9FzWs9g1jlbeWobq3sIzSEqLzHiUigWE
	jftY/sd4BOoVfrQEg/cYCbzwK5Gxuw3kheHIfUs2EFNgI0JdhsRmgaCl/scekxfmpVPu
	zAm1Lg/C104jW/TSoItRE+uX8NhNsly8BOm06Udemf4cO3xQ2TosvDHs3JMmS6ETbruw
	reiQ==
X-Gm-Message-State: APt69E1q+lrbKtSDggR24LAA2/sPtoIfzm34pc/gdnFDUqOE9VATNCdh
	jh87ZZlFZvCQ3h8Nk0g4uEjHpis0R8WffybrM+8=
X-Google-Smtp-Source: ADUXVKInHD6jblWPYGMyxvbB+3njKAuh6JcQvg0EEIkfAblsHk2xMu2mqhVyJg9r3IRcykZqYb53TSwLjZUpozmPsuA=
X-Received: by 2002:a1f:2c0d:: with SMTP id
	s13-v6mr3032886vks.106.1528898501375; 
	Wed, 13 Jun 2018 07:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20180613061252.18271-1-kai.kang@windriver.com>
In-Reply-To: <20180613061252.18271-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Jun 2018 07:01:13 -0700
Message-ID: <CAMKF1spMCuxOxztWfEGGepupH-K2DOTKwViDf==XoOipocqgHA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: set SECURITY_CFLAGS for mips64
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
X-List-Received-Date: Wed, 13 Jun 2018 14:01:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 13, 2018 at 12:16 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> When include conf/distro/include/security_flags.inc, NOPIE flags are
> still required for MIPS64 target builds. Otherwise it fails to build
> packages such as glide which inherit go.bbclass:
>
> | .../tmp-glibc/work/mips64-wrs-linux/glide/0.13.1-r0/recipe-sysroot-native/usr/bin/mips64-wrs-linux/../../libexec/mips64-wrs-linux/
> | gcc/mips64-wrs-linux/7.3.0/ld: .../tmp-glibc/work/mips64-wrs-linux/glide/0.13.1-r0/go-tmp/go-link-518447869/go.o:
> | relocation R_MIPS_26 against `a local symbol' can not be used when making a shared object; recompile with -fPIC`
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/classes/goarch.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index f54c5169e3e..5fd9f294a8a 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -36,6 +36,7 @@ COMPATIBLE_HOST_mipsarchn32 = "null"
>  ARM_INSTRUCTION_SET = "arm"
>  TUNE_CCARGS_remove = "-march=mips32r2"
>  SECURITY_CFLAGS_mips = "${SECURITY_NOPIE_CFLAGS}"
> +SECURITY_CFLAGS_mips64 = "${SECURITY_NOPIE_CFLAGS}"

perhaps we should use _mipsall once

>  SECURITY_NOPIE_CFLAGS ??= ""
>
>  def go_map_arch(a, d):
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

