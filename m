Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A04ED2ECF5
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 22:24:04 +0000 (UTC)
Subject: Re: [PATCH v2] llvm: enable LLVMgold.so build by adding binutils dependency
To: openembedded-core@lists.openembedded.org
From: "mark.yang" <mark.yang@lge.com>
X-Originating-Location: Nowon-gu, Seoul, KR (27.122.242.71)
X-Originating-Platform: Windows Firefox 147
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 19 Jan 2026 14:23:57 -0800
References: <20260115042452.39219-1-mark.yang@lge.com> <437B0EEA-925C-40BD-BA9B-7773BBEEE9F1@arm.com>
In-Reply-To: <437B0EEA-925C-40BD-BA9B-7773BBEEE9F1@arm.com>
Message-ID: <211003.1768861437348499871@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="tpcKxgiGhT6WKHXyJRcQ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 22:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229637

--tpcKxgiGhT6WKHXyJRcQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Ross Burton, thank you for the review.

The build reproduction steps and the intention for this patch can be found =
in the v1 patch at https://lists.openembedded.org/g/openembedded-core/topic=
/117252728.

PACKAGECONFIG:remove:class-native =3D "lto thin-lto"
Due to the configuration, llvm-native cannot enable lto in PACKAGECONFIG in=
 any way.

When attempting to use clang + lto, components that cannot use the lld link=
er (and instead use the bfd linker) require the LLVMgold.so plugin.
To achieve this, binutils and the -DLLVM_BINUTILS_INCDIR flag in CMake are =
required.
( https://github.com/llvm/llvm-project/blob/main/clang/docs/ThinLTO.rst#bas=
ic )

Anyway, llvm-native cannot have LTO enabled due to the `remove`.
-DLLVM_ENABLE_LTO=3DFull determines whether LLVM itself will be built with =
LTO applied.

However, even if LLVM is not built using LTO, I think the environment shoul=
d still be configured so that other components using the LLVM/clang toolcha=
in can use LTO.

--tpcKxgiGhT6WKHXyJRcQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Ross Burton, thank you for the review.</div>
<div><br />The build reproduction steps and the intention for this patch ca=
n be found in the v1 patch at <a href=3D"https://lists.openembedded.org/g/o=
penembedded-core/topic/117252728" target=3D"_blank" rel=3D"noopener">https:=
//lists.openembedded.org/g/openembedded-core/topic/117252728</a>.</div>
</div>
<div><br />
<pre>PACKAGECONFIG:remove:class-native =3D "lto thin-lto"</pre>
<div>Due to the configuration, llvm-native cannot enable lto in PACKAGECONF=
IG in any way.<br /><br /></div>
<div>When attempting to use clang + lto, components that cannot use the lld=
 linker (and instead use the bfd linker) require the LLVMgold.so plugin.<br=
 />To achieve this, binutils and the -DLLVM_BINUTILS_INCDIR flag in CMake a=
re required.<br />(<a href=3D"https://github.com/llvm/llvm-project/blob/mai=
n/clang/docs/ThinLTO.rst#basic" target=3D"_blank" rel=3D"noopener">https://=
github.com/llvm/llvm-project/blob/main/clang/docs/ThinLTO.rst#basic</a>)<br=
 /><br />
<div>Anyway, llvm-native cannot have LTO enabled due to the `remove`.</div>
<div>-DLLVM_ENABLE_LTO=3DFull determines whether LLVM itself will be built =
with LTO applied.</div>
<div>&nbsp;</div>
<div>However, even if LLVM is not built using LTO, I think the environment =
should still be configured so that other components using the LLVM/clang to=
olchain can use LTO.</div>
<br /><br /><br /></div>
</div>

--tpcKxgiGhT6WKHXyJRcQ--

