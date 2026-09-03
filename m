Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E49C624DA
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 18:40:27 +0000 (UTC)
Subject: Re: [PATCH v3] rust: Avoid passing host-specific information to crates Strict Version Hash
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.217.239)
X-Originating-Platform: Windows Chrome 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 03 Sep 2026 11:40:22 -0700
References: <20260826155417.2774608-1-alhe@linux.microsoft.com> <2326647.1787768749336187635@lists.openembedded.org> <fac01045131c56332854097dc98f0744a0e5ee5a.camel@linuxfoundation.org> <69b11fc6-cffc-4b91-8853-c9ab277577c8@linux.microsoft.com> <18CF75EE37DB8543.642712@lists.openembedded.org> <e6874bb2ac2d116380c62b2295da246b79136093.camel@linuxfoundation.org> <d6fbb4c3-6178-4f8e-9421-d3134793acb1@linux.microsoft.com> <78bca4cc9c3e7fd3014f22e1d1b9529480089a2a.camel@linuxfoundation.org>
In-Reply-To: <78bca4cc9c3e7fd3014f22e1d1b9529480089a2a.camel@linuxfoundation.org>
Message-ID: <3299883.1788460822003555425@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="fpmNHJOxuOuTTdMpgOgH"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 18:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245039

--fpmNHJOxuOuTTdMpgOgH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I'm still working through the remaining Rust packages and will follow up on=
 that separately.

While going through the reproducible-cross diffoscope output, though, I not=
iced something unrelated to Rust
that I think may explain the git/git-dbg entries, so sharing it here in cas=
e it's useful or helps narrow things down.

In the 2026-07-29 report from builder 120 [1], git's .rodata has:

-0x001b1780 6769742d 00000000 61617263 68363400 =C2=A0git-....aarch64.
+0x001b1780 6769742d 00000000 7838365f 36340000 =C2=A0git-....x86_64..

i.e. the build host's arch string, sitting right next to git's "cpu: %s" fo=
rmat string.

git's Makefile does:

ifeq (,$(HOST_CPU))
BASIC_CFLAGS +=3D -DGIT_HOST_CPU=3D"\"$(firstword $(subst -, ,$(uname_M)))\=
""
else
BASIC_CFLAGS +=3D -DGIT_HOST_CPU=3D"\"$(HOST_CPU)\""
endif

uname_M comes from `uname -m` on the build machine, and GIT_HOST_CPU
ends up in the "cpu:" line of `git version --build-options`.

Upstream even documents HOST_CPU as the thing to set when cross compiling,
but our recipe never sets it, so we always take the uname fallback.

Since "aarch64" and "x86_64" have different lengths, everything after that =
string shifts,
which is why the git diffs look much bigger than they really are (.text, .s=
ymtab and so on) -
the instructions themselves don't change. git/git-dbg show up in every run =
I've looked
at (119/120/121, before and after the SVH fix, on both x86 and arm hosts),
so it fits a build host leak rather than anything rust related.

The fix should just be:

EXTRA_OEMAKE +=3D "HOST_CPU=3D${TARGET_ARCH}"

in git_2.55.0.bb. As far as I can tell TARGET_ARCH does the right
thing for native (=3D BUILD_ARCH) and nativesdk (=3D SDK_ARCH) as well, so
no class overrides needed.

I'm cross checking with a locally to make sure the resulting binary really =
says "aarch64", and will send the patch once
that's confirmed.

[1] https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260729-j6j_x=
puw/packages/diff-html/

Thanks,
Sunil

--fpmNHJOxuOuTTdMpgOgH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I'm still working through the remaining Rust packages and will follow =
up on that separately.<br /><br />While going through the reproducible-cros=
s diffoscope output, though, I noticed something unrelated to Rust <br />th=
at I think may explain the git/git-dbg entries, so sharing it here in case =
it's useful or helps narrow things down.<br /><br />In the 2026-07-29 repor=
t from builder 120 [1], git's .rodata has:<br /><br />&nbsp; &nbsp; -0x001b=
1780 6769742d 00000000 61617263 68363400 &nbsp;git-....aarch64.<br />&nbsp;=
 &nbsp; +0x001b1780 6769742d 00000000 7838365f 36340000 &nbsp;git-....x86_6=
4..<br /><br />i.e. the build host's arch string, sitting right next to git=
's "cpu: %s" format string. <br /><br />git's Makefile does:<br /><br />&nb=
sp; &nbsp; ifeq (,$(HOST_CPU))<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; BASIC_CFLAGS +=3D -DGIT_HOST_CPU=3D"\"$(firstword $(subst -, ,$(uname_M)=
))\""<br />&nbsp; &nbsp; else<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; BASIC_CFLAGS +=3D -DGIT_HOST_CPU=3D"\"$(HOST_CPU)\""<br />&nbsp; &nbsp; e=
ndif<br /><br />uname_M comes from `uname -m` on the build machine, and GIT=
_HOST_CPU <br />ends up in the "cpu:" line of `git version --build-options`=
. <br /><br />Upstream even documents HOST_CPU as the thing to set when cro=
ss compiling, <br />but our recipe never sets it, so we always take the una=
me fallback.<br /><br />Since "aarch64" and "x86_64" have different lengths=
, everything after that string shifts, <br />which is why the git diffs loo=
k much bigger than they really are (.text, .symtab and so on) - <br />the i=
nstructions themselves don't change. git/git-dbg show up in every run I've =
looked<br />at (119/120/121, before and after the SVH fix, on both x86 and =
arm hosts), <br />so it fits a build host leak rather than anything rust re=
lated.<br /><br />The fix should just be:<br /><br />&nbsp; &nbsp; EXTRA_OE=
MAKE +=3D "HOST_CPU=3D${TARGET_ARCH}"<br /><br />in git_2.55.0.bb. As far a=
s I can tell TARGET_ARCH does the right<br />thing for native (=3D BUILD_AR=
CH) and nativesdk (=3D SDK_ARCH) as well, so<br />no class overrides needed=
.<br /><br />I'm cross checking with a locally to make sure the resulting b=
inary really says "aarch64", and will send the patch once<br />that's confi=
rmed.<br /><br />[1] https://valkyrie.yocto.io/pub/repro-fail/oe-reproducib=
le-20260729-j6j_xpuw/packages/diff-html/<br /><br />Thanks,<br />Sunil<br /=
><br /></div>

--fpmNHJOxuOuTTdMpgOgH--

