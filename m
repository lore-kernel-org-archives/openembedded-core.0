Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97624C624DB
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 13:26:18 +0000 (UTC)
Subject: Re: [PATCH 00/11] clang/llvm: Upgrade to 23.1.0
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.216.172)
X-Originating-Platform: Windows Chrome 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 05 Sep 2026 06:26:09 -0700
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com> <CAMKF1soQRjHMiJnndyuEGrjf_VqB5fg4TjekEMgAe5cZLz8t0A@mail.gmail.com> <cd27e5c8-3846-4e35-bde3-643a1b753c69@windriver.com> <CAMKF1sq0eQY8h3G3BMo7osHQRYvD159Rb9ucN=twWxWKE3OJDA@mail.gmail.com> <CAMKF1som_-0Mhpym4hztGRGd+o8PtoOJv+WDCSc-YaAdwEgZ8w@mail.gmail.com> <964.1788497355893282310@lists.openembedded.org>
In-Reply-To: <964.1788497355893282310@lists.openembedded.org>
Message-ID: <135420.1788614769564017900@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="a7d8zy3PpE21NHAowBHj"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:26:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245148

--a7d8zy3PpE21NHAowBHj
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 10:19 AM, Dora, Sunil Kumar wrote:

>=20
> I am reducing a testcase and will report it to llvm, will post the link
> here.
> If a fix lands I will request a release/23.x backport.

Hi Khem,

I bisected llvm between 22.1.8 and 23.1.0. The problem comes from the new D=
FAJumpThreading pass
which is on by default in clang 23. The full file takes more than 90 minute=
s where clang 22 needs about
2 seconds.

I reported it upstream with a reduced testcase:
https://github.com/llvm/llvm-project/issues/221391

There is also a better workaround than the -disable-lsr I posted earlier. T=
urning off just the new pass keeps
LSR and behaves the same as clang 22:

CFLAGS:append:toolchain-clang =3D " -mllvm -enable-dfa-jump-thread=3Dfalse"

I sent this as v2 of your dovecot patch on openembedded-devel. Once the llv=
m fix lands I will ask for a
release/23.x backport, then we can drop the workaround.

Thanks,
Sunil Dora

--a7d8zy3PpE21NHAowBHj
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Sep 4, 2026 at 10:19 AM, Dora, Sunil Kumar wrote:</div>
<div>
<blockquote>I am reducing a testcase and will report it to llvm, will post =
the link here. <br />If a fix lands I will request a release/23.x backport.=
</blockquote>
Hi Khem,<br /><br />I bisected llvm between 22.1.8 and 23.1.0. The problem =
comes from the new DFAJumpThreading pass <br />which is on by default in cl=
ang 23. The full file takes more than 90 minutes where clang 22 needs about=
<br />2 seconds. <br /><br />I reported it upstream with a reduced testcase=
:<br />https://github.com/llvm/llvm-project/issues/221391<br /><br />There =
is also a better workaround than the -disable-lsr I posted earlier. Turning=
 off just the new pass keeps <br />LSR and behaves the same as clang 22:<br=
 /><br />CFLAGS:append:toolchain-clang =3D " -mllvm -enable-dfa-jump-thread=
=3Dfalse"<br /><br />I sent this as v2 of your dovecot patch on openembedde=
d-devel. Once the llvm fix lands I will ask for a <br />release/23.x backpo=
rt, then we can drop the workaround.<br /><br />Thanks,<br />Sunil Dora<br =
/><br /></div>

--a7d8zy3PpE21NHAowBHj--

