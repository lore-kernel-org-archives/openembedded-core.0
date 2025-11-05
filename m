Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2BFCCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:24:36 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9237.1762349067739336517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q5Qf8U43;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-28a5b8b12a1so72050925ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 05:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762349067; x=1762953867; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gRoDIbjQMBCfg3E8bgGcvE5n1BsKMWxhkmznv22bSTk=;
        b=Q5Qf8U43Ud9uluX9NJ25IF8zhVnKR+OqyEKzp+EaBXESFss/TpAKLFyWdR2f+m3NIk
         BkwKucjT2rt26wl7KMlMWy3erFp8I/9Umag42aSJg2rxvBtrm8X/84mGnZwnZZm5bvKK
         vA0n54j1xRTINrXiJT00DNp+acrpwhPPYuqKUEsM3x/N0LwSRyYTGwzH4BKkVaFBxAWy
         5Dxv0Y57rt/R43F1l3Wt73yyIJeBEebgprWZfm1im2PFlVgeyKXNhGwlYtVPuF56esVj
         QAhWdppxLc4AiT7tU+BNEji4D/uf8sLTUEkhe3Okmb/yCmyyt/Klbf5EBmaeN2Rgd062
         KoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762349067; x=1762953867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gRoDIbjQMBCfg3E8bgGcvE5n1BsKMWxhkmznv22bSTk=;
        b=eZWSrtcX2I21kjzJHZCJTTnIiz64V9AiCJBVwX+wIFZBj2BPq6anvObJd/6vpbpA7V
         SIgbT2HUFhDKs5i+MCVBLdaY0vUSVn393icJkCfBPkUUaEF1MG9JTujLdARwvLxwZopJ
         tLiAOTa9Hjx8OlZwyBcot+9Vr22+PAHWGKWq459eaH82CUPOz2RBFaRr5Zxd5VIxXYaG
         cLHo3AY9H9W2BSrrKEd7Yve5AjmbXKoUs1/tw3YMVDyr25kyeeB3qjdgPHNJitWoseZe
         e3PgPq3UYW+LhQOGAMa4EW1zfRmkOAb41HR1b+4oa0St4BdXIUSo+15GuhZAj2rWsUSn
         Berw==
X-Gm-Message-State: AOJu0YwrKgXRcN83Dc+Q7xOlxeUPNlz2mnXjdSvkU3KqpyVXC058B7Qb
	G6uNSfu7MwP/I8W2DdKzKMWNRPHg89YOMBZc38qAmaCfLjiHFji+p+fcdqCOMBOnTLu1ly7Cz+L
	7xrvVqs43QlbRScDl9HiQ2NdeFds5Vy/pnRQF
X-Gm-Gg: ASbGncsn/YvrI66tnvVMaVU4z0IWnB0udKm1XevXtrqWxbdOi2JLE3BvuwZMdcXHMPB
	hL2eQcEgfiUN+JrRr52yuXpIC7uDuayTrqdlTb6lL6Oyy4k6wmiAznytW8h1AuA2mQNVXd8L0AE
	i+A4svYYgTlRyoecNoFBaqs4f4qHzpDXig3gtWi7R/u4VEVlb3duB1/asrSVMfHPfXT6+h3avBp
	nS9Cn70oV2sUBkjD9pTrIPYXhCXcHLkUr+bxbrlKYQ1jy+Qk+tvELRS6cRsHg==
X-Google-Smtp-Source: AGHT+IF/FAl/iAxN/NBLwCZKUotyEdadUrLBUiEqFzie7Cu2Hoy2HZD87mj7k5PTv6NTtX8Pl982YbT8OquJx6pfzVc=
X-Received: by 2002:a17:902:c40e:b0:27e:f018:d2fb with SMTP id
 d9443c01a7336-2962ad06a46mr46753935ad.6.1762349066961; Wed, 05 Nov 2025
 05:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20251104171611.2227798-1-elmehdi.younes@smile.fr> <20251104171611.2227798-3-elmehdi.younes@smile.fr>
In-Reply-To: <20251104171611.2227798-3-elmehdi.younes@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Nov 2025 08:24:14 -0500
X-Gm-Features: AWmQ_bkWWYdCzwkok87pVd77Xu0nFOrmsHP9rs8cl75bjoDHvgsFmhRsWVn869U
Message-ID: <CADkTA4M5jnK6feZejXmi1sydX4z-Cb4c560DiWOPKTXkXtvz-g@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/4] linux-yocto.inc: Conditionally add
 rust.scc kernel feature
To: elmehdi.younes@smile.fr
Cc: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Content-Type: multipart/alternative; boundary="0000000000001b473d0642d8de97"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225767

--0000000000001b473d0642d8de97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 12:16=E2=80=AFPM El Mehdi YOUNES via lists.openembed=
ded.org
<elmehdi.younes=3Dsmile.fr@lists.openembedded.org> wrote:

> This adds the mechanism to enable the Rust for Linux kernel feature
> via a DISTRO_FEATURE.
>
> When 'rust-kernel' is present in DISTRO_FEATURES, the 'rust.scc'
> kernel feature is appended to the KERNEL_FEATURES list.
>
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 4d0a726bb6..40e5bf214b 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -95,3 +95,7 @@ do_devshell:prepend() {
>      d.setVarFlag("PKG_CONFIG_SYSROOT_DIR", "unexport", "1")
>      d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PATH
> PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
>  }
> +
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> 'rust-kernel', ' rust.scc', '', d)}"
> +# TODO: Kernel rust code compilation breaks under ccache, disable it for
> now
> +CCACHE_DISABLE =3D "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel=
',
> '1', '', d)}"
>

Make this a ?=3D assignment as well. Since once this is set someone needs t=
o
hack around
it if they are working on debugging ccache + rust in the kernel.

Bruce



>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225738):
> https://lists.openembedded.org/g/openembedded-core/message/225738
> Mute This Topic: https://lists.openembedded.org/mt/116120517/1050810
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

--0000000000001b473d0642d8de97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 4, 2025 at 12:16=
=E2=80=AFPM El Mehdi YOUNES via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;elmehdi.younes=3D<a href=3D"mailto:smile.fr@l=
ists.openembedded.org">smile.fr@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">This adds the mechani=
sm to enable the Rust for Linux kernel feature<br>
via a DISTRO_FEATURE.<br>
<br>
When &#39;rust-kernel&#39; is present in DISTRO_FEATURES, the &#39;rust.scc=
&#39;<br>
kernel feature is appended to the KERNEL_FEATURES list.<br>
<br>
Signed-off-by: El Mehdi YOUNES &lt;<a href=3D"mailto:elmehdi.younes@smile.f=
r" target=3D"_blank">elmehdi.younes@smile.fr</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kerne=
l/linux/linux-yocto.inc<br>
index 4d0a726bb6..40e5bf214b 100644<br>
--- a/meta/recipes-kernel/linux/linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/linux-yocto.inc<br>
@@ -95,3 +95,7 @@ do_devshell:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0d.setVarFlag(&quot;PKG_CONFIG_SYSROOT_DIR&quot;, &quot;=
unexport&quot;, &quot;1&quot;)<br>
=C2=A0 =C2=A0 =C2=A0d.appendVar(&quot;OE_TERMINAL_EXPORTS&quot;, &quot; PKG=
_CONFIG_DIR PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR&quot;)=
<br>
=C2=A0}<br>
+<br>
+KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;rust-kernel&#39;, &#39; rust.scc&#39;, &#39;&#39;, d)}&quot;<b=
r>
+# TODO: Kernel rust code compilation breaks under ccache, disable it for n=
ow<br>
+CCACHE_DISABLE =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &=
#39;rust-kernel&#39;, &#39;1&#39;, &#39;&#39;, d)}&quot;<br></blockquote><d=
iv><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Ma=
ke this a ?=3D assignment as well. Since once this is set someone needs to =
hack around</div><div class=3D"gmail_default" style=3D"font-size:small">it =
if they are working on debugging ccache=C2=A0+ rust in the kernel.</div><di=
v class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D=
"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225738): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225738" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225738</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116120517/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116120517/1050810</a><br>
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

--0000000000001b473d0642d8de97--

