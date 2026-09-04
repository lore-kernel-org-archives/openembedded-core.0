Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58642C61DD3
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 04:49:21 +0000 (UTC)
Subject: Re: [PATCH 00/11] clang/llvm: Upgrade to 23.1.0
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.217.239)
X-Originating-Platform: Windows Chrome 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 03 Sep 2026 21:49:15 -0700
References: <20260830125853.1139807-1-sunilkumar.dora@windriver.com> <CAMKF1soQRjHMiJnndyuEGrjf_VqB5fg4TjekEMgAe5cZLz8t0A@mail.gmail.com> <cd27e5c8-3846-4e35-bde3-643a1b753c69@windriver.com> <CAMKF1sq0eQY8h3G3BMo7osHQRYvD159Rb9ucN=twWxWKE3OJDA@mail.gmail.com> <CAMKF1som_-0Mhpym4hztGRGd+o8PtoOJv+WDCSc-YaAdwEgZ8w@mail.gmail.com>
In-Reply-To: <CAMKF1som_-0Mhpym4hztGRGd+o8PtoOJv+WDCSc-YaAdwEgZ8w@mail.gmail.com>
Message-ID: <964.1788497355893282310@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="FOEPXUCT67uDeIKvunIk"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 04:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245054

--FOEPXUCT67uDeIKvunIk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 05:17 AM, Khem Raj wrote:

>=20
> clang=C2=A023 is getting into an infinite loop compiling dovecot.

I can reproduce it here. The file is src/lib-json/test-json-generator.c at =
-O2. clang 22 compiles it in
about 2 seconds, with clang 23 I gave up waiting after half an hour, so it =
does look hung.
The time is going into one of the loop optimization passes in the code gene=
rator.

Turning that pass off gets dovecot building again. The whole recipe
went through fine here on qemux86-64 with TOOLCHAIN=3Dclang and

CFLAGS:append:pn-dovecot =3D " -mllvm -disable-lsr"

in local.conf. The option just disables the pass, so it should behave the s=
ame on other targets.
The affected file is only one of dovecot's own test binaries, nothing that =
gets shipped.

I am reducing a testcase and will report it to llvm, will post the link her=
e.
If a fix lands I will request a release/23.x backport.

Thanks,
Sunil Dora

--FOEPXUCT67uDeIKvunIk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Sep 4, 2026 at 05:17 AM, Khem Raj wrote:</div>
<div>
<blockquote>clang&nbsp;23 is getting into an infinite loop compiling doveco=
t.&nbsp;</blockquote>
I can reproduce it here. The file is src/lib-json/test-json-generator.c at =
-O2. clang 22 compiles it in<br />about 2 seconds, with clang 23 I gave up =
waiting after half an hour, so it does look hung. <br />The time is going i=
nto one of the loop optimization passes in the code generator.<br /><br />T=
urning that pass off gets dovecot building again. The whole recipe<br />wen=
t through fine here on qemux86-64 with TOOLCHAIN=3Dclang and<br /><br />CFL=
AGS:append:pn-dovecot =3D " -mllvm -disable-lsr"<br /><br />in local.conf. =
The option just disables the pass, so it should behave the same on other ta=
rgets. <br />The affected file is only one of dovecot's own test binaries, =
nothing that gets shipped.<br /><br />I am reducing a testcase and will rep=
ort it to llvm, will post the link here. <br />If a fix lands I will reques=
t a release/23.x backport.<br /><br />Thanks,<br />Sunil Dora<br /><br /></=
div>

--FOEPXUCT67uDeIKvunIk--

