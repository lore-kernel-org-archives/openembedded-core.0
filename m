Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8ECD2A00B
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:59:56 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12293.1768403069030096563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 07:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SUL3G5YT;
 spf=pass (domain: smile.fr, ip: 209.85.218.50, mailfrom: alban.moizan@smile.fr)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b86f81d8051so168498566b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 07:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768403067; x=1769007867; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C7kyE2X4F5h/iofeU8FHk4sWsy2VZOGQoYIOalmmplQ=;
        b=SUL3G5YTiBKyRbpKTWQsaJcFq8LSBeCf2yboPsgMeA3P3dapxDxcaULVdef6uBWZPg
         R9wGSJ+o50e1fDGYBERwwlfjnbxJiavMpcNvFzaWVhAt64iYs8iuJ5MorhPOeZv5l5is
         C3riiVLKqqqqBwWfL86L0y1YdoM7prMw3KvRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403067; x=1769007867;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C7kyE2X4F5h/iofeU8FHk4sWsy2VZOGQoYIOalmmplQ=;
        b=VDlxUipFXWdDRWhW9r2FHJHPgas8BQMXoqSv8wrK5DbCrt4OKINi4+Y13MWL0oyo6F
         gzQxbWKMk95Z7l5goMSpZw7tfYPfgf/CypKBwG7eivMlspKnESuBMpbkB0vFvcN98gse
         Ky7HnU43Ao5aRD+XdEipgmka3bzfUbJT0rBnJ8J2xUg/tOEnhnUxUoKaW1xkxsb5kl/o
         4DaMm5CdfzKHx8B2rx1kauv4QJODz502CsJv7k+Kn3D0eCIevjdCOc4y8k+zyWp+11OM
         S9ZueN7dA2R+CQLsJLcBMHt2s7XPMW253etOjokF+Fl8HUG2A7rxkHtB5IgKxDWH9pr2
         utKA==
X-Forwarded-Encrypted: i=1; AJvYcCVBQeOidTfaegMWGACNFlTaMP1uaQQ2pepPRI+92qKhjTNAnRPJn7YsuvT4huIhIQi0fe5tFqUhSfDaPv95FkEiyg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHUm1TAdkwTrKslRY61enWIF43dTxuhobblHFuX69fOmAKUvT7
	aGnIoN7CMBhwGvf69hPW3SukX+6LGa8gcJ9to6BNhHUqrWS00HrLeFGokCf+bUZQu9QP0I589tf
	+gd++lAX6zMmhTIBYH4z9OBTQbaARu+L53m6DZ2AkFMr+kXST7s1G4umy4A==
X-Gm-Gg: AY/fxX4hYEZynMwJYfsvth6KAiX3fCOqAb1ip0uzjJTA0Sl39Lx0ulfiFBAgQrpKQPz
	WB1p+un2IGa29tvmOdosN2O7PTqvSAITYTB0j5Cf0buAazuErg9fyv1gUUQwu8ZEYJ5CNsSkcCl
	diQBi/Iql6lzL/yxs4qupMSqIWDFmZW1YX/s5yyLtnwHtNdrocJ7vH1tr8GbAjCQefuVC+sRtia
	mTm84PAVll8/JoVycjetLFql7IGJVyLFbhAUkU3qDGZ/v2N8PsosEsPahcUHRWs0Am9ksy02w==
X-Received: by 2002:a17:907:7244:b0:b76:d8cc:dfd9 with SMTP id
 a640c23a62f3a-b8735951a6cmr568284066b.18.1768402644020; Wed, 14 Jan 2026
 06:57:24 -0800 (PST)
MIME-Version: 1.0
From: Alban MOIZAN <alban.moizan@smile.fr>
Date: Wed, 14 Jan 2026 15:57:12 +0100
X-Gm-Features: AZwV_QgcKlZNZUQI3BfhAKJehPHzs8R-Wt9tV_bCxwvWyHnw6u-0wu6K9lmST88
Message-ID: <CA+TGqK9Yd2WWKrhMkhofF-8N0cESCSefWD2DXr4sBO9fDQXyrg@mail.gmail.com>
Subject: Re: [PATCH v2 08/15] kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
To: harish.sadineni@windriver.com
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	bruce.ashfield@gmail.com, El mehdi YOUNES <elmehdi.younes@smile.fr>, 
	openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="0000000000006ac4b206485a53f1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 15:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229346

--0000000000006ac4b206485a53f1
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I've been investigating the issue when enabling `ccache` for kernel builds
that involve Rust.

First of all, as documented in the `ccache` issue tracker [1], `ccache` is
not directly compatible with Rust.
Therefore the current goal is to keep `ccache` enabled for the C portions
of the kernel while bypassing it for Rust.
While an alternative like `sccache` [2], compatible with both C and Rust
exists, you will see below that the underlying issue is the same, so just
replacing `ccache` by `sccache` will change nothing here.

The issue (commit 235e6d49e5888ad04416219e10b6df91a738661a + this patch):

When `ccache` is enabled, `${CC}` to `${CCACHE}{CC}`, ex: `gcc` to `ccache
gcc`

Then, when compiling the kernel, `scripts/Makefile.host` will give it to
`rustc` with `-Clinker=$(HOSTCC)` [3], but the shell expands `$(HOSTCC)` to
two words, therefore `rustc` takes `gcc` as another parameters, and it
errors out.

I attempted to resolve it by modifying the incriminated Makefile in the
following ways:

Trial 1: Quoting HOSTCC in Kernel Makefile
Modify `scripts/Makefile.host` to wrap `HOSTCC` in quotes to ensure it is
passed as a single string parameter:
Replace `-Clinker=$(HOSTCC)` to `-Clinker='$(HOSTCC)'`
Result: Failure, `rustc` looks for a binary path literally named `ccache
gcc`, which does not exist, indeed, `-Clinker` argument value is treated by
`rustc` as a real path, and not a command [4].

Trial 2: Splitting HOSTCC into Linker and Pre-link Args
Modified `scripts/Makefile.host` to force the linker to the first word of
`HOSTCC` and pass subsequent words to `-Zpre-link-args`:
Replace `-Clinker=$(HOSTCC)` by `-Clinker=$(firstword $(HOSTCC))
-Zpre-link-args='$(wordlist 2,$(words $(HOSTCC)),$(HOSTCC))'`
Result: Failure, `rustc` executes the command as: "ccache" "-m64" "gcc" ....
This is invalid because in `rustc`, the target-specific pre-link arguments
(from `compiler/rustc_target/src/spec/targets/x86_64_unknown_linux_gnu.rs`)
are added before our custom args, placing `-m64` before the `gcc`
executable [5] .

Proposed Solutions
1. Kernel + Rust Patch (A): Patch the kernel Makefile (like the Trial 1)
and patch `rustc` to accept a command string (with arguments) for
`-Clinker` instead of a strict Path.
2. Kernel + Rust Patch (B): Patch the kernel Makefile (like the Trial 2)
and patch `rustc` to use `post_link_args` instead of `pre_link_args` for
target-specific values, ensuring the executable stays at the end of the
command.
3. Shell Wrappers: Implement shell wrappers for CC, CXX, etc. This would
allow `rustc` to call a single wrapper script, hiding `ccache` from it.
4. Kernel only: Patch the kernel Makefile to filter out `ccache` from CC
(works in practice but not generic for a possible other wrapper in the
future).
5. Leave as-is: disable `ccache` when rust is enabled .

Risks and Considerations
- Upstreamability: Patching rust and the kernel at the same time could take
time.
- Maintainability: While the shell wrapper approach is more flexible and
solves the issue for other tools with similar limitations, it might make
debugging in Yocto more difficult and requires significant changes.

I'm leaning towards the 1st or the 3rd approach, but I'd appreciate the
maintainers' thoughts on which path fits the OE architecture best.

[1] https://github.com/ccache/ccache/issues/364
[2] https://github.com/mozilla/sccache
[3]
https://git.yoctoproject.org/linux-yocto/tree/scripts/Makefile.host?h=v6.18.1#n94
[4]
https://github.com/rust-lang/rust/blob/4931e09e3ac3182d2a00f38cccfdf68e8e385e1c/compiler/rustc_codegen_ssa/src/back/link.rs#L1419
[5]
https://github.com/rust-lang/rust/blob/4931e09e3ac3182d2a00f38cccfdf68e8e385e1c/compiler/rustc_codegen_ssa/src/back/link.rs#L1870

Best regards,

Alban Moizan

--0000000000006ac4b206485a53f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<br><br>I&#39;ve been investigating the issue =
when enabling `ccache` for kernel builds that involve Rust.<br><br>First of=
 all, as documented in the `ccache` issue tracker [1], `ccache` is not dire=
ctly compatible with Rust.<br>Therefore the current goal is to keep `ccache=
` enabled for the C portions of the kernel while bypassing it for Rust.<br>=
While an alternative like `sccache` [2], compatible with both C and Rust ex=
ists, you will see below that the underlying issue is the same, so just rep=
lacing `ccache` by `sccache` will change nothing here.<br><br>The issue (co=
mmit 235e6d49e5888ad04416219e10b6df91a738661a + this patch):<br><br>When `c=
cache` is enabled, `${CC}` to `${CCACHE}{CC}`, ex: `gcc` to `ccache gcc`<br=
><br>Then, when compiling the kernel, `scripts/Makefile.host` will give it =
to `rustc` with `-Clinker=3D$(HOSTCC)` [3], but the shell expands `$(HOSTCC=
)` to two words, therefore `rustc` takes `gcc` as another parameters, and i=
t errors out. <br><br>I attempted to resolve it by modifying the incriminat=
ed Makefile in the following ways:<br><br>Trial 1: Quoting HOSTCC in Kernel=
 Makefile<br>Modify `scripts/Makefile.host` to wrap `HOSTCC` in quotes to e=
nsure it is passed as a single string parameter:<br>Replace `-Clinker=3D$(H=
OSTCC)` to `-Clinker=3D&#39;$(HOSTCC)&#39;`<br>Result: Failure, `rustc` loo=
ks for a binary path literally named `ccache gcc`, which does not exist, in=
deed, `-Clinker` argument value is treated by `rustc` as a real path, and n=
ot a command [4].<br><br>Trial 2: Splitting HOSTCC into Linker and Pre-link=
 Args<br>Modified `scripts/Makefile.host` to force the linker to the first =
word of `HOSTCC` and pass subsequent words to `-Zpre-link-args`:<br>Replace=
 `-Clinker=3D$(HOSTCC)` by `-Clinker=3D$(firstword $(HOSTCC)) -Zpre-link-ar=
gs=3D&#39;$(wordlist 2,$(words $(HOSTCC)),$(HOSTCC))&#39;`<br>Result: Failu=
re, `rustc` executes the command as: &quot;ccache&quot; &quot;-m64&quot; &q=
uot;gcc&quot; ....<br>This is invalid because in `rustc`, the target-specif=
ic pre-link arguments (from `compiler/rustc_target/src/spec/targets/<a href=
=3D"http://x86_64_unknown_linux_gnu.rs">x86_64_unknown_linux_gnu.rs</a>`) a=
re added before our custom args, placing `-m64` before the `gcc` executable=
 [5] .<br><br>Proposed Solutions<br>1. Kernel + Rust Patch (A): Patch the k=
ernel Makefile (like the Trial 1) and patch `rustc` to accept a command str=
ing (with arguments) for `-Clinker` instead of a strict Path.<br>2. Kernel =
+ Rust Patch (B): Patch the kernel Makefile (like the Trial 2) and patch `r=
ustc` to use `post_link_args` instead of `pre_link_args` for target-specifi=
c values, ensuring the executable stays at the end of the command.<br>3. Sh=
ell Wrappers: Implement shell wrappers for CC, CXX, etc. This would allow `=
rustc` to call a single wrapper script, hiding `ccache` from it.<br>4. Kern=
el only: Patch the kernel Makefile to filter out `ccache` from CC (works in=
 practice but not generic for a possible other wrapper in the future).<br>5=
. Leave as-is: disable `ccache` when rust is enabled .<br><br>Risks and Con=
siderations<br>- Upstreamability: Patching rust and the kernel at the same =
time could take time. <br>- Maintainability: While the shell wrapper approa=
ch is more flexible and solves the issue for other tools with similar limit=
ations, it might make debugging in Yocto more difficult and requires signif=
icant changes.<br><br>I&#39;m leaning towards the 1st or the 3rd approach, =
but I&#39;d appreciate the maintainers&#39; thoughts on which path fits the=
 OE architecture best.<br><br>[1] <a href=3D"https://github.com/ccache/ccac=
he/issues/364">https://github.com/ccache/ccache/issues/364</a><br>[2] <a hr=
ef=3D"https://github.com/mozilla/sccache">https://github.com/mozilla/sccach=
e</a><br>[3] <a href=3D"https://git.yoctoproject.org/linux-yocto/tree/scrip=
ts/Makefile.host?h=3Dv6.18.1#n94">https://git.yoctoproject.org/linux-yocto/=
tree/scripts/Makefile.host?h=3Dv6.18.1#n94</a><br>[4] <a href=3D"https://gi=
thub.com/rust-lang/rust/blob/4931e09e3ac3182d2a00f38cccfdf68e8e385e1c/compi=
ler/rustc_codegen_ssa/src/back/link.rs#L1419">https://github.com/rust-lang/=
rust/blob/4931e09e3ac3182d2a00f38cccfdf68e8e385e1c/compiler/rustc_codegen_s=
sa/src/back/link.rs#L1419</a><br>[5] <a href=3D"https://github.com/rust-lan=
g/rust/blob/4931e09e3ac3182d2a00f38cccfdf68e8e385e1c/compiler/rustc_codegen=
_ssa/src/back/link.rs#L1870">https://github.com/rust-lang/rust/blob/4931e09=
e3ac3182d2a00f38cccfdf68e8e385e1c/compiler/rustc_codegen_ssa/src/back/link.=
rs#L1870</a><br><br>Best regards,<br><br>Alban Moizan<br><br><br></div>

--0000000000006ac4b206485a53f1--

