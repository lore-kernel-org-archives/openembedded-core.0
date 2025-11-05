Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0B1CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:30:56 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9437.1762349451125992040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KMpxtu+t;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-294df925292so61902175ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 05:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762349450; x=1762954250; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cFx7pfU3/s1Udh+wU/E10KNVKkJnd0GUBC8UG7H3z0Q=;
        b=KMpxtu+tRxGBXJVu44E8kgvEM6L6G9NN4E5OAhFWfH2lWZoIPyPM4UeWldUthoVZmw
         sSdvaQdtAE2LizBRa47YFMiNRZDH1EfMb/taKEZfIuoD4medW8uX1LBIB7Fl5sEmtcok
         kvQ6wkz/b0J1JaulnnDRG+LIUXyz+z/8MNuCmaqsUFT0yiI6j8la+Fk9XslYktBpquxc
         XAuQ8Kvl8dtjlHeJHCT7ObLtUP5toLO0UdGPtR+pAKT3wg3jxqIGayHXxlsKwhZDIijt
         K9/2042gyVqk2FpJ3g3B7jLK5E8Y6DOHnVFZbVJUy1u/UwlHgarGYVl3OIrg/nMZ7z2v
         +IzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762349450; x=1762954250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFx7pfU3/s1Udh+wU/E10KNVKkJnd0GUBC8UG7H3z0Q=;
        b=aHkhr31WAGM70jNhfVTH9joOoyI257PbRKbBLp0MZ3NgcXoRSnPXDg6iFr4XRLzJuz
         AQnl3fW9afxRfTArCdlGYL6mx6qtls/YH5Qg7azOW/gzZFoX6XUEGVLbhO0kyS9H9rDD
         I6lfIJ+VqAepA5vd/jJE+cjJGLjCd81aw+LrkhIrp8X588rIG3H4m0pdL3uDcYhVxIyC
         ovbj3Vwf77kiEfM7hYFyTormB3F0XwkD4npBEc8ZKoL0bbw7r+WSsZ4wQRuN92l5zEyf
         /ih8O3DEKn9jd1WsqfKMvFKIHtat4jhHdTpT63ZbSV2ybMa3rf3s6rJysvoJY8aXgmAC
         CaoA==
X-Gm-Message-State: AOJu0YyBgjRq/1IQ42ZCglwX1paq6WDVhsvIexA9WVc0higisFnu068Y
	MybDh5CZ+KXv8b6yeV32GxLa0b6zwhLzxVVgGsHfcVCVFJMb5yWlf8kJLfae6E/Jrrj+YD3/+R2
	EA6y7G8RGabdpgnNrkVtXbRdCsnLH/cY=
X-Gm-Gg: ASbGnct2fGhk3PCTQgzUdK/eCpBPsmo4m2WS9nfXEdm4DX4XoClriFo+VDFAct/ZgWX
	qN5+ARJO8eC2ylxJJHEQxi9xhYgFBtsu8uW3r7CAycnDAvoc2oYqPEfqooHntdBLeqFH/YMq23N
	Pl61OMq6pWdVV3e3gsnAeKUryltPrfUQ53zk+oB8MBRc3mgwaR9LTBslt6Tgwgy/HB6++nopsCu
	kQ4YTkp6o0KYfIfArRPkItMHG3kHAj+hwMd021cCYYQ7q2kTRB2sZUK1O9Uxg==
X-Google-Smtp-Source: AGHT+IFE+fDIYpOC1R/Rz2OL0hChugODzoOfxflLRivZtAfUeOBDKzduI89koLmsqX4a3nkXBx8wQTo8qpCYDtc7SLA=
X-Received: by 2002:a17:903:ac3:b0:271:479d:3dcb with SMTP id
 d9443c01a7336-2962ad07055mr41975445ad.6.1762349450504; Wed, 05 Nov 2025
 05:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com> <20251105130942.833204-3-Harish.Sadineni@windriver.com>
In-Reply-To: <20251105130942.833204-3-Harish.Sadineni@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Nov 2025 08:30:38 -0500
X-Gm-Features: AWmQ_bmyo_XxJU2oS-DB9nPO2AYKBNIXS5Rp5bYaz_3oUfy7O71c98qATCy9C2g
Message-ID: <CADkTA4MnXVqGaXJ3u-aFghcByOn4rcoL=rtReBpNKZ6brKBp7Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/8] linux-yocto: add clang-native,rust-native and
 bindgen-cli-native to DEPENDS
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Content-Type: multipart/alternative; boundary="000000000000f7ad290642d8f4df"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:30:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225769

--000000000000f7ad290642d8f4df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm reviewing both series that have come out for rust in the kernel.

I'll leave it up to the submitters to figure out if there are differences
between
the two series that need to be consolidated.

On Wed, Nov 5, 2025 at 8:10=E2=80=AFAM <Harish.Sadineni@windriver.com> wrot=
e:

> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Add `clang-native`, `rust-native'  and `bindgen-cli-native` to `DEPENDS`
> to support
> Rust-based kernel modules or features that require generating Rust FFI
> bindings using
> bindgen during the kernel build process
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 4d0a726bb6..e2ffd96b59 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -81,6 +81,7 @@ KERNEL_DEBUG ?=3D ""
>  DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerp=
c"
> ], "elfutils-native", "", d)}'
>  DEPENDS +=3D "openssl-native util-linux-native"
>  DEPENDS +=3D "gmp-native libmpc-native"
> +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel',
> 'clang-native rust-native bindgen-cli-native', '', d)}"
>

I'd suggest that those dependencies should be in a variable, assigned with
?=3D and then use the
variable in the DEPENDS line. That makes it easier to adjust from
bbappends, etc.

Bruce




>
>  # Some options depend on CONFIG_PAHOLE_VERSION, so need to make
> pahole-native available before do_kernel_configme
>  do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG",
> "True", "pahole-native:do_populate_sysroot", "", d)}'
> --
> 2.49.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000f7ad290642d8f4df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">I&#39;m reviewing both series that have come out for rust in =
the kernel.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll leav=
e=C2=A0it up to the submitters to figure out if there are differences betwe=
en</div><div class=3D"gmail_default" style=3D"font-size:small">the two seri=
es that need to be consolidated.</div></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 5, =
2025 at 8:10=E2=80=AFAM &lt;<a href=3D"mailto:Harish.Sadineni@windriver.com=
">Harish.Sadineni@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Harish Sadineni &lt;<a href=3D"mailt=
o:Harish.Sadineni@windriver.com" target=3D"_blank">Harish.Sadineni@windrive=
r.com</a>&gt;<br>
<br>
Add `clang-native`, `rust-native&#39;=C2=A0 and `bindgen-cli-native` to `DE=
PENDS` to support<br>
Rust-based kernel modules or features that require generating Rust FFI bind=
ings using<br>
bindgen during the kernel build process<br>
<br>
Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windri=
ver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/linux-yocto.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kerne=
l/linux/linux-yocto.inc<br>
index 4d0a726bb6..e2ffd96b59 100644<br>
--- a/meta/recipes-kernel/linux/linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/linux-yocto.inc<br>
@@ -81,6 +81,7 @@ KERNEL_DEBUG ?=3D &quot;&quot;<br>
=C2=A0DEPENDS +=3D &#39;${@bb.utils.contains_any(&quot;ARCH&quot;, [ &quot;=
x86&quot;, &quot;arm64&quot;, &quot;powerpc&quot; ], &quot;elfutils-native&=
quot;, &quot;&quot;, d)}&#39;<br>
=C2=A0DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
=C2=A0DEPENDS +=3D &quot;gmp-native libmpc-native&quot;<br>
+DEPENDS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ru=
st-kernel&#39;, &#39;clang-native rust-native bindgen-cli-native&#39;, &#39=
;&#39;, d)}&quot;<br></blockquote><div><br></div><div><div class=3D"gmail_d=
efault" style=3D"font-size:small">I&#39;d suggest that those dependencies s=
hould be in a variable, assigned with ?=3D and then use the</div><div class=
=3D"gmail_default" style=3D"font-size:small">variable in the DEPENDS line. =
That makes it easier to adjust from bbappends, etc.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Bruce</div><br></div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0# Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahol=
e-native available before do_kernel_configme<br>
=C2=A0do_kernel_configme[depends] +=3D &#39;${@bb.utils.contains(&quot;KERN=
EL_DEBUG&quot;, &quot;True&quot;, &quot;pahole-native:do_populate_sysroot&q=
uot;, &quot;&quot;, d)}&#39;<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000f7ad290642d8f4df--

