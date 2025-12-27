Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB24FE8FDD5
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 08:46:46 +0000 (UTC)
Subject: Re: [PATCH] package.py: warn if target is not a valid ELF file in dwarfsrcfiles
To: openembedded-core@lists.openembedded.org
From: "mark.yang" <mark.yang@lge.com>
X-Originating-Location: Gwanak-gu, Seoul, KR (203.247.149.209)
X-Originating-Platform: Windows Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 00:46:21 -0800
References: <20251226073545.11152-1-mark.yang@lge.com> <CANNYZj9LnX1-9TGMcNJ_E_VMF=TxuX9Y4V-6o2RvJB2ANQonPQ@mail.gmail.com>
In-Reply-To: <CANNYZj9LnX1-9TGMcNJ_E_VMF=TxuX9Y4V-6o2RvJB2ANQonPQ@mail.gmail.com>
Message-ID: <359949.1766825181217178563@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="KNudPR20UwA4aa4f9sio"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 08:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228553

--KNudPR20UwA4aa4f9sio
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

My error report is as follows.
https://errors.yoctoproject.org/Errors/Details/892988/

I am using only the openembedded-core layer, with nodistro.
local.conf

>=20
> PREFERRED_TOOLCHAIN_TARGET =3D "clang"
> DISTRO_FEATURES:append =3D " ld-is-lld"
> require conf/distro/include/lto.inc
> DISTRO_FEATURES:append =3D " lto"
> # The settings below were taken from meta-clang.
> LTO:toolchain-clang:class-target =3D
> "${@bb.utils.contains('DISTRO_FEATURES', 'thin-lto', '-flto=3Dthin', '-fl=
to
> -fuse-ld=3Dlld', d)}"
> LTO:toolchain-clang:class-nativesdk =3D
> "${@bb.utils.contains('DISTRO_FEATURES', 'thin-lto', '-flto=3Dthin', '-fl=
to
> -fuse-ld=3Dlld', d)}"
>=20

dwarfsrcfiles checks .a files during the package process.
Whether using LTO or not, DWARF information is extracted by iterating throu=
gh .o files inside .a files.
However, they must be ELF objects.

To summarize, it is as follows.
The problem is that when using clang + LTO, the .o files are not ELF but LL=
VM IR bitcode.

On Sat, Dec 27, 2025 at 03:31 AM, Alexander Kanavin wrote:

>=20
> Can you please provide a way to reproduce and observe the issue? I'm
> somewhat confused as to what the original issue is: is dwarfsrcfiles
> called on an .a file? That is not an ELF file regardless of whether
> clang-with-lto is enabled, so why does it work in one case but not in
> the other?
>=20
> Alex
> On Fri, 26 Dec 2025 at 08:36, mark.yang via lists.openembedded.org
> <mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>=20
>>=20
>> From: "mark.yang" <mark.yang@lge.com>
>>=20
>> When using the Clang toolchain with LTO, intermediate .o files are
>> generated as
>> LLVM bitcode files instead of ELF files. While .so libraries are
>> ultimately
>> ELF, .a files are not. In this case, dwarfsrcfiles always fails.
>>=20
>> Adding the -ffat-lto-objects option allows the Clang toolchain to produc=
e
>> .o
>> files that are recognized as ELF, but this is not always a suitable
>> solution
>> as it causes issues when used in conjunction with -fsanitize=3Dcfi.
>>=20
>> Therefore, we need to handle cases where dwarfsrcfiles encounters a file
>> that
>> is not a valid ELF. Change the behavior from a fatal error to a warning =
to
>>=20
>> notify the user.
>>=20
>> Signed-off-by: mark.yang <mark.yang@lge.com>
>> ---
>> meta/lib/oe/package.py | 8 ++++++--
>> 1 file changed, 6 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
>> index baaa0cba02..56b9bcd546 100644
>> --- a/meta/lib/oe/package.py
>> +++ b/meta/lib/oe/package.py
>> @@ -782,8 +782,12 @@ def source_info(file, d, fatal=3DTrue):
>> if retval !=3D 0 and retval !=3D 255:
>> msg =3D "dwarfsrcfiles failed with exit code %s (cmd was %s)%s" % (retva=
l,
>> cmd, ":\n%s" % output if output else "")
>> if fatal:
>> - bb.fatal(msg)
>> - bb.note(msg)
>> + if "not a valid ELF file" in output:
>> + bb.warn(msg)
>> + else:
>> + bb.fatal(msg)
>> + else:
>> + bb.note(msg)
>>=20
>> debugsources =3D parse_debugsources_from_dwarfsrcfiles_output(output)
>>=20
>>=20
>>=20
>>=20
>=20
>

--KNudPR20UwA4aa4f9sio
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>My error report is as follows.<br /><a href=3D"https://errors.yoctopro=
ject.org/Errors/Details/892988/" target=3D"_blank" rel=3D"noopener">https:/=
/errors.yoctoproject.org/Errors/Details/892988/</a></div>
<div>&nbsp;</div>
<div>I am using only the openembedded-core layer, with nodistro.</div>
<div>local.conf</div>
<blockquote>
<div>PREFERRED_TOOLCHAIN_TARGET =3D "clang"<br />DISTRO_FEATURES:append =3D=
 " ld-is-lld"<br />require conf/distro/include/lto.inc<br />DISTRO_FEATURES=
:append =3D " lto"<br /># The settings below were taken from meta-clang.<br=
 />LTO:toolchain-clang:class-target =3D "${@bb.utils.contains('DISTRO_FEATU=
RES', 'thin-lto', '-flto=3Dthin', '-flto -fuse-ld=3Dlld', d)}"<br />LTO:too=
lchain-clang:class-nativesdk =3D "${@bb.utils.contains('DISTRO_FEATURES', '=
thin-lto', '-flto=3Dthin', '-flto -fuse-ld=3Dlld', d)}"</div>
</blockquote>
<div>&nbsp;</div>
<div>dwarfsrcfiles checks .a files during the package process.<br />Whether=
 using LTO or not, DWARF information is extracted by iterating through .o f=
iles inside .a files.</div>
<div>However, they must be ELF objects.</div>
<div>&nbsp;</div>
<div>To summarize, it is as follows.</div>
<div>The problem is that when using clang + LTO, the .o files are not ELF b=
ut LLVM IR bitcode.</div>
</div>
<div>&nbsp;</div>
<div>On Sat, Dec 27, 2025 at 03:31 AM, Alexander Kanavin wrote:</div>
<div>
<blockquote>Can you please provide a way to reproduce and observe the issue=
? I'm<br />somewhat confused as to what the original issue is: is dwarfsrcf=
iles<br />called on an .a file? That is not an ELF file regardless of wheth=
er<br />clang-with-lto is enabled, so why does it work in one case but not =
in<br />the other?<br /><br />Alex<br />On Fri, 26 Dec 2025 at 08:36, mark.=
yang via lists.openembedded.org<br />&lt;mark.yang=3Dlge.com@lists.openembe=
dded.org&gt; wrote:<br />
<blockquote><br />From: "mark.yang" &lt;mark.yang@lge.com&gt;<br /><br />Wh=
en using the Clang toolchain with LTO, intermediate .o files are generated =
as<br />LLVM bitcode files instead of ELF files. While .so libraries are ul=
timately<br />ELF, .a files are not. In this case, dwarfsrcfiles always fai=
ls.<br /><br />Adding the -ffat-lto-objects option allows the Clang toolcha=
in to produce .o<br />files that are recognized as ELF, but this is not alw=
ays a suitable solution<br />as it causes issues when used in conjunction w=
ith -fsanitize=3Dcfi.<br /><br />Therefore, we need to handle cases where d=
warfsrcfiles encounters a file that<br />is not a valid ELF. Change the beh=
avior from a fatal error to a warning to<br />notify the user.<br /><br />S=
igned-off-by: mark.yang &lt;mark.yang@lge.com&gt;<br />---<br />meta/lib/oe=
/package.py | 8 ++++++--<br />1 file changed, 6 insertions(+), 2 deletions(=
-)<br /><br />diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py<=
br />index baaa0cba02..56b9bcd546 100644<br />--- a/meta/lib/oe/package.py<=
br />+++ b/meta/lib/oe/package.py<br />@@ -782,8 +782,12 @@ def source_info=
(file, d, fatal=3DTrue):<br />if retval !=3D 0 and retval !=3D 255:<br />ms=
g =3D "dwarfsrcfiles failed with exit code %s (cmd was %s)%s" % (retval, cm=
d, ":\n%s" % output if output else "")<br />if fatal:<br />- bb.fatal(msg)<=
br />- bb.note(msg)<br />+ if "not a valid ELF file" in output:<br />+ bb.w=
arn(msg)<br />+ else:<br />+ bb.fatal(msg)<br />+ else:<br />+ bb.note(msg)=
<br /><br />debugsources =3D parse_debugsources_from_dwarfsrcfiles_output(o=
utput)<br /><br /><br /><br /></blockquote>
</blockquote>
</div>

--KNudPR20UwA4aa4f9sio--

