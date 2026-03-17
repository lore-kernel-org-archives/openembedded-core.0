Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAC1FB5EAD
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:01:23 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85745.1773777676826735206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k00JtBZX;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-466f1c3c627so4189772b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773777676; cv=none;
        d=google.com; s=arc-20240605;
        b=TTX2sqlJRj3P29SSkYq8/X/Of2aZ6p9x5ernNPAV8LyAiHAFvNa9l/3NVQTx1+e7ZD
         b+DPGgK9r/uSWmHqANBB3eU4+E24Ok54mcDcxpW9+n/do/DSgDsFP2T+6hmTJVU3NNJd
         BiFUhF2oCh0WDICG4DErKd7rvynRqYL2Ki+3GH9ywC7k/4dnl5GJgEB3NU778MoVDv9L
         /XCZGd5Ma35GyPOlYhGYUwbY90ehOZ8qdxx++yULAaKKjjGq70NaaUm/Hrv2Zv1eG2yo
         lrfZcQXNL398YWrhS0DguLiKeWF4hejlxLB9Vk9RoEc03soBAsm+Y3U6zetUN1JSy9Oo
         grAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vtmW6DrnDlebpUNPUDzfZdmKpUTK8bvJYshSpcQSwj4=;
        fh=TMIfwxgAU8BuWOyKrzhPp3htqU9AnG2dhnCwktNY3t8=;
        b=kZIxkjqsHqxU5Do2j5YWunK5BT30Gabtej2cnWUU/FoGWJ7fLon2rFWrr97Te6HzdD
         QNPtsGP4wceX2y/ttqpLkIERp8dqH6VIm0c+VAMPSLR86+EgBm7FxMqpX6mnU7AWL1XE
         Z5QFegPM5NXQc4od5PhpI9UO4r0L8mrBCD2AjYFf+6P8PZW7QSzZbQ2LupiFGL4T6Sdm
         eZxT/0Tpao1xzWsO4TgKaAv+SqpFHXdokkNGcAQIsHI0eD+d2WiVnZn5agj8VsNQfPh3
         aWJPqNWylDhRA2arkFpVr1Xl/F6EzOYXKqzLN8fABzInYz79KY/g1vcNLgCdoh8pI3M4
         FoFg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773777676; x=1774382476; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vtmW6DrnDlebpUNPUDzfZdmKpUTK8bvJYshSpcQSwj4=;
        b=k00JtBZXOv2mzr+GiPtWCDQmuKRvlEeJV1+DsuR72lxhe8sfjs+bggByl+DF2SMQXT
         f3pUWbghaBcip9I7oGyrFkel2pFYMCH2NCgC/Lv8R5utajcLZ21G08WfrzFZ4eqAeTIg
         kxoVnqNFDQLpd+srdJ77u5GVLTsioQa0SJCSxH2CvB0D7Y+eh4tJNkQwnLP2VZ41AlyO
         ghsh6qQKrwTTLbXrGoKeoijEtEikSybJ5rOxKoE+zzli8d1wJD3wZWZeTxobEuZRkWSP
         2r6IAqIka63n7dZpU3Fai0HQJhLsj4nQKIvaTvSmr0kIsooiMRG8rQ4O0rb4LUS25YEQ
         XM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777676; x=1774382476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtmW6DrnDlebpUNPUDzfZdmKpUTK8bvJYshSpcQSwj4=;
        b=E9z7j71rm+4PIy3v9u8YhNCwQahj0VYdly4YnULmDu15TKnR1U76g/DhubvntcwlUU
         VVsmuD6xbwAoGGc8R88hcCRfcWUAXfLd9h0AeSsGlfK2Uqr5r7V3uy7Bx2f/G2EOU0TI
         ouXTos2ROy+TQglgqnB6yIoCu3rieME4BypzMKV2XP6wKEz+DKVvk74vu4tEWo15q0eb
         Ie4ed2I3lTgFOi5L0aQ6SiQxEQOEqbbRkvjJB1v0c3d1fimUDEaSpiyh06drYOMRCUZZ
         8SMqi7FqhZNtIg6wVuDkkzLwmalk5Cr5t2PPIoBnZNphXU/saBpJDhlaQ6P6R4vVMmNp
         GH8g==
X-Gm-Message-State: AOJu0Yx9pdcZZqBpuWwy4c4QsL+SL//hs77hmP26/ruvw5akwbtwVLDh
	uLtfGjXWjRAQG0sCsUkfNCTilFCxWqAgpbOfNPiPyckE/RnHE1EdBbBsBxkrVKjkvuaYfyM1DVj
	QQhMO0cj+xBF4n7Ni76U3CDekeBSaz8M=
X-Gm-Gg: ATEYQzynXHtqrgBTh8gYrZv/jQquHfhpYeFWRZwH0XQ/QAmyPBJ024FVhia9jLDZGlS
	TR0k69YQL6+tngKOrq7hRp1pXI7HcbWPyH8UDuWZjqOJ3YupsUa6w7k3pVcL7jE3pdgfjFSVCbN
	s3Qlov8vkch8BfFHX/2GQcpYEcheiKhc3UBH4Nk19Wu4rBJiKTGsLD+g3vWNBDYQT7xUDKx+tao
	ZjXcNClv+KUabV3xgyTi2NCURfLMjcOmdcR9pIRQMWyj8IQV9ArUmuX86JobbqfEHZgsdg3uh4p
	XAxIIcNv4A==
X-Received: by 2002:a05:6808:c410:b0:467:272e:886 with SMTP id
 5614622812f47-467ba17dfa9mr473342b6e.26.1773777675505; Tue, 17 Mar 2026
 13:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260317180753.488090-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20260317180753.488090-1-Harish.Sadineni@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 17 Mar 2026 20:01:01 +0000
X-Gm-Features: AaiRm50rkyYwNhyc8LVusPWsRXzFk7QKz7XEIeq1fnM6wmGJW-DXvkL-nWIAyIM
Message-ID: <CANPvuRmtjsuAQtpv11A6cqwAow3mjMsErkH9hB3VT=j2KNgpHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto-rust: Move rust kernel
 dependencies to bbclass
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: multipart/alternative; boundary="000000000000425478064d3dcc5c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233334

--000000000000425478064d3dcc5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sadineni, Harish via lists.openembedded.org <Harish.Sadineni=3D
windriver.com@lists.openembedded.org> escreveu (ter=C3=A7a, 17/03/2026 =C3=
=A0(s)
18:08):

> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Move the rust kernel dpendencies from linux-yocto.inc to
> kernel-yocto-rust.bbclass.
>
> This centralizes Rust-specific configuration in the dedicated class,
> which is intended to be inherited only when Rust kernel support is
> enabled (e.g. via KERNEL_FEATURES).
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/classes-recipe/kernel-yocto-rust.bbclass | 2 ++
>  meta/recipes-kernel/linux/linux-yocto.inc     | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass
> b/meta/classes-recipe/kernel-yocto-rust.bbclass
> index 608ccc4609..49f2bfc1ae 100644
> --- a/meta/classes-recipe/kernel-yocto-rust.bbclass
> +++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
> @@ -10,6 +10,8 @@ RUST_DEBUG_REMAP =3D
> "--remap-path-prefix=3D${WORKDIR}=3D${TARGET_DBGSRC_DIR} \
>  KRUSTFLAGS =3D " ${RUST_DEBUG_REMAP}"
>  EXTRA_OEMAKE:append =3D " KRUSTFLAGS=3D'${KRUSTFLAGS}'"
>
> +RUST_KERNEL_DEPENDS ?=3D "clang-native rust-native bindgen-cli-native"
> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>

Any special reason to have this RUST_KERNEL_DEPENDS variable? It is not
used anywhere else.
I wonder if just the DEPENDS could be used directly.

Jose


>  RUST_KERNEL_TASK_DEPENDS ?=3D  "rust-native:do_populate_sysroot
> clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot"
>  do_kernel_configme[depends] +=3D "${RUST_KERNEL_TASK_DEPENDS}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index f47873348a..4e230d405a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -81,8 +81,6 @@ KERNEL_DEBUG ?=3D ""
>  DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerp=
c"
> ], "elfutils-native", "", d)}'
>  DEPENDS +=3D "openssl-native util-linux-native"
>  DEPENDS +=3D "gmp-native libmpc-native"
> -RUST_KERNEL_DEPENDS ?=3D "${@bb.utils.contains('KERNEL_FEATURES', 'rust'=
,
> 'clang-native rust-native bindgen-cli-native', '', d)}"
> -DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>
>  # Some options depend on CONFIG_PAHOLE_VERSION, so need to make
> pahole-native available before do_kernel_configme
>  do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG",
> "True", "pahole-native:do_populate_sysroot", "", d)}'
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233331):
> https://lists.openembedded.org/g/openembedded-core/message/233331
> Mute This Topic: https://lists.openembedded.org/mt/118369300/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000425478064d3dcc5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Sadineni, Haris=
h via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> =
&lt;Harish.Sadineni=3D<a href=3D"mailto:windriver.com@lists.openembedded.or=
g">windriver.com@lists.openembedded.org</a>&gt; escreveu (ter=C3=A7a, 17/03=
/2026 =C3=A0(s) 18:08):<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windriv=
er.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
<br>
Move the rust kernel dpendencies from linux-yocto.inc to<br>
kernel-yocto-rust.bbclass.<br>
<br>
This centralizes Rust-specific configuration in the dedicated class,<br>
which is intended to be inherited only when Rust kernel support is<br>
enabled (e.g. via KERNEL_FEATURES).<br>
<br>
Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windri=
ver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto-rust.bbclass | 2 ++<br>
=C2=A0meta/recipes-kernel/linux/linux-yocto.inc=C2=A0 =C2=A0 =C2=A0| 2 --<b=
r>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-r=
ecipe/kernel-yocto-rust.bbclass<br>
index 608ccc4609..49f2bfc1ae 100644<br>
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass<br>
@@ -10,6 +10,8 @@ RUST_DEBUG_REMAP =3D &quot;--remap-path-prefix=3D${WORKDI=
R}=3D${TARGET_DBGSRC_DIR} \<br>
=C2=A0KRUSTFLAGS =3D &quot; ${RUST_DEBUG_REMAP}&quot;<br>
=C2=A0EXTRA_OEMAKE:append =3D &quot; KRUSTFLAGS=3D&#39;${KRUSTFLAGS}&#39;&q=
uot;<br>
<br>
+RUST_KERNEL_DEPENDS ?=3D &quot;clang-native rust-native bindgen-cli-native=
&quot;<br>
+DEPENDS +=3D &quot;${RUST_KERNEL_DEPENDS}&quot;<br></blockquote><div><br><=
/div><div>Any special reason to have this RUST_KERNEL_DEPENDS variable? It =
is not used anywhere else.</div><div>I wonder if just the DEPENDS=C2=A0coul=
d be used directly.<br><br>Jose</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
=C2=A0RUST_KERNEL_TASK_DEPENDS ?=3D=C2=A0 &quot;rust-native:do_populate_sys=
root clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroo=
t&quot;<br>
=C2=A0do_kernel_configme[depends] +=3D &quot;${RUST_KERNEL_TASK_DEPENDS}&qu=
ot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kerne=
l/linux/linux-yocto.inc<br>
index f47873348a..4e230d405a 100644<br>
--- a/meta/recipes-kernel/linux/linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/linux-yocto.inc<br>
@@ -81,8 +81,6 @@ KERNEL_DEBUG ?=3D &quot;&quot;<br>
=C2=A0DEPENDS +=3D &#39;${@bb.utils.contains_any(&quot;ARCH&quot;, [ &quot;=
x86&quot;, &quot;arm64&quot;, &quot;powerpc&quot; ], &quot;elfutils-native&=
quot;, &quot;&quot;, d)}&#39;<br>
=C2=A0DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
=C2=A0DEPENDS +=3D &quot;gmp-native libmpc-native&quot;<br>
-RUST_KERNEL_DEPENDS ?=3D &quot;${@bb.utils.contains(&#39;KERNEL_FEATURES&#=
39;, &#39;rust&#39;, &#39;clang-native rust-native bindgen-cli-native&#39;,=
 &#39;&#39;, d)}&quot;<br>
-DEPENDS +=3D &quot;${RUST_KERNEL_DEPENDS}&quot;<br>
<br>
=C2=A0# Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahol=
e-native available before do_kernel_configme<br>
=C2=A0do_kernel_configme[depends] +=3D &#39;${@bb.utils.contains(&quot;KERN=
EL_DEBUG&quot;, &quot;True&quot;, &quot;pahole-native:do_populate_sysroot&q=
uot;, &quot;&quot;, d)}&#39;<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233331): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233331" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233331</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118369300/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118369300/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000425478064d3dcc5c--

