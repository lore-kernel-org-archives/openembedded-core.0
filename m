Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 313E57FDA4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 03:14:57 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id p2so19946016qvo.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 19:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=nMJ2CKhTOnmWWoUwvQn53deZfFeq1gytfCfkG81D8Zk=;
	b=aH1JjE5HS2SB50CmhxEWUWiooVY7mDzySDdOSzeodhpPVQSKhiwndFnQ8HpvmJa5x2
	ylbKHg4aOGwV9uo9hFehgK62Z9O6jEuCsQlp+4RqfDgDxsxjrEfvAU4ZxrXvpMFW+1FU
	f8PYEXuvctEo+SKQNOJ9iXMMZLKIrH+QG+3br6hS1VfKBrOh1WVN2RQztAoEAoTouxof
	gfFV+WmTUF0T+Znx9zUMRkkq+ks0GCZEP2yiaLyi3GgV2/Om8UOUJziyjLcUtmc54n/g
	JyyVaOHiGIdD91Zo7aMQSVYdbBslpNX0lwR0svM3oIqSVT1sCk8n38zWj3FK+LEVhAKR
	QsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=nMJ2CKhTOnmWWoUwvQn53deZfFeq1gytfCfkG81D8Zk=;
	b=VU1nhkJZdlotwpbToYa/DD1JeiRBVMjFBYrVyQt1laZEJKbJKlW4x2e2V4+1hv8oh6
	2XLjBADqX34yi87GVEzNNigZyQnWdP4sf8cHMzOi9Lqz1FtiveGWnbylCGVPDKhMPzap
	mVuEtJB/wZGTN0XrNmSw6DQ/gMvZniAVPtr2l5KqQljvnSoaAlmAF4sT1+rx7+e+EU9J
	etwRhWMdI6ZIA+Ol4juCyVCx7vP4aa/7dWQoosVYaLvyQja6ncdtuqT0iAEmxQjR252e
	KlfxZAMDrAIktds6qicPOaqcfukftU2dNscRD9GqTa4r56xfhAOlmYdlMQTcoW8bvKtI
	FpWA==
X-Gm-Message-State: APjAAAX+AtAwYoOtBetrzrOQGg8tkceU5ScHnak8oH2E6f+86FHhP29v
	9GDune0N0Y80mCAf0eLmwZGC0LHC9q/jJDH5g5QxmoIn
X-Google-Smtp-Source: APXvYqxy4Sae7LUX82bhx81g9DVDaUQt1b3Uw0ln2r2ggy3HSzC9zuVKeI8/TNt8wPOTpzk25X0wBu713GTi2eIEdQ0=
X-Received: by 2002:a0c:fa4b:: with SMTP id k11mr81140517qvo.55.1578366897532; 
	Mon, 06 Jan 2020 19:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20200107031323.2068045-1-raj.khem@gmail.com>
In-Reply-To: <20200107031323.2068045-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Jan 2020 19:14:31 -0800
Message-ID: <CAMKF1spuj_EtBKs7aS0nZLBbSiDReG6gjbyAdDASy3shmaUAPg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opensbi: Use -ffree-standing compiler options
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
X-List-Received-Date: Tue, 07 Jan 2020 03:14:57 -0000
Content-Type: text/plain; charset="UTF-8"

Accidentally sent ignore this one. Use the other patch.

On Mon, Jan 6, 2020 at 7:13 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This usually helps compiler to not use built-in optimizations
> for string functions and mem* functions unnecessarily, since OE's
> compiler is hosted for linux cross compile, this also means we instruct
> it rightly for building a baremetal application
>
> Refresh the patches to apply without fuzz
> Fixes linking errors e.g.
>
> platform/qemu/virt/lib/libplatsbi.a(sbi_string.o): in function `sbi_memset':
> | /mnt/b/yoe/build/tmp/work/riscv64-yoe-linux/opensbi/0.5-r0/git/lib/sbi/sbi_string.c:102: undefined reference to `memset'
> | collect2: error: ld returned 1 exit status
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...Makefile-Don-t-specify-mabi-or-march.patch |  9 ++----
>  .../files/0001-build-Use-ffreestanding.patch  | 28 +++++++++++++++++++
>  meta/recipes-bsp/opensbi/opensbi_0.5.bb       |  1 +
>  3 files changed, 31 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-bsp/opensbi/files/0001-build-Use-ffreestanding.patch
>
> diff --git a/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch b/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
> index 9c2d0eb479..74d93618b2 100644
> --- a/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
> +++ b/meta/recipes-bsp/opensbi/files/0001-Makefile-Don-t-specify-mabi-or-march.patch
> @@ -13,11 +13,9 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>   Makefile | 2 --
>   1 file changed, 2 deletions(-)
>
> -diff --git a/Makefile b/Makefile
> -index ae68f55..10851fc 100644
>  --- a/Makefile
>  +++ b/Makefile
> -@@ -145,7 +145,6 @@ GENFLAGS   +=      $(firmware-genflags-y)
> +@@ -162,7 +162,6 @@ GENFLAGS   +=      $(firmware-genflags-y)
>   CFLAGS                =       -g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
>   CFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>   CFLAGS                +=      -mno-save-restore -mstrict-align
> @@ -25,7 +23,7 @@ index ae68f55..10851fc 100644
>   CFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>   CFLAGS                +=      $(GENFLAGS)
>   CFLAGS                +=      $(platform-cflags-y)
> -@@ -158,7 +157,6 @@ CPPFLAGS   +=      $(firmware-cppflags-y)
> +@@ -176,7 +175,6 @@ CPPFLAGS   +=      $(firmware-cppflags-y)
>   ASFLAGS               =       -g -Wall -nostdlib -D__ASSEMBLY__
>   ASFLAGS               +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>   ASFLAGS               +=      -mno-save-restore -mstrict-align
> @@ -33,6 +31,3 @@ index ae68f55..10851fc 100644
>   ASFLAGS               +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>   ASFLAGS               +=      $(GENFLAGS)
>   ASFLAGS               +=      $(platform-asflags-y)
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-bsp/opensbi/files/0001-build-Use-ffreestanding.patch b/meta/recipes-bsp/opensbi/files/0001-build-Use-ffreestanding.patch
> new file mode 100644
> index 0000000000..8169cbfd22
> --- /dev/null
> +++ b/meta/recipes-bsp/opensbi/files/0001-build-Use-ffreestanding.patch
> @@ -0,0 +1,28 @@
> +From efa39afecedf75a1f3154c39507bdde2810bc140 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 6 Jan 2020 18:21:02 -0800
> +Subject: [PATCH] build: Use -ffreestanding
> +
> +this is a stand-alone/baremetal application, therefore demanding
> +-ffreestanding would help it compile with hosted toolchains e.g. ( linux
> +toolchains ), it also ensures that it won't be using platform
> +optimizations like inlining mem* str* functions which gcc might decide
> +especially with wrapper string functions in opensbi code
> +
> +Upstream-Status: Submitted [https://lists.infradead.org/pipermail/opensbi/2020-January/000887.html]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -159,7 +159,7 @@ GENFLAGS   +=      $(libsbiutils-genflags-y)
> + GENFLAGS      +=      $(platform-genflags-y)
> + GENFLAGS      +=      $(firmware-genflags-y)
> +
> +-CFLAGS                =       -g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
> ++CFLAGS                =       -g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
> + CFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> + CFLAGS                +=      -mno-save-restore -mstrict-align
> + CFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> diff --git a/meta/recipes-bsp/opensbi/opensbi_0.5.bb b/meta/recipes-bsp/opensbi/opensbi_0.5.bb
> index 759bbbfdaa..6a9026254c 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_0.5.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_0.5.bb
> @@ -11,6 +11,7 @@ inherit autotools-brokensep deploy
>  SRCREV = "be92da280d87c38a2e0adc5d3f43bab7b5468f09"
>  SRC_URI = "git://github.com/riscv/opensbi.git \
>             file://0001-Makefile-Don-t-specify-mabi-or-march.patch \
> +           file://0001-build-Use-ffreestanding.patch \
>            "
>
>  S = "${WORKDIR}/git"
> --
> 2.24.1
>

