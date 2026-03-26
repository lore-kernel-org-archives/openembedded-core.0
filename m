Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BD3109E53C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 02:14:58 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39502.1774491296998598242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 19:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CD15XfYG;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64e8c7f5082so543757d50.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 19:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774491296; cv=none;
        d=google.com; s=arc-20240605;
        b=YmAuOzrT9LBdTiv0xw/Y8Q+4jLvUGPyYI+zF0hsOpfEYhaJ9MUwW1uaam3Wfrnm9XS
         pu/NOIxrd6ToKoAow797Vv6305kQAwMMUw3CQYl9MdK0DWfFI0JC1g8aImKg+ux/ZIi8
         2nTLgph494K1GApYkLk/a+o6mepTYSc4VzykooqRMImITP1Xe3kEJdrS+PpoeyL+psE2
         QL4lwIf6Bz8lNiTqSoVoX0zoixtdihaEXVh5Fyv+h52hu3PAtPlhqC72vWi30vposrMi
         Az9mAJCwpkR1qzo4A5U6n/32ky6KOzy7N0PeqNrSu4ZZTVRMLPOWvcbX0RWbodAq6ypF
         tL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3xA/1SisnF2k/eraK/98Fl4R/2N431P/xR1HZgXW56w=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=aPn4lfqRFoiUZItO6W/FuyF+jA/ZvqEJgbPRYom548FcOcxUDnLeiTMSxbE0/CcSFD
         Fb/gzFdxNoMbjIiBkUgYTqNm+AEo7OTQLv5H4eQKi7S7oCD7dniTQ64rQURUy3qIB3Pz
         Z/8WAxE48L8a+V3JsW24dPjydxQ5f4rSdvr74KkTIuk1C9LEWUWG8SQl7ImAj9QB3J5X
         DKL4fj/A01MxUz+snP6s5Tx8s4yEXsW+gXpbaXyT9auZOg5nkcFgZ+WeCtrg+tRqLE0G
         Ux2sS1857Bc5ZwixywLml36pFglX6AxBIegZftBOJPjV88QIE/6UBECIUreJeAG5rUCP
         swfg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774491296; x=1775096096; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3xA/1SisnF2k/eraK/98Fl4R/2N431P/xR1HZgXW56w=;
        b=CD15XfYGAGdJBS0l69jy3n0ofadfAYQBdUXkx5banC4daKyxonFL5oXXscqrbSNpor
         12rXbEAkoph2HEvA0SBxZD4XLNIWn98pRq58Il3MPoLXjZ1z5fsDxumir0dCIE6vTM2v
         BvIIPvK7zzCj7kXIehcrv4qEi1tUymATfHoXwGpF/ILJi4tX5SXPom6u8lMPQh4CAdQi
         l8X/3Bu+k3OYDLOwUWDoq2DMVdGy6tY0cJR89DAMx6qwKv9TEzhaOIw02SYhuTunFa7E
         mq5BKGyMyNbvVWa7Bj2ebygwOQ58wCw4fa+t1XsnOXX9jJ9WHBiO3Kodrfwwqab9n737
         I7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774491296; x=1775096096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xA/1SisnF2k/eraK/98Fl4R/2N431P/xR1HZgXW56w=;
        b=N60a1tLzml/1t9wfG7MrSVX9gWliaZ+PDqJzRu7W+odxdmreMYrLlp/dGqKWv8+QLb
         wC85NaLeProVR/VX37YdfVaRY1bxtONPPPZvbiSlKDSMiOkBleo96/q2YtMqEJ8hf657
         xPKpIK/nLkMdnuKoAxbv0anGC1ICkzut6AcMgxmVAXSZjxyOgxtJM+qqKYntYkLwDTTX
         r+y9kwiswzvM7NjlOzlmXQrEAIGCPfXeayZdz7kCkNQPF6HImmc8L3294RdtqCSuvad9
         Bi9awto3koiaRE2d7WTDMzD1onzUbIVkN5CK+gTTXG1g0ydUlt5NkIMfXTK9hj8bN5bE
         NT4A==
X-Gm-Message-State: AOJu0YyA7YgVLUjRXhOLX0eesVuWHa7Hemum926xRL90zgJYbAY6V1s+
	zfFWV2EDibLbmF0RGvRi0bz59Jk/dZCOWvnY6X5ToPML4Zk00rkSFTmmmRv21nF+1uJJMvxrPGR
	0ZdsPJ8MBntMC4PQVT+Le81kvahHjY34Ph7d/
X-Gm-Gg: ATEYQzyaZa1BCm2zhHCqVpJj8UwTTGRdu4tHfg1Bc6pV9M8FumsKNa5ynP/lLV2C/Qb
	Z9L9rRe74DD9Xbizg+7f6jihNxAmWZvUnasi4P7eoyvvGOrN0h1rC35Gu/9WzUfggCVeTmqVu8s
	nh6tlQPHDJdof9ilAf4wJzy6lgqb+vHjOQ5slxCGj/yjtR6Oy3Pofo31qpNdKxq0vyP3f+iZOpc
	Is4zKaOnqXcDlWCvxXQHAKMhCdK5Uu2q0kniF1aNCiDiHIPMB6bd3zGFLazEwiJoFhIrGPweN0x
	Zgc2jNgNKXqlZRr24V0PjZCtNLTAa+1h3477bPUIKJrv/asJdY66lok4rFnkUj91f65ElY507iM
	7uP8Z8T9rNJHTo2ioCDspdlbDG0c=
X-Received: by 2002:a05:690e:11cd:b0:64e:f106:60f0 with SMTP id
 956f58d0204a3-64ef10668c7mr3478353d50.51.1774491296070; Wed, 25 Mar 2026
 19:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com> <50afa4d55645c2ea126726c30ff2272bf0a9a499.camel@linuxfoundation.org>
In-Reply-To: <50afa4d55645c2ea126726c30ff2272bf0a9a499.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Mar 2026 19:14:28 -0700
X-Gm-Features: AaiRm502aXU8OBE5EEgzShm_jONHtU1gdrbGF5j9OZlsGFyY-8g_LShd9cU-hWE
Message-ID: <CAMKF1sp+BSzkOJwhPn3d8nZCJGX--FrFD52FiF8hcqG3wnPYUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] clang/llvm: Upgrade to 22.x major release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005c0153064de3f38e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 02:14:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233946

--0000000000005c0153064de3f38e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 2:30=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2026-03-24 at 16:08 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > From: Khem Raj <raj.khem@gmail.com>
> >
> > Includes support for new Intel (Wildcat Lake, Nova Lake with APX and
> AVX10.2)
> > Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features
> performance
> > optimizations for AMD Zen 4 and Zen 5 architectures.
> >
> > Integrated Distributed ThinLTO is more mature, with enhancements
> > like cache support for incremental builds and robust handling of
> temporary artifacts.
> >
> > LLDB added first-class WebAssembly debugging support, including
> breakpoints and variable inspection.
> >
> > Support for Google Native Client (NaCl) is dropped in this release.
> >
> > Detailed ChangeLog [1]
> >
> > [1] https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Rust toolchain tests on qemuarm and qrmuarm64 fail:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3401
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3402
>
> error: data-layout for target `amdgcn-amd-amdhsa`,
>
> `e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:2=
56:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v=
48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A=
5-G1-ni:7:8:9`,
> differs from LLVM target's `amdgcn-amd-amdhsa` default layout,
>
> `e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:1=
60:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:=
32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S=
32-A5-G1-ni:7:8:9`
>
>
I have sent a patch for rust as well, it perhaps started to show up with
1.94+


> I think upgrading clang for this release may be a bit too ambitious
> this late in the release?
>
>
The patches has been in my tree for couple of months, so its pretty good
from but my test matrix is obviously not as extensive as AB.
I think it should be doable, we have piece-mealed other changes already


> musl builds are also failing:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3508
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3475
>
>
This was libclc failure, I have addressed it in v2.


>
> Cheers,
>
> Richard
>

--0000000000005c0153064de3f38e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25,=
 2026 at 2:30=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2026-03-24=
 at 16:08 -0700, Khem Raj via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank">raj.khem@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Includes support for new Intel (Wildcat Lake, Nova Lake with APX and A=
VX10.2)<br>
&gt; Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features perfor=
mance<br>
&gt; optimizations for AMD Zen 4 and Zen 5 architectures.<br>
&gt; <br>
&gt; Integrated Distributed ThinLTO is more mature, with enhancements<br>
&gt; like cache support for incremental builds and robust handling of tempo=
rary artifacts.<br>
&gt; <br>
&gt; LLDB added first-class WebAssembly debugging support, including breakp=
oints and variable inspection.<br>
&gt; <br>
&gt; Support for Google Native Client (NaCl) is dropped in this release.<br=
>
&gt; <br>
&gt; Detailed ChangeLog [1]<br>
&gt; <br>
&gt; [1] <a href=3D"https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html=
" rel=3D"noreferrer" target=3D"_blank">https://releases.llvm.org/22.1.0/doc=
s/ReleaseNotes.html</a><br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
Rust toolchain tests on qemuarm and qrmuarm64 fail:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/buil=
ds/3401" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/42/builds/3401</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/build=
s/3402" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/5/builds/3402</a><br>
<br>
error: data-layout for target `amdgcn-amd-amdhsa`,=C2=A0<br>
`e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256=
:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48=
:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-=
G1-ni:7:8:9`,=C2=A0<br>
differs from LLVM target&#39;s `amdgcn-amd-amdhsa` default layout,=C2=A0<br=
>
`e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160=
:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32=
-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32=
-A5-G1-ni:7:8:9`<br>
<br></blockquote><div><br></div><div>I have sent a patch for rust as well, =
it perhaps started to show up with 1.94+</div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
I think upgrading clang for this release may be a bit too ambitious<br>
this late in the release? <br>
<br></blockquote><div><br></div><div>The patches has been in my tree for co=
uple of months, so its pretty good from but my test matrix is obviously not=
 as extensive as AB.</div><div>I think it should be doable, we have piece-m=
ealed other changes already=C2=A0</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
musl builds are also failing:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/build=
s/3508" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/3/builds/3508</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/build=
s/3475" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/valkyrie/#/builders/6/builds/3475</a><br>
<br></blockquote><div><br></div><div>This was libclc failure, I have addres=
sed it in v2.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000005c0153064de3f38e--

