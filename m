Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26316F47CD0
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 20:30:18 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53945.1772742610182239051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 12:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VrC2SXpf;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ca2b32f46so6428418d50.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 12:30:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772742609; cv=none;
        d=google.com; s=arc-20240605;
        b=RG3RJvuCKIPWD73nY9SpJwY1tuwNoryP/2ffhElkY+nvZLXhtp2mfvTA4PoKvuIM2b
         hPdHmaTqpUu3uqHqV8YzULxIW75KxWgp7X18LMOzFKE4H4MVP4clrGCHVCfBiptIBYrB
         NQKoOs2VLlVHfjky06HMWso4hAKayuewE1hiceiRBK2oWRTWHrtRxSAoxAKuiO8uzZq9
         r+FmTY3PdzmBvAOelgoOTSxOkisn9VIzRMbsf81ucZfVSTGr/kYXl+gpRi50i1QxbwUd
         jM1TTgAnYoYvsHOC9qi9CGdUpsyXzTXhx/wQn0HD5q27VhdVDL+cAzrqosf/rALRMo40
         2bAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iANsmHbMqyOdd3TzgQI4zpVM0tBBv++FTkByhRjPpuE=;
        fh=0tcXvp5fD6oO2ejErIYlAxqU2CE+KW2010kRRE+ZVfk=;
        b=YevYmYRE27gDyS523TSD/wx47u7ajKIRxNE6cIoDe7kyxBrP5OP5iincikqdZZLTio
         SvmcMWKshIg8XgUq8UZnoG7eodXHOj/Mpk68V/2VsGOn/7fb4HcMcplfNd5aAg9t/bEb
         qJOoTCcXuAvFQCqajKzuHPCm01Hm7ASmptw/AwlqA/uvSR65DdUV96Pz+HQ79OLpjhOR
         KG0omedHrES1k6oZaHXmu2DtIrhvwJpnVQCMaT/8VjrqGLEzgncrkBMvADk08Hp9agMQ
         c5G/3l8zhLLUUUPM+uQZyejQ1nLlf8DBsz1ieXEKLviCgafEgYOPMQsAkKpCEuOrQWXS
         hXjQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772742609; x=1773347409; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iANsmHbMqyOdd3TzgQI4zpVM0tBBv++FTkByhRjPpuE=;
        b=VrC2SXpfxpAOh4y5+W8A7DUn75MacJEfPRqHQw918BU9+wLqG1wrOj25cF+uLyogaf
         MiKhuXZbquJE28KsCYN8Xwj//vQws8zd68l8bjt5bLAz7ZUoqWdL7WJb2N470j7csCgK
         Rv1ZVSBuRzC+NjcKKsRLQPr6T9Gul1RWbwxNPv3lbHJx5qbo5wpVf4mD1YFgP7+549oP
         lJAm0kV9UeX8CZtJgUjuXH850ZVwXPt8MOzKfh/Fkjyd1vmijDh0CMfOsWREfIS+JpQD
         eiFNCajLzJZOjx62S9wHpbV+5ETCdwKYj3fRwgcto8l5fdvJ95YMXYA+8qyPL7DC68/4
         GJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772742609; x=1773347409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iANsmHbMqyOdd3TzgQI4zpVM0tBBv++FTkByhRjPpuE=;
        b=bbP9HGCld9paPZhxvLhsW1Qkh9AaGEhhcFWtM62vI2R7NMvWpu4rxk2NXtG+ajp51K
         m0w1BCB75ZbSlyGlkDtn55rHfVgKbphdBHOrQM6i7v9Bm4IwrJIyfch3LYWOqT0enYYs
         Bzyalq/DRF1dN0mPGWPE+Z+Pr/RsqJyT650k7gdwtfau51qXqz32l9QyBcJu0QQeYf0r
         AaBOWD/fwduYhVEFlJr0dNP1cezaedVEzPOZedqjcTEHEqSDI3uyAAPr56bsn7/2lqrR
         qrxw002EqUR+2bRyin6FDQp9EDvqCtl6qrKqcvS3lHJDW9vboXmPdmuxfbzCjqZ2UJJS
         4aOA==
X-Forwarded-Encrypted: i=1; AJvYcCV+0kDW9CRRkqpaQj3y7yjjuxlaGlNP+zUYpKGTgx5B1D+37CX/+HdrPUNP8yJSMV4SgXofiXCV7kIgAhGV4RZy/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxik3SOkfR/8q5Xs1lWytmmNYq9G1AN5Uq3xw9PnEdLgStZprha
	AkvyYfJv35Kfei+Ahikshz9oL1J2Nq4maDcnyWR7hvrlx+ptlib3atRiTT2OE4X5h1atRrrbxPU
	bFFbwYJRet7wijc9cB0qVCKqR9+6Tu8dtx2zw
X-Gm-Gg: ATEYQzwWG6CSVnfW+3Mm8phDOB+So6pMpOopRqHZinohbkRFnkm5FR6ZI1ObKE+EXKT
	k32NdlwsmQRAS/8EK67GGj6xe6NgxL8d1mWK83t2saYeV78EmXajbAv3lyuA1CaWM973sl7q+a8
	JVfbjSK08L92VwNRQcodQfoD0Ha6aJFeqeUz/M0wK0dQm7ORnbdnt7zZxXCAcNaXty9yrQ3E3lB
	brz6YpZ/rhh4n06JcnMYyeKM7jia8ZYjcGeGXlULAb0KkK3+snqwGmKQ2536VomGatdBwTSiXGE
	J4wm9pEGehDrBVi2sRULcdZ3T5tqlcJQk599n/ByHYuzlD7w4JtUVzhIeaVOoygxBY7ELfP0UUB
	LyRA4GuSv4c8KzC55wyfTr0hS
X-Received: by 2002:a05:690e:d57:b0:649:b04c:25c3 with SMTP id
 956f58d0204a3-64d10d49a87mr910055d50.62.1772742609129; Thu, 05 Mar 2026
 12:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20260127053941.792825-1-raj.khem@gmail.com> <DGM7WKPONTXD.ZOV8O0CMQHXR@bootlin.com>
 <25b7aea3-e05c-4378-95b7-ad269a4ee93d@windriver.com>
In-Reply-To: <25b7aea3-e05c-4378-95b7-ad269a4ee93d@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Mar 2026 12:29:56 -0800
X-Gm-Features: AaiRm505RBTO996GsfA6HCNm2v7JGFeapehnUx-sR0ONcmKROoM6xsqN7Zudg4Y
Message-ID: <CAMKF1sr+-xaOSezgQ92xPUSX7qPH_ruG6_Zkfq+TAG1gGpWh5A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.43 release
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000007ed576064c4ccd62"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 20:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232518

--0000000000007ed576064c4ccd62
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please pick the latest from my branch I will be traveling for next 10 Days

On Thu, Mar 5, 2026, 8:23=E2=80=AFAM Randy MacLeod via lists.openembedded.o=
rg
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:

> On 2026-02-23 4:01 a.m., Mathieu Dubois-Briand via lists.openembedded.org
> wrote:
>
> On Tue Jan 27, 2026 at 6:39 AM CET, Khem Raj via lists.openembedded.org w=
rote:
>
> License-Update: Match to changes [1]
>
> Added free_sized, free_aligned_sized, memset_explicit, memalignment, and =
new time bases (TIME_MONOTONIC, etc.).
>
> Support for the Linux mseal system call to protect memory mappings (seali=
ng).
>
> Added support for the openat2 system call, allowing more granular file op=
ening options.
>
> New, optimized, and correctly rounded functions from the CORE-MATH projec=
t (acosh, asinh, atanh, erf, erfc, lgamma, tgamma).
>
> Significant 4x improvements for fused multiply-add (FMA) on AMD Zen 3 by =
updating ldbl-96 implementation.
>
> Improved remainder, frexp, and frexpl.
>
> Experimental Clang Support: Added support for building with LLVM Clang (v=
ersion 18+) on AArch64/x86_64 Linux.
>
> New CPU Detection: Enhanced detection for newer CPU architectures.
>
> 64-bit atomics for 32bit x86 patch is no longer required since upstrea ha=
s dropped this logic in 2.43 release
>
> [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da0ce8b0779e2=
90596e99ca6d96c301684a2d7cfe
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com> <raj.khem@gmail.com>
> ---
>
> Hi Khem,
>
> I have some build issue with this patch. Yet I had some merge
> conflicts, so maybe my resolutions were not correct.
>
> ERROR: nativesdk-gcc-runtime-15.2.0-r0 do_compile: Execution of '/srv/pok=
ybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-nativesdk-pok=
ysdk-linux/nativesdk-gcc-runtime/15.2.0/temp/run.do_compile.3275864' failed=
 with exit code 1
> ...
> | /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work-shared/g=
cc-15.2.0-r0/sources/gcc-15.2.0/libgomp/affinity-fmt.c:330:25: error: initi=
alization discards 'const' qualifier from pointer target type [-Werror=3Ddi=
scarded-qualifiers]
> |   330 |               char *q =3D strchr (p + 1, '}');
> |       |                         ^~~~~~
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3240htt=
ps://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3229
>
> The branch that was tested if you want to check: https://git.yoctoproject=
.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.yoctoproject.org/valkyrie/=
a-full-3260
>
> Thanks,
> Mathieu
>
>
> Khem,
>
> Will you send a new version of this patch or should Deepesh do that ?
> We need this ASAP.
>
> ../Randy
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232501):
> https://lists.openembedded.org/g/openembedded-core/message/232501
> Mute This Topic: https://lists.openembedded.org/mt/117484328/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007ed576064c4ccd62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please pick the latest from my branch I will be traveling=
 for next 10 Days=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 5, 2026, 8:23=E2=
=80=AFAM Randy MacLeod via <a href=3D"http://lists.openembedded.org">lists.=
openembedded.org</a> &lt;randy.macleod=3D<a href=3D"mailto:windriver.com@li=
sts.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <div>On 2026-02-23 4:01 a.m., Mathieu
      Dubois-Briand via <a href=3D"http://lists.openembedded.org" target=3D=
"_blank" rel=3D"noreferrer">lists.openembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>On Tue Jan 27, 2026 at 6:39 AM CET, Khem Raj via <a href=3D"http=
://lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">lists.opene=
mbedded.org</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>License-Update: Match to changes [1]

Added free_sized, free_aligned_sized, memset_explicit, memalignment, and ne=
w time bases (TIME_MONOTONIC, etc.).

Support for the Linux mseal system call to protect memory mappings (sealing=
).

Added support for the openat2 system call, allowing more granular file open=
ing options.

New, optimized, and correctly rounded functions from the CORE-MATH project =
(acosh, asinh, atanh, erf, erfc, lgamma, tgamma).

Significant 4x improvements for fused multiply-add (FMA) on AMD Zen 3 by up=
dating ldbl-96 implementation.

Improved remainder, frexp, and frexpl.

Experimental Clang Support: Added support for building with LLVM Clang (ver=
sion 18+) on AArch64/x86_64 Linux.

New CPU Detection: Enhanced detection for newer CPU architectures.

64-bit atomics for 32bit x86 patch is no longer required since upstrea has =
dropped this logic in 2.43 release

[1] <a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da0c=
e8b0779e290596e99ca6d96c301684a2d7cfe" target=3D"_blank" rel=3D"noreferrer"=
>https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da0ce8b0779e290596=
e99ca6d96c301684a2d7cfe</a>

Signed-off-by: Khem Raj <a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank" rel=3D"noreferrer">&lt;raj.khem@gmail.com&gt;</a>
---
</pre>
      </blockquote>
      <pre>Hi Khem,

I have some build issue with this patch. Yet I had some merge
conflicts, so maybe my resolutions were not correct.

ERROR: nativesdk-gcc-runtime-15.2.0-r0 do_compile: Execution of &#39;/srv/p=
okybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-nativesdk-p=
okysdk-linux/nativesdk-gcc-runtime/15.2.0/temp/run.do_compile.3275864&#39; =
failed with exit code 1
...
| /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work-shared/gcc=
-15.2.0-r0/sources/gcc-15.2.0/libgomp/affinity-fmt.c:330:25: error: initial=
ization discards &#39;const&#39; qualifier from pointer target type [-Werro=
r=3Ddiscarded-qualifiers]
|   330 |               char *q =3D strchr (p + 1, &#39;}&#39;);
|       |                         ^~~~~~

<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/build=
s/3240" target=3D"_blank" rel=3D"noreferrer">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/4/builds/3240</a>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/buil=
ds/3229" target=3D"_blank" rel=3D"noreferrer">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/19/builds/3229</a>

The branch that was tested if you want to check: <a href=3D"https://git.yoc=
toproject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.yoctoproject.org/=
valkyrie/a-full-3260" target=3D"_blank" rel=3D"noreferrer">https://git.yoct=
oproject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.yoctoproject.org/v=
alkyrie/a-full-3260</a>

Thanks,
Mathieu</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Khem,=C2=A0</p>
    <p>Will you send a new version of this patch or should Deepesh do
      that ?<br>
      We need this ASAP.</p>
    <p>../Randy</p>
    <blockquote type=3D"cite">
      <pre></pre>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#232501): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/232501" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/232501</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117484328/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/117484328/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007ed576064c4ccd62--

