Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F707C38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 12:22:19 +0000 (UTC)
Subject: Re: rust: conflicts between Yocto and CC-RS compiler parameters
To: openembedded-core@lists.openembedded.org
From: "Anton Antonov" <anton.antonov@arm.com>
X-Originating-Location: Cambridge, England, GB (217.140.106.13)
X-Originating-Platform: Mac Firefox 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 25 Oct 2022 05:22:11 -0700
References: <f2681c2921cabc8fb5daca99d599096a566249a6.camel@linuxfoundation.org>
In-Reply-To: <f2681c2921cabc8fb5daca99d599096a566249a6.camel@linuxfoundation.org>
Message-ID: <31059.1666700531342911157@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="crouUavRmhqNNUNrtqMI"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 12:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172129

--crouUavRmhqNNUNrtqMI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2022 at 03:56 AM, Richard Purdie wrote:

>=20
> I'm a bit worried that we're seeing conflicting flags, it makes me
> wonder whether we have the right ones in our tune, or, are we mapping
> between RUST_HOST_SYS and HOST_SYS correctly.
>=20
> I'm guessing this is from "-mfpu=3Dvfpv3-d16" and that we choose a
> different fpu option?
>=20
> If the difference really is something that rust simply made a different
> choice on, we should set CRATE_CC_NO_DEFAULTS. rust-native is a bit
> messy and whilst I would prefer we found out why the flags don't work,
> I think setting the value for target and probably nativesdk might at
> least be an improvement:
>=20
> CRATE_CC_NO_DEFAULTS:class-target =3D "X"
> CRATE_CC_NO_DEFAULTS:class-nativesdk =3D "X"
>=20
> or we could just clear it for native:
>=20
> CRATE_CC_NO_DEFAULTS:class-native =3D ""

with CRATE_CC_NO_DEFAULTS defined rustc_driver can't be built for rust-nati=
ve with an error:

error: linking with `/data/shared/yocto/poky/build/tmp/work/x86_64-linux/ru=
st-native/1.63.0-r0/wrapper/build-rust-ccld` failed: exit status: 1
=3D note: /data/shared/yocto/poky/build/tmp/hosttools/ld: /data/shared/yoct=
o/poky/build/tmp/work/x86_64-linux/rust-native/1.63.0-r0/rustc-1.63.0-src/b=
uild/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu/release=
/deps/librustc_llvm-c2bba4d8034ef27f.rlib(RustWrapper.o): relocation R_X86_=
64_TPOFF32 against `_ZL9LastError' can not be used when making a shared obj=
ect; recompile with -fPIC
collect2: error: ld returned 1 exit status

with

CRATE_CC_NO_DEFAULTS:class-target =3D "true"
CRATE_CC_NO_DEFAULTS:class-nativesdk =3D "true"

in rust-target-config.bbclass I can successively build native and target re=
cipes.

I've raised an issue to follow this discussion:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14947

Cheers,

Anton

--crouUavRmhqNNUNrtqMI
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2022 at 03:56 AM, Richard Purdie wrote:<br />
<blockquote>I'm a bit worried that we're seeing conflicting flags, it makes=
 me<br />wonder whether we have the right ones in our tune, or, are we mapp=
ing<br />between RUST_HOST_SYS and HOST_SYS correctly.<br /><br />I'm guess=
ing this is from "-mfpu=3Dvfpv3-d16" and that we choose a<br />different fp=
u option?<br /><br />If the difference really is something that rust simply=
 made a different<br />choice on, we should set CRATE_CC_NO_DEFAULTS. rust-=
native is a bit<br />messy and whilst I would prefer we found out why the f=
lags don't work,<br />I think setting the value for target and probably nat=
ivesdk might at<br />least be an improvement:<br /><br />CRATE_CC_NO_DEFAUL=
TS:class-target =3D "X"<br />CRATE_CC_NO_DEFAULTS:class-nativesdk =3D "X"<b=
r /><br />or we could just clear it for native:<br /><br />CRATE_CC_NO_DEFA=
ULTS:class-native =3D ""</blockquote>
<p>with CRATE_CC_NO_DEFAULTS defined rustc_driver can't be built for rust-n=
ative with an error:</p>
<p>error: linking with `/data/shared/yocto/poky/build/tmp/work/x86_64-linux=
/rust-native/1.63.0-r0/wrapper/build-rust-ccld` failed: exit status: 1<br /=
>&nbsp; =3D note: /data/shared/yocto/poky/build/tmp/hosttools/ld: /data/sha=
red/yocto/poky/build/tmp/work/x86_64-linux/rust-native/1.63.0-r0/rustc-1.63=
.0-src/build/x86_64-unknown-linux-gnu/stage0-rustc/x86_64-unknown-linux-gnu=
/release/deps/librustc_llvm-c2bba4d8034ef27f.rlib(RustWrapper.o): relocatio=
n R_X86_64_TPOFF32 against `_ZL9LastError' can not be used when making a sh=
ared object; recompile with -fPIC<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; collect2: error: ld returned 1 exit status</p>
<p>with</p>
<p>CRATE_CC_NO_DEFAULTS:class-target =3D "true"<br />CRATE_CC_NO_DEFAULTS:c=
lass-nativesdk =3D "true"</p>
<p>in rust-target-config.bbclass I can successively build native and target=
 recipes.</p>
<p>I've raised an issue to follow this discussion:</p>
<p>https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14947</p>
<p>&nbsp;</p>
<p>Cheers,</p>
<p>Anton</p>

--crouUavRmhqNNUNrtqMI--

