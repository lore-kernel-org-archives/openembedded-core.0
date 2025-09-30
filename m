Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE2ECCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 12:16:00 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.24016.1759234556081016644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 05:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KHFtQwkX;
 spf=pass (domain: mvista.com, ip: 209.85.218.49, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b457d93c155so92392066b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 05:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1759234554; x=1759839354; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gnoczrB/uapWtSTZl+LhCjEUsdFeng0N3H5YOwi69o8=;
        b=KHFtQwkXxNH4QqZXQv9itOBzGkR6nN1aWeQdg+Y0R7/op9Kli4zCze+ywUEkRSb9hY
         F3ehnOaAyZYCC/NOl/FTZ6e+cusTgEvtzd8YbWgoXFY6OIWuJ7Br9TN4Bun8hvvWKAt6
         A1TY7p4rZv4vxCtvg71abvZfB80HKJRpN8v2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759234554; x=1759839354;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnoczrB/uapWtSTZl+LhCjEUsdFeng0N3H5YOwi69o8=;
        b=Z7NB2Ehrnk275Tr2rNcLs1l+WMNAgRFWtna6tjdetPZY2PbeYbGkaBSPOX3VOazqvN
         5aJluJIEu03D/5d66jyM86JyANVxgQVV+n0ddquUTBIf/UENHhr8EFcUdW9I+6KFSOYo
         kbgf9d35B3ttNmiS/ianGt1RsogTGW4ldAc2IQdUjmBpIg3E2l6QqrVFNelH6Y2edRv1
         SeJerIg5P5cHF4XroE/VyzvnTH0wLMlp4yPfklJ7RSPLnD/lpv96iSz4fCTywKGc9FWY
         2JmGPzidn9l5Y+e7V66eP82qHIUsJwipiPMf0dvrq6CdBdO4r1x7Ric3gmEEwH6qLfNk
         uKtQ==
X-Gm-Message-State: AOJu0YydSxyBMBTaalf9V7vus+9ShWzuR0j5xGl5cjffQhJKvafJMEaJ
	pUh6sJxM942PLKrCFMZG5rDwvyEE9NJQDUbutiUWlkIql4vHWMlKSF3uJRfvP0n/A2bAMlKnEAE
	1z5yYkAHlZCvxlnWhll9+AsM7cd+/VkVK3DcwgOhmDA==
X-Gm-Gg: ASbGnctlzioKPKw2Y6rL+JJ3x2p0Oh5Cy4PRqK3VqBPLDCgWYpDoXKrLjw9HQnULZZl
	mQwaY1AY7hysA7VwdSzxCwNGZnGoHJzECy8TMuaqZGm0mMBbYcZntJvFdVsy2t3h8EM8+RgoTx6
	495p590hwUYflHc13snGlYEqAhX1Q2fek0eRPzSCDSUsTQ1/DZu4cxDOLWm+cjbR/vJwBWdiZj+
	hrYdMwhrqkNwERAS6unqL1QFmGbWPYmnA==
X-Google-Smtp-Source: AGHT+IF0cpDOQ/z6brC7cv/sENau8sPLpzoKDGtw88092agGaqrhCeTzy2JuFzRZRgiSMV+p+P2chAuBKH9f02vtjSs=
X-Received: by 2002:a17:907:3e8e:b0:b41:660:13b8 with SMTP id
 a640c23a62f3a-b41067eac71mr592349266b.31.1759234554226; Tue, 30 Sep 2025
 05:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250929104731.19684-1-vanusuri@mvista.com> <DD628XZDM8VH.11V78L41VKXH8@bootlin.com>
In-Reply-To: <DD628XZDM8VH.11V78L41VKXH8@bootlin.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 30 Sep 2025 17:45:42 +0530
X-Gm-Features: AS18NWBkxyBgItmlgBWzAxcqZOPozLZKcTXhSG2c0t7NKWm_XyGQW0X0uVQepCs
Message-ID: <CANQUz18kHk-xSJ=qjDXsAJq5G7w1RTguRz36qFXJQ9U5dcOuhw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] ghostscript: upgrade 10.05.1 -> 10.06.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ae81f5064003b6d6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224185

--000000000000ae81f5064003b6d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thank you for testing the patch.

I tested the patch on a 64-bit system and didn't checked on 32-bit builds.

It appears the following commit from ArtifexSoftware might address the
issue you're seeing:
[
https://github.com/ArtifexSoftware/ghostpdl/commit/3c0be6e4fcffa63e4a5a1b0a=
ec057cebc4d2562f
].
I will try to reproduce the error locally and check if this commit indeed
resolves the problem.

Thanks,
Vijay

On Tue, Sep 30, 2025 at 3:55=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Mon Sep 29, 2025 at 12:47 PM CEST, Vijay Anusuri via
> lists.openembedded.org wrote:
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Dropped 0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
> >
> > Added fPIC flag needed to prevent a linker error during the build
> process.
> >
> > This upgrade addresses CVEs:
> > CVE-2025-59798, CVE-2025-59799, CVE-2025-59800, CVE-2025-59801
> >
> > Changelog:
> > https://ghostscript.readthedocs.io/en/gs10.06.0/News.html
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
>
> Hi Vijay,
>
> Thanks for your patch.
>
> We got some build issues on the autobuilder:
>
> ERROR: ghostscript-10.06.0-r0 do_compile: Execution of
> '/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-p=
oky-linux-musl/ghostscript/10.06.0/temp/run.do_compile.9882'
> failed with exit code 1
> ...
> | ./base/gdevmpla.c: In function 'mem_planar_strip_copy_rop2':
> | ./base/gdevmpla.c:1962:58: error: passing argument 3 of
> 'check_64bit_multiply' from incompatible pointer type
> [-Wincompatible-pointer-types]
> |  1962 |         if (check_64bit_multiply(height, chunky_sraster, (size_=
t
> *)&nbytes) !=3D 0)
> |       |
> ^~~~~~~~~~~~~~~~~
> |       |                                                          |
> |       |                                                          size_t
> * {aka unsigned int *}
> | In file included from ./base/gdevmpla.c:21:
> | ./base/gxdevice.h:694:71: note: expected 'int64_t *' {aka 'long long in=
t
> *'} but argument is of type 'size_t *' {aka 'unsigned int *'}
> |   694 | static inline int check_64bit_multiply(int64_t x, int64_t y,
> int64_t *result)
> |       |
> ~~~~~~~~~^~~~~~
> | ./base/gdevmpla.c:2022:68: error: passing argument 3 of
> 'check_64bit_multiply' from incompatible pointer type
> [-Wincompatible-pointer-types]
> |  2022 |         if (check_64bit_multiply(chunky_t_height,
> chunky_t_raster, &nbytes) !=3D 0)
> |       |
>   ^~~~~~~
> |       |
>   |
> |       |
>   intptr_t * {aka int *}
> | ./base/gxdevice.h:694:71: note: expected 'int64_t *' {aka 'long long in=
t
> *'} but argument is of type 'intptr_t *' {aka 'int *'}
> |   694 | static inline int check_64bit_multiply(int64_t x, int64_t y,
> int64_t *result)
> |       |
> ~~~~~~~~~^~~~~~
> | make: *** [base/lib.mak:1207: obj/gdevmpla.o] Error 1
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2498
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2316
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2476
>
> Can you look into these, please?
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--000000000000ae81f5064003b6d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Mathieu,</div><div><br></div><div>Thank you for te=
sting the patch.</div><div><br></div><div>I tested the patch on a 64-bit sy=
stem and didn&#39;t checked on 32-bit builds.</div><div><br></div><div>It a=
ppears the following commit from ArtifexSoftware might address the issue yo=
u&#39;re seeing:=C2=A0</div><div>[<a href=3D"https://github.com/ArtifexSoft=
ware/ghostpdl/commit/3c0be6e4fcffa63e4a5a1b0aec057cebc4d2562f">https://gith=
ub.com/ArtifexSoftware/ghostpdl/commit/3c0be6e4fcffa63e4a5a1b0aec057cebc4d2=
562f</a>].=C2=A0</div><div>I will try to reproduce the error locally and ch=
eck if this commit indeed resolves the problem.</div><div><br></div><div>Th=
anks,</div><div>Vijay</div></div><br><div class=3D"gmail_quote gmail_quote_=
container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 30, 2025 at 3:=
55=E2=80=AFPM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-br=
iand@bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon Sep 29, 2025 at 1=
2:47 PM CEST, Vijay Anusuri via <a href=3D"http://lists.openembedded.org" r=
el=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Dropped 0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch<br>
&gt;<br>
&gt; Added fPIC flag needed to prevent a linker error during the build proc=
ess.<br>
&gt;<br>
&gt; This upgrade addresses CVEs:<br>
&gt; CVE-2025-59798, CVE-2025-59799, CVE-2025-59800, CVE-2025-59801<br>
&gt;<br>
&gt; Changelog:<br>
&gt; <a href=3D"https://ghostscript.readthedocs.io/en/gs10.06.0/News.html" =
rel=3D"noreferrer" target=3D"_blank">https://ghostscript.readthedocs.io/en/=
gs10.06.0/News.html</a><br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Vijay,<br>
<br>
Thanks for your patch.<br>
<br>
We got some build issues on the autobuilder:<br>
<br>
ERROR: ghostscript-10.06.0-r0 do_compile: Execution of &#39;/srv/pokybuild/=
yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/gho=
stscript/10.06.0/temp/run.do_compile.9882&#39; failed with exit code 1<br>
...<br>
| ./base/gdevmpla.c: In function &#39;mem_planar_strip_copy_rop2&#39;:<br>
| ./base/gdevmpla.c:1962:58: error: passing argument 3 of &#39;check_64bit_=
multiply&#39; from incompatible pointer type [-Wincompatible-pointer-types]=
<br>
|=C2=A0 1962 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (check_64bit_multiply(he=
ight, chunky_sraster, (size_t *)&amp;nbytes) !=3D 0)<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^~~~~~~~~~~~~~~~~<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 size_t * {aka unsigned int *}<br>
| In file included from ./base/gdevmpla.c:21:<br>
| ./base/gxdevice.h:694:71: note: expected &#39;int64_t *&#39; {aka &#39;lo=
ng long int *&#39;} but argument is of type &#39;size_t *&#39; {aka &#39;un=
signed int *&#39;}<br>
|=C2=A0 =C2=A0694 | static inline int check_64bit_multiply(int64_t x, int64=
_t y, int64_t *result)<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~^~~~~~<br>
| ./base/gdevmpla.c:2022:68: error: passing argument 3 of &#39;check_64bit_=
multiply&#39; from incompatible pointer type [-Wincompatible-pointer-types]=
<br>
|=C2=A0 2022 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (check_64bit_multiply(ch=
unky_t_height, chunky_t_raster, &amp;nbytes) !=3D 0)<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intptr_t * {aka int *}<br>
| ./base/gxdevice.h:694:71: note: expected &#39;int64_t *&#39; {aka &#39;lo=
ng long int *&#39;} but argument is of type &#39;intptr_t *&#39; {aka &#39;=
int *&#39;}<br>
|=C2=A0 =C2=A0694 | static inline int check_64bit_multiply(int64_t x, int64=
_t y, int64_t *result)<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~~~~~^~~~~~<br>
| make: *** [base/lib.mak:1207: obj/gdevmpla.o] Error 1<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/build=
s/2498" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/6/builds/2498</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/buil=
ds/2316" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/17/builds/2316</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/buil=
ds/2476" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/59/builds/2476</a><br>
<br>
Can you look into these, please?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br>
</blockquote></div>

--000000000000ae81f5064003b6d6--

