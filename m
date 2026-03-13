Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1EE107BCCA
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:07:49 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19473.1773418067223494350
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 09:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JZqAZJ9o;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so1324642a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 09:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773418067; cv=none;
        d=google.com; s=arc-20240605;
        b=OexBDEiX54kBRQXZLRZ+0B2StSF4N2sV/voOYEMgOnt91tVd5uLwyaoE5JeGp6uhYY
         8GXDElM818BaPtmba5T+xc1WdVn4hXmCVUKlfUR3CzZ/kKHw+EeIRb4zRHO7VEn2hNmi
         FI/iulwhdDDCxX+CUdH3C7iTCkEjV2uqNMDs7lI+0umZwMY1rERppL6Kfd7KP1maMykC
         7x8c5XD2nw8K5hG4G+K3aH5LR2RM4NtdMKlzXzV6oRpdMkIKdL1tcYnpCP+x0fe6Xt/g
         FyIdWkjSMOg7d+1OcMN2M7Aax/e3CudDp6u+r4BLTrYNNbeaS3eHO3YQLE4tAZqegHFN
         rJEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h/UOvSMfb8XoBNZ3GP3PMid3v2QdLBsPdur38kCr6ms=;
        fh=GfOSFzMaZokkNKaScpjzfndQyAlBgofnJCiq65JEvNY=;
        b=jpTuTSwMVmeocHde0kkYYQpo9u6fqfFQUSajAWRk+7GsmhP+uDJE6KLoHdyOwZ3l8F
         0rVTZO5yJBioYrrz7qSKsGu8IZ1h7UH8j6CELPL12G7trrqX+XfUGRtZyqqqqN019+Vl
         /6RmDmw0gjsvcJ2jL9rVqkiodBq2VtkJZY5HtEfjZ5qUx8MXvDcqG+1pVhK6qQmVLJmA
         aKeZi51N/fRpxOWEYS17tfBIMrZDPprXW0R9RmPkBvS8hlwQVvS3fUw9l1YyEjHI8l0w
         B6mYz0W2V+I7xwo+0XBPL95j/sVN6ilNPo2mnrIBUfvE7OlLJ5JEWw6t0O1MP/uAFxUm
         3brA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773418067; x=1774022867; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h/UOvSMfb8XoBNZ3GP3PMid3v2QdLBsPdur38kCr6ms=;
        b=JZqAZJ9oAkmI5Y70dpePeZcp55tvl0puBJkDUHvnb1bIPGZCI++4660aqzm0Poo4+q
         jO+s9MoONiDtDCZxiKs2LNZiM49EnBGIKN7hlA+LfPAsbgE9dAosXANtrapB7L1VNU77
         SB1jV4hLJ22WK2BwOQDzsLswwN1U6bycuWvGs4wNTzPuHI0sC2G1lcX8s7ziYHMt8Bqd
         ws/S6wvO3UbJj677KGGULoAgNkz28zZv/AsM7n69wKt+G8gzYBbEc2AQQsyi8wT+8YAj
         HJJBiSkq+8+e3165gIKlpzTBG9O/5KfxhXElAQCkL6yOFefd8SmMZD/emgpZ4IDPBtbN
         r8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418067; x=1774022867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/UOvSMfb8XoBNZ3GP3PMid3v2QdLBsPdur38kCr6ms=;
        b=ss+K65nCBmbOmO+m9pwOAiPGVsV0Ks9CdOmM401APqxdkD7SNOa9b79CEkUq4/ciFm
         MlPgy/pNyzZtkrlLoyDtmMLwAZ4ZKiQMl1Cml9HEKiyUpz+4DJ1wixbsQqxjLaD7SEsX
         H8go/xXHDtpNfIPQ9EyxALnWsX7xJd41OfXnnY7poZsKS9Cv0vHlylGaqTl9bDPMqKRO
         bu17a7OWZbRYVijTNdsIwkn+9iVJI+ePcrn/kCHOWN4A3oL5WWYhRMUfyh75RqcW1wmd
         EB+9LZ9pjlNL/OLvVJNwmpd7vIMtjVJYjzKPKFjuKBHTCDm+BVmJMNUSwr0ycK7uUpRd
         YK8g==
X-Gm-Message-State: AOJu0Yx+GWPGLNYPi1DozCHFp2hvuv9KxrefdP29oeitQ2qerG9oY9vQ
	hYyWyWVW8+oOUiZAt4mI9O6pBvAEngkpVP+vv3O07iSzemP70PFQQSP+DQcPURoblWB61uRKW3k
	7wcZbzuRuF3Fxz9TJ+W+tLZYa4Eg+q9k=
X-Gm-Gg: ATEYQzwqt4tGjIlV8RbFYpMw1uy6YuE1fAprzgyvlrE5ty0s0qSiJhxshKVWqlYo1Wg
	olM7DxUvjzKWXxYZI+3NEvkQes9fCXMINXAntuNybrtpZCeUAg9uhHZS9QxoDzdmOVT9Awteo2U
	lbey45ZhSw5IM7rs1wAl5SDxYVcxq3BFHxi/khiqgQoUS/RVSxWUhvfqVlYBIbgo5eQGo7A2328
	sgdIRJ2wsr8qJmobQJ41lnkXN+dT7WDcCSNCtU0Px8uKI7uSLrJFDamOXGaywdv3e+Z8XYRrf1A
	XwTFqBFtxStrjhJ9UIbCy6/5gVpcv/5ARcht85B/
X-Received: by 2002:a17:90b:134d:b0:359:8e5e:43de with SMTP id
 98e67ed59e1d1-35a21fed329mr3210755a91.22.1773418066425; Fri, 13 Mar 2026
 09:07:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com> <20260313155920.2347101-2-Harish.Sadineni@windriver.com>
In-Reply-To: <20260313155920.2347101-2-Harish.Sadineni@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 13 Mar 2026 12:07:35 -0400
X-Gm-Features: AaiRm53kspFCMPG7qWBVT6JCaeVY169naSjT9OSgMJVzFDJnHnPWGysvylfr2rI
Message-ID: <CADkTA4OGm6YE833uwbBoSNwemTguqtAb1_frqBvHuSkLHNujuA@mail.gmail.com>
Subject: Re: [PATCH v9 01/14] kernel-yocto: Enable rust in kernel
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr, 
	richard.purdie@linuxfoundation.org
Content-Type: multipart/alternative; boundary="000000000000e339e3064cea11ab"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233063

--000000000000e339e3064cea11ab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 11:59=E2=80=AFAM <Harish.Sadineni@windriver.com> wr=
ote:

> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Allow enabling Rust support in the kernel by simply adding "rust" to
> KERNEL_FEATURES in local.conf or a global configuration file. This maps t=
he
> feature name to the appropriate kernel configuration fragment located
> at features/kernel-rust/kernel-rust.scc
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index e53bf15194..a77f2214c2 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -269,6 +269,9 @@ do_kernel_metadata() {
>         KERNEL_FEATURES_FINAL=3D""
>         if [ -n "${KERNEL_FEATURES}" ]; then
>                 for feature in ${KERNEL_FEATURES}; do
> +                       if [ "$feature" =3D "rust" ]; then
> +
>  feature=3D"features/kernel-rust/kernel-rust.scc"
> +                       fi
>

I'll factor this out to a dedicated routine that expands shorthand to the
fragments to take into account some additional considerations, but this
is good for now.

Bruce



>                         feature_as_specified=3D"$feature"
>                         feature=3D"$(echo $feature_as_specified | cut -d:
> -f1)"
>                         feature_specifier=3D"$(echo $feature_as_specified=
 |
> cut -d: -f2)"
> --
> 2.49.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e339e3064cea11ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 13, 2026 at 11:59=
=E2=80=AFAM &lt;<a href=3D"mailto:Harish.Sadineni@windriver.com">Harish.Sad=
ineni@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadin=
eni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<=
br>
<br>
Allow enabling Rust support in the kernel by simply adding &quot;rust&quot;=
 to<br>
KERNEL_FEATURES in local.conf or a global configuration file. This maps the=
<br>
feature name to the appropriate kernel configuration fragment located<br>
at features/kernel-rust/kernel-rust.scc<br>
<br>
Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windri=
ver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index e53bf15194..a77f2214c2 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -269,6 +269,9 @@ do_kernel_metadata() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNEL_FEATURES_FINAL=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${KERNEL_FEATURES}&quot; ]; then<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for feature in ${KE=
RNEL_FEATURES}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ &quot;$feature&quot; =3D &quot;rust&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0feature=3D&quot;features/kernel-rust/=
kernel-rust.scc&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi<br></blockquote><div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">I&#39;ll factor this out to a dedicated routin=
e that expands shorthand to the</div><div class=3D"gmail_default" style=3D"=
font-size:small">fragments to take into account some additional considerati=
ons, but this</div><div class=3D"gmail_default" style=3D"font-size:small">i=
s good for now.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 feature_as_specified=3D&quot;$feature&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 feature=3D&quot;$(echo $feature_as_specified | cut -d: -f1)&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 feature_specifier=3D&quot;$(echo $feature_as_specified | cut -d:=
 -f2)&quot;<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000e339e3064cea11ab--

