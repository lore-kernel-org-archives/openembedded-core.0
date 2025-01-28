Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D9BC02190
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 19:21:29 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.5711.1738092085893786309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 11:21:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eJeSBPto;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3eb7f3b1342so2908402b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 11:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738092085; x=1738696885; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYdJ+Lckpug4Ank+2acM8ibKNH1E6aIIteGJB7O156Y=;
        b=eJeSBPtoqAVW+TRNE3zI+ZwZCcLpY+HDcHRNi9ApeVfYkAnggK58EZsC8gOTCLUFYP
         0VrSKlpaYrgWa6Ow5zvb83SQ7Gt9Gk/jJ9E8ioDmIoQjiQGFAy2zKYDrvkvCqe+iPy84
         JtH15JXdEHSF3WOtTEEhYOnNb9EyR1c6Kki/ET+5TNKDAA/SqKoz2UvKnjDvgM0RE2Xy
         P6CLQoa3SAbW3iKPSlEEy9CP+E06yvFaeF4QHVDD17YdTPfhcYkLzfqE7hg0X4Sj3MSH
         pJyHF8tFhYotsr5Ny2CGwP7+nTPLVbKYYsLfZbDPjh9OR4DdPehZUVKAA8YCv4Mmk7BZ
         VNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738092085; x=1738696885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYdJ+Lckpug4Ank+2acM8ibKNH1E6aIIteGJB7O156Y=;
        b=klNM/vsd2XCr1Pvpa3ocbgJJcb/wGjCTBvRykXSODlysILPaGZhbEgF4bfLhFZSVwT
         2d7n/hXpLLbYR7PyCCSjRw6xVISVk+wgKXwyKbAXbQHW928M2z49QKKF2ygdW6fuLn4o
         xX/piGUjZzQlcFGDt4g5J2d/b/d0oAxGChdlWLdCy8leqQ9t24+Sliqu4848YzgHqLzV
         DVB3PLJH2pVctd8U8gD1SXCHZbaCQj60xKt+vprevrJ4KSWbgj57v1XqHwNpcB0kllt6
         JGpYVtnNv2Nn0D9rddYuJdKlh/AQ3cZYgi4ImQPFabyX7KSsFyIkY9Nv0817IEFl1JvW
         5fgg==
X-Forwarded-Encrypted: i=1; AJvYcCXaObzlaWbIUekDneXdGRzgUVUq8opmQS0lYH2fy27VevCrrPgcpUMFAgUFrpJkqztqTUnnNUKZ/ceecPPhqgyYKA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRz15uiVgCGtTb1XHzQRnYFgYWsMz14r+LD13ww+Cs0aEoi51h
	DYEhYEkehH4K6I7tG3cHjLPlN3pJLR9PxexSkIndmlCsBTZWOHJyFdDgRADvtZDoYZdNvFKy82E
	7WqDndLJtYtGePSwEdl7lM+FcqT4=
X-Gm-Gg: ASbGnct6ldEFJeVvLCcc7gCdpI8vIu+y9UK7in6zvuFCPIFQw/cAevWqMDekPIWFbRg
	2qOF63XySTcEY2JE4HtmM032kl/tR8oMI+T6e7DbXrb514RcHos+LK5Rxp8y3XWmI71KWzFhhl+
	4U0D4b+0EiI0r3MgAAP/dej1BxTA==
X-Google-Smtp-Source: AGHT+IHWvCNVPvtkG0mYokSB505JSeJCz3q7CcsPeNjTRVyUnQIoZuLJRmSq5f61o9DJu318d63WSv8ZIpAoQqPdroE=
X-Received: by 2002:a05:6808:f03:b0:3e5:f656:dd19 with SMTP id
 5614622812f47-3f323a59d92mr88985b6e.19.1738092085004; Tue, 28 Jan 2025
 11:21:25 -0800 (PST)
MIME-Version: 1.0
References: <20250128101633.3664659-1-Yash.Shinde@windriver.com> <96981090-c00a-40cb-802c-f709450036f1@windriver.com>
In-Reply-To: <96981090-c00a-40cb-802c-f709450036f1@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jan 2025 11:20:58 -0800
X-Gm-Features: AWEUYZno0hkBRN99VdaTNTY9XSFsOoltA6drzQnwcWatgMRXfb0sJ6y0sm-qivQ
Message-ID: <CAMKF1sr7gtMBYBngfCh4J+LMq09Uq_YAJL7xWLfzM5KEKFW8bA@mail.gmail.com>
Subject: Re: [PATCH] qemuriscv: Enable Sv39 memory address scheme by default
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
	"Ramasamy, Rajeshkumar" <Rajeshkumar.Ramasamy@windriver.com>, Sundeep.Kokkonda@windriver.com, 
	"Hao, Kexin" <Kexin.Hao@windriver.com>, "He, Zhe" <Zhe.He@windriver.com>, 
	Trevor Woerner <twoerner@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 19:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210335

I am fine with this change as is.

On Tue, Jan 28, 2025 at 7:51=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> Add Raj, Khem, Kexin and Zhe who know more about RISC-V than I do.
> Kexin and Zhe are on holiday for a week or more.
> CC a few people who have contributed to riscv* conf.
>
> I am not all that familiar with either qemu internals or riscv specificat=
ions so any input is appreciated.
>
> I have some comments and questions below.
>
> On 2025-01-28 5:16 a.m., Yash.Shinde@windriver.com wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> Currently, GCC Asan supports only Sv39 on RISC-V due to custom allocator =
configurations optimized for large allocations.
> These configurations are incompatible with larger address spaces like Sv4=
8/Sv57.
> This fix enables RISC-V's configuration for Sv39 by default when running =
`runqemu nographic`,
> eliminating the need for manual configuration via command line flags (`qe=
muparams=3D"-cpu rv64, sv39=3Dtrue"`).
>
> Fixes [YOCTO #15691]
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15691
>
> Reference: https://git.openembedded.org/openembedded-core/commit/?id=3D4b=
4450ff695ef73bf7a2437e142d2e0730d6a547
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/ma=
chine/include/riscv/qemuriscv.inc
> index d01d988eee..6170ce65f2 100644
> --- a/meta/conf/machine/include/riscv/qemuriscv.inc
> +++ b/meta/conf/machine/include/riscv/qemuriscv.inc
> @@ -27,6 +27,7 @@ UBOOT_ENTRYPOINT:riscv64 =3D "0x80200000"
>  # qemuboot options
>  QB_SMP ?=3D "-smp 4"
>  QB_KERNEL_CMDLINE_APPEND =3D "earlycon=3Dsbi"
> +QB_CPU =3D "-cpu rv64, sv39=3Dtrue"
>
> Thanks Yash.
>
> To save everyone from doing the math, sv39 gives the system 512 GB virtua=
l address space.
>
> Should we use the ?=3D operator here so that users can easily override th=
is specification
> just as is done for  QB_SMP two lines above?
>
> Please summarize what testing you did.
>
> Did you test with TCLIBC=3Dmusl ?
>
> Since you are changing qemuriscv.inc you and the YP AB should test qemuri=
scv32 and qemuriscv64.
> qemuriscv32 should, if I'm understanding how this works, be unaffected si=
nce it has to use sv32 mode.
>
> Did you find out why sv39 isn't the default for qemu?
> If not, please check the git history and it there isn't an answer there, =
ask one of the qemu developers
> who work on risc-v. It would be nice to have a sentence about that in the=
 commit log.
>
> Did you consider a different RISC-V cpu sub-arch such as rva22s64 ?
>
>    https://github.com/qemu/qemu/commit/3ba8462c4ca55720239fdc6fa30b9870d2=
2a8814
>
> I'm only asking because it seems like it might be a good fit for us and I=
 noticed it when
> searching the qemu commit logs looking for sv39.
>
>
> ../Randy
>
>
>
>
>  QB_MACHINE =3D "-machine virt"
>  QB_DEFAULT_BIOS =3D "fw_jump.elf"
>  QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,downscr=
ipt=3Dno"
>
>
> --
> # Randy MacLeod
> # Wind River Linux

