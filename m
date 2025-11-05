Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BBDCCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:35:06 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9439.1762349706020236271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y1OfZeLR;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-295247a814bso75425855ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 05:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762349705; x=1762954505; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pfqAxDroWIY/Mba3iTxEfTQFiO+qL6LkpM23PHmqjtI=;
        b=Y1OfZeLRDpRV2PuYWvAsgGeyz2OYvCnDhXLlQvyPwpiLVpeYWvc+VTc5ukUuPWpMFy
         0jkPBAjZKnBZejL3a5yS/C8WqYWt9EW0V/PYAf8z063onWmYmb801rVZFJkuzwjcYJ/c
         alKFdZbE0RGgXUCTiTfu++6WOWgFJ1YCFdOjwPKINMBXg2dx7v3iXVw5k3281Z5rZGMW
         QB/NQLM+tdgRBvSicucYytbjCuy89tKM7dtR2LKRHNCoBBR6FaaSFDbm9SCqETlkuTqO
         IwrdKIOj1ddZl12l78WQLs89rj/XCngWXABEKhhO9ihIQi3jZZbbHiUBdBEzldGD52gb
         ZB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762349705; x=1762954505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfqAxDroWIY/Mba3iTxEfTQFiO+qL6LkpM23PHmqjtI=;
        b=fuDZgyiIjmXR+ReOQAXf8mnek33y8DTD6yed+8t/yYv7+c+p0VC7MOyP4ybL5NFUOL
         YWC7hXbmRnyg8FJidzf5xSr4IhwENj1yyfTMAfdWlozcJKqT/grIPa9Eobfeh1TVUNPi
         iG+oFw+zyfZvT6gtL658ODs26TtouEWOQUhZwvDRyX/HBhpXgbdRhw6ozSZTYGr1gSiO
         JOUnt8e+vO5fFyitbmF/WqJ2MBAN9hXqYa2u4eDmDBpzFOcZytUNUtaeQ7RWbZ5nHc9g
         y6Zy8+mlRI421XgqDk0NZTEYsQklKiU0OFrYhuF1gDM9WUFpQDZMUJAMvtAWtBkPExHh
         zBlA==
X-Gm-Message-State: AOJu0YwhQ8+K9wTnmus3bOhawJdqbiMHQkgyiBUbzviHcIeeel21w5J2
	bk2j+VDVvAZ/A9ulRZs55gO63d2woaqB93PnSPx7uP2kuGmN6K00wmDIYRFCQlPrYMBK/NoDj0y
	w/x57XCYgQCLmbGs9syWJ5rkWQLpo0yg=
X-Gm-Gg: ASbGncuXzAzV1pdybtYQpVIusPBp6ELeYYdq96YRyyKWuMOy09hG3vpC3LaYyhdn5+9
	axiGlBJEeK9bJr7VZrZUUIJhoqOq+yQiKWO9zIenR/9ebNLFex9m5kpO1pXt38bMGRiCjuSHLev
	Kr3woqXCoY6FEzMjnu9yq7piqUpvp0NHON5IhZceVy2ZlE49nGNbC3ofGAwsKwpWAcaIFRMWuFH
	30+AGdCbKzg2ii7kW4JRGd2jPQfHqgDX1lfA3ELSYuykQFjz/02H7prdSuG/w==
X-Google-Smtp-Source: AGHT+IF5JBGXkFq9odCcUk1CcO7jaz/iTp09BpU4FAPygvFnabqC8WiWvIXhHoemdus2AshgCG+gTIdBTm509CD92Fs=
X-Received: by 2002:a17:902:d511:b0:295:5b68:996a with SMTP id
 d9443c01a7336-2962ad835c9mr48402805ad.12.1762349705297; Wed, 05 Nov 2025
 05:35:05 -0800 (PST)
MIME-Version: 1.0
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com> <20251105130942.833204-7-Harish.Sadineni@windriver.com>
In-Reply-To: <20251105130942.833204-7-Harish.Sadineni@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Nov 2025 08:34:53 -0500
X-Gm-Features: AWmQ_bnIw17aQxsRNtybm2GMSsAuEfZSSuZb3Qus9rciBZhwuZTyUD_svwuc6Jk
Message-ID: <CADkTA4P-J8=m9LxB2Cqg-deQFyVdy-2Y11SegOpUsMVeFuAr=Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 6/8] linux-yocto: enable Rust support in kernel configuration
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Content-Type: multipart/alternative; boundary="00000000000027861b0642d904b2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225772

--00000000000027861b0642d904b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 8:10=E2=80=AFAM <Harish.Sadineni@windriver.com> wrot=
e:

> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Add initial support for building the Linux kernel with Rust enabled:
>
> - Introduce `rust.cfg` to set Rust-related kernel config options,
> including:
>   - `CONFIG_RUST`, `CONFIG_HAVE_RUST`, and `CONFIG_RUST_IS_AVAILABLE`
>   - Rust sample modules and developer checks (overflow/debug assertions)
>   - Disable BTF and module versioning for compatibility
>
> - Add `rust.scc` to include `rust.cfg` via `kconf` in the kernel feature
> stack
>
> - Update `linux-yocto_${PV}.bb` to:
>   - Append `rust.scc` to `SRC_URI` and `KERNEL_FEATURES`
>
> when sending non-RFC version, we will send kernel-config-fragment to the
> yocto-kenrel-cache
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-kernel/linux/files/rust.cfg      | 9 +++++++++
>  meta/recipes-kernel/linux/files/rust.scc      | 1 +
>  meta/recipes-kernel/linux/linux-yocto_6.16.bb | 3 +++
>  3 files changed, 13 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/rust.scc
>
> diff --git a/meta/recipes-kernel/linux/files/rust.cfg
> b/meta/recipes-kernel/linux/files/rust.cfg
> new file mode 100644
> index 0000000000..a884f3cf6b
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/rust.cfg
> @@ -0,0 +1,9 @@
> +CONFIG_RUST=3Dy
> +CONFIG_SAMPLES_RUST=3Dy
> +CONFIG_SAMPLE_RUST_MINIMAL=3Dm
> +CONFIG_SAMPLE_RUST_PRINT=3Dy
> +CONFIG_SAMPLE_RUST_HOSTPROGS=3Dy
> +CONFIG_RUST_DEBUG_ASSERTIONS=3Dy
> +CONFIG_RUST_OVERFLOW_CHECKS=3Dy
> +CONFIG_RUST_BUILD_ASSERT_ALLOW=3Dy
>

The debug, samples and core support should be in separate fragments.

Bruce



> +
> diff --git a/meta/recipes-kernel/linux/files/rust.scc
> b/meta/recipes-kernel/linux/files/rust.scc
> new file mode 100644
> index 0000000000..4686d9ce5e
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/files/rust.scc
> @@ -0,0 +1 @@
> +kconf hardware rust.cfg
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> index 2188c7fed2..33bd8a92c3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> @@ -77,3 +77,6 @@ KERNEL_FEATURES:append:powerpc64le =3D "
> arch/powerpc/powerpc-debug.scc"
>  # Check again during next major version upgrade
>  KERNEL_FEATURES:remove:riscv32 =3D "features/debug/debug-kernel.scc"
>  INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
> +SRC_URI +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '
> file://rust.scc', '', d)}"
> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES",
> "RUST", "rust.scc", "", d)}"
> +
> --
> 2.49.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000027861b0642d904b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 5, 2025 at 8:10=
=E2=80=AFAM &lt;<a href=3D"mailto:Harish.Sadineni@windriver.com">Harish.Sad=
ineni@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadin=
eni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<=
br>
<br>
Add initial support for building the Linux kernel with Rust enabled:<br>
<br>
- Introduce `rust.cfg` to set Rust-related kernel config options, including=
:<br>
=C2=A0 - `CONFIG_RUST`, `CONFIG_HAVE_RUST`, and `CONFIG_RUST_IS_AVAILABLE`<=
br>
=C2=A0 - Rust sample modules and developer checks (overflow/debug assertion=
s)<br>
=C2=A0 - Disable BTF and module versioning for compatibility<br>
<br>
- Add `rust.scc` to include `rust.cfg` via `kconf` in the kernel feature st=
ack<br>
<br>
- Update `linux-yocto_${PV}.bb` to:<br>
=C2=A0 - Append `rust.scc` to `SRC_URI` and `KERNEL_FEATURES`<br>
<br>
when sending non-RFC version, we will send kernel-config-fragment to the yo=
cto-kenrel-cache<br>
<br>
Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windri=
ver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/files/rust.cfg=C2=A0 =C2=A0 =C2=A0 | 9 ++++=
+++++<br>
=C2=A0meta/recipes-kernel/linux/files/rust.scc=C2=A0 =C2=A0 =C2=A0 | 1 +<br=
>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a> | 3 +++<br>
=C2=A03 files changed, 13 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/rust.cfg<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/files/rust.scc<br>
<br>
diff --git a/meta/recipes-kernel/linux/files/rust.cfg b/meta/recipes-kernel=
/linux/files/rust.cfg<br>
new file mode 100644<br>
index 0000000000..a884f3cf6b<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/rust.cfg<br>
@@ -0,0 +1,9 @@<br>
+CONFIG_RUST=3Dy<br>
+CONFIG_SAMPLES_RUST=3Dy<br>
+CONFIG_SAMPLE_RUST_MINIMAL=3Dm<br>
+CONFIG_SAMPLE_RUST_PRINT=3Dy<br>
+CONFIG_SAMPLE_RUST_HOSTPROGS=3Dy<br>
+CONFIG_RUST_DEBUG_ASSERTIONS=3Dy<br>
+CONFIG_RUST_OVERFLOW_CHECKS=3Dy<br>
+CONFIG_RUST_BUILD_ASSERT_ALLOW=3Dy<br></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">The debug, samples and =
core support should be in separate fragments.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
+<br>
diff --git a/meta/recipes-kernel/linux/files/rust.scc b/meta/recipes-kernel=
/linux/files/rust.scc<br>
new file mode 100644<br>
index 0000000000..4686d9ce5e<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/files/rust.scc<br>
@@ -0,0 +1 @@<br>
+kconf hardware rust.cfg<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_6.16.bb</a><br>
index 2188c7fed2..33bd8a92c3 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a><br>
@@ -77,3 +77,6 @@ KERNEL_FEATURES:append:powerpc64le =3D &quot; arch/powerp=
c/powerpc-debug.scc&quot;<br>
=C2=A0# Check again during next major version upgrade<br>
=C2=A0KERNEL_FEATURES:remove:riscv32 =3D &quot;features/debug/debug-kernel.=
scc&quot;<br>
=C2=A0INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D &quot;textrel&quot;<br>
+SRC_URI +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ru=
st-kernel&#39;, &#39; file://rust.scc&#39;, &#39;&#39;, d)}&quot;<br>
+KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&quot;DISTRO_FEATUR=
ES&quot;, &quot;RUST&quot;, &quot;rust.scc&quot;, &quot;&quot;, d)}&quot;<b=
r>
+<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000027861b0642d904b2--

