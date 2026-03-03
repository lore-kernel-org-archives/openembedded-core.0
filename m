Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A90EC1427
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:37:37 +0000 (UTC)
Subject: Re: [PATCH v2] llvm: enable LLVMgold.so build by adding binutils dependency
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 03 Mar 2026 02:37:30 -0800
References: <20260115042452.39219-1-mark.yang@lge.com> <437B0EEA-925C-40BD-BA9B-7773BBEEE9F1@arm.com> <211003.1768861437348499871@lists.openembedded.org>
In-Reply-To: <211003.1768861437348499871@lists.openembedded.org>
Message-ID: <945.1772534250515774722@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="hhkYznL5gp4VnNFd0Ay8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232303

--hhkYznL5gp4VnNFd0Ay8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 03:53 AM, mark.yang wrote:

>=20
> The build reproduction steps and the intention for this patch can be foun=
d
> in the v1 patch at https://lists.openembedded.org/g/openembedded-core/top=
ic/117252728
> .
>=20
> PACKAGECONFIG:remove:class-native =3D "lto thin-lto"
> Due to the configuration, llvm-native cannot enable lto in PACKAGECONFIG
> in any way.
>=20
>=20
> When attempting to use clang + lto, components that cannot use the lld
> linker (and instead use the bfd linker) require the LLVMgold.so plugin.
> To achieve this, binutils and the -DLLVM_BINUTILS_INCDIR flag in CMake ar=
e
> required.
> ( https://github.com/llvm/llvm-project/blob/main/clang/docs/ThinLTO.rst#b=
asic
> )
>=20
> Anyway, llvm-native cannot have LTO enabled due to the `remove`.
> -DLLVM_ENABLE_LTO=3DFull determines whether LLVM itself will be built wit=
h
> LTO applied.
>=20
> However, even if LLVM is not built using LTO, I think the environment
> should still be configured so that other components using the LLVM/clang
> toolchain can use LTO.
>=20

Hi Mark,

Thanks for the explanation. However, LTO builds are not part of the default=
 workflow,
and adding binutils to DEPENDS would increase build time for all LLVM build=
s. I guess
passing -DLLVM_BINUTILS_INCDIR via a new PACKAGECONFIG is a better option w=
ithout
impacting default builds.

Regards,
Deepesh

>=20
>=20
>

--hhkYznL5gp4VnNFd0Ay8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Jan 20, 2026 at 03:53 AM, mark.yang wrote:</div>
<div>
<blockquote>
<div>
<div>The build reproduction steps and the intention for this patch can be f=
ound in the v1 patch at <a href=3D"https://lists.openembedded.org/g/openemb=
edded-core/topic/117252728" target=3D"_blank" rel=3D"nofollow noopener">htt=
ps://lists.openembedded.org/g/openembedded-core/topic/117252728</a>.</div>
</div>
<div><br />
<pre>PACKAGECONFIG:remove:class-native =3D "lto thin-lto"</pre>
<div>Due to the configuration, llvm-native cannot enable lto in PACKAGECONF=
IG in any way.<br /><br /></div>
<div>When attempting to use clang + lto, components that cannot use the lld=
 linker (and instead use the bfd linker) require the LLVMgold.so plugin.<br=
 />To achieve this, binutils and the -DLLVM_BINUTILS_INCDIR flag in CMake a=
re required.<br />(<a href=3D"https://github.com/llvm/llvm-project/blob/mai=
n/clang/docs/ThinLTO.rst#basic" target=3D"_blank" rel=3D"nofollow noopener"=
>https://github.com/llvm/llvm-project/blob/main/clang/docs/ThinLTO.rst#basi=
c</a>)<br /><br />
<div>Anyway, llvm-native cannot have LTO enabled due to the `remove`.</div>
<div>-DLLVM_ENABLE_LTO=3DFull determines whether LLVM itself will be built =
with LTO applied.</div>
<div>&nbsp;</div>
<div>However, even if LLVM is not built using LTO, I think the environment =
should still be configured so that other components using the LLVM/clang to=
olchain can use LTO.</div>
</div>
</div>
</blockquote>
Hi Mark,<br /><br />
<div>Thanks for the explanation. However, LTO builds are not part of the de=
fault workflow,<br />and adding binutils to DEPENDS would increase build ti=
me for all LLVM builds. I guess<br />passing -DLLVM_BINUTILS_INCDIR via a n=
ew PACKAGECONFIG is a better option without<br />impacting default builds.<=
/div>
<br />Regards,<br />Deepesh<br />
<blockquote>
<div>
<div>
<div>&nbsp;</div>
</div>
</div>
</blockquote>
</div>

--hhkYznL5gp4VnNFd0Ay8--

