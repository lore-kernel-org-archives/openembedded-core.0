Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AE4D37E52
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:41:16 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13149.1768405268159693677
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 07:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=awuWssvG;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34c708702dfso4916302a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 07:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768405267; x=1769010067; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOnLAjAka0OUnAddyoFotUJqtj59+WO1NslSghOS92w=;
        b=awuWssvGOBC4vn3y1tBCApzlqZVvl0RI7Y2a9+Z0gHLv2sMe9EVlrARRJuvbC9hxBd
         JkHOBRrsKNFK8Qz1ecGKZcBbhdgqZkNfALyBAj6fPLH8BupHhYdC7n2yUvCboYmncwkF
         TTOKFW7pAN+ncbcfy639mT9Db7/BhDQaS5fkoC16dGHt3+iVfL1xXLO2oYF6rRfNLDJ4
         GR4qG10ft2WicUe5Ktje0qFmurQbLxp26y0+3QTRRXsJ1/o8Jan6SVsfmK3153MIN+zm
         /8zWMlkrOx+Ag9Lc37KzwM8p1DeVXqC+Eot0bDPtPt8Xjzp8VxFP9EvzxdJfTysrTHBl
         ngtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405267; x=1769010067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qOnLAjAka0OUnAddyoFotUJqtj59+WO1NslSghOS92w=;
        b=inTCDB/JIhAmdPcoV0Iwil8jdwP2i4hmTZRrO5nJ6yB+IurOVzB/TtfFhma5D11lOC
         GPe8I03Zs+oENMUnF4CJgchdlpBJVmIt4enTQTiedCTUTv+5SyYRQed3yjByEQAfcJH4
         Ld6j059hhD7dYV71NCMVILyF6U8cjVGMxH00izqbx3xdwNW85lj+AWQYLROw2cqGK/DG
         UboHwRw97O5k0IpKNwAJoe7fU4RX95wrRbUjcHEShbfX8C9cME4n6Xjwn7WRWKhYW0kj
         cGjgLPeuK9sk/4vz0uOKpBuJsoIb44TznxgVTwMerYh1mL7xvfj3520caAmUm2p5aziH
         z9EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWwnHxoOJp2AxpejJGOuOj8z0ZWWO/T7Xt0rEbvFyqdyWXyM5LsobFpQCickH56lF55gGSZ3ySXC9JwPUEESEqLA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxzn6aNigLThdh4IC/KxfRM2XDhfVwul6fA3HNeTbBzQj+XsNIC
	QYSZmzhe+Qtv2MdUqHTGBdzxAwEyPTPssQHNAlh4r4hR73Wdv1GX5pr4eL4g7bASR3nGX4u0X7k
	+PZRzPVORfftotKiViXrQyBC5f6VdSGa2thMDw78=
X-Gm-Gg: AY/fxX79FcpHCJ86+KNf85PYzEeD6Xfo6YQEw8P045gfLS4UFSRhsaZlVk7GAgmvvN/
	lK/v5EMn1OdKrz7AHiaAYlnQ8XDjitt01WdN8vg6XAV90n9PmvwENIpclzu2g1EUO9Y2G4AYunA
	wohzJz791hK6q3m8HCAeZelUFbjjgPv3/ljwJu8L780Vt0amtjsAtl7vUnjZZ6vgvJTFvDLVxVJ
	48KopnRtLUZajLk7429N+iN8yYk/WH/bOO9YJcJdBmnIUu5+jO5LZEZJS3NdAdSmunc1Qoi1pds
	xgztmaI=
X-Received: by 2002:a17:90b:3e8a:b0:34c:2ecf:2b2e with SMTP id
 98e67ed59e1d1-3510b0ab00dmr2366266a91.12.1768405267365; Wed, 14 Jan 2026
 07:41:07 -0800 (PST)
MIME-Version: 1.0
References: <CA+TGqK9Yd2WWKrhMkhofF-8N0cESCSefWD2DXr4sBO9fDQXyrg@mail.gmail.com>
In-Reply-To: <CA+TGqK9Yd2WWKrhMkhofF-8N0cESCSefWD2DXr4sBO9fDQXyrg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Jan 2026 10:40:55 -0500
X-Gm-Features: AZwV_QhWq2Glf60s3VhvgBEbSP3eDvBv038RTcFg_PcJ8TtyePIz_GE4YkAkUSg
Message-ID: <CADkTA4P_8ScPBxuou2Jn7Jphk5ZCr9vWbsd7CPQHuGe8B=bd3w@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] kernel-yocto.bbclass: Disable ccache when
 rust-kernel is enabled
To: Alban MOIZAN <alban.moizan@smile.fr>
Cc: harish.sadineni@windriver.com, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, El mehdi YOUNES <elmehdi.younes@smile.fr>, 
	openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 15:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229336

On Wed, Jan 14, 2026 at 9:57=E2=80=AFAM Alban MOIZAN <alban.moizan@smile.fr=
> wrote:
>
> Hi everyone,
>
> I've been investigating the issue when enabling `ccache` for kernel build=
s that involve Rust.
>
> First of all, as documented in the `ccache` issue tracker [1], `ccache` i=
s not directly compatible with Rust.
> Therefore the current goal is to keep `ccache` enabled for the C portions=
 of the kernel while bypassing it for Rust.
> While an alternative like `sccache` [2], compatible with both C and Rust =
exists, you will see below that the underlying issue is the same, so just r=
eplacing `ccache` by `sccache` will change nothing here.
>
> The issue (commit 235e6d49e5888ad04416219e10b6df91a738661a + this patch):
>
> When `ccache` is enabled, `${CC}` to `${CCACHE}{CC}`, ex: `gcc` to `ccach=
e gcc`
>
> Then, when compiling the kernel, `scripts/Makefile.host` will give it to =
`rustc` with `-Clinker=3D$(HOSTCC)` [3], but the shell expands `$(HOSTCC)` =
to two words, therefore `rustc` takes `gcc` as another parameters, and it e=
rrors out.
>
> I attempted to resolve it by modifying the incriminated Makefile in the f=
ollowing ways:
>
> Trial 1: Quoting HOSTCC in Kernel Makefile
> Modify `scripts/Makefile.host` to wrap `HOSTCC` in quotes to ensure it is=
 passed as a single string parameter:
> Replace `-Clinker=3D$(HOSTCC)` to `-Clinker=3D'$(HOSTCC)'`
> Result: Failure, `rustc` looks for a binary path literally named `ccache =
gcc`, which does not exist, indeed, `-Clinker` argument value is treated by=
 `rustc` as a real path, and not a command [4].
>
> Trial 2: Splitting HOSTCC into Linker and Pre-link Args
> Modified `scripts/Makefile.host` to force the linker to the first word of=
 `HOSTCC` and pass subsequent words to `-Zpre-link-args`:
> Replace `-Clinker=3D$(HOSTCC)` by `-Clinker=3D$(firstword $(HOSTCC)) -Zpr=
e-link-args=3D'$(wordlist 2,$(words $(HOSTCC)),$(HOSTCC))'`
> Result: Failure, `rustc` executes the command as: "ccache" "-m64" "gcc" .=
...
> This is invalid because in `rustc`, the target-specific pre-link argument=
s (from `compiler/rustc_target/src/spec/targets/x86_64_unknown_linux_gnu.rs=
`) are added before our custom args, placing `-m64` before the `gcc` execut=
able [5] .
>
> Proposed Solutions
> 1. Kernel + Rust Patch (A): Patch the kernel Makefile (like the Trial 1) =
and patch `rustc` to accept a command string (with arguments) for `-Clinker=
` instead of a strict Path.
> 2. Kernel + Rust Patch (B): Patch the kernel Makefile (like the Trial 2) =
and patch `rustc` to use `post_link_args` instead of `pre_link_args` for ta=
rget-specific values, ensuring the executable stays at the end of the comma=
nd.
> 3. Shell Wrappers: Implement shell wrappers for CC, CXX, etc. This would =
allow `rustc` to call a single wrapper script, hiding `ccache` from it.
> 4. Kernel only: Patch the kernel Makefile to filter out `ccache` from CC =
(works in practice but not generic for a possible other wrapper in the futu=
re).
> 5. Leave as-is: disable `ccache` when rust is enabled .
>
> Risks and Considerations
> - Upstreamability: Patching rust and the kernel at the same time could ta=
ke time.
> - Maintainability: While the shell wrapper approach is more flexible and =
solves the issue for other tools with similar limitations, it might make de=
bugging in Yocto more difficult and requires significant changes.
>
> I'm leaning towards the 1st or the 3rd approach, but I'd appreciate the m=
aintainers' thoughts on which path fits the OE architecture best.

No wrappers around the compilers. In my experience, wrapping an executable
to manipulate the parameters just causes to many issues with observability
and debug issues. So that rules out option #3 IMHO.

Honestly, I just lean towards #5 while the handling is worked out upstream
between the tools.  I don't use ccache, and don't have the impression that
it is in widespread use .. but with the right amount of data, I could
be convinced
I'm wrong on that.

That being said, I'd also add:  Don't worry about enabling ALL kernels whil=
e
working through the enablement. By that, I mean if there's a simple
kernel patch,
I could carry it on linux-yocto while upstream work is happening, and we co=
uld
confirm no ccache issues there.  The patch could also be taken by other ker=
nel
maintainers that want it for their configuration, but we wouldn't have
to do much
else on that front.

I haven't gone and looked at any code, but isn't it just simpler to
filter ccache
out in the kernel Makefile's themselves before any rust invocations ? I ass=
ume
that is inherent in your option 1/2, but the comment about needing to patch
rustc as well has me wondering.

Bruce

>
> [1] https://github.com/ccache/ccache/issues/364
> [2] https://github.com/mozilla/sccache
> [3] https://git.yoctoproject.org/linux-yocto/tree/scripts/Makefile.host?h=
=3Dv6.18.1#n94
> [4] https://github.com/rust-lang/rust/blob/4931e09e3ac3182d2a00f38cccfdf6=
8e8e385e1c/compiler/rustc_codegen_ssa/src/back/link.rs#L1419
> [5] https://github.com/rust-lang/rust/blob/4931e09e3ac3182d2a00f38cccfdf6=
8e8e385e1c/compiler/rustc_codegen_ssa/src/back/link.rs#L1870
>
> Best regards,
>
> Alban Moizan
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

