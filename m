Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4C8CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:27:06 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9358.1762349221087590448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=leknuHwD;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a9fb6fccabso3193518b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 05:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762349220; x=1762954020; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JkGvp9iS42TrKuvstxYaDpizt8sHgNWfS0gAKhQn0E0=;
        b=leknuHwD6jL7Td9hVc943Zlh64zP/m6bcZX3q8dr1tSnWJpVJRV26ksiOVp8xvYRer
         BZ8ySUxY42eoc/fr9dbxRx4eRhafrgiRPA4WxA9zZ/YYrbiYsug/yFaQj1HVAjI0WUpZ
         Dl8zzmnBSHbwthDMNU5UBl2Jj2GSLO4G487J8D/jY1LJgDQ2WiTctg8eQcwpkdjDXocs
         mECyjDwVsIFiGPp8Wfqbnq/Jsug5mS8P0qoXJKvKyH95fAn4fWEwe+bDQQUcPU40dE7i
         3GKg2hXXWfQrbVqskqkqkj46SYaqSP2l+6xvZMbuXLD1jSRNyvDeXnZx2FBDRlFq+3Ws
         eoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762349220; x=1762954020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkGvp9iS42TrKuvstxYaDpizt8sHgNWfS0gAKhQn0E0=;
        b=LhTjEYzePqgOHyUBjZEhYzqBliPt1Kd0Nqa2LpoVUJnEk51Z3K+nNe/zrr9eFNgVJm
         imN3Cl9Fl0MNuxiUn06tHr5QedVqXcXHZ+1+8LKEEyTrmAgMkLo4x8QC7PL5Ala08D/X
         sRF/ycZttfRUEwjTbfkzgcXuG+t6m9W4QEoU0xWUwcKXdYP+siZNspf2C4KwrOPxe0OO
         Sv7a7xUkG8bRmrGe7c+tx7MjapkGi2onfaViePoPVO1GQAJKppmYI0N7OLlpK8yMmJgf
         17l7UteePcUzbVJ4k8lQBhgRFCQtQNL3RazoTLIC2uQ0MiAelHtfSPDjBN761uiYsXp4
         Y0vQ==
X-Gm-Message-State: AOJu0YwidbN0GMvPbH9lmVSFnOQph7wEQhigU3ETvViGLW8KwZCTZEJB
	ediGKbnlaSbfzmb4UPQ+O4thgil1n0IR+4oyNTob7OsGO8rPF1yYGzX9iAC+Ve/4bMAhzo7JyBj
	t2Xo7E0Bqm7DQZO2TqGsBi6iy0/sSgn0=
X-Gm-Gg: ASbGncuYmhLGvyyMs+0UWCJ26R2tR7r4yhRJFzQV8BTWxU2Na3BH7eVMotnMYbKOS6y
	BCWkNK3O9/7vRCforiUiV3AGvlx8fharBtspVA8MOJ14eni/7r7QH499QSouyvAq3EzayBW7rIl
	OGVVuNnUQIBoyaRVuMFNfQMMzi+cuohuwBx0+Vqh0p+t44HMk5I+BSGaJViV2jAr9Uv9gMmvrFx
	Gm5K0NUz99oRtKLOZBcGfoc8GsLQTQnzVPNN5N9gyAKFfoUiAmKRabC8xAbQQ==
X-Google-Smtp-Source: AGHT+IH7TDZ0OxTvxjlXb9aWG3s9xI0vVORTooMKBzVhae7Mxa1Cqkbr4t2wyYf9Y5jOxgOuB8R9jaoI9NfIF3QPIww=
X-Received: by 2002:a05:6a20:548d:b0:34e:e0ba:7b1 with SMTP id
 adf61e73a8af0-34f837edad8mr4460944637.3.1762349220325; Wed, 05 Nov 2025
 05:27:00 -0800 (PST)
MIME-Version: 1.0
References: <20251104171611.2227798-1-elmehdi.younes@smile.fr> <20251104171611.2227798-5-elmehdi.younes@smile.fr>
In-Reply-To: <20251104171611.2227798-5-elmehdi.younes@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Nov 2025 08:26:48 -0500
X-Gm-Features: AWmQ_bkqGMUKkQjZ5xj2I2TZDwtcGNan1m1nJ99Kiw9uQCQgT1vI8VFnxxP1gmw
Message-ID: <CADkTA4M7L=K0Vwjqsi=P2xQ0J_BY3vxb6er0RGjbj+xMt8Oxjg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 4/4] linux-yocto-dev: Add temporary Rust
 kernel feature
To: elmehdi.younes@smile.fr
Cc: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Content-Type: multipart/alternative; boundary="0000000000003f6c040642d8e785"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225768

--0000000000003f6c040642d8e785
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 12:16=E2=80=AFPM El Mehdi YOUNES via lists.openembed=
ded.org
<elmehdi.younes=3Dsmile.fr@lists.openembedded.org> wrote:

> This commit introduces the 'rust.scc' and 'rust.cfg' files, adding
> them to the 'SRC_URI' of the 'linux-yocto-dev'.
>
> Ideally, these kernel feature files belong in the separate
> 'yocto-kernel-cache' repository.
>
> However, for the purpose of this RFC series,they are being added directly
> to 'meta/recipes-kernel/linux/files/' to allow the entire feature set to
> be tested and reviewed in a single repository.
>
>
Indeed, it isn't ideally, it is "must".

There's no reason to hold off sending the fragments to the linux-yocto
list though.



> Once this approach is discussed and approved, these files will be
> removed and submitted as a separate patch to the 'yocto-kernel-cache'
> project.
>
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> ---
>  meta/recipes-kernel/linux/files/rust.cfg     | 6 ++++++
>  meta/recipes-kernel/linux/files/rust.scc     | 2 ++
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 ++
>  3 files changed, 10 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/rust.scc
>
> diff --git a/meta/recipes-kernel/linux/files/rust.cfg
> b/meta/recipes-kernel/linux/files/rust.cfg
> new file mode 100644
> index 0000000000..dc31c9efbc
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/rust.cfg
> @@ -0,0 +1,6 @@
> +CONFIG_RUST=3Dy
> +# --- RFC TEST ONLY - REMOVE FOR FINAL PATCH ---
> +# Enabled samples to validate the Rust build.
> +# Users should enable these via their own config fragments.
> +CONFIG_SAMPLES_RUST=3Dy
> +CONFIG_SAMPLE_RUST_MINIMAL=3Dm
>

Just split these into two fragments, even here, and definitely for the
linux-yocto send.

Bruce



> diff --git a/meta/recipes-kernel/linux/files/rust.scc
> b/meta/recipes-kernel/linux/files/rust.scc
> new file mode 100644
> index 0000000000..8b81971be2
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/rust.scc
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: MIT
> +kconf non-hardware rust.cfg
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index fb4e0864d2..a1c9940219 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -59,3 +59,5 @@ KERNEL_FEATURES:append =3D "
> ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " fe
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES",
> "ptest", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"
>
>  KERNEL_VERSION_SANITY_SKIP =3D "1"
> +
> +SRC_URI +=3D "file://rust.scc"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225740):
> https://lists.openembedded.org/g/openembedded-core/message/225740
> Mute This Topic: https://lists.openembedded.org/mt/116120519/1050810
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

--0000000000003f6c040642d8e785
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 4, 2025 at 12:16=
=E2=80=AFPM El Mehdi YOUNES via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;elmehdi.younes=3D<a href=3D"mailto:smile.fr@l=
ists.openembedded.org">smile.fr@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">This commit introduce=
s the &#39;rust.scc&#39; and &#39;rust.cfg&#39; files, adding<br>
them to the &#39;SRC_URI&#39; of the &#39;linux-yocto-dev&#39;.<br>
<br>
Ideally, these kernel feature files belong in the separate<br>
&#39;yocto-kernel-cache&#39; repository.<br>
<br>
However, for the purpose of this RFC series,they are being added directly<b=
r>
to &#39;meta/recipes-kernel/linux/files/&#39; to allow the entire feature s=
et to<br>
be tested and reviewed in a single repository.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Indeed, it isn&#39;t ideally, it is &quot;must&quot;.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">There&#39;s no reason to hold=
 off sending the fragments to the linux-yocto</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">list though.</div><br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Once this approach is discussed and approved, these files will be<br>
removed and submitted as a separate patch to the &#39;yocto-kernel-cache&#3=
9;<br>
project.<br>
<br>
Signed-off-by: El Mehdi YOUNES &lt;<a href=3D"mailto:elmehdi.younes@smile.f=
r" target=3D"_blank">elmehdi.younes@smile.fr</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/files/rust.cfg=C2=A0 =C2=A0 =C2=A0| 6 +++++=
+<br>
=C2=A0meta/recipes-kernel/linux/files/rust.scc=C2=A0 =C2=A0 =C2=A0| 2 ++<br=
>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a> | 2 ++<br>
=C2=A03 files changed, 10 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/rust.cfg<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/rust.scc<br>
<br>
diff --git a/meta/recipes-kernel/linux/files/rust.cfg b/meta/recipes-kernel=
/linux/files/rust.cfg<br>
new file mode 100644<br>
index 0000000000..dc31c9efbc<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/rust.cfg<br>
@@ -0,0 +1,6 @@<br>
+CONFIG_RUST=3Dy<br>
+# --- RFC TEST ONLY - REMOVE FOR FINAL PATCH ---<br>
+# Enabled samples to validate the Rust build.<br>
+# Users should enable these via their own config fragments.<br>
+CONFIG_SAMPLES_RUST=3Dy<br>
+CONFIG_SAMPLE_RUST_MINIMAL=3Dm<br></blockquote><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Just split these into two f=
ragments, even here, and definitely for the</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">linux-yocto send.</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
diff --git a/meta/recipes-kernel/linux/files/rust.scc b/meta/recipes-kernel=
/linux/files/rust.scc<br>
new file mode 100644<br>
index 0000000000..8b81971be2<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/rust.scc<br>
@@ -0,0 +1,2 @@<br>
+# SPDX-License-Identifier: MIT<br>
+kconf non-hardware rust.cfg<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto-dev.bb</a><br>
index fb4e0864d2..a1c9940219 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-dev.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a><br>
@@ -59,3 +59,5 @@ KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&q=
uot;DISTRO_FEATURES&quot;, &quot;ptest&quot;, &quot; fe<br>
=C2=A0KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_F=
EATURES&quot;, &quot;ptest&quot;, &quot; features/gpio/mockup.scc features/=
gpio/sim.scc&quot;, &quot;&quot;, d)}&quot;<br>
<br>
=C2=A0KERNEL_VERSION_SANITY_SKIP =3D &quot;1&quot;<br>
+<br>
+SRC_URI +=3D &quot;file://rust.scc&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225740): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225740" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225740</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116120519/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116120519/1050810</a><br>
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

--0000000000003f6c040642d8e785--

