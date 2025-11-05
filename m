Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A484BCCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:34:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9418.1762349659769230487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Izat65c8;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-295f937d4c3so15860635ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 05:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762349659; x=1762954459; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nR18QXm2lOLWQyn5rr7LCkDer6wGuhlPgMuGekypJBw=;
        b=Izat65c8zPqnIgWp4nATMMsl9o3rDuSfnosxmR4d8EMvQDh1nE6yjvOEy/v+95q4rY
         TzAoi1FkUaepDpdl5isrRzv5JoXX+GffMjJXCDXVWDciJD0rktg6deweCBzgnWqGp8Fg
         X3fSLbPGcnLFE1iorTOrHBMhtyV2KgonGVbf98EPV15xB8kKk0j+PN4Dgb7UQP8K1+gH
         +JBElXzT1wpxlEVqT/0pwq0EEqb7uhfl7izQUO0gXmY70wFST3E4eYXGBQPW2pGwRcq3
         +UlTXxzBiIz2ZWv1MlkRU8EG7AzMQNTj/C6E0+7OvEU2wYi0v3+R+DiVQoi2mR+4HtTs
         8x8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762349659; x=1762954459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nR18QXm2lOLWQyn5rr7LCkDer6wGuhlPgMuGekypJBw=;
        b=OrQ8Tyh6Guv9I9T5XvKcAnF4AtFvQ4xDXMqvX1h765JeJutOSdakwPX3fMiD3/Hvdx
         TsJI9F+wvPdz5FUcR9ARqmsNM7n++sTULxEqbpA3tu8zUZjCt/7+7eF1BiETG8+0QZkI
         DIy8CNbT0zkRgR8su6xq32BKSdFBChwLvXX+ScBj6DcwMV4ooSgWfsK0qFHx9KwByEzS
         w4FkK3bu3L/jFcLvBSiY57SAojDtCz2BDG/KFWOOXbzsb92vvV5P6INRdSQGc5zsWCjY
         KdEoIjNrom9DTh4DB25x82CASBAswtx2IYX1bhohkiV2Nw9W0gTnQ1r+09oy3nID5tJ8
         o8KQ==
X-Gm-Message-State: AOJu0YwRALGQseg9Hu/8ZMEYqV7YtsvyzYjmqFkE3IwPOHq+xGmYDrIZ
	8KBHjYWS4faO4LAACRfXZqxMWQLhH1V8tT8YYdNj5EchwvJRPsKgUHkYsjDxA8VAMMAbcMr8Hr8
	Lj0caHxtrFZPPThEqavLbkV+4L/96Wi8=
X-Gm-Gg: ASbGncvCSgOyQAdB+2QGAysWC5eBK2DnHhFN0iadzMIP3q2xSDcspoolyzccNGALIRm
	7FX8qBy2/YZ4b1APTay6xlUO+DYycNxQy+vyUCsXIRka35ZHC+X9o9hhoII6yi1syyrg4mqEUxQ
	OZTGFjDiS3V6E7JvQRxr5xS2QMLNZ3SLxxzQQAxDD+wr3J+IowBqJ0TLvW5WrGAzAMl9yWxd7dN
	9WxjHKfoBaDBN5p+280qHm2OwqCLlvKsPQ4jh7CJB1iV/99c88cSlOTAqJgjw==
X-Google-Smtp-Source: AGHT+IEh1uxrp9A2ALDVg8WvfZewOmXHi/n2EwN1QZnIPqqecfdZxNFTcDEv31/5KvM9ktiS3XnKvtTrjIl9dqGvn3M=
X-Received: by 2002:a17:902:f64c:b0:295:4d50:aab8 with SMTP id
 d9443c01a7336-2962ad314a8mr45047265ad.24.1762349659046; Wed, 05 Nov 2025
 05:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com> <20251105130942.833204-6-Harish.Sadineni@windriver.com>
In-Reply-To: <20251105130942.833204-6-Harish.Sadineni@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Nov 2025 08:34:07 -0500
X-Gm-Features: AWmQ_bkK9TCRY1QBcnUafBQ7CNaz_7H813VcmzLgg97QEda7I4zNkEcwTKFTbkE
Message-ID: <CADkTA4PVhQnj6-bMrua7Tyqr8=ZZtM8=MX0aNJEeMfonYNA+nA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/8] kernel-yocto: add rust support via make
 rustavailable in do_kernel_configme
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Content-Type: multipart/alternative; boundary="00000000000065c6d90642d90114"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225771

--00000000000065c6d90642d90114
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 8:10=E2=80=AFAM <Harish.Sadineni@windriver.com> wrot=
e:

> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> To enable Rust integration in the Linux kernel build, this patch:
>
> - Adds `rust-native`, `clang-native` and `bindgen-cli-native` to
> `do_kernel_configme[depends]`
>   to ensure required tools are available for Rust support.
> - Invokes `make rustavailable` inside `do_kernel_configme()` to prepare
>   the kernel for building Rust-based modules or core components.
>
> The `make rustavailable` target requires the Rust standard library source=
s
> to be
> present under `${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust`, which is
> handled
> in the `rust` recipe via shared staging.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index e53bf15194..7a115bdffd 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -463,6 +463,10 @@ do_kernel_configme[depends] +=3D
> "virtual/cross-binutils:do_populate_sysroot"
>  do_kernel_configme[depends] +=3D "virtual/cross-cc:do_populate_sysroot"
>  do_kernel_configme[depends] +=3D "bc-native:do_populate_sysroot
> bison-native:do_populate_sysroot"
>  do_kernel_configme[depends] +=3D "kern-tools-native:do_populate_sysroot"
> +do_kernel_configme[depends] +=3D "${@bb.utils.contains('DISTRO_FEATURES'=
,
> 'rust-kernel', \
> +                                'rust-native:do_populate_sysroot \
> +                                 clang-native:do_populate_sysroot \
> +                                 bindgen-cli-native:do_populate_sysroot'=
,
> '', d)}"
>
for consistency (with the other rust changes), these could be assigned to a
variable first (?=3D) and then assigned. That allows them to be tweaked mor=
e
easily while the support is being developed.

Bruce



>  do_kernel_configme[dirs] +=3D "${S} ${B}"
>  do_kernel_configme() {
>         do_kernel_metadata config
> @@ -507,6 +511,11 @@ do_kernel_configme() {
>                 echo "CONFIG_LOCALVERSION=3D"\"${LINUX_VERSION_EXTENSION}=
\"
> >> ${B}/.config
>         fi
>  }
> +do_kernel_configme:append() {
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true',
> 'false', d)}; then
> +        oe_runmake -C ${S} O=3D${B} rustavailable
> +    fi
> +}
>
>  addtask kernel_configme before do_configure after do_patch
>  addtask config_analysis
> --
> 2.49.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000065c6d90642d90114
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
To enable Rust integration in the Linux kernel build, this patch:<br>
<br>
- Adds `rust-native`, `clang-native` and `bindgen-cli-native` to `do_kernel=
_configme[depends]`<br>
=C2=A0 to ensure required tools are available for Rust support.<br>
- Invokes `make rustavailable` inside `do_kernel_configme()` to prepare<br>
=C2=A0 the kernel for building Rust-based modules or core components.<br>
<br>
The `make rustavailable` target requires the Rust standard library sources =
to be<br>
present under `${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust`, which is ha=
ndled<br>
in the `rust` recipe via shared staging.<br>
<br>
Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windri=
ver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index e53bf15194..7a115bdffd 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -463,6 +463,10 @@ do_kernel_configme[depends] +=3D &quot;virtual/cross-b=
inutils:do_populate_sysroot&quot;<br>
=C2=A0do_kernel_configme[depends] +=3D &quot;virtual/cross-cc:do_populate_s=
ysroot&quot;<br>
=C2=A0do_kernel_configme[depends] +=3D &quot;bc-native:do_populate_sysroot =
bison-native:do_populate_sysroot&quot;<br>
=C2=A0do_kernel_configme[depends] +=3D &quot;kern-tools-native:do_populate_=
sysroot&quot;<br>
+do_kernel_configme[depends] +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FE=
ATURES&#39;, &#39;rust-kernel&#39;, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;rust-native:do_populate_sysroot=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clang-native:do_populate_sysro=
ot \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bindgen-cli-native:do_populate=
_sysroot&#39;, &#39;&#39;, d)}&quot;<br></blockquote><div><div class=3D"gma=
il_default" style=3D"font-size:small"></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">for consistency (with the other rust changes), thes=
e could be assigned to a</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">variable first (?=3D) and then assigned. That allows them to be t=
weaked more</div><div class=3D"gmail_default" style=3D"font-size:small">eas=
ily while the support is being developed.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
=C2=A0do_kernel_configme[dirs] +=3D &quot;${S} ${B}&quot;<br>
=C2=A0do_kernel_configme() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_kernel_metadata config<br>
@@ -507,6 +511,11 @@ do_kernel_configme() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;CONFIG_L=
OCALVERSION=3D&quot;\&quot;${LINUX_VERSION_EXTENSION}\&quot; &gt;&gt; ${B}/=
.config<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
+do_kernel_configme:append() {<br>
+=C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;rust=
-kernel&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C ${S} O=3D${B} rustavailable<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
<br>
=C2=A0addtask kernel_configme before do_configure after do_patch<br>
=C2=A0addtask config_analysis<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000065c6d90642d90114--

