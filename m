Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id B35DD7F847
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:42:51 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id x21so31447607qto.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 14:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YM7AnZjrPvMSAg3/5FZM6I2d1HdLqZOJJGVoprL4a9k=;
	b=AQOKz1lDkBlaxKEPpJ1ryofbgh+vDKZ/a/HsvVDPg1rUtURt58Dq8cCn5KkE9lR2fZ
	ks86tPZYbx9gKtktBW9dr3mtWVC/ekj/mj7g8AdWPUm9DsNQ8z56hxh7RASRJEp/mPuR
	dlIX774vZ7gJuc+rbBhK/gxfNM+gh5uYYvbSkC4pwcBz/mXVvOrNERylVnW/f5zZNf74
	+xUl+3SRm5UZscz0gxKh1RfvayjS9BkpmHGUEQUi3pzCyLnTEKTzURG+xoHixEsNcymL
	8VJKOTJcut0esP8TwfPSspZjbIvKwwAYdfLV0EKoDVaUgURnjtROVNvJXRJxw1KXcT8h
	gogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YM7AnZjrPvMSAg3/5FZM6I2d1HdLqZOJJGVoprL4a9k=;
	b=Z7YXfF9tDJ4B3e7SZBqm/3nH6cY8crtytnN444q1ADYHsWreO3NIZv+Y2wm5p/VGhI
	3KDoQoT/BbTVbcVbK04fsA0f3Tbl6pwKxIiE0jmpazMNGorB59mYZJgt4fuRn5IRfnvj
	ELL1M6eM32VSKIYwv2nWb6FnY+T/zm6xXx686FX5uE6Fa654ieDl6ED9cFTQKQqBe5/Q
	UgtzhvddUAJtvHA4HJ7ZXCYTuU383I51Fb/Qe4cH4dYKB6WKUZC+Pn+QFPJ36VF/sDU/
	V0+uhgV9f34Wjkr2FUrgMwYRZattTDno5Pz/Sq07yeYDn/b0x1sYI9623yrsjs7vXvK+
	mtSw==
X-Gm-Message-State: APjAAAU+h6Rz09v76N/QlHER1Gb8E7i66JsJYGifzlVCzMliE9TSGlxF
	2bxMq9NDpdyxIhetb1J9zC77Z/Zn7PCbrntqfQU=
X-Google-Smtp-Source: APXvYqzJmzsY6ymbgeu0pXPzT9j7T08bRrEt88WqAG5h+2v00MyWsRW8mk1Vg2HJB8lQ9pOSNu3/9KmkEHz8uHABtyM=
X-Received: by 2002:aed:2724:: with SMTP id n33mr19819968qtd.194.1572993772158;
	Tue, 05 Nov 2019 14:42:52 -0800 (PST)
MIME-Version: 1.0
References: <20191105215210.17008-1-alistair.francis@wdc.com>
In-Reply-To: <20191105215210.17008-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 14:42:25 -0800
Message-ID: <CAMKF1sp89rDgU+FEb68TU8gaHyAVPCJ_i0OmSDRxtOncJMPkiw@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] machine/arch-riscv: Fix newlib and baremetal builds
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
X-List-Received-Date: Tue, 05 Nov 2019 22:42:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 5, 2019 at 1:57 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Fix the following errors for newlib and baremetal libcs:
>   ld: unrecognized option '--hash-style=sysv'
>   ld: unrecognized option '--hash-style=gnu'
>
> Setting LINKER_HASH_STYLE to empty for just newlib and baremetal doesn't
> work as GCC still ends up being built with --hash-style=gnu which causes
> failures when using a built newlib SDK.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/conf/machine/include/riscv/arch-riscv.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
> index 19f8f3e211..f3edcc39f7 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -8,3 +8,6 @@ TUNE_CCARGS .= ""
>
>  # QEMU usermode fails with invalid instruction error (For riscv32)
>  MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d)}"
> +
> +# --hash-style is unsupported
> +LINKER_HASH_STYLE = ""

I think we still need to use newlib and baremetal overrides

> --
> 2.23.0
>

