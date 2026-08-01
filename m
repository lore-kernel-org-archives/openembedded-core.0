Return-Path: <WXbet@proton.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730A0C55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 16:16:11 +0000 (UTC)
Subject: [OE-core][PATCH] rust-target-config: set MIPS ABI in the target JSON
To: openembedded-core@lists.openembedded.org
From: "WXbet" <WXbet@proton.me>
X-Originating-Location: Lengede, Lower Saxony, DE (94.31.119.30)
X-Originating-Platform: Windows Edge 150
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 09:16:06 -0700
Message-ID: <qwUi.1785600966281995503.fgzL@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Br7Cw4UZgHW6mglxLSPM"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 16:16:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242496

--Br7Cw4UZgHW6mglxLSPM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

rustc 1.96 (rust-lang/rust#153769) started rejecting MIPS target JSON
files that do not carry both an "abi" field and a matching "llvm-
abiname" field, aborting libstd-rs's do_compile with

error: error loading target specification:
invalid MIPS ABI name and `cfg(target_abi)` combination:
ABI name: <empty>
cfg(target_abi): <empty>

rust_gen_target() populates the target JSON from the DATA_LAYOUT /
TARGET_ENDIAN / ... varflags plus an arch-specific "abi" branch that
today only covers arm/armv7. On mips*/mipsel* neither "abi" nor
"llvm-abiname" is written, so rustc's stricter check fails.

Cover every MIPS tune shipped in meta/conf/machine/include/mips/
arch-mips.inc's AVAILTUNES:

arch=3Dmips / mipsel =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0-> o32
arch=3Dmips64 / mips64el, ABIEXTENSION=3D"" -> n64
arch=3Dmips64 / mips64el, ABIEXTENSION=3Dn32 -> n32

Note that the mips64-o32 / mips64el-o32 tunes (o32 ABI on a 64-bit
MIPS CPU) get MIPSPKGSFX_BYTE=3D"" from arch-mips.inc and therefore
TUNE_ARCH=3D"mips[el]"; they fall into the 32-bit branch above.

Signed-off-by: WXbet <57314510+WXbet@users.noreply.github.com>
---
meta/classes-recipe/rust-target-config.bbclass | 7 +++++++
1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-=
recipe/rust-target-config.bbclass
index 6acbe5e688..54919091fe 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -438,6 +438,13 @@ def rust_gen_target(d, thing, wd, arch):
elif fpu =3D=3D "hard":
tspec['abi'] =3D "eabihf"
tspec['llvm-floatabi'] =3D "hard"
+ =C2=A0 =C2=A0if arch in ["mips", "mipsel"]:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tspec['abi'] =3D "o32"
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tspec['llvm-abiname'] =3D "o32"
+ =C2=A0 =C2=A0elif arch in ["mips64", "mips64el"]:
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0mips_abi =3D "n32" if abi =3D=3D "n32" else "n=
64"
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tspec['abi'] =3D mips_abi
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0tspec['llvm-abiname'] =3D mips_abi
tspec['default-uwtable'] =3D True
tspec['dynamic-linking'] =3D True
tspec['executables'] =3D True
--
2.47.1.windows.1

--Br7Cw4UZgHW6mglxLSPM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>rustc 1.96 (rust-lang/rust#153769) started rejecting MIPS target JSON<=
br />files that do not carry both an "abi" field and a matching "llvm-<br /=
>abiname" field, aborting libstd-rs's do_compile with<br /><br />&nbsp; err=
or: error loading target specification:<br />&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;invalid MIPS ABI name and `cfg(target_abi)` combination:<br />&nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;ABI name: &lt;empty&gt;<br />&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;cfg(target_abi): &lt;empty&gt;<br /><br />rust_gen_target() po=
pulates the target JSON from the DATA_LAYOUT /<br />TARGET_ENDIAN / ... var=
flags plus an arch-specific "abi" branch that<br />today only covers arm/ar=
mv7. On mips*/mipsel* neither "abi" nor<br />"llvm-abiname" is written, so =
rustc's stricter check fails.<br /><br />Cover every MIPS tune shipped in m=
eta/conf/machine/include/mips/<br />arch-mips.inc's AVAILTUNES:<br /><br />=
&nbsp; arch=3Dmips / mipsel &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;-&gt; o32<br />&nbsp; arch=3Dmips64 / mips64el=
, ABIEXTENSION=3D"" -&gt; n64<br />&nbsp; arch=3Dmips64 / mips64el, ABIEXTE=
NSION=3Dn32 -&gt; n32<br /><br />Note that the mips64-o32 / mips64el-o32 tu=
nes (o32 ABI on a 64-bit<br />MIPS CPU) get MIPSPKGSFX_BYTE=3D"" from arch-=
mips.inc and therefore<br />TUNE_ARCH=3D"mips[el]"; they fall into the 32-b=
it branch above.<br /><br />Signed-off-by: WXbet &lt;57314510+WXbet@users.n=
oreply.github.com&gt;<br />---<br />&nbsp;meta/classes-recipe/rust-target-c=
onfig.bbclass | 7 +++++++<br />&nbsp;1 file changed, 7 insertions(+)<br /><=
br />diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/cla=
sses-recipe/rust-target-config.bbclass<br />index 6acbe5e688..54919091fe 10=
0644<br />--- a/meta/classes-recipe/rust-target-config.bbclass<br />+++ b/m=
eta/classes-recipe/rust-target-config.bbclass<br />@@ -438,6 +438,13 @@ def=
 rust_gen_target(d, thing, wd, arch):<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;elif fpu =3D=3D "hard":<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;tspec['abi'] =3D "eabihf"<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;tspec['llvm-floatabi'] =3D "hard"<br />+ &nbsp; &nbsp;if arch in ["=
mips", "mipsel"]:<br />+ &nbsp; &nbsp; &nbsp; &nbsp;tspec['abi'] =3D "o32"<=
br />+ &nbsp; &nbsp; &nbsp; &nbsp;tspec['llvm-abiname'] =3D "o32"<br />+ &n=
bsp; &nbsp;elif arch in ["mips64", "mips64el"]:<br />+ &nbsp; &nbsp; &nbsp;=
 &nbsp;mips_abi =3D "n32" if abi =3D=3D "n32" else "n64"<br />+ &nbsp; &nbs=
p; &nbsp; &nbsp;tspec['abi'] =3D mips_abi<br />+ &nbsp; &nbsp; &nbsp; &nbsp=
;tspec['llvm-abiname'] =3D mips_abi<br />&nbsp; &nbsp; &nbsp;tspec['default=
-uwtable'] =3D True<br />&nbsp; &nbsp; &nbsp;tspec['dynamic-linking'] =3D T=
rue<br />&nbsp; &nbsp; &nbsp;tspec['executables'] =3D True<br />--&nbsp;<br=
 />2.47.1.windows.1</div>

--Br7Cw4UZgHW6mglxLSPM--

