Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE55CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 13:00:22 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.19858.1761224416230834728
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 06:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DgR5jTmJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-33bc2178d6aso626918a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 06:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761224416; x=1761829216; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0mJFGc+NZWnr3T3KtupQWdYQ1P2ax/1/2ixrDAQi/XU=;
        b=DgR5jTmJVK6AwBzLVrg9hnJPlvie+KRWwtn3ruQhsAcYNmwLDnQn2XNw2E25ssfrjU
         Klt04F3utuv/y7dML51uc3A0QL77Zq0XXuwXQa7hRsxOmfv3sFpmYTWOcsKpIVa+7Rej
         syG2a9GHKfd0G/kjmd7RvEwQei7AIx1vNgCkc75tsHuAi8XBNrZwGpWFagVyzKr/8meU
         ui6ych6z6nZ8esiPm6ZmpO5cir0csVNGE8BBlnLHXpFEgpv5XpCTVgk/hAfIN0vYPClk
         tXmqQFCoL+seLFzpcXuxjDmrZ/wkKatlN3GLWe5H+racWAr2B3sLyc8YiFwDN74WPnRt
         dgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761224416; x=1761829216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mJFGc+NZWnr3T3KtupQWdYQ1P2ax/1/2ixrDAQi/XU=;
        b=jJhROWh5XTePNHfULIXJdTrJ5Piz3FvWewN2BKx/Ks9sdlO3UedMRkAQYELuFK1GJq
         uHRVsPbbqlEPrqftpcbnPUPpi6pBhQEBDCs69b7STUG7EMQPT4GczgALF3Y45kugVHrL
         HQnLHPSJUXMOSzpJXSHNRqU3TKzwc+zSJG1cLMAu2DWClSAGytliywSgpKhBsdDthprv
         C3vLpZsInbHpB9Nu/Z6zwKERgk/fs25GqVwN93uTP9RV39KMAMRBzBBfOAzG3LU61r7e
         G8+VEWm9WwBrKH4WgYn+/bL75+mwzaEBiJUPFd+dSwyDA0D+Z/SyysaGJNZ3duhK/+T+
         7/EQ==
X-Gm-Message-State: AOJu0YwoYS98fD2eI3JDmNXk0xFuBKizAsktF7nIV0FF4l1X8dmM+rfD
	EL9QaxwlzUf5e459BQ0bbhsVWZ6EEBAAI4GYFgE5JGk6C4eOYYAhop9tkHQHaJjkXgSJe93lkdH
	hcJ/lnDmYaapjaFfxyqs9vHhyz9EDKMk=
X-Gm-Gg: ASbGncuAOtWaxWKqNc0BUkCpod9bG3e9am9HNxvDcS2j+79TMgkAaOTKbxQzYNz6m6i
	NELR2Zs/0Ri5fVcfl+Y/QjWf05IGHX/z4y9QLVeocwkV5rRjnlgUTbZK1FFa8wfdqHneyiSTPS5
	YdFECj3es4wYOz2ugRPo9vUvUHCxJEaAek8jkewdb+LJAjKHfEWvCMqZW03wjjprmY6Df9VDpfT
	kgAWUMRpDJ/Rqtw48Uqdd67L0MrL8UdogkVOvNHKjFbWiPdvxYdHE5EkkoMbQ0qe9wyqkvx
X-Google-Smtp-Source: AGHT+IF7m4SvLLn8Jo9f49YKfkprlJKyeCDB+7U12Rcp4Av7N/Mbwzi8Jsp5FoOm9a96amNkKx94GmxFVkagoVpO3M4=
X-Received: by 2002:a17:90b:2fd0:b0:332:8491:ec2 with SMTP id
 98e67ed59e1d1-33bcf87b30cmr34295999a91.16.1761224413787; Thu, 23 Oct 2025
 06:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Oct 2025 09:00:02 -0400
X-Gm-Features: AS18NWCWDF5j0HZ2bKsGa_QgCnYgApGqEX694LAfTThNsKwxrbLXyuYGqUKht1w
Message-ID: <CADkTA4PMoKfNhFKz433ACKZwP_dgnC19wttJqw_nrTEE1GPrcw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/7] Enable rust support for linux kernel
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="0000000000008db9210641d30346"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 13:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225256

--0000000000008db9210641d30346
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 7:27=E2=80=AFAM Sadineni, Harish via lists.openembe=
dded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> This patch series introduces Rust support into the linux-yocto kernel
> recipe
> and related build infrastructure in the Yocto Project. The goal is to
> enable
> building the Linux kernel with Rust components and provide support for
> building kernel module which is written in rust inside sdk.
>
> Summary of changes:
>
> - Patch 1: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be
> available in the SDK environment.
> - Patch 2: Add required dependencies ('clang-native',
> 'bindgen-cli-native') to the kernel to support Rust binding generation.
> - Patch 3: Install the Rust standard library source ('library/') into
> `work-shared` and which will be later copied to
>            linux-yocto recipe-sysroot-native.
> - Patch 4: Stage the Rust sources into `recipe-sysroot-native` for kernel
> build compatibility, making them visible during native builds.
> - Patch 5: Update `kernel-yocto.bbclass` to invoke `make rustavailable`
> during 'do_kernel_configme', ensuring Rust readiness.
> - Patch 6: Add kernel configuration support for Rust (via 'rust.cfg' and
> 'rust.scc'), enabling the Rust build options in kernel config.
> - patch 7: Copy Rust kernel sources into kernel-devsrc build directory
> which will be required while runnig 'make prepare' in sdk.
>
>
On my first pass through, things look to be in reasonable shape with
respect to patch
splitting, and clarity.

But the number one item is: this cannot be default, it must be opt-in and
controlled via
a distro feature.

When we get to the point that the kernel cannot be built and functional
without rust,
then of course we'll revisit. But we aren't to that point now.

Before we inflict the overhead and dependencies of rust and related tools
on the kernel,
we have to have binary / prebuilt components available.

Cheers,

Bruce



> WIP - need inputs:
> 1. In patch-3, rust sources are copied from ${RUSTSRC} to
> ${TMPDIR}/work-shared, which is redundant and improving it in
>  more optimized way by extracting rust directly into ${TMPDIR}/work-share=
d
> and then use it for both rust & linux-yocto recipes.
>
> 2. In patch-6, We've suppressed a few build path QA issues with
> INSANE_SKIP.
> We have tried fixing those using DEBUG_PREFIX_MAP & --remap-path-prefix
> but unable to resolve it.
> Are there any flags for kernel or any other inputs?
>
> 3. If rust.cfg & rust.scc changes are ok, we will send kernel
> configuration fragment to yocto-kernel-cache.
>
> With above considerations, We did a successful build of Enabling rust in
> linux kernel and
> Tested a rust-out-of-tree kernel module in sdk for x86-64 & arm64
> architectures.
>
> Harish Sadineni (7):
>   bindgen-cli: extend BBCLASSEXTEND to include nativesdk
>   linux-yocto: add clang-native and bindgen-cli-native to DEPENDS
>   rust: install Rust standard library sources for make rustavailable
>     support
>   rust: stage rustlib sources for linux-yocto make rustavailable support
>   kernel-yocto: add rust support via make rustavailable in
>     do_kernel_configme
>   linux-yocto: enable Rust support in kernel configuration
>   kernel-devsrc: copying rust-kernel soucre  to $kerneldir/build
>
>  meta/classes-recipe/kernel-yocto.bbclass      |  4 ++++
>  .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
>  meta/recipes-devtools/rust/rust_1.90.0.bb     | 13 +++++++++++-
>  meta/recipes-kernel/linux/files/rust.cfg      | 20 +++++++++++++++++++
>  meta/recipes-kernel/linux/files/rust.scc      |  1 +
>  meta/recipes-kernel/linux/kernel-devsrc.bb    |  1 +
>  meta/recipes-kernel/linux/linux-yocto.inc     |  7 +++++++
>  meta/recipes-kernel/linux/linux-yocto_6.16.bb |  4 ++++
>  8 files changed, 50 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/rust.scc
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225236):
> https://lists.openembedded.org/g/openembedded-core/message/225236
> Mute This Topic: https://lists.openembedded.org/mt/115908706/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000008db9210641d30346
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 23, 2025 at 7:27=
=E2=80=AFAM Sadineni, Harish via <a href=3D"http://lists.openembedded.org">=
lists.openembedded.org</a> &lt;Harish.Sadineni=3D<a href=3D"mailto:windrive=
r.com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Har=
ish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windriver.com" target=3D=
"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
<br>
This patch series introduces Rust support into the linux-yocto kernel recip=
e<br>
and related build infrastructure in the Yocto Project. The goal is to enabl=
e<br>
building the Linux kernel with Rust components and provide support for<br>
building kernel module which is written in rust inside sdk. <br>
<br>
Summary of changes:<br>
<br>
- Patch 1: Extend &#39;bindgen-cli&#39; to support &#39;nativesdk&#39;, all=
owing it to be available in the SDK environment.<br>
- Patch 2: Add required dependencies (&#39;clang-native&#39;, &#39;bindgen-=
cli-native&#39;) to the kernel to support Rust binding generation.<br>
- Patch 3: Install the Rust standard library source (&#39;library/&#39;) in=
to `work-shared` and which will be later copied to <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0linux-yocto recipe-sysroot-native.=
<br>
- Patch 4: Stage the Rust sources into `recipe-sysroot-native` for kernel b=
uild compatibility, making them visible during native builds.<br>
- Patch 5: Update `kernel-yocto.bbclass` to invoke `make rustavailable` dur=
ing &#39;do_kernel_configme&#39;, ensuring Rust readiness.<br>
- Patch 6: Add kernel configuration support for Rust (via &#39;rust.cfg&#39=
; and &#39;rust.scc&#39;), enabling the Rust build options in kernel config=
.<br>
- patch 7: Copy Rust kernel sources into kernel-devsrc build directory whic=
h will be required while runnig &#39;make prepare&#39; in sdk.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">On my first pass through, things look to be in reasonable =
shape with respect to patch</div><div class=3D"gmail_default" style=3D"font=
-size:small">splitting, and clarity.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">But the number one item is: this cannot be default, it must be =
opt-in and controlled via</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">a distro feature.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">When we get to the point that the kernel cannot be built and functional=
 without rust,</div><div class=3D"gmail_default" style=3D"font-size:small">=
then of course we&#39;ll revisit. But we aren&#39;t to that point now.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Before we inflict the overhea=
d and dependencies of rust and related tools on the kernel,</div><div class=
=3D"gmail_default" style=3D"font-size:small">we have to have binary / prebu=
ilt components available.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Cheers,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></=
div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
WIP - need inputs:<br>
1. In patch-3, rust sources are copied from ${RUSTSRC} to ${TMPDIR}/work-sh=
ared, which is redundant and improving it in<br>
=C2=A0more optimized way by extracting rust directly into ${TMPDIR}/work-sh=
ared and then use it for both rust &amp; linux-yocto recipes.<br>
<br>
2. In patch-6, We&#39;ve suppressed a few build path QA issues with INSANE_=
SKIP.<br>
We have tried fixing those using DEBUG_PREFIX_MAP &amp; --remap-path-prefix=
 but unable to resolve it.<br>
Are there any flags for kernel or any other inputs?<br>
<br>
3. If rust.cfg &amp; rust.scc changes are ok, we will send kernel configura=
tion fragment to yocto-kernel-cache.<br>
<br>
With above considerations, We did a successful build of Enabling rust in li=
nux kernel and <br>
Tested a rust-out-of-tree kernel module in sdk for x86-64 &amp; arm64 archi=
tectures.<br>
<br>
Harish Sadineni (7):<br>
=C2=A0 bindgen-cli: extend BBCLASSEXTEND to include nativesdk<br>
=C2=A0 linux-yocto: add clang-native and bindgen-cli-native to DEPENDS<br>
=C2=A0 rust: install Rust standard library sources for make rustavailable<b=
r>
=C2=A0 =C2=A0 support<br>
=C2=A0 rust: stage rustlib sources for linux-yocto make rustavailable suppo=
rt<br>
=C2=A0 kernel-yocto: add rust support via make rustavailable in<br>
=C2=A0 =C2=A0 do_kernel_configme<br>
=C2=A0 linux-yocto: enable Rust support in kernel configuration<br>
=C2=A0 kernel-devsrc: copying rust-kernel soucre=C2=A0 to $kerneldir/build<=
br>
<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
4 ++++<br>
=C2=A0.../bindgen-cli/<a href=3D"http://bindgen-cli_0.72.1.bb" rel=3D"noref=
errer" target=3D"_blank">bindgen-cli_0.72.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/rust/<a href=3D"http://rust_1.90.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">rust_1.90.0.bb</a>=C2=A0 =C2=A0 =C2=A0| 13 +++=
++++++++-<br>
=C2=A0meta/recipes-kernel/linux/files/rust.cfg=C2=A0 =C2=A0 =C2=A0 | 20 +++=
++++++++++++++++<br>
=C2=A0meta/recipes-kernel/linux/files/rust.scc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 +=
<br>
=C2=A0meta/recipes-kernel/linux/linux-yocto.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
7 +++++++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a> |=C2=A0 4 ++++<br=
>
=C2=A08 files changed, 50 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/rust.cfg<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/rust.scc<br>
<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225236): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225236" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225236</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115908706/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115908706/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000008db9210641d30346--

