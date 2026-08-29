Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A2FC61DD9
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 14:22:56 +0000 (UTC)
Subject: Re: clang/llvm 23.1.0 upgrade for oe-core
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.220.149)
X-Originating-Platform: Windows Chrome 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 29 Aug 2026 07:22:53 -0700
References: <DS0PR11MB7901641887C85593E522BD3BE0AC2@DS0PR11MB7901.namprd11.prod.outlook.com> <CAMKF1sqVLefx-rJ_vdBAWqNaLtAjykHKb47EL9jttKfxcmKwcw@mail.gmail.com> <2894840.1787984583874976123@lists.openembedded.org>
In-Reply-To: <2894840.1787984583874976123@lists.openembedded.org>
Message-ID: <2894840.1788013373272673695@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="yJU42CoAUzAK6nYR2dRK"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 14:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244633

--yJU42CoAUzAK6nYR2dRK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

While testing the clang/llvm 23.1.0 upgrade with 32-bit multilib, lib32-llv=
m failed to build. LLVM 23's APFloat.cpp
now pulls in llvm-libc float16 headers, and their detection breaks on i686 =
without SSE2 with GCC >=3D 14.
The build dies with "SSE register return with SSE2 disabled". LLVM 22.1.8 w=
as not affected.

I reported it upstream and sent a one-line fix:

https://github.com/llvm/llvm-project/issues/219668
https://github.com/llvm/llvm-project/pull/219675

Until that lands in a release, the series carries the patch with Upstream-S=
tatus: Submitted.

The same multilib round also caught an openmp packaging problem (installed =
into lib/ instead of lib64/), fixed in the openmp recipe by passing LLVM_LI=
BDIR_SUFFIX like the other clang-family recipes.

I am running a final round of local testing with both fixes and will post t=
he updated series after that.

Thanks,
Sunil Dora

--yJU42CoAUzAK6nYR2dRK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,<br /><br />While testing the clang/llvm 23.1.0 upgrade with 32=
-bit multilib, lib32-llvm failed to build. LLVM 23's APFloat.cpp <br />now =
pulls in llvm-libc float16 headers, and their detection breaks on i686 with=
out SSE2 with GCC &gt;=3D 14.<br />The build dies with "SSE register return=
 with SSE2 disabled". LLVM 22.1.8 was not affected.<br /><br />I reported i=
t upstream and sent a one-line fix:<br /><br />https://github.com/llvm/llvm=
-project/issues/219668<br />https://github.com/llvm/llvm-project/pull/21967=
5<br /><br />Until that lands in a release, the series carries the patch wi=
th Upstream-Status: Submitted.<br /><br />The same multilib round also caug=
ht an openmp packaging problem (installed into lib/ instead of lib64/), fix=
ed in the openmp recipe by passing LLVM_LIBDIR_SUFFIX like the other clang-=
family recipes.<br /><br />I am running a final round of local testing with=
 both fixes and will post the updated series after that.<br /><br />Thanks,=
<br />Sunil Dora</div>

--yJU42CoAUzAK6nYR2dRK--

