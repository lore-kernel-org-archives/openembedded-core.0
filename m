Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED7610AB827
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 20:40:24 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57903.1774557617048850173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 13:40:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Fepd4ZQs;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ad019bbd4so1953935d50.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 13:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774557616; cv=none;
        d=google.com; s=arc-20240605;
        b=cT1BPJ06wUcbqh/c8byiJLvGTUXeTdvYNCtGmfV466qnkihKyf27PtNb01bdyXli3V
         EJnPJjg5PHe6FlA+ujWa1u2In0ubntk/XUA7/mLUMmjlGiA24K77k4bKp15hIeOVmp+8
         v/KvDCEDrFTsmlojnA1IzvCr+B2pnKqFkAOKey4pVgNPW/lk7xZ7KEVUT5sgTGyyFRQE
         0FgQLnjHM92UvROIeAFRDvnzgj6M2ONhuuQh97Th6Cr2CbyZohGyzgnpX3JuPDf2p6Wz
         LHbZsEwRM6TqTdPb99W7xBxRutanIKnWUMhTDjHW3E9GlbUuuzoErysa3+QX2ctQPSTQ
         AJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9TFuXIkLLIy1wTpSyXTIYEMbRbkUWptOdjf8485G0+M=;
        fh=6h9GRuXllXdFokTp7epOWW+I2MRjpqgPzAjSJag/vaU=;
        b=jc2Q+sziX/QP84+toRH3OsFYvkeAL19vS4fF4sInxroBpTJXyzvd/YUqSlPc3lfWs+
         BFEUAfL5EkzWheEss0PoraHZ6dJUYrWv6REkGQhf8JHXyD+CEiXF2HBWjlzpw3meesl+
         Wwu/QLOUpGvsX+ZphsStdJHi5wQGWDfPYnpKNi65oP3TbaTQogq40vmcWYXybyoulVv/
         nRkmjn+e4lhh8a3C9azLm6P4H9Tgp9mlHDSQ7TUNQItRAtQ/+zx2cAjpNuY3599iqQhF
         Cd4cdO4MG5uTlA6zf6eIBQXV8/U1ztcvUezQEi3lTbW7qyvxkCS6NXHw7BmKBnztiUR0
         3EoQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774557616; x=1775162416; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9TFuXIkLLIy1wTpSyXTIYEMbRbkUWptOdjf8485G0+M=;
        b=Fepd4ZQsJuC2TvOC1c4IGlYX/TsveqXnXRhIZv00UGRSZXsNk/SJL0WY+WIwwEjTOv
         e9hC8gAyGcEIv65zu3TTUh4VX58H6Xiq3ivukoCr4oZoZMQb737vYvXy7PWzRRhDD2u5
         C4pJmnSU7ln0OzAOGOwsC3W4UPAckv080zqwRTjuGmHW+OSqlW3AUvykAXHKgmXqGn47
         oco+HyMvJswZzCO3WWICGCqP2ybGHERZfPGb4RHMVOGVerEQ3kwXTkLvA3lu8mL9932J
         dd/PNvV6sqZyfb/JvM1bQp+B9v16epN8fndqfd3ZLICX9lXaD49hz14PVecSBSZnQIJV
         HRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774557616; x=1775162416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TFuXIkLLIy1wTpSyXTIYEMbRbkUWptOdjf8485G0+M=;
        b=aWU9t6E2B63FL0O8vuguKFas6h3VF2PyYOFXUBYQIXVlbwkzQGzRSNfbY9zLvtVEsQ
         0JkWonxaNIFKe+W78nvk8Rw0+1Jvl0PyjR/DvSNBymzL2F3Hegdi3Drszu20/1lpxdVM
         yB5OObiU1mm79dFAP46mKhLsSgBcQEAZM8iWJlTNw1TnIQhMlov0uQqyvjM2T+jjsaut
         snjDaJpLnhmXQ+IF4mF3F4ZfdVddfZj7cRtIra1uo9D8qGsM/+yc61igx033sqbysgHw
         IWkHKa7YaByvxvq08jO5l9WpCyoKU8pIAixbZh4/1NncLR1wj9mJzXRmwNM5NDHv+/30
         L7/w==
X-Gm-Message-State: AOJu0YzWbgBDDMtEWrfRaEGfnAXPLo5xQKNYnqCQDITExoec3QQau0Z6
	WGP1o4cM25BwyRMpCJbcYfPsxPPRBiIan5xlIPUwEwzlHLrTiWup6ATTD62B4mep/BfD9kj3Zbk
	3m06pbm+aLRMCDURhkmSyuZlaGB5HO0djcKi+bTg=
X-Gm-Gg: ATEYQzxIUYQZz3ffYnB0kOdl6bCPk/hUEwWjMb4f9bzo9L7CzvcBH5Kf7oHHQUL/aWS
	FK6cuaFCtsbJyJT1XiknomoccY1+/s8MCrgzCZ033E+6BbN082bCkLnfi2MHYAfErA9eDTNeuTg
	fURl4H4iWwTEmO2acGEfP7ltoWrJar8Y0q/5Dx2JIH0XBC3Ag5soL1g8264KjJ6zoH1z1Jgh55a
	OwJUNdGLq1B/kW6udmywE+DF1o5MXjIVGtXo1+T37U7WwDvNCrtTMToOF06NVMx1ntKVlOPkO3u
	12IA6A4dQ6lv/Le0MyQ/29X1tltIGq2O22NteffX+XUIcf2QEGVRx2upStGyNqwfFkd116vmvlm
	hEb5vxUb/51f5nWZRyxKZbyRi
X-Received: by 2002:a05:690c:e3c1:b0:79b:d2ea:8311 with SMTP id
 00721157ae682-79bd2ea8c30mr29275747b3.1.1774557616002; Thu, 26 Mar 2026
 13:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com> <DHCZ1JWF0Z8D.20KQY5K4UV33I@bootlin.com>
In-Reply-To: <DHCZ1JWF0Z8D.20KQY5K4UV33I@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Mar 2026 13:40:04 -0700
X-Gm-Features: AQROBzBkVjVw9fBFHRkEkM3y65q5lvYbRiLlG-PyUfSXegPaQe5wUxBIxudmkgM
Message-ID: <CAMKF1so=dDohkSb3kvFxub2=3A1wMCSDi7pRwBzjfbBE931rqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/7] clang/llvm: Upgrade to 22.x major release
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000055de14064df364fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 20:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234052

--00000000000055de14064df364fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026, 12:47=E2=80=AFPM Mathieu Dubois-Briand <
mathieu.dubois-briand@bootlin.com> wrote:

> On Thu Mar 26, 2026 at 4:16 PM CET, Khem Raj via lists.openembedded.org
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
> > ---
>
> Hi Khem,
>
> Thanks for the new version.
>
> I have to ask you: I'm having issues to apply this patch, and I already
> had issues with the previous one. Are you aware of this?
>
> Applying: clang/llvm: Upgrade to 22.x major release
> error: patch failed:
> meta/recipes-devtools/clang/clang/0001-Install-lldb-tblgen.patch:1
> error: meta/recipes-devtools/clang/clang/0001-Install-lldb-tblgen.patch:
> patch does not apply
> error: patch failed:
> meta/recipes-devtools/clang/clang/0001-clang-Support-building-native-tool=
s-when-cross-compi.patch:1
> error:
> meta/recipes-devtools/clang/clang/0001-clang-Support-building-native-tool=
s-when-cross-compi.patch:
> patch does not apply
> error: patch failed:
> meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-w=
hen-LIBCXXABI_LIBU.patch:18
> error:
> meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers-w=
hen-LIBCXXABI_LIBU.patch:
> patch does not apply
> error: patch failed:
> meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compila=
tion.-Don-t-use-na.patch:21
> error:
> meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compila=
tion.-Don-t-use-na.patch:
> patch does not apply
> error: patch failed:
> meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and=
-libdir-path.patch:19
> error:
> meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-and=
-libdir-path.patch:
> patch does not apply
> ...
>
> I had to hand apply part of the previous series. For this one I used:
> git cherry-pick -s contrib/yoe/mut~7..contrib/yoe/mut
> I believe this should be correct.
>
>
> Yes that is right. Sometimes large patches tend to be hard on mailing
> lists. If we need a v4 I will push them to a dedicated branch
>

Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>

--00000000000055de14064df364fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 26, 2026, 12:47=E2=
=80=AFPM Mathieu Dubois-Briand &lt;<a href=3D"mailto:mathieu.dubois-briand@=
bootlin.com">mathieu.dubois-briand@bootlin.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Thu Mar 26, 2026 at 4:16 P=
M CET, Khem Raj via <a href=3D"http://lists.openembedded.org" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_bl=
ank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Includes support for new Intel (Wildcat Lake, Nova Lake with APX and A=
VX10.2)<br>
&gt; Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features perfor=
mance<br>
&gt; optimizations for AMD Zen 4 and Zen 5 architectures.<br>
&gt;<br>
&gt; Integrated Distributed ThinLTO is more mature, with enhancements<br>
&gt; like cache support for incremental builds and robust handling of tempo=
rary artifacts.<br>
&gt;<br>
&gt; LLDB added first-class WebAssembly debugging support, including breakp=
oints and variable inspection.<br>
&gt;<br>
&gt; Support for Google Native Client (NaCl) is dropped in this release.<br=
>
&gt;<br>
&gt; Detailed ChangeLog [1]<br>
&gt;<br>
&gt; [1] <a href=3D"https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://releases.llvm.org=
/22.1.0/docs/ReleaseNotes.html</a><br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
<br>
Hi Khem,<br>
<br>
Thanks for the new version.<br>
<br>
I have to ask you: I&#39;m having issues to apply this patch, and I already=
<br>
had issues with the previous one. Are you aware of this?<br>
<br>
Applying: clang/llvm: Upgrade to 22.x major release<br>
error: patch failed: meta/recipes-devtools/clang/clang/0001-Install-lldb-tb=
lgen.patch:1<br>
error: meta/recipes-devtools/clang/clang/0001-Install-lldb-tblgen.patch: pa=
tch does not apply<br>
error: patch failed: meta/recipes-devtools/clang/clang/0001-clang-Support-b=
uilding-native-tools-when-cross-compi.patch:1<br>
error: meta/recipes-devtools/clang/clang/0001-clang-Support-building-native=
-tools-when-cross-compi.patch: patch does not apply<br>
error: patch failed: meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-=
libunwind-headers-when-LIBCXXABI_LIBU.patch:18<br>
error: meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-head=
ers-when-LIBCXXABI_LIBU.patch: patch does not apply<br>
error: patch failed: meta/recipes-devtools/clang/clang/0003-compiler-rt-Sim=
plify-cross-compilation.-Don-t-use-na.patch:21<br>
error: meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-co=
mpilation.-Don-t-use-na.patch: patch does not apply<br>
error: patch failed: meta/recipes-devtools/clang/clang/0005-llvm-allow-env-=
override-of-exe-and-libdir-path.patch:19<br>
error: meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-ex=
e-and-libdir-path.patch: patch does not apply<br>
...<br>
<br>
I had to hand apply part of the previous series. For this one I used:<br>
git cherry-pick -s contrib/yoe/mut~7..contrib/yoe/mut<br>
I believe this should be correct.<br>
<br><br>Yes that is right. Sometimes large patches tend to be hard on maili=
ng lists. If we need a v4 I will push them to a dedicated branch=C2=A0<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div =
class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
<br>
</blockquote></div></div></div>

--00000000000055de14064df364fa--

