Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EFDF3C266
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:54:47 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14768.1773064483302862115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NUQBTiN4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.217.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ffe6887e21so654423137.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773064482; x=1773669282; darn=lists.openembedded.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2D6MqqfKA9MxLx0eMCy2xUonOoyKV/fJP5FNxU2I1Qk=;
        b=NUQBTiN403fu3SEBdi8WOgm4b3Tbl35T5w0PiTlcSTH+4/ndP9PrCbN6sS+W9GmkRo
         jBVV8NX72TWJpcWARnYtULpXj/kSove9270pHF0ejh0nNJUnbceKfSj12CDVDsTtvfA/
         Mrb35DPiBMILpnjW6jg7KfA1MRm0A/pg+LEXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773064482; x=1773669282;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2D6MqqfKA9MxLx0eMCy2xUonOoyKV/fJP5FNxU2I1Qk=;
        b=jYBZq4NPN/18mYvTw71UxcyufmEhzXwdIwHoEzjKEAB4SaIMXjvLYbdboPlYBGVe+7
         B1UAdW4atCU57R5yJFxa+eXNWdo5P/iRCCMLEKrpVeq4pJTFUjKc000uIqQzIStofnfB
         7aQYjelWVynzPnbANqraLG9hCHre3lNQmr0nnVcXnWlTr7FIvUeu2Q2S3Tw83sy3ppmG
         jwT7Vh7etVMqkvDG9vomPCtoikTKqOIEihaNKfLMxQ3fp0oBEXPl3dPDnxM+tG0AnxhB
         6n1EGwMY7RKO7HvkNVtQO6muzI9cgZMbXzNTciKLnPQLl3OB/GJjVA43b4csldVyTZai
         xC3A==
X-Forwarded-Encrypted: i=1; AJvYcCXOeSa1jxyYuXKLbexrAUtZDOaoIyoR4AXDCt29jrhbswFvzodKdPaj4aRoxEPEZr7Mlf7q+Laucz6v2tAW2PN+iQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy3FrslUHfP6pCSEQVR8/wRQWcpJeZtY6To1JsYbVaL1mLhfw2M
	kUNyPF3wSQJT6hA3saidZhOsSRw9/MM5yBqrU1B7NKe0SgAZmxRsdpABAlXeE9ohD0gGfay0IvM
	Q550wOhw=
X-Gm-Gg: ATEYQzzO8CM+wQwN4bOHmNvmJyvAdb5Hmu7ZUZPqU9OVO1j80jOeKGRgyysD9i3Q1gP
	QYCy1VMSSFMUlQzJZLV37o6mojaaifCrM17K38lP8LsHIYKWUGu2sPDsrY7T7z3Dlh0UAH75mXo
	cYO9hrgPtzqmGLV6EWys5AOBOzX2fRo0dVwiCn5xCxItgBDfczwIJ+N8uU9cLPyjhfq/tkvOx38
	ZGT8IfDWKylEKKoaSme0VtyoOftV0KRRa5wQct6ixhgwZuTFXJbuekLlPP5pUoluwnxWJDVf9cy
	e1bxcgCzBwtNbV6veUcNI1zzUsjDVBj09oO3FWrDvrjQ8cgBssW1Mn2WDTmWMNwDFYQG86i3rhI
	I4zF27OBugk3FvAo9q58z1Ij1L5pgqVkfPx7sBpamJFmNjXoeJIJ2tsBOzdhiHxs8nIt205aAnU
	qqRDnnZ1XLUYron+z/ERFLTPedhUJt/dT1Wn28zXit2nHnHI4Kjz9ynNZagxx/4P81DLlZdsAI+
	mbIypuqMhXYBKo=
X-Received: by 2002:a05:6102:6483:20b0:5ff:f198:d222 with SMTP id ada2fe7eead31-5fff1993d3fmr2260706137.39.1773064482157;
        Mon, 09 Mar 2026 06:54:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24aa:67b9:6ef1:bd24? ([2001:8b0:aba:5f3c:24aa:67b9:6ef1:bd24])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94e7b57ec19sm8417215241.14.2026.03.09.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:54:41 -0700 (PDT)
Message-ID: <ad4fc20f0d247147ca68551b9af6b9ecd34ce82b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/7] glibc: Upgrade to 2.43 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>, 
	Hemanth.KumarMD@windriver.com
Cc: Randy.MacLeod@windriver.com, Mathieu Dubois-Briand	
 <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Date: Mon, 09 Mar 2026 13:54:39 +0000
In-Reply-To: <3fc9ed71-f82a-49ae-b48a-298ce8df40d1@windriver.com>
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
	 <DGY2CYFRS69Z.3CLMQ8NPRDMMZ@bootlin.com>
	 <3fc9ed71-f82a-49ae-b48a-298ce8df40d1@windriver.com>
Content-Type: multipart/alternative; boundary="=-lgnKCwZ9HH676O7SMFEh"
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232720

--=-lgnKCwZ9HH676O7SMFEh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-03-09 at 18:56 +0530, Sundeep KOKKONDA wrote:
> =20
> On 09-Mar-26 12:43, Mathieu Dubois-Briand wrote:
> > On Sun Mar 8, 2026 at 4:07 PM CET, Hemanth Kumar M D via lists.openembe=
dded.org wrote:
> > =20
> > > =20
> > > From: Khem Raj <raj.khem@gmail.com>
> > >=20
> > > License-Update: Match to changes [1]
> > >=20
> > > Added free_sized, free_aligned_sized, memset_explicit, memalignment, =
and new time bases (TIME_MONOTONIC, etc.).
> > >=20
> > > Support for the Linux mseal system call to protect memory mappings (s=
ealing).
> > >=20
> > > Added support for the openat2 system call, allowing more granular fil=
e opening options.
> > >=20
> > > New, optimized, and correctly rounded functions from the CORE-MATH pr=
oject (acosh, asinh, atanh, erf, erfc, lgamma, tgamma).
> > >=20
> > > Significant 4x improvements for fused multiply-add (FMA) on AMD Zen 3=
 by updating ldbl-96 implementation.
> > >=20
> > > Improved remainder, frexp, and frexpl.
> > >=20
> > > Experimental Clang Support: Added support for building with LLVM Clan=
g (version 18+) on AArch64/x86_64 Linux.
> > >=20
> > > New CPU Detection: Enhanced detection for newer CPU architectures.
> > >=20
> > > 64-bit atomics for 32bit x86 patch is no longer required since upstre=
a has dropped this logic in 2.43 release
> > >=20
> > > [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da0ce8b07=
79e290596e99ca6d96c301684a2d7cfe
> > >=20
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > =20
> > =20
> > Hi Hemanth,
> >=20
> > I also note this failure, that is probably also related to this series:
> >=20
> > ERROR: libcap-native-2.77-r0 do_compile: Execution of '/srv/pokybuild/y=
octo-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/=
buildtools-extended-tarball/1.0/testimage-sdk/bitbake-build-p7zx603b/tmp/wo=
rk/x86_64-linux/libcap-native/2.77/temp/run.do_compile.3180827' failed with=
 exit code 1
> > ...
> > | gperf: /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x8=
6_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/=
bitbake-build-p7zx603b/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6: v=
ersion `GLIBC_2.43' not found (required by gperf)
> > =20
> =20
> Hello Richard,
> =20
> We are able to reproduce this error on our local and we suspect it is
> because of uninative, there we see=C2=A0UNINATIVE_MAXGLIBCVERSION =3D
> "2.42".
> =20
> Do we need any update here on uninative for glibc 2.43.? (We see for
> every glibc release the uninative was updated)
We need to merge the glibc recipe upgrade, then build a new uninative
tarball with the new glibc release.

In other words, this failure doesn't block the glibc recipe upgrade.

Cheers,

Richard

> =20

--=-lgnKCwZ9HH676O7SMFEh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>

  <style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head>
  <body><div>On Mon, 2026-03-09 at 18:56 +0530, Sundeep KOKKONDA wrote:</di=
v><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #72=
9fcf solid;padding-left:1ex"><div> </div><p>On 09-Mar-26 12:43, Mathieu Dub=
ois-Briand wrote:</p><blockquote type=3D"cite" cite=3D"mid:DGY2CYFRS69Z.3CL=
MQ8NPRDMMZ@bootlin.com" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf=
 solid;padding-left:1ex"><pre>On Sun Mar 8, 2026 at 4:07 PM CET, Hemanth Ku=
mar M D via lists.openembedded.org wrote:</pre><div> <br></div><blockquote =
type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pad=
ding-left:1ex"><div> </div><pre>From: Khem Raj <a class=3D"moz-txt-link-rfc=
2396E" href=3D"mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></p=
re><pre><br></pre><pre>License-Update: Match to changes [1]</pre><pre><br><=
/pre><pre>Added free_sized, free_aligned_sized, memset_explicit, memalignme=
nt, and new time bases (TIME_MONOTONIC, etc.).</pre><pre><br></pre><pre>Sup=
port for the Linux mseal system call to protect memory mappings (sealing).<=
/pre><pre><br></pre><pre>Added support for the openat2 system call, allowin=
g more granular file opening options.</pre><pre><br></pre><pre>New, optimiz=
ed, and correctly rounded functions from the CORE-MATH project (acosh, asin=
h, atanh, erf, erfc, lgamma, tgamma).</pre><pre><br></pre><pre>Significant =
4x improvements for fused multiply-add (FMA) on AMD Zen 3 by updating ldbl-=
96 implementation.</pre><pre><br></pre><pre>Improved remainder, frexp, and =
frexpl.</pre><pre><br></pre><pre>Experimental Clang Support: Added support =
for building with LLVM Clang (version 18+) on AArch64/x86_64 Linux.</pre><p=
re><br></pre><pre>New CPU Detection: Enhanced detection for newer CPU archi=
tectures.</pre><pre><br></pre><pre>64-bit atomics for 32bit x86 patch is no=
 longer required since upstrea has dropped this logic in 2.43 release</pre>=
<pre><br></pre><pre>[1] <a class=3D"moz-txt-link-freetext" href=3D"https://=
sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da0ce8b0779e290596e99ca6d96=
c301684a2d7cfe">https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da0=
ce8b0779e290596e99ca6d96c301684a2d7cfe</a></pre><pre><br></pre><pre>Signed-=
off-by: Khem Raj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raj.khem=
@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre><pre>---</pre><div> </div><=
/blockquote><div> </div><pre>Hi Hemanth,</pre><pre><br></pre><pre>I also no=
te this failure, that is probably also related to this series:</pre><pre><b=
r></pre><pre>ERROR: libcap-native-2.77-r0 do_compile: Execution of '/srv/po=
kybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokys=
dk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-build-p7zx60=
3b/tmp/work/x86_64-linux/libcap-native/2.77/temp/run.do_compile.3180827' fa=
iled with exit code 1</pre><pre>...</pre><pre>| gperf: /srv/pokybuild/yocto=
-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buil=
dtools-extended-tarball/1.0/testimage-sdk/bitbake-build-p7zx603b/tmp/sysroo=
ts-uninative/x86_64-linux/lib/libc.so.6: version `GLIBC_2.43' not found (re=
quired by gperf)</pre><div> </div></blockquote><div> </div><p>Hello Richard=
,</p><div> </div><p>We are able to reproduce this error on our local and we=
 suspect it is because of uninative, there we see&nbsp;<span style=3D"color=
: rgb(36, 36, 36); font-family: &quot;Cascadia Mono&quot;, Consolas, ui-mon=
ospace, Menlo, Monaco, monospace; font-size: 14px; font-style: normal; font=
-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text=
-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: =
0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoratio=
n-thickness: initial; text-decoration-style: initial; text-decoration-color=
: initial; display: inline !important; float: none;">UNINATIVE_MAXGLIBCVERS=
ION =3D "2.42".</span></p><div> </div><p>Do we need any update here on unin=
ative for glibc 2.43.? (We see for every glibc release the uninative was up=
dated)</p></blockquote><div>We need to merge the glibc recipe upgrade, then=
 build a new uninative tarball with the new glibc release.</div><div><br></=
div><div>In other words, this failure doesn't block the glibc recipe upgrad=
e.</div><div><br></div><div>Cheers,</div><div><br></div><div>Richard</div><=
div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex"><div> </div></blockquote><div><br>=
</div><div><span></span></div></body></html>

--=-lgnKCwZ9HH676O7SMFEh--

