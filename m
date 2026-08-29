Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48719C61DD6
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 06:23:09 +0000 (UTC)
Subject: Re: clang/llvm 23.1.0 upgrade for oe-core
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.220.149)
X-Originating-Platform: Windows Chrome 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 23:23:03 -0700
References: <DS0PR11MB7901641887C85593E522BD3BE0AC2@DS0PR11MB7901.namprd11.prod.outlook.com> <CAMKF1sqVLefx-rJ_vdBAWqNaLtAjykHKb47EL9jttKfxcmKwcw@mail.gmail.com>
In-Reply-To: <CAMKF1sqVLefx-rJ_vdBAWqNaLtAjykHKb47EL9jttKfxcmKwcw@mail.gmail.com>
Message-ID: <2894840.1787984583874976123@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="s7SGrc7WgeqOwMEE7zyU"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 06:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244632

--s7SGrc7WgeqOwMEE7zyU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

I tested the meta-oe layers against the clang/llvm 23.1.0 series, both loca=
lly and on the autobuilder (meta-oe builder, build 1754).

Two recipes need fixing. I have sent patches for both to openembedded-devel=
:

*castxml* Clang 23 renamed ASTContext::getRawCommentForDeclNoCache to
getRawCommentNoCache.
*bcc* LLVM 23 changed the MCContext constructor to take MCAsmInfo,
MCRegisterInfo and MCSubtargetInfo by reference rather than
by pointer.

Both are already fixed upstream but the fixes are not in a release yet, and=
 meta-oe is on the newest tag of both,
so the patches are backports. Both upstream fixes are guarded on LLVM_VERSI=
ON_MAJOR, so older Clang keeps working.

perfetto builds fine, and so does include-what-you-use.

xdp-tools fails at its check_abi step with TOOLCHAIN=3Dclang, but it fails =
the same way with clang 22.1.8, so it is not caused by the upgrade. I have =
not sent anything for it.

The autobuilder run also shows krb5, redis, tailscale and doxygen failing. =
None of them depends on clang or llvm, and they fail with gcc as well. Most=
 of the error output in that run is vboxguestdrivers basehash non-determini=
sm, which does not fail any task.

Thanks,
Sunil

--s7SGrc7WgeqOwMEE7zyU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p>Hi Khem,</p>
<p>I tested the meta-oe layers against the clang/llvm 23.1.0 series, both l=
ocally and on the autobuilder (meta-oe builder, build 1754).</p>
<p>Two recipes need fixing. I have sent patches for both to openembedded-de=
vel:</p>
<p><strong>castxml&nbsp; </strong>Clang 23 renamed ASTContext::getRawCommen=
tForDeclNoCache to<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;getRawCommentNoCache.<br /><strong>bcc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </=
strong>LLVM 23 changed the MCContext constructor to take MCAsmInfo,<br />&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MCRegisterInfo a=
nd MCSubtargetInfo by reference rather than<br />&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; by pointer.</p>
<p>&nbsp;</p>
<p>Both are already fixed upstream but the fixes are not in a release yet, =
and meta-oe is on the newest tag of both, <br />so the patches are backport=
s. Both upstream fixes are guarded on LLVM_VERSION_MAJOR, so older Clang ke=
eps working.</p>
<p>perfetto builds fine, and so does include-what-you-use.</p>
<p>xdp-tools fails at its check_abi step with TOOLCHAIN=3Dclang, but it fai=
ls the same way with clang 22.1.8, so it is not caused by the upgrade. I ha=
ve not sent anything for it.</p>
<p>The autobuilder run also shows krb5, redis, tailscale and doxygen failin=
g. None of them depends on clang or llvm, and they fail with gcc as well. M=
ost of the error output in that run is vboxguestdrivers basehash non-determ=
inism, which does not fail any task.</p>
<p>&nbsp;</p>
<p>Thanks,<br />Sunil</p>
</div>

--s7SGrc7WgeqOwMEE7zyU--

