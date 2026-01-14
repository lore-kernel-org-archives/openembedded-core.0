Return-Path: <alban.moizan@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0884D37E51
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:41:35 +0000 (UTC)
Subject: Re: [PATCH v2 08/15] kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
To: openembedded-core@lists.openembedded.org
From: alban.moizan@smile.fr
X-Originating-Location: FR (176.157.204.145)
X-Originating-Platform: Linux Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 14 Jan 2026 07:41:30 -0800
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com> <20251230141540.1974380-9-Harish.Sadineni@windriver.com>
In-Reply-To: <20251230141540.1974380-9-Harish.Sadineni@windriver.com>
Message-ID: <659490.1768405290403118898@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="9QpbM5odQGoHi9lS3qG3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 15:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229337

--9QpbM5odQGoHi9lS3qG3
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

Excuse me for the double mail, I was not yet subscribing to the mailing lis=
t, so my mail was hidden.

--------------------------

Hi everyone,

I've been investigating the issue when enabling `ccache` for kernel builds =
that involve Rust.

First of all, as documented in the `ccache` issue tracker [1], `ccache` is =
not directly compatible with Rust.
Therefore the current goal is to keep `ccache` enabled for the C portions o=
f the kernel while bypassing it for Rust.
While an alternative like `sccache` [2], compatible with both C and Rust ex=
ists, you will see below that the underlying issue is the same, so just rep=
lacing `ccache` by `sccache` will change nothing here.

The issue (commit 235e6d49e5888ad04416219e10b6df91a738661a + this patch):

When `ccache` is enabled, `${CC}` to `${CCACHE}{CC}`, ex: `gcc` to `ccache =
gcc`

Then, when compiling the kernel, `scripts/Makefile.host` will give it to `r=
ustc` with `-Clinker=3D$(HOSTCC)` [3], but the shell expands `$(HOSTCC)` to=
 two words, therefore `rustc` takes `gcc` as another parameters, and it err=
ors out.=20

I attempted to resolve it by modifying the incriminated Makefile in the fol=
lowing ways:

Trial 1: Quoting HOSTCC in Kernel Makefile
Modify `scripts/Makefile.host` to wrap `HOSTCC` in quotes to ensure it is p=
assed as a single string parameter:
Replace `-Clinker=3D$(HOSTCC)` to `-Clinker=3D'$(HOSTCC)'`
Result: Failure, `rustc` looks for a binary path literally named `ccache gc=
c`, which does not exist, indeed, `-Clinker` argument value is treated by `=
rustc` as a real path, and not a command [4].

Trial 2: Splitting HOSTCC into Linker and Pre-link Args
Modified `scripts/Makefile.host` to force the linker to the first word of `=
HOSTCC` and pass subsequent words to `-Zpre-link-args`:
Replace `-Clinker=3D$(HOSTCC)` by `-Clinker=3D$(firstword $(HOSTCC)) -Zpre-=
link-args=3D'$(wordlist 2,$(words $(HOSTCC)),$(HOSTCC))'`
Result: Failure, `rustc` executes the command as: "ccache" "-m64" "gcc" ...=
.
This is invalid because in `rustc`, the target-specific pre-link arguments =
(from `compiler/rustc_target/src/spec/targets/x86_64_unknown_linux_gnu.rs`)=
 are added before our custom args, placing `-m64` before the `gcc` executab=
le [5] .

Proposed Solutions
1. Kernel + Rust Patch (A): Patch the kernel Makefile (like the Trial 1) an=
d patch `rustc` to accept a command string (with arguments) for `-Clinker` =
instead of a strict Path.
2. Kernel + Rust Patch (B): Patch the kernel Makefile (like the Trial 2) an=
d patch `rustc` to use `post_link_args` instead of `pre_link_args` for targ=
et-specific values, ensuring the executable stays at the end of the command=
.
3. Shell Wrappers: Implement shell wrappers for CC, CXX, etc. This would al=
low `rustc` to call a single wrapper script, hiding `ccache` from it.
4. Kernel only: Patch the kernel Makefile to filter out `ccache` from CC (w=
orks in practice but not generic for a possible other wrapper in the future=
).
5. Leave as-is: disable `ccache` when rust is enabled .

Risks and Considerations
- Upstreamability: Patching rust and the kernel at the same time could take=
 time.=20
- Maintainability: While the shell wrapper approach is more flexible and so=
lves the issue for other tools with similar limitations, it might make debu=
gging in Yocto more difficult and requires significant changes.

I'm leaning towards the 1st or the 3rd approach, but I'd appreciate the mai=
ntainers' thoughts on which path fits the OE architecture best.

[1] https://github.com/ccache/ccache/issues/364

[2] https://github.com/mozilla/sccache

[3] https://git.yoctoproject.org/linux-yocto/tree/scripts/Makefile.host?h=
=3Dv6.18.1#n94

[4] https://github.com/rust-lang/rust/blob/4931e09e3ac3182d2a00f38cccfdf68e=
8e385e1c/compiler/rustc_codegen_ssa/src/back/link.rs#L1419

[5] https://github.com/rust-lang/rust/blob/4931e09e3ac3182d2a00f38cccfdf68e=
8e385e1c/compiler/rustc_codegen_ssa/src/back/link.rs#L1870

Best regards,

Alban Moizan


--9QpbM5odQGoHi9lS3qG3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Excuse me for the double mail, I was not yet subscribing to the mailing =
list, so my mail was hidden.</p>

<hr>

<p>Hi everyone,</p>

<p>I've been investigating the issue when enabling <code>ccache</code> for =
kernel builds that involve Rust.</p>

<p>First of all, as documented in the <code>ccache</code> issue tracker [1]=
, <code>ccache</code> is not directly compatible with Rust.
Therefore the current goal is to keep <code>ccache</code> enabled for the C=
 portions of the kernel while bypassing it for Rust.
While an alternative like <code>sccache</code> [2], compatible with both C =
and Rust exists, you will see below that the underlying issue is the same, =
so just replacing <code>ccache</code> by <code>sccache</code> will change n=
othing here.</p>

<p>The issue (commit 235e6d49e5888ad04416219e10b6df91a738661a + this patch)=
:</p>

<p>When <code>ccache</code> is enabled, <code>${CC}</code> to <code>${CCACH=
E}{CC}</code>, ex: <code>gcc</code> to <code>ccache gcc</code></p>

<p>Then, when compiling the kernel, <code>scripts/Makefile.host</code> will=
 give it to <code>rustc</code> with <code>-Clinker=3D$(HOSTCC)</code> [3], =
but the shell expands <code>$(HOSTCC)</code> to two words, therefore <code>=
rustc</code> takes <code>gcc</code> as another parameters, and it errors ou=
t.</p>

<p>I attempted to resolve it by modifying the incriminated Makefile in the =
following ways:</p>

<p>Trial 1: Quoting HOSTCC in Kernel Makefile
Modify <code>scripts/Makefile.host</code> to wrap <code>HOSTCC</code> in qu=
otes to ensure it is passed as a single string parameter:
Replace <code>-Clinker=3D$(HOSTCC)</code> to <code>-Clinker=3D'$(HOSTCC)'</=
code>
Result: Failure, <code>rustc</code> looks for a binary path literally named=
 <code>ccache gcc</code>, which does not exist, indeed, <code>-Clinker</cod=
e> argument value is treated by <code>rustc</code> as a real path, and not =
a command [4].</p>

<p>Trial 2: Splitting HOSTCC into Linker and Pre-link Args
Modified <code>scripts/Makefile.host</code> to force the linker to the firs=
t word of <code>HOSTCC</code> and pass subsequent words to <code>-Zpre-link=
-args</code>:
Replace <code>-Clinker=3D$(HOSTCC)</code> by <code>-Clinker=3D$(firstword $=
(HOSTCC)) -Zpre-link-args=3D'$(wordlist 2,$(words $(HOSTCC)),$(HOSTCC))'</c=
ode>
Result: Failure, <code>rustc</code> executes the command as: &quot;ccache&q=
uot; &quot;-m64&quot; &quot;gcc&quot; ....
This is invalid because in <code>rustc</code>, the target-specific pre-link=
 arguments (from <code>compiler/rustc_target/src/spec/targets/x86_64_unknow=
n_linux_gnu.rs</code>) are added before our custom args, placing <code>-m64=
</code> before the <code>gcc</code> executable [5] .</p>

<p>Proposed Solutions
1. Kernel + Rust Patch (A): Patch the kernel Makefile (like the Trial 1) an=
d patch <code>rustc</code> to accept a command string (with arguments) for =
<code>-Clinker</code> instead of a strict Path.
2. Kernel + Rust Patch (B): Patch the kernel Makefile (like the Trial 2) an=
d patch <code>rustc</code> to use <code>post_link_args</code> instead of <c=
ode>pre_link_args</code> for target-specific values, ensuring the executabl=
e stays at the end of the command.
3. Shell Wrappers: Implement shell wrappers for CC, CXX, etc. This would al=
low <code>rustc</code> to call a single wrapper script, hiding <code>ccache=
</code> from it.
4. Kernel only: Patch the kernel Makefile to filter out <code>ccache</code>=
 from CC (works in practice but not generic for a possible other wrapper in=
 the future).
5. Leave as-is: disable <code>ccache</code> when rust is enabled .</p>

<p>Risks and Considerations
- Upstreamability: Patching rust and the kernel at the same time could take=
 time.
- Maintainability: While the shell wrapper approach is more flexible and so=
lves the issue for other tools with similar limitations, it might make debu=
gging in Yocto more difficult and requires significant changes.</p>

<p>I'm leaning towards the 1st or the 3rd approach, but I'd appreciate the =
maintainers' thoughts on which path fits the OE architecture best.</p>

<p>[1] <a href=3D"https://github.com/ccache/ccache/issues/364" target=3D"_b=
lank">https://github.com/ccache/ccache/issues/364</a></p>

<p>[2] <a href=3D"https://github.com/mozilla/sccache" target=3D"_blank">htt=
ps://github.com/mozilla/sccache</a></p>

<p>[3] <a href=3D"https://git.yoctoproject.org/linux-yocto/tree/scripts/Mak=
efile.host?h=3Dv6.18.1#n94" target=3D"_blank">https://git.yoctoproject.org/=
linux-yocto/tree/scripts/Makefile.host?h=3Dv6.18.1#n94</a></p>

<p>[4] <a href=3D"https://github.com/rust-lang/rust/blob/4931e09e3ac3182d2a=
00f38cccfdf68e8e385e1c/compiler/rustc_codegen_ssa/src/back/link.rs#L1419" t=
arget=3D"_blank">https://github.com/rust-lang/rust/blob/4931e09e3ac3182d2a0=
0f38cccfdf68e8e385e1c/compiler/rustc_codegen_ssa/src/back/link.rs#L1419</a>=
</p>

<p>[5] <a href=3D"https://github.com/rust-lang/rust/blob/4931e09e3ac3182d2a=
00f38cccfdf68e8e385e1c/compiler/rustc_codegen_ssa/src/back/link.rs#L1870" t=
arget=3D"_blank">https://github.com/rust-lang/rust/blob/4931e09e3ac3182d2a0=
0f38cccfdf68e8e385e1c/compiler/rustc_codegen_ssa/src/back/link.rs#L1870</a>=
</p>

<p>Best regards,</p>

<p>Alban Moizan</p>

--9QpbM5odQGoHi9lS3qG3--

